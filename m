Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9714D7029B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 11:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237954AbjEOJ4y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 05:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239965AbjEOJ4b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 05:56:31 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 869A41BE5;
        Mon, 15 May 2023 02:56:26 -0700 (PDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34F9kL9E004814;
        Mon, 15 May 2023 09:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=c69QNR7lfIqB6FKiUIhsojT+MsFH8qH65PiA7hty3/w=;
 b=XedJ+r9zfgtSzDIB4eSrPCYm0wWx4qeblaLActQ5QVrHh2HEZP56wPCN6nRfdD4hHuiP
 EhfoiT0R911OpM43d3K1kk0me4DLgXWV8s+zqgbHPChfQ3FYX4z+56AT5PA4aVx+B9K3
 S2qnW7+htzYKc4tFSAOQn6w6QayRbwJWQ5RN51Dqjzw/xNYJQr+c0ErxHoNskgUl8DFd
 yHHBmnlnMxV8YENBqZIFU66wF7Pf9Kv8sUifi612DboAhSZ7gyThFuv1UtnbRg8omvaJ
 FcXo0FBL1z6F1hLhK8K2P8bnpEOnHfIw7A8h7ehhYGnNcX/9/f9uXq9zPPOPPG4PGrtc 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qkd3mswqh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 15 May 2023 09:55:53 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34F9bqmA009076;
        Mon, 15 May 2023 09:55:51 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qkd3mswp5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 15 May 2023 09:55:51 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
        by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34F8Tiqw000411;
        Mon, 15 May 2023 09:33:32 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
        by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3qj264rtm2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 15 May 2023 09:33:32 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
        by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34F9XTPL45744626
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 15 May 2023 09:33:29 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E664720040;
        Mon, 15 May 2023 09:33:28 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 413B62004B;
        Mon, 15 May 2023 09:33:26 +0000 (GMT)
Received: from [9.171.65.23] (unknown [9.171.65.23])
        by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
        Mon, 15 May 2023 09:33:26 +0000 (GMT)
Message-ID: <670b01819f6f875364abaafa4accad9fa92e6177.camel@linux.ibm.com>
Subject: Re: [PATCH v8 0/6] iommu/dma: s390 DMA API conversion and optimized
 IOTLB flushing
From:   Niklas Schnelle <schnelle@linux.ibm.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        Wenjia Zhang <wenjia@linux.ibm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Gerd Bayer <gbayer@linux.ibm.com>,
        Julian Ruess <julianr@linux.ibm.com>,
        Pierre Morel <pmorel@linux.ibm.com>,
        Alexandra Winter <wintera@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-s390@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-doc@vger.kernel.org
Date:   Mon, 15 May 2023 11:33:25 +0200
In-Reply-To: <ZF5NRls92rhmzV7B@infradead.org>
References: <20230310-dma_iommu-v8-0-2347dfbed7af@linux.ibm.com>
         <ZF5NRls92rhmzV7B@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bs2KpFYuwoCp6-aBJBUXDadSE7HNCIPx
X-Proofpoint-ORIG-GUID: d9-xVIyzWKoF0UTrrDTDDfGL5QDVi9C0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_06,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 clxscore=1011
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150082
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 2023-05-12 at 07:29 -0700, Christoph Hellwig wrote:
> On Fri, Mar 10, 2023 at 05:07:45PM +0100, Niklas Schnelle wrote:
> > Hi All,
> >=20
> > This patch series converts s390's PCI support from its platform specifi=
c DMA
> > API implementation in arch/s390/pci/pci_dma.c to the common DMA IOMMU l=
ayer.
> > The conversion itself is done in patches 3-4 with patch 2 providing the=
 final
> > necessary IOMMU driver improvement to handle s390's special IOTLB flush
> > out-of-resource indication in virtualized environments. Patches 1-2 may=
 be
> > applied independently. The conversion itself only touches the s390 IOMM=
U driver
> > and s390 arch code moving over remaining functions from the s390 DMA AP=
I
> > implementation. No changes to common code are necessary.
>=20
> It looks like this still hasn't made it upstream as of 6.4-rc1.  What's
> holding this series up?
>=20

I think with all the IOMMUFD work going on this got starved out of
reviewer resources. I didn't have any open todos but I guess there is
still some review needed around how the IOMMU driver tells the dma-
iommu that it expects IOTLB flushes to be slow requiring a larger
single flush queue. There was also a small conflict with commit
49a22aae7d9c ("iommu: Replace device_lock() with group->mutex") that
prevented this from applying to current upstream so I've just now sent
out a v9 rebased on v6.4-rc2.

Thanks,
Niklas
