Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 229CA598EC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Aug 2022 23:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346253AbiHRVGE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Aug 2022 17:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346527AbiHRVFd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Aug 2022 17:05:33 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C8FD9EB8
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Aug 2022 14:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=oBixX6DhLq6qbxZVRh5Aw8QChfE
        liTGt7nnigM7rJzc=; b=jAdlDciI2r4fAthfVP+1dGH/5FHgkTiHenkOmqQF/qr
        mHRU0z+fozIWCibbTa9kEfOzKNLt6ZZOxR2R9DfjAJmxHnVuP2aXGEgkVdJx2D2A
        iUvGyD5wLi4bepyHyUruOzS4OjgwN2Ydisa0pH6BBPkqY/ME+pZQRiL6eTmkWxJk
        =
Received: (qmail 3961216 invoked from network); 18 Aug 2022 23:00:59 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Aug 2022 23:00:59 +0200
X-UD-Smtp-Session: l3s3148p1@TpNJR4rmVZUucref
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH] remoteproc: move from strlcpy with unused retval to strscpy
Date:   Thu, 18 Aug 2022 23:00:59 +0200
Message-Id: <20220818210059.7253-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Follow the advice of the below link and prefer 'strscpy' in this
subsystem. Conversion is 1:1 because the return value is not used.
Generated by a coccinelle script.

Link: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/remoteproc/qcom_sysmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index 57dde2a69b9d..032adceb311d 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -388,7 +388,7 @@ static void ssctl_send_event(struct qcom_sysmon *sysmon,
 	}
 
 	memset(&req, 0, sizeof(req));
-	strlcpy(req.subsys_name, event->subsys_name, sizeof(req.subsys_name));
+	strscpy(req.subsys_name, event->subsys_name, sizeof(req.subsys_name));
 	req.subsys_name_len = strlen(req.subsys_name);
 	req.event = event->ssr_event;
 	req.evt_driven_valid = true;
-- 
2.35.1

