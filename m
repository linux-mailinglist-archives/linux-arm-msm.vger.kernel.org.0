Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D7146168D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Nov 2021 14:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239252AbhK2NiJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Nov 2021 08:38:09 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:31927 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241484AbhK2NgJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Nov 2021 08:36:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638192764;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=BJbqAOoiVzE8W/rs6+2WMhGn2r03LKsQtUNHaA4itz8=;
    b=LTPh+umCU7cDZfZEXfCPuCU46RP6A1fZJdPtKy+eFC/J0Dy+iwQ7E71wsXeKQR1Eex
    MTNcjRRfzYT5lFyzL3bXGZJWAz5SgJAGlH0Zf8fq87M/MwjbulviN4M6zSqayOwsnyow
    BpyymfEsp73VPQK/mGynT2JvXAP8gnZCXYlteUH+2+OVpw+ZlUlAf4h8LuBKC5d8GK0g
    LifhVtb/zms0JfuT/girJvzQC3A1zvz42oYcZryPENMLrGRPEXMSzCh4Y0m3Ojknj8Rj
    Lm/A5htmx4NzEokxQn+kwkrUUNGIRfISIntoc+ayDAI+0OvFiZE5H90h1KalD42zjOJR
    EsqQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL2YvqQ"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.34.10 AUTH)
    with ESMTPSA id j03bcbxATDWiPUu
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 29 Nov 2021 14:32:44 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, phone-devel@vger.kernel.org,
        Aleksander Morgado <aleksander@aleksander.es>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 1/2] remoteproc: qcom_q6v5_mss: Populate additional devices from DT
Date:   Mon, 29 Nov 2021 14:29:29 +0100
Message-Id: <20211129132930.6901-2-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211129132930.6901-1-stephan@gerhold.net>
References: <20211129132930.6901-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some devices without own memory resources could be placed anywhere in the
device tree but they logically belong to the modem remote processor. Make
it possible to probe them when defined under the mpss device tree node
by calling of_platform_populate().

This can be used for BAM-DMUX for example, which provides the WWAN network
interfaces on some older Qualcomm SoCs such as MSM8916 or MSM8974.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 43ea8455546c..69f3d1ebf1f1 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1989,8 +1989,14 @@ static int q6v5_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_sysmon_subdev;
 
+	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+	if (ret)
+		goto remove_rproc;
+
 	return 0;
 
+remove_rproc:
+	rproc_del(rproc);
 remove_sysmon_subdev:
 	qcom_remove_sysmon_subdev(qproc->sysmon);
 remove_subdevs:
@@ -2010,6 +2016,7 @@ static int q6v5_remove(struct platform_device *pdev)
 	struct q6v5 *qproc = platform_get_drvdata(pdev);
 	struct rproc *rproc = qproc->rproc;
 
+	of_platform_depopulate(&pdev->dev);
 	rproc_del(rproc);
 
 	qcom_q6v5_deinit(&qproc->q6v5);
-- 
2.34.1

