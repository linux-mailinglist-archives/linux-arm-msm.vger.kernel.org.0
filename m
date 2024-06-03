Return-Path: <linux-arm-msm+bounces-21467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5588D7F84
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 11:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67CED289948
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 09:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A5B55C08;
	Mon,  3 Jun 2024 09:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ls5yTesZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AF03BBE0
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717408586; cv=none; b=izd2AdoWwI25tLw2Uz+F9ZDAiT80IJTLfvE+e29sGflw4ePVmrGBJIstK4KXnKdR8azMU9DAj0IqTDwNUCt2K+TgER1yTpORLp2FqCuGJzCZ4UiIxPtrw9w4ZrSpWzhrItHQoetmqqsNa6vIrvHdVH8Ypjx8zwuQgK31yJFZzXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717408586; c=relaxed/simple;
	bh=bZUi/bPPjZgfedSE6wxqW2H8bc6Pp8KMu+hHEjG8Lhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOGzSs8dZ0DdVy4dciCW6LPh7OOCaqQBtScYS7bbUcZPTBWiOi4ybIDmvA3MspC2IY0REwQICoDb3O7k2qlwsJXLfTjBHybe1LkLSF4KO5tXtI/a+6e+f/5LXmsCyjk3G5TJI/wRsieTi7MU6bhukV6Iivt7PYpx/WwOqoGCOCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ls5yTesZ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e95a74d51fso61722881fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2024 02:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717408582; x=1718013382; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6mTx7uYu4uJ3l4mrzFi9l5SnvCCSSuUrVpO+YQxuP+o=;
        b=Ls5yTesZBBW4LluHqpLYjVFrY5l84rcHuU0emvN3RKEiaMjFydB9KHd9MnhVXxizB5
         ZiLXC81KLCcZv11yRO77QmqTMWLxuv33v5/8EdPmb4p515vfizU8jnH17lxAmL6U+U9G
         LmL5J8B+r5Lbh12CBJf7guDCCJ112ETLR6nH4SJ4KTVBhGQ94gqAvo2VGlRNnl9mUlmD
         vYAcGRTlv4q8F4Iuk0b1ppf6UOuScSBbZ23czlq4LQzXLUhta7vYEJ0/heMCI+2ldHR8
         OV2N364WBnq8Hwr0y81LwFIgzdWWcV2eH3cF4oUg/eGqj5BdyPezFyqX06w/zECXTZCK
         UiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717408582; x=1718013382;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6mTx7uYu4uJ3l4mrzFi9l5SnvCCSSuUrVpO+YQxuP+o=;
        b=QhcyMWu4JabgPDag9OVV4jWjqJbmJwa7q5EDisSOBsZ/cN1CWgbq1lMkc5X2BkegmP
         gN3UdE1LpfeX+Vu9hE3xEkN3PNfZH/DJxTq+UCiDjHlGCrc7gEbWeYFgW7I2F4WzEAB8
         fGuU+PlggVOfLKbTXsAPvApcgnVwIqF5hABweNM09VjZ2PP4Wpp49psx6KZcCDmdQT5W
         YUdYJnPQvKmYDOpn+loiw0SdyK1q9FxdGq34yB29G8WrEzl7z8e2Mmmxrw2Lk6MJ3ftx
         I4S2dUD7B6cGdPAnAavzxueWz7Qpjq3sB/BeoAJSf0KWUZ6yS7qbVqX8JvpsqaFFlvTf
         iwpw==
X-Forwarded-Encrypted: i=1; AJvYcCV/p9ivhAit36PBhqu4enZBsNaJA4PtaLDYs9HWJbiWpph/rr1sGfHAjVViKDhhVl6sZNVRZ8yCaIMsL+Db7II5xyxlSOB8ucHBVnYyuw==
X-Gm-Message-State: AOJu0YyU0i57FuQ3GLnuCWTrwvUhi1z8W6oVqlH1s8a6VD3Iz0+gq+Tj
	kMOR0yb9jFKFI2dJ1FvizLk6zCUZs8cDy15HwvylY/Nu3w9iz/72DwHeyPmKn0Y=
X-Google-Smtp-Source: AGHT+IHSCdyvp5+2eOYDj+674cfzeGayLmBYOuR9dLBJlHksV+pWHaAVt9NSdLi9tKQ+HUr0r3f86g==
X-Received: by 2002:a05:651c:61f:b0:2ea:8201:4a10 with SMTP id 38308e7fff4ca-2ea951de6b0mr59670731fa.42.1717408582459;
        Mon, 03 Jun 2024 02:56:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91bb4c07sm11243601fa.45.2024.06.03.02.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 02:56:22 -0700 (PDT)
Date: Mon, 3 Jun 2024 12:56:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, 
	linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, stable <stable@kernel.org>
Subject: Re: [PATCH v3 2/9] misc: fastrpc: Fix DSP capabilities request
Message-ID: <ci2l4g4jsefq3pdjdxzan4hnuuii2d3faa3wjh5lbiiqo7t6nj@mxu5oka3r6oz>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
 <20240530102032.27179-3-quic_ekangupt@quicinc.com>
 <32750882-2e4c-44b7-af6d-a1ec0857b69a@linaro.org>
 <7e316c16-47a3-4a87-81da-529bb857f4db@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e316c16-47a3-4a87-81da-529bb857f4db@quicinc.com>

On Mon, Jun 03, 2024 at 12:35:40PM +0530, Ekansh Gupta wrote:
> 
> 
> On 5/31/2024 3:03 PM, Srinivas Kandagatla wrote:
> >
> >
> > On 30/05/2024 11:20, Ekansh Gupta wrote:
> >> Incorrect remote arguments are getting passed when requesting for
> >> capabilities from DSP. Also there is no requirement to update the
> >> PD type as it might cause problems for any PD other than user PD.
> >> In addition to this, the collected capability information is not
> >> getting copied properly to user. Add changes to address these
> >> problems and get correct DSP capabilities.
> >>
> >> Fixes: 6c16fd8bdd40 ("misc: fastrpc: Add support to get DSP capabilities")
> >> Cc: stable <stable@kernel.org>
> >> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> >> ---
> >>   drivers/misc/fastrpc.c | 7 +++----
> >>   1 file changed, 3 insertions(+), 4 deletions(-)
> >
> >
> >>       if (err == DSP_UNSUPPORTED_API) {
> >>           dev_info(&cctx->rpdev->dev,
> >>                "Warning: DSP capabilities not supported on domain: %d\n", domain);
> >> @@ -1783,7 +1782,7 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
> >>       if (err)
> >>           return err;
> >>   -    if (copy_to_user(argp, &cap.capability, sizeof(cap.capability)))
> >> +    if (copy_to_user(argp, &cap, sizeof(cap)))
> >
> > Why are we copying the full struct here? All that user needs is cap.capability?
> as argp sent from user during ioctl is the capability structure, the
> same argp is copied to a local fastrpc_ioctl_capability structure(cap)
> to get the domain and attribute_id information. Copying just the
> capability member to argp will cause problem when the user tries to
> read the capability. While testing the capability, I was observing
> this failure and it is resolved once we copy the information properly.

What kind of failure? Which problems? Why do we need to get all the
details from you by asking for more and more details. All this
information must be explained in the commit message.

[please wrap your lines in a some sensible way, I had to do that for you]

> >
> >
> >
> > --srini
> >
> >
> >>           return -EFAULT;
> >>         return 0;
> >
> 

-- 
With best wishes
Dmitry

