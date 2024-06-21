Return-Path: <linux-arm-msm+bounces-23619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03779912A6B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 17:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC3CB281845
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 15:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2522A81AA5;
	Fri, 21 Jun 2024 15:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ovtgaMOQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7117C09E;
	Fri, 21 Jun 2024 15:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718984359; cv=none; b=Hswr6HN74o7+wp7OJ9lxFkCIeZ7u8TGrgdLk9ZXG2MiHL3gFgEej9XETns95gyXMBZTEvtTKYfjQUboTwC4O8K1DLpHozROwnhMiQ4MDZSE29sPqWtR6uSCeSPYzBme7VQlad9xchYa/ZENCF7G3xFGMy2D6voDKK6An1nHHPNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718984359; c=relaxed/simple;
	bh=b4jz1HGbbeA4Gtci1boqwN/0zqTO8CcnznEbTRtgvuU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ah8kMJMdwoAaGGdiwWnGfXLpfmj9K/XQKE6gNKP//+pt5LKr/u5ajkjhsvPJY/Yuu+TPqK+CShM7NyjedkqwWN1+AzriD/bJsDtYWtSyz5+i7MrqDC9KOM/SNzWxYkPZlshsjJqFU7HjpNq3L26XQSvJBquep6s+Zj2wJZQzsGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ovtgaMOQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LEhTqU018264;
	Fri, 21 Jun 2024 15:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pQSKU9l51CYCs/hwEoGqpbUtpzKpF8PQVdSkZYTV73c=; b=ovtgaMOQ9FXAmLNQ
	tXQART9ZSrzO157gpD58rOSLu/Nb+k1b30X8w6TIb4FPSVVyeZ3wtQxoTVzV4f+E
	FImnlsaRNdUdaNo8z13VIancNjOy9zIAKE6E47UEXUhIaDRexsU0bIwU4psu/YHU
	y5+wVvc/Xzr0lUVz4iJAO+qsfEvfWas0eOrXLw++3Z1S+VuXsVeA4U+xc/gNbdnO
	30lWDsQ4pxrU+geRcNxZlFmoAXnu8fNmOkpx72zPvqxAOODGB0ibJ/xE1Iva5j0k
	EQbV5WY1Sl0k732mUpItfPJZbT8TnJcKdCGFlQnsb7pv2TwSa1AqlhvjrFJ8GcnX
	3C1fHw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrp1axra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 15:38:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45LFclWW031537
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 15:38:48 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Jun 2024 08:38:44 -0700
Received: from nalasex01a.na.qualcomm.com ([fe80::62ba:cee1:5495:c89]) by
 nalasex01a.na.qualcomm.com ([fe80::62ba:cee1:5495:c89%4]) with mapi id
 15.02.1544.009; Fri, 21 Jun 2024 08:38:44 -0700
From: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>
To: Eric Biggers <ebiggers@kernel.org>,
        "dmitry.baryshkov@linaro.org"
	<dmitry.baryshkov@linaro.org>
CC: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>,
        srinivas.kandagatla
	<srinivas.kandagatla@linaro.org>,
        "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        kernel
	<kernel@quicinc.com>,
        "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "Om Prakash Singh (QUIC)"
	<quic_omprsing@quicinc.com>,
        "Bao D. Nguyen (QUIC)"
	<quic_nguyenb@quicinc.com>,
        bartosz.golaszewski
	<bartosz.golaszewski@linaro.org>,
        "konrad.dybcio@linaro.org"
	<konrad.dybcio@linaro.org>,
        "ulf.hansson@linaro.org"
	<ulf.hansson@linaro.org>,
        "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "mani@kernel.org"
	<mani@kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        Prasad Sodagudi
	<psodagud@quicinc.com>,
        Sonal Gupta <sonalg@quicinc.com>
Subject: RE: [PATCH v5 04/15] soc: qcom: ice: add hwkm support in ice
Thread-Topic: [PATCH v5 04/15] soc: qcom: ice: add hwkm support in ice
Thread-Index: AQHawFGQ2Cb4IdeC1UawBk8ySHD6CrHMC+2AgAKAhjCAAAKiAIABGqdwgAFdEwCAARo5gIAAtQQAgAAA2hA=
Date: Fri, 21 Jun 2024 15:38:44 +0000
Message-ID: <c635b2b5eceb4accba00e31c0fbbfad3@quicinc.com>
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
 <20240617005825.1443206-5-quic_gaurkash@quicinc.com>
 <3eehkn3cdhhjfqtzpahxhjxtu5uqwhntpgu22k3hknctrop3g5@f7dhwvdvhr3k>
 <96e2ce4b154a4f918be0bc2a45011e6d@quicinc.com>
 <CAA8EJppGpv7N_JQQNJZrbngBBdEKZfuqutR9MPnS1R_WqYNTQw@mail.gmail.com>
 <3a15df00a2714b40aba4ebc43011a7b6@quicinc.com>
 <CAA8EJpoZ0RR035QwzMLguJZvdYb-C6aqudp1BgHgn_DH2ffsoQ@mail.gmail.com>
 <20240621044747.GC4362@sol.localdomain>
 <CY8PR02MB9502E314820C659AF080DB93E2C92@CY8PR02MB9502.namprd02.prod.outlook.com>
In-Reply-To: <CY8PR02MB9502E314820C659AF080DB93E2C92@CY8PR02MB9502.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KfHq2iBkQGUtKkpK3gFHbP5xQ1tQs_EV
X-Proofpoint-ORIG-GUID: KfHq2iBkQGUtKkpK3gFHbP5xQ1tQs_EV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_07,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 clxscore=1011 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406210114

Apologies, fixed incorrect email

> Hello Eric
>=20
> On 06/20/2024, 9:48 PM PDT, Eric Biggers wrote:
> > On Thu, Jun 20, 2024 at 02:57:40PM +0300, Dmitry Baryshkov wrote:
> > > > > >
> > > > > > > Is it possible to use both kind of keys when working on
> > > > > > > standard
> > mode?
> > > > > > > If not, it should be the user who selects what type of keys
> > > > > > > to be
> > used.
> > > > > > > Enforcing this via DT is not a way to go.
> > > > > > >
> > > > > >
> > > > > > Unfortunately, that support is not there yet. When you say
> > > > > > user, do you mean to have it as a filesystem mount option?
> > > > >
> > > > > During cryptsetup time. When running e.g. cryptsetup I, as a
> > > > > user, would like to be able to use either a hardware-wrapped key
> > > > > or a
> > standard key.
> > > > >
> > > >
> > > > What we are looking for with these patches is for per-file/folder
> > encryption using fscrypt policies.
> > > > Cryptsetup to my understanding supports only full-disk , and does
> > > > not support FBE (File-Based)
> > >
> > > I must admit, I mostly used dm-crypt beforehand, so I had to look at
> > > fscrypt now. Some of my previous comments might not be fully
> > > applicable.
> > >
> > > > Hence the idea here is that we mount an unencrypted device (with
> > > > the inlinecrypt option that indicates inline encryption is
> > > > supported) And
> > specify policies (links to keys) for different folders.
> > > >
> > > > > > The way the UFS/EMMC crypto layer is designed currently is
> > > > > > that, this information is needed when the modules are loaded.
> > > > > >
> > > > > > https://lore.kernel.org/all/20231104211259.17448-2-ebiggers@ke
> > > > > > rn el.org /#Z31drivers:ufs:core:ufshcd-crypto.c
> > > > >
> > > > > I see that the driver lists capabilities here. E.g. that it
> > > > > supports HW-wrapped keys. But the line doesn't specify that
> > > > > standard
> > keys are not supported.
> > > > >
> > > >
> > > > Those are capabilities that are read from the storage controller.
> > > > However, wrapped keys Are not a standard in the ICE JEDEC
> > > > specification, and in most cases, is a value add coming from the So=
C.
> > > >
> > > > QCOM SOC and firmware currently does not support both kinds of
> > > > keys in
> > the HWKM mode.
> > > > That is something we are internally working on, but not available y=
et.
> > >
> > > I'd say this is a significant obstacle, at least from my point of
> > > view. I understand that the default might be to use hw-wrapped keys,
> > > but it should be possible for the user to select non-HW keys if the
> > > ability to recover the data is considered to be important. Note, I'm
> > > really pointing to the user here, not to the system integrator. So
> > > using DT property or specifying kernel arguments to switch between
> > > these modes is not really an option.
> > >
> > > But I'd really love to hear some feedback from linux-security and/or
> > > linux-fscrypt here.
> > >
> > > In my humble opinion the user should be able to specify that the key
> > > is wrapped using the hardware KMK. Then if the hardware has already
> > > started using the other kind of keys, it should be able to respond
> > > with -EINVAL / whatever else. Then the user can evict previously
> > > programmed key and program a desired one.
> > >
> > > > > Also, I'd have expected that hw-wrapped keys are handled using
> > > > > trusted keys mechanism (see security/keys/trusted-keys/). Could
> > > > > you please point out why that's not the case?
> > > > >
> > > >
> > > > I will evaluate this.
> > > > But my initial response is that we currently cannot communicate to
> > > > our TPM directly from HLOS, but goes through QTEE, and I don't
> > > > think our qtee currently interfaces with the open source tee
> > > > driver. The
> > interface is through QCOM SCM driver.
> > >
> > > Note, this is just an API interface, see how it is implemented for
> > > the CAAM hardware.
> > >
> >
> > The problem is that this patchset was sent out without the patches
> > that add the block and filesystem-level framework for hardware-wrapped
> > inline encryption keys, which it depends on.  So it's lacking context.
> > The proposed framework can be found at https://lore.kernel.org/linux-
> > block/20231104211259.17448-1-ebiggers@kernel.org/T/#u
> >
>=20
> I have only been adding the fscryp patch link as part of the cover letter=
 - as a
> dependency.
> https://lore.kernel.org/all/20240617005825.1443206-1-
> quic_gaurkash@quicinc.com/
> If you would like me to include it in the patch series itself, I can do t=
hat as
> well.
>=20
> > As for why "trusted keys" aren't used, they just aren't helpful here.
> > "Trusted keys" are based around a model where the kernel can request
> > that keys be sealed and unsealed using a trust source, and the kernel
> > gets access to the raw unsealed keys.  Hardware-wrapped inline
> > encryption keys use a different model where the kernel never gets
> > access to the raw keys.  They also have the concept of ephemeral
> > wrapping which does not exist in "trusted keys".  And they need to be
> > properly integrated with the inline encryption framework in the block l=
ayer.
> >
> > - Eric
>=20
> Regards,
> Gaurav

