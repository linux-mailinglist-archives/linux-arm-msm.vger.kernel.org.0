Return-Path: <linux-arm-msm+bounces-49906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0B7A4A9FF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 10:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0061D189AFAC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Mar 2025 09:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4121D79A6;
	Sat,  1 Mar 2025 09:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WyBRttQr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74F11D6DA1
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Mar 2025 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740821110; cv=none; b=CugVK2Qw/mf0ujm2CqGjLXqYlXF9S6yS105P/P9KEBgbp2r7e1U54HEtg+T53+Sa1qj/GSgUMzOXT0CG4H1RSVKVCEh240fJLK5I0+adMTemWE2C+gOObHEN6Hm6Vy/HSnPnsO4xFj3irLJ1Um474fLyX9fUl1Ee4dhiiTHnJw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740821110; c=relaxed/simple;
	bh=3KiS1JFwz6siEC5WVugc4OTInSpbOeJ8pCpFDBbI8EA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aobbliKVMkZCvvqIHGA+pFsK3/P8M+9G6beQqePQ8MKZnwMqgeHH83AD49sRYu7CWZqArcLU2xGUJqGnNWNvM4zZt4lCnvazLkSz8AktwQp66rGBm8/rAlilmM5KasBGEv3ewY/yA9ZWrQ7iMO628vKSuDIm6rpEO9+FfVf2AMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WyBRttQr; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5495c63bdc0so275971e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Mar 2025 01:25:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740821107; x=1741425907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ofpBUooPWWaBC1Mgfyuj8wcWUv2U0LtD4mwNGBXHw8=;
        b=WyBRttQr+2EGE5q0DYGdam3HLywMIQdpe43N9Mtt36hq2JQS61AyVLZs2P9QOleU/I
         Srg4AKi9bxGVzIpemaOHnNxIx2T1Ct7SgxoZo4Th9ain0v4vZj0yRRE5t1NtQlkvCuoQ
         ojs/mkYGKmkVl+a8sZHiC2GpNvVi40QbMEEF55/SUpnRfwU2yEWHttunZBnBemNLA3ME
         3h5wRqLNvvWRYNXOcTPAY2xxxpiMmAs7TJYiw1A+cj7+UKxyCJLrQFDBwDtcj9e5k/PW
         IYe+7Yjwvtmp726tw2JoK2QfpGi31DFDeyOVb9soFGwK7ODHY1IDRlfPzffD8wqWng2U
         JObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740821107; x=1741425907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ofpBUooPWWaBC1Mgfyuj8wcWUv2U0LtD4mwNGBXHw8=;
        b=lsubTykU5exG/6ONNwhgGIxxRqlZNXwnSvPhV/MlmzlPqlaJsy0w8ppljkcQG3IMqc
         K7se+OkUgH0pUARS4oL0/TvJphFo9TPvU58v+V9xbVcmTME7xC7pAaCNn6+SpDzYXYW3
         ORbNfE2wtxSbiE0PyXRdIt3ckkoEFT4osFD8CYa4ZkV+WpOUS54d5cKmHgqheCPLC4ma
         cxEd1X7UMSpWB3oXvq6KN0XQmw8Hx6ejyL/QGn0Wd11mqT0GbnvkkYWMOpiLQ726ckI3
         4FmlCma5gDfB7LpqDlKyXLh4rFz8D24fNvsmZULobhy8UYyRB14HcILgqcO44QHQQvmh
         kOVQ==
X-Gm-Message-State: AOJu0YxHw8ZLezPbqXZPAQcaet3i6XYDgsmOZ+1BiNsEaYaoQreN4tcC
	PlQ9opl4cEyDsp+GzUH0h9JsjKn1bF7DTykH6Szb+HGCyk3y1uQVyAv0XBrk/c4=
X-Gm-Gg: ASbGnct4sFGBd/TdbFP5wtEoy7d35IrbJNnb8BP50pXzEEBrmC3hPYsDXMlq4DrQ1Sy
	V4WXPwWIrWcHKkB2BMS5IpO0xsjPuAI+BYc1/1CIzX2GwMjk7jy0/S3416JUYVLRXXD5alCj3ri
	eVtXISVVxB+LM4ZKUmD33zyHMd/WCVB+HCHxfXqwoNVVn2BYusJGoNgBV7DG8iG1mRGtdebMqdQ
	3Cq6vqK2Jaa2eYlMHFuZXSjjLM2O0jI3XZpKVhNxv/j4C/FREcKamzUHqP9ImG+VINjsJVCbKim
	/spS0WNfQQRZtUDZVRUyddswLE/+2CskrMypdB/xz5Y62vezaknA
X-Google-Smtp-Source: AGHT+IFTUhe/p95CZNKJGAqG1p7sHLGDOvpr/WdekUKr6EplX6n/Lb/C1JadtiI3JNxmPIfMMazmMw==
X-Received: by 2002:a05:6512:398e:b0:542:28b4:23ad with SMTP id 2adb3069b0e04-5494c11b5a4mr3148909e87.16.1740821106875;
        Sat, 01 Mar 2025 01:25:06 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494417432csm738406e87.52.2025.03.01.01.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 01:25:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Mar 2025 11:24:56 +0200
Subject: [PATCH v2 3/5] drm/msm/dpu: remove DSC feature bit for PINGPONG on
 MSM8953
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250301-dpu-fix-catalog-v2-3-498271be8b50@linaro.org>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
In-Reply-To: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3KiS1JFwz6siEC5WVugc4OTInSpbOeJ8pCpFDBbI8EA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/qhSxlfJgT2tZu2nzENWHi/au3+z5m5nxaGzpnq4P/Ne
 +WEhAKhTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMZK0cB8Pkny1u1dbz98w3
 jqnft7fvUZfdeRapjeq/K1zXCGwv+vQ5OyG287DkzhQThQ+v/q+/8fnkqYtWp3fMv2IRVqj3pWO
 /bnH/D3bTz8fuaeSapm81eBdUtT9AxPpnfFa/cuua0A7VyutlBVqXq+IP852//86N5bzHhf1X4z
 RbfgpM4Wn95bpEbabUKh3JPgURhfqQhtOhrh3yi9M3bF+4adsKE18Zl4QVlTpeD0O/qyrHyhz2F
 YhYXZh4e9/OzvjS1FldamaTroWLb89O8zlS9qU+eG0Xt49wLwePs27vhckxhZYPLU44bo7XTPHb
 NuthlVZG7Jz0I36mhz4Ksjea75xTLDPNZoWSVtGxWQavAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The MSM8953 platform doesn't have DSC blocks nor does have it DSC
registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
from the PINGPONG's feature mask and, as it is the only remaining bit,
drop the .features assignment completely.

Fixes: 7a6109ce1c2c ("drm/msm/dpu: Add support for MSM8953")
Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index 14f36ea6ad0eb61e87f043437a8cd78bb1bde49c..04f2021a7bef1bdefee77ab34074c06713f80487 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -100,14 +100,12 @@ static const struct dpu_pingpong_cfg msm8953_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = PINGPONG_MSM8996_MASK,
 		.sblk = &msm8996_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),

-- 
2.39.5


