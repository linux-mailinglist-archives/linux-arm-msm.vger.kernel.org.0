Return-Path: <linux-arm-msm+bounces-48733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A481A3E05C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 17:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B92A1885974
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A697D208989;
	Thu, 20 Feb 2025 16:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AM+bYgeN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC95200B9F
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 16:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740068358; cv=none; b=irY7lPhrEg3yPoxNAlf5ThjbDdjHwGhesalMHvOXEAv60McMe/gRLMvtSVnodsxURj1qdiG/qo9/tFcltlt7WONQ894cwenSw/rqx+qVBPQR/iICogsWvG10FAP7Sr5ZR/E0YfkOAIOBxyuZwiKJH5uyAP4r3a3z9T3SFvaD8rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740068358; c=relaxed/simple;
	bh=/B922pkbs/U6oOvx+Im8KE0wQFfockKMJbcW42nwAlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a18A03IXcj/rth//7jHFIB+Fv/MOu8ujbzdeJgxX+PNweqFsyZxlzBUDInANLkNBdjR4RNSCXScCYK6sFmFUb/93q4b20hXzFzyOTT7rZNfvbd0DwaH4DbQ7c0qSODtcmP5VqEnJ0bHnMMp2vMZdOWhTFsreu4zN+1rxyxbfwvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AM+bYgeN; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5461dab4bfdso1368072e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 08:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740068355; x=1740673155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FbLGtpaYb7GP8BUC9A3SVhEyUFy/pRikzTZLrMMHtrI=;
        b=AM+bYgeN4SwhHPFPi0pcnUOuqkooYXpe4KyS4TKkc2Y9wtMNfQsmedAey1C9a1rkPv
         5Aq+D7N8zYCLLUMIl53fuzp44OYcZ05TrkIVBGqt+DdaSW9UiwmiOlbOiiMfMn1PfQ1P
         yiG3X6vumX52Oqvzcx3TlCYnCLL7rRokCRMU77NrgKRvHtWoNyja6AA9TBgdZsDmRABD
         nw2K+v/jq+ygCkvd9FlcvbxQ97S4JCy0nGUNL2THdm22syx3IcdX1aG2+9uWKOZbyHOi
         +Bs9+Ygt3oHe4xuu+3tF3+Owq9j4S7RpC2yfV2nh/dYlmBlLAqNqSu6R7Js1/EFeqTMh
         VAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068355; x=1740673155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FbLGtpaYb7GP8BUC9A3SVhEyUFy/pRikzTZLrMMHtrI=;
        b=qhB/j3pPDcs0eKacU8h0Dh4InxuDDMsINOuYyiuOIIfOnELsAjbGI1DUEJnFbV2bLW
         8b9yhS6GKRO9KrR+rYs8obkguOSMLvJOyLX1pzh5hPdXdsgDuFKP0loEHxjpbIOrW2va
         LS2toREKhHnjZcTyRtV+HLABxua3oPbVnaK4e26d1SYg6NI14bYu0ulaYj+jVd9eGyTu
         fpOVWFQhHyJQBDvIiJAWSMwIsBse2Je6B/ANVAezyl5ErBnwPE4jJufyrmNwJj00twkB
         S9tTYWLq3fa9WCUW1c67lPkwNG9ICgAZMf+GEubg+IC/2ZCHFdIFTn50yKSSR3dMPTht
         yXNg==
X-Forwarded-Encrypted: i=1; AJvYcCVEmRdNP0wRO4OYfWpbW1ELXvh4ZUNvsiX8+So3H4JvG4hQyONXDVcaOTYC+Fu9YFHWXXsIcUx2f7wHqHWL@vger.kernel.org
X-Gm-Message-State: AOJu0YzRf4LkmR+LnVQwwRqevkFfChZ9HOmoKDHVvxEnTMBG6idP+VWx
	Dp6DYdnylyv5zeQEv9trW5ya0qSi0xRSpWqUMFQZLQwkeR0yV0h1Gd2JmZMIUi0=
X-Gm-Gg: ASbGncsazkJo0eO55SBOghHJo7webbeWXfth2IKrj7D4QBiq+gY/Gtv9E2jik5DtTkD
	UFMByiT19nI3uN7xjWw66XVfAcTMGj/m3s/n9yk21FokH4Np7Yl1qBEAZY2xEZAp7Y1jVQvmKKl
	cMm3ub1+5+jaTS8eR8qxJKjvUYm5TagbTWOwgwTySH7+19epnsUEaxTCxi4EDtHjKMgeIJ0E3Sa
	MbTqe3wzDFgpX1qb0/bshZUFs7trFBbDIlP+4KAOyAs1a3YFtjouFVbq8kFUG3E+ggfP3YRd5XW
	6zLioENaiuT653vs5DruU1g5eaeS4/TecqyKR5Yrdlcs2WVfAmd50tiwWmGJZ7StRXFgVWg=
X-Google-Smtp-Source: AGHT+IGXy8UPjP+6V4rWOhniIYo8XO01HbjN5gyUL77WHLsu40hdggfhlw5BeDY+CUVIKw0g6aq+Vw==
X-Received: by 2002:a05:6512:128b:b0:545:60b:f38b with SMTP id 2adb3069b0e04-54723e04635mr1484163e87.8.1740068354786;
        Thu, 20 Feb 2025 08:19:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461d1d8fcbsm1473583e87.83.2025.02.20.08.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:19:13 -0800 (PST)
Date: Thu, 20 Feb 2025 18:19:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sm8750-mtp: Enable CDSP and
 mention MPSS
Message-ID: <dihnqsdjqxq7uhomceeiejey7dezfyvhpnyc3zyzhyuyfdjtec@d4ruo5xbxid3>
References: <20250220-b4-sm8750-cdsp-v2-0-a70dd2d04419@linaro.org>
 <20250220-b4-sm8750-cdsp-v2-3-a70dd2d04419@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-b4-sm8750-cdsp-v2-3-a70dd2d04419@linaro.org>

On Thu, Feb 20, 2025 at 04:44:13PM +0100, Krzysztof Kozlowski wrote:
> Enable the CDSP on MPT8750 board and add firmware for the modem, however
> keep it as failed because modem crashes after booting for unknown
> reasons.

So the modem crashes on MTP, but does not on QRD?

> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> index 8eeed7f2f7766326cfc7830002768087e9783b9b..72f081a890dfe49bfbee5e91b9e51da53b9d8baf 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> @@ -791,6 +791,21 @@ &remoteproc_adsp {
>  	status = "okay";
>  };
>  
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/sm8750/cdsp.mbn",
> +			"qcom/sm8750/cdsp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_mpss {
> +	firmware-name = "qcom/sm8750/modem.mbn",
> +			"qcom/sm8750/modem_dtb.mbn";
> +
> +	/* Modem crashes after some time with "DOG detects stalled initialization" */
> +	status = "fail";
> +};
> +
>  &tlmm {
>  	/* reserved for secure world */
>  	gpio-reserved-ranges = <36 4>, <74 1>;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

