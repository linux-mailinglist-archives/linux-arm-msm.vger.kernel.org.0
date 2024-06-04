Return-Path: <linux-arm-msm+bounces-21652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 244E88FB967
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 18:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55AD11C22132
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 16:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802B5149018;
	Tue,  4 Jun 2024 16:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="DQEezx71"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8363114882D
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 16:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717519571; cv=none; b=aKPU4Fmf4pWmrLgvPdazv0n6ZXI7cmHOKFJuogANgbRMU9aUzUSoJ35Olw9LmK1DUmmL3zaX2y2yTpVpXv+ppApB8vr5o9eDAUHkCbwMw5i1WH5Q92puMzDnuYct4p42LfivVPenW9eoH/jMPZfkePSzZzGn+P1V+u9u4yM4Uc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717519571; c=relaxed/simple;
	bh=qZsLucO4wltDzOvpnEVOiiPXz0qeTCCoPH/9/Nt9vP8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FuQ+NFBfwNmhGdBl/6xvYPwVPa4Mj7SpVTkuYgznIeH93GaNmtkopKLbIUdjktRlwR2f4ZWGbpUTB6eeSxqSE40K4CNOeAD7VbCzbsG9XsUPq/3NOKZ/J1F6eGSx5cDRJFR75MVXhHlotOcABaH81oFxmvbjWPBsPp/KAu4hewg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=DQEezx71; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-354f14bd80cso1007596f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 09:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717519568; x=1718124368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m4aOTDhd6SYPECUR44Sp9t/2nUToF1TX06udRYmdYOk=;
        b=DQEezx71fjuPAjLBupTmCaVLPNZts3iGCwAsFuOZfpkD/Mc/XGWwvDPrqO+unZcAMd
         xqPQZdE/8G55g3NraeEsfX0t9g4u1mjc4pnudpV+EWHaMIAmSbzvvwXN0dIaMw0vjXaf
         ovr/svLSorZv7dID5O+EF3foEh7cRFYSAjWtFq0Yv0ZqwDxCDmXoYugZrll/wozarXO7
         0KdyZ33Moo92gtzwWp6U4FT8q2Gj4yKmy5dIKjaqvyE+CQLoxNesC1yWR97q2ww+4r2b
         kE3yPC0hnMvjBcmubRdPjGR52Dc8XsJRAVgYbTAEEkPop/mT/tJqW91xPB0PrKKwK8q2
         4lGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717519568; x=1718124368;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m4aOTDhd6SYPECUR44Sp9t/2nUToF1TX06udRYmdYOk=;
        b=TEN86e43b2dy5ISEW4YYSfEGsWR83bGpD4c8uuL6v62GhFm06W+AkLbDfHvowD+Zlj
         Tnhqp6Wwkyt7Oey2gGVaM4ePzaao7RYEaVhxFg8S7nL/EWww36TH9cWdTd0Hn9cWUfs0
         1j4tdoVV2N887QI7RA2cSeWGTu4qQR800Dpasvbvbg5PBIp6jXOr6NmEWQfsnlexTC45
         s7rlg21V8nKI0zwDEzpRGKVTp/Rm4aw/sPog7o/HZtkf8TZAq4YJ7BYiRn8n6BDmaPI3
         o+q3dxWky2d4cOWg6/1yVIOHxZLIY+shxzx/hd8U4iGgEO+RxF/yelAe1ehBWS3pJ/9E
         S8/A==
X-Gm-Message-State: AOJu0Yx/LproSNPoNeFbpYtz2pe7EBAqEG/hlb1XM7SR18Ivg+m5zGld
	+jkWpgunhWzBPnSqsAq3eD7qhEa3adF2RmatdL5+TDlxUb1WR8DK7wOkxSbdMpU=
X-Google-Smtp-Source: AGHT+IHfGuqUXGBWWo8WiHE0hJOslHvsN+h+FU1a0TC4FSJOpeGMJjMByciPhc79OYAM01Hk52ip1w==
X-Received: by 2002:adf:f58e:0:b0:35b:5a14:984a with SMTP id ffacd0b85a97d-35e0f30c7d4mr9621006f8f.56.1717519567901;
        Tue, 04 Jun 2024 09:46:07 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c090esm12634482f8f.6.2024.06.04.09.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 09:46:07 -0700 (PDT)
Message-ID: <6d86a6a3-4d99-4fda-9a38-7688587237e6@freebox.fr>
Date: Tue, 4 Jun 2024 18:44:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 3/3] arm64: dts: qcom: msm8998: add venus node
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>
References: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
Content-Language: en-US
In-Reply-To: <8b2705b7-f33c-4ebe-a6a8-c5ef776fe9ad@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From: Pierre-Hugues Husson <phhusson@freebox.fr>

Now that the venus clocks are fixed, we can add the DT node.

Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 6e286f91241be..f65a76da61ea8 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3145,6 +3145,54 @@ hdmi_phy: hdmi-phy@c9a0600 {
 			};
 		};
 
+		venus: video-codec@cc00000 {
+			compatible = "qcom,msm8998-venus";
+			reg = <0x0cc00000 0xff000>;
+			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&mmcc VIDEO_TOP_GDSC>;
+			clocks = <&mmcc VIDEO_CORE_CLK>,
+				 <&mmcc VIDEO_AHB_CLK>,
+				 <&mmcc VIDEO_AXI_CLK>,
+				 <&mmcc VIDEO_MAXI_CLK>;
+			clock-names = "core", "iface", "bus", "mbus";
+			iommus = <&mmss_smmu 0x400>,
+				 <&mmss_smmu 0x401>,
+				 <&mmss_smmu 0x40a>,
+				 <&mmss_smmu 0x407>,
+				 <&mmss_smmu 0x40e>,
+				 <&mmss_smmu 0x40f>,
+				 <&mmss_smmu 0x408>,
+				 <&mmss_smmu 0x409>,
+				 <&mmss_smmu 0x40b>,
+				 <&mmss_smmu 0x40c>,
+				 <&mmss_smmu 0x40d>,
+				 <&mmss_smmu 0x410>,
+				 <&mmss_smmu 0x421>,
+				 <&mmss_smmu 0x428>,
+				 <&mmss_smmu 0x429>,
+				 <&mmss_smmu 0x42b>,
+				 <&mmss_smmu 0x42c>,
+				 <&mmss_smmu 0x42d>,
+				 <&mmss_smmu 0x411>,
+				 <&mmss_smmu 0x431>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+
+			video-decoder {
+				compatible = "venus-decoder";
+				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;
+				clock-names = "core";
+				power-domains = <&mmcc VIDEO_SUBCORE0_GDSC>;
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+				clocks = <&mmcc VIDEO_SUBCORE1_CLK>;
+				clock-names = "core";
+				power-domains = <&mmcc VIDEO_SUBCORE1_GDSC>;
+			};
+		};
+
 		mmss_smmu: iommu@cd00000 {
 			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
 			reg = <0x0cd00000 0x40000>;
-- 
2.34.1


