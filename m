Return-Path: <linux-arm-msm+bounces-32053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F19B597D2FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 10:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E69C28237A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 08:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE9957333;
	Fri, 20 Sep 2024 08:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RbE4PV5+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1D82AE77
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726822193; cv=none; b=IRT7x6KxGExnBQyJOM3fVebrWbklfLzrz2V1fWytMrXbdKwcvqIE3o8OvBqulV4DLcIVGRPbOcXl9iS9QOxlLASR+JzCHlQczoAqKS0DiKhvotyCTFc2EipfOHNxvlJ+quNzZzVyo9qLGBlrKt4WB2Q4vzsbJJuZhX8ku89SucE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726822193; c=relaxed/simple;
	bh=Ul6+k56+rET5ikYl9Wlyb5QU+2e9LeAugwA7ZUy8aQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulZs785STXFY09cWEprzLHBOfUMJTUd3edjySe901FH5zHKfZiKIOhl9E1lfXEDFFFFurjZL12H4NsB5a5l9TSzV7zgAA0hRIjqXJyfkTO06+TAwUd5l6Bnkk/333ZpjL97dQgq2CFnmUdsJunMSTaqcygTsjDvhWqvowuWL19k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RbE4PV5+; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2f75129b3a3so18914011fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2024 01:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726822190; x=1727426990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/dZq39y1yiawVOmzqHUZFDG0IEs14bepdnpA8Y4CR8w=;
        b=RbE4PV5+451YuG+biB7lLBZAURJJ/QqtJvSHDB2EhC9rHxWHeFWyc6juSxt/VAUqr+
         R6XB9iR3YsI67eSR+iGbOWJHA6fQ/XqPRCXNV4jazrxfnVCCML0rvlMUdKe8Is3V4ZPa
         Lyk+A8yzqlUAhLkWgBz/betzHmtGGVGwAtYW/DHkjHaWr0rbaoCl8xTv5AtIBy4vc+zk
         0vqNCbPxvtkrr2SjcoDHBbseZ/IlK0YMJE+2SDlH15pp4Yn5+Bg9E6CpClhraQ8hixpT
         1W3Fp5A5GxgpBlVax+g54A0xoFwfwLhM+6Sunhp5oUlf2izU+Gw73jBfMU0RRN+ik9AI
         Rh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726822190; x=1727426990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dZq39y1yiawVOmzqHUZFDG0IEs14bepdnpA8Y4CR8w=;
        b=NnJ/KnG8ZMDjqTrnGtvSXB9oDV6ZXGLfjO3CeBcaK+0edVZCr6lZnuBjqq+XIRQDQF
         QX11MwXivKRkzzjGBj38swXexzlRE34RAwzRJGgJUzPThC4FcBQU+6DPBtlpNWL1lk5S
         Fl25lEOjCu4QAJ4OU5qjz5MLyPBe8XNQBdukXpsbnmHlIGdbkzHhH0uHEU3m5LE3Ykk2
         JKO8aq6xnlrCgCGtHtHpxegITSGWnpHlNyn9C4gfE8zT+tCJZiI1xf0HsZnct+7Gdot/
         zspGnhI1Wz1qXKsP9cD5gJfxYmH+xb/TayfwHfY85iqkr6RIAF8MHSeIKG80ZBQoOiqT
         tqXg==
X-Forwarded-Encrypted: i=1; AJvYcCWbB0a2RN+4/BVL9kM4N7jjJpzNKnL4h9cTW/mdWSgmn6slSTB782F45eoXHAOuJmiKsyfnXEaTbYcP7PN+@vger.kernel.org
X-Gm-Message-State: AOJu0YwmcUizg2x6ytGOnzXNWVwzgydJ3mB6CKlQYN8ajFzwa8MzHdid
	PlM4ZIC01LC8GOnIWfZP0rHP1HjfmC4/TDyrVTw7/rR2n0uAp2C3rBdBfhz7KIQ=
X-Google-Smtp-Source: AGHT+IHNgoRJU5dt/I+CNLjo/qo8pYUrBsy+CjDiGTinbT2mfTEim0dzNPghM0G/Uz1D8qPKV8HY5w==
X-Received: by 2002:a2e:beac:0:b0:2f7:6d92:1a30 with SMTP id 38308e7fff4ca-2f7cb2eea52mr15262661fa.14.1726822190038;
        Fri, 20 Sep 2024 01:49:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f79d324e6asm18274321fa.72.2024.09.20.01.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 01:49:48 -0700 (PDT)
Date: Fri, 20 Sep 2024 11:49:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: pd_mapper: fix ADSP PD maps
Message-ID: <sziblrb4ggjzehl7fqwrh3bnedvwizh2vgymxu56zmls2whkup@yziunmooga7b>
References: <20240918-x1e-fix-pdm-pdr-v1-1-cefc79bb33d1@linaro.org>
 <Zu0wb-RSwnlb0Lma@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zu0wb-RSwnlb0Lma@hovoldconsulting.com>

On Fri, Sep 20, 2024 at 10:21:03AM GMT, Johan Hovold wrote:
> On Wed, Sep 18, 2024 at 04:02:39PM +0300, Dmitry Baryshkov wrote:
> > On X1E8 devices root ADSP domain should have tms/pdr_enabled registered.
> > Change the PDM domain data that is used for X1E80100 ADSP.
> 
> Please expand the commit message so that it explains why this is
> needed and not just describes what the patch does.

Unfortunately in this case I have no idea. It marks the domain as
restartable (?), this is what json files for CRD and T14s do. Maybe
Chris can comment more.

> What is the expected impact of this and is there any chance that this is
> related to some of the in-kernel pd-mapper regression I've reported
> (e.g. audio not being registered and failing with a PDR error)?
> 
> 	https://lore.kernel.org/all/ZthVTC8dt1kSdjMb@hovoldconsulting.com/

Still debugging this, sidetracked by OSS / LPC.

> 
> > Fixes: bd6db1f1486e ("soc: qcom: pd_mapper: Add X1E80100")
> > Cc: stable@vger.kernel.org
> 
> Since the offending commit has not reached mainline yet, there's no need
> for a stable tag.

Ack, nice.

-- 
With best wishes
Dmitry

