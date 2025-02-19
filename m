Return-Path: <linux-arm-msm+bounces-48521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FD4A3C1E1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 15:20:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E86281755E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 14:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB1D1EFF85;
	Wed, 19 Feb 2025 14:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xq+AeVod"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1552D1EFFA5
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 14:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739974477; cv=none; b=kQDrS9UNvtGpOP0Su3BoYCYYmsv7WcOAijGqpHGaxqyd5O0POdkwhWop3ViZcpdFsFmmSn1LwCg027QJZIw9JGnFIGUKowJ1QHWmwZCi5/413qPx4XTxxfAs+A76aPxhqu1PDriLZdYuj6Sn6Nra/XHWXGncm8h1/2rn+SHPBY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739974477; c=relaxed/simple;
	bh=XL/FuYGImCvBKeDZ5q7HHmrFeYjloKD4TxJcQv2X7dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7fbl7QK1sr3gDjVvHY4R/pjsV/ll0lStXIMSTrYbzbifZy4XIzyQhGM3lD70JNKp6hW4VYEI/U7GrXtQ5mxu+2GA7z6MUBbNaezlibOT7+uQk2MRHgGkz7BRbw2+dq3zgi2qqU5YrO7WJCTipmVEI2nnSNz6z5PMn0RJS4804I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xq+AeVod; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2211acda7f6so81789675ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 06:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739974475; x=1740579275; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k2HtorTRfJCn5gYcOpWXXoqPoc/mFZAbh86mTY6fdYA=;
        b=xq+AeVodkDfqETC9Aotc8cT7ekjktpBVL8857scDXYMFgszvpBf1UWSmk+/urmhSZo
         EhD9xRSfW6YbSkTynaVjFC6yDGFl/RhJCXahLCIy6GWPHXJ43z8D550lcQ5rBDJBKsa2
         dlLkAlfw1dCDne+FnmFjb86SMFb3Y2E75K8ugu8b7ObxWGgiZfeGBBtsXLkBLt6SG5DQ
         LcZFifNj0ocPquO+GzARodHjjekm25w3Ow9OfnkWVKkfarDUJNNnx+UjXov5OJpZEZPl
         nAcoH3lycgN9riK2zuqiQJyOHIjSKZuz6OoyIwsoTPh83KfnigOrLIT4d9bAqweePXCL
         JSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739974475; x=1740579275;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k2HtorTRfJCn5gYcOpWXXoqPoc/mFZAbh86mTY6fdYA=;
        b=NvPkU6YSIFBIMwmH/EdqE3P4bR2AVMw1hDeoEQqA7RCR/bJ7qUlUNBHp22SXmUg8Dk
         qxIzJC4sV7Fg9pALro6lt6v0RDTCeQmdRdkrx6gR0AsYDPDTPgPIPvgFa3zQlTD6uegQ
         aTwobMXIOq1Kbn8sDRzzVLSlJEARZlZK9+F188SNRRcgHDSsD807VvZPpqZhm8D3T+Pa
         AEeOumrezT8h91e4vjVr4mnOH9Dbaw+BSQyBCTnXir21HIZlLxGCe77a+SgNopOXbLu0
         4yP6ZJbpwwWH1eSNRc2XCipEo5K94th1DZj8WJObv2kdmRCbRylbz5TSaX9csoYB+NH7
         wHgg==
X-Forwarded-Encrypted: i=1; AJvYcCWUKeL9003h8kqrBcCTYF3gwsHymJQ4K+qE0uzbE7BHspbvx6iH2ldaMrvCn+ZRbronaQ/i6mwFoYrmOnQl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1LbD4mhHsxIC79V0W0X5sO9pSsTnnaDpwUuT57ki5ygTA+nz5
	GqRIsaJUGjScbbEkoitxed//r3VMineXoWuyf1Dho2kk8NDtRKywBj2aJLunRQ==
X-Gm-Gg: ASbGncuVn8OZTU2qNBUF8UZtNYc9FrlSi2AXmHw+1eXi1Yey/7p+x5CpuOt8uhvSe1e
	o77gbLzaopd90fEzRzuwlWOgNJwpzWsbEImctgZ5PqFlh66cREqq2POeNj/b62+DrDl/yZ0KI7E
	IKyjFQL6mrbseCv49xQ1joQVHHDaqFWOpAKDi7dSxUcrV+ta/sbdnr2mApqYqrBwwWuF+UQ/dTW
	tBTofOv2qv9nrq/CGOvXx9ZnMpRkPibLkRfyzY6lkdg+vymfnw1fQ4dG3OMeNRUazkUe64+nqVL
	C7Fe8tOuwxC1pkEKjLsP7RNY+w==
X-Google-Smtp-Source: AGHT+IEeDEo2ltT751dR/sJKjSakroaM7te99A5gVKkjsKbIG+a1YUgHPEJvPjfTlYxMDg3qEDsA9g==
X-Received: by 2002:a17:902:dac2:b0:220:ec62:7dc8 with SMTP id d9443c01a7336-2217065a24emr52285695ad.2.1739974473812;
        Wed, 19 Feb 2025 06:14:33 -0800 (PST)
Received: from thinkpad ([120.60.141.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5349024sm106270075ad.8.2025.02.19.06.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 06:14:33 -0800 (PST)
Date: Wed, 19 Feb 2025 19:44:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: mhi@lists.linux.dev, Loic Poulain <loic.poulain@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] bus: mhi: host: pci_generic: Use
 pci_try_reset_function() to avoid deadlock
Message-ID: <20250219141428.oiqgf5b2rg3aukvw@thinkpad>
References: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org>
 <20250108-mhi_recovery_fix-v1-1-a0a00a17da46@linaro.org>
 <Z5EKrbXMTK9WBsbq@hovoldconsulting.com>
 <20250219131324.ohfrkuj32fifkmkt@thinkpad>
 <Z7XiKBD63EE7ZzNr@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7XiKBD63EE7ZzNr@hovoldconsulting.com>

On Wed, Feb 19, 2025 at 02:52:40PM +0100, Johan Hovold wrote:
> On Wed, Feb 19, 2025 at 06:43:24PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Jan 22, 2025 at 04:11:41PM +0100, Johan Hovold wrote:
> 
> > > I can confirm that this patch (alone) fixes the deadlock on shutdown
> > > and suspend as expected, but it does leave the system state that blocks
> > > further suspend (this is with patches that tear down the PCI link).
> 
> > > > Cc: stable@vger.kernel.org # 5.12
> > > > Reported-by: Johan Hovold <johan@kernel.org>
> > > > Closes: https://lore.kernel.org/mhi/Z1me8iaK7cwgjL92@hovoldconsulting.com
> 
> > > > Fixes: 7389337f0a78 ("mhi: pci_generic: Add suspend/resume/recovery procedure")
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> > Makes sense. Added the errno to the log and applied to patch to mhi/next with
> > your tags. Thanks a lot!
> 
> Since this fixes a severe issue that hangs the machine on suspend and
> shutdown, please try to get this fixed already in 6.14-rc.
> 

I usually send fixes PR for bugs introduced in the current cycle. But yeah,
since this is a blocker, I will push it to current rcS.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

