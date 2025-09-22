Return-Path: <linux-arm-msm+bounces-74384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B172FB8F146
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 08:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 806A3189BAB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 06:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7592472A5;
	Mon, 22 Sep 2025 06:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICPzq+KD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABF821C163
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 06:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758521534; cv=none; b=K7yU0zXKs85MAcB290MnOZP+iwlC4W0czLlqBcTNQCj38N+qKSI032c2Dp+MLd1scmYk5B18BXLHKBLjpI600vwUejkgKTjRw2oE+oOXChcy5fm9Vgqb2GTJ3mQZ9UmUXEXlTVtw8KOGZ3jm4sEmf/b7SAwTsmmdsEBllqjznMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758521534; c=relaxed/simple;
	bh=nUaaLVJ/1LgBoxTs7G6/f0cHxlBwhNPfXAKXcdI9o7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkeFHEQrPfnoxnYKWKrgRSEuF+UIMBdyVy+3EVOmsXxsxz9sivKk46kVH8ovRhzsD3js3oLOhPibgY4KB4ZZdIZ+9TdjBTN8PwGMuc0RqChd4ea9uUa4Dx+hzSvEEeVLuepsHlDl1t0aJ7wAn4bttP6wUyhCPxCVs5D9PFjhOtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICPzq+KD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LNdCMe007045
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 06:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7H8DyNUkWtjkF6osxewsi7ALk1W2IFcqymZvnfULzM=; b=ICPzq+KD4bNZzj0K
	/gTMTSlhL9MZj3uXSzPrWCBzSNO0R1gcXVQpeKXuoA83pky0GuP2HJojuNiIq+1y
	Zh9jYILRe/aABQBxSRwzhFSdQSE3J6MbsqMwgN3I+yCX4oF+adUSkrxqZ9TPZqCI
	yZAUbNFf4BFquDcg/xthLUtGsDt+hYmy5ZOdKOxFAb3ksntLNMOvJ/kecBpdc9yz
	SBtcIi7ve2QXTuB/D2mA5oKXG6RFHUD/9p97EIaxKz6xtox164rXSTETBL1PCca/
	kj8dSxJ85bcT96eIbblJlemBAJZC0XTF/0ZsAX0aV/0QkTi+7NQmpdku5tYWAVxf
	iBAYig==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnkt7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 06:12:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77e12c8feb9so2624910b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 23:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758521531; x=1759126331;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7H8DyNUkWtjkF6osxewsi7ALk1W2IFcqymZvnfULzM=;
        b=Ov263wbThVNe6+2RHP1H8IQpRq5a52hpxhs+kS8PD5xxsgIpelAYnXbzZ0UM56upmC
         77EC8Annq5jktKU2I8Pp4BNy1JBpBLqBfDgbh88l5rlVprodn5urTgQs/v6i7tiFzLZf
         m+yTqWg493jyROBwBXx7bMfdwKAV11PGzj6k5Om7BzpksHNSn6Y4yyuqChX5JMRkFKq/
         Dsci+EPaYWx8b1Isgtxx92Mlz1QOZR6ATUpmAcFG49XfgaBAnNbqPETAGwTQJdRQRd62
         ZGkJzgBSaCEuemgCI/CCnuJD9o7qFZSdnW+wYbDu2xXe8KRqLfIY8ROHS3IbtBqVynDW
         3VLw==
X-Forwarded-Encrypted: i=1; AJvYcCVj/237Z/JVAwFRxIb8wOCSyHp2iHwiNZIOnFGVk66dY/fC/HlKWy3uJBOgl7w6+ybpC4NxY7lz3potkbzC@vger.kernel.org
X-Gm-Message-State: AOJu0YyE1zjvJNT5DhavMvW1824DdDBGVmW6Xh8CX6CRCPhkTMvRibcD
	iUN27KEhRaSwsN3SYnNlqR7VODqsRdzNOiBWk0FOHLna9tdPsYdxrVtfw2ojSpvTLqVIeUEdkvM
	TRPs54HSTHoyzIiAKkSuB108igbJlCruLo10ozCYus2ykvtGsIdPiM4An90tNN+M1vC+9
X-Gm-Gg: ASbGnctw5AJ4wZZfq3vbryTJ6UkQZTUh2Xpt1YUXXDPDWexIiEEB/1daVgzHYmvxkDf
	uzd2tvZLK687hQGMpao2yxX5zC0/aOF/RVJjHXd01A6FoIxXT63S1ymxA7qku25uB3pVQXAG8iR
	T5qdmYvcl6Vwa2ZDaFiP83ChFeY85LqMvghmMTv7ngTUSsP58NYNOhdTtDsEEJWpZgB0tPBzL/5
	4zmYxl3y9OT+K1JNUrdiTEnEKrj66zwVH5XsSiI6Ybrwb4khOteg7eKGyDi4HyNYAAjRnQ7rfi/
	fWi3VYG2+7LU/Hm6SRSY5VLXrBDBfpGegLaVYzSjVSGcYlD3HRKZy9HWYbUYPRjND68=
X-Received: by 2002:a05:6a00:984:b0:77f:23fb:dacd with SMTP id d2e1a72fcca58-77f23fbdbd4mr5698805b3a.11.1758521530599;
        Sun, 21 Sep 2025 23:12:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjBKGgouPe2xNmu4wT0QNnfhVsYmbAcO36Rc2l1qP4kx8vtHeTRXhMQmRGVf7tplPlSusoog==
X-Received: by 2002:a05:6a00:984:b0:77f:23fb:dacd with SMTP id d2e1a72fcca58-77f23fbdbd4mr5698781b3a.11.1758521529823;
        Sun, 21 Sep 2025 23:12:09 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77d8c3adfd4sm10702304b3a.82.2025.09.21.23.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 23:12:09 -0700 (PDT)
Date: Mon, 22 Sep 2025 11:42:03 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/12] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
Message-ID: <20250922061203.l3qkdrjwakqcphf3@hu-mojha-hyd.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <_EY7CMwY6zRmzmm13Bo2V7im-VNhJRkSEhPkwo3PQnrA6Gxd5fVTyT_wRbBbN0VB7Nt8DKXVU88AwGEi0OYEvw==@protonmail.internalid>
 <20250921-kvm_rproc_pas-v3-6-458f09647920@oss.qualcomm.com>
 <591289e2-a5e3-4941-b8d4-85edac281013@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <591289e2-a5e3-4941-b8d4-85edac281013@kernel.org>
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d0e8bc cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=LOAonp52TIAqIygTTBcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: CzfSR9m1GsJ6iw5h5X238MFuAGl5bfv0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX6/57PkKS5ofB
 LCKzGzp/FH1/hg5nJFNcT7U4uPURNPKGofnXbpt22goKebL2ygfSuaJywJymHYvEUCZ3uviE0g5
 AERThJimOeaZ8ezcK+VR9PFROCnEahrg7fOTZtIdrLB4uryTWuNAsI3YsUFtsMIFJIpAU8ptFFd
 Txl1lgDURYOHv7AjEAkxIjh3ky4KuQw+r5xMUawprYoWXaqpT/Xl0VzvtWekq5NcvAKI+2HT/gA
 b1nFoN4M/a2a2cthEPqvQEK5lxyKuQVr+B2ztqB5EgaCQPbxw2TDxC87AITUIpdONc+NQcm+v40
 LRkBCoC0YESN3Exap6VYMI++ZkbB8euWrMvRzSoQVArXRM5R3lEO+jjXY5XcS0v0DJ+DclD65de
 kpKO776Q
X-Proofpoint-GUID: CzfSR9m1GsJ6iw5h5X238MFuAGl5bfv0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_10,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On Sun, Sep 21, 2025 at 11:23:41PM +0100, Bryan O'Donoghue wrote:
> On 20/09/2025 20:41, Mukesh Ojha wrote:
> > Qualcomm SoCs running with QHEE (Qualcomm Hypervisor Execution
> > Environment—a library present in the Gunyah hypervisor) utilize the
> > Peripheral Authentication Service (PAS) from TrustZone (TZ) firmware to
> > securely authenticate and reset remote processors via a sequence of SMC
> > calls such as qcom_scm_pas_init_image(), qcom_scm_pas_mem_setup(), and
> > qcom_scm_pas_auth_and_reset().
> > 
> > For memory passed to Qualcomm TrustZone, it must either be part of a
> > pool registered with TZ or be directly registered via SHMbridge SMC
> > calls. When QHEE is present, PAS SMC calls from Linux running at EL1 are
> > trapped by QHEE (running at EL2), which then creates or retrieves memory
> > from the SHMbridge for both metadata and remoteproc carveout memory
> > before passing them to TZ. However, when the SoC runs with a
> > non-QHEE-based hypervisor, Linux must create the SHM bridge for both
> > metadata (before it is passed to TZ in qcom_scm_pas_init_image()) and
> > for remoteproc memory (before the call is made to TZ in
> > qcom_scm_pas_auth_and_reset()).
> > 
> > For auth_and_reset() call, first it need to register remoteproc carveout
> > memory with TZ via SHMbridge SMC call and then it can trigger
> > auth_and_reset SMC call and once the call returns, remoteproc carveout
> > memory can be deregisterd with TZ.
> > 
> > Add qcom_scm_pas_prepare_and_auth_reset() function which does prepare
> > the SHMbridge over carveout memory and call auth_and_reset SMC call.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >   drivers/firmware/qcom/qcom_scm.c       | 46 ++++++++++++++++++++++++++++++++++
> >   include/linux/firmware/qcom/qcom_scm.h |  2 ++
> >   2 files changed, 48 insertions(+)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 917341308873..7a86b27ea666 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -790,6 +790,52 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
> >   }
> >   EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
> > 
> > +/**
> > + * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the remote processor
> > + *
> > + * @ctx:	Context saved during call to qcom_scm_pas_ctx_init()
> > + *
> > + * This function performs the necessary steps to prepare a PAS subsystem,
> > + * authenticate it using the provided metadata, and initiate a reset sequence.
> > + *
> > + * It should be used when Linux is in control setting up the IOMMU hardware
> > + * for remote subsystem during secure firmware loading processes. The preparation
> > + * step sets up a shmbridge over the firmware memory before TrustZone accesses the
> > + * firmware memory region for authentication. The authentication step verifies
> > + * the integrity and authenticity of the firmware or configuration using secure
> > + * metadata. Finally, the reset step ensures the subsystem starts in a clean and
> > + * sane state.
> > + *
> > + * Return: 0 on success, negative errno on failure.
> > + */
> > +int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx)
> > +{
> > +	u64 handle;
> > +	int ret;
> > +
> > +	if (!ctx->has_iommu)
> > +		return qcom_scm_pas_auth_and_reset(ctx->pas_id);
> > +
> > +	/*
> > +	 * When Linux running at EL1, Gunyah(EL2) traps auth_and_reset call and creates
> > +	 * shmbridge on remote subsystem memory region before it passes the call to
> > +	 * TrustZone to authenticate it while when Linux runs at EL2, it needs to create
> > +	 * shmbridge before this call goes to TrustZone.
> > +	 */
> 
> "When Linux runs @ EL1 the Hypervision Gunyah running @ EL2 traps the
> auth_and_reset call(). Gunyah create an shmbridge on the remote subsystem
> memory and then invokes a call to TrustZone to authenticate. When Linux runs
> @ EL2 Linux must create the shmbridge itself and then subsequently invoke
> TrustZone itself."
> 
> Please fix the commit log too.

Thanks.,

Will fix the typo Hypervision and fix the commit log.

> 
> > +	ret = qcom_tzmem_shm_bridge_create(ctx->mem_phys, ctx->mem_size, &handle);
> > +	if (ret) {
> > +		dev_err(__scm->dev, "Failed to create shmbridge ret=%d %u\n",
> > +			ret, ctx->pas_id);
> > +		return ret;
> > +	}
> > +
> > +	ret = qcom_scm_pas_auth_and_reset(ctx->pas_id);
> > +	qcom_tzmem_shm_bridge_delete(handle);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_scm_pas_prepare_and_auth_reset);
> > +
> >   /**
> >    * qcom_scm_pas_shutdown() - Shut down the remote processor
> >    * @pas_id:	peripheral authentication service id
> > diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> > index 9ca3218f0948..1774584ff5e3 100644
> > --- a/include/linux/firmware/qcom/qcom_scm.h
> > +++ b/include/linux/firmware/qcom/qcom_scm.h
> > @@ -78,6 +78,7 @@ struct qcom_scm_pas_ctx {
> >   	phys_addr_t mem_phys;
> >   	size_t mem_size;
> >   	struct qcom_scm_pas_metadata *metadata;
> > +	bool has_iommu;
> >   };
> > 
> >   void *qcom_scm_pas_ctx_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
> > @@ -90,6 +91,7 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
> >   int qcom_scm_pas_auth_and_reset(u32 pas_id);
> >   int qcom_scm_pas_shutdown(u32 pas_id);
> >   bool qcom_scm_pas_supported(u32 pas_id);
> > +int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx);
> > 
> >   int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
> >   int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
> > 
> > --
> > 2.50.1
> > 
> > 
> 
> ---
> bod

-- 
-Mukesh Ojha

