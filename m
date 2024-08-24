Return-Path: <linux-arm-msm+bounces-29425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 244D395DACE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2024 05:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C4EE1F21735
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2024 03:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFE018651;
	Sat, 24 Aug 2024 03:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TQbhW3As"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCDCF4ED;
	Sat, 24 Aug 2024 03:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724469426; cv=none; b=FCsqWm5f7zoJeCSOHnIta8LAcourcYl1HomkpH/GVbCNuvfEque05sP+QE7MIgUldvJqSBKIaR4OeSTxf6RWYd1LPVg1b+NMRA1yEJ39rSY+EIKLjt0+eHXCsmX2U1e2xuXalURoRPFEgHHetS7kZGes6SCTFd5VS2gzIDDyrmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724469426; c=relaxed/simple;
	bh=XqCuNkN0iplxmZFCtAOdB9AeVq5ae06WJkVCMF6ycCA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HKxz7KtD38jMwaWkpCJ4qyB2Ao/CxsQsyk0ec0l9crnnid50FAjGJVFw67Bl/VJeQpsg03eIpeeDKu3YGm2DqWRsh5OcrG9FQ5F+DsT+LHTU/4ChHG1a2+dZdzwyXduJXulPqtbNTEaOTVMmocp6GJwkD0OqwmJT77wJ4SYd9+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TQbhW3As; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47O0uQM3030540;
	Sat, 24 Aug 2024 03:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4KV2yw4+s8OJQsXhq42Ia8qa
	KQGeheYfo3pPiyjlX48=; b=TQbhW3AsLy/lQYLgws2Yu/Lmgnpyp8kGelr+Bbkx
	3gP//Q6Y2NQs/DYmDkp9ThvO0AIRt+hemfUejYQwsN53OfJNSTrb8qCbkoDHh0KY
	dIpV4M5UwFE6eJOTmQaQW00VGrrxKBy+UTigv9lHYXkZ5Ff3Un9rWc7tzYsKmTN/
	8rFeoASIVwLEXAw4kIHJOipZCE/rqO9OqCu+jrmW9r9F0Gy3tsyvNBdNoTWgkI94
	NhU5pgJSepJnGqSCMzY4t4qcLmM6n8q8pGynq4YI94VxwtuN10/d0gYMsNPgSzle
	hcoAE+4HGUjokH6dXvW9LBO78NkeJw2q8XK7FFl873rNiA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4174vn85p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Aug 2024 03:16:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47O3GoYe012507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Aug 2024 03:16:50 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 23 Aug 2024 20:16:50 -0700
Date: Fri, 23 Aug 2024 20:16:49 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] arm64: Allow packing uncompressed images into distro
 packages
Message-ID: <ZslQoWbaHqus/KRe@hu-bjorande-lv.qualcomm.com>
References: <20240819-uncompressed-distro-packages-v1-1-c8accc8bc9ea@quicinc.com>
 <20240823105853.GC31866@willie-the-truck>
 <ZskWfKIZkThKpj9m@hu-bjorande-lv.qualcomm.com>
 <CAHk-=wjpXFOMq03cVq9XA+33QGALRzWV4mCND6dYpwAnXRqnmA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHk-=wjpXFOMq03cVq9XA+33QGALRzWV4mCND6dYpwAnXRqnmA@mail.gmail.com>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ob24KJa48-WVkNkBRG-2e_yZ6QlBFEHw
X-Proofpoint-GUID: ob24KJa48-WVkNkBRG-2e_yZ6QlBFEHw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-24_02,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408240017

On Sat, Aug 24, 2024 at 10:22:54AM +0800, Linus Torvalds wrote:
> On Sat, 24 Aug 2024 at 07:08, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> >
> > But the change also made it possible to install "vmlinuz.efi", by
> > setting both options to =y. Was this intentional?
> 
> Absolutely. My arm64 config in fact has EFI_ZBOOT enabled.
> 

Per CONFIG_EFI_ZBOOT help text, the ZBOOT is a compressed image wrapped
in an EFI container. Add to this that both GRUB and Android Boot Loader
happily loads the compressed Image (i.e. Image.gz).

So, in my mind there's: uncompressed Image, compressed Image.gz, and
compressed Image.gz packaged in an EFI application to uncompress itself.

But your change makes more sense than you just wanting the Image.gz,
which puzzled me...

> IOW, the intent of that CONFIG_COMPRESSED_INSTALL was simply to make
> "make install" do the same thing that "make zinstall" used to do.
> 

I was convinced that make zinstall do install the Image.gz, looking at
the Makefiles I am however not able to see how.

> I in fact initially limited the whole COMPRESSED_INSTALL question to
> be *only* for when EFI_ZBOOT is enabled (because that was my
> situation), and privately asked Will if maybe non-EFI people want it.
> So the patch originally had
> 
> +       depends on EFI && EFI_ZBOOT
> 
> and I asked Will
> 
>   Comments? Do the non-EFI_ZBOOT cases also perhaps want this (ie
>   "Image.gz" as opposed to "vmlinuz.efi")?
> 
>   I intentionally tried to make it as limited as possible, but maybe the
>   non-EFI people would want this too?
> 

Just to clarify this point, I only have EFI systems.

> and he thought that it would be better to just make this compressed
> install question be independent of anything else, and literally just
> boil down to "do you want 'make install' to do the same thing as 'make
> zinstall' does?"
> 
> I have *no* idea about what the actual package manager case wants, though.
> 

I looked at, and tried, Arch Linux, Debian, and Fedora. The package
managers effectively unpacks the files, invokes mkinitcpio and feeds the
result to the bootloader. So if you have a bootloader (like
systemd-boot) that doesn't decompress the Image it's asked to load, then
what's being put into the package needs to be uncompressed.

This is why I would like the option to enter the packaging steps with
KBUILD_IMAGE=Image...


I think it would make more sense to have CONFIG_COMPRESSED_INSTALL
represent Image.gz vs Image (compressed vs uncompressed). And if you ask
for an EFI-wrapped Image (ZBOOT) we compress and install that for you
regardless of CONFIG_COMPRESSED_INSTALL.

Regards,
Bjorn

