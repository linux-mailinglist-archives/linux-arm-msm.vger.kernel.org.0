Return-Path: <linux-arm-msm+bounces-73039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC449B525E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 03:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED06C1B24DB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 01:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 932C3155C82;
	Thu, 11 Sep 2025 01:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DI0iCh/z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E14B72617
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 01:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757555127; cv=none; b=ba9QVoh8fwdzt4LVm5hnQMvU2+gyfol3feyxPpsuBGCewJcncR784N9HmlHmebGzeX2B1CckXXuOch5k8GQMhwg4+mFVQhsQFnWtG1lSEJZwULXZ6pUhvKlxooVEep4cVOfdXrwLwqBjX/wmpNH5lbQmJbzS2Yyi4NG2tybqgMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757555127; c=relaxed/simple;
	bh=/ybA8rV1EJNP2W7n4pc0WrgmP7vGzSXVOSvxu8gV984=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=E9LCcAiUJYpoByJsQ3W+MIKp64a8zcMRLOqoVMMSu5aGslKqjXj0AOXwxxX31ChpHaQggGLC4DsxVsiq3fj+VOhI/FxbwjCnI6O3gd4bztlG2XRNNYMm+O2FVXJdswPA9HBY5YWIEQJ8gkhAdn0iBosc4r12Ao5XyKGI807cf7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DI0iCh/z; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45dde353b47so823475e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 18:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757555124; x=1758159924; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/d3COCVOI2+CAvfRN1DBcCvbUT4aDWnGnI7OhpJdo8=;
        b=DI0iCh/zjBsPg9Zf5gIIBs8oo0R6WNy4/3pXrWpcxhEJsimM02G8gjTWtIn7pQveJf
         K2qEiSQK97uXsGfpC0NhnL8TTQpjNI0mAN3Z+f6M70mh+7NiudxTzf3LLgui8YOTOyic
         AaoQFUfAN+wilkKF4cTO8FEf2gb8VDDlT8I/rU2a/0ewPZwh/zQvabCjHJrqoK60BD6j
         slmOgVy2Svk+5KIQ7ErOWegrGeO/GBrpLirMCzjooZ6GedZTPyOk12gGosvtTqV+bPWE
         Lwk7Yd5biCuhZOKqpvAhuqHPog7+jZebre5D8byehh3S6opiMHeTSs9GvVgJi3J4ryl0
         qpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757555124; x=1758159924;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M/d3COCVOI2+CAvfRN1DBcCvbUT4aDWnGnI7OhpJdo8=;
        b=mXWTvK4WRr4cEs95IWQeGItQeIQj6w5pFY3JanUoqqxFvAvAOcY5j2GdsloMufLi5g
         jomUGJ8eakiK29/rXC68H49e4baseh/cFzqwj504vuaOj/S5ce9AOf4L9w3vDXyrCR8s
         hk8/hGJ/7aTPZ/m2RPNT9rjUbICUJDPpC7qP3IZkM/tYO0DI/9SWqW8meBNPA6QOSVpF
         agwSpYsWzD03fYikWm0d9sE67fuw2QowUxfvmul3DvUOqQDkKT7EHoYGr1x8+yerHzEb
         lCy8EJ2l/YHOHtOf46/VWhOEc5OBi1feSpWwN9z/QFZhAVFYIEXNvQGuaL59tyyBbK5g
         GIZg==
X-Forwarded-Encrypted: i=1; AJvYcCX7WnVoTtCjr5TxcFc1N0dn+2VFww9qAsfKVAxORvrx5w0/XhCEVPK/2suFlTh12qQo3Ae1Wntycjsm+KBH@vger.kernel.org
X-Gm-Message-State: AOJu0YzUyQd+CND6UOC5wWDTD6vF3Y4mnJkWNQXhKTnRlQA/+RPxqV3q
	CjBu8smHNXuN31DNXBjMLk9Pad+ua4kRAaL3ihTwtgxgDJu5g7WPdGoj/rlX8l1RaAg=
X-Gm-Gg: ASbGncsP7arHxQwrfSBnu9I2loNLOH0DEz5Kj7W799X3taUJO8YZRHOZT3h8LbhsbQz
	uEfpW7HZBXfdyUpu8CAs25Wv+HVgxBnW/6hKIn11StTrUR34pm7J3QyOjX5tCikId9luHJhSKuZ
	mdwULZ65mzc8Ws4vKA6f02WFJYadR3z063PKVuWzu4+RbiLafmmXJVrIDHOD3BA822kXhMCNgZi
	4eWSADxR+n+VRXf4aB49UfxLRaWXbMgGDHX51lXQX3Xo1nJ0xmH+pmYLfr9a+JPXlLPPU/ZWUeX
	lhAdXXOb5Hbx9A3KnhihbwrGRaXCuUXXOoJsAwj7A7N5PEmPOuFoarKOxAMRaXxJYNUH4U60e69
	mUpuPYjj2RCnaSgtdupPYVMKCx0OYZl1NN84M8w==
X-Google-Smtp-Source: AGHT+IH4eMVXJCTPangdeJtchrAmKu6Lteh/vHgi48PICpOXu0flxxJARIoGuHWpxATLSXYCQLGOzA==
X-Received: by 2002:a05:600c:1c8b:b0:45d:f81e:6258 with SMTP id 5b1f17b1804b1-45df81e6532mr38124815e9.29.1757555124017;
        Wed, 10 Sep 2025 18:45:24 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:a727:6a46:52e3:cac2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607870cfsm480074f8f.19.2025.09.10.18.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 18:45:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 02:45:21 +0100
Message-Id: <DCPLAK9BYI9D.256FT1VOPLSW3@linaro.org>
Cc: <lgirdwood@gmail.com>, <tiwai@suse.com>, <vkoul@kernel.org>,
 <srini@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.dev>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <dmitry.baryshkov@oss.qualcomm.com>,
 <linux-sound@vger.kernel.org>, <Stable@vger.kernel.org>
Subject: Re: [PATCH v5 01/13] ASoC: codecs: wcd937x: set the comp soundwire
 port correctly
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>,
 <broonie@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250909121954.225833-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250909121954.225833-2-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250909121954.225833-2-srinivas.kandagatla@oss.qualcomm.com>

On Tue Sep 9, 2025 at 1:19 PM BST, Srinivas Kandagatla wrote:
> For some reason we endup with setting soundwire port for
> HPHL_COMP and HPHR_COMP as zero, this can potentially result
> in a memory corruption due to accessing and setting -1 th element of
> port_map array.
>
> Fixes: 82be8c62a38c ("ASoC: codecs: wcd937x: add basic controls")
> Cc: <Stable@vger.kernel.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>


> ---
>  sound/soc/codecs/wcd937x.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
> index 3b0a8cc314e0..de2dff3c56d3 100644
> --- a/sound/soc/codecs/wcd937x.c
> +++ b/sound/soc/codecs/wcd937x.c
> @@ -2046,9 +2046,9 @@ static const struct snd_kcontrol_new wcd937x_snd_co=
ntrols[] =3D {
>  	SOC_ENUM_EXT("RX HPH Mode", rx_hph_mode_mux_enum,
>  		     wcd937x_rx_hph_mode_get, wcd937x_rx_hph_mode_put),
> =20
> -	SOC_SINGLE_EXT("HPHL_COMP Switch", SND_SOC_NOPM, 0, 1, 0,
> +	SOC_SINGLE_EXT("HPHL_COMP Switch", WCD937X_COMP_L, 0, 1, 0,
>  		       wcd937x_get_compander, wcd937x_set_compander),
> -	SOC_SINGLE_EXT("HPHR_COMP Switch", SND_SOC_NOPM, 1, 1, 0,
> +	SOC_SINGLE_EXT("HPHR_COMP Switch", WCD937X_COMP_R, 1, 1, 0,
>  		       wcd937x_get_compander, wcd937x_set_compander),
> =20
>  	SOC_SINGLE_TLV("HPHL Volume", WCD937X_HPH_L_EN, 0, 20, 1, line_gain),


