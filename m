Return-Path: <linux-arm-msm+bounces-111901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FAZ6OrvIJmoVkgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111901-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:50:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BBB656CF6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 15:50:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=i2qhAemj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YUZ9w04z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111901-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111901-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 335053022625
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 13:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9FF3C1F54;
	Mon,  8 Jun 2026 13:50:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AF23C197C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 13:50:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926648; cv=none; b=Qg51/0Cy1Ob6p3p4ROWm1E71z49psZQ5OjHTsWDGjIVAYN7ffteJRZGzB/z/D4b7asOz91unU25mn9JyBt8OFYLCkFxgk02TSR77iLT002wMefa4ZkEJ0FRnQbN5CsGkCHomt+aW78fICKJ9tVIXWhvLyp/diHEW9lYj5gS7hyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926648; c=relaxed/simple;
	bh=GQZZ6qdQz5fA+bwrpkuSQu6zpYvLdcO3MGlrQ5xFR78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dozdRJeo6OZ9c48QFFoGZj1VrhGdnR8iaXox9VxpayF0yjIlaliClBkmWSu1gMgaY6wooHV72neOP4kQlmZNff1gM64RZz1t1vZhPdly72Q3tzZyTrG2z605/N3yzusgGICrmjh41Bs5VLqTlBKIblX8Mpgt6N4wY2aeVVG740U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i2qhAemj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUZ9w04z; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658Dl07Y3275598
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 13:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cNnrFzM56GPx5J4+UEj8Qmmk
	dW/VSFOOyJZ8mOuFa/A=; b=i2qhAemjb10Ek3piQZv/D7JanNvtT9Y0eVk/grdV
	mi+rXCZcEZkSCtzhsFjeJ96cXCIIYR4b0rsP4pP+e8tqD9h1mSVli5DiRBrjLkly
	DAF8g9AyVWvSWDs46Ema/G8l9dI8ZZA+VQkFlSw//hJTG5mXHLRSuw2sVs55Ar27
	LHPTuYgfWUxXc9MMylJfRAjQQetNTIR9em6n1Zlfz+fGZ8P2c+ZRis7wl4PpP423
	6NZPIMKe4q1pMMQ8m23u1ZYTCTU2cQS9aBSMUlZ6AXomUGOEByyBAD83HzBVX0xy
	ETYyG8M7dbvmoYixs4WPBaRfAicH1/r7FP+nRjENsvGWRg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx400gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 13:50:43 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6e907a982f5so7173285137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 06:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926643; x=1781531443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cNnrFzM56GPx5J4+UEj8QmmkdW/VSFOOyJZ8mOuFa/A=;
        b=YUZ9w04zVDxfA7xxL0ZKFbtM09c9svMu2DaEELAXrSpZF++6WkAmigA4SKqaJKloXx
         PTpSSa+yVWV5Y4W78zkAArWgqsAG98t4YAmpxst8j+xBHaXLpvfBdtJif3aCExjTMTDk
         90Ycj+QHLmHyxdwZOO+vtoYiuANjJJ7q+2ArEQ6hnK5iPsrLKNxsyTGVwHrSVu6yZDb+
         xebR7ACD5jjrW8JaK6Q8PQosCBuUgAKv3fYcfCAKibAHibiOGhrqapcpxxQRIqf4jpEU
         JbDs9HHyQ0jSHeryYKqa0RFe0aBRjixaviCQjUh0oJrvbvdJ3U6hnAHxisRVM1JJ6gM8
         3K8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926643; x=1781531443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNnrFzM56GPx5J4+UEj8QmmkdW/VSFOOyJZ8mOuFa/A=;
        b=aTazgNHkEcs+0QZCzyC9BXOSC+sCbBIsKd4PT6JXMQ4+gTqOe6HT+oXGx1sgOM9hnb
         3RvItr2SZsB19ZPmMse6kvzJ5ucXLF8xrXOngec42382NSa+FIaQ0+wMGIsvo6hoLtB/
         KBs9pgBuGQ9HgAggUxBrA6q9TcuCS+w0Y6OQ1CXx5/zVB5THg/w3f9yke9TuvOygS1bo
         eRVJeFjZJzw0QpZrJ7xcdVd8+6/YHyMLDoxPJxXOi1mgWdNAVJQn6rPCfccIQg3ufoSD
         3tuyomhzJ1QKLPBO/109L0WTE9Fqg4r+fJjHWCawUxcUcd2+oxki1P1zWKGY70AT00oV
         gVKw==
X-Forwarded-Encrypted: i=1; AFNElJ+B1KB5X11r5G3LWs3FIEtmFDzWu0G2Gwyul4TCtuV34EejS8LN89dfp7pSGFaw25b9oGlE0e/Ku7VhPRNj@vger.kernel.org
X-Gm-Message-State: AOJu0YzKxSuzCmRZ6T61ptWzXJO5c2cZpqILE81eaaOqIy7siLWtTZUX
	VuFb8dXzPgzJr7UgEBM5mSPqq1dgyoyTR51lQw2y1uIEMHJOsPbb1Z4r3Ja6XX/XgHVfdQGONaY
	xrrYYb1AbQGdkPF7tqw99Z4US6GD94ENHIJ96W8ftvmmXxwXv+RCdQLQG+0acBChnfZLi
X-Gm-Gg: Acq92OE9gnXn15kVicZgs5mCiIy1sy6ifhTwFlUJ3NIgjxrSE3yB7Q2xrmyNKcTmYfs
	vZceE5hLBhl+L1WF5JXyq3oso0tz9dde4vAebtZ8sYy/7IPOpSokUudhCtcSNwC8viQNeHb77Df
	HLgbuKZCqrVyibvUNAXYXfMknj02Ng9BkmLMblA4On40EPiGLyvC9GnTNp1b3NRRCD3lCjW/Vzc
	CiZCoPjzvJ2Riay76wZlIsZHtGJhixMWMU5BE3tX+Onmnc8oYUrJkNV4mSWBDMES31BVrlDSTFq
	Iyv6QjdXvFoAVDp/1w8DJ6GxJ+x/WWEIr8XkUsUqIhyudYkMzBDg6fEXRZf4XzHn+EKLl/STZ2P
	YmlVf+G3Tnn7RRAXU4OaSo6Gqpuv2X6sZmJ8PAF/iaCWpFapmwYV2fsG25MxgKgiRh84y+vIenT
	MLwR+O/Pzlj2X6wU0XNsXOG50WOnGi25jxUc79iMlKZOHyfQ==
X-Received: by 2002:a67:fb92:0:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-700392f5baemr3677223137.19.1780926642688;
        Mon, 08 Jun 2026 06:50:42 -0700 (PDT)
X-Received: by 2002:a67:fb92:0:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-700392f5baemr3677206137.19.1780926642269;
        Mon, 08 Jun 2026 06:50:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b90421dsm3827701e87.30.2026.06.08.06.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:50:41 -0700 (PDT)
Date: Mon, 8 Jun 2026 16:50:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
Message-ID: <bkve3vmokuyrn4agsqyzxlqr5wuy5y6urnliqypac3h6lb32hy@tfkjstevqv2y>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
 <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
 <68aa9591-49e0-4cb7-9a5b-36405efe7094@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68aa9591-49e0-4cb7-9a5b-36405efe7094@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a26c8b3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=NEAV23lmAAAA:8
 a=dk3LCUOL6mBsUDzKOqAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: 3Jt9cfn-lb6iu3Ko4wfmp28EhorJi_cL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMCBTYWx0ZWRfX3KEC4bufI97/
 jBLRuiwz31ozzz58GnNoUF5qqdazQieZ+omeTj6kK4Men4ESF7D4dPnxlm03o25bTE7Qo8j57GO
 FB7ZVwaUyurHkgrbXYeMLDgzcMVvSVJTl7Kb48HdvDXBz/Hp4gvqubWXcNHUQI/1q4JaWfEifaw
 KZJpbIikQpmfxQVdUfKauiDRKEU44XH3+SqC7jKqHp9JzVLoV5fZVfaEUuUqA+xrBw47Pcr7mLd
 2vivRuHSDprq4qnGpHujstrqtPmPvhY6l6JvuxYj+u7p3WmhQCk3253Q1/tm3ZJALf9PREahTrS
 6Ng96RqUnYGCY66IYgykMjZlUgGZI8Wi+1UCo6R+TPzPPaXMYOmvyuzjEpujk2TA4KrQbLSic4f
 WDk3WZT6OP81DscM8Wk3Q+KJARtt4PbCNqsbZewCVlVSLQZcGmFYYfpzNQxQ3hoie0OUYwgedfQ
 AOtJNfX2BoDri+ungUA==
X-Proofpoint-GUID: 3Jt9cfn-lb6iu3Ko4wfmp28EhorJi_cL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080130
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111901-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bibek.patro@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 62BBB656CF6

On Mon, Jun 08, 2026 at 06:59:34PM +0530, Bibek Kumar Patro wrote:
> 
> ...
> 
> > ---
> >   drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
> >   drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
> >   2 files changed, 57 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> > @@ -53,6 +53,11 @@
> >   #define MSI_IOVA_BASE			0x8000000
> >   #define MSI_IOVA_LENGTH			0x100000
> > +/* Interconnect bandwidth vote values for the SMMU register access path */
> > +#define ARM_SMMU_ICC_AVG_BW		0
> > +#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
> > +#define ARM_SMMU_ICC_PEAK_BW_LOW	0
> > +
> >   static int force_stage;
> >   module_param(force_stage, int, S_IRUGO);
> >   MODULE_PARM_DESC(force_stage,
> > @@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
> >   	}
> >   }
> > +static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
> > +{
> > +	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
> > +	if (IS_ERR(smmu->icc_path)) {
> > +		int err = PTR_ERR(smmu->icc_path);
> > +
> > +		if (err == -ENODEV) {
> > +			smmu->icc_path = NULL;
> > +			return 0;
> > +		}
> > +		return dev_err_probe(smmu->dev, err,
> > +				     "failed to get interconnect path\n");
> > +	}
> > +	return 0;
> > +}
> > +
> > +static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
> > +{
> > +	if (smmu->icc_path)
> > +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
> > +				   ARM_SMMU_ICC_PEAK_BW_HIGH));
> > +}
> > +
> > +static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
> > +{
> > +	if (smmu->icc_path)
> > +		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
> > +				   ARM_SMMU_ICC_PEAK_BW_LOW));
> > +}
> > +
> >   static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
> >   {
> >   	/*
> > @@ -2189,6 +2224,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
> >   	if (err)
> >   		return err;
> > +	/*
> > +	 * Acquire and vote the interconnect path before accessing any SMMU
> > +	 * registers (including ARM_SMMU_GR0_ID0 in arm_smmu_device_cfg_probe).
> > +	 */
> > +	err = arm_smmu_icc_get(smmu);
> > +	if (err) {
> > +		clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
> > +		return err;
> > +	}
> > +	arm_smmu_icc_enable(smmu);
> > +
> >   	err = arm_smmu_device_cfg_probe(smmu);
> >   	if (err)
> >   		return err;
> > @@ -2273,8 +2319,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
> >   	if (pm_runtime_enabled(smmu->dev))
> >   		pm_runtime_force_suspend(smmu->dev);
> > -	else
> > +	else {
> >   		clk_bulk_disable(smmu->num_clks, smmu->clks);
> > +		arm_smmu_icc_disable(smmu);
> > +	}
> >   	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
> >   }
> > @@ -2294,9 +2342,13 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
> >   	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
> >   	int ret;
> > +	arm_smmu_icc_enable(smmu);
> > +
> >   	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
> > -	if (ret)
> > +	if (ret) {
> > +		arm_smmu_icc_disable(smmu);
> >   		return ret;
> > +	}
> >   	arm_smmu_device_reset(smmu);
> > @@ -2308,6 +2360,7 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
> >   	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
> >   	clk_bulk_disable(smmu->num_clks, smmu->clks);
> > +	arm_smmu_icc_disable(smmu);
> >   	return 0;
> >   }
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > index 26d2e33cd328b8278888585fc07a31485d9397e2..c00606a416b2f4bb44a35e5d67f6ef801df68e1c 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> > @@ -15,6 +15,7 @@
> >   #include <linux/bits.h>
> >   #include <linux/clk.h>
> >   #include <linux/device.h>
> > +#include <linux/interconnect.h>
> >   #include <linux/io-64-nonatomic-hi-lo.h>
> >   #include <linux/io-pgtable.h>
> >   #include <linux/iommu.h>
> > @@ -335,6 +336,7 @@ struct arm_smmu_device {
> >   	int				num_clks;
> >   	unsigned int			*irqs;
> >   	struct clk_bulk_data		*clks;
> > +	struct icc_path			*icc_path;
> >   	spinlock_t			global_sync_lock;
> > 
> 
> Any feedback or concerns on the interconnect voting approach proposed here?
> 
> This helps to address the kernel panic issue [1] reported for one of
> Qualcomm platforms.

Please respond or tend the issues, pointed out by Sashiko.

> 
> [1]: https://github.com/qualcomm-linux/kernel/issues/297
> 
> Thanks,
> Bibek

-- 
With best wishes
Dmitry

