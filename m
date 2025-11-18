Return-Path: <linux-arm-msm+bounces-82385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 877BFC6B480
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 19:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 69E8C4E24DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 18:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7672E0401;
	Tue, 18 Nov 2025 18:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIQ0xxrX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327562DFA40
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 18:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763491831; cv=none; b=e6tY7rPokT/swxGLRvPWxfCGdcNH2N0jbvTO+7WlLiiftMk64kKiUt+sFW/YJ+gPD8E3OjQmVw8Y+hHeAoOs8P0tvI95xmPL1FUILI6iV9OaoB0x8nP4eL3UT8O4U7I1oyoTQp0hetyr1pLlxf5csm7qTNqvcRo4m+X9bsDzi1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763491831; c=relaxed/simple;
	bh=FHR1vghh3/Ry94P21SXhw8smish6xFij+qwri1zqTjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P+rtfUEm6Qtmg0uBkmpureumkjs9EbpUQZE6HJfYPb1vhV08TBwQn47amrkfAnBvWit0wuwFW+4Arkbc+hyfTeqAM77i+7TxTEYmUK8vPsXOMDFbUQgpsfSKWk1f31VV4ApiS7wuR1dAm7B2gNFziCi+loVn/Bn1V//W8ShNP74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIQ0xxrX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779c672e9cso2683055e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763491827; x=1764096627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/xelqTh0MJxdYizhebw3VTy7C2C4gWnDlrkViLNdgoU=;
        b=LIQ0xxrXQWQtmEb6OWHzz4PyETg0i3Uw21zC8mPfIRT7zfrT9WATNk/f5o5HFWqSw3
         GHZa+BEy2LfmeNkJ6Ghqu9WoGVm3+cqnzv+jIoUiy1hpcCJnFST3f9SdFwCimVJWpYpO
         nOYdofIi5m0ZJyu8Ci9mPqxbTLduex4Qv1vT0z23xsPBY1XA1YsY/aECC1lvl86KDILB
         jMV8gXDK5dGx0puOyOuAnZWQAjt294/94HSjMWYlLvmnjNh4Q3Dg+0VLRyYc/oJB4J0P
         /qwVF8RrWsNLKDUzz6fYvmYz20m81WCCyCmtDqOcVpwLWSjIKGtM4jjJmqS1q+ZSJgRe
         aPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763491827; x=1764096627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xelqTh0MJxdYizhebw3VTy7C2C4gWnDlrkViLNdgoU=;
        b=maSS/ZEV7VxCf4rwOi4fvincS4N98BngxqA3ExDjx35v8/siTfzUMO4eNN3U45VyUC
         /g+BArU6RYEUFpxS76A2/ALFzyXg0C+JJheeCKSajAgX8CifqdMKRpK6kHr39s9Np4NW
         rQg3YHKfQpgosqlzlpC7S+tvu5r3rdLvvQA0K8DMYxw1lrUN6alQy3XU7feN/L/CQKv8
         sXpv1G5EVMLbzNIJTLzTDdHSZh1Te2v76P+Z5n46uUrpEeQ74oAxxSh2o7eM3/rCn9qX
         UsEHin8r0vPsO7nicVo/0nKLeJrtHh0XK5lEkzT/PMPta4zKDVuAcaQht/HWLp4VpDXA
         EP5w==
X-Forwarded-Encrypted: i=1; AJvYcCX5V5f/FerIvV6E6XLt7mU/uDOObliFPYBVZ6nXnBSLlbJfPreh6LfUXC2qZUrp7CafSLWH5mMZZXEqNtNi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsobv30KIAPOxzxOC/8ZULc1MPLnHTVtCY8T9LQRZ7NWO2meup
	ZLFJ64n2516GiGnE23u/UN7L2f+aKTOyggx0i8eepoRqcz7ERnbe2QNK
X-Gm-Gg: ASbGncta4TAkafB37b9LAt33T1jhq5Nvgicqy0H8Jp7a9JnR7nY+DUhjUVd1GDiNl1F
	P5ZmiNw/VHowJP0jBFGbziocpX8xMa8ozZTmzgcCwMEDSwDmWEBcLbeY7dwO/GIWrgEBf2Z4fRd
	kvrd25TupCxqLurtqM29ShVgNNnrM/vX7n3Hmbw7/nHQnR/JY6dOxEzjARKp9aszdO/r021frgF
	7hUf4e1qDGzG4BRAnhsHUYUwlB9ttpCQWJKH48eiqd48Rl+bwFwYGOL4IMwzYEMkPtJDFlsDPlN
	u53RCHBr0/npi/petr7k2wq6TRZtygABE3MAiiq+TyaAEF8KNBlX7glmNpqGoYDuU40oX2Ud0ry
	IzjGWwJy4Dw84P78o/VOGr5i6bWaNiOiF3CMeD5ZJHLHyocUAThisFfeNKcIPrc81HtUy/b447y
	BlPuW3QM6E0an0
X-Google-Smtp-Source: AGHT+IHx6i4VYWR6pSTcXtSoFlN4Y9U/3Z/PI54PVyQA5JnsfbBaJwpdM3LzkIBKtiuh5JtXbYxanA==
X-Received: by 2002:a05:600c:1547:b0:477:5c70:e14e with SMTP id 5b1f17b1804b1-4778feabadamr87966605e9.5.1763491827278;
        Tue, 18 Nov 2025 10:50:27 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:9ac1:9a91:7d1:a813])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9df99d3sm22110705e9.12.2025.11.18.10.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 10:50:23 -0800 (PST)
Date: Tue, 18 Nov 2025 20:50:17 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Vitaly Lifshits <vitaly.lifshits@intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Sagi Maimon <maimon.sagi@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Karan Tilak Kumar <kartilak@cisco.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Casey Schaufler <casey@schaufler-ca.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Petr Mladek <pmladek@suse.com>,
	Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
	linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
	ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Satish Kharat <satishkh@cisco.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 14/21] net: dsa: sja1105: Switch to use %ptSp
Message-ID: <20251118185017.kk7binsumhh27n7x@skbuf>
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
 <20251113150217.3030010-15-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113150217.3030010-15-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Thu, Nov 13, 2025 at 03:32:28PM +0100, Andy Shevchenko wrote:
> Use %ptSp instead of open coded variants to print content of
> struct timespec64 in human readable format.
> 
> Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Acked-by: Vladimir Oltean <olteanv@gmail.com>
Tested-by: Vladimir Oltean <olteanv@gmail.com>

Thanks!

This is a rarely modified portion of the SJA1105 driver, and it doesn't
conflict with other changes that I have planned, so from my PoV there is
no problem with the patch being picked up via other trees.

