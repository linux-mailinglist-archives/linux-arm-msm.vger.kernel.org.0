Return-Path: <linux-arm-msm+bounces-49084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2F7A41270
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 01:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D55253AF0B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 00:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A28ADDC3;
	Mon, 24 Feb 2025 00:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Th+kA8L6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C56A8F54
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Feb 2025 00:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740356286; cv=none; b=theX22IVLKN83vlXKe9m66R2iA5E3KCYvNFoCtES3D33Avr3F9mmE0OIcg7R/TCrn03QLVqj2l4CHS7JkvocgkFye5nKVbCwMUi8RrYE86e9jWntOr73xmvqZnMB5ezYp4UM6NY15orBPyXAw152K6cuYrhpnxOACi+ATZEy5Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740356286; c=relaxed/simple;
	bh=JdCnAXnxYid1mxV4nHuT8i/PGJKEdfOulCrTZSYikBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRTQnZpFw4eP6NkcpYKS2bOjatpMS3aNZQQfq2hJaUltB0pTxSxqO2JBQPb/QrI/LaiUKU7/5nliQqQJhe5quaMqY6U32W+E/PO4j/kiIREOPZDysRGoDsyDsP3TVr1aw/2w6nae1itAYmCKVsv1XZe5l731ERcZwXYBq47ZgPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Th+kA8L6; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5461cb12e39so3661842e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Feb 2025 16:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740356282; x=1740961082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nD6DNE71VFEfXcLuCIsfR3SfpPP50CHXY1aUthPY5zE=;
        b=Th+kA8L6xflxjS/Qe3ZZdHKPEM6EHCG7QUQYkp1vQey/QbWg6bk146ScDbXjT+S6xw
         1SENtouugSpKlUPUI8oZB+HuiD6FvCy1cUB19xYm36kA59JItFEkb6q9hw5Vi3AiFpDS
         tFdwRaMBxbj/gyrl5J0qmp3UxacBTeQP44Dp6F/VQcbrk5wcAHGt8cFcxuon/s0qw2e6
         vZMZ7P2fcS1ebMHgEhD1IqqHLauD848n97g0smmRbENghk3GZnZRYplO1lQr/+bIb4x2
         cUgzph3t239+/ZJAr3XnN2j5cZ22s2g0N6OV8A6NsgXJfVREo/1QxdAmC5Ydacpm0uvq
         JjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740356282; x=1740961082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nD6DNE71VFEfXcLuCIsfR3SfpPP50CHXY1aUthPY5zE=;
        b=mdNT+X31XNUImeZH2L+7EE0Z1qiXrK6r1b12PiofzCHrjPtT0fB/UbD8yayIczS+mY
         ajNKZ39zSK1Pa8dcRsS4+V2yF8Ju1unklbjaw84ucrMhPj8Ml5gRcbJRCDjhFjBiCpBc
         dpKxtENRj2VZidjL1vGj/O2tKiidI2CDLImqAD50ydLZ9/9Sj/APBXP6nCeIzGcrznbt
         8qWHP4LrhV5cgfAlZhhdrj1GNoW8fxkEFd+VixXj8nS04B4jzYD871BrFGphKdKBf3YF
         6t3lWbBRWqcCdPSAXp1WCxrkNRZ6r7g8/5qLSBtH+ESdxfpHPgj/10raRPINIj6etv/L
         8U6w==
X-Forwarded-Encrypted: i=1; AJvYcCX01NDJN5sDbxCgY2FLGSZP1MKE+zjHKRL/8kANe+Hil7G4YFos6g4qOBIiIXPa0A189WWgSETXQoiN0Db8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgh+6dkOQoyIHJuE5jDQ+KGIipuoDQWcF1jfSgC3H2CMsGnv3r
	Ymvt7k8XbMfsUQWtytHEcAKHRZLrekKABaXwc6hqe5lnND0rGJfkKvUYY4BdCGw=
X-Gm-Gg: ASbGncuHJcVO55/zIcIFtwQt4A9kRH28iNMQP1q38sSHMq9MLPN8mQk5KGfltSWd6l1
	jCKVm9V9TMQqwzHZv5iIKX7vKvO3vUVC2jPBeYFt1R7e00YV3ttWRZdVgmDleb9eqtn+gfisnMV
	WErB1CjYCpBU/bd7tGsMlZ3sEXndCsXPfIOxlGW90vxa4IZ1JMrCXaLRlfYJ4DiAPOnYsSjqQen
	8Jcjp91ZTrRc01j1UDCB+dCPpa3ZXHqW68wOerEscJv847YA+NRieV0HrphRRcJAFapl5ODZVu0
	TIdONaLAWt+RVuXei2fhj4stHTjN/9OsHbwb6cwYgf/6eXdbdnllJ8CS3cNAKaUgdEBkQiCwp89
	IXKRXNQ==
X-Google-Smtp-Source: AGHT+IEfy+mm+LIBEpBFk9ATKeXnV1ESjvN4vtfFY3zzlgmNDuwjPP+io43Va+DxHetU2qnplQe2kg==
X-Received: by 2002:a05:6512:e96:b0:545:d08:86 with SMTP id 2adb3069b0e04-54838edda43mr4361626e87.5.1740356280998;
        Sun, 23 Feb 2025 16:18:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545318f4027sm2635082e87.141.2025.02.23.16.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 16:18:00 -0800 (PST)
Date: Mon, 24 Feb 2025 02:17:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm632-fairphone-fp3: Add
 firmware-name for adsp & wcnss
Message-ID: <w4l5drhu6exq4jb7x2pisqtkz5ylare7ashsmjjqomv3yetjwj@z3wapq4rkk3u>
References: <20250222-fp3-remoteprocs-firmware-v1-0-237ed21c334a@lucaweiss.eu>
 <20250222-fp3-remoteprocs-firmware-v1-3-237ed21c334a@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222-fp3-remoteprocs-firmware-v1-3-237ed21c334a@lucaweiss.eu>

On Sat, Feb 22, 2025 at 02:00:49PM +0100, Luca Weiss wrote:
> Set the paths where the device-specific firmware can be found for this
> device.
> 
> Fairphone 3 was shipped with secure-boot off so any testkey-signed
> firmware is accepted.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> index 08ffe77d762c3a97f470efbfb5064282fe2090da..5611209dbfa41d7834af7903535ed3e05604ba63 100644
> --- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
> @@ -82,6 +82,8 @@ nfc@28 {
>  };
>  
>  &lpass {
> +	firmware-name = "qcom/msm8953/fairphone/fp3/adsp.mbn";

If any firmware is okay, wouldn't it be better to use
"qcom/msm8953/foo.mbn" ? This way if we get any of the firmware (yeah,
I'm a dreamer), then FB3 can pick it up.

> +
>  	status = "okay";
>  };
>  
> @@ -297,11 +299,16 @@ &usb_dwc3_hs {
>  };
>  
>  &wcnss {
> +	firmware-name = "qcom/msm8953/fairphone/fp3/wcnss.mbn";
>  	vddpx-supply = <&pm8953_l5>;
>  
>  	status = "okay";
>  };
>  
> +&wcnss_ctrl {
> +	firmware-name = "qcom/msm8953/fairphone/fp3/WCNSS_qcom_wlan_nv.bin";

then this can become "qcom/msm8953/WCNSS_qcom_wlan_nv_fp3.bin"

> +};
> +
>  &wcnss_iris {
>  	compatible = "qcom,wcn3680";
>  
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

