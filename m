Return-Path: <linux-arm-msm+bounces-24065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BF3915DDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 06:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E91431C21960
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 04:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8E913D276;
	Tue, 25 Jun 2024 04:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J3PThY0g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A3F13D245;
	Tue, 25 Jun 2024 04:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719291536; cv=none; b=ZOFvQ0+w2zi91+eYMQb3PRqChgfuUOHCzn6inhzXQITPUnL2DfufVitF78PDOcI/A+u5KeGMBZDUhW9JwVGwRXqO50SPCSU/e51ZoZgbhD7OPgIH0A5P0zwG7OiD+m82Y61Bl7xcEEkKTK0Gv6VkqxDw/NN4NRkx5td37g8ujDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719291536; c=relaxed/simple;
	bh=ND6usd0lmh6HXbU/mLbYuUVTfbVjIvdHxe504O3wzkU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qa9aCeuMWjqLmmhWUFWniBHF3HF/FsQBhdUzknrVv96ViW4wBfqaaw39yim9NeuPjIbyS0zN4Ii36PnrAHlntb3pkV5w7p2HDj8E4lUux1+cWquRafqJgLjR7T7Ewud1BSycDO+0b7nQmHVEHGhdYsw7sYhDzUiQJpOyBdcBhto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J3PThY0g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OJ1HCn031385;
	Tue, 25 Jun 2024 04:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VhrBFheplnTjj9L5oyMcjrrltGK7c5R218vm0hNEDWw=; b=J3PThY0gBsQO5cqD
	aZzGxIvtiTdzO+Sr8GsVU1qbSpVHwgoZvJk9N1yaT4sHb9Itwvd2U/fVvxQkV7k0
	Nl+Va6ht20VAVhAX3ipyQmaDo3zUakeHBKYOwl7rjozjhU70IDxXxyulQWp7u1dz
	DPijxu6+T0pme4llxwSR2X/cEH95NpKh08qkF02W5YHxlmZ/s/64STCUoa/+EQLS
	adiUnzQFICLv0jYATa55M52nkpPCd8ekJm/EfAm/Cu7/0aSmznk6PrpyE4Mwlmwf
	pdNo31nyiWoZzyv1ncZmGYBR4MQ3OEQpeo5OYIdFCnX45UsupJDgKt5/d2BZRLFY
	USfgyA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywppv5bqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 04:58:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45P4wZrP000489
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 04:58:35 GMT
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Jun 2024 21:58:31 -0700
Received: from nalasex01a.na.qualcomm.com ([fe80::62ba:cee1:5495:c89]) by
 nalasex01a.na.qualcomm.com ([fe80::62ba:cee1:5495:c89%4]) with mapi id
 15.02.1544.009; Mon, 24 Jun 2024 21:58:31 -0700
From: "Gaurav Kashyap (QUIC)" <quic_gaurkash@quicinc.com>
To: Eric Biggers <ebiggers@kernel.org>,
        Gaurav Kashyap
	<gaurkash@qti.qualcomm.com>
CC: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
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
Thread-Index: AQHawFGQ2Cb4IdeC1UawBk8ySHD6CrHMC+2AgAKAhjCAAAKiAIABGqdwgAFdEwCAARo5gIAAtQQAgAAHSQCABRbeEA==
Date: Tue, 25 Jun 2024 04:58:31 +0000
Message-ID: <efc0d71d27854a3bbe008fffc666d638@quicinc.com>
References: <20240617005825.1443206-1-quic_gaurkash@quicinc.com>
 <20240617005825.1443206-5-quic_gaurkash@quicinc.com>
 <3eehkn3cdhhjfqtzpahxhjxtu5uqwhntpgu22k3hknctrop3g5@f7dhwvdvhr3k>
 <96e2ce4b154a4f918be0bc2a45011e6d@quicinc.com>
 <CAA8EJppGpv7N_JQQNJZrbngBBdEKZfuqutR9MPnS1R_WqYNTQw@mail.gmail.com>
 <3a15df00a2714b40aba4ebc43011a7b6@quicinc.com>
 <CAA8EJpoZ0RR035QwzMLguJZvdYb-C6aqudp1BgHgn_DH2ffsoQ@mail.gmail.com>
 <20240621044747.GC4362@sol.localdomain>
 <CY8PR02MB9502E314820C659AF080DB93E2C92@CY8PR02MB9502.namprd02.prod.outlook.com>
 <20240621160144.GB2081@sol.localdomain>
In-Reply-To: <20240621160144.GB2081@sol.localdomain>
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
X-Proofpoint-GUID: Bu04VlNgizvx9GAr2vAvVeFs2jLrLneW
X-Proofpoint-ORIG-GUID: Bu04VlNgizvx9GAr2vAvVeFs2jLrLneW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_02,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=999 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406250036


Hey Eric

On 06/21/2024, 9:02 AM PDT, Eric Biggers wrote:
> On Fri, Jun 21, 2024 at 03:35:40PM +0000, Gaurav Kashyap wrote:
> > Hello Eric
> >
> > On 06/20/2024, 9:48 PM PDT, Eric Biggers wrote:
> > > On Thu, Jun 20, 2024 at 02:57:40PM +0300, Dmitry Baryshkov wrote:
> > > > > > >
> > > > > > > > Is it possible to use both kind of keys when working on
> > > > > > > > standard
> > > mode?
> > > > > > > > If not, it should be the user who selects what type of
> > > > > > > > keys to be
> > > used.
> > > > > > > > Enforcing this via DT is not a way to go.
> > > > > > > >
> > > > > > >
> > > > > > > Unfortunately, that support is not there yet. When you say
> > > > > > > user, do you mean to have it as a filesystem mount option?
> > > > > >
> > > > > > During cryptsetup time. When running e.g. cryptsetup I, as a
> > > > > > user, would like to be able to use either a hardware-wrapped
> > > > > > key or a
> > > standard key.
> > > > > >
> > > > >
> > > > > What we are looking for with these patches is for
> > > > > per-file/folder
> > > encryption using fscrypt policies.
> > > > > Cryptsetup to my understanding supports only full-disk , and
> > > > > does not support FBE (File-Based)
> > > >
> > > > I must admit, I mostly used dm-crypt beforehand, so I had to look
> > > > at fscrypt now. Some of my previous comments might not be fully
> > > > applicable.
> > > >
> > > > > Hence the idea here is that we mount an unencrypted device (with
> > > > > the inlinecrypt option that indicates inline encryption is
> > > > > supported) And
> > > specify policies (links to keys) for different folders.
> > > > >
> > > > > > > The way the UFS/EMMC crypto layer is designed currently is
> > > > > > > that, this information is needed when the modules are loaded.
> > > > > > >
> > > > > > > https://lore.kernel.org/all/20231104211259.17448-2-ebiggers@
> > > > > > > kern el.org /#Z31drivers:ufs:core:ufshcd-crypto.c
> > > > > >
> > > > > > I see that the driver lists capabilities here. E.g. that it
> > > > > > supports HW-wrapped keys. But the line doesn't specify that
> > > > > > standard
> > > keys are not supported.
> > > > > >
> > > > >
> > > > > Those are capabilities that are read from the storage controller.
> > > > > However, wrapped keys Are not a standard in the ICE JEDEC
> > > > > specification, and in most cases, is a value add coming from the =
SoC.
> > > > >
> > > > > QCOM SOC and firmware currently does not support both kinds of
> > > > > keys in
> > > the HWKM mode.
> > > > > That is something we are internally working on, but not available=
 yet.
> > > >
> > > > I'd say this is a significant obstacle, at least from my point of
> > > > view. I understand that the default might be to use hw-wrapped
> > > > keys, but it should be possible for the user to select non-HW keys
> > > > if the ability to recover the data is considered to be important.
> > > > Note, I'm really pointing to the user here, not to the system
> > > > integrator. So using DT property or specifying kernel arguments to
> > > > switch between these modes is not really an option.
> > > >
> > > > But I'd really love to hear some feedback from linux-security
> > > > and/or linux-fscrypt here.
> > > >
> > > > In my humble opinion the user should be able to specify that the
> > > > key is wrapped using the hardware KMK. Then if the hardware has
> > > > already started using the other kind of keys, it should be able to
> > > > respond with -EINVAL / whatever else. Then the user can evict
> > > > previously programmed key and program a desired one.
> > > >
> > > > > > Also, I'd have expected that hw-wrapped keys are handled using
> > > > > > trusted keys mechanism (see security/keys/trusted-keys/).
> > > > > > Could you please point out why that's not the case?
> > > > > >
> > > > >
> > > > > I will evaluate this.
> > > > > But my initial response is that we currently cannot communicate
> > > > > to our TPM directly from HLOS, but goes through QTEE, and I
> > > > > don't think our qtee currently interfaces with the open source
> > > > > tee driver. The
> > > interface is through QCOM SCM driver.
> > > >
> > > > Note, this is just an API interface, see how it is implemented for
> > > > the CAAM hardware.
> > > >
> > >
> > > The problem is that this patchset was sent out without the patches
> > > that add the block and filesystem-level framework for
> > > hardware-wrapped inline encryption keys, which it depends on.  So
> > > it's lacking context.  The proposed framework can be found at
> > > https://lore.kernel.org/linux-
> > > block/20231104211259.17448-1-ebiggers@kernel.org/T/#u
> > >
> >
> > I have only been adding the fscryp patch link as part of the cover lett=
er - as
> a dependency.
> > https://lore.kernel.org/all/20240617005825.1443206-1-quic_gaurkash@qui
> > cinc.com/ If you would like me to include it in the patch series
> > itself, I can do that as well.
> >
>=20
> I think including all prerequisite patches would be helpful for reviewers=
.

Noted. I'll do that for the next patch.

>=20
> Thanks for continuing to work on this!
>=20
> I still need to get ahold of a sm8650 based device and test this out.  Is=
 the
> SM8650 HDK the only option, or is there a sm8650 based phone with
> upstream support yet?

There are some devices released with SM8650 (Snapdragon 8 Gen 3). Sorry, I =
have
not kept track of which. I know the S24s were released with that. But there=
 should be
more in the market.

>=20
> - Eric

