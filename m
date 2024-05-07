Return-Path: <linux-arm-msm+bounces-19302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4133F8BDE49
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 11:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 647281C21FB0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 09:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F5F14F104;
	Tue,  7 May 2024 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="YhAQC/GN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF58314D70F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 09:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715074291; cv=none; b=FHFA+FptY3AgS9QbkEkidS0eBEUp0P/JPZRWQuP0xI+gzRLAox9D0cyPP9pmMN1NnCcFxmQ+jvrk+a3Eurq+AugAUFZ0E45C3mNu0KB/xLulJ4eznociws1AUDcGYSQpsMnqlupuEmR73KKgjrCTwqcUKksrGxgU9oEZDqGebWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715074291; c=relaxed/simple;
	bh=MPXbvZewmO/D2DEHW1XiJWvSM8CPq85XDTvUbnZY4DQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YJjceGYrwxxF2ifkge6VR14Zlmvd+R8zXA36BrXf9uIrNscukUdDnuLtTW91Wsogfuw8ttear8eEqmaI6C0cwzxhmGcACdmDnFXJX+5oLji3gC+bfeyCd0XzJII38I95Oi9O2q0nTbArHb7M7Bx1n9/XKSzM+eOxclZphZ9xSLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=YhAQC/GN; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-34da84cb755so2335032f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 02:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715074279; x=1715679079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QyXdN6gxvZfSyDlB/uI/J3a7zD0pJvSdTF4inS8BuAY=;
        b=YhAQC/GN/jW5NaNLPJclFChPJC1mz06ncdQPUfv2SirY3NZoGnANlCoIJzr4f9xwK3
         vKl4SFM/my9Eta98ihtW+3lpeMFkRHCkT2IiggLgpwwzFV1edIi9yx8j1KvM4iNU3+4R
         1Le9yuaXUCgYySwsq2nF2FkgJNIyv8lJAgixWXXf+X+sXHFD7W7c1EKN7xwWzJVz5BhL
         tZ/w3Ep8CWQ22/6nCgiEVGShRKCwGPVxGG07SPpxZRkzKdiOQYl/ek9nyWKB4/SaoElj
         9Awovj7eKEMGt8mndhythXC+V1169yvUZGgW99DFiUEfDGZdsUp0U+NZZD76c/hK4Dgp
         /dOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715074279; x=1715679079;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QyXdN6gxvZfSyDlB/uI/J3a7zD0pJvSdTF4inS8BuAY=;
        b=EhGkWc22iY5RGefTdnIZ2ay4nwuNEH85mIiWB5/ULXkOEx80tY1nxEeJCsWAArLWGp
         QGv++8lfrwCtm6eNxNPS1NTB3zyUqh4LXdwAtWSg0evgxPrTkh7c2TsZfAx+KI3yTWFn
         pH5aJlH937k698C3LAEAofgIxRrIYBKQDhhf5UZKW2e0LG9TDjunVlnv56jpMFdlkhpZ
         QgG5alVG/aFD/eobESW8+P1Nvsr1YldJsMcpnzwSKsOObEvzs9QRk30mOHMTPrLB4ClE
         L7sHYCded70GIA66AHhbC0jK3Z7Wx7Xh10fVA138PQYh2lz1Ie28C+3P44QIAd1u+dDg
         dkwQ==
X-Gm-Message-State: AOJu0YxO3BjN0ikiV1uUK+T2zWwuZR4zvSAQ825qJnkWxV1OWk6kVbLC
	aIH2WPec9ryQmB+pqqqanWI18SxGMFxCxf/CfHEHOtwbnxKcCzfU3J8VXbqpu6s=
X-Google-Smtp-Source: AGHT+IEbF4B96xPtnD9KzivYdLyGQTnX3z26aVSw5JySkazStzElYqb1R7jUdZoog7s+4m3fqc2E/Q==
X-Received: by 2002:adf:ed8e:0:b0:34c:925d:fa77 with SMTP id c14-20020adfed8e000000b0034c925dfa77mr7102080wro.41.1715074279714;
        Tue, 07 May 2024 02:31:19 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id f3-20020adfb603000000b0034dced2c5bdsm12517710wre.80.2024.05.07.02.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 02:31:19 -0700 (PDT)
Message-ID: <c2fca6c7-2421-42b4-a43d-68b251daf9b4@freebox.fr>
Date: Tue, 7 May 2024 11:29:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 2/3] arm64: dts: qcom: msm8998: add venus node
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <1cf08b56-a247-431b-a24b-69f563f49240@freebox.fr>
Content-Language: en-US
In-Reply-To: <1cf08b56-a247-431b-a24b-69f563f49240@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From: Pierre-Hugues Husson <phhusson@freebox.fr>

Now that the venus clocks are fixed, we can add the DT node.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 5f5b90a6e2bf1..3d3b1f61c0690 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3010,6 +3010,54 @@ mdss_dsi1_phy: phy@c996400 {
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


