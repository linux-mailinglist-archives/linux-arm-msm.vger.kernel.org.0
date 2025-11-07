Return-Path: <linux-arm-msm+bounces-80775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C17C4005E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 14:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70EAC3A8D75
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 13:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD3228980E;
	Fri,  7 Nov 2025 13:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dOEPCMAO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RZVuY1Vg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9AC2765C5
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 13:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762520667; cv=none; b=m6MzL17EcH+EFZ9/R3VmE3JcqSa6nrG9ZexWsH+LKcVqfBiRJrsUab0E6D6aoncsIoMzkanyXlESr1lUVOTdHM0ljbDFq7yUEPzCwryHsfCnm2FCpkq6iob+5Y5pOZ+En0dOZpHDADISCieCik07HK5kMX4sZyBbMpO26iaOVS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762520667; c=relaxed/simple;
	bh=Ted6AZIFVphD/F8lSCH5ehpbw5jTq6uqRnlR0itDLB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EX091FGpAOgVg/3cVHsvBTIiuNTQevLg/YpC/uxMCyl1nLis/Qbgaj6k1x5o/kgJ8ClQt2YmXG7Q9IoSM7R/2nPohZKi4FHlE+tmOhUB03bFqHm+fTH6Siyl3axhisA2aQGMBxYN5qBRWNw/0xVgyrxVWsw9uuLoNZEa8QtClbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dOEPCMAO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RZVuY1Vg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7B2T0g3040964
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 13:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kS3XC1Ni5FhZbMpzDDtKCVF4
	F8GiZA0Y/05CysERk9o=; b=dOEPCMAOWcaga3C0izeYIoAFzPyuTV4xY26zcPJs
	Qb7yBGTQJtPvcTOvIGeHngbVgkDiarDyJo5lpZB521OpGqVSDzKmImHI89QeNTCJ
	7FzvZDuPbEgYrZrWNFPx/ytCJY4NzMD5o9yZ9k2S6UIKVdebMGGx08KFq9z/A0nU
	m4CUAR8GY5nYJRdymkSKMcCKdkPIKh3VodflxwMwrPt4+RvYxmu/YvXKxt+XkQ5I
	kopDLn2WqGjkh65qcsKTwju3ws8CcfNyRZKxkrbR97wB7KgCG8QeU0lrhLb19C1I
	mMBGZ51SektIaBaBAO84WO1HbDma5yTis8yqQ9laZuiFsw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9fj089ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 13:04:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b969f3f5bb1so1666586a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 05:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762520664; x=1763125464; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kS3XC1Ni5FhZbMpzDDtKCVF4F8GiZA0Y/05CysERk9o=;
        b=RZVuY1Vg+Sra5fDKGuXWEyDuMQAc4zbkdxIBxCYWJRxupi+KlGZ74Li82mxeRGQpit
         9fOib18OB0mkSfpoJs3aTQkXgDDqmlhPGd0rPl2UWrE4pPxoYN+aij359Um+DAAQ/wSq
         KPqdmfKn8ap+NwE6SPKCvqrtJxhI5Ih94gwS2s9vs6b6naZOLYTgUxLli9JyzCBgWf94
         72SSb0HTTcpBw7GZJv7dwYWDC8mwrxyfboe2tRi/BtpEE0d0uuYIDZf5GowEaFsij7M5
         DBUa5df0pk78AmT6uup12VWsGpL5CcHV7oFm2m1w9P7KgKHHOhOAHB0oB8FN6NyAAO1B
         j7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762520664; x=1763125464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kS3XC1Ni5FhZbMpzDDtKCVF4F8GiZA0Y/05CysERk9o=;
        b=I0aDEAgvv53TK76eET1xte+nmwT6kODnEHQJRR0TVdMjH3wWXbmN4Tic9pG6fs/4Vz
         mVAUY14C7HsQpjEZFYsXG3f42dKXG3c4ehEJuTEm3Ru6inaBMo035h9NovefSIRsU+ad
         VbuE3EZjPKUtsYARhbDtV3yQaH+IFY8NvOuCc35A9NMxUYiKbDmPOVsHOCyfGgJKKdVp
         vzQ8IJdAy/rffsdAZlb68e6lZl8mFVDg9p8iy3tQzi7q7fePDId5sZo1Vnst+Mv06HaT
         rxCsM1P7oB9pdGkWjHTVBU3PfHDy69dC2GmWwLmWJKHKX4PAjXLs8f8vcoZyS/0PgDoE
         3tYA==
X-Forwarded-Encrypted: i=1; AJvYcCUGhcWOpMkP0aLuaY8HOAiI9OnHd/x2XZ22ixOE319jYnheDbwYlDrA04FxFiADmImAy7kfEhqTFc5esArB@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc4SSMe8LUvpXzmnNWrrUwdypecotFGJZNIE7S5Nrxbblb3v4Y
	sbST8gXKduXIYFBqj7mazCeLO1HTCMW8Skfy3CH/teumMnCFSaiOFuijYzDQ17LeYoen4IZUbuO
	FGW/Pi2YdMMbt7yXy7ZDeEIG6f485Uo4r9LKEq3boXFU/ZWUZq/Ll74Nfs9d2jzf0VsIY
X-Gm-Gg: ASbGncueDm6xfs4Xnd4uL/5iJOQOUtH3AG9T/l4nePYAyS2+Nf4Yki9E4f6AnsamHAR
	l1aYx5U17c+iG1aan7ZJGSsLWK009AoZlzbUWyCA1NsY+lLLnOzM4bB4/YUMSHsnmNJcdpEJFqE
	V5bv3l/el1mGlKfEWA8f/DTyBPhGuVafGiPu8iqvISlJ/YXCr4i769TeAK1YE8bas3u/DCRlmgB
	a35pC6J+ZV7JpKwqj13i/qUm2D9GPX0rvVC7k9tR6z6ARSAUvb3sQVZwGvXhR7yImwbSjy7hF2e
	0T42APPIKor8IvTNv0e1Zan6PqOmq2qupEk2c7nu4jBe4y5AY0voITZ+hw9oIhnHuoDJh7son6D
	C01ly1x3ZQsNijLZ94vSjqv6B2w==
X-Received: by 2002:a17:902:d488:b0:296:5b82:abb8 with SMTP id d9443c01a7336-297c03e87edmr41728175ad.25.1762520663672;
        Fri, 07 Nov 2025 05:04:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHDi3VCG+jeQPZKjaDhNHY0E8KIkUAIShvjAZuhx0bHnqGMm1WhD/k5gY8hxa9TPWGiaTBl1A==
X-Received: by 2002:a17:902:d488:b0:296:5b82:abb8 with SMTP id d9443c01a7336-297c03e87edmr41727605ad.25.1762520663029;
        Fri, 07 Nov 2025 05:04:23 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953e791sm3028775b3a.7.2025.11.07.05.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 05:04:22 -0800 (PST)
Date: Fri, 7 Nov 2025 18:34:16 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 10/14] firmware: qcom_scm: Add SHM bridge handling for
 PAS when running without QHEE
Message-ID: <20251107130416.owdceicrivofyfxi@hu-mojha-hyd.qualcomm.com>
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-10-7017b0adc24e@oss.qualcomm.com>
 <7a5d188d-989f-4843-a10d-0fbad94a9ef0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a5d188d-989f-4843-a10d-0fbad94a9ef0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=XZyEDY55 c=1 sm=1 tr=0 ts=690dee58 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=HuBIHT5r4gaFfCbWWWsA:9
 a=CjuIK1q_8ugA:10 a=s5zKW874KtQA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=Soy3cZ2v3rD3IzUh-QDm:22 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-ORIG-GUID: kgQ92uslMyMgK1XFk7_OSIv2soD1FpaD
X-Proofpoint-GUID: kgQ92uslMyMgK1XFk7_OSIv2soD1FpaD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDEwNiBTYWx0ZWRfX7mEqQ2ILklRA
 3mv8CbNu35e9+BEQe9nE+NomzTcOjpi2UVmJyzgeuI00KBPgI0JOON+jZElFqZGs7v3Pjxm2fpz
 4qH27m1euJZPDrqL1d3wLjYcIr595fC/sMKCzl8Wrbicgbc7QA9+ZY95nFRkyQIekZydYWca+vl
 NpOBZG/SyfWwW320DedTb/B6r08Gb9MaymOXZTTtuDGCdo6dhh54oFolKC/acDBK+BsyvXp0RKi
 7BxKfBWbleLwRsnurGs+BoZ6CnEnEjBHSXZNFAwraXY4lblM/fQc08odQynQ4V1sYMQHN/kE65x
 xTwZ1b/AH6VI2CQmywaHJOjUISM+1+RXGhVHv2NVuSG92CvpsEV7/ILOTedqg190xvXdeO7bmin
 OWZacO+Kkt+iDgPxangtnVil4Am33Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070106

On Fri, Nov 07, 2025 at 11:17:23AM +0100, Konrad Dybcio wrote:
> On 11/4/25 8:35 AM, Mukesh Ojha wrote:
> > On SoCs running with a non-Gunyah-based hypervisor, Linux must take
> > responsibility for creating the SHM bridge both for metadata (before
> > calling qcom_scm_pas_init_image()) and for remoteproc memory (before
> > calling qcom_scm_pas_auth_and_reset()). We have taken care the things
> > required for qcom_scm_pas_auth_and_reset().
> > 
> > Lets put these awareness of above conditions into
> > qcom_scm_pas_init_image() and qcom_scm_pas_metadata_release().
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c | 35 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 34 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index aabdef295492..9d3e45ec73ac 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -625,6 +625,33 @@ static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys, void *me
> >  	return ret;
> >  }
> >  
> > +static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
> > +					    const void *metadata, size_t size)
> > +{
> > +	struct qcom_scm_pas_metadata *mdt_ctx;
> > +	struct qcom_scm_res res;
> > +	phys_addr_t mdata_phys;
> > +	void *mdata_buf;
> > +	int ret;
> > +
> > +	mdata_buf = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
> > +	if (!mdata_buf)
> > +		return -ENOMEM;
> 
> I'm still a little sour about this function having to be separate just
> because we use a different allocator..
> 
> Did we conclude that using set_dma_ops(some_tzmem_ops) was not going to
> work?

I think, you asked here [1], and we discussed on this. It is not
something plain that we can hook every DMA api to tzmem. This SMC function
or any such buffer which is passed to TZ when QHEE is present, is a
special case as QHEE makes shmbridge and Linux need to do when it is absent. 

are you saying set_dma_ops() every case or just when ctx->has_iommu = true ?
If it is for every case, we will observe crash during call of this
function when we will run with QHEE.

And doing it only for non-gunyah does not make sense..

or let me know if I did not understand your question ?


[1]
http://shc-kerarch-hyd:8080/kernel_archive/ed0b8ec3-035f-4ea4-83ba-8f2aba9ea623@oss.qualcomm.com/


> 
> Konrad

-- 
-Mukesh Ojha

