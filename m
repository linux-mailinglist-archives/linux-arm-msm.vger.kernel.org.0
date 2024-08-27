Return-Path: <linux-arm-msm+bounces-29651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EA6961431
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 18:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6ACDB222DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 16:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B7D1CC150;
	Tue, 27 Aug 2024 16:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z8qpyk02"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D75954767;
	Tue, 27 Aug 2024 16:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724776680; cv=none; b=WrfS2RhzgOj0EAhqC+EtUT2YDKBcn01605SO3OPhI/Pe4NomDjxopfdc7uPIXceqpwxjlCNpVQunXxNxBZNiCsDDAbHO5lCQgjq+x2RzACkk+9GLI1DHCLl5hZO4H053SebHzxz48I1Kk6rJbFA4CpE3aXQ8lbgJZaTJAOcZ42s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724776680; c=relaxed/simple;
	bh=hErvxCDArYFzjCS1c/Km/JxMaroQOcowz5j0Uuj5vOY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/XwHc5VVs6YxkjGTIwgmnkA5GWLZT7uwB1OLrkwtDsJkXQH9OlhxjlLlXPf7Vsnth1eP+VhJgweKd4cbid2K1AZFcCyoOQDBz6DY15e9nlM2C/f2pyuVgw+YSQFGLtR/nlLi4buf1ncV88WE+nwo9iAs/6KHJoEySn6i5oEGno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z8qpyk02; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R7wCpK024902;
	Tue, 27 Aug 2024 16:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QhRdPM7KXP/+AhNuJqxhUeI0
	lWUUn65ADTlpQk6eYsQ=; b=Z8qpyk02HcKSEXsdtw6RHQ1xyH5HHQeyxyksOuAt
	SI8mcNGX0AGzC7JaTWSGG5bUBc1ZZhCxGxvGPr+hmlf6vYc92XgyeBXqXnJQW3Rm
	vMySmvMbZsLr+zX58kqHGTqfjJDfo+N5ty/cjBN5Nk1g/w8iTptlFsYnjrhScKcZ
	n4B1c6p4O5Rm3oXkdrpKb8DIrEHpLXohqBLyXaDPZ9WRFsgilb43I13uQo+Jw6D3
	zsjTWo44euV70NFnKiT/+7G97sqfPx3HdLlLmAr23DIoBAkn2zIAneKOs2WmKJrT
	bOj7pIKnpIK1EwuKCIAtXGU2aU4SFadX6jQS93XsAT0+Fg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 417980ypph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 16:37:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47RGblbp020838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 16:37:47 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 09:37:46 -0700
Date: Tue, 27 Aug 2024 09:37:45 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Will Deacon <will@kernel.org>
CC: Linus Torvalds <torvalds@linux-foundation.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] arm64: Allow packing uncompressed images into distro
 packages
Message-ID: <Zs4ATYYjELMLYZDr@hu-bjorande-lv.qualcomm.com>
References: <20240819-uncompressed-distro-packages-v1-1-c8accc8bc9ea@quicinc.com>
 <20240823105853.GC31866@willie-the-truck>
 <ZskWfKIZkThKpj9m@hu-bjorande-lv.qualcomm.com>
 <20240827113356.GA4318@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240827113356.GA4318@willie-the-truck>
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bSj9apshOK_5P-idcUuvHSpYlzDVILwx
X-Proofpoint-ORIG-GUID: bSj9apshOK_5P-idcUuvHSpYlzDVILwx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_10,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408270125

On Tue, Aug 27, 2024 at 12:33:56PM +0100, Will Deacon wrote:
> On Fri, Aug 23, 2024 at 04:08:44PM -0700, Bjorn Andersson wrote:
> > On Fri, Aug 23, 2024 at 11:58:54AM +0100, Will Deacon wrote:
> > > On Mon, Aug 19, 2024 at 08:11:58PM -0700, Bjorn Andersson wrote:
> > > > From: Bjorn Andersson <quic_bjorande@quicinc.com>
> > > > 
> > > > The distro packages (deb-pkg, pacman-pkg, rpm-pkg) are generated using
> > > > the compressed kernel image, which means that the kernel once installed
> > > > can not be booted with systemd-boot.
> > > > 
> > > > This differs from the packages generated by the distros themselves,
> > > > which uses the uncompressed image.
> > > > 
> > > > Expand the newly introduced CONFIG_COMPRESSED_INSTALL option to allow
> > > > selection of which version of the kernel image should be packaged into
> > > > the distro packages.
> > > > 
> > > > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > > > ---
> > > >  arch/arm64/Makefile | 15 ++++++---------
> > > >  1 file changed, 6 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> > > > index f6bc3da1ef11..7bb9a0a5500a 100644
> > > > --- a/arch/arm64/Makefile
> > > > +++ b/arch/arm64/Makefile
> > > > @@ -166,9 +166,13 @@ BOOT_TARGETS	:= Image vmlinuz.efi image.fit
> > > >  PHONY += $(BOOT_TARGETS)
> > > >  
> > > >  ifeq ($(CONFIG_EFI_ZBOOT),)
> > > > -KBUILD_IMAGE	:= $(boot)/Image.gz
> > > > +  ifeq ($(CONFIG_COMPRESSED_INSTALL),y)
> > > > +    KBUILD_IMAGE := $(boot)/Image.gz
> > > > +  else
> > > > +    KBUILD_IMAGE := $(boot)/Image
> > > > +  endif
> > > >  else
> > > > -KBUILD_IMAGE	:= $(boot)/vmlinuz.efi
> > > > +  KBUILD_IMAGE := $(boot)/vmlinuz.efi
> > > >  endif
> > > >  
> > > >  all:	$(notdir $(KBUILD_IMAGE))
> > > > @@ -182,13 +186,6 @@ $(BOOT_TARGETS): vmlinux
> > > >  Image.%: Image
> > > >  	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
> > > >  
> > > > -ifeq ($(CONFIG_COMPRESSED_INSTALL),y)
> > > > - DEFAULT_KBUILD_IMAGE = $(KBUILD_IMAGE)
> > > > -else
> > > > - DEFAULT_KBUILD_IMAGE = $(boot)/Image
> > > > -endif
> > > > -
> > > > -install: KBUILD_IMAGE := $(DEFAULT_KBUILD_IMAGE)
> > > 
> > > Hmm, doesn't this mean that we always install vmlinuz.efi if
> > > CONFIG_EFI_ZBOOT=y?
> > > 
> > 
> > Hmm, you're right, I failed to parse that part.
> > 
> > That said, prior to Linus' change we'd always install "Image" and I read
> > his commit message to allow installing "Image.gz".
> > 
> > But the change also made it possible to install "vmlinuz.efi", by
> > setting both options to =y. Was this intentional?
> > 
> > Can you confirm that this is what we want:
> > 
> > ZBOOT | COMPRESS | BUILD_IMAGE | install
> > ------+----------+-------------+--------
> >   N   |    N     | Image       | Image
> >   N   |    Y     | Image.gz    | Image.gz
> >   Y   |    N     | vmlinuz.efi | Image (?)
> >   Y   |    Y     | vmlinuz.efi | vmlinuz.efi (was Image in v6.10)
> 
> I think that's the current behaviour, and I don't see a problem with it.
> 
> The main thing is to avoid breaking somebody's system in the default
> configuration (i.e. when CONFIG_COMPRESSED_INSTALL=n) by installing an
> image via `make install` that isn't supported universally by bootloaders.
> 

Okay, thanks for confirming the expectation. I'll wrangle my patch to
match this.

Thanks,
Bjorn

