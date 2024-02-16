Return-Path: <linux-arm-msm+bounces-11326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA73857AFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 12:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6228FB2420C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Feb 2024 11:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F80058109;
	Fri, 16 Feb 2024 11:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZafwBbBC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233FE58AA5
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 11:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708081441; cv=none; b=sb75Gra2IiewmeAaLalIDjv4BJgGBSCdNeXm1+7I0+PDpf2Xq3qfZK6njDkbGwEqTlgoqWgh9GLPWpESS0TAlAn7ATdrTvPmwfdysIA5k5A0nQVoDBDMqiNtd1/zd4WiATS3khcWRn51lBgGaDyKIpLKulwMqvRZpmAwb0RB5xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708081441; c=relaxed/simple;
	bh=B2VkxjrRCyr4kbi/Ih6iBNEXikEKFqg0faRJON0SE+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FgTMfaiJrouTIO6WZRIETxt6VCK/FtfDXkPl4FgY9sXFjycyiJLn+30REgwd3EcOkt3oEpgdy35dKl2jBAKwdWxqc/YAAVQpRQRM97qR2UgAIV6+ORgrvlMct5bbt8+7bZVdA1LQpFzPbAmVuXtunAwK88ceraAGq4OPbGKRmhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZafwBbBC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33b29b5ea96so922226f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Feb 2024 03:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708081438; x=1708686238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ygFt5WEvBpqUpx/ZfEWpp/27W6mJ4fXmmus9YC0aao=;
        b=ZafwBbBCKun+sMxiwhxBJE/xLZNpIW/w9WgF9AjbWEVUoSDZtfyQEKjbIQms8ye8Kf
         ineE1yy07UpC8e7oUydgIkZQ+612p7oenOGxAUuLondBOjohPUidyxSnI9FTAH0X+T0Q
         s+GI1quXFqDQNMioIR1z4wt5ptaHVuIqFK7Ny7yzmM5geFBPsSsusMZdz74ie2kLbss/
         i9+kpAq1I9k/sFzXGMP+6ezV4EI6ewm3Yp94l9XORqyvZQdvpahSOR+WCykKZEg9VIDP
         NXCSR5Oq8ttv6raBoUMOqPvAW7p7BU/KsgMioAH37Rwj7WHbWLqTUzhgyie3uIepuoGg
         83cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708081438; x=1708686238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ygFt5WEvBpqUpx/ZfEWpp/27W6mJ4fXmmus9YC0aao=;
        b=p22b+CdR3Wyfj3UtqSZkrJMuAsAG62fnu9zQ63x97B/Q57iD+Td6+R0YAfCQCYNyFU
         cjNWctFvnnQ8U/mMwBrn968t0MHZDNlYbFPt0L48paErQ1yJ/po39yjRtookhKwGA7Oh
         TXeo/kab/FmBApueLBDyz3q4xlNUaN/df7irPYktVX4MlbO2vwb9ad8pwvL2A4kII+q9
         NnkjI5jBn3HBBAc07V4xbcVE2xyGpKNCgtnua5pfyEW0LTDfVBMc+kgjJuSGf8qAcggH
         fAzNhgRC6a4KmfltyCGhtyJAJE2xB3DNf7yzuAs9nw/ijxcWpVuDepMWM9mBIvc0mhTS
         9fLg==
X-Gm-Message-State: AOJu0Yx31DHDFelUCu1EhKO6iJQ5ZHP/NbbCK2ps3Ehtqwp3ouQ+zncE
	iJLNkz0W7E5dAmJwE6V/YG/bMls2opFAaCEWiqpmD57G6E2LqYvJSLfh7W/ssxQ=
X-Google-Smtp-Source: AGHT+IEP3yiwcmF/JpddO+6q/ETD/OND3uScQVe3XPgZiAJ6sWVnA1HI/hScYmOVoLQdLn2nwzPXPA==
X-Received: by 2002:adf:f9c6:0:b0:33a:d28c:222c with SMTP id w6-20020adff9c6000000b0033ad28c222cmr6833643wrr.11.1708081438346;
        Fri, 16 Feb 2024 03:03:58 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id r2-20020a05600c35c200b004123b049f86sm1993174wmq.37.2024.02.16.03.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 03:03:57 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 16 Feb 2024 12:03:51 +0100
Subject: [PATCH v3 4/7] drm/msm/a6xx: Add missing regs for A750
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-topic-sm8650-gpu-v3-4-eb1f4b86d8d3@linaro.org>
References: <20240216-topic-sm8650-gpu-v3-0-eb1f4b86d8d3@linaro.org>
In-Reply-To: <20240216-topic-sm8650-gpu-v3-0-eb1f4b86d8d3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=B2VkxjrRCyr4kbi/Ih6iBNEXikEKFqg0faRJON0SE+g=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlz0EWLv15OOt84prn+zzezyX4bsOfCsjeKZ0p7RdD
 9nUyGtCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZc9BFgAKCRB33NvayMhJ0QcTEA
 CS2n5fqoqmYy9GHm6c4t2zLB5dDvZtmceau88GuV5umatO4fIxWOJ2NVqQz0VOvJbPEtS7xPrnA3o7
 JAnZ6MUVuh2noUioy3nxLe7FSMkh/ZPU2LRXwfKk4dwEZ0jF+MsRF3ZmZ2Hfw+elII/+aN7mJqw52s
 W8eyo/MgX0PgcTEKTYrqq0QRtGygwFwY4l1nxJV0IOtMGboM1VDlRq/BxaiUIyjIxFcNjuzz+Xh3w+
 Zr3SAVhHwGmNGYJmfIBHL8afHrOBGBloWT4rsKve+hzQ4NQIbt8MAblLGzeUTZSHpwwDPrIMBmO1rF
 vS+I1A12OTe4bEUDLXkmNEJPSs6NyxRsgGdOySmv3GJakcqJ+nbKW8sg1qR9tiNtCGmARKrnEnGPOL
 eEcxzYm8wlfIvLMMmxVQCKPv6tvaLo/Y0e5vo2YLoE8hsN1WTcOjSGnKCzxIXdLEeH+y+794HFWyc1
 1Dt8glMqWYagPv+aiZhsjdO3gFo0NuovcYjgjuxnr3SQ1nOXsS9q8YT6l+/q4pr47E2lOXRgqNttWo
 BnMpIc+sS5r8L9x4jpkteunntBHt8+6nQZTtFHCt/zok5FjqaNK/DGrKOiWDRm9xWQtEsBff6yphGC
 9JcXauVI9RI/gN52Cv42EbKaIhM09ziGBnkjek3NhTCJGhmUhay3i0Sj6n7A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Sync missing regs for A750 clock gating control related registers
from Mesa a6xx.xml.h generated file.

Those registers were added in the !27576 merge request [1].

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/27576

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx.xml.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx.xml.h b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
index 863b5e3b0e67..58877464692a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
@@ -1725,6 +1725,8 @@ static inline uint32_t REG_A6XX_RBBM_PERFCTR_RBBM_SEL(uint32_t i0) { return 0x00
 
 #define REG_A6XX_RBBM_BLOCK_SW_RESET_CMD2			0x00000046
 
+#define REG_A7XX_RBBM_CLOCK_CNTL_GLOBAL				0x000000ad
+
 #define REG_A6XX_RBBM_CLOCK_CNTL				0x000000ae
 
 #define REG_A6XX_RBBM_CLOCK_CNTL_SP0				0x000000b0
@@ -1939,12 +1941,19 @@ static inline uint32_t REG_A6XX_RBBM_PERFCTR_RBBM_SEL(uint32_t i0) { return 0x00
 
 #define REG_A6XX_RBBM_CLOCK_HYST_HLSQ				0x0000011d
 
+#define REG_A7XX_RBBM_CGC_GLOBAL_LOAD_CMD			0x0000011e
+
+#define REG_A7XX_RBBM_CGC_P2S_TRIG_CMD				0x0000011f
+
 #define REG_A6XX_RBBM_CLOCK_CNTL_TEX_FCHE			0x00000120
 
 #define REG_A6XX_RBBM_CLOCK_DELAY_TEX_FCHE			0x00000121
 
 #define REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE			0x00000122
 
+#define REG_A7XX_RBBM_CGC_P2S_STATUS				0x00000122
+#define A7XX_RBBM_CGC_P2S_STATUS_TXDONE				0x00000001
+
 #define REG_A7XX_RBBM_CLOCK_HYST2_VFD				0x0000012f
 
 #define REG_A6XX_RBBM_LPAC_GBIF_CLIENT_QOS_CNTL			0x000005ff

-- 
2.34.1


