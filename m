Return-Path: <linux-arm-msm+bounces-74408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5834EB8FDA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 11:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5633E18A2049
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 09:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2247C2F0C6E;
	Mon, 22 Sep 2025 09:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kynlIepj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1204E2D9ECD
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 09:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758534822; cv=none; b=tDWW7nlOR7gkkZhEnVVmIXgE+0VrAQbSPdXFBrYz4DJuZxsXuCKXPvqsFYQqUSW6COHoIktkeGCODI+IXjZkE7wEC/G4QfkAIA/92Tx1XRbkHd0Ih1ptAaduus3q0mV//yMO1533g+ey66Omvy8dYzjzGKCfQBvlYG1Nuooz3LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758534822; c=relaxed/simple;
	bh=esO3W/fuZP482eU0DbboEi144GMIUIsmjt1D9wR9JM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EALjnn+MGh3hmkCVDcIMLPqQCuuZ/1P/S6OiwArvgkTUlC7xTseqAK+DMQmXV/ujS7tzfJjc4+FTiXnyjLh19uEkDp1kJRURVycD4Xfc+kY8sKbJxqrEN2Ux7S2tAu4gBKlbxdCJTTaKE6XGfaaefaKPiBfcFEWpeVyCQuS2cn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kynlIepj; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-62105d21297so7020940a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 02:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758534818; x=1759139618; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/IaYPEf/pbj+gCoDVQxBl8rQXBwRDj2M+SqF+hLZWJw=;
        b=kynlIepj03GkgF60hGM47GRSEdRn5oQ/gY4K+dW7K77MJhL354pXaP/pbotRL1tcvf
         Nfiw9Q0Jq4Pge5/1yXyQd2JPKotuIeJ3UAHsK5nnK18IVDD/qzjevX4m995Zy8sQATXu
         br9yV6Lu2O6Q70a6jKeI21qzdr0GQcusZfIGzQzM0r9AzLdxB0miyWFomPy2SbmoQcis
         epWnrzu+0q2+uLhTF6tH9w+d3SwACzicJevaPoZreMobstTGk0VPmZ+pO6oKVE5Je3o4
         UpckJd0cDgRZf8WN1YPppv6GiUZ5IJsYPVnrkPHP1MYfTF6ilNNDZfrd48S1qWgpwYuf
         Q6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758534818; x=1759139618;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/IaYPEf/pbj+gCoDVQxBl8rQXBwRDj2M+SqF+hLZWJw=;
        b=pt5Lsq9KtDyBg99qrJM1eXjapHufJh9bIInZpKX794ixZ7L1hKx8gMSNJGn565hxpy
         xylCTH/wwkGaY8kuw4J1w7y/JCr/PKCQuh83l+oFTLtdeN2Zje0f0niLpeqfZtBxouQ8
         U+eRBc0aAboR0r91UYYbmgWxVpmA9dXIlJcueqPXfAtq/gcIcAAikmWAt802rzomuQgS
         tQwyMk+oSsoKIIhLivHADMqarE+hJvnxzotdrkrQVn6+XpJMb3/LHpy/HgLfggond7cK
         +K8lVEtVPUHFcSQOlEVj1jE7lcEUwLhoJiIZLZK4J9WPwCS7pDtsfmVUov1MRYwmnUe1
         wYLg==
X-Forwarded-Encrypted: i=1; AJvYcCWeC5t+hUSW6Mfw6yjjnhs4hz9v3cBtaWSJrIP1seuEL9Tn0teuqOJCBdexJMdvkUfyc74qV/MMhVnBpY6o@vger.kernel.org
X-Gm-Message-State: AOJu0Yx890IJnNXBXaKmK3a1Q9a8V+VvtliZxwDVdOqA3K6v66eU1tuU
	biPz0yzLtdOiIin5pA4jpwwy2re0xWyMzkPBI9xnz88u0ih2moG5Vr+YuNsoZ0/Jc2w=
X-Gm-Gg: ASbGnctoO4hFWpnv+EfhHwGyK8QG7OVOjPTGuUw0CB1ZhLFPAH0K3ZfOFzfOVLKl2jU
	W1GYfPH81novy0Co4tImHOcGDoLOWv7HNUTERleBbTmwgf8STSQYyI7zDx4vMsvHNFva51vwPRY
	1s4ti3WYX6x6KcabJlh3OHMGuthlm14/0LaiYg4q8itmx+7FR/sX9o1mgRtY9nwLE8uE/6LNOWu
	cvR7uaDOv017E+MvEGM/CzIlfvVsTNJK0IDsTWW0gq3aU7SJib6lgJQnW+2oBPU0Y+AU0v3LozQ
	mpSnbbN7k8MDd1O+6JF2U8xisskqcFwdAcdf7UaodtxsXMKqTnIbNHmyKryTl3pnZ2k59E71cL2
	jkgEXSYgzl/tzzHT22tQzkaJ+PFWA+HL1
X-Google-Smtp-Source: AGHT+IHiKebblXW/kEcmJLdU3y168juWw+BO/YJP4zZFl9ZrT9ZMCyQFGQs+TKWjudRMYXZg0Yy7Eg==
X-Received: by 2002:a05:6402:1d50:b0:630:716d:88c3 with SMTP id 4fb4d7f45d1cf-630716d8abemr6560526a12.11.1758534818269;
        Mon, 22 Sep 2025 02:53:38 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:26e5:87fa:fb57:1680])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5d1a89esm8525144a12.16.2025.09.22.02.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:53:37 -0700 (PDT)
Date: Mon, 22 Sep 2025 11:53:34 +0200
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
Message-ID: <aNEcngb2T62HYlMq@linaro.org>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <aNEEglLZTJuR1sLi@linaro.org>
 <20250922094732.6tupym6ulroctm5m@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250922094732.6tupym6ulroctm5m@hu-mojha-hyd.qualcomm.com>

On Mon, Sep 22, 2025 at 03:17:32PM +0530, Mukesh Ojha wrote:
> On Mon, Sep 22, 2025 at 10:10:42AM +0200, Stephan Gerhold wrote:
> > On Sun, Sep 21, 2025 at 01:10:58AM +0530, Mukesh Ojha wrote:
> > > A few months ago, we discussed the challenges at Linaro Connect 2025 [1] 
> > > related to Secure PAS remoteproc enablement when Linux is running at EL2.
> > > 
> > > [1] https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
> > > 
> > > Below, is the summary of the discussion.
> > > 
> > > Qualcomm is working to enable remote processors on the SA8775p SoC with
> > > a Linux host running at EL2. In doing so, it has encountered several
> > > challenges related to how the remoteproc framework is handled when Linux
> > > runs at EL1.
> > > 
> > > One of the main challenges arises from differences in how IOMMU
> > > translation is currently managed on SoCs running the Qualcomm EL2
> > > hypervisor (QHEE), where IOMMU translation for any device is entirely
> > > owned by the hypervisor. Additionally, the firmware for remote
> > > processors does not contain a resource table, which would typically
> > > include the necessary IOMMU configuration settings.
> > > 
> > > Qualcomm SoCs running with QHEE (EL2) have been utilizing the Peripheral
> > > Authentication Service (PAS) from TrustZone (TZ) firmware to securely
> > > authenticate and reset remote processors via a single SMC call,
> > > _auth_and_reset_. This call is first trapped by QHEE, which then invokes
> > > TZ for authentication. Once authentication is complete, the call returns
> > > to QHEE, which sets up the IOMMU translation scheme for the remote
> > > processors and subsequently brings them out of reset. The design of the
> > > Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
> > > is not permitted to configure IOMMU translation for remote processors,
> > > and only a single-stage translation is configured.
> > > 
> > > To make the remote processor bring-up (PAS) sequence
> > > hypervisor-independent, the auth_and_reset SMC call is now handled
> > > entirely by TZ. However, the issue of IOMMU configuration remains
> > > unresolved, for example a scenario, when KVM host at EL2 has no
> > > knowledge of the remote processors’ IOMMU settings.  This is being
> > > addressed by overlaying the IOMMU properties when the SoC runs a Linux
> > > host at EL2. SMC call is being provided from the TrustZone firmware to
> > > retrieve the resource table for a given subsystem.
> > > 
> > > There are also remote processors such as those for video, camera, and
> > > graphics that do not use the remoteproc framework to manage their
> > > lifecycle. Instead, they rely on the Qualcomm PAS service to
> > > authenticate their firmware. These processors also need to be brought
> > > out of reset when Linux is running at EL2. The client drivers for these
> > > processors use the MDT loader function to load and authenticate
> > > firmware. Similar to the Qualcomm remoteproc PAS driver, they also need
> > > to retrieve the resource table, create a shared memory bridge
> > > (shmbridge), and map the resources before bringing the processors out of
> > > reset.
> > > 
> > > This series has dependency on below series for creating SHMbridge over
> > > carveout memory. It seems to be merged on linux-next and pushed for 6.18.
> > > 
> > > https://lore.kernel.org/lkml/20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com/
> > > 
> > > It is based on next-20250919 where above series is already merged
> > > and tested on SA8775p which is now called Lemans IOT platform and
> > > does not addresses DMA problem discussed at [1] which is future
> > > scope of the series.
> > > 
> > 
> > When testing your series on Lemans, what happens with the additional
> > SIDs from the peripherals assigned to the remoteproc ("DMA masters" in
> > your talk)? Are these running in bypass because the previous firmware
> > component (Gunyah?) had allocated SMMU SMRs for these?
> 
> There is no DMA usecase present for Lemans but can exist for other SoC.
> 
> > 
> > It would be worth mentioning this in the cover letter (and perhaps as
> > part of the EL2 overlay patch as well), since it is unclear otherwise
> > why your series does not result in crashes the first time a remoteproc
> > tries to use one of these DMA-capable peripherals.
> 
> As I said above, It is not present for Lemans;
> 

Ok, thanks for clarifying. In other words: The IOMMU SIDs you have
specified in the overlay so far are sufficient for the current firmware
use cases to run successfully on Lemans?

> To handle the DMA use case in generic way, we might require extention
> change in remoteproc or generic iommu framework to handles these
> scenario like its SID and memory resources should be communicated
> through firmware resource table or device tree or some way.
> 
> And same scenario when resource table section not present in firmware
> binary ? like most of the Qualcomm platforms, how these cases would be
> handled and I believe this is similar to the problem video is facing for
> non-pixel case.

It is sort of similar, except in this case Linux doesn't really do
anything itself with the mappings. In the video case, Linux dynamically
maps buffers (or similar) into those address spaces, while in the
remoteproc case those are fixed(?) for a specific firmware binary. At
least if I understood the explanations in your talk correctly.

Anyway, if you don't have these use cases for Lemans this can be
discussed later in the context of a specific example. I thought you have
this requirement for all platforms.

Thanks,
Stephan

