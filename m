Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFAD455A16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 12:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343785AbhKRLZQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 06:25:16 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:54836 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343896AbhKRLXa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 06:23:30 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637234429; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=V0O5o9Y5iT8rkl0A/PwJ6T3Pn0iIKrXiHMODcgx8FkE=; b=LVM43mmaMqp+woBZuxrzi/VpHQS3ECY2lYyaErt304BfdYGEzSKPhJ9wj2f3GdLhl7qVrbsY
 S32SOnjJvTv8VeGa10jQ+LotsR63JRhowgRjOfqDryFFj1ZJiqD9fEbkVU8fXyyiv4jwtbxs
 Buf162pZfrcFKL57akpDhn7lKtM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 619636fcf5c956d49e74a092 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Nov 2021 11:20:28
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 976A5C4360D; Thu, 18 Nov 2021 11:20:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 95489C4338F;
        Thu, 18 Nov 2021 11:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 95489C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: [PATCH] ASoC: codecs: MBHC: Remove useless condition check
Date:   Thu, 18 Nov 2021 16:50:11 +0530
Message-Id: <1637234411-554-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove redundant conditional check and clean code in special
headset support functions.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index d6545e4..99586ce 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -1055,12 +1055,8 @@ static bool wcd_mbhc_check_for_spl_headset(struct wcd_mbhc *mbhc)
 	hs_threshold = wcd_mbhc_get_spl_hs_thres(mbhc);
 	hph_threshold = wcd_mbhc_adc_get_hph_thres(mbhc);
 
-	if (output_mv > hs_threshold || output_mv < hph_threshold) {
-		if (mbhc->force_linein == true)
-			is_spl_hs = false;
-	} else {
+	if (!(output_mv > hs_threshold || output_mv < hph_threshold))
 		is_spl_hs = true;
-	}
 
 	/* Back MIC_BIAS2 to 1.8v if the type is not special headset */
 	if (!is_spl_hs) {
@@ -1149,13 +1145,13 @@ static void wcd_correct_swch_plug(struct work_struct *work)
 		plug_type = wcd_mbhc_get_plug_from_adc(mbhc, output_mv);
 		is_pa_on = wcd_mbhc_read_field(mbhc, WCD_MBHC_HPH_PA_EN);
 
-		if ((output_mv > hs_threshold) && (!is_spl_hs)) {
+		if (output_mv > hs_threshold && !is_spl_hs) {
 			is_spl_hs = wcd_mbhc_check_for_spl_headset(mbhc);
 			output_mv = wcd_measure_adc_once(mbhc, MUX_CTL_IN2P);
 
 			if (is_spl_hs) {
-				hs_threshold = (hs_threshold * wcd_mbhc_get_micbias(mbhc)) /
-									micbias_mv;
+				hs_threshold *= wcd_mbhc_get_micbias(mbhc);
+				hs_threshold /= micbias_mv;
 			}
 		}
 
@@ -1185,7 +1181,7 @@ static void wcd_correct_swch_plug(struct work_struct *work)
 		}
 
 		/* cable is extension cable */
-		if (output_mv > hs_threshold || mbhc->force_linein == true)
+		if (output_mv > hs_threshold || mbhc->force_linein)
 			plug_type = MBHC_PLUG_TYPE_HIGH_HPH;
 	}
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

