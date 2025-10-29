Return-Path: <linux-arm-msm+bounces-79494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 071E2C1BB76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F026018974EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A8CC338906;
	Wed, 29 Oct 2025 15:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acl3aMc7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EC53358D8
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 15:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752344; cv=none; b=PeNzOHhOp4miyTsSY9rhwmAMXbujQASMwvuf5fpVxezvczCQqAsbLK4epustUvzIyqnlpUOo8zdnSjrFhdSbuDIziAYATFWfoDPz8fL7loX1PAbvXt0Zknq86N1gvPBZq4plErr8sjQe1YGoKiQd0FUEpKC0VlleEyqISVoe+Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752344; c=relaxed/simple;
	bh=Zw9Abyl2gi+Yxti27ETWddwvP2cLZARrh4XjUeuUrG4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJh/cRcwRzMFtJs31gcJ/KZzisGAdnjJfF9+/DbTafJ60TfphKt/w2StkijTmQZDV/tmYOfU6GNoza+68MM7bQ228IOQ+6LB5Zsy6T05+xBsCVw1hjN4SS24to3Px2KNp9vnGP3C2HXvLEvZoUUo4J+AOtxdaTWO5ffXgc//MsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acl3aMc7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-475db4ad7e4so21771075e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761752340; x=1762357140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G/SkdXpdQ2mlM7MBq3PkE7aXo/4arz2IJ0OU1Ygc0S4=;
        b=acl3aMc7R33B1Ggd25dH8hebrv90bObJjLzkHPoM94n/6dJ76Lk9bVLDJXzIAGJYlQ
         9TlSNDg3qZyBWpe3q5nsrXIqZgIYcgSIh7GLXubh2clDTJF6vxpO7ULxp5KxJ0ABjQ4V
         xh3poVOq+vQojsz8qgnTh2oVDaDfX+b3a6OtPAeurGoHtYYU416iG6dFws+MWToCjQ4q
         y+TB74nxOFYYyVa5MGrv/ZWoz1REjgKaGGYBfdMIN+D2Bs8V/fPKnRxISy6P3Uhi7/F2
         PnR0PWaIYClWLBojzQs0BcOlAVfkH1PSyqoFRjsJyxbvtSg6Eq9VwpVNlyCt7rp84pW4
         +uAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752340; x=1762357140;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/SkdXpdQ2mlM7MBq3PkE7aXo/4arz2IJ0OU1Ygc0S4=;
        b=ejCZ/tBWrR9PVRG98wRYfErduikyKHx8XePveKLxJ5/9yy5N6OiMzAA3RpMZHCnrI0
         mnd/QnuI/3xHL41Qk5WyzVsH+XeeYZ21i4WOME8om63xs9du+hsl7D8OTUWvnFDMnquS
         K8ccTnWAW+FWgNd3nMq72yxvaEjd6r8zKPmwde0xHqDsbTlSUEGnd9oIvYpfxxdieDap
         IUQuiYoI2twAHTWNEsxVCfodlk9dbyY3Bdzd8yCfWIjAUiKX/a6etLGom9+wCp0V+iMa
         RdHC/fJ+Q2gnynvDpYb5/bs4/YQgvngudL96l8thv+tdfIlkOi8DpTuguqj9Bi3L8DnQ
         xa/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2MFef5btZBrzgCgxa+Tff/M88475DcMuIpEK10QxR6xsu+0J+7F/PpLepOGobNUzwSMvz6CzfOgsgLdTO@vger.kernel.org
X-Gm-Message-State: AOJu0YzEGQ7nCd6bjm6nSs/d3HXQRTyS81XhdcGRbb2OzhvQS/mAU2Kd
	/XLsp7o4V8233eySQKzZRD5Dpb+HLOyKLUtPkCl1M1KDkh6C8ZkQOQUW
X-Gm-Gg: ASbGnctNrzfqvXAgrVEfF37pjYTNDjf/kdFJdLioLqx3a/X6RlWMVTePtGtmj+vNp11
	MiQew2srcoFrvGq3NQme59zw5hOnrQTxDrCLQFPwV1Vsr/ODBz648pyJvdYL9eDKgRPnqZVZdLg
	2CuQkb2EXeV6PoO70bBPjWUnyVKvvvoFnqy8MxdxzJfwxi8Q6d3yb7OcA+PWgK7F+B/E7LXaNed
	ehvHQcbRO0tRYfGZlhKCgrux4HX4K31JJxWzZODos0Ir/hD7CpadoGfoYuKYUdz5IR/YUtE8HL8
	T03GCWaqYdRD8UjDijAW+wDXd7D+vXF6t0zQB5F1bS9ZN5as1Pe30kaWFxftYgf75PCXCtURftb
	lKPQ0V144ZJM6D3UOcRWdIjEJuzMlK+WzzNfyhdWxr9knaWyyJtB0NymHF5g0DYxtPjAxF/W+bS
	gyf1V6Eq0cq7CeJA2j1PinGJA0TG2z
X-Google-Smtp-Source: AGHT+IEzD+uGSug6873FGiGzyiOsrvPNmJnfAKGaP1jUpjdYCDVFQsBwG2AhSPlYElGJj06L5fCBdA==
X-Received: by 2002:a05:6000:1a8a:b0:428:3be9:b465 with SMTP id ffacd0b85a97d-429aefbe046mr2473566f8f.51.1761752339128;
        Wed, 29 Oct 2025 08:38:59 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de4a1sm27473610f8f.37.2025.10.29.08.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:38:58 -0700 (PDT)
Message-ID: <69023512.5d0a0220.3cccb7.8e65@mx.google.com>
X-Google-Original-Message-ID: <aQI1DSo99grsrFdk@Ansuel-XPS.>
Date: Wed, 29 Oct 2025 16:38:53 +0100
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
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQIzoGnvZWYuHuoQ@smile.fi.intel.com>

On Wed, Oct 29, 2025 at 05:32:48PM +0200, Andy Shevchenko wrote:
> On Wed, Oct 29, 2025 at 02:33:19PM +0100, Christian Marangi wrote:
> > Add ERR_PTR_CONST macro to initialize global variables with error
> 
> ERR_PTR_CONST()
> 
> > pointers. This might be useful for specific case where there is a global
> > variables initialized to an error condition and then later set to the
> > real handle once probe finish/completes.
> 
> Okay, this has two caveats:
> 
> 1) naming is bad as it suggests something about const qualifier (and not, it's
> not about that at all);
> 
> 2) it doesn't explain what's wrong with ERR_PTR().
>

It can't be used for global variables as it does cause compilation
error.

I wanted to use ERR_PTR to set the __smem handle instead of freecode
(void *) -EPROBE_DEFER and notice the compiler doesn't like using
ERR_PTR().

Then the problem is clear as static declaration require constant value
for initialization and ERR_PTR is a inline function.

This is why ERR_PTR_CONST following the pattern that was used for
FIELD_PREP -> FIELD_PREP_CONST that was also introduced for similar
case.

So yes this is specific for case of static global variables.

> ...
> 
> Note, I'm not objecting an idea as a whole.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
	Ansuel

