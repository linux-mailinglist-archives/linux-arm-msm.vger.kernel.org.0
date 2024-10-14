Return-Path: <linux-arm-msm+bounces-34303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C88B99C6E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 12:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB6EF1F21BF0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 10:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C06115DBAE;
	Mon, 14 Oct 2024 10:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qGrTfZdF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D9315B13D
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 10:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728900739; cv=none; b=qE7/7Qq1U3bf6EUXufjQkt8Q0cU9ER403YTzA7RCi8+VFHHCDyEiTlBrw9Vapu+6Qrg9MgFGRP6kMPnGexvsrBnSgm1rP+VHWE5Jf0F5Vv6/CO1+wOLXUAOYxrVgTjU7YuC+vSZkQczZV2m4ZcXpy3iFv/GDzlwUVvslanVChts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728900739; c=relaxed/simple;
	bh=Zs8AtWUh07NfAKTs3qqDy9KM3w8xqKlzi+0BOuBqdDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUNbWDT46+g12DHJTz9buQPS1b9qb0pDGaYyyWu5AM02mS82XnSpmM2y5nQMtEUxcv6jDdSmlQHjg9h7FxNHXwI3Rx/BsLBJwj4S+VFVaQyCGVD1Vb8nwwvdGDsW0LdZGoW14YFeviIDky0bkJNViaL5PEsSQ/m/PhbUomJ/PP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qGrTfZdF; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb3c3d5513so19622701fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 03:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728900736; x=1729505536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3yc6ctpsHbX6YCt9XadmJHdwyVhwz7erGM6NKirs2sU=;
        b=qGrTfZdFZOnDoYco3/gcBrqbdI66+ErU86Sj8Fph0Th89rA96qllzWDMdJ/QL5gjI2
         Vw71Z2VaqX4AitYcd7Z85913FLJjGleNWMinWZnMyhoWXmtN5X00tXdwQGH47kca+QOc
         ldB5bpg2EzfZZT0iRtgzavWn6QtNjBkEWGp6z4u8NKMrv5EvjIDIn0f8wMonAymG95ga
         VZHe920yZFUQB0CVRwM3t1gFYSYzWBDYO6bvbaw9YY3RKfEvxBpF04BSUQYjnHnI9Qvr
         ujAxORS2Fl1ZH7QVcelxPNHAYYKfthOBlM0BWPo9xp+HAQkLYD5D2FbSsP3xYvMGzPh0
         6RiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728900736; x=1729505536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yc6ctpsHbX6YCt9XadmJHdwyVhwz7erGM6NKirs2sU=;
        b=PBJRrAP7xVugcKNvtS4ftYbJhKYYyCXgWuFiPfdGXACO7CcVARo3BPM+EM50LUM9HC
         ch9l4rmwksFsG8+6l+1vjFgFpgUJ/0eOm0id1GNLq3Kc9q9J5y3mTUhEHtv6/biMM/Y7
         qAeZhv01vncMkeVAkweKoykDYLlbGDNqv+IZEkZc/S+p4LoyPK7vkDGoGAvCKtPwAbdM
         952ibPh9U8vT83JNB8v5aElzuCyIxR/LdSPynKDg1016tEgUFc0mZOoWDAkF/Pc/wv54
         KXebY1e7Pb/yMFVPTdIp33M29na1PuuOxsSlZho3kitaxj3r7nU7aeu9enGNaeFFQJ6y
         3+yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOSe+iq8ArGSRiYTYuYDSztxMaI7xL76UpQqVaYD2jhVQKXeFCck+ENzmZ7T/3ny2dbAocMI44y16/rS9X@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/WPsdCuCVvBI8OKCT/yIAlxqnoYftOFysmzpSSbQMx4FQgcgF
	MAX9oev5cy19rhQZlda3cv0DFfKdYX++89c4NwCs4myPGTw09RtDD9R6Ypor6tRhViYcdi8Pww8
	qfvA=
X-Google-Smtp-Source: AGHT+IESLKXq8wQj4z3XVtUskLidPbL/Kk2rTlf6EDu1vGb14muOPCd2AdoLZfS7fjFUmFoxDtuGoQ==
X-Received: by 2002:a05:651c:512:b0:2fb:2e27:5334 with SMTP id 38308e7fff4ca-2fb3271573bmr50820851fa.15.1728900735798;
        Mon, 14 Oct 2024 03:12:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb24706343sm14333691fa.77.2024.10.14.03.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 03:12:14 -0700 (PDT)
Date: Mon, 14 Oct 2024 13:12:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_fangez@quicinc.com
Cc: kernel@quicinc.com, quic_lliu6@quicinc.com, quic_xiangxuy@quicinc.com, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/6] arm64: defconfig: Enable SX150X
Message-ID: <it2yaebzazylkebwmouet3eccqa4kpxqeu6cosqlf47qjiqhjy@34s4ch2xidao>
References: <20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com>
 <20241014-add_display_support_for_qcs615-v1-1-4efa191dbdd4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014-add_display_support_for_qcs615-v1-1-4efa191dbdd4@quicinc.com>

On Mon, Oct 14, 2024 at 05:47:27PM +0800, fangez via B4 Relay wrote:
> From: lliu6 <quic_lliu6@quicinc.com>

This is not the name

> 
> Enable SX150X pinctrl driver.

... which is used for the abcdef board.

> 
> Signed-off-by: lliu6 <quic_lliu6@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 76f3a6ee93e979e9e39cb0283699a2753b0dddf4..13ff005ebe0e9cfcf171b08add24465d0ab94f05 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -630,6 +630,7 @@ CONFIG_PINCTRL_SM8350=y
>  CONFIG_PINCTRL_SM8450=y
>  CONFIG_PINCTRL_SM8550=y
>  CONFIG_PINCTRL_SM8650=y
> +CONFIG_PINCTRL_SX150X=y
>  CONFIG_PINCTRL_X1E80100=y
>  CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
>  CONFIG_PINCTRL_LPASS_LPI=m
> 
> -- 
> 2.25.1
> 
> 

-- 
With best wishes
Dmitry

