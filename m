Return-Path: <linux-arm-msm+bounces-22830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1CD90AAD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 12:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45799B2F05E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 09:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EEA6194AEA;
	Mon, 17 Jun 2024 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R13CoFP3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B691194158
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718617204; cv=none; b=rvKPFa+I4VLIdurZdhCNwKTevErB3/w4DRuchBDCyVLF36g4Wo0BZUNg2ul2L/tOPjtfFLuxmV8cQLlaLmqlwfD3F+tgVKdXd/nWLkdDMxt/PTrX2mylMs6PXvjg/LQWat4xMRF+7vKlIl7SgeJP/EdpV/l99NU/WYVbL/F8oh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718617204; c=relaxed/simple;
	bh=kyIB1+ZBBv072lPjp49oYqQ7Ic3C9PckkBS14t7l6wE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gu8DVNwkV4fLNsTYynmAoMxl1ACQXCXXcrYkUw0rgFuZTK8n6DPoIBbUcpVfMC8AAuEV9c8mwMnW2H/AR5SJBDv9bi0U1ozeQ7uArEjdmIxbK2wEzWSZz2WMdWxMlsEgtnnWJEDq6LPoyDADftbcUETn0f9EtNH/Uyu/Vf4toAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R13CoFP3; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so46395771fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 02:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718617200; x=1719222000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4+S232WSxS6ZLLT0oNMw4Vc9BMwBNqpTcyoAp0ZbZMI=;
        b=R13CoFP3ft+9880OWHjeo0HtlzVfwipmX51FXAvGo/wABRWOIK3acmeHCRASrv8ryj
         Kz5DkEOcAutqxEL5kmtHrAiFH5gl63NvRILhT6m7pesVx22rvESzBtzg1cu/5TF4YIp1
         yTkAFFg/9kiak5ot0HrWd2RdniRS8CzUCNdd74t1Xojetc4XCJA6rzHTpDjgtrdi6Sx4
         ccmu2+j5XeWRBFalsMFCftJdewI8PODeQNcxkFf9dZTlLOUpnB22oD7ZWYp0xoJD879M
         cRAimp/o2MizFljpcFhjthMiFbJMiVx6ZRYPxH5LNvS1uLGpEV9gjAC+FvlhG+37Uu2W
         CD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718617200; x=1719222000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+S232WSxS6ZLLT0oNMw4Vc9BMwBNqpTcyoAp0ZbZMI=;
        b=rm6epqYMDad4AI8Vg8ebMjbeJDsRi3/K01e1XI61uODUIqo27gill2COxVE5AQMU9s
         s0OhphYaHoLUQ7OT/nhEVndlx5WdqiqRPatggSli/G9FxXHzLSUf995UFtkmXV64ig8W
         D5BvCZO1FPZFpDUWdVpDMy2HXclGM9jp3ZuFVG3jzrGfIkxI4W4nsaBORLbISvvpbsC3
         78IyoidTERhW0M8w7JCIVnG11CegeOCwrgtjd/3dnmnnroZFz0EO/HSmkMnGhEczL0DG
         GHKcI9MFCjg2lqe9NQd1IeagQAeSlngpsN2L8RHTDNHnCU02MErs5HnJMjJyy/6sv6+Q
         zm6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZ1RMHMY4B3Lqsa1RudEGdwIbkLIfUTJ9e8psAA0lM7acTxDjFdvtVdHniSbHrJqrppyNiqyo44h3Xoiyvoob9nqOhXYvV++qQ8i92VQ==
X-Gm-Message-State: AOJu0Yzl5FKwpMKlwcXDTL05Jh2o8bg53l2pfw1RvgMC6URPO3f4YII8
	DKEyZpRM3TLLx3+R0r6ygUw+0Cb+MDU5AfuZfSdHGgTDYBaEssrR1En+652O12A=
X-Google-Smtp-Source: AGHT+IGlYVvT0Ws/bjXzkYFWPhc39m6CuKC0rzf52NQAanWqjZRXNLVFHI9AxNwrxYAOTdWbtfLCTg==
X-Received: by 2002:a2e:84c7:0:b0:2eb:d8d2:f909 with SMTP id 38308e7fff4ca-2ec0e46deffmr66007861fa.16.1718617200444;
        Mon, 17 Jun 2024 02:40:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec18a47deasm9239791fa.132.2024.06.17.02.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:39:59 -0700 (PDT)
Date: Mon, 17 Jun 2024 12:39:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v9 2/4] arm64: dts: qcom: sm8650-qrd: add the Wifi node
Message-ID: <75l2xiopwaw4yysktkowwa6zj545rwoekiigrp63tgljgo235r@yqedjqqnqrov>
References: <20240605122729.24283-1-brgl@bgdev.pl>
 <20240605122729.24283-3-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605122729.24283-3-brgl@bgdev.pl>

On Wed, Jun 05, 2024 at 02:27:27PM GMT, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Describe the ath12k WLAN on-board the WCN7850 module present on the
> board.
> 
> [Neil: authored the initial version of the change]
> 
> Co-developed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 89 +++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8650.dtsi    |  2 +-
>  2 files changed, 90 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index bb0b3c48ee4b..903c013d1510 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -2300,7 +2300,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  
>  			status = "disabled";
>  
> -			pcie@0 {
> +			pcieport0: pcie@0 {
>  				device_type = "pci";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;

Same comment here.

-- 
With best wishes
Dmitry

