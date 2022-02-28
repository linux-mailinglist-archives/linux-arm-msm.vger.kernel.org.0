Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2017E4C7DEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 23:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbiB1W7d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 17:59:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbiB1W7b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 17:59:31 -0500
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB10DA41B2;
        Mon, 28 Feb 2022 14:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646088947;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=6QtiDtoRb+0unR4ATY8ygChkhFlrPo5rBKJ8ZschNIs=;
    b=p5DfGdrYhWDRnNfYEDTPR3zctNZ76/M3aAAAsYbcTjXvo1vB+qWuQEeTHvSls2DZ9Z
    aYEhSY6Z38UtvrEGm0YNGvsdvgg0i78obnvQ5LCCOKS5/wWzpOa4lL/rjo1zgE5UC8Y3
    qBJNMqYbGHlfdKJEOCN64HodvKezN0zwcabTOiGMr9bBOBzucMsHlHzJAG3YvoWALE9m
    9sf93jUbDI0Xu4uqrHROZlL0jnph+g8lW0bBy133qhRg1/ErpSgtbt+1UhpcIpANZh5Y
    wZ03NRAk8V/mttcT9wSjR1LcoZch7AdmeaVhxIACcMfJe2b067+fziyE82R6UE4Ox/Ms
    l9+Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fyL/oVo="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.40.1 AUTH)
    with ESMTPSA id kdc58dy1SMtlWqF
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 28 Feb 2022 23:55:47 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, phone-devel@vger.kernel.org,
        Aleksander Morgado <aleksander@aleksander.es>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 1/2] remoteproc: qcom_q6v5_mss: Create platform device for BAM-DMUX
Date:   Mon, 28 Feb 2022 23:53:59 +0100
Message-Id: <20220228225400.146555-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220228225400.146555-1-stephan@gerhold.net>
References: <20220228225400.146555-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The modem remoteproc on older Qualcomm SoCs (e.g. MSM8916 and MSM8974)
implements the BAM-DMUX protocol to allow access to the network data
channels of the modem. The hardware/firmware resources required to
implement the BAM-DMUX driver are described in an extra node in the
device tree (with the compatible "qcom,bam-dmux").

This node logically belongs below the modem remoteproc, so that both
control interfaces (rpmsg_wwan_ctrl) and network interfaces (bam_dmux)
have a common parent.

Unlike other child devices of the modem remoteproc, the bam-dmux device
currently does not follow the state of the remoteproc (i.e. it is not
added/removed when the remoteproc is started/stopped). However, this is
an implementation detail of the bam_dmux driver in Linux that might
change in the future.

To be flexible for future changes, create a standard platform device
specifically only for "qcom,bam-dmux", rather than populating all child
nodes. This is also more consistent with the way the other child nodes
are handled in the driver.

Note: of_platform_device_create() and of_node_put() have NULL-checks
internally, so there is no need to check if the "qcom,bam-dmux" node
actually exists in the device tree.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2:
  - Avoid using of_platform_populate() and create platform device 
    specifically only for "qcom,bam-dmux".
---
 drivers/remoteproc/qcom_q6v5_mss.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index a2c231a17b2b..b2e57981de2c 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -218,6 +218,7 @@ struct q6v5 {
 	struct qcom_rproc_subdev smd_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
+	struct platform_device *bam_dmux;
 	bool need_mem_protection;
 	bool has_alt_reset;
 	bool has_mba_logs;
@@ -1847,6 +1848,7 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 static int q6v5_probe(struct platform_device *pdev)
 {
 	const struct rproc_hexagon_res *desc;
+	struct device_node *node;
 	struct q6v5 *qproc;
 	struct rproc *rproc;
 	const char *mba_image;
@@ -1990,6 +1992,10 @@ static int q6v5_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_sysmon_subdev;
 
+	node = of_get_compatible_child(pdev->dev.of_node, "qcom,bam-dmux");
+	qproc->bam_dmux = of_platform_device_create(node, NULL, &pdev->dev);
+	of_node_put(node);
+
 	return 0;
 
 remove_sysmon_subdev:
@@ -2011,6 +2017,8 @@ static int q6v5_remove(struct platform_device *pdev)
 	struct q6v5 *qproc = platform_get_drvdata(pdev);
 	struct rproc *rproc = qproc->rproc;
 
+	if (qproc->bam_dmux)
+		of_platform_device_destroy(&qproc->bam_dmux->dev, NULL);
 	rproc_del(rproc);
 
 	qcom_q6v5_deinit(&qproc->q6v5);
-- 
2.35.1

