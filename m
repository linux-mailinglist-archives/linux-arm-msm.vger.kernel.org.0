Return-Path: <linux-arm-msm+bounces-80769-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A836C3FD0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 12:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03F213BD9A8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 11:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C98322C83;
	Fri,  7 Nov 2025 11:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ncQf/rj+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q0R1m5kW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09BA32143E
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 11:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762516208; cv=none; b=TqARRNyjYbvPqaq7mY3ERMru/TiVJ8yrnUGtOaGf1zBnqJV08UYQqz9VU47l4dvUwNv5x6MuLjtmA82xePaIVWxp5p5FVHXkmFcAKwdxMyDuFtVLX3UYXpSYMjmh4yIO9szhvDHFodu1XTW9x2ZDbBKOsHAw6HjcwIcdEkPBA8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762516208; c=relaxed/simple;
	bh=9zKjZpUIYk+itNggUJ5MlXLhe3sBQBIWHa35miBX6W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYqQZ1scirwcGk7iTXdj4GX8ngc+a7sd2Gy/ysWBYxEZRLYSP6mwNr6v6m9nOR8VB4S9wit5Jhdun1MVueuzuIVJppAziyi9vksw2fpuyR5uhDxjjMeMJAPvW+65jI2ExXAplC1FGaR1BKPyyxJcB+kD89wPXdc8gm54a1O6Il0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ncQf/rj+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q0R1m5kW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A76iUuQ629446
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 11:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dMrXAflLekSr2reWqAqWS0yB
	ySzoUwcO6ionW8M4Tzc=; b=ncQf/rj+sIhsA9BrBH/ZggfgAEiW/UZekYS7yKHN
	ojUvgTNPnIUixJvdLfDOzi1ht0SF46BR7ysoEvXFivkG+H8HVtpIMu0SH/emDGyH
	Ofd2ID5ytSt0xD+ExRDAVwG3XJMP6szhnHM/vW+KRcOD73Qj/XRu3qBwZPv+HKGM
	teW5F+LdC3DlEzzK45+FCOIGh/o99jX02KRhcB2G8sxPXr7XXVzk4ZMV0lw1LYU6
	+mB9fj/AyXUuu+xEkNLlNAqAhDT3qBcq/9KaGr0JWvYZjEERdrsV8gdl1SC3Sx33
	50yHxSA/31sAmJ4Dzba4UDCPCtjYTP/a7kkSyX+Wh0q/ow==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a92232fn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 11:50:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297b355d33eso10273765ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 03:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762516205; x=1763121005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dMrXAflLekSr2reWqAqWS0yBySzoUwcO6ionW8M4Tzc=;
        b=Q0R1m5kW6mvk1HP+IDu/LJmSdt/PGqMeSR1ZEpXFVAeRfJJhSUREy6drB2D5hpoUqB
         QMiezWFZEyENMDXTF/5LZ8S3Mh/K0CzkveE90x1BHqs0Es0PZatCgW84U0LBTIS5ojvU
         M4SFtTkYMKaneU7Ej+5MxJR+X+7uxdTbCWw6Y965LKFk7EdzUfgarCwCw06QBdWRW9NR
         jtfG2hf3KMed478eKg1vz4++3muSBkU4sEKoy3ZYTCvsZuXv9awucnMk4Y/LJYnTD7iY
         RbNEeOZrsS99kmLpebSKhhm0XizyN8KIPZ+uQGvHxL9wNvMtsrOpHvL9VuJhqoACU/gW
         YSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762516205; x=1763121005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMrXAflLekSr2reWqAqWS0yBySzoUwcO6ionW8M4Tzc=;
        b=aIIR1+cHAc2y+bEzoAE3P6ZzKEe0XHPGruXoXQ5e57MzhhzhNJQ/riDEi9VWy3dwk8
         g1MNBHB0Le0D5JqBmXWdFEbe3PO5YWiRCy06tw/Ij7VtgYT25BkTAVSt0jdIs1OSAPlp
         zj/btMXteA9R+Ht4nLIPppQQfWnxb2JA/qxPaL5slOvmToMQsz/cry/GiRF9A9LaGQDb
         X5hrVaUBzqoUN9iluBph31ygC1i4R1JKSFNhg50RKZiJJFjSXQAQobG8ptZRh+Lc6ry7
         eMgw9XnY8J6+0mVf7St3PldGE2015ZTTjUv8DNtNjjOaMxoeMAa5TtVXM6vrLsvu4Agb
         l3zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjFq1Qc6mS+y4vp2hFCmhdisCm/bYcKIwIe7JapOW7qKp6X/OevkAyPdP9kU1rUJmmajwIZ9HT82waYz8n@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/cOtTsH4tsUBdQjh7ZlG7XR+vadoEkKR29661BST4s17viqol
	bsmrg1Gp2o1mPqCcSSpkHbvPHytr9p9xVqIRq8VHf9aWUwfvXEcx52bNPPHTAGL4Po7cjQjExlR
	PazG7Knj0TE7bHrKgehsPtQyt0r8GwDahLgpZrQ9PYaCTWsvTzL+eN/2NJz9rHpIr6Oyx
X-Gm-Gg: ASbGncvx8TyLyPq9ko+bIsy7CHsl86pFVE5kd3XbHjM1rnQU/mVKkvqIb1AAkGrxbwW
	YaU4B7H6dn3ItcUtdxuGxDzeV0aX5B0QuSDN1dN8mRacSoYUhdtgmPLBvLSrALWxnoJUQGO1eCL
	QYJEDgeLOVoR8mPEbBZ4W4iZr5qjHImbbZ2o6hKdvSyZMJmFTnCQ0+MGZ5waAqPwpwB6eWO5nFc
	2qzpFP6h+QHDOEusyTYXB8oa2HHdQGkJ0nNhr1CUeds28nszgzwDLzrIepXJ2MtbEV9eKhNUoqN
	p3pvJwPQl3bSb9Vw0zwaSja9dBgm4+ak2G3TriomsaWvRM+7wEmCmGAWSpU6iGIySnr1gyU8/5h
	5nDJLiJf5q9eepsUgMC/9C0OKdA==
X-Received: by 2002:a17:902:ea05:b0:295:73f:90d0 with SMTP id d9443c01a7336-297c04931d3mr39770235ad.50.1762516203091;
        Fri, 07 Nov 2025 03:50:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhNAjO6ANvx/Ku1ZgGqWvUkOpsCN5R864El2BfAS5aa0p1YaTkf88N9laM4ZHwBOWafYkMdA==
X-Received: by 2002:a17:902:ea05:b0:295:73f:90d0 with SMTP id d9443c01a7336-297c04931d3mr39769635ad.50.1762516202345;
        Fri, 07 Nov 2025 03:50:02 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651cc1907sm58007315ad.99.2025.11.07.03.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 03:50:02 -0800 (PST)
Date: Fri, 7 Nov 2025 17:19:55 +0530
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
Subject: Re: [PATCH v6 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Message-ID: <20251107114955.zprgt2peq34im3ji@hu-mojha-hyd.qualcomm.com>
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-11-7017b0adc24e@oss.qualcomm.com>
 <5239980b-f74c-4458-a7e3-a5e7f6927449@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5239980b-f74c-4458-a7e3-a5e7f6927449@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA5NiBTYWx0ZWRfX1txfL5DIbMgb
 8OgTHyZRXSaTLkBeocXYy0ZhZWX0OuZPgaKVcnmjoZVpjowxisHkp11rATjZW2UZSife673xzpt
 c0ScgoPYkM9bSIpGOWpMbetYGcYVMXU3IsQuYSD0kC2U/9wNe5kzAeCFmkTBi1Ct/1RNlOpWp6P
 jRJc4ciiFOhyKcndSxycA3vfgcFPSca5bvsHOg9ObcwsJonkUg3v4TeSjxwCfbXvoemwmTcRAc+
 vKWaYkMbRn6I9m562b/KP6pCR+WufRvsXhtKNtdKbk+/NlXFWlSQ4VZj9YvW6F7dzF1go0tZohw
 UqhIRsFEB44A8TlJ0PHo7QurC075VJ4P3Nzh81iLbh6pNOMIMMoJE92Iu8BFKfhd69i0yZese/p
 zkP/GKKPKgpa0WjQ3367WlMWCtecbA==
X-Authority-Analysis: v=2.4 cv=Csmys34D c=1 sm=1 tr=0 ts=690ddced cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=g61vSUFNigzP7AYlN20A:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: YZHwRWzkXM1D8iey32tr_L8uAg06ycZi
X-Proofpoint-ORIG-GUID: YZHwRWzkXM1D8iey32tr_L8uAg06ycZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070096

On Fri, Nov 07, 2025 at 11:20:20AM +0100, Konrad Dybcio wrote:
> On 11/4/25 8:35 AM, Mukesh Ojha wrote:
> > Qualcomm remote processor may rely on Static and Dynamic resources for
> > it to be functional. Static resources are fixed like for example,
> > memory-mapped addresses required by the subsystem and dynamic
> > resources, such as shared memory in DDR etc., are determined at
> > runtime during the boot process.
> > 
> > For most of the Qualcomm SoCs, when run with Gunyah or older QHEE
> > hypervisor, all the resources whether it is static or dynamic, is
> > managed by the hypervisor. Dynamic resources if it is present for a
> > remote processor will always be coming from secure world via SMC call
> > while static resources may be present in remote processor firmware
> > binary or it may be coming qcom_scm_pas_get_rsc_table() SMC call along
> > with dynamic resources.
> 
> [...]
> 
> 
> > +	/*
> > +	 * TrustZone can not accept buffer as NULL value as argument Hence,
> > +	 * we need to pass a input buffer indicating that subsystem firmware
> > +	 * does not have resource table by filling resource table structure.
> > +	 */
> > +	if (!input_rt)
> > +		input_rt_size = sizeof(*rsc);
> 
> Would the expected size of the received data ever be any different
> than sizeof(*rsc) anyway?

input_rt_size != 0 and input_rt = NULL as input to this SCM call are 
invalid scenario.

Expected input_rt_size would be greater than sizeof(*rsc) if remote
processor firmware will have resource table section.


> 
> [...]
> 
> > +int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
> > +			       size_t input_rt_size, void **output_rt,
> > +			       size_t *output_rt_size)
> > +{
> > +	int ret;
> > +
> > +	do {
> > +		*output_rt = kzalloc(*output_rt_size, GFP_KERNEL);
> > +		if (!*output_rt)
> > +			return -ENOMEM;
> > +
> > +		ret = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt,
> > +						   input_rt_size, output_rt,
> > +						   output_rt_size);
> > +		if (ret)
> > +			kfree(*output_rt);
> > +
> > +	} while (ret == -EAGAIN);
> 
> This should at the very least be limited to a number of retries

Sure, how about 5 ?

> 
> Konrad

-- 
-Mukesh Ojha

