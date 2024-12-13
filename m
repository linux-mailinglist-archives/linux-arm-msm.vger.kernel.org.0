Return-Path: <linux-arm-msm+bounces-42064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6583B9F100A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:59:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 212C328208F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 14:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17AEF1F4E53;
	Fri, 13 Dec 2024 14:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bc9a/hKD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4639B1F4E39
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734101704; cv=none; b=Mr6Eb7jx/+EGSXZHqDO0N5XiBfz8klIb8aqcUUlk5q/H0leYQadM9nPTqqU/bC9lAIFLdleg+oSYDZJiPGhHUwDRwjCiXN0TbnV7x5aUc89E5Mc6eBK6zdEETbl//zpwwbAvrywZ/FhyIqHyLHHD9d1oYOc4NKr43Am89Vdz/vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734101704; c=relaxed/simple;
	bh=btFJAKLRpjAbwRO13C2RFWSubPCt1TUEVwik5JGJNfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wygjvkofep5O6tWmD8Cmv4wDamfCKfjnQvvy/v8he2ufhxZjdsGa97pBhiVef4TwPDB3BEAUgR32tCaTx4RtsocLxZsGJZvdtEQkYKtybHrqocyYlutsUgGLlEbN5SVipCqYx8YY2zHOOqwNdALz5QCABwT5IzLMEYg2THD7UC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bc9a/hKD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361f09be37so2071955e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 06:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734101701; x=1734706501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3joqArWq8Xo0bUXq2TH4e58G2D5QNG6LG17sSDpr+L4=;
        b=bc9a/hKDmzrY+IXueRDTfse1GtoDgm9OIJcp1MsndTzkL+j2nvaQ6v5ZW+S+dzX4gG
         xUN56/TGVLcfjZh0L2LgXfQ3dmJPbiDS//UCGfZ8rForxSipIClKY1tmsZ5X2GHKQokR
         /5+mYC7/DM/y7INGNWHtQX9oVvDoAlAuVm+AjjCaRgxCNbIJE8dxBYGwHB5fQiAJNoaH
         wvFd3gw4AKb4yKhy8VNjlzO3bQ9Q9zIq78kC6Jl0bznWrmhGXpN8w2ES2ZXGpLiiRBL2
         2sh/CylosFaxZMyo3XG0WrJ5xcW0uA2bb7c25RfVHWCHIGb+G2qS1PmQNJScybfmkqJd
         vLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734101701; x=1734706501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3joqArWq8Xo0bUXq2TH4e58G2D5QNG6LG17sSDpr+L4=;
        b=TK+A2K/FDasANFhQuc5j6dn8m6jHDTLludZ4Ov2g+ue6TD3+RaDUWdmzMRFhv0Xh4S
         7eaeuA2tlC2ichRE/oc8eXu7E8d3X2vAfHMZZXHvU6ZkCV8h2CcShifICmADcEZTTjRF
         8HKX4r0u4CiiBcuINXbdaWW6CtHFTRiWPZ0qcPhw42BKgUXzAUD+579kn+hbm+NjkoUo
         cmuOWKX/g2hGNahV2gS7tabLZmtcK4ZF3mifr1o6AYnqiC3EFb3tCIDzc0Lujbix0MjU
         Bl7B5qzqqDq+Fc3zigzYfwl7KHToHpBQt5fFmGIQrmLoPXqiUHRhdZSLs5ocHEN15ymM
         JIdw==
X-Gm-Message-State: AOJu0YyV/VvSV/fh/T7b2pGH5wbyhEGyraizLwnVWiIINpQ0o/QXTPbR
	onoa95pOnYfJbVUrz7rxbqe2FCHPaeWt6DTaeS4j/rjtcSfp3xrE0R9Dk1quGi4=
X-Gm-Gg: ASbGncu17hxEkIgOae4Kza/Su7eKvYSgyR9Zf2cy1WfjPQclu/jbEGRUyG41Cv3PQpD
	XvNCpGGmHbzk6e4UIKHV/CjiLb3MyFDeJqw3TwTQhJ1Rkx9GlCgX7N0pfumbHEG0PLaGbpbYcJD
	QCx+CLWdFg4boB4rDQY2gybxxD4Evf9M1YfNyN/tH+usKkzEBnhhXvesFuTfk1w5SCzn3wUQ0GW
	HPTGecF8BYQSAe5bS7k0/0ncLWL/LqEir9R6fzJKI9ZzvZifUw5DGcm2DGlVV1ZIH+GxSvO
X-Google-Smtp-Source: AGHT+IGktHKSCT0/oB7TdaTtItEMuQ9ENjK+o1VpLL3HPmQ+jQAUEgWvpC4FVpOl83eBSFYkFkteUw==
X-Received: by 2002:a05:600c:190b:b0:434:f1d5:144a with SMTP id 5b1f17b1804b1-4362a996bb0mr9288285e9.0.1734101700656;
        Fri, 13 Dec 2024 06:55:00 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436256b42c8sm51547305e9.29.2024.12.13.06.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 06:55:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 13 Dec 2024 15:54:12 +0100
Subject: [PATCH v3 23/23] arm64: dts: qcom: sm6115: Fix ADSP memory base
 and length
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-dts-qcom-cdsp-mpss-base-address-v3-23-2e0036fccd8d@linaro.org>
References: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
In-Reply-To: <20241213-dts-qcom-cdsp-mpss-base-address-v3-0-2e0036fccd8d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=btFJAKLRpjAbwRO13C2RFWSubPCt1TUEVwik5JGJNfA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnXEqbINGZnMb1v1KDLbjoOCnX+GbVHVNXy5mA4
 WDf6tWsJfOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1xKmwAKCRDBN2bmhouD
 17PFD/4wDPVn9DwgACTp1CKbltZWBU2vDSSj4msZ9x6VJSIuK4O9FcxB/nwzVo2Ds4eej5EibWV
 6K1tmQh7CCeQfm27kvODPLfQYf2VXv2myyPHOszp/dOcJ4uOEkpJKSdtviHsrBgyFUHnnfNCS8X
 2tf6WsWhs4hASTsnNmKXwHKRA663W+7V2K6yK/fkKM7d5+qWz8ypLa7fwtH3zLesPu1u9OrmaYn
 n/2tzZqwogBs+ZOEnETbMtXwBC3jKmE1wGrrO1BSn4Ikdz4l1m8o/kOjO4rniLUb+Ait81kHaCJ
 US+LUhgLpTxVo58fL6b4PzvZ1gjwgqkr8NAjssBB4qx8Qhq3s5Z59UrtHLPGVgLK6XklyS0Oq82
 rENzyVOMyFdHh0EhMg2WyzD3vzLWpamOPBCuhK9HhpQ8gDvsV21UMYq4ijttDtsTJXnoTlHvFw8
 JHKRkbeizqDr9NjLhA1CFRCfiX0JmlNLp9f6Or6sgTMd3nIKpdXY8hv8f64NwYsePApXkRacaTD
 tJUMCUPcJ750CgDypxyjyLPa933SYUuU5rLWqNNT3/pk+Uf2ZH/tCXJzlL+ORTl5EzWKjREcMDA
 KgX2AY7YDuKeq1b5O+AOkTSeOelMlWBAfNIE+URqC8K2fomqBL0sNV7zoF4SmFtQxAu/EhtuMmQ
 TTKTRNdQUm8MKiw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The address space in ADSP PAS (Peripheral Authentication Service)
remoteproc node should point to the QDSP PUB address space
(QDSP6...SS_PUB): 0x0a40_0000 with length of 0x4040.

0x0ab0_0000, value used so far, is the SSC_QUPV3 block, so entierly
unrelated.

Correct the base address and length, which should have no functional
impact on Linux users, because PAS loader does not use this address
space at all.

Cc: stable@vger.kernel.org
Fixes: 96ce9227fdbc ("arm64: dts: qcom: sm6115: Add remoteproc nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
New patch
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 5af2c7a3f6ff67c216f1c817a3d5f54e10b65450..7016843c2ca560e93dcb7e3a6da7025cb001eef0 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -2670,9 +2670,9 @@ funnel_apss1_in: endpoint {
 			};
 		};
 
-		remoteproc_adsp: remoteproc@ab00000 {
+		remoteproc_adsp: remoteproc@a400000 {
 			compatible = "qcom,sm6115-adsp-pas";
-			reg = <0x0 0x0ab00000 0x0 0x100>;
+			reg = <0x0 0x0a400000 0x0 0x4040>;
 
 			interrupts-extended = <&intc GIC_SPI 282 IRQ_TYPE_EDGE_RISING>,
 					      <&adsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,

-- 
2.43.0


