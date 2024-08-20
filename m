Return-Path: <linux-arm-msm+bounces-29230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 372E195A42C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 19:54:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 695381C213C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 17:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCD21B2EE1;
	Wed, 21 Aug 2024 17:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiEoU7pi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BEA4206B;
	Wed, 21 Aug 2024 17:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724262866; cv=none; b=FCBqKfjihUP2jdm/B9iOD+sq/RAcyryhV15oPCJpeiCd1OvV0ukVF0ETLqRRzY80bZP3EX8+AJTP36zM0bsWJlRn3r66lAaS5aw6/zU41WaNdggJ5/IkBppUJVhlKPtBSO7HLE6FjeZtVvf+oakD/C4tEXH5s9R55eEgC8w6Ilk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724262866; c=relaxed/simple;
	bh=hH3tKIiOwCwlQI22+ypmb/c9xGCfMKcAVgLY05zWhrw=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWWE1K8ziw2eQnpGpfAqUUZhxRj54nu+KlQtICBNrhoB6Qt40HYfdLBhH+U7g7yPpSYbXT9xwVQUgUHnwQe2s+6TWoHLjulCSv0R1z3SAt6ocNqHIWbuOo8Tp/ISW9EG3DsDaIMYzzgjO8VRTdQsWG58iIaDSRfJ9jHqqc6Owcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiEoU7pi; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37186c2278bso633669f8f.1;
        Wed, 21 Aug 2024 10:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724262863; x=1724867663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5GSoPOX63tsh1GnwmAAPyj0rs+xp1YRgEBUlHY5oblM=;
        b=CiEoU7pi+voOPj1qXHSQ45ooW4GK7QGbHzwLw0sS59+BIV08LqcKDlTnq4i29D+nDM
         te52GrCdigQWnLCnyeCJ5J/1inqSw+UeOLk0cVa/VxH9l4JjFzX6WoNX6/6BintBp16z
         D5Nb4Isovlvh4LFE2jatWOOJn5/gW2VSlPa2X82Fg0YM4J1w/p46iv7pII+6L9CJHWDX
         bO/yDzS/Y1NzCsOMsskh1KqG0Gc4xjAPmXEY8pIclDTOrhRyRaU5v5AUQl+PxRhCMaR0
         bIew6UFrsoGTMfmUpjZC9sDMwUUiJWUnGN/qZsmczsMTWCbxUATPD5Dt+Bvjw/CxEARm
         oMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724262863; x=1724867663;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GSoPOX63tsh1GnwmAAPyj0rs+xp1YRgEBUlHY5oblM=;
        b=tsAQAV9rdAL4umKdnSdM4oQQZIU+CWHdhQz/KDn/lrMFEyQDX+TsjmEt58BAwgvzOT
         IWiHs/ucVbvmG/bHjK5eIKtuwGbbFTl2bO7/O0GYcA30Hpt3wGz5h4n0CUYqJ79UhWRT
         FqxYHmc8gBpMyJ7ahbbqtfLataE368GedHL2+EaTlkXPASV2IaRjItG6QYVzuSAJTbax
         bLU+Ehxgq6yMs8CPZArrePOJh/g/oA2i+fQSJNPeboBzgPoC9qUpukNPYP2k6zWve9Ca
         RMD50INylMFPXG+Ma0gjssnTxt6EGqOoWSVx0KP8alYpMUk/GROHDB1xRoCMcYkNV7zV
         YgLg==
X-Forwarded-Encrypted: i=1; AJvYcCU/kjJaDUq56LZotLm74Epd1uoIMpCKP31rALXtiZ3g+P/r1LcDqevCvqURPTGd/V3P/bttmC5TPn5IY4Bb@vger.kernel.org, AJvYcCWXZHQlBSp3JFKzdjvcZ+d79iAdtPv3ehQHsFBgV8jKaafONVkCu22sCDrlTo+BUVfTpLmbWJC5yrEmmQ0Q@vger.kernel.org, AJvYcCWyeotOPeTE+xMm/d9sfIkVUhnyMD+SYqApEgp7l+OLd0UlxSkGZCVPzGnPmERRZStSKStmpQjC@vger.kernel.org
X-Gm-Message-State: AOJu0YzUXMJHyKmbci2SWKdB3pjOkOW05y/LuoIcwDlvyih9aSjecQvU
	g8KsTpkPuhPNVB2Xo8os6qCqVZnnCDIWkrfL57rG9d4k7zCS4y8DwGE8gg==
X-Google-Smtp-Source: AGHT+IHYlM8nQOjedLQaGJON7bSeTb1YxPn4t/LnM2ns00fv2w+L6BP9/bbV5wO1DlTiOndHCmLbqA==
X-Received: by 2002:a05:6000:2c2:b0:360:70e3:ef2b with SMTP id ffacd0b85a97d-373052962fdmr275880f8f.26.1724262862456;
        Wed, 21 Aug 2024 10:54:22 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-1-209-141.retail.telecomitalia.it. [87.1.209.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718983a2d7sm16356758f8f.10.2024.08.21.10.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 10:54:21 -0700 (PDT)
Message-ID: <66c629cd.df0a0220.1532f3.0f92@mx.google.com>
X-Google-Original-Message-ID: <ZsUPlN9RARYTqmOV@Ansuel-XPS.>
Date: Tue, 20 Aug 2024 23:50:12 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Ma Ke <make24@iscas.ac.cn>, vkoul@kernel.org, kishon@kernel.org,
	agross@codeaurora.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] phy: qualcomm: Check NULL ptr on lvts_data in
 qcom_ipq806x_usb_phy_probe()
References: <20240821131042.1464529-1-make24@iscas.ac.cn>
 <4kpmkjp6pp6r34v7se24rscnk2t7g2pjcrqm6l7nt7h3lgsu3v@rauqrchifqjj>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4kpmkjp6pp6r34v7se24rscnk2t7g2pjcrqm6l7nt7h3lgsu3v@rauqrchifqjj>

On Wed, Aug 21, 2024 at 09:50:27AM -0500, Bjorn Andersson wrote:
> On Wed, Aug 21, 2024 at 09:10:42PM GMT, Ma Ke wrote:
> > of_device_get_match_data() can return NULL if of_match_device failed, and
> > the pointer 'data' was dereferenced without checking against NULL. Add
> > checking of pointer 'data' in qcom_ipq806x_usb_phy_probe().
> 
> How do you create the platform_device such that this happens?
>

I have the same question and this sounds like warning produced by
automated checks of some sort... (and these kind of patch are suspicious
given what happens in the last few years)

In practice this can never happen... of_match_device can't fail as it's
called only if a matching compatible is found hence the thing MUST be
present BEFORE probe is even called.

> 
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: ef19b117b834 ("phy: qualcomm: add qcom ipq806x dwc usb phy driver")
> > Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> > ---
> >  drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> > index 06392ed7c91b..9b9fd9c1b1f7 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
> > @@ -492,6 +492,8 @@ static int qcom_ipq806x_usb_phy_probe(struct platform_device *pdev)
> >  		return -ENOMEM;
> >  
> >  	data = of_device_get_match_data(&pdev->dev);
> > +	if (!data)
> > +		return -ENODEV;
> >  
> >  	phy_dwc3->dev = &pdev->dev;
> >  
> > -- 
> > 2.25.1
> > 
> > 

-- 
	Ansuel

