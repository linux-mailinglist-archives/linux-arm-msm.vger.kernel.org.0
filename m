Return-Path: <linux-arm-msm+bounces-29109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E204C9585AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 13:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 205681C20D4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 11:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BDEF18E759;
	Tue, 20 Aug 2024 11:21:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D77618E744;
	Tue, 20 Aug 2024 11:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724152907; cv=none; b=rMu1gU+1NeB2alswM5n3VvqzuR4jqgY2Fhe9UL6/mEqRd34+rFeCAJlYfXDCLD+YIrjIwi0uUghlo/4Q2UFdcRxlgcvvYJ91tjvXdMHuK7SiM2X0vb3m4tUQcuAyhQujiy7TKDcNqjt2+FnIxMEk9mROtTySLaFW0HL9dJnAZFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724152907; c=relaxed/simple;
	bh=AMPKw3vEUGXBHvvYtB4Det59cxLVQFjWPWXu/V6zIf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nntTHkL651ulmvUa/YGnVbr/n67k23tj8y9e3Hep5xny9A0Ux5rninvCBko4u6Ps9sYnKluDnitpD++kaHpEIhuw4wCZtL8RiXdENu82M7h4wcnOicr/Xd5bmmWb34Xf4zwb5o+nHrE9uM14qSxruR1Lkuynsn8VQqtpsIJZNX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-429ec9f2155so37145465e9.2;
        Tue, 20 Aug 2024 04:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724152903; x=1724757703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYw4GmPfrHigbQo/4U34PNKhToaAnBYaJK1BK61a010=;
        b=Mp2gddG46YfGazM6+ID6vOCXtT/BcE3rDqR8RiMiylgVmMHPl3Vr1nSPz3ITf7MfZH
         FSXrWSrgLbXRhbWl3oQ6O5Q3/GlRSHTl64HmkeS1QpFBq0PASogAK1J9FGj1nkT7PojP
         Lb+4HHQLHtAhJUtwkXz3Mn2Bl5oMJuX42RNDdtjtjrfbxjHDxJKDVz60WPro18ptuti9
         5Bq+qYKYXaO9YEaEb4CkResGk6DRf7DlEa9g4y071DOraOZQ3ksasOpBc/iR61FTlteb
         QM2wuyUcWW2n/RKg0G1a/fvQ69SAAd4j/Zh71Lu6ieh2v3eS6b6XwtJ+3ivUQOLPrJe7
         aTFg==
X-Forwarded-Encrypted: i=1; AJvYcCXoR73piFINSkzxRFyaXbhmfKkTT4tqGRzInNGUpN/wqyp5KV/+p96S2lfbiGS6QU0WslaJEx8hOH6Vd6/cv4jnNK3DHJsTHQZeiEQuw/fQGbOGhJfWHwbQCuebX/7ycm6cThCEKJxu+CdJ2eyoxfFIt1wcS+y91PpyIAxAgMsykvtLxeeamPuNt8+FgWIOMpsLCi5DUSeJc7iNnZKhMs5wVV64dL/yruPE
X-Gm-Message-State: AOJu0YxGV6BdMRtY/fVuco2iQorwoKQyqagDiD8lJMw7WiLLyHMlObuQ
	oWpemD8e15PlN0gIJi4ZLpgzKAaS4bdRbzdD4K6plmwyVOmUpaVh
X-Google-Smtp-Source: AGHT+IFpo/8DovLpoBX1Rhyl7aZLObf34Lfr7Sf3qJm4qAOO2QJ4P2aUDfwwCapsCMFWEmFp29CbbQ==
X-Received: by 2002:a05:600c:3506:b0:426:641f:25e2 with SMTP id 5b1f17b1804b1-429ed7cce1cmr89060465e9.25.1724152903206;
        Tue, 20 Aug 2024 04:21:43 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-37189897066sm12959636f8f.76.2024.08.20.04.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 04:21:42 -0700 (PDT)
Date: Tue, 20 Aug 2024 13:21:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Cc: andersson@kernel.org, krzk+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_viswanat@quicinc.com, quic_mmanikan@quicinc.com, 
	quic_varada@quicinc.com, quic_srichara@quicinc.com
Subject: Re: [PATCH 3/4] arm64: dts: qcom: ipq5332: add nodes to bringup q6
Message-ID: <f6g2bvosd7y5zyufel73lm6xr2otf25q7ut6tz3vnphtlqotk6@uftsnu4z6xql>
References: <20240820085517.435566-1-quic_gokulsri@quicinc.com>
 <20240820085517.435566-4-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240820085517.435566-4-quic_gokulsri@quicinc.com>

On Tue, Aug 20, 2024 at 02:25:16PM +0530, Gokul Sriram Palanisamy wrote:
> From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> 
> Enable nodes required for q6 remoteproc bring up.
> 
> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 62 +++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> index 0a74ed4f72cc..ec93e7b64b9e 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
> @@ -145,6 +145,11 @@ smem@4a800000 {
>  
>  			hwlocks = <&tcsr_mutex 3>;
>  		};
> +
> +		q6_region: wcnss@4a900000 {

Why here it is wcnss...

> +			reg = <0x0 0x4a900000 0x0 0x2b00000>;
> +			no-map;
> +		};
>  	};
>  
>  	soc@0 {
> @@ -476,6 +481,39 @@ frame@b128000 {
>  				status = "disabled";
>  			};
>  		};
> +
> +		q6v5_wcss: remoteproc@d100000 {

but everywhere else is wcss?

> +			compatible = "qcom,ipq5332-wcss-sec-pil";
> +			reg = <0xd100000 0x4040>;
> +			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mdt";

It's one firmware independent of board?

Best regards,
Krzysztof


