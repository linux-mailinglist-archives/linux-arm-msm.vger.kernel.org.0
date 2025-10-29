Return-Path: <linux-arm-msm+bounces-79491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E873C1BB13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D3D61895847
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C142E33F8D2;
	Wed, 29 Oct 2025 15:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIxRUFcp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BD533F39D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 15:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761751964; cv=none; b=beaXlmbJ/6lYxZHQ/Zym0jWEAZXzjGFxlfkWmjnQ0lpPRHG3VKceEjpm7wpPzjoYtNMu3BeCgcHDRjINVgNrs5IIRkrjtGLQCglnlizXS6xHNt5aVv7zp0WHyVXY0Sjgqg7Ty1yXqpk1H1b+4/ibitieml0QfsN+2AlM0xlKucc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761751964; c=relaxed/simple;
	bh=O5LYngdRuGQGjiLGrPFcUjIUov9snCTAkMU/N8J8a8w=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SC4jxOrzZa2DDPpvoyHNsqdisPebTEqhqPsg1mfyujUsvaEZruAdTHudDMNayQrxs3ACsZmSUFgEqVQyW04B9g5gS1jez9Rtu4yLTBcceJy1BwUwMk7kzCd/bDL5fYrWk4pk3mvzV+gK9Crq7/HW+8vIWCqhVB7YybZg/CeYVN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIxRUFcp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-475dbc3c9efso34978505e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761751961; x=1762356761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3ikPywo67ZbgIof+9yDMrcwmh77/FesmeUjBMpQ4Gfk=;
        b=DIxRUFcpOZNB4MM/bjr7GSvUrFnZhaIXGJHW9FB9dafTlQwuFDpJEr8TKbAOlEMUez
         i8vQaX3yg2MI4UQKBHBAcpRPfr/m5tcEjzCk2GS6K7xbJpQX+yYV7cAVkhfzIVb/vLYK
         vbfE9fdstS23a3pLs1NHkIyb4+4eNDQNG6cymT6Nh7B/1usYxQsHdOyMHK+TfOWNvgLZ
         AyS1KTIFpe/epsDDaGak4KA1jZ13ajAF04BGOWwp2W/aDM6EfxXLYdPsBV008TjIQABi
         ATEZ6WJxQ67ZEv6lJR4PJva8bZ5WsvX+A9c26yhy35KqDZSnQj52KixrvmyxiAMo/iYi
         VLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761751961; x=1762356761;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ikPywo67ZbgIof+9yDMrcwmh77/FesmeUjBMpQ4Gfk=;
        b=hv4QFwxCqw5VLARlGU1AJK3U08kanzFHvjnmobM8wESEXSzEAwsVoFhvHX7gzkUIHY
         iXBQGa17xGIwxlJi8FVGbE8Myk0Ju+j/0oRoMtYSnjn81cwVQI0y2sKfYvuWsPInRbFN
         j8IhUat/pe5gDOknjW8gUbhEwrHstgmE1p2M21QMxSq0uqN0lrNLykGpEwOV7lkXkis0
         bkjOaWp19c0l1oRa+bCvtD1nihQWPK/W7Uk8IbTiAFRB4KCgIkWDzKSl6i/pwJ3+0AJO
         Eq/mSdlVR8fJkUvL0cgDzGBtL0vP0/A+3kZrJeNiTHkxrVTBLhqk/gDQpztQ+uAibX3Z
         6YXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7YNb8gq9w3ymhIwIDtinPOWVEF+0t/eEBnZJLwRI3Sf+n/3iXVeN82ez3yqjgF4kX0GjzPcqpwEHhJ+jK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxymj9DTR6lDDERlNVACdgS37/zr8NO1euipVtKJfrYrfFytra7
	gLP1V5A5CEkPILpezaY0AJCPmqSQh2vy6fb5pwPJieUCWSqjnN9WbYud
X-Gm-Gg: ASbGnct5bUoF1/D1m5HSAOQkAz+tKxE1mB1d+6dpwUqDshtSu3xcoymMZ+Cshbw5Lm/
	1FgWmk8e90k+ANnqyI+S2cFZXdaz2qmLKkRT29LzUtNA5xgFElzW9xqN6n2ynpfg+GDlk21895U
	3XHd0+DCTL8QGQ8bkgDCVTrjoHkPR9naFOeI4UNsTylURHFs4aCWeU+IcD8GVc6rMk5TGcm3IDQ
	t/qjNQPWeQ7PhIkENNU0FKgjeOxCnJXAm8F34MLiODeyXxtLdBr0MjqHz+KnqPmuO/8vrLxhnfK
	y5fEhdW3py+UW33OubpUD3/q7SQHyo9X0vyhETd7gsQ6aXlkfJ6JLZ4FCrsJChPO0Mn1V0ZiIBY
	IQHqp7uSHycRyB1PSS5Ul2qIOVpuEBxr7Ld4RrT19L5R2031vchj0KCGq7sTj+jeFjaQnhmZYkE
	szUbQMeLFwOPSRngIJQKYR2oiDu6as
X-Google-Smtp-Source: AGHT+IGlxJUMPBcCnrjnToorbT55gMyEn0KVla2FyyxiHdY+dzp3Fb5seo1sUo4Wkl5T8gZsMwX+yw==
X-Received: by 2002:a05:6000:22c6:b0:427:72d1:e398 with SMTP id ffacd0b85a97d-429aefde6f1mr2944132f8f.62.1761751960915;
        Wed, 29 Oct 2025 08:32:40 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d4494sm27355108f8f.21.2025.10.29.08.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:32:40 -0700 (PDT)
Message-ID: <69023398.df0a0220.25fede.8d9c@mx.google.com>
X-Google-Original-Message-ID: <aQIzk1wYEQJgJAdc@Ansuel-XPS.>
Date: Wed, 29 Oct 2025 16:32:35 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Raag Jadav <raag.jadav@intel.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] soc: qcom: smem: better track SMEM uninitialized
 state
References: <20251029133323.24565-1-ansuelsmth@gmail.com>
 <20251029133323.24565-2-ansuelsmth@gmail.com>
 <aQIyZfQ-Tvxmh6vL@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQIyZfQ-Tvxmh6vL@smile.fi.intel.com>

On Wed, Oct 29, 2025 at 05:27:33PM +0200, Andy Shevchenko wrote:
> On Wed, Oct 29, 2025 at 02:33:20PM +0100, Christian Marangi wrote:
> > There is currently a problem where, in the specific case of SMEM not
> > initialized by SBL, any SMEM API wrongly returns PROBE_DEFER
> > communicating wrong info to any user of this API.
> > 
> > A better way to handle this would be to track the SMEM state and return
> > a different kind of error than PROBE_DEFER.
> > 
> > Rework the __smem handle to always init it to the error pointer
> > -EPROBE_DEFER following what is already done by the SMEM API.
> > If we detect that the SBL didn't initialized SMEM, set the __smem handle
> > to the error pointer -ENODEV.
> > Also rework the SMEM API to handle the __smem handle to be an error
> > pointer and return it appropriately.
> 
> ...
> 
> >  	if (le32_to_cpu(header->initialized) != 1 ||
> >  	    le32_to_cpu(header->reserved)) {
> >  		dev_err(&pdev->dev, "SMEM is not initialized by SBL\n");
> > +		__smem = ERR_PTR(-ENODEV);
> >  		return -EINVAL;
> >  	}
> 
> I find this a bit confusing. Why the error code returned to the upper layer is
> different to the stored one?
>

It's INVAL for probe. But for any user of SMEM it's NODEV as there isn't
an actual SMEM usable.

Totally ok to change the error condition in probe if maybe NODEV is
better suited. I assume there isn't a specific pattern of the correct
error condition in probe.

> ...
> 
> Also, the series of patches should include the cover letter to explain not only
> series background but additionally
> - how it should be applied
> - if it has dependencies
> - etc
> 

Didn't add one they are trivial patch but I can add it if needed... it's
pretty stable code so no dependency or branch target

> 
> 

-- 
	Ansuel

