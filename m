Return-Path: <linux-arm-msm+bounces-47786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 862E4A32C99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 17:57:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1703B168B75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 16:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907CC253B4E;
	Wed, 12 Feb 2025 16:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KirEBxzG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDEA1F0E44;
	Wed, 12 Feb 2025 16:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739379375; cv=none; b=oBA8dy7o6Hnd4QQkqScj4g1aPm7LlqZnzS8b0gqBswAA4sTAR7kBtj/7+fBgkgIzRkdXGDpW92PDBus4XcNhejKFva3FJLU4q56PD7zynlDXDiOHnJWTiSHW/Cf2YqYreQ5EtyNbmSxVxdqo31+2ZveWhfYoJbS8QCp2UzRFbWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739379375; c=relaxed/simple;
	bh=FWCZ1JPAUvy0QAltvWa7BCQdwDaOlKC3UpWaFsRIJMg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P33dnJ7l08oldSyVa4wnDlhrvnkUpbiGh/XL3zXGva2IV3/3vJad3sKOApsXQzaCJ9M01szCwZPOL9kHVtbLQNgktqr8Ar4s/W4NCAgtvfxJjdpjTatBWGrrH4qLeC+U6rY1A8JwvLeCb+Wbwijj2RmFsoUEtxyNIr3O5QWmgqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KirEBxzG; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f44353649aso11152a91.0;
        Wed, 12 Feb 2025 08:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739379373; x=1739984173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/YZ98QVY0hlmkitWAxaHzA85Cvt4+Gir/h9BCOLPtk=;
        b=KirEBxzGtw4+k/qS7fYhicVPoI+UIOH3tO0t7I/UAEaT88zzUfzIUu4mlXMisj3rrM
         q5RxQBI3il/Okj7Kf2oQNnCWrWoSrmvYWKdULc0PR6/YuBCiHAZ0LnOzPvw1+VZ2bsAm
         D+SljfBq7YPp8gzXsNtaNsqUEtPwbYnavCSxhVAnO2ot4JlcW/NyOiu3e2jOx6hJrs5Q
         RMvB4N44YTHsuohT2eFYQLzcodAIFC1ugjeqaMSysxR524olDTiuXQmcKc/icx3zO8q9
         z2yGrJV+gEzO3/1OGoHEboNuA7K+hYFIRXAsHnV+AFwH6vK/skzIkaQdE3hSNdXeuiRM
         gFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739379373; x=1739984173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/YZ98QVY0hlmkitWAxaHzA85Cvt4+Gir/h9BCOLPtk=;
        b=GNVZqxSzVV3j/mVKS5x/OHmJT7TrTCKbjRa76+omkgqEbpZ8547uzgJXk5BRCtJzDW
         Yel6JpRGrKe1klWXxo+s2NO1GiqzAiszdZTqc4JeT+kZPpvuSspteTAhzcA2aucn5YUm
         jCYLrAxo5sI5MHRv5wNc3CbN20BOQ0SzhmulWPuzyAO63yunlabkmr51VGpbM0hFmFp2
         EZ3Ukl9k1hNgNhujZQYnnzKd/IyG5tuOZl0oklnMSkjjdLizl1KDBSiCVxeC/jtGe90F
         T3iu61JSQAF2QSG4WfDSYeHbuoJ4akuBOkcEwv5N/2R4ykQq+Vlywtq53lbJDjwJJDCM
         fZUA==
X-Forwarded-Encrypted: i=1; AJvYcCUe0xTvmHnyIk3CKFTADfqIohLn+taG0ygWXroNSDptOQ8KZiqk8qc8GmU3ctZUvHbXJN8T9ofR9yQnrVZq@vger.kernel.org, AJvYcCVzJf9JfzZmgKwDTXiLBHnnZZ3KiPnPNDa/qzYApT1PSe/HUBw+AgHRyoLqpOA4CnrjTQogDeUzKHHH@vger.kernel.org
X-Gm-Message-State: AOJu0YxVbkPnrcbzTGLKRWDNMdN16EuS6UCNgFy8+fsmypXILN4OGsn5
	kxC9KFAhlt5+dyDChemcGiMPNrYcu5BBVJ3CFRM6ndhM0tIeQa+R
X-Gm-Gg: ASbGncvHMBjlc0ZGu3BZcBLuP6bKfRrfu/gzvpo4fEUt7zDIHhJAPy4OYCGJaHz2R44
	0dNZzZVbsxHGT277itQyh8lDvr9aPnlKLiJBMTfOlaD5P6qSU/TZdLYS/1BwikCh/o6bhqIOAcN
	NLaR7E20qC59gFb5x05semaKYmtqTYAPY5PGQf08IZNxR3IXnyrJabjrKnprsREwKpL1hdbB56f
	2esXB9H+NgoVDbM7yAbdoAB/x9K5AXBKSVZEsRC1GG+NJ85qSkVNYc77mL03Vs/tq9FwSIov99U
	AWG4QLL4rYXK+yxxktuGFZCZsoP97AVaqkABXPR3bg==
X-Google-Smtp-Source: AGHT+IFWjUg6Fq+J8/whiRrLq4t/CKYPDxPB+hALsINmqV1z/5bZWA0vGFCVE7tQZk8zipwXETHxrw==
X-Received: by 2002:a17:90b:258e:b0:2f8:34df:5652 with SMTP id 98e67ed59e1d1-2fbf9072b46mr4583696a91.21.1739379372724;
        Wed, 12 Feb 2025 08:56:12 -0800 (PST)
Received: from jamesmacinnes-VirtualBox ([66.119.214.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98f48eesm1727554a91.22.2025.02.12.08.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 08:56:12 -0800 (PST)
Date: Wed, 12 Feb 2025 08:56:09 -0800
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 quic_wcheng@quicinc.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [PATCH 2/3] regulator: qcom_usb_vbus: Add support for PMI8998
 VBUS
Message-ID: <20250212085609.06e0f949@jamesmacinnes-VirtualBox>
In-Reply-To: <fcf907a5-9fb7-4988-a30a-a555740ca817@linaro.org>
References: <20250212010744.2554574-1-james.a.macinnes@gmail.com>
	<20250212010744.2554574-3-james.a.macinnes@gmail.com>
	<fcf907a5-9fb7-4988-a30a-a555740ca817@linaro.org>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 12 Feb 2025 15:29:54 +0000
Caleb Connolly <caleb.connolly@linaro.org> wrote:


Hi Caleb,

> Hi James,
> 
> On 2/12/25 01:07, James A. MacInnes wrote:
> > This patch extends the Qualcomm USB VBUS regulator driver to support
> > PMI8998 PMIC alongside the existing support for PM8150B.  
> 
> Thanks for the patch!

Happy to try and contribute. I know that the working Type-C port is
going to be a misery after the relative simplicity of pushing the VBUS
upstream.
> > 
> > Key changes:
> > - Added current limit tables specific to PMI8998.  
> 
> I also played around with vbus on PMI8998 before for type-c support 
> (unfortunately didn't make it's way to the lists yet...) and I needed 
> some additional changes for this to work correctly. I found that it
> was possible for the overcurrent protection to be hit if the type-c
> port manager allowed the peripheral to pull current too early, and
> it's necessary to allow 2.5ms enable time.
> 
> PM8150b doesn't have these limitations (and supports the instant
> power role switch feature that's part of the type-c PD spec, allowing
> the power role to be switched without either side losing power e.g.
> when you unplug the power supply from a dock), hence it's only
> necessary for PMI8998.
> 
> I would suggest implementing a proper .is_enabled op to poll the
> status register for OTG_STATE_ENABLED and configuring 
> qcom_usb_vbus_rdesc.enable_time = 250000;
> 
> Kind regards,
> 

Technical question for you in regards to the VBUS overcurrent and
timing for the PMI8998. I would like to try and reproduce what you have
seen as my system hasn't had switching issues, but then again the TCPM
system may be covering the exact bug you are mentioning. I also
searched for some definite bit in the 4.9 Android driver and was left
wanting. As of yet, I have not had issues with the overcurrent
protecction.

I will be all too happy to migrate to the PM8150B and its associated
SoCs and leave the 845 platform to history.

Thank you for your feedback and I look forward to narrowing down this
issue.

Best wishes,

