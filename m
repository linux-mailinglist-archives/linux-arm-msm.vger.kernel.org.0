Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4BF44FF17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 08:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhKOHPS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 02:15:18 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:49639 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236829AbhKOHO6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 02:14:58 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636960307; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=qGxv+XsX7+bD5RWmhMsu38FzWS6QGNazoB2gG6O7qcM=; b=L2fRp9uvJgZzhVRkFSRFLszmLSM3a1jWbyXi3jNrhNbtIBHGyjegbsgwNeHtzIvvvEhZiwQY
 joppSVGELbwMzG0lWXRZPUMSy7u2Voa2++KMtttQepXIpsx/Jfxu2p76t30mLVjFRPnt/EPN
 ToDj7B8kCiYkDwLYPDL3ARf4Ez0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 61920833a9c3e8b85bd7b3a9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 07:11:47
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4DC84C43619; Mon, 15 Nov 2021 07:11:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7A8F9C4338F;
        Mon, 15 Nov 2021 07:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7A8F9C4338F
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
Subject: [PATCH v2] ASoC: codecs: MBHC: Add support for special headset
Date:   Mon, 15 Nov 2021 12:41:28 +0530
Message-Id: <1636960288-27537-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update MBHC driver to support special headset such as apple
and huwawei headsets.

Changes Since V1:
    -- Fix typo errors.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd-mbhc-v2.c | 75 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 71 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
index 405128c..d6545e4 100644
--- a/sound/soc/codecs/wcd-mbhc-v2.c
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -1022,6 +1022,56 @@ static int wcd_mbhc_get_plug_from_adc(struct wcd_mbhc *mbhc, int adc_result)
 	return plug_type;
 }
 
+static int wcd_mbhc_get_spl_hs_thres(struct wcd_mbhc *mbhc)
+{
+	int hs_threshold, micbias_mv;
+
+	micbias_mv = wcd_mbhc_get_micbias(mbhc);
+	if (mbhc->cfg->hs_thr && mbhc->cfg->micb_mv != WCD_MBHC_ADC_MICBIAS_MV) {
+		if (mbhc->cfg->micb_mv == micbias_mv)
+			hs_threshold = mbhc->cfg->hs_thr;
+		else
+			hs_threshold = (mbhc->cfg->hs_thr * micbias_mv) / mbhc->cfg->micb_mv;
+	} else {
+		hs_threshold = ((WCD_MBHC_ADC_HS_THRESHOLD_MV * micbias_mv) /
+							WCD_MBHC_ADC_MICBIAS_MV);
+	}
+	return hs_threshold;
+}
+
+static bool wcd_mbhc_check_for_spl_headset(struct wcd_mbhc *mbhc)
+{
+	bool is_spl_hs = false;
+	int output_mv, hs_threshold, hph_threshold;
+
+	if (!mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic)
+		return false;
+
+	/* Bump up MIC_BIAS2 to 2.7V */
+	mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic(mbhc->component, MIC_BIAS_2, true);
+	usleep_range(10000, 10100);
+
+	output_mv = wcd_measure_adc_once(mbhc, MUX_CTL_IN2P);
+	hs_threshold = wcd_mbhc_get_spl_hs_thres(mbhc);
+	hph_threshold = wcd_mbhc_adc_get_hph_thres(mbhc);
+
+	if (output_mv > hs_threshold || output_mv < hph_threshold) {
+		if (mbhc->force_linein == true)
+			is_spl_hs = false;
+	} else {
+		is_spl_hs = true;
+	}
+
+	/* Back MIC_BIAS2 to 1.8v if the type is not special headset */
+	if (!is_spl_hs) {
+		mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic(mbhc->component, MIC_BIAS_2, false);
+		/* Add 10ms delay for micbias to settle */
+		usleep_range(10000, 10100);
+	}
+
+	return is_spl_hs;
+}
+
 static void wcd_correct_swch_plug(struct work_struct *work)
 {
 	struct wcd_mbhc *mbhc;
@@ -1029,12 +1079,14 @@ static void wcd_correct_swch_plug(struct work_struct *work)
 	enum wcd_mbhc_plug_type plug_type = MBHC_PLUG_TYPE_INVALID;
 	unsigned long timeout;
 	int pt_gnd_mic_swap_cnt = 0;
-	int output_mv, cross_conn, hs_threshold, try = 0;
+	int output_mv, cross_conn, hs_threshold, try = 0, micbias_mv;
+	bool is_spl_hs = false;
 	bool is_pa_on;
 
 	mbhc = container_of(work, struct wcd_mbhc, correct_plug_swch);
 	component = mbhc->component;
 
+	micbias_mv = wcd_mbhc_get_micbias(mbhc);
 	hs_threshold = wcd_mbhc_adc_get_hs_thres(mbhc);
 
 	/* Mask ADC COMPLETE interrupt */
@@ -1097,6 +1149,16 @@ static void wcd_correct_swch_plug(struct work_struct *work)
 		plug_type = wcd_mbhc_get_plug_from_adc(mbhc, output_mv);
 		is_pa_on = wcd_mbhc_read_field(mbhc, WCD_MBHC_HPH_PA_EN);
 
+		if ((output_mv > hs_threshold) && (!is_spl_hs)) {
+			is_spl_hs = wcd_mbhc_check_for_spl_headset(mbhc);
+			output_mv = wcd_measure_adc_once(mbhc, MUX_CTL_IN2P);
+
+			if (is_spl_hs) {
+				hs_threshold = (hs_threshold * wcd_mbhc_get_micbias(mbhc)) /
+									micbias_mv;
+			}
+		}
+
 		if ((output_mv <= hs_threshold) && !is_pa_on) {
 			/* Check for cross connection*/
 			cross_conn = wcd_check_cross_conn(mbhc);
@@ -1122,14 +1184,19 @@ static void wcd_correct_swch_plug(struct work_struct *work)
 			}
 		}
 
-		if (output_mv > hs_threshold) /* cable is extension cable */
+		/* cable is extension cable */
+		if (output_mv > hs_threshold || mbhc->force_linein == true)
 			plug_type = MBHC_PLUG_TYPE_HIGH_HPH;
 	}
 
 	wcd_mbhc_bcs_enable(mbhc, plug_type, true);
 
-	if (plug_type == MBHC_PLUG_TYPE_HIGH_HPH)
-		wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_ISRC_EN, 1);
+	if (plug_type == MBHC_PLUG_TYPE_HIGH_HPH) {
+		if (is_spl_hs)
+			plug_type = MBHC_PLUG_TYPE_HEADSET;
+		else
+			wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_ISRC_EN, 1);
+	}
 
 	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_MODE, 0);
 	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_EN, 0);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

