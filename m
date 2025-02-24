Return-Path: <linux-arm-msm+bounces-49183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A855A425CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 16:13:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF3983B1DAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 15:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC2F194A75;
	Mon, 24 Feb 2025 15:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VJfNoUym"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBC7189BBB
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 15:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740409284; cv=none; b=iH75sgM04OrAjYKhGPob1umHZSkTDyiXwW6RU4HrrURWsyo9Xgl9i3Be5NNumbCx+DzROoRF4u6G7JmaH8nP7IaGIEbHdnRotNoTaE3FezSyqs2zYjKX5sI1JluBqHPpktYvs/Y5+JF87SeZzbiSxzXxX3yITHBHW2hYHJvcN5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740409284; c=relaxed/simple;
	bh=e+fGuFYihqFYKDT1VXWhmaDTiPW7MSXQnExkELgZB6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6b5mzdHAMxKPHHBQayESEwHrHeivL5/Z++Fs6gyR/AP+TILvq71ZGG+RYBsTtRfnt73x9orPCkMaDN6X89dHEebLOuJZuCQtT94xgK6gxoeMosh3eAmioOuDtKnQ3j4/vbiYhTIopm8qADBhXPXJ+z3Fx9mXYqBwiqPHp/+mNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VJfNoUym; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43948021a45so39521635e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 07:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740409279; x=1741014079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zO1QOaq79Jegtn1MMv2Nhkvx1JoPb9ukrAV5cHqtoJE=;
        b=VJfNoUym/jxU9++z6JczaRxwt/hiuS8RTWEHMH6PcA9W+j9/usBHvEftu8zlGV03+C
         P/Gd9taEiBjMGRkGxueuyJ9oM8njL9NsqnZxZS4j1UbRZuBzZZIbSid5oZ+suBjp8reu
         E1mWhDoOzbQnf/jzfejHhh3RXk0piUzR64JCrg4SD8e6wZ4Js5h7LqRN8lHc4g+kleUh
         xhi4FJ6xKv7ZkyDn7BCSBNphFzVT6WehM9v9K8j3+A3VZCz2gZPiNKXwuf785kCPS48i
         6zkzyD7RIsFpAyaSr9T5yBiX4Ly9E0yFmQnjxrh/Wl5jZXrECrg1qHo2Lzh/nrsybCph
         Uq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740409279; x=1741014079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zO1QOaq79Jegtn1MMv2Nhkvx1JoPb9ukrAV5cHqtoJE=;
        b=MPKYGbo3S5E2JtoP3BKRG4iceKthI6yUXVI720+zmahw4VE3+PKN35exyFkfza+Kxp
         4k1A2LgEC0rzJEu0bye/sI5JKAOF7TOGR1rVqajuPeWqx5z/we30mHWFEGTL/M8t39sr
         B4LQIHgXUTZLj4Kv3Lpuzc5VBNmjNZEc4YgZmoJjZD/TWQd+lRNB9DGnkt1EdrlzSOCt
         LozHj5B950vhAZavZrOPRCh6QnQoMtsxr4MNKOThV9Ub8xsJYL8amZH6RQe+ylRZFMZ9
         KghlC5QDfPPhC6i+dI+mz+1sL9t738DUmpAQbu5tKAKBDu1hFlb285IEl3/LIqiv9mWp
         bcvg==
X-Forwarded-Encrypted: i=1; AJvYcCXsXQS262Kb60XZa3u7L7b7pShr/8K+f4W4DCVbDHqEKpHDKYS5H+Yz765+JBgYwHP3yEFymse2p5t3Di4r@vger.kernel.org
X-Gm-Message-State: AOJu0YzbNviF8ck6RwIGe110O86gaX9RsEeTzZnIqkEe/JtIMFx/M4hg
	kltbnsOTTSagYla0hfRcqNd19qr+PYrj7bNUaRvsEO6DAogviHpS9EESPfmaQUo=
X-Gm-Gg: ASbGncu3E3HD8IhfhHpHBW05DToXiAhgDXHncaFy4iJk2J8tm/D85c6tTUrmdIm1l0v
	OXnc7htGoVofdHmnTiUfNQdssqCfM69VizJtnEOMjzMpo4jwFjhkcUCbI66NkzN+DelXKvjzsgZ
	Ex9HgOs1MzPhfeOgSu/EaLhoHw0H34XppSkONhpnJG8JZWbwxx59+ELKoi4pAO3cnCXk4GclTl6
	QAv1cqkRnuSZje3HWZ6QHg+sDfonTDZyqVO+AdNTbfHSxxSZoDQ7/eKu4Fs+tXo0OC2VFiCm09K
	tCh+iZc7aC7pmSoeOaHJgA6CzidqwphNRvWYXQ==
X-Google-Smtp-Source: AGHT+IHy32IsayllVzcL5y6Hco/yU7QMFhwvQV+h4VDJSb2zJULlU9qCiE/moLz0IrzCr+zonZR92A==
X-Received: by 2002:a05:6000:144f:b0:38d:bec9:c8d with SMTP id ffacd0b85a97d-38f6f0c6be9mr13502818f8f.53.1740409279076;
        Mon, 24 Feb 2025 07:01:19 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:dba4:b92e:251f:5bd3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b434fsm32352273f8f.16.2025.02.24.07.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 07:01:18 -0800 (PST)
Date: Mon, 24 Feb 2025 16:01:11 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100: Add crypto engine
Message-ID: <Z7yJt4ARAM39F9b6@linaro.org>
References: <20250221-x1e80100-crypto-v2-1-413ecf68dcd7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-x1e80100-crypto-v2-1-413ecf68dcd7@linaro.org>

On Fri, Feb 21, 2025 at 03:07:03PM +0200, Abel Vesa wrote:
> On X Elite, there is a crypto engine IP block similar to ones found on
> SM8x50 platforms.
> 
> Describe the crypto engine and its BAM.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> The dt-binding schema update for the x1e80100 compatible is here
> (already picked up):
> 
> https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
> ---
> Changes in v2:
> - Added EE and channels numbers in BAM node, like Stephan suggested.
> - Added v1.7.4 compatible as well.
> - Link to v1: https://lore.kernel.org/r/20250213-x1e80100-crypto-v1-1-f93afdd4025a@linaro.org
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 9d38436763432892ceef95daf0335d4cf446357c..71d5f5eed4511030a51fb12e453f603d294080cc 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3708,6 +3708,38 @@ pcie4_phy: phy@1c0e000 {
>  			status = "disabled";
>  		};
>  
> +		cryptobam: dma-controller@1dc4000 {
> +			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> +			reg = <0 0x01dc4000 0 0x28000>;
> +
> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			#dma-cells = <1>;
> +
> +			iommus = <&apps_smmu 0x480 0>,
> +				 <&apps_smmu 0x481 0>;
> +
> +			qcom,ee = <0>;
> +			qcom,num-ees = <7>;
> +			num-channels = <30>;

Hm, the hardware registers report the same as SM8550 on my X1E CRD:

			qcom,num-ees = <4>;
			num-channels = <20>;

[   17.679161] bam-dma-engine 1dc4000.dma-controller: bam_init() ees 4
[   17.679163] bam-dma-engine 1dc4000.dma-controller: bam_init() num-channels 20
[   17.679164] ------------[ cut here ]------------
[   17.679165] bam-dma-engine 1dc4000.dma-controller: DT specifies num-channels = <30>, but hardware reports 20. Please fix the device tree!
[   17.679175] WARNING: CPU: 5 PID: 121 at drivers/dma/qcom/bam_dma.c:498 bam_init+0x10c/0x150 [bam_dma]

(You don't have this warning yet, it's part of an upcoming bam_dma patch
 series from me that will start validating the num-channels given in the
 device tree.)

> +			qcom,controlled-remotely;
> +		};
> +
> +		crypto: crypto@1dfa000 {
> +			compatible = "qcom,x1e80100-qce", "qcom,sm8150-qce", "qcom,qce";
> +			reg = <0 0x01dfa000 0 0x6000>;
> +
> +			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "memory";
> +
> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> +			dma-names = "rx", "tx";
> +
> +			iommus = <&apps_smmu 0x480 0>,
> +				 <&apps_smmu 0x481 0>;

iommus = <&apps_smmu 0x480 0x1> seems to work fine for me, can you try
again? Not sure if this is related, but make sure to apply

https://lore.kernel.org/linux-arm-msm/20250208223112.142567-1-caleb.connolly@linaro.org/

since that can easily cause crashes for bam_dma. I added this diff for
testing and it's working fine so far:

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index afb8bd3b6a94..bac3d6a38055 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3732,8 +3732,7 @@ cryptobam: dma-controller@1dc4000 {
 
 			#dma-cells = <1>;
 
-			iommus = <&apps_smmu 0x480 0>,
-				 <&apps_smmu 0x481 0>;
+			iommus = <&apps_smmu 0x480 0x1>;
 
 			qcom,ee = <0>;
 			qcom,num-ees = <4>;
@@ -3752,8 +3751,7 @@ crypto: crypto@1dfa000 {
 			dmas = <&cryptobam 4>, <&cryptobam 5>;
 			dma-names = "rx", "tx";
 
-			iommus = <&apps_smmu 0x480 0>,
-				 <&apps_smmu 0x481 0>;
+			iommus = <&apps_smmu 0x480 0x1>;
 		};
 
 		tcsr_mutex: hwlock@1f40000 {

Thanks,
Stephan

