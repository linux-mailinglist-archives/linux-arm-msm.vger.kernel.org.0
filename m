Return-Path: <linux-arm-msm+bounces-55595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF63A9C45E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 11:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1535F9A6401
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C098242D90;
	Fri, 25 Apr 2025 09:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oSyerK4m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790B623D2A0
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745574725; cv=none; b=RZp/DgMRdHoSXxDGtR8xKNWV0d0mzUQuYXioX5/gFZh6VFaY+J7UvGn0Vn0JAm+UgiVQbNP1xWy4ioPxmLt3j89OZ7ENeMhggne8CYo6FDfT8Pt+lkt2CxXW6jzt+nqGAUS4en84ROK4lGHiaoWn7PTnEMdJbFeLvAWFogLyFCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745574725; c=relaxed/simple;
	bh=Xcu5kaVORj8g0gj2NUB2CUID8UjEmeQSDIOZ7F9qtDc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Khe216F7rkCU9rfZG8iiTj32mj7vuDnqyHve+mzSzZvQyXQB4s9Kq0XjRq9cyW8RyZp6vMkuNhXlAv3ynl0wguzQs2QrGy2Crl6S6jh/BmNiWAGZi2Vw/izEQnIFiTbxJ2mSaT96J9ORsCIXnDSb0hiS1gt/gUmQjjpdt6SBydg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oSyerK4m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T7wF008626
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YPhUAy0IKCydcq3qR8LkaE9TXn8NhCRkCwjmuP0vxxg=; b=oSyerK4mwaRllSNK
	3sw8FcX21GXYU15W4lY9Q7Kh/vDfLXDZyDgTVsWcgWU2MmJppnyRsjR8k5EEHMMq
	UcIg6aET6JPINlQI6pIw9U5OEpvo6/glEWx7v5Kxqd6w0zL0dlowymV4iSr+SDNF
	5ezkXNEShGXVhNPKCHrUM0r0+pq2xWBvp6gYpTmO7o6l9hKFZonUT/D/jFZ/uilp
	BLF09h5/Fc6S44OLXZdZ1KeOp/RS2ev7ExP203gM4emUaKcth3YNDAjtfMTGqD8B
	333E4bzIVncWmEBmqf6IcvEEjGqwa1tUncjG1LP1LVilF1XBJEaUtddQja+c2txq
	Cc4sZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy8gxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:52:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5bb68b386so593208485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 02:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745574721; x=1746179521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPhUAy0IKCydcq3qR8LkaE9TXn8NhCRkCwjmuP0vxxg=;
        b=Fs9JkRdZpycLuW6THXBCcOmqlJvcSDqeW0czbZDp+LR4/hdTRVHNFKgWMIwFLxniLv
         hyDW0sRSL7Ucu2ZgoGMdCmxBSmn192/bkh5GwJfj60TG/KUt14RCxD0faavWBiP+nWmK
         g+xVh/5LiSQNaM2IWwzA50FKfpJke3S0bVZRj0NLuRYQBHiE1UYigYctU/KDXa6OpeeO
         AMwMf8lUbviMaxli/c4SNx4AsX2wvZ/vrR9mqrsMAgYm3D2pjpuYKc5L9Q6gv2RAv40P
         xYpfTGSOKl/fsfZcCoPuqKq3uKgHCdT+t2teAhfn5NFaWETJeapgRD/2YdWgQ1tokSMO
         p2qA==
X-Gm-Message-State: AOJu0YxHSg5y4ThgMtMJs3UwHyJAGxuWBWCi4UIL8XBwjBUJnn08FQFY
	jHaOXYvUYdkEkXxHeRg4qBUQASYNSXfqKJx+jN73jfY+2/4VdGa5zwYjEbQvqzvyAdpwQELB+xz
	GaXne8Rb/4wIjx5k3I0MVEMra5t9K/A0XLpOkR3ENYaCzj+BApoF5bu94p1VFzdynlhBXSwMv
X-Gm-Gg: ASbGncsJIBNuz8ZAmAq8D30JeCydgB3e6PK+wFSNcP9z3ljEwwTpknqQA9jo/Jy/7Jv
	HxIcTkHwF+7q6UPf6cwgXKjYrJvsbaznZV1srCwry/FjlorBTU2xVyDK4JXSyT7donnYrcoM7UO
	TA+FtIHVT0gqVge1V+ogfJi5kjkm1rwCSito6FobdpmQuA6CZyJPKP4nTQTpJcyum1MspiKS3kS
	JoYbHiJYzuNWk1cZBq4cCCeioeQqpyJwWmyWGJiJxA6+04JjWxDJ4YFBwW5Fmm7R73Muh8DY/SP
	pi7ga0qBC8yZrn+D6N8CtYO8T1lN4kW+B4RiyhhacX4i2UKp2KIz2k0AWRVx/LEOD4Ytt8leHsr
	6KL8NFzMDp/nJFUVvFzLgFw/k
X-Received: by 2002:a05:620a:bc4:b0:7c5:5e69:4450 with SMTP id af79cd13be357-7c9606f846amr220216885a.17.1745574720828;
        Fri, 25 Apr 2025 02:52:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ1PuPUG5UA+Ta0KBqmp76nB4H7hKk2B9kKWJeFr07+c/AZQczeUIZjnYJCQvFsn+MeMN9ug==
X-Received: by 2002:a05:620a:bc4:b0:7c5:5e69:4450 with SMTP id af79cd13be357-7c9606f846amr220214885a.17.1745574720525;
        Fri, 25 Apr 2025 02:52:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:51:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:53 +0300
Subject: [PATCH v4 3/7] drm/msm/mdp4: register the LVDS PLL as a clock
 provider
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-3-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3936;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=p1IT7slnVG8OxIiWvFIYnjVg2GsFl620wCCz7LSey7Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s5zHFbFUsFBUaPCTVFVTZYS/OOWyjMl5RFl
 LJ56EsTJsiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOQAKCRCLPIo+Aiko
 1SmgB/kBSZl7DR5mdH319Q7IjDuxugjrvDTqfN0OW7Hax/kXdA6o9r1/XNhMlAR3p76mdAzj7vD
 JLuiAtSJeYXUSdUis6xvxhWP+5HyqGlF9U1c9+A9BoZ3TS+OsWez1z6CKhEMVHdq1haPKc6aBTC
 OugfsPPtzCA0ynJhnJ/+snE4r6gOk1XhQe2U67A6mEz78aanZkgrbHq1wce4GeEKBNoL2ABlv9M
 zz5o3lB3R4Ddq7M5JlyQJP84JKNcZ1Qg9/nlNNk8/LH1sGkOisMuROp2pPWfR4orL99WxQ2/1jH
 tQhpFJ0in5sE972LvIgawuejazSBoeXVvOqmRocjy4SS4zmW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfX2G+WNuNNGP21 1Ge76jia4nYIurDC/xgAqG8l1rvLeA/THOw5mfcy5ZmXYDdi6yXxsvnbYysZhdME8a5nkAOsSam OQqxKAX8i9udfR0S6XTeYeRVpJX/mdfmau/5mKv6QkcKWVVgqPes2KAX29mk4/mGDHZ6GqtYikm
 30T07pEiIdFKgP1qoJP+ALq22PHihoaHj9cdSan1x6R193jdZrCJ+LzHg5PXaqkalfHJMoz7aa2 eDyyzWn4VqzjpIQprhZwcvi2j5WlPrAGEW4G5N7YtmeRUjOnO3+IkwO4xuGpLoAr/ZujQhfoDfW 52/7RDxZ9qsyGo/eFHPbIf+FyA4oyELJRLKma0HZqyMR09rzLq0vX5VO02BbcOQlgGApiVclFqH
 k5dwvfSjRV6qtvfDbQOzU+jHOeXNjtgKqTeEjdgCaztPMUgbUhM1sr2RLmLXNM2T1908cFD8
X-Proofpoint-GUID: _0Zkapv-_RL0fbgkgv6HBzmtEgvytIsE
X-Proofpoint-ORIG-GUID: _0Zkapv-_RL0fbgkgv6HBzmtEgvytIsE
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680b5b42 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=TDJnK0Sta0nlXdS-8S8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=945 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The LVDS/LCDC controller uses pixel clock coming from the multimedia
controller (mmcc) rather than using the PLL directly. Stop using LVDS
PLL directly and register it as a clock provider. Use lcdc_clk as a
pixel clock for the LCDC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h          |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c |  3 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c     | 45 ++++++++++++++++-------
 3 files changed, 34 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 142ccb68b435263f91ba1ab27676e426d43e5d84..3d7ffd874e0d234f450f6170e623f87572456757 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -207,6 +207,6 @@ static inline struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 }
 #endif
 
-struct clk *mpd4_lvds_pll_init(struct drm_device *dev);
+struct clk *mpd4_get_lcdc_clock(struct drm_device *dev);
 
 #endif /* __MDP4_KMS_H__ */
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 8bbc7fb881d599e7d309cc61bda83697fecd253a..8694e5d7d3f012070c72214df063a6488b2ef707 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -380,8 +380,7 @@ struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 
 	drm_encoder_helper_add(encoder, &mdp4_lcdc_encoder_helper_funcs);
 
-	/* TODO: do we need different pll in other cases? */
-	mdp4_lcdc_encoder->lcdc_clk = mpd4_lvds_pll_init(dev);
+	mdp4_lcdc_encoder->lcdc_clk = mpd4_get_lcdc_clock(dev);
 	if (IS_ERR(mdp4_lcdc_encoder->lcdc_clk)) {
 		DRM_DEV_ERROR(dev->dev, "failed to get lvds_clk\n");
 		return ERR_CAST(mdp4_lcdc_encoder->lcdc_clk);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
index ab8c0c187fb2cd05e26f5019244af15f1b2470c8..df2bbd475cc2a11da20ac07be8e757527ef41ae8 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
@@ -133,29 +133,48 @@ static struct clk_init_data pll_init = {
 	.num_parents = ARRAY_SIZE(mpd4_lvds_pll_parents),
 };
 
-struct clk *mpd4_lvds_pll_init(struct drm_device *dev)
+static struct clk_hw *mpd4_lvds_pll_init(struct drm_device *dev)
 {
 	struct mdp4_lvds_pll *lvds_pll;
-	struct clk *clk;
 	int ret;
 
 	lvds_pll = devm_kzalloc(dev->dev, sizeof(*lvds_pll), GFP_KERNEL);
-	if (!lvds_pll) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	if (!lvds_pll)
+		return ERR_PTR(-ENOMEM);
 
 	lvds_pll->dev = dev;
 
 	lvds_pll->pll_hw.init = &pll_init;
-	clk = devm_clk_register(dev->dev, &lvds_pll->pll_hw);
-	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
-		goto fail;
+	ret = devm_clk_hw_register(dev->dev, &lvds_pll->pll_hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = devm_of_clk_add_hw_provider(dev->dev, of_clk_hw_simple_get, &lvds_pll->pll_hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &lvds_pll->pll_hw;
+}
+
+struct clk *mpd4_get_lcdc_clock(struct drm_device *dev)
+{
+	struct clk_hw *hw;
+	struct clk *clk;
+
+
+	/* TODO: do we need different pll in other cases? */
+	hw = mpd4_lvds_pll_init(dev);
+	if (IS_ERR(hw)) {
+		DRM_DEV_ERROR(dev->dev, "failed to register LVDS PLL\n");
+		return ERR_CAST(hw);
 	}
 
-	return clk;
+	clk = devm_clk_get(dev->dev, "lcdc_clk");
+	if (clk == ERR_PTR(-ENOENT)) {
+		drm_warn(dev, "can't get LCDC clock, using PLL directly\n");
 
-fail:
-	return ERR_PTR(ret);
+		return devm_clk_hw_get_clk(dev->dev, hw, "lcdc_clk");
+	}
+
+	return clk;
 }

-- 
2.39.5


