Return-Path: <linux-arm-msm+bounces-47898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C33DA3401F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 14:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F3223AADDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 13:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED7F22173B;
	Thu, 13 Feb 2025 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fO/1QNBH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3188B22173D
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 13:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739452699; cv=none; b=k4HDAPMGAQxUoPV0s6A/3U3/VWGrynscU4WaS4iiVPahYWMK2SQ9YGWcVHBbv2GMAUeaXIEu0s9utNKKsoT8yJQIgbqdgBJeok77qAZfozbuq3VKJ8sR999dzezhoSZl5WnGPxWJZAGs90xy89rA0RMV5nI/Io8fz85Zc2qlBEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739452699; c=relaxed/simple;
	bh=VYOekO3BhgmyJ2mRkTHWmdQc7mvwMTx6VCsRCmwif3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhmvphR/P6gNnA7jtREZxSQ75jPtfZml4KTDdV7Ch6k9mCLHQKnEdUusI3MU+p1uOrHTeI4RzF+4CbTlsidkw2/N+N22dmrZvodk0q9ivOBnyICDvXlVDxcECoWVdCpauZUbDYXXv47IjXt7V9qEAqHeIefoxevFG13StMqYXlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fO/1QNBH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4395578be70so9074785e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 05:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739452694; x=1740057494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FWhe4fmPRfS/OuuLJyzpwpMFHkOJTb48vA//XF7nq9c=;
        b=fO/1QNBHYu64PUCvliYqzbVO+9vtspSOPymDC4RZwvxk/2ngkxyt5z/MoPfpV139eI
         zBQlLsTYrhcv8XMHQAmkiU99JE1zT5Mo50pPcGqjgESyrsiMlktaNGpV2nhplgQgbfQ6
         iI86K7iDM7vTw+OdMbKFmhDgEotvTfWKdLdyjmJP/UHvK55rR972ko/q5KTIrZjR9LGG
         mX6fgBsPbSxLlD7LOBwzJRLO1bohK1OmQGtWgQpQla0NDzEAk3RxqSmZ2OkHCQKGk1LQ
         i1m8xcrKRAT8+TDAzpevtzzsZWZX2RkbTlKggZoJEfOp99QW169iFBsTLd+JBm9nrjqk
         LE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739452694; x=1740057494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWhe4fmPRfS/OuuLJyzpwpMFHkOJTb48vA//XF7nq9c=;
        b=xAPZ4KmqXfA8meE0eDTqwAxCSVxj8GErbEYTHWTtTUZUzUzU95utKVQeYXxx7SM3vG
         3GrYteDUSeqR/rtPuee/WJZlg7w6w9snHzPT5ufi03rCf3Cr7lKlkkWQXqz75F3uYHc3
         EWGURJmfQuvPE8/J3LQUGsiYcBmiInNeUMspKsBhgBQWMI3I07XV8D6wpGozJciaWCS1
         lDBJKM6irAq0EAg5BE/wTNAB6Hrnz634J13UjVxc9ndfGQi/mDQgA9TgEy9dhPh5qcOV
         +1OTz8Jk5EbfDOSoXJLWGDX7ZWRAylIwIaWqsYcn7qJJ2pSq7a0duKTglqNW62i8Q6Zf
         iogQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrBYPqe+o5eqN0SBgwN+Ou9L34fGj4b7WeGWfFOhljpMK97TaFcO36z6rVxCw5SA9V1ocPlEuHXogMCbTo@vger.kernel.org
X-Gm-Message-State: AOJu0YyMhZRLmghBw9zzdd/UnSobZfPsQHNMBQaCvHqFOfkeA0jKonBT
	PqnyRLQ5sapDnsqcFAYOy9458Yl7efL2fX5EPvw9f/5FAJrGG+QzTTej/h7CSBzFAFp2xRRie1+
	H
X-Gm-Gg: ASbGncuzst5D5dNDwasRX3YOODdYpnSDwBctEXQIKE00vGthwVStgU29LZdKY9e7DGg
	veqNobhh6V1UnA8H+f9tjaNXQiC09u8owNChc5WBQkmk6JqbVcNwYIoOba98hrJHzSTR/GXAt5Z
	i6SVvtTcEr5ryHtm+xLqRdSUx/yDr7/plxfgQdO5LB7LmjqVEfybfQLjWZCfV5L3p2lxkjSvBdt
	XRmDcVpARhgt5wdHi7r9KCpgIeaP2V+P3SWDUrmbmXD0sLu4rv/Wpu7FetF4uNpZRWSODn/eV7V
	O5fOaxLPmbPD9RgLqnxI6ZMszqg=
X-Google-Smtp-Source: AGHT+IGHqjRAk+WlggZTFqzb819IIhxvnxQcq7g9sio13JgVwPMgDgJww0I8NXCQ3krJi8bYVfB3tQ==
X-Received: by 2002:a05:600c:3b92:b0:439:4c83:2b8b with SMTP id 5b1f17b1804b1-439581b192dmr69872385e9.19.1739452694323;
        Thu, 13 Feb 2025 05:18:14 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:5695:683f:dbf5:a2f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439618a9b03sm17254135e9.38.2025.02.13.05.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:18:13 -0800 (PST)
Date: Thu, 13 Feb 2025 14:18:09 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add crypto engine
Message-ID: <Z63xEdcvCRHchHWu@linaro.org>
References: <20250213-x1e80100-crypto-v1-1-f93afdd4025a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-x1e80100-crypto-v1-1-f93afdd4025a@linaro.org>

On Thu, Feb 13, 2025 at 02:44:02PM +0200, Abel Vesa wrote:
> On X Elite, there is a crypto engine IP block similar to ones found on
> SM8x50 platforms.
> 
> Describe the crypto engine and its BAM.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> https://lore.kernel.org/all/20250213-dt-bindings-qcom-qce-x1e80100-v1-1-d17ef73a1c12@linaro.org/
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 9d38436763432892ceef95daf0335d4cf446357c..5a2c5dd1dc2950b918af23c0939a112cbe47398b 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3708,6 +3708,36 @@ pcie4_phy: phy@1c0e000 {
>  			status = "disabled";
>  		};
>  
> +		cryptobam: dma-controller@1dc4000 {
> +			compatible = "qcom,bam-v1.7.0";

Hm, I would expect this is at least "qcom,bam-v1.7.4", "qcom,bam-v1.7.0"
given that this is a pretty recent SoC. I don't think this makes any
functional difference though, and we don't seem to have it on other
recent SoCs...

> +			reg = <0 0x01dc4000 0 0x28000>;
> +
> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			#dma-cells = <1>;
> +
> +			iommus = <&apps_smmu 0x480 0>,
> +				 <&apps_smmu 0x481 0>;

Should be same as <&apps_smmu 0x480 0x1> (0x1 is applied as mask to the
SID, and 0x481 & ~0x1 = 0x480).

> +
> +			qcom,ee = <0>;
> +			qcom,controlled-remotely;

Please add "num-channels" and "qcom,num-ees". Otherwise you risk causing
crashes if the interconnect listed below isn't up (anymore) when the
driver probes the device. See:
https://lore.kernel.org/linux-arm-msm/20250213-x1e80100-crypto-v1-1-f93afdd4025a@linaro.org/T/

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

<&apps_smmu 0x480 0x1>;

Thanks,
Stephan

