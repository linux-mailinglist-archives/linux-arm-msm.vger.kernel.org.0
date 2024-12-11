Return-Path: <linux-arm-msm+bounces-41491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2559ECDC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 14:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D00416176F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 13:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F002336AF;
	Wed, 11 Dec 2024 13:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EzK9TjPJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3123D22C353
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 13:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733925463; cv=none; b=APhwIRsnrAVGSifxwUG63/OPHnF64+57QKH3rrIMkmVC7EbbR8xymw8ZsgZVtCem3+XnU9mUOcCXnF7+Ww1ahbCfEzV/2eAgZDQlMkqCE7rtW7/+HmDqG3FuXLhtdbNyVlaJKP4iPcKX80t4LP2hNzjs/HFVPKKrxfEW+tV1owc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733925463; c=relaxed/simple;
	bh=VDR/LFkNhR6c+K0FS5fF1XjxZAJmm0jHxt2NQS8CF3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s5Ux9TvPFBO4hzX2inCA72GkjHi00G0ovRlJNoQq8H0HylZbLpU4YINp0G2s22Hduv535E6B0hwP5Hb2bTcwtocc4pbM2+pOZ4t+n4Or05tOj0SGd8KYEolrF5V5F+7ziFvDj+8iSWa6fUAsu9v89XSxemj5jU+QJoCQE8OfiSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EzK9TjPJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso4353925e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 05:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733925460; x=1734530260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mwRyufZV4Hv4BKUozZCvb8TTCpopa4m9EKT2fS3FdAQ=;
        b=EzK9TjPJf4p9YNiCcinbbsZc9eOyC31xRpwKlqNj6vPaudvGrB756CRAxwtJre4hB2
         GmKB8lKxbgkNZYAkBT7trWg4tuwauU7P12QG+o/BPwafGWiA5a0TTtwHTATwH7AyP0/n
         A6tOw0JigkJRIo5ltbjLDbQHr8Sw/puUciiJwNN9CRXOyh4TJuVkiKbYA7z5JrKmO8tb
         mKqG66OcsxeYYjpkUCEB1ysEcvpaz6py6sARKm6iIgrzQRnyv2rH5qN5ZdsnNdlxM9l3
         IblOH7HMPKjcNBRPb4DipTd36ipSXWPMIUkvooiZaUy38jWQw7SxnHsn4n2ZK8fldIgl
         b7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733925460; x=1734530260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwRyufZV4Hv4BKUozZCvb8TTCpopa4m9EKT2fS3FdAQ=;
        b=TT5ELF0VzVnN3Bu4gX6SzrHfg8V581VyFBmPxDSS7zqufZJitNB38xKQuFOSE+zZ/Y
         NYHl7lO6PFac6etXWCTnR0hyU53CxagNVZ6IZLjwoNufv5NX5Qgzi5GiPtDW7+n9kZcQ
         l9rN9P0f+1pGJxDaz66q+gK2CfV7UT8e2WB80TBVEoWx8cnf44vHTcGSl5BCeZudiiZA
         9Z2zOEHy8x+UkXczH2WeRgW0Nk0ooNcTPD2YpqbK4F7Gu4relRnnusMp8Cjdemtpn/XP
         VRF+XG4dxzJr4GNBqEnI1d3SHK06zvibkuI5TBF+ccYu7SAG/u+QRG1XHjykcgbyNf3I
         k5dA==
X-Forwarded-Encrypted: i=1; AJvYcCWnTegmYQs2hufdUqypYkfZvVGKhTiMRuhlB0XoSL/99cq4bm3Vc6QXI/5PGCh74wua2Zt1NgCELJ8QGYFU@vger.kernel.org
X-Gm-Message-State: AOJu0YyzMYYqyUoH6um6gobbliPtkzdEHlO8uLDBk1pCgw+pBxx9stH0
	SZjnODLDBDU4hzG6d3WSbUjEEZKO/8wlrxKI4t1dBJKgXxTmLx8q/atAuzMjoUc=
X-Gm-Gg: ASbGncuYEqUZGWh1zAf1gDa0l92VI7b2r7xMT/ai/3YTTEyC6vJeAPsZXuSfnfELB3i
	r4qoXLcPisY0E2fdum4klH1U/9XXKEp5jWZZIKUEo4AO/MRN1AC0T0tM3rtBYZujCuxnc82ON0A
	p8FGhV1lCuQWWRcUCecwO9LmopIjMo+0fKHLNPgsQKEgyMKgMafnPAz8ZHMcOpNzB7eM9C34RPJ
	XKDF+jhRKvx6lStlvS+UGiAlvxVF/iWRM83ydqonrnD8+xd2utj
X-Google-Smtp-Source: AGHT+IHHGvcjsAaWoQmNtBBOZEdx4io9usowsti1WQThV36SDH9Hnc+lVGaPEvltgGcV3XhTkCAoMw==
X-Received: by 2002:a05:600c:1616:b0:436:185f:dfae with SMTP id 5b1f17b1804b1-4361c5a3918mr21096715e9.6.1733925460593;
        Wed, 11 Dec 2024 05:57:40 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-387824a4a31sm1355432f8f.30.2024.12.11.05.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 05:57:40 -0800 (PST)
Date: Wed, 11 Dec 2024 15:57:38 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH v3 2/3] Revert "arm64: dts: qcom: x1e80100-crd: enable
 otg on usb ports"
Message-ID: <Z1maUvW26Cl/VXLr@linaro.org>
References: <20241210111444.26240-1-johan+linaro@kernel.org>
 <20241210111444.26240-3-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210111444.26240-3-johan+linaro@kernel.org>

On 24-12-10 12:14:43, Johan Hovold wrote:
> This reverts commit 2dd3250191bcfe93b0c9da46624af830310400a7.
> 
> A recent change enabling OTG mode on the x1e81000 CRD breaks suspend.
> Specifically, the device hard resets during resume if suspended with all
> controllers in device mode (i.e. no USB device connected).
> 
> The corresponding change on the T14s also led to SuperSpeed hotplugs not
> being detected.
> 
> With retimer (and orientation detection) support not even merged yet,
> let's revert at least until we have stable host mode in mainline.
> 
> Fixes: 2dd3250191bc ("arm64: dts: qcom: x1e80100-crd: enable otg on usb ports")
> Reported-by: Abel Vesa <abel.vesa@linaro.org>
> Cc: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> index 199f6b42aa11..66360390ae7d 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> @@ -1840,6 +1840,10 @@ &usb_1_ss0 {
>  	status = "okay";
>  };
>  
> +&usb_1_ss0_dwc3 {
> +	dr_mode = "host";
> +};
> +
>  &usb_1_ss0_dwc3_hs {
>  	remote-endpoint = <&pmic_glink_ss0_hs_in>;
>  };
> @@ -1868,6 +1872,10 @@ &usb_1_ss1 {
>  	status = "okay";
>  };
>  
> +&usb_1_ss1_dwc3 {
> +	dr_mode = "host";
> +};
> +
>  &usb_1_ss1_dwc3_hs {
>  	remote-endpoint = <&pmic_glink_ss1_hs_in>;
>  };
> @@ -1896,6 +1904,10 @@ &usb_1_ss2 {
>  	status = "okay";
>  };
>  
> +&usb_1_ss2_dwc3 {
> +	dr_mode = "host";
> +};
> +
>  &usb_1_ss2_dwc3_hs {
>  	remote-endpoint = <&pmic_glink_ss2_hs_in>;
>  };
> -- 
> 2.45.2
> 

