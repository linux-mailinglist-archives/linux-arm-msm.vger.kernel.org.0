Return-Path: <linux-arm-msm+bounces-23994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB48B915150
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 17:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 527AD1F2506D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 15:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9386019B3FB;
	Mon, 24 Jun 2024 15:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fKdA2bs4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32EF19B3EC;
	Mon, 24 Jun 2024 15:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719241464; cv=none; b=lwKvUie+HficMtF4790Fb0Kzihh0j0m9CIz2rnfHwg2yUAPRMQZbgSKYjU0jpFnc1ywP00LE6FzEeo8wxHm4h0HyzGTkjCZ3u9zkBYhQhetFekOsTcdYDtj+YcbckVLnm6S4gmOlhyxhpJRks9j2Nw+1YCToBQrZ18nvLWGoYVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719241464; c=relaxed/simple;
	bh=kZGBVDGJ8A6VbUq6CV4On0a5ZATppp4xByM0cnBSgV0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5v0zbQOMwHve2Zpn8V4w7aj50jGZ/aLDlOBXZbEwcIS7Pzi19wTC8YUqLR2lBzEuioZoeIuhwBjMwr9wRpMj5OPqNNZSF+8e1kHvXZj2L0Jvf956qAaX8lEXHpYSCzIQvrGqsfgyqqoubyHThUDJpSadBKcMZuQmc+qSgYjwLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fKdA2bs4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O8Ys0L009082;
	Mon, 24 Jun 2024 15:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3BGl5wNav3AbcG3aFGo2GYAv
	3QE8C8WHv4bGgxvYjHw=; b=fKdA2bs47fqM/dOaVp367W56+zbY2KGPDfQesTHJ
	qZS1Lea1O8f/zCzHMDnozMeVVN+Q1Se9GQ9ws3X54UmYCinKoLa1eTQfhzpT1vud
	A4hTvK+0YtDNMAByIr1OotnZjPsgibdNRdF22asOvya9iRGMUzNifEuXt2YiMmmP
	i69EQw0yuqUgsVjCUgsDRRT50Hhzql7bvvQR1wsk2wuIRXRFUwZCNlHAQUzLvC69
	zx+aD7FeFT9hLoMG5Ulenzz5Tb7ZG39eWlcj28Yh8HPGV3I/AdRfEpETx6CevtLW
	igdLNVKq4I4C4tHO6lDiemon0r/5NtXUGDXvo4QjgOf8qQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqcebxwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 15:04:18 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45OF4IqM015863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 15:04:18 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Jun 2024 08:04:16 -0700
Date: Mon, 24 Jun 2024 20:34:12 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>
CC: <konrad.dybcio@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] firmware: qcom_scm: Add a padded page to ensure DMA
 memory from lower 4GB
Message-ID: <ZnmK7Nc50gM3HbVI@hu-mojha-hyd.qualcomm.com>
References: <1716564705-9929-1-git-send-email-quic_mojha@quicinc.com>
 <h6omxqre7pod3ztn7x3sckjbgcg32u4btfmtxwn2rkjw7uwsgd@ncdmu5ed4gm3>
 <d85bf913-b6dc-e9fd-7c54-fe52b79c2593@quicinc.com>
 <jcvu2irnung4u6v6ticafrqze73kqenpqpy6le6du2q6ag734u@jeqxv5y7pumm>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <jcvu2irnung4u6v6ticafrqze73kqenpqpy6le6du2q6ag734u@jeqxv5y7pumm>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EW54NpJhSkWIwx-NTQFR95zGMGtkfh84
X-Proofpoint-ORIG-GUID: EW54NpJhSkWIwx-NTQFR95zGMGtkfh84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_11,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=993
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406240121

On Sun, Jun 23, 2024 at 07:25:23PM -0500, Bjorn Andersson wrote:
> On Wed, May 29, 2024 at 05:24:29PM GMT, Mukesh Ojha wrote:
> > 
> > 
> > On 5/27/2024 2:16 AM, Bjorn Andersson wrote:
> > > On Fri, May 24, 2024 at 09:01:45PM GMT, Mukesh Ojha wrote:
> > > > For SCM protection, memory allocation should be physically contiguous,
> > > > 4K aligned, and non-cacheable to avoid XPU violations. This granularity
> > > > of protection applies from the secure world. Additionally, it's possible
> > > > that a 32-bit secure peripheral will access memory in SoCs like
> > > > sm8{4|5|6}50 for some remote processors. Therefore, memory allocation
> > > > needs to be done in the lower 4 GB range. To achieve this, Linux's CMA
> > > > pool can be used with dma_alloc APIs.
> > > > 
> > > > However, dma_alloc APIs will fall back to the buddy pool if the requested
> > > > size is less than or equal to PAGE_SIZE. It's also possible that the remote
> > > > processor's metadata blob size is less than a PAGE_SIZE. Even though the
> > > > DMA APIs align the requested memory size to PAGE_SIZE, they can still fall
> > > > back to the buddy allocator, which may fail if `CONFIG_ZONE_{DMA|DMA32}`
> > > > is disabled.
> > > 
> > > Does "fail" here mean that the buddy heap returns a failure - in some
> > > case where dma_alloc would have succeeded, or that it does give you
> > > a PAGE_SIZE allocation which doesn't meeting your requirements?
> > 
> > Yes, buddy will also try to allocate memory and may not get PAGE_SIZE memory
> > in lower 4GB(for 32bit capable device) if CONFIG_ZONE_{DMA|DMA32} is
> > disabled.
> 
> Is that -ENOMEM or does "not get" mean that the buddy fallback will
> provide an allocation above 4GB?

dma_alloc_coherent() returns NULL in that situation.

https://elixir.bootlin.com/linux/v6.10-rc5/source/kernel/dma/direct.c#L142

-Mukesh

> 
> Regards,
> Bjorn
> 
> > However, DMA memory would have successful such case if
> > padding is added to size to cross > PAGE_SIZE.
> > 
> > > 
> > >  From this I do find the behavior of dma_alloc unintuitive, do we know if
> > > there's a reason for the "equal to PAGE_SIZE" case you describe here?
> > 
> > I am not a memory expert but the reason i can think of could be, <=
> > PAGE_SIZE can anyway possible to be requested outside DMA coherent api's
> > with kmalloc and friends api and that could be the reason it is falling
> > back to buddy pool in DMA api.
> > 
> > -Mukesh

