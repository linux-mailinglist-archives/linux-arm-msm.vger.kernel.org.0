Return-Path: <linux-arm-msm+bounces-24210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE6D9177B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 06:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D729B20C7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 04:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2655113A88A;
	Wed, 26 Jun 2024 04:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cGTuJTE3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DDDA31
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jun 2024 04:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719377660; cv=none; b=PyOqfYODJiVPo1hsxS5OEgM+kD48wEP1U86+Bh7v1RgWewpdyMxZIT6EMmpRx2jRxd9hTGs7A8TPw2QvGV3Y3TWHTMlt9giFuRJ9q8+JakkPik2qHWAMDC+C/NuCTnSKDeozvOwWqX33c1WAlXF3KgJjH99Tt5Th2iZifVkLkG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719377660; c=relaxed/simple;
	bh=MThcRH/5y0Z5+cdx2QcC+ZUQpATsAyR1GoKrsFAGF7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M6yvo+oL4Mo0NPHHVYsS+a7oC+IfSWqmlFcEfO4YgHJBMqp5RWvn1/PcRFgSt5dJbCyzcKLmhcmDkNv4ug9Rhyo1h8MorCAU35FWr8HEv2ZyUIatIjX2m+Eckve5ywdB0cQuJlAYpGahpBl+Yp0Xe85UnXXxRmGJzcBT3ixOSIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cGTuJTE3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52cdd03d6aaso4139562e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 21:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719377657; x=1719982457; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qDTuss67Yx7fd7cDafIxcHZxnByw4QHrUKzvfDG2YAY=;
        b=cGTuJTE3giCuWsReqZpu9Od9wsrtbrY3IWwNiE5AN2Gc8T4SFNY1oOanoTTQyRJEJC
         j7xhuTDo+yAp2Snkd1X9xSarF96BUV1UnxcRJZ8IXBy3c/jI/z7jojGmSOrekchzcRUk
         2R365PfnWWmCOArims1HXqpmqriCW28TSfgPlYE8mdABJj06HoJURP9n0+3GnM2sJx1d
         yIrauDMLqhuQn0BMQC1Kp335TZeDzMj1Z30ImQJlMRBqRRXEBVKmihW1RuMSxQbSTcRf
         oYwkF6UWWzrRhHtWF08Am1ikuAPfLTt7cgREXVtM+KCWdiF8pbJCTmYT6OUEpxRbXMJ3
         3w/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719377657; x=1719982457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDTuss67Yx7fd7cDafIxcHZxnByw4QHrUKzvfDG2YAY=;
        b=SiONC0EXVoG2qL6bs7mMRb77NEICwOSCZhfXoVa61jRfniJ7A8rs62zPOxRXu3O8vQ
         Hb8Y+TuSFeIV91TQvrPyAh+Zn1JW6PyV4xQrLa5JY4r4cNKGnBz4A/SE/mRaSW0t5Uq6
         dhRsraQGWxIFlcjAXisryON77RcgeyGNbf5UFF+5IAFYc2pcmRXCZOW+mhPNTY/scV5G
         8v23hYFvztHEpt+0F929WR39tcxmst9OBbyY7Fn5l9Iz5tzY1CdrkAgq7SdDvh1NuG2i
         AdAmDIZgSW3rFqbhxxmiSeELwb0Sf3wqfpTqI469/yZXMT4o9/6OnCht69H3OqsG9/d/
         oyRg==
X-Forwarded-Encrypted: i=1; AJvYcCXeeLa9YQVkSLAav5c9ZeOW2SOkpb4IFg5gz3HaVJOSEnNcx2FZVSa80KkYzgVKEthOy7LR3ItSf/tMGfwfdIoNPIboW1zRy3E28kQkTQ==
X-Gm-Message-State: AOJu0YxHq3UXZ+jpsNm8cHI2FT6giTqsXc63MquFPpROx9n17ehu79/w
	bT4o7BDcIJ6iQLVMmkrUKpsH6a+bLwOXwYp1VSi+9j1KvSLYL8iyPGudF0A5LVYrLxCnGYX3jNM
	WroE=
X-Google-Smtp-Source: AGHT+IH5H9cgOkKO3nvbL83vH3jZYJen4Iv5JetxLRNvEOsW2fJhXlCV5czSrb1aWQsTV8ChH4Ge+g==
X-Received: by 2002:a05:6512:5cf:b0:52c:cb8d:6381 with SMTP id 2adb3069b0e04-52ce063e3f0mr5993129e87.13.1719377656650;
        Tue, 25 Jun 2024 21:54:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52dd3e25658sm63300e87.131.2024.06.25.21.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 21:54:16 -0700 (PDT)
Date: Wed, 26 Jun 2024 07:54:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ASoC: codecs: lpass-wsa-macro: Add support for newer
 v2.5 version
Message-ID: <pyk6pejxeljab2k6pgnris6u5yxje5kw4kbalo6h2q4ntvjm26@nsokskgdgg6f>
References: <20240625-qcom-audio-wsa-second-speaker-v1-0-f65ffdfc368c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625-qcom-audio-wsa-second-speaker-v1-0-f65ffdfc368c@linaro.org>

On Tue, Jun 25, 2024 at 06:58:44PM GMT, Krzysztof Kozlowski wrote:
> Hi,
> 
> LPASS codec v2.5 and newer have differences in registers which we did
> not implement so far.  Lack of proper support is visible during
> playback: on SoCs with v2.6 (e.g. Qualcomm SM8550) only one speaker
> plays.
> 
> Add missing bits for v2.5 and newer codecs.
> 
> This is similar work to already merged:
> https://lore.kernel.org/all/20240612-lpass-codec-v25-v4-0-f63d3676dbc4@linaro.org/
> 
> No dependencies.

I didn't check the register values, but the approach look sane

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

