Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA7B4C4E95
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 20:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbiBYTWk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 14:22:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbiBYTWj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 14:22:39 -0500
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id E08DB1C0249
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 11:22:06 -0800 (PST)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1645816926; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=7XIgIPMw1xaAU2PGzc80TV+xNkIU5RQN+WvgogiqyWQ=; b=dk3ysvxE5KzKOuXmZPQTk9r60aCcDmczJadqMTd/nggIiPYbRvtdJFPFFcFwD/1H7kFkaLtk
 ooLDv30BTaRPUwikDM642ib+AQDDJQTHAFPwzmG1AoreimPa35D+YeUxfAJugom+vvRNti4A
 C0DYIPK6ct95+IdxZT+YBoiIRnw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 62192c5d18892df15f9a8d44 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 25 Feb 2022 19:22:05
 GMT
Sender: quic_akhilpo=quicinc.com@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 14D2DC43638; Fri, 25 Feb 2022 19:22:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4F9DCC43619;
        Fri, 25 Feb 2022 19:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 4F9DCC43619
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=quicinc.com
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
To:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Douglas Anderson <dianders@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] drm/msm/a6xx: Add support for 7c3 SKUs
Date:   Sat, 26 Feb 2022 00:51:30 +0530
Message-Id: <20220226005021.v2.3.I6e89c014eb17f090f716fba662bdd33073920804@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645816893-22815-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1645816893-22815-1-git-send-email-quic_akhilpo@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for 7c3 SKU detection using speedbin fuse.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

(no changes since v1)

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 17cfad64..f308a3f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1736,6 +1736,18 @@ static u32 a618_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
+static u32 adreno_7c3_get_speed_bin(u32 fuse)
+{
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 117)
+		return 0;
+	else if (fuse == 190)
+		return 1;
+
+	return UINT_MAX;
+}
+
 static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 {
 	u32 val = UINT_MAX;
@@ -1743,6 +1755,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
+	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
+		val = adreno_7c3_get_speed_bin(fuse);
+
 	if (val == UINT_MAX) {
 		DRM_DEV_ERROR(dev,
 			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware",
-- 
2.7.4

