Return-Path: <linux-arm-msm+bounces-69774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 89526B2C7ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 17:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B87E47BBFBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 14:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8530292936;
	Tue, 19 Aug 2025 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gC+iDL6s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D6328642D
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 14:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755615317; cv=none; b=JNYX+Jo6m9s3RfTRAycutm9tx1vsh1E0bfDEr2PrJyD61IAdKzkLWD7omnlchxTWfx973pRKlwo7bq+NnRmjiFUpGO4fOeehWlhUcaxv1k2fC6+BiBGCRLqjloR6KxDG6F04CrZ91+w4HuRf24x8KXbFdZvnRmcngQQQijquRk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755615317; c=relaxed/simple;
	bh=JSgFReGmJrpsECohN/zB+vEQB99t0iIxycbYjj3gxhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbiyDvNCTgGcxloHKVqDBPjhqPz/d0hKWOLVF1ehwlgDRUn6xOkuVPpaOsNbUQkz66CQapz+1me17kpq7rltj4vFZEIpI6kLb83fbb/az3SMpbquRRAvrERMxfKlApS8inrhM480REXkr3CQ8ibzxOuDn9yLRr5SV8J+FzAVR7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gC+iDL6s; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-618b83e5b27so4575048a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 07:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755615314; x=1756220114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6q1VFKJc6RwiYJWPiwiME4ulyKyXCWSmhPscu25fEio=;
        b=gC+iDL6sQDl/2TwG5l13sEF1ye2gBaOnguKNDAFMonmSlsmmIXevZ2Vq0m0lkUpdA/
         fRQfz3VnrVn7U6h5jHiwNsOQQYY3DSYGUgwEitimagb9sXNmzENeYGeWseltorBm/r2B
         Roqm7XgGp0EVZpBawzAEQl1+4Nqa/4IEKSgB2qDIiUccRx0weG8YVLsQd7xJAu/cbnYn
         qxNfQFKSoomNKQLlyJA5hHasQO2+JbhSWUhlVQFE6GdHZa2eC33qgs+sIWd3tXwbdAvf
         BXPqmkQtl+/G/RO0MDT64CubwVuWUDkbWyJ5F9LSowvCJHTugMI0gBqsjGTW6bOEEluK
         fIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755615314; x=1756220114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6q1VFKJc6RwiYJWPiwiME4ulyKyXCWSmhPscu25fEio=;
        b=qYOaXyCFvPQwepfJtP/ZiprjZ03VfVLHoeX1jypXQm+Zi3p1IiCLYJi+JmPiKjdja8
         Szg8fiKjLijmI5atZZ6MkhP8gi6vruXkcoyHZh5v6hhqxuQrFSUQxBhSNzqJSvL2xUpD
         nhRNJIxVTmkdxVYX7HKq0fqWKPAt/Xt0dmzG5iE8Nj9nd8DUZ5IiDTSaxOyARJOhFZ4c
         Mium7KfbSeOXayKIXsTrMVj7NF/l2LQ5TqhJQ9HASAKr36hyP9DKxH5FilOoslm0CVlV
         lcl5T2wkWgv89SP5RhtxUpcj1sNH8imFyDFaKJVg4NIjkylrIocnH7nBtr1BKeiuBHqk
         GKCA==
X-Forwarded-Encrypted: i=1; AJvYcCVwBq+Dj7PynJymdU+YdbvcXQsgkbqj3PY0sssO24nJpo5ysq2zq7ari1eobMA6R2Fr0YqRAXEobsiJHdN9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/QaAblhifPpWAZpgEwf7xawSfJFACNsycJx2CuNiWnp65e4MO
	b/goKO/Ns/vG6buLPwJBNBOIQgu+CzHML9369s4J8dPZXnv8IL8S9TGGgJwwg7qwRKc=
X-Gm-Gg: ASbGncuUO121+QLxr30sak4l2P7zmchz/4gvk/Gzf1EppwvgpY39BaVtp/5x2zttXZj
	LpiVhl2dqXQRGWoQkGDcgLpW8vWhuQ7fFV3QL38nVlaGA/p3xoD5zEYARtAhppUZKZjk0/9Mwkm
	PxJEfbVtIV6qMaeXv5TGoZ1o2wMtf9ZjncB02pp2Lo6JrJUsjomS9RQ8WNWq05L4HBdEndo06d/
	T7HD/Yj10IZUBQP1TDbmHlcNTthYEGUhgJD9OV29iQarMKkdcP7FfCU8kffwmpVK51L9Xic99zH
	x5beG0kmVg454pth7c+a9+IOZdG3ndk/6b3+auyxjbsB/2HL6wRHCEPgsSkZa50T1Z6alzbykc/
	S3M5Y8i6gp8dM0sjbsUbeNwC8JEPIOUFa14A=
X-Google-Smtp-Source: AGHT+IHNXoZ8D6hcxitye6J8bRF474YdeJVlKpCXwByDHr/6U1kxp1SPdwBXlJC/jHhgrW329Z5ICQ==
X-Received: by 2002:a17:907:9486:b0:af9:8c20:145b with SMTP id a640c23a62f3a-afddc96119cmr295145666b.10.1755615313778;
        Tue, 19 Aug 2025 07:55:13 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:3ab9:939f:d84a:b5f0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce54021sm1009078766b.10.2025.08.19.07.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 07:55:13 -0700 (PDT)
Date: Tue, 19 Aug 2025 16:55:09 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 1/3] remoteproc: qcom_q6v5: Avoid disabling handover IRQ
 twice
Message-ID: <aKSQTc5u5AePWVwj@linaro.org>
References: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
 <20250819-rproc-qcom-q6v5-fixes-v1-1-de92198f23c7@linaro.org>
 <czaabkgp3aerp7fntqnpwgilipnum5vmdwwrkem5mugcs7vvd3@q2mwq6ijfbmt>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <czaabkgp3aerp7fntqnpwgilipnum5vmdwwrkem5mugcs7vvd3@q2mwq6ijfbmt>

On Tue, Aug 19, 2025 at 02:44:26PM +0300, Dmitry Baryshkov wrote:
> On Tue, Aug 19, 2025 at 01:08:02PM +0200, Stephan Gerhold wrote:
> > enable_irq() and disable_irq() are reference counted, so we must make sure
> > that each enable_irq() is always paired with a single disable_irq(). If we
> > call disable_irq() twice followed by just a single enable_irq(), the IRQ
> > will remain disabled forever.
> > 
> > For the error handling path in qcom_q6v5_wait_for_start(), disable_irq()
> > will end up being called twice, because disable_irq() also happens in
> > qcom_q6v5_unprepare() when rolling back the call to qcom_q6v5_prepare().
> > 
> > Fix this by dropping disable_irq() in qcom_q6v5_wait_for_start(). Since
> > qcom_q6v5_prepare() is the function that calls enable_irq(), it makes more
> > sense to have the rollback handled always by qcom_q6v5_unprepare().
> > 
> > Fixes: 3b415c8fb263 ("remoteproc: q6v5: Extract common resource handling")
> 
> Didn't earlier versions also have the same behaviour?
> 

I don't think so. The "extracted common resource handling" came from
qcom_q6v5_pil.c, but q6v5_start() just had most of this code inline in a
single function [1]. The handling of enable_irq()/disable_irq() through
the goto labels looks correct there.

Thanks,
Stephan

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/qcom_q6v5_pil.c?id=0e622e80191e75c99b6ecc265c140a37d81e7a63#n795

