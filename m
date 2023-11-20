Return-Path: <linux-arm-msm+bounces-1136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C573C7F12EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 13:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4864E1F23FAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 12:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2174B19442;
	Mon, 20 Nov 2023 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g9Am2HQJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD2FF5
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 04:13:14 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-547e7de7b6fso8168177a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 04:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700482393; x=1701087193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hc7Srsl8oO2HlJZxLPv8yK7GL1izzxy48y1+02c51Ts=;
        b=g9Am2HQJqjG6BO0Jwcvnjb0cSPRagXFZozNxavQ0MoKXmGlsFmrmICMBB0nXa++3hC
         2oc+BbIoGR5TFP/TjNF/QP7OTMFaRBpsjTVXOLB1tGntDfOgsTX9M3FxMsUz6lC+Re+z
         xGDMf5+C7ZjkUny1OqG15U3u1AVB35pJtPz+FrdCQkDrWiFlRSbifZmMJ8JG6DCuKS5h
         9acMZ4mB1hgqJHB+Nx34/c7m+uqwcMeOejfUkAONfb217AC762Zp9fMw9Jpfaqwh+MZP
         vlLeu9HwPVntEYz9BlZEA0B5LnlWNhbVARbZT2hKGCOonGjZzUd5Mjwb3oM8js6rl8Xb
         6msg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700482393; x=1701087193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hc7Srsl8oO2HlJZxLPv8yK7GL1izzxy48y1+02c51Ts=;
        b=TYHsjVF7GSuCwjbRlLL7TqtgKX5zN3CCuXDQKsasmvXwF6BE00niUeYGQBlI5k4MTQ
         sPeABAsUux1Xr4M6To8DeR+QVGNwU1iae/8i8SNxKBhkYDZ2m6Lky8Vp4g+ptGYqskLZ
         3LxjdiDxDFzTiuYU9j0vRgu9wVH21pDzTnDKBmRY9Tc9NeR9hUN/DP0acdjz77yuwWy7
         pkf50ojpqVRXVc7pp/vfXp53fufB4wUfTXtMK96wDg+iYlk0K66ngrBXP+GtS5Los0if
         6z7v6Xi2eOClOrnbPA2j8RPqJbCs5ZSsbIppWRrMtNjbFTVBoW53X7i4qz4PGvIqDkGZ
         9MBw==
X-Gm-Message-State: AOJu0YwjYRtXjVQba5sWNzRJi3kfnTjsh7wnmhPsWeiC34JfWyh1xGgT
	m/eI6yH+Yuo5KvNXZlG8YJ5TOw==
X-Google-Smtp-Source: AGHT+IGw/4MA6a4F2ynhiVNpF2g4hzEzhrMsIOv0gcbFJUT46nhwK4WRybWUyxcnRwFshSqp3RC5UA==
X-Received: by 2002:aa7:c7cc:0:b0:548:e0e1:4a37 with SMTP id o12-20020aa7c7cc000000b00548e0e14a37mr517770eds.6.1700482392848;
        Mon, 20 Nov 2023 04:13:12 -0800 (PST)
Received: from [10.167.154.1] (178235187204.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.204])
        by smtp.gmail.com with ESMTPSA id i22-20020aa7c716000000b00548ac80f90csm1324584edq.40.2023.11.20.04.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 04:13:12 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 20 Nov 2023 13:12:54 +0100
Subject: [PATCH v2 3/4] arm64: dts: qcom: sc7280: Mark Adreno SMMU as DMA
 coherent
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-topic-a643-v2-3-06fa3d899c0a@linaro.org>
References: <20230926-topic-a643-v2-0-06fa3d899c0a@linaro.org>
In-Reply-To: <20230926-topic-a643-v2-0-06fa3d899c0a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, Rob Clark <robdclark@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700482383; l=799;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=05mrlbVuANlpTmTxHApROoZU1kjiSPRK0BLlIaRuxCY=;
 b=N7V3LfV39ASMH6JxhCBajFYvAbuJCyrK9fNCDfTK84S8uEkPk7JXxd/ojzzIXDuqIEsSYBu02
 my03rnSOGj3BWgra7wVYH42C6VvOO2cRT3XyDapRQaF6EMOK760EeZG
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The SMMUs on sc7280 are cache-coherent. APPS_SMMU is marked as such,
mark the GPU one as well.

Fixes: 96c471970b7b ("arm64: dts: qcom: sc7280: Add gpu support")
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index db47af668232..6964c14ffce5 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2787,6 +2787,7 @@ adreno_smmu: iommu@3da0000 {
 					"gpu_cc_hub_aon_clk";
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			dma-coherent;
 		};
 
 		remoteproc_mpss: remoteproc@4080000 {

-- 
2.42.1


