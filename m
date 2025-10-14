Return-Path: <linux-arm-msm+bounces-77211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 690E2BD9FA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 16:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 139BB406E01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 14:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1257926E158;
	Tue, 14 Oct 2025 14:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="e+iErGsK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3EF12B94;
	Tue, 14 Oct 2025 14:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760451701; cv=none; b=OrGraQq6fENduQL6wn4q3ZVqCBbieD87eNdJMwHNB3gvVb9VqSVyumGJ62bzgvWmMoiv5280lK+6/O3mv8DWVucyyvGPibCp2gh/+1NIQgNANSLz6E5qcYWi2g8pzn+nadxwzmh3soklmESu6nnvxk4bci7QqRE029C3F/nhq3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760451701; c=relaxed/simple;
	bh=UqzsvwMp3V0i7PDSlVhWanfYCUH2uWNbSf0hNoLES9Q=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lEz7N02rAwNMA0eLxX83OiBxTMFESDCEnEZ1s1kHJNpq9lgWbMVfXh2UKt3suxThBC/aCh8uz6zOxeosUrB6OHVmzmWuRGD9lvGDT+jsQE0B6bibF6x6u2Py4YsIZ4y/Ee6s4N6HWUhGJf62UQMrV1X07MGIYukdFFd0IEReZSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=e+iErGsK; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EB7WPm015294;
	Tue, 14 Oct 2025 14:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2EBKHt
	oFBxc6VeU5knOorwmqOfQ2r5EFkZDTHtXao5E=; b=e+iErGsKOcPSWwqu9PWl+V
	fkDZNS6kdV7P2KCoLq1fa7FBu0rykqEZgBU+rOfEoQHCPSO4ZzAP8Zz900qrEQps
	tkOQzIVN5/KI1gfTqOdHd3M2zoH1vf7mXU8vpYmq1iaemnW78g7AlLmcp9GTlyYc
	yjqv1WmnHnxmQClIlgK/XYpB4D5H0y/juE2t8gq1crr96GS8HgmbyhykU7ddEoNs
	9+ut4mXXV7h37EzEaFNYEEBARSVYr7Gd9axEWeJR2Uike+Qdu91Qg8SHfxKri2/f
	UVY8jSF0EEcuOm4sdu5HQv4d2f6DYvu97LE3nnPTj2P0qWuoSD7EUBq4btwwdsmg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qdnperrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 14:20:54 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59EDwQXc002823;
	Tue, 14 Oct 2025 14:20:53 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qdnperrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 14:20:53 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59ECK0J5015016;
	Tue, 14 Oct 2025 14:20:52 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 49r3sjb467-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 14:20:52 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59EEKput32637650
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Oct 2025 14:20:52 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD13F58045;
	Tue, 14 Oct 2025 14:20:51 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B33958050;
	Tue, 14 Oct 2025 14:20:45 +0000 (GMT)
Received: from [9.152.212.179] (unknown [9.152.212.179])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Oct 2025 14:20:45 +0000 (GMT)
Message-ID: <21f4afb4069489729cf90469abf2d1321ed17bec.camel@linux.ibm.com>
Subject: Re: [PATCH v1 02/20] iommu: Introduce a test_dev domain op and an
 internal helper
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: joro@8bytes.org, jgg@nvidia.com, kevin.tian@intel.com,
        suravee.suthikulpanit@amd.com, will@kernel.org, robin.murphy@arm.com,
        sven@kernel.org, j@jannau.net, jean-philippe@linaro.org,
        robin.clark@oss.qualcomm.com, dwmw2@infradead.org,
        baolu.lu@linux.intel.com, yong.wu@mediatek.com, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, tjeznach@rivosinc.com,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        heiko@sntech.de, mjrosato@linux.ibm.com, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        virtualization@lists.linux.dev, patches@lists.linux.dev
Date: Tue, 14 Oct 2025 16:20:44 +0200
In-Reply-To: <aO01TkkA7ZLDgqXg@Asurada-Nvidia>
References: <cover.1760312725.git.nicolinc@nvidia.com>
	 <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
	 <5165448792268e184e508a9c76fa0ce382a4a389.camel@linux.ibm.com>
	 <aO01TkkA7ZLDgqXg@Asurada-Nvidia>
Autocrypt: addr=schnelle@linux.ibm.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAwNSBTYWx0ZWRfXyPWIZGa5NMw1
 5v70l2Ww8AWvh621mUnLUAYE/ED96Pe5OBNjx+T+yOpOYZKOVbv5c+zNL4MaaidGUUewI4h+RPc
 g0E1F3gK1wLubbLBdsog5mLrvfjitsIwvDRw75KLemF9SeNqT+G/Nuaa8d/vXw6iSbw2kh17CRZ
 8lLEmCLHmxUaCudFgXf/K/0irflo7WFbZpZ1QUigJlnLverbUXD5o/E7tnTxrPgEkC6C4OywGtj
 PQuPcCwTBFc+7x9EPB4tqKNkif80ZpbnF//ZeD1HHYGjalO0z/Y1T7BbNR53Vqzy3t2rP0aEixa
 DKgQERlLbCZoUhlBsi6Ruc63AXeG3F/UsYACHqqLTA9xlaPB1vkKXEQtm6PhTC8grABEzCx0x+p
 Z81k8ypovNnBaN/uwtOLeHGJBdtXyQ==
X-Proofpoint-ORIG-GUID: 8Tn8OuynM52x8dQ7re618PDx0uY-TkIk
X-Proofpoint-GUID: r6fD6B6EQarBaIKpq995teTAJbSfnKM6
X-Authority-Analysis: v=2.4 cv=MoxfKmae c=1 sm=1 tr=0 ts=68ee5c46 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=cyMajOFANgF3YnkSg8AA:9 a=QEXdDO2ut3YA:10 a=DXsff8QfwkrTrK3sU8N1:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110005

On Mon, 2025-10-13 at 10:22 -0700, Nicolin Chen wrote:
> Hi Niklas,
>=20
> On Mon, Oct 13, 2025 at 11:53:55AM +0200, Niklas Schnelle wrote:
> > On Sun, 2025-10-12 at 17:04 -0700, Nicolin Chen wrote:
> > > Add a new test_dev domain op for driver to test the compatibility bet=
ween
> > > a domain and a device at the driver level, before calling into the ac=
tual
> > > attachment/replacement of a domain. Support pasid for set_dev_pasid c=
all.
> > >=20
> > > Move existing core-level compatibility tests to a helper function. In=
voke
> > > it prior to:
> > >  * __iommu_attach_device() or its wrapper __iommu_device_set_domain()
> > >  * __iommu_set_group_pasid()
> >=20
> > Should this list also include iommu_deferred_attach()? The code does
> > include it.
>=20
> iommu_deferred_attach() invokes __iommu_attach_device(), so it is
> already included in the list :)

Ok makes sense, though it does list __iommu_device_set_domain()
separately. Either way is fine for me.

>=20
> > >  /**
> > >   * struct iommu_domain_ops - domain specific operations
> > > - * @attach_dev: attach an iommu domain to a device
> > > + * @test_dev: Test compatibility prior to an @attach_dev or @set_dev=
_pasid call.
> > > + *            A driver-level callback of this op should do a thoroug=
h sanity, to
> >=20
> > You're missing the word "check" above.
>=20
> Ack.
>=20
> > > + *            make sure a device is compatible with the domain. So t=
he following
> > > + *            @attach_dev and @set_dev_pasid functions would likely =
succeed with
> > > + *            only one exception due to a temporary failure like out=
 of memory.
> >=20
> > Nit: "=E2=80=A6 only one exception =E2=80=A6" / "=E2=80=A6 like out of =
memory =E2=80=A6" this sounds a
> > bit odd to me because on the one hand it's one exception but then also
> > a group (temporary failures).
> >=20
> > Maybe better:
> > "=E2=80=A6 would likely succeed with only the exception of temporary fa=
ilures
> > like out of memory."?
>=20
> Sure. I can do that. Fixing both parts, it would be:
>=20
>  * @test_dev: Test compatibility prior to an @attach_dev or @set_dev_pasi=
d call.
>  *            A driver callback of this op should do a thorough sanity ch=
eck, to
>  *            make sure a device is compatible with the domain, so the fo=
llowing
>  *            @attach_dev and @set_dev_pasid functions would likely succe=
ed with
>  *            only the exception of temporary failures like out of memory=
.
>=20

Sounds good, thanks!

