Return-Path: <linux-arm-msm+bounces-70209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F31B3001A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 18:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE351166749
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 16:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8CF2DECBB;
	Thu, 21 Aug 2025 16:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqDZeuO/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0C52DE1E0
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 16:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755793791; cv=none; b=SQa6eShGzUtwevApwcYK6kbM9ol8mMcpggRRCnnYidzuJj2LWZlHozsr1k0aavsU3ASqIBgcvEtN6FcJN2qY1OXnZ+0EKcegZJsUODIDD4hUWRWoy7m2kXqkDL3wZV2jBYqWh2xNev1hYixfy2GT6dKVKlA8b4BU6i5P3E89x50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755793791; c=relaxed/simple;
	bh=/tbXBa6r0uSu+NPSmXQFYhFY4TeDHvKdeP7yIapjbxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MosCFKmGb18jTmc7uo4xulE9PcQN6TyornCJuxrPpOmfZ/X+2DYxCdAWX6i8v3D46x8gY71SzzR5pp0APiFkz9gtYweFVhI0SZxYNXo/ZMHZHEYuOX2175s15E1jcaUn7glSJDF7kuTtXg1hevQsIOIda6d3nRqBBMTw6I9fKys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqDZeuO/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b7Tr024175
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 16:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zIhKFueIyr4p/yFGjoDpxYA4
	IzoEZUqKsKS0QB3Gip8=; b=gqDZeuO/ilYuppctcwwO5szg9iQ/C7BbwZfK15xn
	m0e6SqLB4lHcjMOIGXfvwxLAqO7lvJOftrIxqwRvG+NizFhk2p1639VdEoXeOJ6Z
	Vl+8QnMjfKyqM3lMiE3LmsYMQuomxMcutivszXLLB76ZveRioNXJy21eKp3rPizx
	VrUZ3rtxp4bC5QMsHZXiN/JuJXaKplsSQgqcjx3JCrDDHOhqteFSwRUD/h3TnhKB
	0H3+FlLLaPkbMoM2PUHuPARZtDdDiBe5Tncjhb7JlWOrbNNA3bovvbbRV6PLyqoN
	1tpq11IPpyEl7Q3ruLhzFAUIvVxyeEuU6VQImJdKYSJZwg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ae5nj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 16:29:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458194d82so13302975ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 09:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755793787; x=1756398587;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zIhKFueIyr4p/yFGjoDpxYA4IzoEZUqKsKS0QB3Gip8=;
        b=ckqjT7X9jxLONGn4xjUpCuml1mGiDQGR7WBeOMCPmVmqiamWv1grrkSSyFATq9FcBZ
         iqYepK4e3ntymjqVCTKHL8DfoZHueyLXbx/vK90sNoXPOXrpQ2BhAzyuTX8nyHKfz3ff
         2o2jeTnDI5E0RBh3Raf7rSPawqpcenq/TaqgMXg0MoEml32O4FPyU4dNVIvuFt2cxPXI
         gTvrewFSfmMCi1+GW53yu7dt3PdcqUhnWa7LY9i0vec33W4bb8KZOsaXe7UjgZ79OUhq
         /IB0IAckC2IC+GQK4WckmmdwmTyPFRSTAttEVt5so+abum/30jytZt9TErjgni5ku33G
         2QGg==
X-Forwarded-Encrypted: i=1; AJvYcCWBn4zNKHYn7m09ZALyc3NYuOy3Y4b9+MDso4qu0RVotoogXPOLE4bEt7/3KO5faJMnuWUwHQwTfvD+/Eaj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7q37ZYA/7qqQD/AQ+fk7jd6V+PGS/t3zP9iKanXHgrML710Bk
	DzaIFt7RaM/HWgm9hptMPlDiNP+5LDvxjrxwpirt8Vh3WXqZ7tp3OQkjCW2S/8I5CDEAwxFYPv6
	9If2CjEs0P6r+4UfHD7j3qbMFFa0Q7fC3yXCpIf4Iy7j0FFL/ccY8wvoHD+OugysdwCM9
X-Gm-Gg: ASbGncvfIcsi3bzT584zm3feUy83NUtO2Z2y1Sn01wqGtoBV24CQRIEuLvzh9PQ8hnr
	heOCrXZ4VMCd5E6ykXRzgrOSHsxYFqUOGXHUWIckiA6alr6owVQ3PQfJMwrNFX7jcujkUGMy3er
	y6iL8hguGQq5Jecjt8A56KP7ZismFQVvkffO73v5NJaG7rWxu70BZvMcjfyghkxvThUKt61Ftey
	3eObA1Oj/SOVnO8okGajP4yGU1w3AeTT1TpRNEGTzD7s0fN4SEP6rppWLbkGQt4Vjqwtyr2xkgC
	95Vt8lKcC3D1QL03nEcxwnDP23+j8Ly2dqnAlgnETlziMxRDOFrwfChWDbxN4MkoIeo=
X-Received: by 2002:a17:902:ebc7:b0:240:3ef:e17d with SMTP id d9443c01a7336-245fedd4260mr47644505ad.40.1755793786805;
        Thu, 21 Aug 2025 09:29:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFztsB+0vyvGfd9GpFN/m6bhvsalSkka7TFzQDwuhyvsOAKhMpUjb0k8uC05DSbFLMBUCGz9Q==
X-Received: by 2002:a17:902:ebc7:b0:240:3ef:e17d with SMTP id d9443c01a7336-245fedd4260mr47643755ad.40.1755793786041;
        Thu, 21 Aug 2025 09:29:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4e9bc2sm59691575ad.113.2025.08.21.09.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 09:29:45 -0700 (PDT)
Date: Thu, 21 Aug 2025 21:59:39 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 04/11] firmware: qcom_scm: Simplify
 qcom_scm_pas_init_image()
Message-ID: <20250821162939.6s5hjsc36bmelmvl@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-5-mukesh.ojha@oss.qualcomm.com>
 <10d91d9d-b6d6-4a83-a697-909f97abc503@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10d91d9d-b6d6-4a83-a697-909f97abc503@linaro.org>
X-Proofpoint-ORIG-GUID: Vyr72TbV5kWipIAZosnLpnyrup8jEdtJ
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a7497b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=oHMyjcGywICXLiFiIg0A:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Vyr72TbV5kWipIAZosnLpnyrup8jEdtJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX/7t6RNHmLjYS
 +wi3szvFdEmDPWzzeB9c6WhVqomrQoKSCbz8OvPPdGc51bviqxYuymoVKLZKwJ3vSGYA7ThppWP
 nHvW9TgOYqMCt9+l8t1s54S3CQ6juJnXfgaaX5VHHWemnPMmyXP92y6j1viOE2/acU/NJ0nhAfM
 vlCQBo10G+NgjAyBdf/n+SRmJi+OUATIQiSrK+H9cnq0zWKI6FAdrwQNuojItUaOwCK1vPDr5t2
 ajm48i/+8yM739R7b91yVIK2z5twZOkx6mZEWVT1YP9uQzRCH8i5YYK4RknClB1/oVXCfpEIZjt
 EfP0jhtb4Q5qJFmz9EUHBK4P7i8qd7ZkB3Kxh8eZ3+o7VppphKtr9xNPokrru6Hm1xh3KA4Ka3Z
 EgOkOi5yQIr9VqcQTCyNojdKMgza9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

On Thu, Aug 21, 2025 at 03:36:26PM +0100, Bryan O'Donoghue wrote:
> On 19/08/2025 17:54, Mukesh Ojha wrote:
> > Simplify qcom_scm_pas_init_image() by making the memory
> > allocation, copy and free work in a separate function
> > then the actual SMC call.
> 
> then is temporal
> than is disjunctive
> 
> you mean than here, not then.

Thanks, its a typo.

> 
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >   drivers/firmware/qcom/qcom_scm.c | 59 ++++++++++++++++++--------------
> >   1 file changed, 34 insertions(+), 25 deletions(-)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 9a5b34f5bacb..7827699e277c 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -584,6 +584,38 @@ void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_
> >   }
> >   EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
> > +static int __qcom_scm_pas_init_image(u32 peripheral, dma_addr_t mdata_phys,
> > +				     void *metadata, size_t size,
> > +				     struct qcom_scm_res *res)
> > +{
> > +	int ret;
> > +	struct qcom_scm_desc desc = {
> > +		.svc = QCOM_SCM_SVC_PIL,
> > +		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
> > +		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
> > +		.args[0] = peripheral,
> > +		.owner = ARM_SMCCC_OWNER_SIP,
> > +	};
> 
> A minor detail but please reverse christmas tree your defintions and try to
> make int ret come last.

Sure.

> 
> > +
> > +	ret = qcom_scm_clk_enable();
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = qcom_scm_bw_enable();
> > +	if (ret)
> > +		goto disable_clk;
> > +
> > +	desc.args[1] = mdata_phys;
> > +
> > +	ret = qcom_scm_call(__scm->dev, &desc, res);
> > +	qcom_scm_bw_disable();
> > +
> > +disable_clk:
> > +	qcom_scm_clk_disable();
> > +
> > +	return ret;
> > +}
> > +
> >   /**
> >    * qcom_scm_pas_init_image() - Initialize peripheral authentication service
> >    *			       state machine for a given peripheral, using the
> > @@ -604,17 +636,10 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
> >   int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> >   			    struct qcom_scm_pas_metadata *ctx)
> >   {
> > +	struct qcom_scm_res res;
> >   	dma_addr_t mdata_phys;
> >   	void *mdata_buf;
> >   	int ret;
> > -	struct qcom_scm_desc desc = {
> > -		.svc = QCOM_SCM_SVC_PIL,
> > -		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
> > -		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
> > -		.args[0] = peripheral,
> > -		.owner = ARM_SMCCC_OWNER_SIP,
> > -	};
> > -	struct qcom_scm_res res;
> >   	/*
> >   	 * During the scm call memory protection will be enabled for the meta
> > @@ -635,23 +660,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> >   	memcpy(mdata_buf, metadata, size);
> > -	ret = qcom_scm_clk_enable();
> > -	if (ret)
> > -		goto out;
> > -
> > -	ret = qcom_scm_bw_enable();
> > -	if (ret)
> > -		goto disable_clk;
> > -
> > -	desc.args[1] = mdata_phys;
> > -
> > -	ret = qcom_scm_call(__scm->dev, &desc, &res);
> > -	qcom_scm_bw_disable();
> > -
> > -disable_clk:
> > -	qcom_scm_clk_disable();
> > -
> > -out:
> > +	ret = __qcom_scm_pas_init_image(peripheral, mdata_phys, mdata_buf, size, &res);
> >   	if (ret < 0 || !ctx) {
> >   		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
> >   	} else if (ctx) {
> 
> With those changes.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

-- 
-Mukesh Ojha

