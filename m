Return-Path: <linux-arm-msm+bounces-28577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C39952853
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 05:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 822ABB22ACE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 03:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D96D2032A;
	Thu, 15 Aug 2024 03:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CP+i6tKx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF766AD5A
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 03:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723692995; cv=none; b=XzIw+iPbSWHzaZCPZ3pqKOl5+dr5GI0q1MUxBDkFVoFXsmAvJbakti2xzLSiGvwGaQPLbdavz3XxYWj5nnHUWLRKplMkrLlXfgxn4qUVdgHpM2xy0LyQT+XBVbbKLXZOa55HiiYZsvKm6q3mV+5oZCtpqmTFcvw+KhdKyxGm6jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723692995; c=relaxed/simple;
	bh=VmeDJe5IiChyVSiwtUDllH7JOe3LYaNcF1sph/vs5MA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzIdCzUyZntcolmPCBewfXIjnqri/nOJZRT4TDDrNcO6ono8AnUIFMRu7fn0qrVJQgleL12x/XMMWmSR2RfgbWUeGJg0KbyCcVeSP3uzepZdhPjeaNCYZ5+NL1S0kJ5sBEgS6Cdq5VXJr/uBwyQxVyH63xolMKd3eMeOPE6FTC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CP+i6tKx; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fc65329979so5206595ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 20:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723692993; x=1724297793; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uz/2NgVRt2KKEiEq3hw8wd1EQ71jZ2iS/El9DiUWZbk=;
        b=CP+i6tKxwkcdQl6OlqNVcLTL9uvFqY5Kaiy6OUVANBInsm+0pnSFouGoXTMkadYLuI
         qdaLTFLyw9gwnpHxqWTN4jT7ixNFHlPOx3ihdG1yL0o5Kc8VoaFm8uJ3x+Sy/x7TYM85
         ke/vaj4rhdZ7kmeR7zmo3B13u8CfsC3pnB6Ag/Ts21Na9klLVZmxNTbWPaf5QzTnWGPY
         xMSYpf/DtDqYx/2JzkerSfAALTjhkfbsQYyzRIwWk8vJaJGrPNNHAyQlmBfLoAoCS0to
         eiJ3a+LgowGT5Ug+05zswJq9OygsbSRODWCYnrFH5IZ6ZhNamMOIj2aJ9aqrd48PUzmd
         7kSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723692993; x=1724297793;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uz/2NgVRt2KKEiEq3hw8wd1EQ71jZ2iS/El9DiUWZbk=;
        b=mRsAUd3juZd8b00R+LPV6Sfyw8q2ubgj0kSuz9g/rUnh4BwSRfTHj/OEOth0kTDmEc
         +snTZ85O4wk+cwFrqm1A3X8f//KV+V/8ZZBNCYQG0uY1x1w5VI0IikPsSEshR2l7M/GF
         3B80dWVruWh/qPoGnxGaQ0QyzmDVW4C+KvQMFwRWB3WsgYwek1sR0mIVx3x2yj1mSmQz
         m7Kfso4phpSFeYgxXdre+XXn7uVksgWwpSRtmxXhr7iLYIh16xkTDKXCg2OJqbrtHnUW
         1DeIR5826+tlJVHX07auTa5jaC32H++dTY8Vm7UJNEX6yfWorecfra/eJ6l/NBtINj/2
         Joug==
X-Forwarded-Encrypted: i=1; AJvYcCWTQeZrKx3Xc8Bi5u+l1w/WPbbW5GHgG4iyo1JSKDf47ZPwz7PMV/SgUGrNMhbRI1QMnNT0Mvbgciq9aVNG0LUmhv1Js+Lxha9F6y1TgA==
X-Gm-Message-State: AOJu0Yz37U0jGR0a4eItL0Z3/ReRlEaWcKd24oAhCrMNHGs8LXyDDmBb
	9DpKtpmToHseXWCXrS/pt67/z5MA5T+No1pg2nJzGqZbxcj1nEv3ssOb2KOiLA==
X-Google-Smtp-Source: AGHT+IEMvWY/Z1OVulH8TSILC9neilL+JWYFVF+pUMJtaZh3B6tR9sxb+rJu6EZq+pGEBrQM/vvA5g==
X-Received: by 2002:a17:902:d2c9:b0:1fb:94e2:5643 with SMTP id d9443c01a7336-201d63b3fe6mr50032115ad.12.1723692993188;
        Wed, 14 Aug 2024 20:36:33 -0700 (PDT)
Received: from thinkpad ([36.255.17.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f0319755sm3371305ad.65.2024.08.14.20.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 20:36:32 -0700 (PDT)
Date: Thu, 15 Aug 2024 09:06:27 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>
Subject: Re: [PATCH 1/3] ufs: core: Rename LSDB to SDBS to reflect the UFSHCI
 4.0 spec
Message-ID: <20240815033627.GA2562@thinkpad>
References: <20240814-ufs-bug-fix-v1-0-5eb49d5f7571@linaro.org>
 <20240814-ufs-bug-fix-v1-1-5eb49d5f7571@linaro.org>
 <3e7cf9f9-abab-4249-9e7b-71f237850bdf@acm.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e7cf9f9-abab-4249-9e7b-71f237850bdf@acm.org>

On Wed, Aug 14, 2024 at 10:27:48AM -0700, Bart Van Assche wrote:
> On 8/14/24 10:15 AM, Manivannan Sadhasivam via B4 Relay wrote:
> > UFSHCI 4.0 spec names the 'Legacy Queue & Single Doorbell Support' field in
> > Controller Capabilities register as 'SDBS'. So let's use the same
> > terminology in the driver to align with the spec.
> 
> If a rename happens, we should use the name from the spec. I found the
> following in the UFSHCI 4.0 specification: "Legacy Single DoorBell Support
> (LSDBS)". So please either rename SDBS into LSDBS or drop this
> patch.
> 

Hmm. I looked into the editorial version of the 4.0 spec that I got access to
and that used SDBS. Maybe that got changed in the final version. Will change it
to LSDBS.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

