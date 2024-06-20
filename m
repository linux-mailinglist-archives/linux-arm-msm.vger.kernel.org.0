Return-Path: <linux-arm-msm+bounces-23439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D0E911329
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 22:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02F7D1C21498
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 20:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBDF1BB690;
	Thu, 20 Jun 2024 20:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ijHXEocE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4220B1BB688
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 20:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718915314; cv=none; b=IadWc23y2g+0Rx9cu4pzyCp+17a/4Qu+ih6JPu4bE9HUSmCKNGth34IogUmoH5ARIBLFLTVg7/ZK1g6qZ+ePp3Wc/ufE5mHvyB7E9BNqEX5Y19SClKAkpPdyjaNGPngMcVndNB2uDibvNfET9J5g78SkRo9VT8iX7aoQIB8AEbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718915314; c=relaxed/simple;
	bh=UkmDyFQy591dYaa7VHDPHpXjKce1/rqccMMiHX2MPEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SL343T7PubLL9y99cscPjFBQ5kjTqzzB8PZfMKVH23N0cWF7+P+oRp2RoINvUFKomdHC4S+3i3aNVcDUL+VvSDPwgciQ0KMrNyEtaSnhjIFEbzfYB4xprjHYJq1BTSt4d48niJiunr2XuzSjFR23HsSqcE1hL6HVH/vDEgjOWzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ijHXEocE; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52bd48cf36bso1437478e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718915310; x=1719520110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Qq7ONicKjWObOBmDaLHMa6+38qMtcLZP9rDKDaS5bI=;
        b=ijHXEocEDueD+99MDKnD7Es5/8KoYQ3ld9dm0qcDFRjxmtWY5XSWqOwKfDhzebYRMS
         gVmn8DMUzcjk7D+hlShDkK/B+CVp/oQdNgbJZyi6B96Hbc4t/MEDsdlVk3ezk0JWJsrs
         dvKXbFFtV3RYhFmwRmQRFphYOFPfBnyA0IOUkJAUiMnLdwM8aVJUyReAH2BabkwhH0pd
         UUIFh3IsyQmvHIpncpzrJkxrJJ6E+5KlUELXtwwLgLBixulrA2318obARBe4R0xT4teB
         qgyY0NtA2Pt8vH6q8VTVpHrAJ4QNzFOKxDdAzLC/wb5IdSF8AxRoEdfJZOMBN2icNi9v
         Mp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718915310; x=1719520110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Qq7ONicKjWObOBmDaLHMa6+38qMtcLZP9rDKDaS5bI=;
        b=fry7VvdH/ufYoxd9ZtFzuS1z1Z7ruuP6ekU0YwcLZ0JXJ90N86RxJNjYrBQBPWUqtP
         RI2AUQQjrPsCDmbHrma5iqca7RPpHwYyvDMbHr5QQ04SdjzBB5f+h+cfLEkZqAJtIUgy
         rBs/v1Q4/VmRKV3xVBaMHR1YsjbUSUnwAxF0z+8CT0fKXqqeUOxlGkyqTRyLCPJR+xse
         YNmMj2M7XXD6ch3RWtlREo6YSMP3blZeedl3K8aq3irOclJ6+u/0i628VnNoXSd7Gyip
         pYWqVMn3fauaOo97YkPTwN2NAQXt4vYpKZ1vYpIN9iVVpT0mOXLQc8ztyRsXWhBNXy6b
         LqjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM6jULCYCM6u0/jTx79wml2rrQsyuODhSzu+qO2rYy91fZocJp+EIscA5uC2NpGtsF5JSRyMEAyy0yA4LQ12W0rpJiSWpcHW3NjdjEuQ==
X-Gm-Message-State: AOJu0YwctuKQq0jO+JkPivSjBFvO/K+M+Wgcy2s1neK20pecyxBFC8VJ
	9XtLuInECA2G0lcHYbTmpatHs3OiaMYGKXwslxZ8RJxX/RIvQAfZuO+I8YHPd8g=
X-Google-Smtp-Source: AGHT+IH//vghqAcxQJwYgnR3Ce2y3NWrMIiABGLcHezgJ21sFgCt2msKsgQEX+zkT9WfeQcTRVsKdw==
X-Received: by 2002:a05:6512:3f0d:b0:52b:8365:3630 with SMTP id 2adb3069b0e04-52ccaa885a1mr4638439e87.51.1718915310420;
        Thu, 20 Jun 2024 13:28:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca88a96bdsm1867368e87.306.2024.06.20.13.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 13:28:30 -0700 (PDT)
Date: Thu, 20 Jun 2024 23:28:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Manikantan R <quic_manrav@quicinc.com>
Subject: Re: [PATCH v2 2/2] ASoC: codecs:lpass-wsa-macro: Fix logic of
 enabling vi channels
Message-ID: <hz5eqta4ttzsnwttqzqrec4vcwvyleoow7thoiym3g3wjsfqk4@tx23nktde3gh>
References: <20240619-lpass-wsa-vi-v2-0-7aff3f97a490@linaro.org>
 <20240619-lpass-wsa-vi-v2-2-7aff3f97a490@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619-lpass-wsa-vi-v2-2-7aff3f97a490@linaro.org>

On Wed, Jun 19, 2024 at 02:42:01PM GMT, Srinivas Kandagatla wrote:
> Existing code only configures one of WSA_MACRO_TX0 or WSA_MACRO_TX1
> paths eventhough we enable both of them. Fix this bug by adding proper
> checks and rearranging some of the common code to able to allow setting
> both TX0 and TX1 paths

Same question. What is the observed issue? Corrupted audio? Cracking?
Under/overruns?

> 
> Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
> Co-developed-by: Manikantan R <quic_manrav@quicinc.com>
> Signed-off-by: Manikantan R <quic_manrav@quicinc.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/lpass-wsa-macro.c | 112 ++++++++++++++++++++++---------------
>  1 file changed, 68 insertions(+), 44 deletions(-)
> 

-- 
With best wishes
Dmitry

