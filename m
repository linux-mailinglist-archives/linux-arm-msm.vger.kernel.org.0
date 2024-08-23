Return-Path: <linux-arm-msm+bounces-29418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A566495D981
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2024 01:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 627EE281D23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 23:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6573C193412;
	Fri, 23 Aug 2024 23:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O+AQVCkY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F52E1684A4;
	Fri, 23 Aug 2024 23:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724454538; cv=none; b=BmQuMcnHSde+dzF/s+Ent+jsvbfy3mviCbOOjWyNswgd9X4A8mJlFhC0O+0easrakj90z7oKcNAuPsCKSK+9rn9En/YDmZk2lttoW/olshLQYMZqcr5YWOEo5O7G+7gDptm0L2fdWcNsDGmpHyZs/7kjcBOzvA289Py4ACKX2TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724454538; c=relaxed/simple;
	bh=giDUnuq5inlhh3IT83c4ThKoCl4vW8XSjkk5asxdoxI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YeNEmVETzcd0C9Xz2dfCu6+e0F7GHiiHSJgdBP6k1p2E1HT9n9du9Ps6/56Y/Q/FKsABfBgyroVU9Uo/5+7rH8ohj093fx6KSTC3/tA3thJH1x+Jg3SXCm9ECx7qr1Z5mVnqAn4EAJinTyvv4iVgamqQY1HQXZdKtQvx7KI0rIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O+AQVCkY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47NMG5PJ007079;
	Fri, 23 Aug 2024 23:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OnFfZKNcSxBRX5EfhZBjBWik
	3XhATKgjGZdy1MpDYUY=; b=O+AQVCkYaPGf+wqBrV+njZs0f7xYJb4WaJR3+gLo
	GiRXhKn5Z2kcUnx+DZWTz730Hy75qqB9f/rnYVEVe1x5L6/u/sH36s//522w29IB
	zERH6Jvrh36F7YtUegIvPvad0dp/xKOCaGfYSu4hyCodPJp3AcuaofiR6YpafSwl
	8agbYzIj0qWobzgLHe7KrLo+5Qz4vCnfQWQSX43VTXDqPdp+I/QKWBoJ/VEnc4UI
	KuAQbJvHBPFgJUYWcnAPNTnkM1DGMm0Rb1nwyHm8NKjsiEQ6T0AERuXFeZdOycHh
	w4IrCcwIS2GW23PylqMxYcOi8xqz7vsHU2xuSRPBAVQBdg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41732pg271-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 23:08:46 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47NN8ki4011717
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Aug 2024 23:08:46 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 23 Aug 2024 16:08:45 -0700
Date: Fri, 23 Aug 2024 16:08:44 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Will Deacon <will@kernel.org>,
        Linus Torvalds
	<torvalds@linux-foundation.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] arm64: Allow packing uncompressed images into distro
 packages
Message-ID: <ZskWfKIZkThKpj9m@hu-bjorande-lv.qualcomm.com>
References: <20240819-uncompressed-distro-packages-v1-1-c8accc8bc9ea@quicinc.com>
 <20240823105853.GC31866@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240823105853.GC31866@willie-the-truck>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1PMmpXXX4xhmLVq14yvRdiIlDaHY6xVB
X-Proofpoint-ORIG-GUID: 1PMmpXXX4xhmLVq14yvRdiIlDaHY6xVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_16,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 clxscore=1011 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408230169

On Fri, Aug 23, 2024 at 11:58:54AM +0100, Will Deacon wrote:
> On Mon, Aug 19, 2024 at 08:11:58PM -0700, Bjorn Andersson wrote:
> > From: Bjorn Andersson <quic_bjorande@quicinc.com>
> > 
> > The distro packages (deb-pkg, pacman-pkg, rpm-pkg) are generated using
> > the compressed kernel image, which means that the kernel once installed
> > can not be booted with systemd-boot.
> > 
> > This differs from the packages generated by the distros themselves,
> > which uses the uncompressed image.
> > 
> > Expand the newly introduced CONFIG_COMPRESSED_INSTALL option to allow
> > selection of which version of the kernel image should be packaged into
> > the distro packages.
> > 
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> >  arch/arm64/Makefile | 15 ++++++---------
> >  1 file changed, 6 insertions(+), 9 deletions(-)
> > 
> > diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> > index f6bc3da1ef11..7bb9a0a5500a 100644
> > --- a/arch/arm64/Makefile
> > +++ b/arch/arm64/Makefile
> > @@ -166,9 +166,13 @@ BOOT_TARGETS	:= Image vmlinuz.efi image.fit
> >  PHONY += $(BOOT_TARGETS)
> >  
> >  ifeq ($(CONFIG_EFI_ZBOOT),)
> > -KBUILD_IMAGE	:= $(boot)/Image.gz
> > +  ifeq ($(CONFIG_COMPRESSED_INSTALL),y)
> > +    KBUILD_IMAGE := $(boot)/Image.gz
> > +  else
> > +    KBUILD_IMAGE := $(boot)/Image
> > +  endif
> >  else
> > -KBUILD_IMAGE	:= $(boot)/vmlinuz.efi
> > +  KBUILD_IMAGE := $(boot)/vmlinuz.efi
> >  endif
> >  
> >  all:	$(notdir $(KBUILD_IMAGE))
> > @@ -182,13 +186,6 @@ $(BOOT_TARGETS): vmlinux
> >  Image.%: Image
> >  	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
> >  
> > -ifeq ($(CONFIG_COMPRESSED_INSTALL),y)
> > - DEFAULT_KBUILD_IMAGE = $(KBUILD_IMAGE)
> > -else
> > - DEFAULT_KBUILD_IMAGE = $(boot)/Image
> > -endif
> > -
> > -install: KBUILD_IMAGE := $(DEFAULT_KBUILD_IMAGE)
> 
> Hmm, doesn't this mean that we always install vmlinuz.efi if
> CONFIG_EFI_ZBOOT=y?
> 

Hmm, you're right, I failed to parse that part.

That said, prior to Linus' change we'd always install "Image" and I read
his commit message to allow installing "Image.gz".

But the change also made it possible to install "vmlinuz.efi", by
setting both options to =y. Was this intentional?

Can you confirm that this is what we want:

ZBOOT | COMPRESS | BUILD_IMAGE | install
------+----------+-------------+--------
  N   |    N     | Image       | Image
  N   |    Y     | Image.gz    | Image.gz
  Y   |    N     | vmlinuz.efi | Image (?)
  Y   |    Y     | vmlinuz.efi | vmlinuz.efi (was Image in v6.10)

It seems reasonable to keep the two last entries in the "install" column
either "Image/Image.gz" or "vmlinuz.efi/vmlinuz.efi" (if it should be
possible to pass vmlinuz.efi to installkernel).

Regards,
Bjorn

