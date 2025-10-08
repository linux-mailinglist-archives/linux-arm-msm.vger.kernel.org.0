Return-Path: <linux-arm-msm+bounces-76312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ED177BC3B62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 09:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A02C04F9A48
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 07:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0FE2F4A1F;
	Wed,  8 Oct 2025 07:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cV2xWan2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F2E2F260F
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 07:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908932; cv=none; b=PeXWmMSgDRDBsdGGq6J+J55W+gIQ+tZYBUHOpEo7H1lel39xZ15R5yxB6g6yIqmz5hO6iyAmSzV6UYiMoJnuvQJa4Qw+dcmdMMKcC1V511QkihbirNaQetitI12+T7setrdGnVBg1JQf6bLqqzSfVn+FSJNYTjUvMWVPRUFZpec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908932; c=relaxed/simple;
	bh=F4Jf3/Jx2Wrf9ObJ98QM9rPrenllrUtXKxkbFh2XhXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbdvPkroYHsxbL/r+Iy3R9Z66u4dyvLwgbHqq+bnMKcRCIv9UXOGyWrmZMGF/DIOS/Y4MofAl4kvupXpAHaJLY1Y+RA+nOQa1p3meCwzuueCq2HN3HqruHCk2zF6sHGq96JaJbfaz4d/X3+oQd3sLP57L7EoPzunCgP0b6NDxXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cV2xWan2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59803VBG017943
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 07:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iiYKnuUQureOztNmxjz+R23v+NHrM5vRIegiMWn4T4g=; b=cV2xWan2lpcGhei+
	S2278UgtDFr6SN4gmmI/rpGUbpYCIIrxysHH0c/NZ6nfB0iXlaTkXkWbz4AlamlN
	IrBi4dRtWQze9TZUcnZ8jSrsQocbbRQdQxh7V4PE2mRXvc8tyAtQFSVwCCqVMcvw
	cV4uj206WqbYSK8/U/8XGPrLdZg1mK4/ws3BmONyB+8jORgwbtDLeCWG3yITPeis
	c43d/Hr3pmCAi3ytoso3tZi6gMp1g4i5ZCDaseUOVpakaOD4B9a+UyW/bFvRM+lE
	ZsLenuunxelrpQMYFIC8NMw8jSefUGckMzYDgw1gkz8VMbhsHplYxgmJ5iWHGpxW
	ItYwXw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpvgyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 07:35:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780f82484faso5258518b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 00:35:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908929; x=1760513729;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iiYKnuUQureOztNmxjz+R23v+NHrM5vRIegiMWn4T4g=;
        b=QsbuDL6w1csdSmQmSb9r4bpU5fZ/o4Dy95QPML+4oS4RtN15/1czhRoAyDNSg6u3Tg
         wL1ZOlHdHWdRIhJ7+hU1y7fJW+fJXX1hywNEdtsNGOS5sfQCiMVnPNStToAcwOSKTqgc
         alpQIAmzftHVxbK7u4VxDx/3GVT8uVlHYYT9RPbWQK9v+1KoP4TBgIzxcV1WMAGH9Bzp
         ivS/e7vmuraME+bjK98NjPfwaxZ1J/sKZQi8Sji5SJe2wgzUX2Hu+51u4EGqRkCbuI/M
         1cZqeKnoP32+gQbqkOJMv1AKcmWcgRp+YAEhuD1bQV3Fc9jf/4C0VdZNqA9Plii6/bY3
         xjWA==
X-Forwarded-Encrypted: i=1; AJvYcCWbBizDJiV1KT+ULQWAzq5w3T4ODule+sXUMi8clUVug7U/JuNcWls3jIY1gkFFVjjYuTC7oBBawG/U8E15@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn+Jl4/j3GFc2cQHLPiy4slxC+eLwdNuQrlaWm8jWs6Yq883/Y
	DgfUhe0mvs8W7bzIvwcYAvWOrOEG6gtxBntuBkZxQwKtmEmj0LIxRa6/A4EK0oIZpfa46AFgIvi
	7ctkUTJpk+4lKXGnb73je6R1Nt5GAF6A3AbtmHdqD3ByIa/CSjVDLA5EXtMRfq5CbEGXd2dbT8f
	LE
X-Gm-Gg: ASbGncszJ8o8OqQWcJC4x2zSDO7u9KlDaWE6OO/ZZjHxjtyQaS/cimrJBKDrctzTjlG
	2QqtuQDl+llgb8utisDGOQozOfSpyQ9JUICgu5uNGMvGzLCtev+pF7fOztlVkqRqQJiPKeb2dOf
	z/up3/ebOwefxoNvsWueLcKdfG49ciVV/uzbNWVM6J11fsi0HBnhVjMG5xg2cSok2vXKdBSTYQd
	W/0h0aBdhk83yKMhSnzwpaClGJIu8eNNMYgMQWk7V3ZqYM4qya+zJa1NXRw9RbDbLNZjKzr7EDu
	YJSH5u6khB6wifKK6fYmuXX+oHQ1O9LJe7T0u1OXV5XHp+kRVI40ihtZcyNaILbmB7LlTKlv
X-Received: by 2002:a05:6a00:9298:b0:781:9a6:1175 with SMTP id d2e1a72fcca58-79387c17855mr2747274b3a.25.1759908928350;
        Wed, 08 Oct 2025 00:35:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeZSMKoKEdQQfj+KuO8JF5SEBLYOmlTZtL7VL9jTiwIRBF7GJdJ3rVJjNWFYe4E2jpO7zRbQ==
X-Received: by 2002:a05:6a00:9298:b0:781:9a6:1175 with SMTP id d2e1a72fcca58-79387c17855mr2747235b3a.25.1759908927674;
        Wed, 08 Oct 2025 00:35:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9ced7sm17817725b3a.15.2025.10.08.00.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:35:27 -0700 (PDT)
Date: Wed, 8 Oct 2025 13:05:21 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/12] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
Message-ID: <20251008073521.ky5cxxrxntundezl@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-6-de841623af3c@oss.qualcomm.com>
 <juirzpdb7ltx32fdiu37q3fd543fctvtssnro5qv4satninz2z@3bxup227lvvy>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <juirzpdb7ltx32fdiu37q3fd543fctvtssnro5qv4satninz2z@3bxup227lvvy>
X-Proofpoint-GUID: 23egNJWKL-3R_ea7E3qa6b-zDMF-OosZ
X-Proofpoint-ORIG-GUID: 23egNJWKL-3R_ea7E3qa6b-zDMF-OosZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfX0+C2I/ZgNLbr
 HQXeJY9Ne1GUc5e0lFPsEw66SLy73y3d3a8T5GcGxG7mxg/1Wq+appjCfQxfd6q0H6gZ21044rV
 iaBWTXd5UU+5hHSflfMcRW4Ohc1p8F5dUTZmwxLb91DFdHCbsxWh/TFFfSDackW5V2dJxuZzwHD
 +EDvClJ0UB/No+ynlADmWaZf0YaoV9ZUFt3+A/O4BuvKgI/HY7jp6wh6Kw7deCW72Pecktpf3xj
 ajnGpdqgUpPAeq6SGKFo90KGJaaGMMoNkhiOqBvGpi6OKaf6d6+tDZhUjo3uGI/y+g2NlSO68wv
 bLZachU4XRyeNXq8x2woP5g/6f6OokcdUDh3yh+BCGdwMVtDQQBogB0Mt/aG6PZgBXn18FAftXU
 KkBbvJYTNRQqu9X9z8ZHgb1hiVPX+w==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e61441 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=H8e-7uY52fie2kMTd9UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168

On Tue, Oct 07, 2025 at 02:37:40PM -0700, Manivannan Sadhasivam wrote:
> On Tue, Oct 07, 2025 at 10:18:51PM +0530, Mukesh Ojha wrote:
> > For memory passed to TrustZone (TZ), it must either be part of a pool
> > registered with TZ or explicitly registered via SHMbridge SMC calls.
> > When Gunyah hypervisor is present, PAS SMC calls from Linux running at
> > EL1 are trapped by Gunyah running @ EL2, which handles SHMbridge
> > creation for both metadata and remoteproc carveout memory before
> > invoking the calls to TZ.
> > 
> > On SoCs running with a non-Gunyah-based hypervisor, Linux must take
> > responsibility for creating the SHM bridge before invoking PAS SMC
> > calls. For the auth_and_reset() call, the remoteproc carveout memory
> > must first be registered with TZ via a SHMbridge SMC call and once
> > authentication and reset are complete, the SHMbridge memory can be
> > deregistered.
> > 
> > Introduce qcom_scm_pas_prepare_and_auth_reset(), which sets up the SHM
> > bridge over the remoteproc carveout memory when Linux operates at EL2.
> > This behavior is indicated by a new field added to the PAS context data
> > structure. The function then invokes the auth_and_reset SMC call.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c       | 48 ++++++++++++++++++++++++++++++++++
> >  include/linux/firmware/qcom/qcom_scm.h |  2 ++
> >  2 files changed, 50 insertions(+)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 7b4ff3cb26ed..ab2543d44097 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -791,6 +791,54 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
> >  
> > +/**
> > + * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
> > + *					   remote processor
> > + *
> > + * @ctx:	Context saved during call to qcom_scm_pas_context_init()
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
> > +int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
> > +{
> > +	u64 handle;
> > +	int ret;
> > +
> > +	if (!ctx->has_iommu)
> > +		return qcom_scm_pas_auth_and_reset(ctx->pas_id);
> > +
> > +	/*
> > +	 * When Linux running @ EL1, Gunyah hypervisor running @ EL2 traps the
> > +	 * auth_and_reset call and create an shmbridge on the remote subsystem
> > +	 * memory region and then invokes a call to TrustZone to authenticate.
> > +	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
> > +	 * subsequently call TrustZone for authenticate and reset.
> > +	 */
> > +	ret = qcom_tzmem_shm_bridge_create(ctx->mem_phys, ctx->mem_size, &handle);
> > +	if (ret) {
> > +		dev_err(__scm->dev, "Failed to create shmbridge ret=%d %u\n",
> 
> 	"Failed to create shmbridge for PAS ID (%u): %d\n"

Will apply, Thanks.

> 
> > +			ret, ctx->pas_id);
> > +		return ret;
> > +	}
> > +
> > +	ret = qcom_scm_pas_auth_and_reset(ctx->pas_id);
> > +	qcom_tzmem_shm_bridge_delete(handle);
> > +
> > +	return ret;
> 
> 	return 0;
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
-Mukesh Ojha

