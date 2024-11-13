Return-Path: <linux-arm-msm+bounces-37824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E099C7920
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 17:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66B31B3D000
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 15:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D65270808;
	Wed, 13 Nov 2024 15:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aaAOS5HM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952FE1FAC4F
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 15:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731512929; cv=none; b=opLf4qjwihyFh6zsyJBavRyCOmxDjlrcMDvjWQRTTVuRR1z3/MxcmXoloX12o3f8LkMWdzKhL4OmH8tJqytWb1pBN6GcrxQ74/MRrR278kMFUrVJj7ZIvJ8thdKOzGBbMn+7FIIEeqN5qiBE04tcW9PkdZq4i/cnJambgpabl2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731512929; c=relaxed/simple;
	bh=S+SoSj+qRP3rN1ucH5rok556sxuWpH0G2tK5cUTVK2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GX6MIHpPD2MtnsiecXqYcbZscCw89WlFvNaz+5L+F7IsUmKo6CVSVSUST0vUHok5n7f8gze1GYA1qVQkJ8s1v1j6M7L5knvfp23Do6wbkioc0sJWj5kaG0X3gSYn7yyUTgMJbLpi74wigiiMO04ju2PVNH5DZ/ZnLp+udNVckBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aaAOS5HM; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539ee1acb86so7659920e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 07:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731512925; x=1732117725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLkvv8R9JARcqpwOo1FEzIbabzBQSYk9vI4IDTHPWAE=;
        b=aaAOS5HMcAMOtT6WIkR2U9GcqK1+YtSyhvWR7N2RgCOqkQ3NHcb3gftbyMWh6eplpR
         cHvA7K7j/F5u9NurkgvJWm1eBtGTSdpWB3JCnH7l2ylBCrL33jAxWo2+Av5nyXxN3NCc
         aO1t6XG3yx1W7Lj2jOwwTf3Gwm/IGA4NVD+jaZ5+617k8YXeNsYrfyla6jVkhzK9IDWb
         KvrWHb3L/BbdZbEZtVGW3x80LOpkZfkO7Q4cpnvFfTK8KFJKOyAhVaRWKTmzhM72faGi
         nl9Fckx8Y/irTDPhgOoLVQsXkiiSexzWgKavhSaXgPHcc/X8naYmSbKLBXrtHqSujXN3
         wpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731512925; x=1732117725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLkvv8R9JARcqpwOo1FEzIbabzBQSYk9vI4IDTHPWAE=;
        b=OU2wueh7pNTio+I9g8fmIPC11EUAUbn7JVZA+Zy28Rdlk9Vh5IgjDHXpCFuHR4oH1k
         rOer3owP5eoR+0FTSFYsv0War99MI8+bQfSf4xKtQT2q7W9/uiyYF2ospTqjR76NrA+A
         TSRmeCb5hVa/j1H9tVM3p0gBaWT2/EevfY37drDO2YwSPmlZxFXYJMWBDMWVmByEvjzB
         pSNnjN1LkO7EacrtL0f2ySZAnYkqTKe+pz1XT9Rv9wa5dmzlQgePTdSt6b5wKvmRRLEa
         rn4yx0cRTmNjcB9FzhYShvq8gmDZ8Qz0WbxVNhtLCmWcmy/wyEaUID24MppshlEF99sa
         yDkw==
X-Forwarded-Encrypted: i=1; AJvYcCWwqgCy5wVp/ObV/sIte2Y4ZmrSlTr7JhT027CZ4Mr/FHlQGG5RWI8iEl+/skot5sFwIL8FmM2e2ASx7SEH@vger.kernel.org
X-Gm-Message-State: AOJu0YwlLFjwk3P4HMA0bD5VTcvRQ5vf6qdhas8220qpPonhQekTtqAH
	+O4kAlktvAUDkOq+eY1YDViEgNvONUfJrfmrDCCSfIpYkUKmxland95l2qYtrrs=
X-Google-Smtp-Source: AGHT+IFzTweLUvF3kg8gFXLJ8W63zGBpneugfPnMUH1xqaN+DG5tZl4dczYKpKANSweFAy7zsyr58g==
X-Received: by 2002:a05:6512:2806:b0:53d:a309:7fa3 with SMTP id 2adb3069b0e04-53da3097ff4mr1091284e87.41.1731512924605;
        Wed, 13 Nov 2024 07:48:44 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d54f772asm28445345e9.18.2024.11.13.07.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 07:48:43 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 13 Nov 2024 16:48:32 +0100
Subject: [PATCH RFC 6/8] drm/msm: adreno: enable GMU bandwidth for A740 and
 A750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-topic-sm8x50-gpu-bw-vote-v1-6-3b8d39737a9b@linaro.org>
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
In-Reply-To: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2521;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=S+SoSj+qRP3rN1ucH5rok556sxuWpH0G2tK5cUTVK2M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnNMpSFA/q95rAzi2SnEKM+YVmy9GR0uPKncQSnFbd
 CknGqQiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzTKUgAKCRB33NvayMhJ0Z0cD/
 95X++l6sn4O96M/apxTEx+LCb7aw3VyNWlVxOU0SWzGglMAd2swg03eMMbeqcwIjTUoCGMnTYaSHbR
 ByRZDTnLqFCSX8hTxdP8Fo0BxyeooGlEWqxyGNZtEzxxhCEqmJFI9Ky9CObGupG5/xwv/GGKZ8JF6q
 B3mTXmTHfGrwFAf7LEPgHL8TmOH+ygIoL1zSYRvJrnEduTWyp7IxiKAbKLIozOOKHH8mRKZwKsCUHt
 0hUmZ4WFzVPeQt+TS9JpRRHoUVzVrZGj5Fn/OX27EF4JwjX5bKyEurVCYmprgSQc16qEevaTKKDWqS
 apaZxvUbntlGmj31AwbZlrqSDFvpmRAKBeS+1HxZhX6vI2//fNigkfvZDcKezQLcvUW94+b9pZ0nBB
 CTR3YoWR36Phxfour5b34ivTeeC4kqXm2Clz5hpL4BcugmPEyhzczvfQvFfC3IpWfEvupTtXoSWCv4
 tSVPUuFnN3Mbxx2iHA8/XJk0zV/mDZ3Uhz1sL4BO2VwYewwUUUG/viRFGqEqXQfOnMJZhiYrYqn+AG
 S9TrblcPNbvIdqTeWeKmxA4Sd5keH2daMYCFsjj+HPUCi1N4oqf0Tm2hQ2uKnS3LFx5nVqIz57L9nH
 LXx3uCmCBuQhMgcqWaL9NUtEcIANaxEsQX/8PIZyV+nbe24c9CxlIlNcWlwQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
is in place, let's declare the Bus Control Modules (BCMs) and
it's parameters in the GPU info struct and add the GMU_BW_VOTE
quirk to enable it.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..014a24256b832d8e03fe06a6516b5348a5c0474a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1379,7 +1379,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
-			  ADRENO_QUIRK_PREEMPTION,
+			  ADRENO_QUIRK_PREEMPTION |
+			  ADRENO_QUIRK_GMU_BW_VOTE,
 		.init = a6xx_gpu_init,
 		.zapfw = "a740_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
@@ -1388,6 +1389,16 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7020100,
 			.gmu_cgc_mode = 0x00020202,
+			.bcm = {
+				[0] = { .name = "SH0", .buswidth = 16 },
+				[1] = { .name = "MC0", .buswidth = 4 },
+				[2] = {
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,
+				},
+			},
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 4192 * SZ_1K,
@@ -1424,7 +1435,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
-			  ADRENO_QUIRK_PREEMPTION,
+			  ADRENO_QUIRK_PREEMPTION |
+			  ADRENO_QUIRK_GMU_BW_VOTE,
 		.init = a6xx_gpu_init,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
@@ -1432,6 +1444,16 @@ static const struct adreno_info a7xx_gpus[] = {
 			.pwrup_reglist = &a7xx_pwrup_reglist,
 			.gmu_chipid = 0x7090100,
 			.gmu_cgc_mode = 0x00020202,
+			.bcm = {
+				[0] = { .name = "SH0", .buswidth = 16 },
+				[1] = { .name = "MC0", .buswidth = 4 },
+				[2] = {
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 10687500,
+				},
+			},
 		},
 		.address_space_size = SZ_16G,
 		.preempt_record_size = 3572 * SZ_1K,

-- 
2.34.1


