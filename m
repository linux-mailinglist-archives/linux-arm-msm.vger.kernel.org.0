Return-Path: <linux-arm-msm+bounces-3056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDB2801F27
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 23:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9A49B20AB7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 22:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D6C22098;
	Sat,  2 Dec 2023 22:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LUpABkRq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87464124
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 14:42:52 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50bb8ff22e6so4575797e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 14:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701556971; x=1702161771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zovWCGMEaCBXEAS5mSNY7Kpzzx6U3mmVxujhNd8FwI=;
        b=LUpABkRq5D9HlmxDtNrLwXMcxK4Zrec3tj/BNmnRN6+dHv8avAAxMBVRnxDpeTV4oD
         Raj3cHDxEWv+QzbPDYghK1Ou0Vjc8XIigwS+4MumcHxFzuNZMdrT764JBCBSqYNNbQdX
         pHh/taeXs9AdTbCwZ570zMi4MhYYztZB0gYwh1ox8rSpGK5xajOLg/6crJl4fYx/xFDA
         WT8jBqeLeVOCZ493R6yOiDH3m9trTT366IiMLslaUXsrW1VDmi6sUksCbZZRGUcq7peJ
         PK13KHW+lz1sNElCvlFVJ4vYFEfTYaPRMmBHxYL4J9A3tlsByLOnIC1LwrZWtc6nVR+E
         VLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701556971; x=1702161771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zovWCGMEaCBXEAS5mSNY7Kpzzx6U3mmVxujhNd8FwI=;
        b=fAT6GvHBkgM4crJf1FI2zsEDDztRpqtariwDZuKLpBEtmRUzUkYbEWxl4Rq/qjP2p2
         UzAC1G5mWibFz4BgXCGy/bP57x+mMvWVuujQrnXoQ6pnil/5s8vL3fbaNabi56YMBb1C
         oOPqdCh73jFyphKD6peSs9XaRuVgE9x7taW/UbNL1KGsyC3nONbJxra/GzPB+rSIt7DQ
         LXel4K+vzGeNq3dmiaNmLQjOGWVzda+dsxl6MdAxLyXwkcPBWOJtJ5Cwf8+z6dYDB1Ov
         ME0+x3ju9Zwd0Rs9JN5TOb2gq8RsScfR0kBTBH2eC3Muosr40YFcuUUa8VldDSvDF4s7
         xkUw==
X-Gm-Message-State: AOJu0YxhYIcMdGGVmfa2vZlSYm3wGRwEOMwVIJqQ3SB+jm+1sMuSIvD7
	weRfJjNdslIbBBt69ZhERH5P+Q==
X-Google-Smtp-Source: AGHT+IGCx/hr9NPk4n8oWXdCugVcqzn1jGMHeBV9inPV/Mf00IxYZnUA8gjKRMpAvoYKPjvV+1LA0w==
X-Received: by 2002:ac2:5989:0:b0:50b:ec8c:a293 with SMTP id w9-20020ac25989000000b0050bec8ca293mr471560lfn.15.1701556970837;
        Sat, 02 Dec 2023 14:42:50 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o20-20020a056512051400b0050bed700f5esm187015lfb.91.2023.12.02.14.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 14:42:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v4 3/4] drm/msm/mdss: inline msm_mdss_icc_request_bw()
Date: Sun,  3 Dec 2023 01:42:46 +0300
Message-Id: <20231202224247.1282567-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
References: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are just two places where we set the bandwidth: in the resume and
in the suspend paths. Drop the wrapping function
msm_mdss_icc_request_bw() and call icc_set_bw() directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index e1b208fd072e..eeca281e9d6d 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -66,14 +66,6 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	return 0;
 }
 
-static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
-{
-	int i;
-
-	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
-		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(bw));
-}
-
 static void msm_mdss_irq(struct irq_desc *desc)
 {
 	struct msm_mdss *msm_mdss = irq_desc_get_handler_data(desc);
@@ -227,14 +219,15 @@ const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
-	int ret;
+	int ret, i;
 
 	/*
 	 * Several components have AXI clocks that can only be turned on if
 	 * the interconnect is enabled (non-zero bandwidth). Let's make sure
 	 * that the interconnects are at least at a minimum amount.
 	 */
-	msm_mdss_icc_request_bw(msm_mdss, MIN_IB_BW);
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(MIN_IB_BW));
 
 	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
@@ -286,8 +279,12 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 
 static int msm_mdss_disable(struct msm_mdss *msm_mdss)
 {
+	int i;
+
 	clk_bulk_disable_unprepare(msm_mdss->num_clocks, msm_mdss->clocks);
-	msm_mdss_icc_request_bw(msm_mdss, 0);
+
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, 0);
 
 	return 0;
 }
-- 
2.39.2


