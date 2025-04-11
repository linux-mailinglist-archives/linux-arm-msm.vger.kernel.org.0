Return-Path: <linux-arm-msm+bounces-54023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A278A85D92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 14:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DD4C4C7594
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E642BE7C0;
	Fri, 11 Apr 2025 12:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aHQ9UfXE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F54A2BE7BA
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 12:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375226; cv=none; b=oSXY1Vg+0hVouUrrdnTaTz1j6NXFe+YlxfoKtVADiSDuiFtu3oG9sGulm1WAZ9ynFVuqNEyziOnIl7v3gNd3Sxhdb71Eb565P3tB0mWxj+KepO/ur5GBGHddHAYPgOHHaUUpgyoniR+/StXhIhW+wD1UzzNmZnBvHICJm8vrORk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375226; c=relaxed/simple;
	bh=AXZG8z2/mlESYwSYPyua3F76ehc9HJ/RiOj/ndVT6Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slyzvJF1mll8j14pdmU9D+YcYnqtWxeqYqRTkvviatataxOuRA6+xKUxoUwP/hWdJjdEhdJf4WPpEY0SmcUWzaq/3b5OoXYhXblrnzKrj3rZBh4znzRZt9KcYmhosquQWS/hooBT3QAhTcIvsXbDqFjAvusQdA6Q/0GVf26rQus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aHQ9UfXE; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abbd96bef64so376722466b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 05:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744375222; x=1744980022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f1ocAfGLIQFAKvHMqFgNq6HHUQpi9TfZCv9uviDd7As=;
        b=aHQ9UfXEtgUXLtItA36BHSuNSOm7W0JfafYWoPyQ26lG+UZZq6lwEkklC9x29qon9Q
         a6go+m+zBy2Pc3bVZrqH//eoceD9zo0LadjTuitx/rOX7i97WeXr6WfotMehfuwrN+6u
         osbE8rKZQRA//iNTQnuzTMQ3CZB3oZSdZeNpyOVxTAuz6EVxUem/ZN5189un844KWJcD
         39JuhyJUHFiteRfvrwKQkxRCAHGqjShGUi+BAUDEPO1sKwrbLvdLWlWYe2lW5sycjEpT
         n5/XoxeUT7/h16zhMVHXBkPzuvonZ8+kJL990fgCGApJd96QpS1Or2tOia3n0tAL4RdU
         zh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375222; x=1744980022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1ocAfGLIQFAKvHMqFgNq6HHUQpi9TfZCv9uviDd7As=;
        b=pWSGC+OzH/f3KziQtv6rWL0s5vgeWB0quEx83nYmQ0ZYxmalbImwgsVy0mxR0IzOHn
         KAi2rwn2wBrfJJ0FS4AnYW9FLpdiczZro50RdhgEYWjd3wTixKhey+xFLCJRCK6UgSfC
         P4hS4FhbowJDz278TWhqvhPWLI8qRDqVHvikWAa0DX2XjAKYDmjB2kQ5UoSpp/qogEUd
         9OHYECgN3b6lJ49ST/cPO5SPg1ohFKNlFbmHAN8LL8Pqz51IldQ3U1N97FVibmJdl7OR
         z0IR5cWA+fD/J5dvbrleKYnll5Uag4tseV/E0CQ1lFG1RZvaOparRLob2labtijjKfg6
         xvtw==
X-Forwarded-Encrypted: i=1; AJvYcCXc0xL7omOEDHeFCTVLNsGnbyr91QycssFwnoZ0UHxOP/KlCjH3XUzP2BqLo88MeyPHbcMoz+yqeSlCgTA7@vger.kernel.org
X-Gm-Message-State: AOJu0YyDxLjKUDvJRRa1BO340JoreIi7N1WqtNFQy6QwFVCIGOOeSx7/
	J+riRJryOp1UcgfegVFTJJlePK7mOt8upO4YXMIxez6YvVsEDtna9Su8Px9XipQ=
X-Gm-Gg: ASbGnctQmQybYtASEAllBGPlxhon6MeumpmIoOMYb1dPQks1tVzqXELWsyAT0RHqKsd
	iDuBJZwQIsDkvxof960gW5MvtlzAIabijRHWcF2JpsPWiuIFmn9T/IyLPG041MHj7ONVpGjEDcp
	KqvCwRiSjnCnqBzApc67xRfWz6kiuESoCerfey9TOrr9Uw/SokCHJgR80blL5fBAz7gC77Qj0uo
	gd3xbSlCuC+RPij+TIZMqud1D88CTd16U+4933eAtSDYi8Jwo/NP69CUaMpLJJtfZfQfaiPN0GQ
	0fPDLtNxoAM1W8ZE6i1uPENFoba2TwHDDYqyP6NpPV/8KFh8K1A=
X-Google-Smtp-Source: AGHT+IHgyCOoZTpXR8VI7LoO3entvTJlRIeqltOKvxSFeMXEvp7dwNM/Lz5ZzULD+8sUgZTb+VYO6Q==
X-Received: by 2002:a17:907:9692:b0:ac2:a4ec:46c2 with SMTP id a640c23a62f3a-acad36d5ea6mr209131666b.49.1744375221837;
        Fri, 11 Apr 2025 05:40:21 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:b4f5:b9cf:f32c:8fe])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be98c9sm448014166b.65.2025.04.11.05.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:40:21 -0700 (PDT)
Date: Fri, 11 Apr 2025 14:40:15 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v38 00/31] Introduce QC USB SND audio offloading support
Message-ID: <Z_kNr52hM-iWUgyZ@linaro.org>
References: <20250409194804.3773260-1-quic_wcheng@quicinc.com>
 <2025041029-oval-cavity-7896@gregkh>
 <2025041144-imitation-reappear-a0d9@gregkh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025041144-imitation-reappear-a0d9@gregkh>

Hi Greg,

On Fri, Apr 11, 2025 at 01:04:37PM +0200, Greg KH wrote:
> On Thu, Apr 10, 2025 at 09:11:42AM +0200, Greg KH wrote:
> > On Wed, Apr 09, 2025 at 12:47:33PM -0700, Wesley Cheng wrote:
> > > Requesting to see if we can get some Acked-By tags, and merge on usb-next.
> > 
> > let me give it some 0-day bot testing to see how that goes...
> 
> All looks good, so let me go apply this to my usb-next branch now.
> 
> Thanks for sticking with this, I think it deserves the "most versions ever"
> of a patch series award.
> 

I have honestly no intention of blocking this series any longer, but the
comments I raised on PATCH 26/31 are likely valid and suggest the series
wasn't fully tested on v38. So I would personally prefer to get fixes
and confirmation on that from Wesley and then merge v39. It doesn't feel
like the kind of thing to fix incrementally on top, since the commit
message is also misleading now.

Thanks,
Stephan

