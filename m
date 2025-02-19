Return-Path: <linux-arm-msm+bounces-48489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3A2A3BCA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 12:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2ED57A5680
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 11:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CD31DF263;
	Wed, 19 Feb 2025 11:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q5vS1YIY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490031DEFF5
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 11:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739964257; cv=none; b=UbBQnV5kJauaKBJhT0xEtk5zZ1y+V3t6+5ianBJOjfXPG7ahC8ZrjdFzcCyxbOGA7b63DTcgAM6qvKA7lV7TwizLIz33qzu6bA3lpWBG8aLjOmL+/nSf9SFKftcJugRYHJuAJOYLRjNunMerE92zSnsCXXqM5rxUy+ZZ2T1Gmlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739964257; c=relaxed/simple;
	bh=3IlmgeaiPcaakLVe2YScE/woJneyFZcSXJq5bqdngbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2pvG2sIzykhzk1eKVZsT9NlYvlqd+rMYjr12pSLYSiqND2sh2a5kX3vOoFY0sulf1YnxBcCfhp54onjCrfQFzLfmSWMK1yUu1oDshFhLJR+QSBpn9ge2G3uYzttRR4Huw2bEaonScccd3rI4c9GwmKHSHRhtnNRU/u+AaM+nJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q5vS1YIY; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4399a1eada3so7776015e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 03:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739964253; x=1740569053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tdPhTPgNb5WdAwuNYkFk04LlQR8UkULvprs/hSb+yyI=;
        b=Q5vS1YIY7lYTNSNgI7OTgjuJ17bFqhTU5i2mw0UjNn5eVsfe+q6aGOu4g6Oz9Vu2gh
         VY6etKU1zT+j05fs9hdjdxiuDu8pz6bSLgP+7pMVdi/0PdCzFnksTt+lYOtDAlUnP7Zl
         pdW1pf598RJC3r9gW87TWDOJUNogkDbvvlYafZzE18MXs3gmS4JjFAklM6Cl8ip4iuMo
         qeGs/QwfrsyhBkwre2IRRyoSef0qNv36C/aGKSqd9tLTqMVo93reNoghnnAmoUTsRJzL
         XXjkm0wWzbBNGX48R3C4ABCP1E7fKnBFEzI2BT5Mu83WCbEtdC+XI1A/EKDXDjY9VGGc
         36xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739964253; x=1740569053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdPhTPgNb5WdAwuNYkFk04LlQR8UkULvprs/hSb+yyI=;
        b=klLxhrtpb0H9YYobhDOougXFj9vEuA224SyEKVUBpRaLIkyAorVYp84MKeuFQkTDkx
         wXnchRdUDjJgOGs4k5vFMs5+YwQcTEaONP8oewZfR1b5wswINhHnqy/lSpyP7jO5wt22
         xGaAuOszJlNKGdUaYqsDr6EYRf4RDJxkDt2HYbY/bnA6HI5EOdKrGOmQKpQVoLf0tTrU
         ghIK/lsLxqnRgQwPuik+M/q6X9opCzeOOB6GJPrXUsgU2wh+vVSKMVcuxgQhzt9yfGxL
         Dqw+IcrPzBqhzE6t/qxzyIAXLk/WQSJzrzWIdfSWt60AQCqiChIMX5Kt+ijh8Z0dqm7t
         hKbA==
X-Forwarded-Encrypted: i=1; AJvYcCWw+DlVvOOD5T0b6C6bk79Qj++H57zY2TYx57bi7LPX2avxO27AApdilrbW6DOa2JT1o8DDmaoxrZATnjdt@vger.kernel.org
X-Gm-Message-State: AOJu0YxA+M/9LeDTTH8qaVeeZIZ92RUovv1xsIimIcnvroyVTiZcwYPZ
	9oaZTSNGVp+iCR/GofzaTVcV8K5PC6BEIAZR0v97qkp+JaTfQgCpVc8sj1BnyNc=
X-Gm-Gg: ASbGncs/0AuCLnEDqunGDdvMtC39B+VCdNbP4L/1Dvwm/fEAIn4dXgMYUexl4QYuEWa
	RjgSOZKyC0jTuYEqg3XGw2K6hNZlQxX2WOwQyS6skVyT8/NkjN6lYGXtqn1JZRb69MG/g91wV3m
	+ecktza/z7wyRSEtW7ow1+MlNw8e9eoIdUojV5SM4hX3MKki11AQG7hmA9B0YZvCrY8XHhl1mg5
	7Vif4S7nvOgCgrAOtjs//lCGCLq2v1eJ36Xbf9/VDP53reIHYAKGtkxhX4k6uYSOknSEXLOF2Kx
	UpVWoR4tuof+ou7LdnSCL6XX+3E=
X-Google-Smtp-Source: AGHT+IHyRalKTLx08DMpyY8D7tJnSYBfCjrsKNqbrlJWe/vLGSVDWGPykiVGFecncMvPPlaiWmLh0w==
X-Received: by 2002:a05:600c:3b9c:b0:439:967b:46fc with SMTP id 5b1f17b1804b1-43999d8f506mr31097145e9.8.1739964253497;
        Wed, 19 Feb 2025 03:24:13 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:6f72:6161:57cf:1c9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43992ad82cfsm51235505e9.37.2025.02.19.03.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 03:24:12 -0800 (PST)
Date: Wed, 19 Feb 2025 12:24:07 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg KH <gregkh@linuxfoundation.org>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
	krzk+dt@kernel.org, pierre-louis.bossart@linux.intel.com,
	Thinh.Nguyen@synopsys.com, robh@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v35 00/31] Introduce QC USB SND audio offloading support
Message-ID: <Z7W_Vz_kVDjIcp5N@linaro.org>
References: <20250219004754.497985-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219004754.497985-1-quic_wcheng@quicinc.com>

On Tue, Feb 18, 2025 at 04:47:23PM -0800, Wesley Cheng wrote:
> Requesting to see if we can get some Acked-By tags, and merge on usb-next.
> 
> Several Qualcomm based chipsets can support USB audio offloading to a
> dedicated audio DSP, which can take over issuing transfers to the USB
> host controller.  The intention is to reduce the load on the main
> processors in the SoC, and allow them to be placed into lower power modes.
> There are several parts to this design:
>   1. Adding ASoC binding layer
>   2. Create a USB backend for Q6DSP
>   3. Introduce XHCI interrupter support
>   4. Create vendor ops for the USB SND driver
> 
>       USB                          |            ASoC
> --------------------------------------------------------------------
>                                    |  _________________________
>                                    | |sm8250 platform card     |
>                                    | |_________________________|
>                                    |         |           |
>                                    |      ___V____   ____V____
>                                    |     |Q6USB   | |Q6AFE    |  
>                                    |     |"codec" | |"cpu"    |
>                                    |     |________| |_________|
>                                    |         ^  ^        ^
>                                    |         |  |________|
>                                    |      ___V____    |
>                                    |     |SOC-USB |   |
>    ________       ________               |        |   |
>   |USB SND |<--->|QC offld|<------------>|________|   |
>   |(card.c)|     |        |<----------                |
>   |________|     |________|___     | |                |
>       ^               ^       |    | |    ____________V_________
>       |               |       |    | |   |APR/GLINK             |
>    __ V_______________V_____  |    | |   |______________________|
>   |USB SND (endpoint.c)     | |    | |              ^
>   |_________________________| |    | |              |
>               ^               |    | |   ___________V___________
>               |               |    | |->|audio DSP              |
>    ___________V_____________  |    |    |_______________________|
>   |XHCI HCD                 |<-    |
>   |_________________________|      |
> 

As I noted on v34 [1], this version is still missing instructions and
changes needed for testing this series. The device tree changes don't
need to be part of the same series, but there should be at least a link
provided to give other people the chance to provide Tested-by tags.

IMO we shouldn't merge this series without those instructions, otherwise
we risk that this just ends up being dead code that no one can use.

Can you please share the device tree changes for a board upstream and
any other changes needed to be able to test this series? E.g. for
sm8250-mtp.dts, based on the examples in your cover letter.

Thanks,
Stephan

[1]: https://lore.kernel.org/linux-arm-msm/Z63B_UE61OdrgEJY@linaro.org/

