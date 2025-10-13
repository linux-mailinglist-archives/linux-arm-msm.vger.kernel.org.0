Return-Path: <linux-arm-msm+bounces-76962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D94FCBD263A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 11:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0375F1887656
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 09:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88508246797;
	Mon, 13 Oct 2025 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Qw+WLgxe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AE5239E63;
	Mon, 13 Oct 2025 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760349282; cv=none; b=k515P7/oAUjZm08PcSAozNO/PKbMLkmi/nEaCYKbUPuRWNFJNiDvYi3riJvfgrO0XgtEZefNbamVIl9j24KBv7hVJZ+BIslWjONNOpfpXKr+i6ndEKfvPnZen9j3IPR/Z9J18L+ZX3ZMrgxE7tTsGs4oed7ywZQ/t35y/fnaCZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760349282; c=relaxed/simple;
	bh=OFh9hDOVFllt2rVDIRFxQ9NT7M4HjzwSQAiZb7BddRI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z9dzKn7AnsTyiA8t+LMX4gdV/SBkI0xyvK9tbYoaa4J58gvsi/th9aoqk/hiXWabvHZuCH2ATe2K/FE91cBG83k+3yDBx3l64NNMeqHPYL9V2M89Xv6p0C+aqZ5G4ZXqQ1FJuUaOO1Ldj6Hi0SNvwnhy5bnaGP7Kd/kMsi8r9+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Qw+WLgxe; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CItNjC016803;
	Mon, 13 Oct 2025 09:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Z4zvsJ
	gRbqk2uOgXGdCBLemP+s3D2MhNTErwRnrv45Y=; b=Qw+WLgxeXvUW6V8iM0+k6s
	kA3H6QLObi5JJmvPMKCOtXTlnNKd60rJxP/orofeYoab9gjCaxJP7GQMccIJbVCw
	64Tuei/2QQByB/2ZrCglB7QWowuw2LqoGHtcUZeogLriSmjlKmsPMlcDrBIIy7yi
	MAmE+24pxTfxq53q51aq7ggsbbV59cJHtnwkIgO491yKyam5VyiMTAOLP3UtzXNZ
	Q8OLEuVCXh09frmVwZ7qsJni+ZlH4osUl7uqoMUpjA4aH5r6uh3CTW2Kg1gegmzZ
	q3or63P3s9ZlhuhF1+X0EjI5goxMTHroXjCowhFaDNzPNhTWXe+tEp6LKoirTq0w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qewtr6rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 09:54:04 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59D9s3j8013035;
	Mon, 13 Oct 2025 09:54:03 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qewtr6rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 09:54:03 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59D99IXs015178;
	Mon, 13 Oct 2025 09:54:02 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 49r1jrwdnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 09:54:02 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59D9s17c33096440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Oct 2025 09:54:01 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB3AA5805E;
	Mon, 13 Oct 2025 09:54:01 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC4D558052;
	Mon, 13 Oct 2025 09:53:55 +0000 (GMT)
Received: from [9.111.15.176] (unknown [9.111.15.176])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Oct 2025 09:53:55 +0000 (GMT)
Message-ID: <5165448792268e184e508a9c76fa0ce382a4a389.camel@linux.ibm.com>
Subject: Re: [PATCH v1 02/20] iommu: Introduce a test_dev domain op and an
 internal helper
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Nicolin Chen <nicolinc@nvidia.com>, joro@8bytes.org, jgg@nvidia.com,
        kevin.tian@intel.com
Cc: suravee.suthikulpanit@amd.com, will@kernel.org, robin.murphy@arm.com,
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
Date: Mon, 13 Oct 2025 11:53:55 +0200
In-Reply-To: <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
References: <cover.1760312725.git.nicolinc@nvidia.com>
	 <32ce256a2ece5d63e99d5858f953586859818ffc.1760312725.git.nicolinc@nvidia.com>
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
X-Proofpoint-GUID: ja8dMn81Ji4yLbr55cE_Ms7S-Y6FhoQZ
X-Authority-Analysis: v=2.4 cv=Kr1AGGWN c=1 sm=1 tr=0 ts=68eccc3c cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=Ikd4Dj_1AAAA:8 a=VnNF1IyMAAAA:8
 a=2r8vE0gUvGf4FGDepHgA:9 a=QEXdDO2ut3YA:10 a=DXsff8QfwkrTrK3sU8N1:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-ORIG-GUID: W_vlSK1gr5FYYE4DJOMkPdPg_D8wMkht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNCBTYWx0ZWRfX5ZHcU7Bp3WCb
 OcOu2OBfw8Sh3iGoeLPLO48LoatK4FR/vYxBENU6+YeNkaHuYg7bQUMAJX9bxXTbHD7H0mZb+TZ
 2m/uxx1NV+Q05fWL3vuFTP0nd7yoRlL5eGr6NzjGUImm95PRC68gGIQocOtzIpmCWriF8QwHXGu
 yUpjQ/l1cBKGzGS5D4xiwB/3T3aYg4Kzoa4AgmbMqzdSwnBpbOF2YCpuuiyG1E7PtdePeweCobZ
 Y5LaAjzvml1CN8wR1K0KIVfjU6FiS7odd8x0PckUi4/xxiigPnm2A5rBbhaCMMOoZ7PWhaZ5Bpm
 WXdkfRFixjkEuyv75YMa5J/HWXNa6/w2gf+ZdwO8oRInZZRVgDaJZb3xjE0iVaZD2aimoYcxXPO
 b9SXrfyC8KmYW8cwpBtmJf1mYePvDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110014

On Sun, 2025-10-12 at 17:04 -0700, Nicolin Chen wrote:
> Add a new test_dev domain op for driver to test the compatibility between
> a domain and a device at the driver level, before calling into the actual
> attachment/replacement of a domain. Support pasid for set_dev_pasid call.
>=20
> Move existing core-level compatibility tests to a helper function. Invoke
> it prior to:
>  * __iommu_attach_device() or its wrapper __iommu_device_set_domain()
>  * __iommu_set_group_pasid()

Should this list also include iommu_deferred_attach()? The code does
include it.

>=20
> And keep them within the group->mutex, so drivers can simply move all the
> sanity and compatibility tests from their attach_dev callbacks to the new
> test_dev callbacks without concerning about a race condition.
>=20
> This may be a public API someday for VFIO/IOMMUFD to run a list of attach
> tests without doing any actual attachment, which may result in a list of
> failed tests. So encourage drivers to avoid printks to prevent kernel log
> spam.
>=20
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/iommu.h |  17 +++++--
>  drivers/iommu/iommu.c | 111 ++++++++++++++++++++++++++++++------------
>  2 files changed, 93 insertions(+), 35 deletions(-)
>=20
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 801b2bd9e8d49..2ec99502dc29c 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -714,7 +714,12 @@ struct iommu_ops {
> =20
>  /**
>   * struct iommu_domain_ops - domain specific operations
> - * @attach_dev: attach an iommu domain to a device
> + * @test_dev: Test compatibility prior to an @attach_dev or @set_dev_pas=
id call.
> + *            A driver-level callback of this op should do a thorough sa=
nity, to

You're missing the word "check" above.

> + *            make sure a device is compatible with the domain. So the f=
ollowing
> + *            @attach_dev and @set_dev_pasid functions would likely succ=
eed with
> + *            only one exception due to a temporary failure like out of =
memory.

Nit: "=E2=80=A6 only one exception =E2=80=A6" / "=E2=80=A6 like out of memo=
ry =E2=80=A6" this sounds a
bit odd to me because on the one hand it's one exception but then also
a group (temporary failures).

Maybe better:
"=E2=80=A6 would likely succeed with only the exception of temporary failur=
es
like out of memory."?

> + *            It's suggested to avoid the kernel prints in this op.
>   *  Return:
>   * * 0		- success
>   * * EINVAL	- can indicate that device and domain are incompatible due t=
o
> @@ -722,11 +727,15 @@ struct iommu_ops {
>   *		  driver shouldn't log an error, since it is legitimate for a
>   *		  caller to test reuse of existing domains. Otherwise, it may
>   *		  still represent some other fundamental problem
> - * * ENOMEM	- out of memory
> - * * ENOSPC	- non-ENOMEM type of resource allocation failures
>   * * EBUSY	- device is attached to a domain and cannot be changed
>   * * ENODEV	- device specific errors, not able to be attached
>   * * <others>	- treated as ENODEV by the caller. Use is discouraged
> + * @attach_dev: attach an iommu domain to a device
> + *  Return:
> + * * 0		- success
> + * * ENOMEM	- out of memory
> + * * ENOSPC	- non-ENOMEM type of resource allocation failures
> + * * <others>	- Use is discouraged
>   * @set_dev_pasid: set or replace an iommu domain to a pasid of device. =
The pasid of
>   *                 the device should be left in the old config in error =
case.
>   * @map_pages: map a physically contiguous set of pages of the same size=
 to
> @@ -751,6 +760,8 @@ struct iommu_ops {
>   * @free: Release the domain after use.
>   */
>  struct iommu_domain_ops {
> +	int (*test_dev)(struct iommu_domain *domain, struct device *dev,
> +			ioasid_t pasid, struct iommu_domain *old);
>  	int (*attach_dev)(struct iommu_domain *domain, struct device *dev,
>  			  struct iommu_domain *old);
>  	int (*set_dev_pasid)(struct iommu_domain *domain, struct device *dev,
>=20
--- snip ---
> @@ -3615,6 +3657,11 @@ int iommu_replace_device_pasid(struct iommu_domain=
 *domain,
>  	ret =3D 0;
> =20
>  	if (curr_domain !=3D domain) {
> +		ret =3D __iommu_domain_test_device(domain, dev, pasid,
> +						 curr_domain);
> +		if (ret)
> +			goto out_unlock;
> +
>  		ret =3D __iommu_set_group_pasid(domain, group,
>  					      pasid, curr_domain);
>  		if (ret)

Apart from the comment and commit description nits mentioned above this
looks good to me.

Reviewed-by: Niklas Schnelle <schnelle@linux.ibm.com>

