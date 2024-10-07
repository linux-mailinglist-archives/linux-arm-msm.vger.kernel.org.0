Return-Path: <linux-arm-msm+bounces-33427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB469934F2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 19:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9EAC284337
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 17:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303381DD87B;
	Mon,  7 Oct 2024 17:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aq8V/GRl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E031DD554
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 17:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728321984; cv=none; b=uYX/CJR1/T5VMOfkSiptF2Cfbw7WAFO1RsoD05mNnpeADzrA2IJvH+kjP8orccw3yLtj00aIR0V4/03fD2fNhQS6UOqD2xxKguKEFy5zPupb7/EtVk2pWQ69FRE31rMz2TdKW+mV15KuZJ9de3nb3/WX5IBo3NuQil0rz/57Yzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728321984; c=relaxed/simple;
	bh=pCCoHi+FSmdP+JsIamKw/AdhMR0e1YaCdPeHGA3r6A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mu7iqzanU0KrMFECpOrb79GI9VaDquM4GkhK8as7tw49WprfueZa0859n3fVcx+ACb1iH1vh4oGQHgCcf2JLsQ4V3FJ7cwAiTx40h6yeviw6K0YznwFWNz8bltsx8F+bLrc2g2TQachuCZ0Ht265sz6iJOD2SDg2PkfyLZdfIlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aq8V/GRl; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fad6de2590so69652491fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 10:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728321980; x=1728926780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WlsFqoWgQcVSzxUESq0jNu0AYxuz/E7zW/qrfaTVXzo=;
        b=aq8V/GRlLSworw4+hJ4OWnXQxvjk3cgkyh190qvxNG2p0qHOiIks9T7rzEScVyFfRu
         fmN2n868dtdJQvKChpozv2K0XoojmubId/lZgUF47uFlKcxiBLqvdOYEB9JI/m4ZkmBH
         VmCMjhTE02yLg4IuNY4H7oVe2CLi1qJD/WBOywKV6rqf8iK3ZfrBoCJwrQVPokGJGqLh
         EJPTjSvsu8aZnHoLIuS7RwMRhGLmJCo54hPF/l9fEDOjglv/6jk2LWNelNIyz1FITlPW
         3aaPbnBv0BKrBpHAmWM/YiX34GSev5bOGmFQbGqaucZNBTCUGFhbrNrL0KDb2u5ZMwPb
         52Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728321980; x=1728926780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlsFqoWgQcVSzxUESq0jNu0AYxuz/E7zW/qrfaTVXzo=;
        b=aylOIkGuWbjrPmHqPFXOS4YrCEWdA227ciQRf0+Y0dTwHVCbTDNcO7dYh0miPY9zKF
         vuKz7UoUwgmsZ/Txsj6fxEXmbFI2AAux4lQGlxcse0G6PnTrlh2Yt8R5YhcqeDoJJmPo
         lm27loXOXW8+cH2r9sPi4sRKAzauf5t2Ebo7ivWFR4YS5pophzpmQU/hAvmnhXQ1r7mp
         XZJzYbrgZpho9uzAMQe1WieF4lioR5VNEA93Yk9VszwLA5qPV3FS3L8me0hDXJHrwuIG
         w1xXNdjS6lYp04gDctNIwrYW8bAxK9qxP9MizEthDcspLRhvdE6wPR+ffbVzL1FhhuNJ
         L0oA==
X-Gm-Message-State: AOJu0YzrO1uS5spQ/2wWv59LcMaQeOy5fALNxfY3dDXOOwExse2jZV3T
	5lhpUDeXSwvsf1f2rNZ1J7jJ+KskAlaDHCAWPlsTFhcy3OMTg6XrN/lsQqjT2jc=
X-Google-Smtp-Source: AGHT+IFqkmB5EGBLDvkk9w/73LJ1moyAI2DINnegAoUXrSgjT1r9zBJuBEvu/G0C84vFxPAg3A5H/w==
X-Received: by 2002:a05:6512:159d:b0:530:b773:b4ce with SMTP id 2adb3069b0e04-539ab87ddd9mr7298174e87.33.1728321980533;
        Mon, 07 Oct 2024 10:26:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec0f91sm907565e87.36.2024.10.07.10.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 10:26:19 -0700 (PDT)
Date: Mon, 7 Oct 2024 20:26:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Karl Chan <exxxxkc@getgoogleoff.me>
Cc: linux-arm-msm@vger.kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, linus.walleij@linaro.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v6 4/5] pinctrl: qcom: ipq5018: allow it to be bulid on
 arm32
Message-ID: <m5tfcqfr35dzeidxqtrxzk454itrlf3dt5u6mezouzievjzlx3@ymkl3qdf72ob>
References: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
 <20241007163414.32458-5-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007163414.32458-5-exxxxkc@getgoogleoff.me>

On Tue, Oct 08, 2024 at 12:34:13AM GMT, Karl Chan wrote:
> There are some ipq5018 based device's firmware only can able to boot
> arm32 but the pinctrl driver dont allow it to be compiled on
> arm32.Therefore this patch needed for those devices.

The same comment:


if there is another revision of the series for whatever reason,

s/this patch needed for those devices/allow GCC for IPQ5018 to be
selected when building ARM32 kernel/


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

