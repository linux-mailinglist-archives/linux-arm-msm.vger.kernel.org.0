Return-Path: <linux-arm-msm+bounces-76500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54028BC6804
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 21:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09541400EA1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 19:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6E123D7E9;
	Wed,  8 Oct 2025 19:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DAl3M+Wv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B45623BD1F
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 19:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759953083; cv=none; b=seMXQwLz2NNCqX8pQI6KzLRMgpkVUx3qagsRvUTWgK/OOMAYlTVSzz/sspvSiYl6xjqaCbmgjospdLvxnY1ikHLeF6sYIG/b4aSQNPIdMuVfkmIWWxxB5wp1WC0iJIY7Je9GYsjbUcsk4DYOAnH/yeTDpG4I4ie6gFHVrbrUidw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759953083; c=relaxed/simple;
	bh=EwqYI5I8zXLhnpiO5kcnc1i+3CNDLApU4a+BS1QMITM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COYWbE+zQU74jM2EnkEBrhQ02kcQ1DXw2dh8lNJWfPEkjf6onBfiBaZxeXJ6Rc4/40ZbtUnSWUOLtpNuXfElC1+5soYWd5fWl3Y4UAkPgDq2eD1IesMH4wpEfeKW6d9UpGbFE36x1U0lG4+TaDsFOuu2tjN5V1gARlYo3yLh5K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DAl3M+Wv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5GCt002391
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 19:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GbQD2xoyny656Xp8A+uK/BNw
	LmiPop5rGNXGtX1WIt8=; b=DAl3M+Wv9sybFMG/fXKte7jvMLe0vRDP3hJS3rcX
	OGBQ4HO0B71DBRYs8Hx5768uJkjvsLZYSVuIRGodfpGM/ZRNU5XhghZ1CUyo1PIC
	166UHoX0b5pypW/OeUGqwlV4yryjSdznsqcIyBDVjnkhnipZQaui/GkDBOTaoYd2
	OI+Kyzs+mOsE3DIKE72l4AxGUGQQWNVRp8ahuHlmbP0cdog2DAcAd8PDkRJXzlFi
	2JA0kHfwuX8V0qItQxScAFp902cMEdsYHUtvPfQmewZ4lgGdizdD7SfELVngF1TT
	yyzckLnOR8Abj32pa7+y+/v/PlBs7nfS6gP7gn8t6p37cw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4m0em8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 19:51:21 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-81d800259e3so6209146d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 12:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759953080; x=1760557880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbQD2xoyny656Xp8A+uK/BNwLmiPop5rGNXGtX1WIt8=;
        b=iZF7tBVz8DpIqgvTymk/kjjAnOQ8Uwd33iZc5JklI8nlqk9pSa479cb8Ho7UFY7pyv
         0CjkcjYZgXfvAfUjLnQ92C1xUGyCjWqBhRCfXJofDOz2YYbjWQv7mEX/xJJw5diATZLT
         LlArf77p87W+lHiRSpck1tITGebv3SF5K6X70wZiPoRkCCpRjxPQif2hrBpz4LlwSh7N
         ZZqglK9vuKflJxE98ZnSlJDAUwoZ5ZwRBguib/2t0LXE2yg7JfOcuO5wU57MG52tdo+/
         lLSj3JPQ0dAeg/ZjzUWzexTbh52hITzCDrtR//GXuNxYEG29f3FyNEkuLlhyKtHBHaCq
         /p1g==
X-Forwarded-Encrypted: i=1; AJvYcCUlhJCSalGvwNCBahcvYcSsjGPmMWIzoiO5sN+lc445RT50q3dYri0ef90cB4U6PTP7guOmR4Zn+IDueFJV@vger.kernel.org
X-Gm-Message-State: AOJu0YynK08tID2YNdRI/DW26fRJfNpCfjkMiQ+VHT+aQl9ISuXHQncV
	4Nok1CUsocCWJpGiFz4KSkNa8tym3xb9h6wCGCf3OOfaQfYwKdLNTJ6UQGvzMyv66yCn9WjdL0T
	UXgSncqhn3enMw8HU3brNnW+yxsRBoy4zmgqSYOVwm8yKq+bRZgK1v1OWBE1WiIPIAXIk
X-Gm-Gg: ASbGncsHauMN79cGh9BRKUp2IIwkE8AbSUYL1RWvy36cFax5NGZzvrfRZLmgYfX+tHm
	2Pc7kVGhoya4uCb/fgWA+V/ZmTkbLQBLfiCajzpDMo1WjWu5gvKRdy/xhu6LDXVmS9Fxgy0CEyF
	XkbPnY7F/lLyrKf6RUrHBDO9UJ3A0L5gHvet9PrejWvOwqNOeu1WdQuqoGo/Mm/IVI5uKMhzMJ1
	AqmLbcUTfhJS/OIAogi9qo63I9fjufCCSTcfmOD+whSMfhKqC1jKTa7thqL0fDch2D4356UruNC
	Zug/koclIV1uOeY/s03QZq23LoZ5gaPiNZ7/DyyzlKuxKKKK33zIrIw7Z1Sno+vLoGqjbBQqeZ0
	MYc9RaCLBR509noDkMskk3BFkj3RbuobH8ho4X55MkamOYDykdwA5KZz+yw==
X-Received: by 2002:a05:622a:1190:b0:4da:256c:3d42 with SMTP id d75a77b69052e-4e6ead66d3bmr74774881cf.59.1759953080056;
        Wed, 08 Oct 2025 12:51:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpHn/H4dhV4XbQHYMbUSjn4irkOysXPJz8YXz9MbAxepygkEk7N9h9yieHpzim7GqYVkeTaA==
X-Received: by 2002:a05:622a:1190:b0:4da:256c:3d42 with SMTP id d75a77b69052e-4e6ead66d3bmr74774511cf.59.1759953079206;
        Wed, 08 Oct 2025 12:51:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5907ac2349fsm296878e87.56.2025.10.08.12.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 12:51:18 -0700 (PDT)
Date: Wed, 8 Oct 2025 22:51:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Heidelberg <david@ixit.cz>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, mark.rutland@arm.com
Subject: Re: [PATCH] arm64: head: set TEXT_OFFSET to the historical value
Message-ID: <obcgfnmgdemf5gtc7gdaj6nzoa2rwxsc6njt4fd2ouwzqj4y7y@ztxwyyoepuud>
References: <20251006-arm64-text-offset-v1-1-bf0e8a27383b@oss.qualcomm.com>
 <aOPLv_-f5sNGtG4e@willie-the-truck>
 <CAMj1kXHhetfN_bY5AAqqfC4=N9yQCO5R_n7H0BMXZ2VXudv5pQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHhetfN_bY5AAqqfC4=N9yQCO5R_n7H0BMXZ2VXudv5pQ@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXwOnSEzquMDdb
 vnxi8HiDMUXckylY2hzpm44nxafOcKuz8aInk0Uej8Lwu7qrdc5+HRR5dSgZVuOfWcXpWCSEm3q
 p7Qlg9OU1UUTtXvHf0wgzEhi1q4aJH7M2vYB1HgVQdnttGVm2tXoV0JJiGnCYN/P3qpWozrWdT+
 3BG/g0REwJ+ui/MJzWPhM77VPTDvdBn+jnF8pfnH8Qeuqd8hkJV//gc9t2QiKBDMIMngDMIk3xo
 DvtabPKsweuT2TBjUno/FBChD9uSSmRD2yV+gQjmprdKulNfPJ9DMu3qrI8wrbE7qESQHyMuL2b
 pw+/nMyzH06mYZmb8tphM0HsaSAsQOBSN3S3nmpA9SJrcT1khcJEvsSowfEIaQPTIVIZqZ8EhA/
 5tQt6Xdt0uJZHKHGs6iWcZQduRJ5LA==
X-Authority-Analysis: v=2.4 cv=B6G0EetM c=1 sm=1 tr=0 ts=68e6c0b9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EArQ5nPrA_zcfZOwlBcA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: _DqgJUdk989dLOve7k4OKUEawd1n5hQO
X-Proofpoint-ORIG-GUID: _DqgJUdk989dLOve7k4OKUEawd1n5hQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Tue, Oct 07, 2025 at 01:46:08AM +0200, Ard Biesheuvel wrote:
> On Mon, 6 Oct 2025 at 16:01, Will Deacon <will@kernel.org> wrote:
> >
> > [+Ard and Mark]
> >
> > On Mon, Oct 06, 2025 at 01:21:04AM +0300, Dmitry Baryshkov wrote:
> > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >
> > > Historically arm64 kernel contained (almost fixed) value of 0x8000 at
> >
> > 0x8000 or 0x80000?
> >
> > > the TEXT_OFFSET. The commit cfa7ede20f13 ("arm64: set TEXT_OFFSET to 0x0
> > > in preparation for removing it entirely") and then commit 120dc60d0bdb
> > > ("arm64: get rid of TEXT_OFFSET") replaced this field with 0.
> >
> > Given that we made the initial change over five years ago, I'm struggling
> > to see why we should start caring about old broken bootloaders _now_.

Well... because support for these devices wasn't upstreamed and so a
similar patch was being kept in the down-upstream kernel.

> >
> > In fact, I'm far more concerned about changing this to a non-zero value
> > and having more recent bootloaders misbehave.

I see.

> >
> > > This caused no problems so far, because nobody seemed to be playing with
> > > the extremely picky Qualcomm bootloader as used on some of Google Pixel
> > > phones. Current attempting to boot the Linux kernel on those devices
> > > will fail to load on those phones with the following message:
> > >
> > > KernelDecompress failed: Invalid Parameter Kernel TextOffset does not match
> > > Error calling BootPrepareAsync Invalid Parameter
> > >
> > > Since the kernel ignores the field, set it to the expected value of
> > > 0x8000, unbreaking boot of upstream kernels on Qualcomm devices.
> >
> > (same typo)
> >
> 
> Just setting the header field and not updating the base address also
> means that the boot breaks without CONFIG_RELOCATABLE, and you will
> get a warning in the kernel log about the load address not being
> aligned to 2 MiB.
> 
> So I don't think this is the right solution.

Since most of the people build the kernel with CONFIG_RELOCATABLE, would
it be better to set it to 0x80000 for relocatable kernels and to 0
otherwise?

> 
> If this is really something that needs to be fixed upstream, we should
> just bring back TEXT_OFFSET in its entirety, but I'm not convinced
> that this is really justified here. As a workaround, you could just
> add 2 MiB - 0x80000 bytes of padding at the start of the image, and
> add your own header (as Will alludes to as well)

Does it mean building a device specific kernel? Or just packing
everything while building the Android boot image?

-- 
With best wishes
Dmitry

