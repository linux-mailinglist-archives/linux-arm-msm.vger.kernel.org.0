Return-Path: <linux-arm-msm+bounces-24815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9378991E649
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 19:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEF3B1F263F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 17:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD2C16DEDB;
	Mon,  1 Jul 2024 17:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rfc5FLgz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DEE16E861
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jul 2024 17:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719853909; cv=none; b=pC5r/5bo5yk76SBm3I7ei7xk0ZVv7DtjvVfqRpMdtHcIaA1cKmST1PmFkb2kZJ4dyEYGgVdJnIqNIQx76dST5RFOPn5kKOTQSoltfOl3AzVgxKVxsXw37sq5oIqQd6J2ergPd49Og7Cq8NXsPw3TATr05K+9YIVLOkyFMgKNJPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719853909; c=relaxed/simple;
	bh=XDReBAMXNXAYQ4dp5QWyJX9bw2Y+xrftjmRnmRxi56U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KrzcsmO1egcPCBuJrSEzTlsYNjkDV5vseZAAmBfoz2XMUzRXmzxOSJjs3feF8tWLdfeyEJH5jQhwJwUkjJZM+wSvL0lCV9Vm0u86VYUnB+464wcN9DUQhtOMyyHrCdpeYMTWtr7k4UDcjn7cl5rAZEeUbNoMZH0XEcJ91D80fko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rfc5FLgz; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52ce6c8db7bso4876044e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jul 2024 10:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719853906; x=1720458706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tw5QduFXJcTB28IfyzuqlpIiVDaOglBAYISRE1Qzh+s=;
        b=rfc5FLgzutT+28Miub2Z4OeuN3YvlC6Dz2zWIXwAafIHSkZmzT4p6cOaiJfPPxRS3+
         Pitba23XtkzBc397qXfoKUsfoZyfTVRt5TdKEt3ohieQRmOEd4nGXU3V68OTBYunVyU4
         5bga444RBcdx2K//9y+gD68cOwSgqxAwFs8T3oAsq70BeBBEIHPYN56c9QVcmHWC88iR
         K5oNXsuAKZEZmV7vkzW+VDrwwNp5zSSxU5rcbg+LE4AJbsqGkoASjRlFJrLrIPMnHx7z
         lol2Ss8melqAqB+GqxPlrWQ70mtn9bRRuh/OY3hdbV1uqJe9hVGQrvTpy10rhXH5R49Q
         6HAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719853906; x=1720458706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tw5QduFXJcTB28IfyzuqlpIiVDaOglBAYISRE1Qzh+s=;
        b=DcdT02iXREAvIPcleWisLDeGO+p0lMNVWjI/xKc/wMiV63J6JwxlDZ1637Rz12jqHK
         X2WErBYipaKnOO75CYFWD7E2vPSOhR8jTIyK/mlnHYjr5w54dDs1YpEbWujIaRq7A7nD
         7Oag23YaNSvlIpOKkJ7rUhOrcwgi0iG+HUzmDf6r7pi9vq7LE1TIKAQRPHdl5bI5Iox9
         gYvEt4KauN+Bd/euOgtddxLjozlzalQu0Z5D1WX/Ef3LDdL1pHMtEli3T1LmQvYKAQDk
         rbxKosjjoayjs27gRXkQzExX+OQTxKgYU8/0kKqIoOSLJ2UmdXLPC3nwBaj0mNGf4kHC
         HHnA==
X-Forwarded-Encrypted: i=1; AJvYcCWisezQhcZu/Ol2HALpk1b6BtCVbf5PupKtP7meAf9+KHgtpkw21J6LzuecRJ3nv/eDRHQdQYcCfrrQTNIybd0cHzriA8R4XtPwjJhfpQ==
X-Gm-Message-State: AOJu0YwdtNsBe0WXPKHKncl/Tqv968INxJI5AjLgP19KOQ24YPUZ/MzL
	SXp2jFAstOOkCb8jb00nUEM1vscwaarP6TWC7IQoXYpPTxcT66izBivxt0DhhN3UkOa3SMRWJsu
	j6GxxmA==
X-Google-Smtp-Source: AGHT+IG0FD9r3fZ87/dPAvcHzM7eN0Yneht5xggRUbjqwkATbC+IcDe2hM7Nw/WMF7GO8ZiST5S9Iw==
X-Received: by 2002:a05:6512:6c7:b0:52c:e16e:6033 with SMTP id 2adb3069b0e04-52e826513edmr4541733e87.2.1719853905921;
        Mon, 01 Jul 2024 10:11:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab0b9cesm1449102e87.7.2024.07.01.10.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 10:11:45 -0700 (PDT)
Date: Mon, 1 Jul 2024 20:11:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org, 
	linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
	stable <stable@kernel.org>
Subject: Re: [PATCH v2] misc: fastrpc: Remove user PD initmem size check
Message-ID: <foe6khsckzdvd5ccwitzfpdwoigdgu3uostuar3zk5d5stcd4s@hkrdg7vp4mqt>
References: <20240627060518.1510124-1-quic_ekangupt@quicinc.com>
 <62dzilcvsp3efxpxulzkf6e62rzcrhp55k6yjk5fymkqthdfzw@yageexbx6ddz>
 <f3d502ca-228e-4be4-b296-a9073975d34b@quicinc.com>
 <a5e69a5e-b882-4f36-b023-f85da430fa2f@quicinc.com>
 <2024062849-brunt-humvee-d338@gregkh>
 <2e616e9d-fc04-4826-b784-4c6ee45bfbc2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e616e9d-fc04-4826-b784-4c6ee45bfbc2@quicinc.com>

On Mon, Jul 01, 2024 at 10:50:38AM GMT, Ekansh Gupta wrote:
> 
> 
> On 6/28/2024 7:51 PM, Greg KH wrote:
> > On Fri, Jun 28, 2024 at 04:12:10PM +0530, Ekansh Gupta wrote:
> >>
> >> On 6/28/2024 3:59 PM, Ekansh Gupta wrote:
> >>> On 6/27/2024 4:43 PM, Dmitry Baryshkov wrote:
> >>>> On Thu, Jun 27, 2024 at 11:35:18AM GMT, Ekansh Gupta wrote:
> >>>>> For user PD initialization, initmem is allocated and sent to DSP for
> >>>>> initial memory requirements like shell loading. This size is passed
> >>>>> by user space and is checked against a max size. For unsigned PD
> >>>>> offloading, more than 2MB size could be passed by user which would
> >>>>> result in PD initialization failure. Remove the user PD initmem size
> >>>>> check and allow buffer allocation for user passed size. Any additional
> >>>>> memory sent to DSP during PD init is used as the PD heap.
> >>>> Would it allow malicious userspace to allocate big enough buffers and
> >>>> reduce the amount of memory available to the system? To other DSP
> >>>> programs?
> >>> The allocation here is happening from SMMU context bank which is uniquely assigned
> >>> to processes going to DSP. As per my understanding process can allocate maximum
> >>> 4GB of memory from the context bank and the memory availability will be taken care
> >>> by kernel memory management. Please correct me if my understanding is incorrect.
> >> Just wanted to add 1 question here:
> >> User space can also directly allocate memory. Wouldn't that be a problem if any malicious userspace
> >> allocated huge memory?
> > No, because any userspace program that takes up too much memory will be
> > killed by the kernel.
> >
> > You can not have userspace tell the kernel to allocate 100Gb of memory,
> > as then the kernel is the one that just took it all up, and then
> > userspace applications will start to be killed off.
> >
> > You MUST bounds check your userspace-supplied memory requests.  Remember
> > the 4 words of kernel development:
> >
> > 	All input is evil.
> Thanks for the detailed explanation, Greg. I'll remember this going forward.
> 
> For this change, I'll increase the max size limit to 5MB which is the requirement for
> unsigned PD to run on DSP.

So we are back to the quesiton of why 5MB is considered to be enough,
see

https://lore.kernel.org/linux-arm-msm/2024061755-snare-french-de38@gregkh/

> 
> --Ekansh
> > thanks,
> >
> > greg k-h
> 

-- 
With best wishes
Dmitry

