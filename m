Return-Path: <linux-arm-msm+bounces-74397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 807F4B8F6B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 10:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60BC218992C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 08:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E582FD1C3;
	Mon, 22 Sep 2025 08:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HebjR3Og"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D80264FB5
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 08:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758528652; cv=none; b=q2FHrvSrstZqBZAra8ty2773Yz85cGBD5CRjIxMm8hWJkJQg6TBh4gtiO7LanS6avlxPEKZmPXbzCh9xK6pi+hEAG4+GtJtDX+DzYZJo17vdDBPophSYmc7Z8inh+bEjq1p0K/btZdwguQVC65i2SUqqQCWO9ICbruqSXxYQalk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758528652; c=relaxed/simple;
	bh=s7UO2fKhfUCI4YhH5MtiSmIjIIKO8XsVSeOX4a7lczA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvGqoIBlvZk+lbR11h2w+fQyYGWdBchS0qrKCSAsRt9MaCGWDaBrkdZVE/V/JY11ayZpp0Aj+cglnKUexC9B/IoJxs7iaph5CVn2V8a7Erp8kFMkmov7iNdBkvDIDLzkbayhJxF9khqe5GjEyy7gCA3fiN1k9MAkRSNLi28u370=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HebjR3Og; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-45dcff2f313so23609795e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 01:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758528649; x=1759133449; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q6oR8Fo0jD+wRtkqL3niLJ+D52o9GcW+sR1rF3CUjoI=;
        b=HebjR3OgoR37YQlUjIACWF6/9uWGr2CTLWFY4PwC8whzo8fJWI9dAdpPCEEIWblKpB
         FK5JwUY40AdAai5FFHCjf+QcJ6SzxvUVprelnLWEIKiOzkaDkHNuC6tsUV0ckBnHVoNF
         jQ8OeLILc2MPRipVjjVw0qCWHXBG9kaRqUVA4HWyFSn2kHTKEtwmLVTJwTgFxJkwVUVi
         G2nVX5z/kJnpZPaNdl2CHUpe/pvNSlGZCqITTcoalLbUht8Z/JvD5T7zqAm5sS1d7zut
         iWm5X6vmrP/RbsY8qr9CNVco7lzT+rt5tl6aTRYYgibD/XBaJ3+ZsUQI9V+6EIxsPfQx
         I3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758528649; x=1759133449;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q6oR8Fo0jD+wRtkqL3niLJ+D52o9GcW+sR1rF3CUjoI=;
        b=JlDKnUv5DChbOYc57CNpidziqOfQW8g1L+fpEqGZRLVCMzoOa7+xdMVtmYVn/Lr0pb
         bzWSI1FsWFrY96umbfXtOJRZjMWinr6VXZtbnBL3PbKe85bAk3PlODT3svZOVU7FKAvO
         7gBBwn/vwHtyLl6eja9HrGe9qR6O7x55SHUEQb0ySUgar5AoWXWBgz7lXN0UCZV3ZEqI
         0Ti2V3lal0wYJgojwCHT4NGFIZepi63YAOf+OXD4hCaxfFAJSNNo+ailAUD3HNWy0vVm
         s+xlNM2kGte4+GnAFKFG4SBujv19HVhKz0jvh05yBVsbdA26A2mQpUgKZ6pk67SG3roD
         h6kA==
X-Forwarded-Encrypted: i=1; AJvYcCWsbCtiNE+T844JczK4UIxrKvhz5+bEDY9jYf9oFrpFWb5hBw8gbBEbemGzqjgUUUUPR5FdDqZtNexSy0mz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7rKqn/q/DBhpJ32eOn+L8EyL4MekGaPBGDJHIU69PO7onKfSx
	JzZUnqSNoWKrdVM6zM2p/Q4hgproduPeur4vah5cURhNdLWtsGbfJm4sp898rS3movo=
X-Gm-Gg: ASbGncu96ozg0i7VwDzrMBy5IbROj3ozsOta2CxawfbAHNrnjR+NOXdZDupY+3exDTS
	TGjNZ5VmAjD6gT7chyLYHWr/TEz14ndmVK1B3RHwAF0VCtO2tj4GDHFNxMSkvl/wpUojy/Wn7pj
	lnzUS58qh2A0gwyQ+aRjNlOyLqKqS0x1E0+4LT88mfzfMSXwVprZvkeBi+09FJE5vscD89b1RrC
	Tigm02C2VtB28MZ6UHFALRimyYFHDVzx7QOwqHeotQlUC4krqP1R0xOoj2UA70mJcFOvJvAraKt
	ZX5bKNaUrR3c59UFlHEHqk7qCES1+kbKmBOZsmdNAWd4g6s4igl0i/T/tBIGXkaKMMnMBEw3XyQ
	S6qpong6GAiLPtu16TPq/A5iMIX6LHqUn
X-Google-Smtp-Source: AGHT+IGdrKT0myFfqU5UTIGGqRLFLmRn7oXJe/NQIiIiBcxhj9xZ+01ud7wQJESCIUyS8bhQf9QZTg==
X-Received: by 2002:a05:600c:3b20:b0:45b:9912:9f30 with SMTP id 5b1f17b1804b1-467ead6730bmr93561975e9.6.1758528648740;
        Mon, 22 Sep 2025 01:10:48 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:c61f:42e4:1d2c:1992])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3f88de2ced0sm7345719f8f.33.2025.09.22.01.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 01:10:48 -0700 (PDT)
Date: Mon, 22 Sep 2025 10:10:42 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 00/12] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <aNEEglLZTJuR1sLi@linaro.org>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>

On Sun, Sep 21, 2025 at 01:10:58AM +0530, Mukesh Ojha wrote:
> A few months ago, we discussed the challenges at Linaro Connect 2025 [1] 
> related to Secure PAS remoteproc enablement when Linux is running at EL2.
> 
> [1] https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
> 
> Below, is the summary of the discussion.
> 
> Qualcomm is working to enable remote processors on the SA8775p SoC with
> a Linux host running at EL2. In doing so, it has encountered several
> challenges related to how the remoteproc framework is handled when Linux
> runs at EL1.
> 
> One of the main challenges arises from differences in how IOMMU
> translation is currently managed on SoCs running the Qualcomm EL2
> hypervisor (QHEE), where IOMMU translation for any device is entirely
> owned by the hypervisor. Additionally, the firmware for remote
> processors does not contain a resource table, which would typically
> include the necessary IOMMU configuration settings.
> 
> Qualcomm SoCs running with QHEE (EL2) have been utilizing the Peripheral
> Authentication Service (PAS) from TrustZone (TZ) firmware to securely
> authenticate and reset remote processors via a single SMC call,
> _auth_and_reset_. This call is first trapped by QHEE, which then invokes
> TZ for authentication. Once authentication is complete, the call returns
> to QHEE, which sets up the IOMMU translation scheme for the remote
> processors and subsequently brings them out of reset. The design of the
> Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
> is not permitted to configure IOMMU translation for remote processors,
> and only a single-stage translation is configured.
> 
> To make the remote processor bring-up (PAS) sequence
> hypervisor-independent, the auth_and_reset SMC call is now handled
> entirely by TZ. However, the issue of IOMMU configuration remains
> unresolved, for example a scenario, when KVM host at EL2 has no
> knowledge of the remote processors’ IOMMU settings.  This is being
> addressed by overlaying the IOMMU properties when the SoC runs a Linux
> host at EL2. SMC call is being provided from the TrustZone firmware to
> retrieve the resource table for a given subsystem.
> 
> There are also remote processors such as those for video, camera, and
> graphics that do not use the remoteproc framework to manage their
> lifecycle. Instead, they rely on the Qualcomm PAS service to
> authenticate their firmware. These processors also need to be brought
> out of reset when Linux is running at EL2. The client drivers for these
> processors use the MDT loader function to load and authenticate
> firmware. Similar to the Qualcomm remoteproc PAS driver, they also need
> to retrieve the resource table, create a shared memory bridge
> (shmbridge), and map the resources before bringing the processors out of
> reset.
> 
> This series has dependency on below series for creating SHMbridge over
> carveout memory. It seems to be merged on linux-next and pushed for 6.18.
> 
> https://lore.kernel.org/lkml/20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com/
> 
> It is based on next-20250919 where above series is already merged
> and tested on SA8775p which is now called Lemans IOT platform and
> does not addresses DMA problem discussed at [1] which is future
> scope of the series.
> 

When testing your series on Lemans, what happens with the additional
SIDs from the peripherals assigned to the remoteproc ("DMA masters" in
your talk)? Are these running in bypass because the previous firmware
component (Gunyah?) had allocated SMMU SMRs for these?

It would be worth mentioning this in the cover letter (and perhaps as
part of the EL2 overlay patch as well), since it is unclear otherwise
why your series does not result in crashes the first time a remoteproc
tries to use one of these DMA-capable peripherals.

Thanks,
Stephan

