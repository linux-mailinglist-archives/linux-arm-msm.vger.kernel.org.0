Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03FE170AF46
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 19:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjEURN6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 13:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231488AbjEURKs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 13:10:48 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672C9E4
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 10:10:33 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f24d8440c9so3357791e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 10:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684689031; x=1687281031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZvD39ofO02L6Mafll8o7Cr6RvsnfAzRure5kJuG8gc=;
        b=DgXi+Di617041RttyVDbYxDEjiVAOvDn2IVl7JBf6snFs0igxL2LwsL2PLGBFT6dZ8
         WVqA/5eBQadwZPASTs1SOHOWL6j+tyttILnzUxhVbcsuHMVYtQa7cBXLwt6z/06qJX8+
         w75jzmF94bf9xVF5IZKLjFjdCJXS0t+yWnTqisab5fk2FYFSBsEBpor4OVE/RzOJJDbB
         MfP1NSPajvmO7VUA/a7FHaJZOusFbbPDtnsBPBTXgFQJ3x5NNMvkHP+yeWRGmJ7ujbVi
         Zu/zAIaTSCYpxvBWRoR54J/E7KMLIPTgRqbiYZM873wSVsLtEBReVKfbmKP/Vx6OILQi
         ABuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684689031; x=1687281031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZvD39ofO02L6Mafll8o7Cr6RvsnfAzRure5kJuG8gc=;
        b=kOXQrscxp07fKr/h9IdtPJAuC5xVzUxWxSmhYEs7lflF+ul4cqOVyhOImrn/Iu1ida
         MOq2+zmcy+MIfHgoZNZnE67cI1JinyU08NAjlCCoBAgGYS/KqF9J87XjlvJzOtZxlvrH
         hCp1JYdiEtCnp0dP5nzrd0DFdTkK49Zr5hm5wUkS2a/3reKvs60mD/QTtHyDTBNOV7rl
         JYunH+0OEKr9mICrzGxcHSoTrZ6+YzYsBkhAuqDbf3/tSID0ahGw0kzLd7mDRdrgQxyM
         bQQZxUqoQXyUfvSIVcg+Ywc+lpu/IkQPB1pnZs185p7Q0K4w4SfNq6sWM9LgBz0oQEXZ
         B3sw==
X-Gm-Message-State: AC+VfDzm7PxQjWDinIuobmyeEIErsfc4sMXH2jCFK7CIef9JIt9nOR1W
        +7F4398z5hRrlYnGvql38p5BNw==
X-Google-Smtp-Source: ACHHUZ5GQD33SK2SC1NesPQnRiaM3+LEIvK0slB43sb6fdz7M+lFdoO63gUoLm36yJCrTw7M1x43gg==
X-Received: by 2002:ac2:530c:0:b0:4f3:b18a:6494 with SMTP id c12-20020ac2530c000000b004f3b18a6494mr2500887lfh.22.1684689031732;
        Sun, 21 May 2023 10:10:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k19-20020ac24573000000b004f00189e1dasm680493lfm.143.2023.05.21.10.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 10:10:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 4/6] drm/msm/mdss: populate missing data
Date:   Sun, 21 May 2023 20:10:24 +0300
Message-Id: <20230521171026.4159495-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As we are going to use MDSS data for DPU programming, populate missing
MDSS data. The UBWC 1.0 and no UBWC cases do not require MDSS
programming, so skip them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index ed836c659688..9bb7be4b9ebb 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -264,6 +264,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	 * UBWC_n and the rest of params comes from hw data.
 	 */
 	switch (msm_mdss->mdss_data->ubwc_dec_version) {
+	case 0: /* no UBWC */
+	case UBWC_1_0:
+		/* do nothing */
+		break;
 	case UBWC_2_0:
 		msm_mdss_setup_ubwc_dec_20(msm_mdss);
 		break;
@@ -502,10 +506,22 @@ static int mdss_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct msm_mdss_data msm8998_data = {
+	.ubwc_enc_version = UBWC_1_0,
+	.ubwc_dec_version = UBWC_1_0,
+	.highest_bank_bit = 1,
+};
+
+static const struct msm_mdss_data qcm2290_data = {
+	/* no UBWC */
+	.highest_bank_bit = 0x2,
+};
+
 static const struct msm_mdss_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_static = 0x1e,
+	.highest_bank_bit = 0x3,
 };
 
 static const struct msm_mdss_data sc7280_data = {
@@ -550,6 +566,7 @@ static const struct msm_mdss_data sm6115_data = {
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 7,
 	.ubwc_static = 0x11f,
+	.highest_bank_bit = 0x1,
 };
 
 static const struct msm_mdss_data sm8250_data = {
@@ -574,8 +591,8 @@ static const struct msm_mdss_data sm8550_data = {
 
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
-	{ .compatible = "qcom,msm8998-mdss" },
-	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
+	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
 	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
-- 
2.39.2

