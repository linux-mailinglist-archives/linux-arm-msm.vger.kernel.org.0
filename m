Return-Path: <linux-arm-msm+bounces-24208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D809177A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 06:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB50C1F222F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 04:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D1B13C3F9;
	Wed, 26 Jun 2024 04:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/czBRDL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28EC139D04
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 04:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719377531; cv=none; b=GvhgviwnnGL3C5zzQEh2NOLWiNM/jFA9RVYEVO+iI2h92NR+N+B6r/L89WgRQ6rg17aeTXaDopkpcJk8bnvKnbKaEFXToNq5uv1g0fx+0DHYmZgq6Got3za5IavpT8Cr5wkUUVIJBQM7aSU00QVz7ZM6VsTyz9+7ISR+cGzU9H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719377531; c=relaxed/simple;
	bh=YWCP4XS9NCMeFl42NORBvKgAR97zTeSKqwDJJ42RPHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdXMv9XFmjGbMFzzoC3+AKvQHoS4Wq68GKZzWM/ykSDReWFoii4n4PB2SyKejzr+HF6KXERYnFSXvv+Wo+EISx3UWuzLcIvHS/YCrSfHFP0zvqGlL4xT876h8ELKISrgOVnTlAvYsEnt2tCtFoPN80bCWmowTma+BVNKGotOqu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q/czBRDL; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52caebc6137so5897323e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 21:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719377528; x=1719982328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lc/ad8AuMtJ2+wNqYmI1VVXdrc0waVEdjHmQ67idPjs=;
        b=q/czBRDLs5jw/8xT8lBWuNpfHypa12ZNozSfjkcI+QTafxcFsOpOL96ib+f41q2DCB
         xFjTeqOqnsHvTOrAp3/PYvuLbqWnYREtesbHwTkYelHB5ExGsD4j2gZsvbydpGb2foFA
         aG/VBac1asieM5Qmu8z+i7u7nZ6WHIl0hBRtDqzurC6n+mbx1QDzveEjtmb+Z1KPiaVB
         Xha00pj93f5hZyB1O63fLaTFncLUqN5dND5ISEdEqtfd1AELeIm2qr0lwjzH5d7AM3ZV
         BBBjSRBQTR9gnsDORNGpePk9O/hDxvWLyLyK9jHX6qB26aR/92zmsq44PJFzwf00A0Ti
         YIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719377528; x=1719982328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lc/ad8AuMtJ2+wNqYmI1VVXdrc0waVEdjHmQ67idPjs=;
        b=JYt8e+sUfADcabzyM/hE8G/OrHm0ALKtFFON93dfqx0dh36LC/48gO8pWnIWkgqq9X
         Uw6yfie8XCFCeZdckdFxKYB0ODEidM+5ESqCPgTOpYHxZcZP/NyMJO27X8+QAvTOf7yI
         IHqbW6/ZxzXGXVliICv+tWxZ258TQkodhvQK8S1yzxXtW5I37dqw+ApjjLpiUgbWPIj5
         BZ9y+aURVcqLl7oI30LL00+aqLy9cfmpiglnw/QiIFLI2xhWFWulqp5L17WGdq39aD6c
         NPgqOBAC7caVmqUrZMhWHIL1PQginF6RTXszg6P26ofbXnqqjROSWFPMfsJJFDGbj9cn
         nelg==
X-Forwarded-Encrypted: i=1; AJvYcCXzelmKskxBp+HhkFfONgHw4KIsNjVDAQqeJmHGUhDMd39sEE+L76jnWj4P9z9bOKcGZSCMzNylwOel4YZVsog3PjbCQhOhK4PHPpVqeg==
X-Gm-Message-State: AOJu0YzGudvf3/ilRs1iOlsdwPtQSy5WKjC1CDNhbwS6Qm3PSMTlRV2m
	eBXYHQp9d44I7UhSv3z5HkFPOmf7HXNvftVGntcuoO3K7BWsc58fRWgMMHe8jMU8CbgwUi6ed7U
	ip9A=
X-Google-Smtp-Source: AGHT+IFZ09iILP6kHgbKBpqNhbwz7AeISIrZ1LRcAxMhjyJ00DcvGAljOBBjtcKB7z+S0JfJ25G87Q==
X-Received: by 2002:ac2:544f:0:b0:52c:d626:77aa with SMTP id 2adb3069b0e04-52ce18644a1mr5111412e87.58.1719377527612;
        Tue, 25 Jun 2024 21:52:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd810d633sm1394422e87.165.2024.06.25.21.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 21:52:07 -0700 (PDT)
Date: Wed, 26 Jun 2024 07:52:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-macro: Gracefully handle unknown
 version
Message-ID: <6b4rnvhqnqf2w6kbafceaclri2gq7x7lttusllqswy4nkxzqg7@bqtmns4m3ghs>
References: <20240625165736.722106-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625165736.722106-1-krzysztof.kozlowski@linaro.org>

On Tue, Jun 25, 2024 at 06:57:35PM GMT, Krzysztof Kozlowski wrote:
> Qualcomm LPASS macro codec driver parses registers in order to
> detect version of the codec.  It recognizes codecs v2.0 - v2.8, however
> we know that there are earlier versions and 'enum lpass_codec_version'
> has also v1.0, v1.1 and v1.2.  If by any chance we run on unrecognized
> version, driver will use random value from the stack as the codec
> version.
> 
> Fix it by mapping such cases to an enum of value 0:
> LPASS_CODEC_VERSION_UNKNOWN.
> 
> Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-macro-common.h | 3 ++-
>  sound/soc/codecs/lpass-va-macro.c     | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

