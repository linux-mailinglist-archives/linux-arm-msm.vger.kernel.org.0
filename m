Return-Path: <linux-arm-msm+bounces-41433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E20B79EC752
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:30:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DC5B28196E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B4111EC4E5;
	Wed, 11 Dec 2024 08:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XjZ1cHdu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3FC1EC4CA
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 08:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733905810; cv=none; b=L1js6F/XGWdHiSJkc6/FlBWGt5rKo3BXLV2abRQk4AUQq5yX3LIwdIjsKdNOUR4KM57IIqpOO02l4JVpSnsqWeJ8yj0dyPO+SkmgAmUKXHiR8Ey8r5UI7++rQ2zfynfh9L0zPA89c5UmowGp5Ioeo4nDQ8Qf7sYNv0kzQbvqX7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733905810; c=relaxed/simple;
	bh=HwDocDUkhgOfD1IlB5zGqmjPJaEeewUJn9MRE88hfiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dw1SmTwPs0Okd/w2OsE4FamuH/U4bgAIqCy5HQdQStGf36sfv/M9AdUM0fMoJY2RS3r9hEzMhBEJMyPCP6/rOEUegyea4gmdNEepRwVRVmU4xpF4u/LIfWvO2ZSlR/9YoAIVgRjkn9qrbVxXlTwr9FlqeM98+NNcdxQP00uJBRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XjZ1cHdu; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434a742481aso55796255e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 00:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733905805; x=1734510605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=froNOEJ5fP4HPjSwjJSIEMf48laX07a0dnLFUTX+430=;
        b=XjZ1cHdunkFo/m3dmX/4tvsi/7jVrgUOChdqHWLkXy8HRRmsjezrLRSfltBbOtrczO
         7O80aoKBECWW7YXjGSuhde6b9hSbwDYARtR34FrXe4XoWNDZmC5NsoOXCr9R8adOHVmU
         aoSiriJ8NZ7pnf4wBHYcsLy37TrehyORgePvSgsnzhDYeFbb57EjKZSu+7i2Z79T3T7P
         xt2vq9fSpUsDsuUVliFvEW5Ptt3pdTFV3kZR60SqskZleohQm9HhdAIhCN1hV9WMfiAN
         5b+HczomXKm9KfYwjL9y4qCZMHTpOmtD6vq+rSYcpc8Tlu0Pyz4L6kaOWnRpZqeZPQ9W
         biqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733905805; x=1734510605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=froNOEJ5fP4HPjSwjJSIEMf48laX07a0dnLFUTX+430=;
        b=L60/n0NVEsAD/8Z7iGRunlgrrLZHuq3S/x2p0TtTEwKq+nccGbQmG2wCuH1y1JBvcj
         BMp+bupHMzqZyzUtuD2tsfbKkA0Jfw+I5A1FeXKXgbR/H6u0xGdW6WQzuwm6NkSUXbon
         7R2dmkr3qPfRwnQSE2Ox4SFVhDuHf4SZyDmecggcI6AnsukAMOOwa8Ys8mFV11YFiPrW
         zdjZA86/2WdvBLMy2MOQmVYXVIPz08p+7j/XLNL3k46BaQyFeWjwgpg2DQM5bgkotPfZ
         Pkh4g99EB2Lx6eR4qfObi/Rm/wnDoS3MayU4VDU1RcFodr9LU6w24sElU/Ov46r/hK9f
         cy0Q==
X-Gm-Message-State: AOJu0YyqIMRE7tSQ7LcmtDJJXTT/JEr1jAb9Q/wRdEPi8n6BdYbc0t0d
	GyNrkn20HTJ5Fa3ri6CEsiqppzm49vMIT+E05K/QARy2eGzeZRlrex0kku1PtCc=
X-Gm-Gg: ASbGnctxsVAvA/GHQq+gMuhZGdelTqFN3/vCGiP+yzkV7eaa1J9L1LDfl8l+/tlqobN
	f+ZmqTomU1I60AtKNx9wyOnyHVsPVK0d0SlDw8pjnza6m9ObcTUYlcn9VRve4hYL6neME68O3zR
	OBWKKRkadoMXrJY+JUfGDu/VI1e0Znq5C+FqinhbDOHfjDPksn+7RTzU29iw4Eoeoc4pG5Z0rts
	wAdJf8Zo140BDCov3WiUYO+s65ctFOx7kiTcfHFgx9WLMjcH6h485mhJJ8/yCYeOUzOSdIlcFs=
X-Google-Smtp-Source: AGHT+IGSwDAHYbnw5S2IK3PrmYkN6EG/ZxWl01dgNYJZ1WOshMIaf3xBAqPQQalIgOFUQFPOGjdAnA==
X-Received: by 2002:a05:600c:a011:b0:434:e8cf:6390 with SMTP id 5b1f17b1804b1-4361c375be3mr11052565e9.6.1733905805266;
        Wed, 11 Dec 2024 00:30:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a3e38sm735687f8f.23.2024.12.11.00.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 00:30:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Dec 2024 09:29:55 +0100
Subject: [PATCH v5 5/7] drm/msm: adreno: enable GMU bandwidth for A740 and
 A750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-topic-sm8x50-gpu-bw-vote-v5-5-6112f9f785ec@linaro.org>
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
In-Reply-To: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1853;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=HwDocDUkhgOfD1IlB5zGqmjPJaEeewUJn9MRE88hfiw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnWU2EHqgkCKVKYrWHVmNIXex/RLBqozejaQeTXpj8
 kUBYk4yJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1lNhAAKCRB33NvayMhJ0T3rD/
 9FVpn1zNY11iw2SqO/QGija56WN3UAmzifwdqisQKqIk3Nftezf9LgNpv6iMwTf/TzFm88pBqVpdOU
 2zsK2aL/PuSC52aM8UqN2wRSr+TFXkbdcw+2UiGEr1FU9Lr8EX16nbg5uxHQ0duIAT217kFXDuhuG/
 2CZ5oUAd5JCN3ngw+2CRxWWAheksuFTc82nqs24au/SZCks53k7ZFZv16ibNtmvm0HdOI1P+aecnS7
 4S9LDFcdLk5hRdTKB/SNXBsLVtuVt+AFW0rtT5GTP5bEozbzL1pf8/huJWgSlzlvtKFBByOtPi6YJ4
 KTGMoCVLINhn08nt3K/9Pw4nDSlVAOqN98nPQPCSEKw0iIPyKCQR456aGCwLs20cAzjIMhC5UXdQrx
 Rutu3430RFGdvrNwlhW8RxL1HFu5gXnhYhX8h6ggso2u2WfykTgDLrloRw6f+Lhyw1YFn6+INKgcuK
 sfDmLi1Mln8KgAagtJjvFOC/dv0R806q/t2MRIguFFWL8CZ308dmSAwQIkL+mrVwj97AY1snoDx2yH
 p60KPgNSCdfUH0QdfFQzVgq9D83JOZBQyXL9Q3eleNc7jmNEGCP2v7VjL/HaOqK+UDiUTGw+Cmmuu/
 5NCrPiIxU/Js8tzXNPlVJbMIzH4RyzPhW3EstmpefIbW7Eqx43GkCabuHvSA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
is in place, declare the Bus Control Modules (BCMs) and the
corresponding parameters in the GPU info struct.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..edffb7737a97b268bb2986d557969e651988a344 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1388,6 +1388,17 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7020100,
 			.gmu_cgc_mode = 0x00020202,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 4192 * SZ_1K,
@@ -1432,6 +1443,17 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7090100,
 			.gmu_cgc_mode = 0x00020202,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 10687500,
+				},
+				{ /* sentinel */ },
+			},
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 3572 * SZ_1K,

-- 
2.34.1


