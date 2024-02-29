Return-Path: <linux-arm-msm+bounces-12941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A0C86C28C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 08:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00AB3B29313
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 07:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F7A44C89;
	Thu, 29 Feb 2024 07:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OiGBpDUe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A10544C97
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709191888; cv=none; b=ixs9ZlDQUIpdg7bOQxJQvyc1zDOeSVlLz7PLPjbpcfTeAZ1dKx333TpP9nAkAElJk+wLA2acZn0pqrz4g6TyQ5cCg6p860+qMnQjAAgeNqalJ9fsumGs7cDlxGJ6lEG95n2ANDq+dWxqwWb9UxxDI1lJ+XHR9NNRewOewPf2Krg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709191888; c=relaxed/simple;
	bh=3uSBsX/h4xXlrUva8XPFdy9iWJ+hnl3udviF8wSyM9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCtZKIhaT/GO2Q73wKU5U2qkjz/s/yavcX9qqMkyhYYsGErGnJf1ZtNk3Um+XWLEkZWxOP+q3b/Dy164UgJO0WdVlR+p6IO3fssclkSoA2Y4zFEwy4y7cnGhG96Q3uWVti6lq/cCWWgApQ70HONzVp4EaIlVyY54B0xAwOuMHKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OiGBpDUe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412b7baa9c5so4234355e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 23:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709191885; x=1709796685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RiWXS0Lycg9PCC0fyWU9eT4uTxRcxADLMUayXiNfgPY=;
        b=OiGBpDUe0TWApJDgwCkZfL7pQJeFirP39TWGjnMcb0GrANqnaSBaDu+gmZqb1FETv+
         w3CoppLAbkxJhJUIA2SutHxhzHROumgphoLCoQ71iYMcN8dXgooUm5EjgVxGJorgotVq
         cGuX9pWx+FCAbfaM//WDCtzX5NIT/xNiRe/+Qb5eQEa1ce/kH5TIRcm7y26fb6Rdds8Z
         fGeXVQOdE3ISkPWAMbQsq9tVNQ/PqdI82D0qOu7MWM4BZC7JIxEqunsyyRwx+N9dSFZC
         hm7ly6kVkOfU1zolzmb54/W4VXzwTgvpSGnRA3EAe5qwVHRaQOb7WCO21JpyTKyfHK6t
         CzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709191885; x=1709796685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiWXS0Lycg9PCC0fyWU9eT4uTxRcxADLMUayXiNfgPY=;
        b=NFBkygdlkp5XnsNZBb4WNxeycmdiXu6UNxH4Nk5BEcI5v+v9HVhyVyzX5KlQHYJm5Z
         dnUrhaYLwkRR6yEQBpQXPy9Y/n/yZO0n0qf3a1WxU9EBADpIG9TLCBp5wT4uaPPszuki
         +fa8/x1IdUvdO8UGoQHmmy5OfQDdq9KMEVubEaC/kgpRHS9pGOmUaa0y4Tfbe64JubD4
         yRUW/XoNeVX2OjGz/RQsDjQuuIQOSe18/uM2UpjUPG3J2sWcKvVexON6Rf4mcyML8hv4
         usS/Uxb5C21fyd1VlZFUHuV1oJS9IlBZlm5XhmotPsWCAwokf26ZZXN1aCh91QiZiJaM
         MpMw==
X-Forwarded-Encrypted: i=1; AJvYcCXLr80Ky5hJG+dV0DW4B+R4NB6o2iB47JJgNORTTuxovdR7LsfNBakhQK577xqAp7eRsdIGbvocTTUzyaY1+FlyjtGkioIj0QoQqdej5Q==
X-Gm-Message-State: AOJu0YwC3nIIX/x03KzUXPI6h/XR0I+vUqyKmNhqc92B/os7O26/i47Z
	CyT9GYXgqqAXmW0SipmnnkkzoqrH1eHZEEbXbuzVuxQaFXddJ+x1Bib+pfJ/Ia4=
X-Google-Smtp-Source: AGHT+IFm2NXimeRlzG6mxS8tXCGpz0iq1MJcSQj/J2MMs2rGLvivZnF1HI63cA99XXODIDWyyxPCYw==
X-Received: by 2002:a05:600c:190c:b0:412:b8cf:150b with SMTP id j12-20020a05600c190c00b00412b8cf150bmr973212wmq.10.1709191884805;
        Wed, 28 Feb 2024 23:31:24 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id q16-20020a5d6590000000b0033d56aa4f45sm928856wru.112.2024.02.28.23.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 23:31:24 -0800 (PST)
Date: Thu, 29 Feb 2024 10:31:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-arm-msm@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-phy@lists.infradead.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Clark <robdclark@gmail.com>, Robert Foss <rfoss@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Use common error handling
 code in pmic_glink_altmode_probe()
Message-ID: <fefbec63-df17-4515-8e63-66ba3a3b9cd2@moroto.mountain>
References: <29b63eb4-2342-4ca8-a313-5de2a6ec6a83@web.de>
 <c25aa425-f350-4ad2-b92e-67de996daed3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c25aa425-f350-4ad2-b92e-67de996daed3@linaro.org>

On Thu, Feb 29, 2024 at 12:26:49AM +0100, Konrad Dybcio wrote:
> 
> 
> On 2/28/24 19:05, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Wed, 28 Feb 2024 18:45:13 +0100
> > 
> > Add a jump target so that a bit of exception handling can be better reused
> > at the end of this function implementation.
> > 
> > This issue was transformed by using the Coccinelle software.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> 
> (+CC Peter)
> 
> Hmm.. this looks very similar to the problem that __free solves
> with <linux/cleanup.h>..
> 
> I know no better, but wouldn't the same mechanism, down to the
> usage of DEFINE_FREE work fine for _put-like functions?

Jonathan Cameron has created something like this:
https://lore.kernel.org/all/20240225142714.286440-1-jic23@kernel.org/

It hasn't been merged yet and it would need a bit of adjusting for this
use case but it's basically what you want.

regards,
dan carpenter


