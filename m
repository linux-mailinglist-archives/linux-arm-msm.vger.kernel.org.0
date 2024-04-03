Return-Path: <linux-arm-msm+bounces-16311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9458972CB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 16:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EA931F24BD6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 14:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D28858AD4;
	Wed,  3 Apr 2024 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PVk7GYRn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E71433C6
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 14:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712155136; cv=none; b=oJ1CalneOoFLysVPUS8jYYTnYDxxULFDvlHNGdffeonZbcvX5PEpUyQOOeumWSfcClC0aTI/96VcKTiTxhstnAL3gY5QQGVlVRDWyBo6SAlHX87sDFqaU4GOs5Ud/gMzQZzkGrEnBLndCVvr8a2LsCdjGn73JzS4eslNarQTp6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712155136; c=relaxed/simple;
	bh=XYcOgAxXGHkhdpIHXAt+v3lV5PqFxI4zDcRmVyPX0BI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RRr4cFj3tC3pW0frX00JiY+Dx9ATO5q/ia9/WfKapbzOavNWK2tae03n7iDZwPtz7lIa3gxYd/zNB3kgrwXIfR1uA0UXwk9Ps/eTjcaL0I/eH3QN8J8hsZ2TpqzmjjSDm9RNxJYZ8d22Ckv419ZuKtlqQmMluN3c+qnNGXb/2Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PVk7GYRn; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d700beb60bso107948371fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 07:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1712155132; x=1712759932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+F+lR6B8bWc6SG6ZnyFSW9uZxcK09xY01XuwqgaSMg=;
        b=PVk7GYRnfKz6yz53eg/cJXGpKTtvQEW/3g2GqQPguDKZwttK3x+bDoTwGRKA0KN6Ob
         0tCtIZsCn21E/36H/k/mAYjBh3OstYKHU2t4riPHOpp4kSdsKNlgaHbks48vBwkf9Rg/
         gN+/ZN4zlu6hwEJw/mDGAFo0dUPeVShg9FPHAyUN/AtaL3ezz9MIfn8CerDuVT8zFImC
         D0aXKpGazKa1aKiOiixE1oZthylArBwj+kzVpaN9YEcUgNN9916boOBloC4BAlEY5O05
         pm1+0N2YEe4pZmfV67GbnjfvYn9+Gx2UIbn11LeV07bisU6J/Zzwu2aOYW205JWu9v/5
         KKYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712155132; x=1712759932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+F+lR6B8bWc6SG6ZnyFSW9uZxcK09xY01XuwqgaSMg=;
        b=YynMjqBc2sidpUeKpeB7t2hgx99FNRe0ohS/fCHFYQknTJsarr+AoCw+ceSsEGRpri
         mQBtVJQzj3UHe1adFtgr+X3UozFxGl5iw/vO/OxIlsvcyXz/PGoaSTXBMa597QK/ooAK
         zjYAAGccdK4xfBeSLQplCZpKS1yeAh/ELcZ/X6hsBXD1pJ5uN5Dip3XXMCBhpQbaOwJo
         BC6/PLUFTPGqX0y8dLl72CBWXc+Hp1UZxOhLEoDFB3IKRCp+JySYeNhAB7lBFAcS67+O
         RS6EMlmovIziWTTChvvh3J135DJJMTBkk8KPfr/bdGRhu4YD933XmTnFkp3NlmYupgn6
         aNMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAcOpHkxt1HaQEy78d5toNq3rqr3wlHsTHBE8QU8gdGMgrBzPpnBc2HfzceACu2XL4F2iSWI5uEaG5vGydp4V0+G4tk6i5HnW6xYkh4g==
X-Gm-Message-State: AOJu0YzEaGlLHZawvE3gvbw1gAedvgMo+opPJUm+2fNI9MxqJzrGhIeP
	y0bBrOrNM1fXMlFSVJ3xAI5sj3joilwYOX8caQjHY3BT55jIx8EiydgN3kfovFraCSxTHQS4CbB
	IA29kT5TD9JFgriDRmS/RYuiEVmNL3T+FWvUo5Q==
X-Google-Smtp-Source: AGHT+IF1Albu6Nu5656ydaWZAfWTTjTKyHecYttGRSLH5VhQZv6FHYuZRgl2PbIf0IkYHQVJX9L0Pn5q/EpMAZjZ/CE=
X-Received: by 2002:a05:651c:2320:b0:2d8:36f9:67af with SMTP id
 bi32-20020a05651c232000b002d836f967afmr2199291ljb.44.1712155131493; Wed, 03
 Apr 2024 07:38:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325085756.13843-1-brgl@bgdev.pl>
In-Reply-To: <20240325085756.13843-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Apr 2024 16:38:40 +0200
Message-ID: <CAMRc=MfOWpwsRODOS4FO=b4CU4zsM0LVnb94FmAU_6QOSXCKcA@mail.gmail.com>
Subject: Re: [RESEND PATCH] arm64: defconfig: build ath12k as a module
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Udit Kumar <u-kumar1@ti.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 9:58=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Qualcomm sm8550-qrd and sm8650-qrd boards have ath12k modules as part of
> their on-board WCN7850 WLAN/BT packages. Enable the relevant driver in
> defconfig.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 6c45a465a071..937edf09f0aa 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -411,6 +411,7 @@ CONFIG_WCN36XX=3Dm
>  CONFIG_ATH11K=3Dm
>  CONFIG_ATH11K_AHB=3Dm
>  CONFIG_ATH11K_PCI=3Dm
> +CONFIG_ATH12K=3Dm
>  CONFIG_BRCMFMAC=3Dm
>  CONFIG_MWIFIEX=3Dm
>  CONFIG_MWIFIEX_SDIO=3Dm
> --
> 2.40.1
>

Ping.

Bartosz

