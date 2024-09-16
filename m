Return-Path: <linux-arm-msm+bounces-31865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 256C597A856
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 22:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 585E11C2221C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 20:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7141B15C137;
	Mon, 16 Sep 2024 20:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R49d04Du"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B976A12CD96
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2024 20:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726518827; cv=none; b=EauvhiLPlAIv9DWaDhhQgxVmYVHu+bvRJ2A5wqyAg1LLuHbIYe8Bf8t5uuiREQs+2MoiSFDjNeEcLF58y0yWnk0vqs7mvXobJjgtCdbziHE70EcO86EddQ1w2opUFxWTuWxuZeOsv+mqX9HC4lxcZPuiK17sZl1Lnzs4lDTZVaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726518827; c=relaxed/simple;
	bh=5TA47WiIrIdHSe3xcjU9Lqfg8ws6fqDEOWtYofifKZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0PAFP4gu8P4FVoowKxuUMUHuYCuGK9Cv9EJ1GmfCeOwCE7IFjz0UdOvtAZ1RKVD57xKYAxIX/I0qlklUixlqsQurHpTfrLin3vcJzMeU3ZvIPmCpmm0lViOVyjXk77C0Gq2FERaBtlRMEtpkDWhKUZcisZ+cibCzgRB3FMzyzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R49d04Du; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5365aa568ceso4120821e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2024 13:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726518823; x=1727123623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yut24jaXEEyXf2W6luYkU7vtIEq+YITeP0mm4QVVNxw=;
        b=R49d04DuzfAJfqOQzkT1Vv8jRh2t/JYcMvt/RxrNsfvu3XsrLROgKIymyMtl4kPnLc
         LhtkjBC1ZJZ7M+qiO7CUstBRCYgYKDJha+yAjR5UJOIV5hlaCjq0qdfJG/O8rAlBrNHa
         7lAZo/yXLBY5iBvja4O7Yo2A/ZrAGrPht0XOlnjYn3SMXDz47O3w/HUlJqDdyfJqGobk
         fWuhLrpVb0KV1jzJL5KKlyrMMt0DpbBl3lynyKIvOcJLxzhw4JcVxBx/q/oZ6K5kqi0N
         BEEATgNtLHNFAGgGlTj1LRssB7e+xlf+CoLT5PWtUlxq4gbxR3BLCQe0rR9YxbbqAo3l
         OZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726518823; x=1727123623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yut24jaXEEyXf2W6luYkU7vtIEq+YITeP0mm4QVVNxw=;
        b=dpWOaxeCRotmXMKtnQNZ7zAfgDGstiWRQwXrYGmoCSwo1U6rzAHMxiV2JO/PWDhbb0
         iE739nZAPrGu4tWQh0WqxzROHIDDFrjRA6fegu6uIsTUjVLjjpnCNvasLsms/NSETLQv
         /HCcLVBvCDVRQtT85cQscl2bESP+emBGRehHtbKwDzPYq7MC1qy1L88aSJw91JM1BOUT
         jNfskgU1mzZEYH1oVxnr0nsNxWk0J6FvobSsetBZpGHpqiuxnr+b3ZqM+YxU0SZvhMqF
         ZrJysHniYyG0ezjVQTp05k4ZuwG+xIArDoYSZ76lLM9G16cDgICrr2kf3WP/5EEU1sUa
         Fp3A==
X-Forwarded-Encrypted: i=1; AJvYcCUH2/7ssA74y9EdNf8IoQsBX7KR4MFMguAU7UDGLDOQH9bClL9Gv8287JJK+5IDyEau9BKIlGnB9aZN2yet@vger.kernel.org
X-Gm-Message-State: AOJu0YyDObzlLj2ngG02wOxT7PoMX7wQHUvK8B07FUpsL7dEqqq4eYcN
	qilVnwVezd9C9wJzhqzia+VQJfzTuOoAjf5mwsukq6t0SVq/bcnIdrUt3ODbYIc=
X-Google-Smtp-Source: AGHT+IG9vXaSNFzRABgfXln+bLUZnXnpxO3ZvNYLOdCVSLIxonM0R628q5CyjP8oU+JQdKKaIhTAYg==
X-Received: by 2002:a05:6512:3f0f:b0:536:7d7d:c621 with SMTP id 2adb3069b0e04-5367feb9550mr8405049e87.8.1726518821966;
        Mon, 16 Sep 2024 13:33:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5368704685esm976445e87.27.2024.09.16.13.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 13:33:41 -0700 (PDT)
Date: Mon, 16 Sep 2024 23:33:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>, vkoul@kernel.org, 
	kishon@kernel.org, konradybcio@kernel.org, andersson@kernel.org, simona@ffwll.ch, 
	abel.vesa@linaro.org, robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_khsieh@quicinc.com, 
	konrad.dybcio@linaro.org, quic_parellan@quicinc.com, quic_bjorande@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: Add eDP PHY compatible for
 sa8775p
Message-ID: <t4ytnii3sdiqsni74d7qsi2c6uv2klwmzmgznnirt2z55to4hj@lyaoh5fzcyti>
References: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
 <20240913103755.7290-2-quic_mukhopad@quicinc.com>
 <2hv2hcpbanduw4wg2wbza4jkze4sgilrtyc7zack23uygwsjol@ckskl2rkd5xp>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2hv2hcpbanduw4wg2wbza4jkze4sgilrtyc7zack23uygwsjol@ckskl2rkd5xp>

On Mon, Sep 16, 2024 at 05:23:55PM GMT, Krzysztof Kozlowski wrote:
> On Fri, Sep 13, 2024 at 04:07:51PM +0530, Soutrik Mukhopadhyay wrote:
> > Add compatible string for the supported eDP PHY on sa8775p platform.
> > 
> > Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> > ---
> > v2: No change
> >  
> 
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

So, is it reviewed or acked?

-- 
With best wishes
Dmitry

