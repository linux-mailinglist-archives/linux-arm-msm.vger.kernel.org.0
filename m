Return-Path: <linux-arm-msm+bounces-1135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 460A87F12EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 13:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77ED41C2173B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 12:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7FF219459;
	Mon, 20 Nov 2023 12:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ICP2DQGQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC9FCD2
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 04:13:11 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5437d60fb7aso6255062a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 04:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700482390; x=1701087190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQ0ypSe1N8mypAau3OPEaXjK2/eDjD7aM7p9a0KkeYY=;
        b=ICP2DQGQDKXDfqZ+6Jqsi9twBZXRpaNMVW1c7+kAnQe5JDVHmpoyAUf45HV598eCRA
         oaQYdc9Kh8f0CbGhb3ch2ZgvTmOTSIqPPjH8zJ+rEoBBDWdJpkJx8MM3gU34NYCKwjZ4
         FVWDGGl8CkwRhD/rzVsQ9In/r+hNFnmq2f90U2QqCo9nzh9siGao93+/siXMDFhuL3r9
         WdMA9QvsvY2C+0eeuYR7/+hJ+Vvj7BYIj75NKFoOJyjUzTjOWpBCDgnV6MLXvpge5EXv
         H6v3AKQA+92jEHCAxDHOKs3bZeG+t3M0Lf44ZVwIlWtGU4qYOhFk988On8BBQ6nRLnwb
         8W+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700482390; x=1701087190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQ0ypSe1N8mypAau3OPEaXjK2/eDjD7aM7p9a0KkeYY=;
        b=MIJCe+Am6QFFI0aCRfw2J8a0AVBltT/1BbiVRxwFKoCq03qubD9+LZvJ1VwxMpQXi+
         e0eruG8kCmwi+vRPLoos/y2MzAzUIbhC+WEYtAetR3pLAHYcxcJ8axpH5ZLmi7xOCX12
         4eBD2buConLJJWoTrJQ/mXfc9flatCMWYdxtScYplpjBAAUuFS+f2nt7hsbLPCLqVZEP
         +DfrluACqRiEcN+hBljvZG7GrWZSRD75Kl1Orc7e5yGCIglQIeLiBxvbPtruSpG3wyj/
         uxsAXbX7/94SNU//5YopLncCM86Vk8yMpJlZuxCy5bMM9iCOPBS5hiVkJhpafOlCeFId
         ZbnQ==
X-Gm-Message-State: AOJu0Ywaa0IYj01Y9Q4/a/jDTMexlMN8AhRS5HatLcfPeUbAoeFe1ZSP
	a0eT/cwwuBnlNIDQ71rjdM82rQ==
X-Google-Smtp-Source: AGHT+IHgHEWqlDlsQXQAl07jhTuaRXFLhW6gDO2Rl+xkYrooOqkwo/D69PwFKDS16PgzgicY1iZj2Q==
X-Received: by 2002:aa7:d795:0:b0:53e:29c1:ae1f with SMTP id s21-20020aa7d795000000b0053e29c1ae1fmr6220141edq.19.1700482390140;
        Mon, 20 Nov 2023 04:13:10 -0800 (PST)
Received: from [10.167.154.1] (178235187204.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.204])
        by smtp.gmail.com with ESMTPSA id i22-20020aa7c716000000b00548ac80f90csm1324584edq.40.2023.11.20.04.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 04:13:09 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 20 Nov 2023 13:12:53 +0100
Subject: [PATCH v2 2/4] arm64: dts: qcom: sc7280: Fix up GPU SIDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-topic-a643-v2-2-06fa3d899c0a@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700482383; l=1308;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=N2IVhDhpEh9zFeokJPv6QBy10GmMVdulaG7b6AuvP+g=;
 b=uG783dcu48EoyZtmTibdT6s18RnNyLq6HJ4ZSeg0kSXPAOezOy5rAXKriMyErZZssZNCUWxWR
 adKpfYAOfdWARCJg24F0tWOT8i81Lrg67x10qpdZ8oWQW/Nxp+Eihif
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

GPU_SMMU SID 1 is meant for Adreno LPAC (Low Priority Async Compute).
On platforms that support it (in firmware), it is necessary to
describe that link, or Adreno register access will hang the board.

The current settings are functionally identical, *but* due to what is
likely hardcoded security policies, the secure firmware rejects them,
resulting in the board hanging. To avoid that, alter the settings such
that SID 0 and 1 are described separately.

Fixes: 96c471970b7b ("arm64: dts: qcom: sc7280: Add gpu support")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 58563f8fdc16..db47af668232 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2608,7 +2608,8 @@ gpu: gpu@3d00000 {
 				    "cx_mem",
 				    "cx_dbgc";
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
-			iommus = <&adreno_smmu 0 0x401>;
+			iommus = <&adreno_smmu 0 0x400>,
+				 <&adreno_smmu 1 0x400>;
 			operating-points-v2 = <&gpu_opp_table>;
 			qcom,gmu = <&gmu>;
 			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;

-- 
2.42.1


