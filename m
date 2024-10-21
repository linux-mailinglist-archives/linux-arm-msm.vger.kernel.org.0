Return-Path: <linux-arm-msm+bounces-35253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E59619A6924
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 14:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E704281C93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 12:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9691F4FCF;
	Mon, 21 Oct 2024 12:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tZfQf9Sb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBD11D1F5D
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 12:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729515251; cv=none; b=Rq+MmRQLsxHV1YK/5ehkODYYZt2drQQOQTLIqGMwmdTD4N1+W8MZ5tntnBHshqVLtqNaqoNxMTKvTsNSnKNvgm46Ce/7TwKQoJjMey7Ah7u7z+rG8gjlFzkVXVo2iX3an1PMvlArnhBVASdAadSyAk9IXWhhuh0XglG0u84RaD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729515251; c=relaxed/simple;
	bh=DyWxLKiydqEOonS9mZeITo4s7rpB/FLXd8owqshBsQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sDUkYnan7QiXCyEpB+IraqMoRE/QUzMq5yc6MztKcarZRDXIb2ixHnZ+mE8aV/xvc6lOZIf9A2xiRNe6l9WQDlAg3HeyDj2dDbTZUn3s44X5mkO36w52LdkiUrl288j4jmMNBp/qqiDSLylH/UzFmcLBt+iYSA4UHSrPc9Mj2qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tZfQf9Sb; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539e63c8678so5274261e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 05:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729515247; x=1730120047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I2s35/3heGmToRyOYXVolNum+L9YFMF7ccDrRpO5RZ0=;
        b=tZfQf9Sb4iEvkWs6NrfaZAdVp90KSBkmjG1l8VVQUSfk7GatsBY2qih3+zRSzeG+LN
         7J8yWxdP0IoFPLBt+KnhXDT5mWFmwFPsFYZcRIdCOWzODF+512cEI93+/4Kn2sAvkiPB
         87PxOUU/utf+4U1p0iP+HlW4kC7RSr4E/Bdm75BreaSoNslnugwsrWVeLJYTqzYeSbOz
         UEA3PmkmPNbtffcTqLhrX5FVLDHBBfk1b4bCNsS0FHyxaJOo9ZBkjGVpmcjge45nQChx
         Qiwl6bVf371tmPuCcofcNq+vQ9+MvZgM26/q8x5lPVHn31p9PQuj9uD7OvvJw5lGpcvV
         peqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729515247; x=1730120047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2s35/3heGmToRyOYXVolNum+L9YFMF7ccDrRpO5RZ0=;
        b=KaJXxz9LyAmNwvo3v7mL0yp/0D/aZOvZcuPmJElC4+IFkCWJc85RZs2fx2QPrDaCga
         lJjZwAot+w3KZe4W4G0yVQ96U6o5W+U6D4Il8Sp2dHVCRnjsyMuDpfBvJSSf2b3j+BxX
         lGOtYsDEehaTu1Xto6gOz5BsVKxr5rwuFLE/o3LAhC/1FDwGiAyWsyPhDgmdbWZpUWhI
         OLdyBKjsPRBr+AFKVviHyKjuAffDt7QAjX5/h8IpOXBKv9DJ+8SL2GbKEYyCFjRSj/7a
         Vot955vdFOEd451wpGkaMoq9slS0xKpgtNl7ly0O12wpb8rQQj8hvQzE8tx3betO/Y3Y
         N/JA==
X-Gm-Message-State: AOJu0YyR9vAlj63QOADvW9V1mHTYKKMB4gpEU5NHwc5YDFdWqc5BPkRc
	0cRM09Ag4kjTSS5YmjDMYTdf7deoiGjYlCZs3TfqFjdfc+R63CWOOHmqBSj+No0=
X-Google-Smtp-Source: AGHT+IEz4ViWfBMtEMxwNV3/I552f0CNAjJ7YSgMEZYhkW6iNBJSB8GpfuJiztKEovvTD9JY1l14kw==
X-Received: by 2002:a05:6512:3e1f:b0:539:8bc6:694a with SMTP id 2adb3069b0e04-53a154f8ec6mr4583475e87.43.1729515247279;
        Mon, 21 Oct 2024 05:54:07 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef80:b7f5:199d:c177:8c47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c6b12dsm1924908a12.77.2024.10.21.05.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:54:06 -0700 (PDT)
Date: Mon, 21 Oct 2024 14:54:00 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: x1e80100-crd: enable otg on usb
 ports
Message-ID: <ZxZO6Prrm2ITUZMQ@linaro.org>
References: <20241011231624.30628-1-jonathan@marek.ca>
 <20241011231624.30628-2-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011231624.30628-2-jonathan@marek.ca>

+Cc Abel and Johan

FYI, this landed in qcom for-next last week for CRD and T14s.

On Fri, Oct 11, 2024 at 07:16:22PM -0400, Jonathan Marek wrote:
> The 3 USB ports on x1e80100-crd are OTG-capable, remove the dr_mode
> override to enable OTG.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

This is a bit problematic, because dr_mode = "otg" seems to imply
gadget/peripheral mode by default and we are currently unable to detect
the role at runtime until the ADSP is started. Being in peripheral mode
by default will break USB installers; they won't be able find the rootfs
via USB. Unfortunately, they wouldn't be able to detect it once in the
rootfs either, because usually you first need to copy the ADSP firmware
from Windows (at least on the laptops).

I think the best quick fix would be to set

	role-switch-default-mode = "host";

for now to restore the old behavior in initrd, while still allowing to
switch to peripheral mode once detected by the ADSP later.

It would be nice to have gadget mode in initrd as well, since e.g.
postmarketOS needs that to set up the USB debug shell. But I'm not sure
how we could support that:

 - We could designate some of the ports as "peripheral by default" and
   some as "host by default". E.g. usb_1_ss0 is also used for EDL and
   Fastboot on CRD, so it's more likely to be used in peripheral mode.
   But there still would be users confused about why they cannot plug in
   their USB installer into one of the ports...

 - Long term, I wonder if there is any way we could reuse the reduced
   ADSP firmware from UEFI for USB detection until we start the full one
   later? Perhaps it provides a similar interface?

Thanks,
Stephan

> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> index eb6b735c41453..bc66f4713b231 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> @@ -1568,10 +1568,6 @@ &usb_1_ss0 {
>  	status = "okay";
>  };
>  
> -&usb_1_ss0_dwc3 {
> -	dr_mode = "host";
> -};
> -
>  &usb_1_ss0_dwc3_hs {
>  	remote-endpoint = <&pmic_glink_ss0_hs_in>;
>  };
> @@ -1600,10 +1596,6 @@ &usb_1_ss1 {
>  	status = "okay";
>  };
>  
> -&usb_1_ss1_dwc3 {
> -	dr_mode = "host";
> -};
> -
>  &usb_1_ss1_dwc3_hs {
>  	remote-endpoint = <&pmic_glink_ss1_hs_in>;
>  };
> @@ -1632,10 +1624,6 @@ &usb_1_ss2 {
>  	status = "okay";
>  };
>  
> -&usb_1_ss2_dwc3 {
> -	dr_mode = "host";
> -};
> -
>  &usb_1_ss2_dwc3_hs {
>  	remote-endpoint = <&pmic_glink_ss2_hs_in>;
>  };
> -- 
> 2.45.1
> 

