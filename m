Return-Path: <linux-arm-msm+bounces-28614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C41952C23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 12:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAD521C235B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 10:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D4F2139A1;
	Thu, 15 Aug 2024 09:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W03e3rnW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3106C210197
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723713912; cv=none; b=n+94Qy4f1sbXQL7X72GHFv2ZPqrPneGxfFAmtwqU3fe4gWcvByaEXz8ugRCAS3SUcut1jQIsWMjCY/TL9N2ldYHV8ZM0cONE48H3HSbq5EQHQNyogVt9N9JWtQ+TDKyyGIqNTDXrvbvB8Dur+5ze6fi/t9h3uMGxCZ7ZvrHCSjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723713912; c=relaxed/simple;
	bh=g/lyUWU8eCPaBAfe7GWY+aklIjDnUSlq0pYrPSLfBH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QP1kkS9dykfW3ratbojoEDGQpM2I5TvY4yWYdHfHnqrAzAPRDXjyGbBZH0fXMGmH3WNAQOLoAew/05APahBdgxQIY8C29l1OFQa/Ytq+fi8Y49mduO2QpkO1fUP+bpg8q//xJCIPrD/O5iVZWg4hIurMYM7bZXRDtZ1djWFKaSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W03e3rnW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-428e0d18666so4184885e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 02:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723713909; x=1724318709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GIRH8ZYT8hEH2GbZtKPw+s8BGj/6k9t0nmVaDj+JHRA=;
        b=W03e3rnW/HgTS1NY2F1u5dD8MRAA1C+JCTjFBJDdicpnyXxw5Md/4ncMhOc5oOxCCj
         6PfdlTaJjDi1SdSx2BgFz5ByhBLEdF+YvdT+kft4hdy/RkvF9l+9wYO+kH+DMjnnnvb5
         YOkQ3Ov1562yS5mhVLPBNRS+qd8wXlcKuPILA6Agf3wbIXBDdxMbgaJWG8pEd++ysE+y
         6aAC2zN5iNt0vEUg0jpPGQX4mAPhaatge3JL5lheDaG5X9w4Yef5lVhZJlim/C0jt90w
         sTHpbKgU7kDx4MOl9jzZgTRK18ufg2P0we9HRiai3kvoYsY5gFZBePJyGEHMfVvS5p84
         pDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723713909; x=1724318709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIRH8ZYT8hEH2GbZtKPw+s8BGj/6k9t0nmVaDj+JHRA=;
        b=jhL5+GI/Umf2G/d3rpPHMMhqFXiYNPw6VxgObCeGbRFSs7+cuk049QomvCxAA+EfLZ
         OrY8lmTS6fdifWp7lngO1sdsLaXVuIY+RK9ZEX8DPzYxMeHwQxpjhhxcfPrR3jURPUS3
         yxKWStC3T2pzHYvzOQlMgyY/ALmZnLuuDc4FL9sXp4mmZYDEoC2cMLRn/kuxlrWu4zXj
         TWuwqG/gMnVFJ0UXjGFfdreyFtMzs8mRQrzJk2X9n8KPNa+Cpk2yvcgsTmEOj176PnD+
         sEWeotHpYqN76fh12Yd/s9ERz++tHp2p0x2pgkfk11tneXZcxne73nVvwjTecAwea1PJ
         5Otw==
X-Forwarded-Encrypted: i=1; AJvYcCU163DnlSlvRgbNKgK/dhM9IWr4AS95DI5R4JxK8a4LcgomjDWNGGI7/NSPpHW7wkWAkl67HwXidkBGf8Z/KaqxbUL8gPNVilQxffitUQ==
X-Gm-Message-State: AOJu0YzxqqFrWYzL0q15OvUCSGzTMjrYq/1jw8RkLXDrGiDQ2ZQYXfqZ
	2tQU2rDH3M9M16zMK7oTaXQhzYqeRjOflJkFk9WQUcfS2hxHxDOq1Pt/HWMJI/Q=
X-Google-Smtp-Source: AGHT+IE+tPJUHOuuXvabrngdhrbZZWdr80Ttb/0EIb25+QGq4bWEGFirvdOTImNxC7SQrW407I5RNg==
X-Received: by 2002:a05:600c:4f45:b0:426:5b29:b5c8 with SMTP id 5b1f17b1804b1-429dd25f6camr34903405e9.28.1723713909406;
        Thu, 15 Aug 2024 02:25:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded71ef0sm42739315e9.36.2024.08.15.02.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 02:25:08 -0700 (PDT)
Date: Thu, 15 Aug 2024 12:25:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Amol Maheshwari <amahesh@qti.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Sukrut Bellary <sukrut.bellary@linux.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2] misc: fastrpc: Fix double free of 'buf' in error path
Message-ID: <a301b77e-b833-482e-afa1-5306bd8fc8e7@stanley.mountain>
References: <20230602113602.1271695-1-sukrut.bellary@linux.com>
 <168656748193.162074.17313550564907901438.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168656748193.162074.17313550564907901438.b4-ty@linaro.org>

On Mon, Jun 12, 2023 at 11:58:01AM +0100, Srinivas Kandagatla wrote:
> 
> On Fri, 02 Jun 2023 04:36:02 -0700, Sukrut Bellary wrote:
> > smatch warning:
> > drivers/misc/fastrpc.c:1926 fastrpc_req_mmap() error: double free of 'buf'
> > 
> > In fastrpc_req_mmap() error path, the fastrpc buffer is freed in
> > fastrpc_req_munmap_impl() if unmap is successful.
> > 
> > But in the end, there is an unconditional call to fastrpc_buf_free().
> > So the above case triggers the double free of fastrpc buf.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] misc: fastrpc: Fix double free of 'buf' in error path
>       commit: 5b3006fffce89706a12741d7f657869ca2be1640
> 

This patch wasn't actually applied.  I'm not sure what went wrong.

regards,
dan carpenter


