Return-Path: <linux-arm-msm+bounces-74566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 858DCB988D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 09:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 146BF7ADD63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 07:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0B827B34C;
	Wed, 24 Sep 2025 07:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQNWhEJu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9720227B336
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 07:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758699150; cv=none; b=DchC+tkfPQ78n86aoDZctn9/SAoQLv9ahWepEmm0NszBdkXqvW+Vz7uSusa85fngcuyKiIPz3HnnY1hnf5ZsYSUehN7m8gg+aI/v1nhXD+xBlWDn9U9LcyMtTzxOSwkNOiAKpPQi1jI3uk/9wieJd9KsG+HI6q6/Adh+ZqoyicQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758699150; c=relaxed/simple;
	bh=Qtcg7xfRMukim04mCLFrhu+F9aHnN0Lfki5K4xrpcBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdsjRiuULS1qDm1/NPRrb1otLuU/O7p6dZ67Xxd4dAdaSMrHm6xpHakU/TbLciP80CCZiiLa8IrgCG4MiSoSdO83hOBs4w8NhEUH78NtfyZVTSXkGIV8uqdscwj8mwQAo+AGYByOLhID9oL92miE/wtLkKEqMXxSsSpUYdpP1lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQNWhEJu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46b7bf21fceso33423745e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 00:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758699147; x=1759303947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UXwsP//vM56W40KjvtwrX9R47nj/UueUere/kbOGRCo=;
        b=DQNWhEJu5F+DOfFYFGZfdn4c4l3IygqC9ojelnexiXvg3/ZkgeUj9X4LfP2t+MDAvA
         pTsHTuqTW06Ebj5iO/a3p6E1ffZoz7/TxT7bZzX2o22lTVmuYo102axgTzKVD6F/rTLu
         JPY/0evv5W499IWc44ywAGi9J/2rF5f60Hdb/geNpZuvLK64p2QcEZxHKPNFxfk9IZYN
         8VnKUF+DUK2+/wF7Ax408jf8Iki7UqOx/hKt/VBvVYe7k6d4QG0VbRq0Ydg7EzTE4T9h
         4u/ctbhVUU+KjI4swOF4ZrHiGYQpC1dj+bvEDp0509LFZRGxstVcHWK9vTs7x2xGKYUh
         wMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758699147; x=1759303947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXwsP//vM56W40KjvtwrX9R47nj/UueUere/kbOGRCo=;
        b=tRzXPzlVxL80AmZbxr1O3IBP7dCnZ/LDTQo6cZ+PkcmobnU4LqVThsWgozI5OqN7j9
         hWU+AvgoWUb5F8XhvBi40vN1Y9bF85MB0dpyN3G3UhEnV67H1zi2RQKT1TklfVR2qqbd
         vz6txLbyrSb/LneA7LBepSPugkjEWKZ99sZqoNxibFdEbcaCz3QKfjitFEf1LkigqBIz
         uSWR3AgsMaglsz/000mToGF66Wh9PwvKIaIR07YB9sGvseod0QZue51fgvUNuV9ZfISJ
         x+xI63rS0gyJWli/ugaazXbU+4PQ8n+D8aZsNuBi4rMhoh0i7l4KVtFsLid6ThuXD9jw
         O6Kw==
X-Forwarded-Encrypted: i=1; AJvYcCX5eyG/bl6bQhmgeSKC46fs0EKn0qe8YGwGdTp8NrAcriu1QowOltcn5h3iazE2w//jsdF99rLiTLJ4v18a@vger.kernel.org
X-Gm-Message-State: AOJu0YyKw0G+pQSC7rKxkkzpZjTafxIQ1obub50ys2gGPrcCSM+JK6f+
	WtMpsercOGPGdjrmSt1oEjSuQ7N0zHXAJngwgAkyd0PgzzoPL20Htzv8OIhG71V1+GA=
X-Gm-Gg: ASbGncuxN94fH1sdtZN6u/RKyu4Eh9DWN8SMNSwvfob+K+KHIxzaY1gG7iHjXUTfJIQ
	Oe6ijBMSvgrB9FvM3AGN8V8r0S3Ii7hNjHfHZgCQzsDEIZ6jmPHoalVUASJ5mJ/niMus+FRYl7f
	MZstyfWhXzCnUUccofEgo4N0HvzScNMMNAMJANNyftKz8+jmglRofjSODGRuOfCh9yZA5qMa6eR
	TaN0G/AaBXdELHQk+axRiGckCoPBY++TQb4mUADwIUFWjWnqz2TUkyzlKLJFGMrVCACHJTk4sAC
	NCkZF0T1+pNdfBgxFJ7p7wvlj+1zBuMjCedeEAhc/XfNGTlelTU4UV+ZNSw/0rvSmNip+upS0IU
	o8qfNJqaKAUlA28xwK4KH8zjRAVVUubRHcARjYfQ=
X-Google-Smtp-Source: AGHT+IFqcDjqsGKdmcV1EsOoO1DT4mayZkZcsrnoULvEIG2jDOzlj2gp/jdzhPJLQtRPGd1AKwtYvQ==
X-Received: by 2002:a05:600c:4f09:b0:45d:d5df:ab39 with SMTP id 5b1f17b1804b1-46e1dabe432mr51516895e9.26.1758699146691;
        Wed, 24 Sep 2025 00:32:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e2f13764dsm3026115e9.1.2025.09.24.00.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 00:32:26 -0700 (PDT)
Date: Wed, 24 Sep 2025 10:32:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] tee: qcom: prevent potential off by one read
Message-ID: <aNOehr6hxdb2OypO@stanley.mountain>
References: <aMvV4kK386Sni10i@stanley.mountain>
 <adbccfc0-0f9c-4b71-9fb5-5582c8180ac7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adbccfc0-0f9c-4b71-9fb5-5582c8180ac7@oss.qualcomm.com>

On Wed, Sep 24, 2025 at 08:48:29AM +1000, Amirreza Zarrabi wrote:
> On 9/18/2025 7:50 PM, Dan Carpenter wrote:
> > Re-order these checks to check if "i" is a valid array index before using
> > it.  This prevents a potential off by one read access.
> > 
> > Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/tee/qcomtee/call.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> > index cc17a48d0ab7..ac134452cc9c 100644
> > --- a/drivers/tee/qcomtee/call.c
> > +++ b/drivers/tee/qcomtee/call.c
> > @@ -308,7 +308,7 @@ static int qcomtee_params_from_args(struct tee_param *params,
> >  	}
> >  
> >  	/* Release any IO and OO objects not processed. */
> > -	for (; u[i].type && i < num_params; i++) {
> > +	for (; i < num_params && u[i].type; i++) {
> >  		if (u[i].type == QCOMTEE_ARG_TYPE_OO ||
> >  		    u[i].type == QCOMTEE_ARG_TYPE_IO)
> >  			qcomtee_object_put(u[i].o);
> 
> This is not required, considering the sequence of clean up, this
> would never happen. `i` at least have been accessed once in the
> switch above.

Only the first iteration has been accessed.  The rest no.

regards,
dan carpenter


