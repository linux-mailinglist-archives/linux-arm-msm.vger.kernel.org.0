Return-Path: <linux-arm-msm+bounces-19248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EBB8BCF6C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 15:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9225B288AD7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 13:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A393080632;
	Mon,  6 May 2024 13:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="FP5aLMyU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666227A705
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 May 2024 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715003313; cv=none; b=FfH/0ZPz+bQwWHzNvNakt6a3/K840f5cOSPR4jrp22J/49fXQLC1JAK/6vMyKBNKgl28GLxbRpRgwFGfgPztnkMUu1+yIrQHtSHvdwM7icER33eCqs0Seg9L3/vkjrVuuC6aZ1qNc/V31xGFqRMMOcoNwsBaPwMZyyICzZMx37Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715003313; c=relaxed/simple;
	bh=MPXbvZewmO/D2DEHW1XiJWvSM8CPq85XDTvUbnZY4DQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GaiwETsZG3+bADQUp3JGJfcUGHmDbmxWpip0RqNQfG3tFSQ7x+cWs31qioCPuV6S5uuAu9CnaKlOmCn5d/ivad5eK0sxf+vrDz4Lz+lHTeRxATLmvcXvQACSv6OvuQaZcPDtdsZslK+qMArnmx5p0XlloueUzi2M+w/cg2aH9CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=FP5aLMyU; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e0a34b2899so27163271fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 May 2024 06:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715003309; x=1715608109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QyXdN6gxvZfSyDlB/uI/J3a7zD0pJvSdTF4inS8BuAY=;
        b=FP5aLMyUebHboGynTcrqRWNgvYNAHe6WccQU3+6ga5YuOiHtLHeI/8BNxpHzqtPxjE
         F3tGgbbAyze0d1Vf3pxY4ODkUSwRSkdrMNt7kVFpFLepoToFE7z8VgddB3qd0EcpX1C/
         exVa1dxIYpEABg+jhIUYnvH2+NSXb2vadJsTyFJEvqs9t0+JvRSJS+CrdE5A6acXNQpf
         vElj/RgOBwmK3/vBgK4RX14IgsBI+H6r8MM/oelYh8GEoO+KOK6wbevNBzvMOOvtMq1F
         6G5tZypSujyM1RSIbqR/M6slrkdPPdKiIyZM2pvU8aBz2C6E+0uPHL/fSFoJAUia3QJD
         fF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715003309; x=1715608109;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QyXdN6gxvZfSyDlB/uI/J3a7zD0pJvSdTF4inS8BuAY=;
        b=mBp+kk5j7us5EAIC/fs/4ckOWMqPMhEKpSpIDTw9ljp9v0EoBEiPQw+iRKWJkrOx5a
         lS9KfgqpakLxs7yaqkk9AT5mf/wVR07chay72awoC1yILVbHVMtR8ePjZKwRasrk3nHe
         XyDlUP3qdZAjKwg6AkI4Ihe30J3fqJcaQX/yWAVPdAeREWWRonpYjk+ZrScDtmLNt7By
         uDNcUToLMvkPK2o+QDNe+U8BDsGzkInIpqX972Yj26MVNWH/HX0gAyi3Gvm0rRvwQd0O
         x/oQu+plQpzTVoHDqucNLSowu4OuzLhHlPKptE1gt7WHqwJojqSSVbanJDiH31W2/2sH
         vpmg==
X-Gm-Message-State: AOJu0Yy0RHTaYqXLkm4vbK6YixJlzL/1kN9wKiyHDENFvVnO2cA7lEuE
	yrusg0/HelrVD6wywpPYR8097ripzUznalFCx6yMBOOvOoulHUIP6E/VQwF02d8=
X-Google-Smtp-Source: AGHT+IEalc1xHQQV1lP6Ojgfs0WPNcHeEAEZZRYOqpD+rd2saelIZkJRzrjQzJzjZ4NoHZwjp0FoNQ==
X-Received: by 2002:a2e:a488:0:b0:2e0:4216:6fa8 with SMTP id h8-20020a2ea488000000b002e042166fa8mr8960460lji.39.1715003309480;
        Mon, 06 May 2024 06:48:29 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id je8-20020a05600c1f8800b0041bf28aa11dsm16131973wmb.42.2024.05.06.06.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 06:48:29 -0700 (PDT)
Message-ID: <c24f14d4-c996-4150-99ce-66a5c4409dcf@freebox.fr>
Date: Mon, 6 May 2024 15:46:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/3] arm64: dts: qcom: msm8998: add venus node
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
References: <72860c1d-7434-4be6-8c1d-9ea177602802@freebox.fr>
Content-Language: en-US
In-Reply-To: <72860c1d-7434-4be6-8c1d-9ea177602802@freebox.fr>
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


