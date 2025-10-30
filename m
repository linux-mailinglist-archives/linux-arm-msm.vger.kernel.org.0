Return-Path: <linux-arm-msm+bounces-79645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B6FC1F7F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:22:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFF103B4CD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6AB350A12;
	Thu, 30 Oct 2025 10:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4nziRlZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9679C33B955
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 10:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761819737; cv=none; b=KKkw2s4gPFhaPfnWUimJPBjo6Ym104P4yqgvWYHG60oGecCclAwaR5gCQxTHd85R4rCctBl3kBkQUJfOgduSipQJExyqgSMV5l5js/mvF2Aqu6nl1uyD+HGbU8MD5SRkscDaQlLGsCjFSi93bSrsVptOvXjZ6wzJLhOrXy6B7Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761819737; c=relaxed/simple;
	bh=G1w0BDUSacW0XOVA8splxjQGwNpkVsIpdBFy2H1rlrk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZeKvQoY27l/VbuPi0mZ/5SSLRQc7U2yGUOmW7Jyf39zPQID5CqIID76mIYKgDk6ilPa1JXj05+YOrL/dCDw5O8N58ch6nXqNv284RVz+sabtLUZ3eKdPw7YEwi5UfZQFO6J66K9LRfPSJ8QlnQEqkp/t+9C1zTruEUQLv5Z9PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4nziRlZ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so884681f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761819734; x=1762424534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T2kUtsOiX/qEGmwwQ7Isl75d5/MBlGm1S9q3l+zR8t4=;
        b=O4nziRlZhgxJfb1KvMVN2gNQbV2P+Xo4+fuBmNEr9fW8RTQz+B0i7jpMxzFaal93HW
         k61fraA1ZvcPT12sNxmEgNUZgCz48e3IaclXacyTktXDJ3iypfXBqVTRg3QDalNeTetY
         Syc5iJsTppy0NmrUPDed117+Dc5ebhdsFbJOjx1Dkdye9vKp0adQA7l1vhQZ9UcAzw4a
         HQP6CFKG1F1p8u0IwNRWsny0YSGWj9p5GKjNlKx+V4KbJKplu5d1f0lUcV3GQ1es8sMJ
         Cq60OSKCI0Y74Das+fyAmBL05LtvXZE5ncyaMf2YAdvQhN62ILqJzntogMij8FnV84uO
         ebMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761819734; x=1762424534;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2kUtsOiX/qEGmwwQ7Isl75d5/MBlGm1S9q3l+zR8t4=;
        b=KHPn2oSX4y0sAzTWLq5ydZAN09mbW/HZ0/GqP2E5bfgS5zfeYSa+5jnPasFScLlGnm
         a9DhRvSO8xvakAuQKm6J0igYo0kYtQ4tZsVZk+2YHjaVSpWxLSILDOXCFVU3SPdl5lrq
         SPHa1IllfDbxTG4NdtYLltuXuSOSCC9Wh7hxFjPNRhRQ+QDgc3ENlKeq/gCi8Fk66aiD
         KJbGGePyzacQ3eWbzhS/mz4CP5lYMziZB2AuTetO3ybkcDmKzQvzYpZrNyOU4BX8RMUC
         PEehi1GzcomVNl16EvWn+oC5cXhyWshnbIzOnljuIo6g9v7gM3X0x0H27GmvLp57drPI
         uJ4g==
X-Forwarded-Encrypted: i=1; AJvYcCWKN1R+t8aLoXKIm57GZlZMIlDcobsOkNXuyGBQK3VoZ4siUR/W8IAT+ko9ELyWSlwcll6/K8StHMhnc7vu@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf9Cdn/lctQM+bMpSYKHywTU+laOT2Ul2bbM+fl/5ByGWjPi3q
	GkqoiF923GQiST1keouzk2yufGxTOl7PsJNdeH/FBTzsVqGeDZgq+dsr
X-Gm-Gg: ASbGncsFKaJT0jmA2D1V4xKC2jAPjAmHSkHAqOwBUglqhBevuJFobcYAMiiQa7wuGYE
	Ado8SMIava/QlxaJbU6AIWUlSH/fp+z1MeRF2tuG02zBsJKwQEDprJZMcedSrpsVb+r15XwvfmG
	5dPZ1ASuSPjkFiRxc8ZbdbJbhvn3LRZA/DGEeHE4SX9oegGzMiFGM55MBkUEi5eb9PAgS1vFeph
	/O3f+jHXrPXdw+0IDVqz+vd5biZvVIz5XhH/plnFg+3QxIVh04VK2MigTmBmcpDltzB4sUAHYVt
	YMb7uUY2+nfH1tcR8/9QIvSBc5euoG4lTu6yiqY1Dq6C3V62ZZxP3B64c6EFcAFKWImvPtGY5Ux
	v0XxIU8Bqp7hWCjaP16OkT2GA+O9l6HnETHphLO8odO26g1tPPbMb/MbMzqz/1zk92GC5Yt+AbR
	A8xoLeZxtK9+fsEoR3xSSu6YjAFnco
X-Google-Smtp-Source: AGHT+IG2GvMxb9LZfEwn29dXFAw3jlFUGhKBMnjmh2/V3MU6jJoVJ3uGtYSEM3H6aIAKv8Kvh0ETuA==
X-Received: by 2002:a05:6000:4012:b0:429:b7cd:47ff with SMTP id ffacd0b85a97d-429b7cd4e85mr1197378f8f.40.1761819733529;
        Thu, 30 Oct 2025 03:22:13 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952da12dsm31773234f8f.29.2025.10.30.03.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 03:22:13 -0700 (PDT)
Message-ID: <69033c55.df0a0220.1a33d7.49ff@mx.google.com>
X-Google-Original-Message-ID: <aQM8U143LTOytPrj@Ansuel-XPS.>
Date: Thu, 30 Oct 2025 11:22:11 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Raag Jadav <raag.jadav@intel.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] err.h: add ERR_PTR_CONST macro
References: <20251029133323.24565-1-ansuelsmth@gmail.com>
 <aQIzoGnvZWYuHuoQ@smile.fi.intel.com>
 <69023512.5d0a0220.3cccb7.8e65@mx.google.com>
 <aQMheocySykpTFDN@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQMheocySykpTFDN@smile.fi.intel.com>

On Thu, Oct 30, 2025 at 10:27:38AM +0200, Andy Shevchenko wrote:
> On Wed, Oct 29, 2025 at 04:38:53PM +0100, Christian Marangi wrote:
> > On Wed, Oct 29, 2025 at 05:32:48PM +0200, Andy Shevchenko wrote:
> > > On Wed, Oct 29, 2025 at 02:33:19PM +0100, Christian Marangi wrote:
> > > > Add ERR_PTR_CONST macro to initialize global variables with error
> > > 
> > > ERR_PTR_CONST()
> > > 
> > > > pointers. This might be useful for specific case where there is a global
> > > > variables initialized to an error condition and then later set to the
> > > > real handle once probe finish/completes.
> > > 
> > > Okay, this has two caveats:
> > > 
> > > 1) naming is bad as it suggests something about const qualifier (and not, it's
> > > not about that at all);
> > > 
> > > 2) it doesn't explain what's wrong with ERR_PTR().
> > >
> > 
> > It can't be used for global variables as it does cause compilation
> > error.
> 
> Can you show an example, please?
>

drivers/soc/qcom/smem.c:361:35: error: initializer element is not constant
  361 | static struct qcom_smem *__smem = ERR_PTR(-EPROBE_DEFER);
      |                                   ^~~~~~~
make[9]: *** [scripts/Makefile.build:229: drivers/soc/qcom/smem.o] Error 1

You want me to add this to the commit? Or any hint to better reword this
so it's more understandable?

> > I wanted to use ERR_PTR to set the __smem handle instead of freecode
> > (void *) -EPROBE_DEFER and notice the compiler doesn't like using
> > ERR_PTR().
> > 
> > Then the problem is clear as static declaration require constant value
> > for initialization and ERR_PTR is a inline function.
> > 
> > This is why ERR_PTR_CONST following the pattern that was used for
> > FIELD_PREP -> FIELD_PREP_CONST that was also introduced for similar
> > case.
> > 
> > So yes this is specific for case of static global variables.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
	Ansuel

