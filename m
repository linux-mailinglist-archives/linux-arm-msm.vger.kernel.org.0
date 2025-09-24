Return-Path: <linux-arm-msm+bounces-74567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF6AB98909
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 09:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FFFB4A49D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 07:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A7D27EFE1;
	Wed, 24 Sep 2025 07:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KFpYrn2e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7142B256C8D
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 07:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758699366; cv=none; b=lEUoOOP3LXz9ms3yt8e8B1Zm27MYSG5IoVFVQxD7IJMjr9oO0FYDSJ3E3D4zG6u9lIWSKjvRulIVLCf4x/FGesTBc5RAqVCR+cknzf/oRG9erJxT5OWZaXus5qlb7/nzgjzSJgegIktV1scIJa42yUu4GHZYt9r5Ah7ORNSTVCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758699366; c=relaxed/simple;
	bh=Kd8ZcB8HujjZyRuSROzO9d59wfH9TVHkGlJzNIZjVe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGz4BxAtSf0frX39bSaRufgw5lRzi7cf+zsfcwZCGPCByTpRhe9cn4ZhcliG10GA8S2ypPYC6PwBzdeP3DzSZdiv/OEqjmL3FPZk0tMNZ112sw/TzQLdid+s0HuKTtP2RlcJG6y8dUiHgWKCHGpUB8AwPt4W995bvgphYqE8Y7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KFpYrn2e; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45e03730f83so28315485e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 00:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758699362; x=1759304162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MzuWivt0fPkNm9SrHmJP3+hKkJHDd8JHQlpF6y9yW5k=;
        b=KFpYrn2eb4XOcpYFwickEOdoqsRHdEiTrOm9GABbmknFhHyl4p3cZ5vQ5VvC6LNVo7
         o0EOAHGoqxJEGkDb9+V6zccUM4lWOp2UIv9fCIEhU5n9KgSiPlgYSDZY5bcI34opd3gA
         9xKrINN0DnXj5IYLwqXWeaR34/ExtHIJPQApoTXi7BXkAxpv6FKOcEdPGfW0I1RopFDv
         ciEcRhnGa4Ukke1bSVISgv7mXYL7A5L+/fY+cZ61E9Fv+vD6/iujmqxHTUJYIp7KY3Kc
         nP9PnghyQyIpc1BnU2fLS4eGWuaw6VdlYHjwcY5dm2feqcrEbVfosXjyyRCo4RsWVdlf
         HgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758699362; x=1759304162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzuWivt0fPkNm9SrHmJP3+hKkJHDd8JHQlpF6y9yW5k=;
        b=DIphNat8QyGbq2FASQpYEDcsRGZxrCPF9Dd5wRaQkEU76ELz/LSOtYaKOo0BFZi4rM
         2i3Aqnayw7NrawpEQrAPTg3Mr215jLhvUZef4g1HMQw0W2lmK/mO7J7Czp8NT9I0kXSm
         c/hVhyx552++/0gURMcxr5r9VhOgWqpqVY0DFcwday3Oj4vlZJIGTaKlvWXDrZ2ODQZH
         Mv2SZVuLC4xBXzJn6yLuaqlay79lgoj0IQv4T7/XPOQH150t0RfyomDDgZN4/6htItvL
         YSHh2hvl5XAr8tkPjfuw04/k7M9tpetc6Jdx/tPs/maTpLvoE5qFAMPcMUecOXDg1kgO
         regA==
X-Forwarded-Encrypted: i=1; AJvYcCVPivLN4JZZ7IJiBbWbvYHnIXkLB31sbwTd+geFR4W+RrCerABIuVxgqGc+uDDMeTJih2IQbE/4f3YdnXtK@vger.kernel.org
X-Gm-Message-State: AOJu0YxOsaa34kUgdnalcwEXBUvp0P9wOOVpLohLNf+qlcLvCayN3BPj
	fylFbeRehiaARfBFyiT2RlmmLFBKDBnRwvyGT6BO4DukWw3B7USGuS5w37oF/zHqL/U=
X-Gm-Gg: ASbGncuVxsLLIHqehNV4uopqxlcJmrR3HxNg0mskyOWhFqdjTwiLKHrqmSGMt0IdFlv
	Wza1Iv2x0sqzgyqd06cMh6sxaF5bZnUp6LcOk0kXehcpNKtq67LBRkY5QM43gdrePg5uFd5Jyik
	MUjptPlK+5ZsB5MK1+XyPd1E6y4AqugqURRLP66YLQtPW+7CvFZl4pHoWPvKug2gOELNs7qc6BH
	YlSdJQue+mF9NIhMI3KTTOtqkHvV1gvxSwptHhdqHBZeNMHJeverxwH22WluHH1pQCCSJqFNDWc
	iYLQEAhvWAR/YutXl8sA/5BNLpUGVEGE9LV5s79QXjuXinBTiogGrTWRoG1doy0x9ngHO1LKCMY
	vTKZvuCCxYeDItR4p+m1jr6Y72sLs
X-Google-Smtp-Source: AGHT+IEH42ZDWAD5VbXw0upHtx03eZMIIKwgq7R48zFJHivJhT6Mw26u/WOxCLoqGho2YLgjitB5+Q==
X-Received: by 2002:a05:600c:4fd3:b0:45b:7e86:7378 with SMTP id 5b1f17b1804b1-46e1daccb44mr41847475e9.34.1758699361781;
        Wed, 24 Sep 2025 00:36:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3f3c118cd47sm17190189f8f.29.2025.09.24.00.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 00:36:01 -0700 (PDT)
Date: Wed, 24 Sep 2025 10:35:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] tee: qcom: prevent potential off by one read
Message-ID: <aNOfXlG21HIBR18E@stanley.mountain>
References: <aMvV4kK386Sni10i@stanley.mountain>
 <adbccfc0-0f9c-4b71-9fb5-5582c8180ac7@oss.qualcomm.com>
 <bb776102-310b-4a84-943a-86d4138592d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb776102-310b-4a84-943a-86d4138592d8@oss.qualcomm.com>

On Wed, Sep 24, 2025 at 08:58:45AM +1000, Amirreza Zarrabi wrote:
> 
> 
> On 9/24/2025 8:48 AM, Amirreza Zarrabi wrote:
> > On 9/18/2025 7:50 PM, Dan Carpenter wrote:
> >> Re-order these checks to check if "i" is a valid array index before using
> >> it.  This prevents a potential off by one read access.
> >>
> >> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> >> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> >> ---
> >>  drivers/tee/qcomtee/call.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> >> index cc17a48d0ab7..ac134452cc9c 100644
> >> --- a/drivers/tee/qcomtee/call.c
> >> +++ b/drivers/tee/qcomtee/call.c
> >> @@ -308,7 +308,7 @@ static int qcomtee_params_from_args(struct tee_param *params,
> >>  	}
> >>  
> >>  	/* Release any IO and OO objects not processed. */
> >> -	for (; u[i].type && i < num_params; i++) {
> >> +	for (; i < num_params && u[i].type; i++) {
> >>  		if (u[i].type == QCOMTEE_ARG_TYPE_OO ||
> >>  		    u[i].type == QCOMTEE_ARG_TYPE_IO)
> >>  			qcomtee_object_put(u[i].o);
> > 
> > This is not required, considering the sequence of clean up, this
> > would never happen. `i` at least have been accessed once in the
> > switch above.
> > 
> > Regards,
> > Amir
> > 
> >
> 
> Also, size of u is always num_params + 1 for the ending 0.
> (basically means `i < num_params` can be removed).
> 

Yes.  This is true.

regards,
dan carpenter

