Return-Path: <linux-arm-msm+bounces-20160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BB98CB446
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 21:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53C2C1F23702
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 19:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2A914900A;
	Tue, 21 May 2024 19:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Pkbco3y6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2326E4DA0C;
	Tue, 21 May 2024 19:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716319921; cv=none; b=CtcVwWjciMeOjY4grE1xRO+dyv1YsKHc7lv5ouU+HBq5Jz/7XA1cfgWj3SDDYtXY2uV3dFS2lctMNTXgsr7EiWIIPzUmhp2cODczKVkhZnLvOWpnkcNDkVgXmolfYt/7ggAwFyG3RBs2dnkMkmV+nkdeSB3/1lDifLzeAmlUN9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716319921; c=relaxed/simple;
	bh=dWsaF3fXnqJ3Lo3ahHxZsF0a4RYlQNTPZ4CrlBsRjrs=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVprFIJ9crMXS3UcgoS0kInib9Bh/gai4frgDvnjKXn4UbWo8LM05MOEafqOn19zdCq2t8Zqhx4dWjPs02F1vsrBHD6vzbVs5fuCtTiXw9Om4GsLmCy+SxaRHehvhuqcAi0g8aBvG5Jihu2UOMeZo3RcYLTe3MxYFfnbtyKQWDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Pkbco3y6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LDhWaI030957;
	Tue, 21 May 2024 19:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=qcppdkim1; bh=pbxD5jbITQDkC2G4CyjGc
	2HQt7vTrpwI23mCih9xWWY=; b=Pkbco3y6ju7GUOPd5bR5BFQckDVVBzFkurG0J
	y8I6BXgI5zL8N8ddmkxMZ/+6A9v0D+rEEQN2CusOKgN67OvC70Yosbt+bGawmXCY
	QlwsWRq94r4ETCfej5wd/CQ9vFTUxDGQeCcfvCkDRo7TCs6mXBf73cxrm0V6JAuq
	41dPOCERLCWarBD5gxELj3upajN4cGp8LPhHBncaLd5lp8Hxqm+yVjF6sKDBOTYV
	/UJRWxsPJ/nnq7eumasJs/gn6PhwqKnxNm2HjpTsnZccq7SSe9X0nVm8LZqktres
	d+pcYdo+BoUORQi92RpZX6UM1x6aciVezgKwmA9wPdIjerMVQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pqc74fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 19:31:55 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44LJVs8g017276
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 19:31:54 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 21 May 2024 12:31:54 -0700
Date: Tue, 21 May 2024 12:31:53 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: Mukesh Ojha <quic_mojha@quicinc.com>
CC: Elliot Berman <quic_eberman@quicinc.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: qcom_scm: Give page_aligned size for dma api's
Message-ID: <Zkz2qRr9QnjL1Yg5@hu-bjorande-lv.qualcomm.com>
References: <1715887976-1288-1-git-send-email-quic_mojha@quicinc.com>
 <20240516131759140-0700.eberman@hu-eberman-lv.qualcomm.com>
 <a39b3b85-8abe-52fd-e4b9-81720ffcd6a1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a39b3b85-8abe-52fd-e4b9-81720ffcd6a1@quicinc.com>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OH5TJ6BjTnjoMfpoKhX33PrHCfVswpf2
X-Proofpoint-GUID: OH5TJ6BjTnjoMfpoKhX33PrHCfVswpf2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_12,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210147

On Mon, May 20, 2024 at 05:55:49PM +0530, Mukesh Ojha wrote:
> Thanks for the review..
> 
> On 5/17/2024 1:58 AM, Elliot Berman wrote:
> > On Fri, May 17, 2024 at 01:02:56AM +0530, Mukesh Ojha wrote:
> > > If we disable CONFIG_ZONE_DMA32 to make the selection of DMA
> > > memory from higher 4GB range. dma_alloc_coherant() api usage
> >                                  dma_alloc_coherent()
> > > inside qcom_scm_pas_init_image() which usage scm 32bit device
> > > will fail for size of data passed less than PAGE_SIZE and
> > > it will fallback to buddy pool to allocate memory from which
> > > will fail.
> > 
> > I interpreted this as:
> > 
> > When CONFIG_ZONE_DMA32 is disabled, dma_alloc_coherent() fails when size
> > is < PAGE_SIZE. qcom_scm_pas_init_image() will fail to allocate using > dma_alloc_coherent() and incorrectly fall back to buddy pool.
> > 
> > This justification seems incorrect to me. None of the other
> > dma_alloc_coherent() users are page-aligning their requests in scm
> > driver. Is something else going on?
> 
> For SCM protection, memory allocation should be physically contiguous, 4K
> aligned and non-cacheable to avoid XPU violations as that is the
> granularity of protection to be applied from secure world also what if,
> there is a 32-bit secure peripheral is going to access this memory which
> for some SoCs and some not.
> 
> So, we wanted to keep this common and align across multiple SoCs to do
> the allocation from CMA and add a pad to the memory passed to secure world
> Also, this also enables us to keep CONFIG_ZONE_{DMA|DMA32} disabled which is
> a significant overhead.
> 
> > 
> > > 
> > > Convert the size to aligned to PAGE_SIZE before it gets pass
> > > to dma_alloc_coherant(), so that it gets coherant memory in
> >       dma_alloc_coherent                    coherent
> > > lower 4GB from linux cma region.
> > > 
> > > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > > ---
> > >   drivers/firmware/qcom/qcom_scm.c | 8 +++++---
> > >   1 file changed, 5 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > > index 029ee5edbea6..6616048f1c33 100644
> > > --- a/drivers/firmware/qcom/qcom_scm.c
> > > +++ b/drivers/firmware/qcom/qcom_scm.c
> > > @@ -562,6 +562,7 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
> > >   int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> > >   			    struct qcom_scm_pas_metadata *ctx)
> > >   {
> > > +	size_t page_aligned_size;
> > >   	dma_addr_t mdata_phys;
> > >   	void *mdata_buf;
> > >   	int ret;
> > > @@ -579,7 +580,8 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> > >   	 * data blob, so make sure it's physically contiguous, 4K aligned and
> > >   	 * non-cachable to avoid XPU violations.
> > >   	 */
> > > -	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
> > > +	page_aligned_size = PAGE_ALIGN(size + PAGE_SIZE);
> > 
> > Isn't PAGE_ALIGN(size) good enough? Why do you need to round up to the
> > 2nd page? Maybe you thought PAGE_ALIGN was PAGE_ALIGN_DOWN ?
> 
> No, this was intentional as there is a check inside
> dma_alloc_contiguous() call for a size <= PAGE_SIZE .
> 

Sure, but as Elliot points out PAGE_ALIGN(x) for X <= PAGE_SIZE is
PAGE_SIZE, so you wouldn't pass a value < PAGE_SIZE to the function.

That said, here you say <= PAGE_SIZE and in commit message you say "less
than PAGE_SIZE"...


If you need this to be 2 pages, it needs to be vary clearly documented,
to avoid having future readers fixing what looks like a bug.

Regards,
Bjorn

