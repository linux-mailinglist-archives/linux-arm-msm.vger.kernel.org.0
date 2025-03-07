Return-Path: <linux-arm-msm+bounces-50625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B042CA561C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 08:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D4241885348
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Mar 2025 07:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D021A5B91;
	Fri,  7 Mar 2025 07:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WK1as5u2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DFBDDBE
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Mar 2025 07:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741332546; cv=none; b=QB2GJgteCvtWLMJYMHeGoxc0RCtN2DoLkHe4A8u7gAYC3jodaZvhP3VULkvqbLCOj7s0jmr7I3TU1QijJSvadeJBrGhoZKBl0+G5/jGRsDLgQJBIRCTS/+MKY+8UfEX07JcGKml4tmeq4B2M3NnHO7WiMcnT3POtBYUEo7KwBT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741332546; c=relaxed/simple;
	bh=9gDxCWe7Zg/nWpvugHW1RCaJiLWtan81G00ApnN9AjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6xUCkslE7mZ4mRQHi6JSXM56LNPFG6jc4VZ7RJ+x4w3JIWP8tXgcbgRKd8KZd7KeIeYPRNgESoMYIr2kx42FRzEJU5phHtAPJFr6mojHhioPDa9zT4zBypXEcuPSS0+ZHatuGdVVQUyuUfrKmY2eWB8L0CbeQePvEofMcRhBgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WK1as5u2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43bbc8b7c65so16518675e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 23:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741332543; x=1741937343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IUreiTCZVZCY/sR49qTRb5j3OTUwCXV8SCtHZI5UAQU=;
        b=WK1as5u2xt9X1yvMW8HD88jMwxO2yDNfVALF+WGAtNT1A0+lXznPhkcjQtbwOY3+rw
         fqAH5tmoOqcKg9NiJO3QZTYeerFdwCSHv5mPhtClV30mNARl5Tlmbztgl42EovUqv0BZ
         6nqDX4ZyzMbA48ikYLo7bAomugp4Ov+Vgu3CZsnaKs/w754oS+Zv6or/tC5BCdxaFECd
         Lr5rg6ALuToHfwfjLVVdrgwL98vQutAV385Fe0iTCKjOymUu0miqX4Jrv/KIu2KBMVpo
         UFA0zilFQvlsNRArrhM0p0TU3/aGKeOdWbfC8vN6An4OG54cInqlc7oUJmww9G5iwFEg
         zA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741332543; x=1741937343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUreiTCZVZCY/sR49qTRb5j3OTUwCXV8SCtHZI5UAQU=;
        b=xRAeRDqlPi29rzKFxzAVKMM9ptd77CceZIwOWn9GJiw8rH2tkD4AWxH4ZcVhKHuzK9
         uw7v4badtQvY5KlzKxRnzkrFzHH0UyaW05Syhc4Sc3Qf+q+SCCFhWwB9m7FBB76vqOGz
         p6x+wEooNRhy7wqqKayYA47tAGzKLjvki4FPYNdzWzoE/egUkjAdbtxlVsm8c3JpTkGf
         t2Kh6ASMxqIZ6ktCpz4u+gZwP7Ek1FdZJKoWz9xUS4pUYkjNDjNRj4Z+cQdZfzKjznz6
         BO0/AmJLIutWM+Kv/kryaOj5MyRKJTY19Mdv8Yt1bqqkhhgegbuer+RsZVNpbojilM7y
         LwvA==
X-Forwarded-Encrypted: i=1; AJvYcCWYJ+QZIHO4V4mI9bag592A6PIghn4sJNB86mWEYkWtVDLpxl27UpP2hIk+8fEJbPvjLaDrPoSfU26yX0vm@vger.kernel.org
X-Gm-Message-State: AOJu0YwYU0B2shgnzIruW1xWvyQX7EYDndRq9CmDs/JzRhm526F9EX5T
	a41OI4UC5wteY2dG6piJMw6RKHCcPj+rJeMWPi6v877/NrganF1IwIevqzPL5x0=
X-Gm-Gg: ASbGncuV1GkU4JNjd0ktvxsa36zlkew/qKSpPlbSVY+OamdKwpwhBM2XyxNQvpnsovQ
	UF+FaSIoJsiX+Gsqk2PN+WIXL/4Nre6qQ3JaliW0VRcDrHFPmj1K85wIq9gfJoCs5mh3sSlsw6Z
	eHQou4fOfyNBZgE+adLk+Y+a1bprrJG1h8BM4QgKZIm2eNdN5Xjk35q+RyMqObXx30zyPP4WrV7
	q/AB2UNWaLC2QpGcx0OtTOtogwsLJW0Cc+Bv0TzBnBT7BsRb585AnWt0HJ7eXGvN/fUQMkxbNUf
	Y0V0xR918AdciGybrtmyWMePy6f0ZgHe96oZGyNyPlhs3pLmiQ==
X-Google-Smtp-Source: AGHT+IG7+0XvfqpXEa4bb2S7ULVZlAWD2yns/3fQUyBqRZKt9KtX+yqDgzdFZ1rvgJVCkq7kZRve0Q==
X-Received: by 2002:a5d:64ac:0:b0:38d:dfb8:3679 with SMTP id ffacd0b85a97d-39132d228c5mr1671359f8f.17.1741332543129;
        Thu, 06 Mar 2025 23:29:03 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfdfcfbsm4355592f8f.28.2025.03.06.23.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 23:29:02 -0800 (PST)
Date: Fri, 7 Mar 2025 10:28:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: Carl Vanderlip <quic_carlv@quicinc.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] accel/qaic: Fix integer overflow in qaic_validate_req()
Message-ID: <0716c1d9-46e7-4345-b005-314f5631aa74@stanley.mountain>
References: <820aed99-4417-4e4b-bf80-fd23c7a09dbb@stanley.mountain>
 <03bfed13-c541-4a09-8330-ca3563be0f77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03bfed13-c541-4a09-8330-ca3563be0f77@oss.qualcomm.com>

On Thu, Mar 06, 2025 at 12:12:53PM -0700, Jeff Hugo wrote:
> On 3/5/2025 8:53 AM, Dan Carpenter wrote:
> > These are u64 variables that come from the user via
> > qaic_attach_slice_bo_ioctl().  Ensure that the math doesn't have an
> > integer wrapping bug.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: ff13be830333 ("accel/qaic: Add datapath")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   drivers/accel/qaic/qaic_data.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> > index c20eb63750f5..cd5a31edba66 100644
> > --- a/drivers/accel/qaic/qaic_data.c
> > +++ b/drivers/accel/qaic/qaic_data.c
> > @@ -563,7 +563,8 @@ static int qaic_validate_req(struct qaic_device *qdev, struct qaic_attach_slice_
> >   		      invalid_sem(&slice_ent[i].sem2) || invalid_sem(&slice_ent[i].sem3))
> >   			return -EINVAL;
> > -		if (slice_ent[i].offset + slice_ent[i].size > total_size)
> > +		if (slice_ent[i].offset > U64_MAX - slice_ent[i].size ||
> > +		    slice_ent[i].offset + slice_ent[i].size > total_size)
> >   			return -EINVAL;
> >   	}
> 
> I agree this is an issue that needs to be addressed.  However, it seems that
> overflow checking helpers exist (include/linux/overflow.h), therefore open
> coding a check feels non-preferable.  I think check_add_overflow() would be
> the way to go.  Do you agree?

Sure.

regards,
dan carpenter


