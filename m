Return-Path: <linux-arm-msm+bounces-3055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 042EF801F24
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 23:43:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AF99B20B48
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 22:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FBD02232B;
	Sat,  2 Dec 2023 22:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OZSWwzPO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C66119
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 14:42:51 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50bf26f8988so86031e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 14:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701556970; x=1702161770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tg6ik6jkhCoYifkR5PJD5UGVthg925S5B4jBHf5xlEE=;
        b=OZSWwzPOAxjUJaM4YymJoBRxo9c018L5WNWdk8iy7D0l7DOoZg6my1j4uWBWC5yIHJ
         +4cyyY5kaxUQoYy2rlFRXfOwrcFycX7JfIaifHjWhBGIr1Vxfstw48xbUztoLvfol8hi
         w55ASgi/yt79Jzq5t13SqOnAQGvfjPTnJcVa6rVD66QkZ3BjGOVl0pxSNgZY3ZUtcxrt
         8DIorwbpeBqbV3RUMbNFQQTXNMetPcsfbFk8GbfX+gw0s5himU2CBog9eI/HYBlhZzf0
         b/xjy3wmCPGbDjGJSYKUonJ2zwtzq16Z2D3FrJYaNe0+4y1I/zBDDwisdNUxxm8+FE3C
         5gQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701556970; x=1702161770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tg6ik6jkhCoYifkR5PJD5UGVthg925S5B4jBHf5xlEE=;
        b=IkUWNUUURW8P3gRFktFn46psRjnpXBvnRr4VZy651gqPMcYGwvnV7ONbcZp1OKh78X
         4nFq/RdSB6tmLTLKt1sLGogcUt0k5ihyS4c8RlUujESdkE75Tv8/i8q5aSC7fB926p+h
         QTOMBwZPnap8fjQib1Q/wADKSgakiZLg43aoueBHtixL/N1lP7p796ZLcnoj101IF6eG
         +kr9BEBGwz2gMyPFDsjM0NgeoEHIvyma4CfK5KE7zoeR8udjv8hCDVFR43mcY7WKD4XB
         IW6C503LslMy8rSYvkBI1aGQuFp0nKWPFRGy6DADjuMlQIN/Y2XIW6zdldjZ8NjRqM/Q
         JXlA==
X-Gm-Message-State: AOJu0YziLWL2qD36FreVtZugq6g7Huu2ZDoa8tYkUrcu8QxHb/oiGa6s
	QsL27fG9YdhaWjCfvp+IFK0vTw==
X-Google-Smtp-Source: AGHT+IEye2IVR+NrlvezqDcD6ayk0gBP0mIG/TZ5I9WBZeru+5TsGk2sWcqpSzPVYcFa+ELtckQ6iw==
X-Received: by 2002:ac2:5e83:0:b0:50b:ef70:8d66 with SMTP id b3-20020ac25e83000000b0050bef708d66mr333083lfq.26.1701556969996;
        Sat, 02 Dec 2023 14:42:49 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o20-20020a056512051400b0050bed700f5esm187015lfb.91.2023.12.02.14.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 14:42:49 -0800 (PST)
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
Subject: [PATCH v4 2/4] drm/msm/mdss: Rename path references to mdp_path
Date: Sun,  3 Dec 2023 01:42:45 +0300
Message-Id: <20231202224247.1282567-3-dmitry.baryshkov@linaro.org>
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

From: Konrad Dybcio <konrad.dybcio@linaro.org>

The DPU1 driver needs to handle all MDPn<->DDR paths, as well as
CPU<->SLAVE_DISPLAY_CFG. The former ones share how their values are
calculated, but the latter one has static predefines spanning all SoCs.

In preparation for supporting the CPU<->SLAVE_DISPLAY_CFG path, rename
the path-related struct members to include "mdp_".

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 53bc496ace99..e1b208fd072e 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -40,8 +40,8 @@ struct msm_mdss {
 		struct irq_domain *domain;
 	} irq_controller;
 	const struct msm_mdss_data *mdss_data;
-	struct icc_path *path[2];
-	u32 num_paths;
+	struct icc_path *mdp_path[2];
+	u32 num_mdp_paths;
 };
 
 static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
@@ -54,13 +54,13 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
 
-	msm_mdss->path[0] = path0;
-	msm_mdss->num_paths = 1;
+	msm_mdss->mdp_path[0] = path0;
+	msm_mdss->num_mdp_paths = 1;
 
 	path1 = devm_of_icc_get(dev, "mdp1-mem");
 	if (!IS_ERR_OR_NULL(path1)) {
-		msm_mdss->path[1] = path1;
-		msm_mdss->num_paths++;
+		msm_mdss->mdp_path[1] = path1;
+		msm_mdss->num_mdp_paths++;
 	}
 
 	return 0;
@@ -70,8 +70,8 @@ static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
 {
 	int i;
 
-	for (i = 0; i < msm_mdss->num_paths; i++)
-		icc_set_bw(msm_mdss->path[i], 0, Bps_to_icc(bw));
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(bw));
 }
 
 static void msm_mdss_irq(struct irq_desc *desc)
-- 
2.39.2


