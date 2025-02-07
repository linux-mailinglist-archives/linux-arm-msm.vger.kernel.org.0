Return-Path: <linux-arm-msm+bounces-47166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6DAA2CA76
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 18:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EF733A8ED5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 17:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF08F2A1D8;
	Fri,  7 Feb 2025 17:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZL4hG54x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E1519992D
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Feb 2025 17:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738950238; cv=none; b=tYd3TH58BE3xiSoeRfEuC9wa9HL/jU98uRCyGWhpbqvWWF/BCR8tzPcuFg7Z4rOc04PivlgTY7DOre/Z0GnWDrgEZMbCmqdUoU42l2J8ysR3ZAtG3HNfgCJCwhH+RgU341Z2jDcm5qsDQeJ+WMw1bC0e4MZp89V+RGIBEOQoeos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738950238; c=relaxed/simple;
	bh=c9BG+dddiuTYPj3MATPxipFhaT5LiNMb0S58a/cOgpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbb2zxq8MWtyLv+JUNg/Wvzejpc9CB+ccTuspZ3ejlEq7R9jxEq0OlD1o+0NVnP1aozrsXppmUCTB/qD8xVhWikfjzhjENUrLm4CMs5ToxNAa904uy4CP3Mx0XnHnYED64mHAdrYVh6cpPiadwVn5k3VJExSq7QWwxzPKFHZtzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZL4hG54x; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21f2cfd821eso43983065ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2025 09:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738950236; x=1739555036; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZvlJDdsD4/VUKIsEz1kRWlYd5CsK3CkVo9g/8YQ1yzY=;
        b=ZL4hG54xQZak2kakYfgjXZk8xudhFzKpCPidZri6R1Zbb4fOmCg3VjuO5pW8IUP/nx
         2bLCXHzhJBFhPVuHL0zx3MRHbE1RqcpY3JtoWr8tOHNdQjeP+oSR+qFvmk49MVPdXSmE
         MaYCV95BRJONU5nZoYtlixzfncO0em3tNgoP/iohlYRew8iauHdZv1bUYgamsXVFGJ8x
         xzq4UBTQODIdKu7etG2ZzuDz+7JBmTulsIjelipANzuhm69TYcF5eQI8EN6vtTAhiYXe
         FpOshCbaE52WhSFUZVk5/roxg497teasvtTRG9bFWfGoVxmrH3KEdWQxpK0mchyRvad3
         VgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738950236; x=1739555036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvlJDdsD4/VUKIsEz1kRWlYd5CsK3CkVo9g/8YQ1yzY=;
        b=N3zKSyQP/PwAw7JWS1/N7LilCydaxOI4AVKOzEfNWpjpJE4zKOBhJ+Q2nhU16uq2Gt
         esMH8YQs0H4B8lqU4SZkwQV/o1dnhvzEm3xL5Mxoiesz7t/FJqS+Pmkx1dsjUjZkOwaX
         DTZ09FEEbD6aEfBD0l/+HlcpyEgPmdlfIpBhiHN1Mx0T10B3xMpNzOZL1j7OunfeCkMt
         LL3a8yLBzgFsqcOoFm0mo3O/ZUGdCngr0+nmHMreXx5DR+a/4ALUihKt//+wNaVpJzHe
         SXx93ReXG0yuKQB2Ui/vXAtVAoNDAaobuVJQjnC4qF1YqWa8Ay9OgLXEIbYUS0rYZtaa
         f4uA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ17X254Om+FPCEC7FBwfoZ8dDIQsv7BFbJI6LaYyLgDML6zeqfdVryDVJh1fxfFj4TPeuFX6mCI6re3J0@vger.kernel.org
X-Gm-Message-State: AOJu0YxDxJpfzdBH9pzVKuzbQjyHQxIDCQrpTvSccaFRDTny5nNFNn5d
	lZzBIIFmzOQ6BLrvkCR5igooY7OV15idFD+uwEG8A+WjvwI+Pb4dZHpN16bjIw==
X-Gm-Gg: ASbGncuSBjvBA/9wOG+GIdXHhRtKjbr4CpRBaA2oDu9LWxhhCJj0UWj98ZUKJUrWBdx
	nY5vJ3X/aogl7M8FP/hazEXdZRVhr2LFgQgAQkOVJYUwdLZaImgNV8HHfCPFyNv3vZeuHYlV4fG
	nlcUJdb0odtCu8+es1JLCzMpCvrU+p3jhdIPG5Wv56HvrNarSintrpmyN7xMKiVSxgHPVw6G8fE
	K10Ud8chPpuTC23SvCHecr4qvAGvDIh27eh9oTJxNwlWaCT0CzBxRD5on/87Ek5QZmdtS65mXoZ
	h5EhyXsMlBoqTAz6+v9XVCLB9w==
X-Google-Smtp-Source: AGHT+IFYaPnu8nAAzI4VlaiplnIV/qm5sPf037YcNY/ispLSCgTlWlOwIEh32JjPqZCnATuTeyyZqg==
X-Received: by 2002:a17:903:1cd:b0:215:65f3:27f2 with SMTP id d9443c01a7336-21f4e6a5767mr52384765ad.8.1738950236602;
        Fri, 07 Feb 2025 09:43:56 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368a25casm33325135ad.218.2025.02.07.09.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:43:56 -0800 (PST)
Date: Fri, 7 Feb 2025 23:13:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: Remove unused functions
Message-ID: <20250207174353.rxsxblcrnkieise3@thinkpad>
References: <20250127215859.261105-1-linux@treblig.org>
 <20250201160721.bgfyi3cwilvibl74@thinkpad>
 <Z55eWunU1NRkV2QP@gallifrey>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z55eWunU1NRkV2QP@gallifrey>

On Sat, Feb 01, 2025 at 05:48:10PM +0000, Dr. David Alan Gilbert wrote:
> * Manivannan Sadhasivam (manivannan.sadhasivam@linaro.org) wrote:
> > On Mon, Jan 27, 2025 at 09:58:59PM +0000, linux@treblig.org wrote:
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > 
> > 
> > Subject prefix should be:
> > 
> > 'bus: mhi: host:"
> 
> Ah, do you need me to post a v2 for that?

No need. I will ammend it while applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

