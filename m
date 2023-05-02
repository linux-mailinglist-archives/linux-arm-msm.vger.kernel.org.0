Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EED16F4962
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 19:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233523AbjEBR7C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 13:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233943AbjEBR6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 13:58:48 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7774511D;
        Tue,  2 May 2023 10:58:46 -0700 (PDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 342Hp0jb024052;
        Tue, 2 May 2023 17:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=621oHKV9Q4q3NojmG6Twv6Ayhy6gzgsdLbpEBdHVwnE=;
 b=RGpeH+7Spx3pccPx3n9bfSCmCQ+mcHv5kqAStsFG5zdqKnoxzqdfzAYTXWtk7be8McxO
 UQZuX9SdrxLl4NUmNPHgm2ATGbTPfhEeyO8DKSUDZGo4EImBN22KsuO0WHFJ46vyRokR
 bbTDbNhF/pUUMxSGHgNw44E0ePh1akr2G+6uuv1pCAda2hsSJ4YXw6Xd78xwcodys9fZ
 cOZOMmIm/8Or3YW9LyCcwLkMBEIYOtUKXeQSO95k4p/+1LlweFTK7vOpCGGfKV7Y6z1O
 UWy0X6TlofXlAYbHPAVuNxcyR4OlOppaJW1xxxrHkNLWvUdNl+4KcVNxf0ngQkigltly 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qb79g85he-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 May 2023 17:58:01 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 342Hs8Hv032494;
        Tue, 2 May 2023 17:58:00 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qb79g85g0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 May 2023 17:57:59 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 341LC9Kf005173;
        Tue, 2 May 2023 17:57:56 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
        by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3q8tv6sr55-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 May 2023 17:57:56 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
        by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 342HvqTe6816504
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 2 May 2023 17:57:52 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id AC9B320043;
        Tue,  2 May 2023 17:57:52 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E163420040;
        Tue,  2 May 2023 17:57:50 +0000 (GMT)
Received: from [9.171.18.35] (unknown [9.171.18.35])
        by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
        Tue,  2 May 2023 17:57:50 +0000 (GMT)
Message-ID: <619e2ae66038da313b68c0f5d16e97984aebe5e6.camel@linux.ibm.com>
Subject: Re: [PATCH 03/20] iommu/s390: Replace set_platform_dma_ops() with
 IOMMU_DOMAIN_PLATFORM
From:   Niklas Schnelle <schnelle@linux.ibm.com>
To:     Jason Gunthorpe <jgg@nvidia.com>, Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Steven Price <steven.price@arm.com>
Date:   Tue, 02 May 2023 19:57:50 +0200
In-Reply-To: <3-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
References: <3-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _cF4FTDgqHBuVmSLzSX027-cXWersI4c
X-Proofpoint-ORIG-GUID: 9v3VgFcH_fMov5DWIp_KQp1O0YfHLmEi
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-02_10,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305020151
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 2023-05-01 at 15:02 -0300, Jason Gunthorpe wrote:
> This is temporary until the S390 dma-iommu.c conversion is merged.

For anyone wanting to accelerate the conversion. Comments, testing and
reviews for the current version of my dma-iommu.c conversion patches is
welcome and the single flush queue thing might even give others
(virtio-iommu?) performance benefits:
https://lore.kernel.org/linux-iommu/20230310-dma_iommu-v8-0-2347dfbed7af@li=
nux.ibm.com/

>=20
> s390 is actually moving the dma_ops over to platform control.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/s390-iommu.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
> index fbf59a8db29b11..f0c867c57a5b9b 100644
> --- a/drivers/iommu/s390-iommu.c
> +++ b/drivers/iommu/s390-iommu.c
> @@ -142,14 +142,31 @@ static int s390_iommu_attach_device(struct iommu_do=
main *domain,
>  	return 0;
>  }
>=20=20
> -static void s390_iommu_set_platform_dma(struct device *dev)
> +/*
> + * Switch control over the IOMMU to S390's internal dma_api ops
> + */
> +static int s390_iommu_platform_attach(struct iommu_domain *platform_doma=
in,
> +				      struct device *dev)
>  {
>  	struct zpci_dev *zdev =3D to_zpci_dev(dev);
>=20=20
> +	if (!zdev->s390_domain)
> +		return 0;
> +
>  	__s390_iommu_detach_device(zdev);
>  	zpci_dma_init_device(zdev);
> +	return 0;
>  }
>=20=20
> +static struct iommu_domain_ops s390_iommu_platform_ops =3D {
> +	.attach_dev =3D s390_iommu_platform_attach,
> +};
> +
> +static struct iommu_domain s390_iommu_platform_domain =3D {
> +	.type =3D IOMMU_DOMAIN_PLATFORM,
> +	.ops =3D &s390_iommu_platform_ops,
> +};
> +
>  static void s390_iommu_get_resv_regions(struct device *dev,
>  					struct list_head *list)
>  {
> @@ -428,12 +445,12 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
>  }
>=20=20
>  static const struct iommu_ops s390_iommu_ops =3D {
> +	.default_domain =3D &s390_iommu_platform_domain,
>  	.capable =3D s390_iommu_capable,
>  	.domain_alloc =3D s390_domain_alloc,
>  	.probe_device =3D s390_iommu_probe_device,
>  	.release_device =3D s390_iommu_release_device,
>  	.device_group =3D generic_device_group,
> -	.set_platform_dma_ops =3D s390_iommu_set_platform_dma,
>  	.pgsize_bitmap =3D SZ_4K,
>  	.get_resv_regions =3D s390_iommu_get_resv_regions,
>  	.default_domain_ops =3D &(const struct iommu_domain_ops) {

Looks good to me and I think semantically this is a good use of an
IOMMU domain type.

Reviewed-by: Niklas Schnelle <schnelle@linux.ibm.com>
