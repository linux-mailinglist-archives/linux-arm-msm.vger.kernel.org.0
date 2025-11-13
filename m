Return-Path: <linux-arm-msm+bounces-81621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CA34FC57E89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 15:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BADC4E59B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 14:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358CD283129;
	Thu, 13 Nov 2025 14:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsyT2DR9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fHFYuCyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E48226D4DD
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763043518; cv=none; b=EFbfIiUqb6byMaFXUdfjFWAkApy0DKp/ogjA9NZnIZw1x+fzIOai0bk3Pw35grUrShP8fxuMrOVHyjJ+IqfqSMS3q9ycAShoxid0YR7vcnsUQdnhhEtkq85uWcPV87j4cEcA+JvdfeArWGa9/pHWyG0t7gWQyuVCmWt9Z957T30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763043518; c=relaxed/simple;
	bh=YPiMjVGtnmzVmhP2MBtXj02fTkYPYr7pqgd1RZjfN3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBYkjMtqgysLByZCrq0MCwoUAvkynFekgttSbsZfrCtS6TOLy5nVFJg10YS8Mp5ONhCFz8d5Mbjf6WljDRz24kNnQwxqjd9ZRBnrZb5ovwSgPbM56V2SKactaAr5wfhoOcZR1oI+m6MT8e31I2/6pjbbYywrqfQcld5SR/TQjHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsyT2DR9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fHFYuCyT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD9WekL3120617
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 14:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PYfAGt7xLkn4IooIS/dHIQut
	IGT7n93ycU/0f7jdrwk=; b=fsyT2DR9Z6EGpz7UZwYGX+c/PHOi6PG2tCSSe10e
	j0QKJHQtqWK5K2o+m5nj2y2v4wYkYHoLmMo5PJGWt6cX8cMxwQq1em76Pw7v9er+
	J68o4gDGAOCcXxa/3ODHDXci1zLYFJC2mGYOFJvR46qPpeAuoYU3G1MpRpM9cnZR
	oRGwhI3J9WINQuuVJbx7SxT6Q6Jz/gV3/pMpVocFX55Vng9Npno7AJVjplk/jfyU
	Uj8aisMlrZWXj6+IeSWDq8kAyaJObuWWDNjp8kWG4ArlB6erAduP8b2MSGJPqjM7
	Zj80xLF9gpbpVReuCCvxNqGeyn9WBaZm7Q2v4B5Aj4tg2g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad5put5j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 14:18:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5533921eb2so699145a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 06:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763043515; x=1763648315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PYfAGt7xLkn4IooIS/dHIQutIGT7n93ycU/0f7jdrwk=;
        b=fHFYuCyTCxRP2paq5NpShMNdHpNYheqXhDwMSRMhaWcJSlTpY+pLLriU0YS353wbXQ
         ooK0L+hdUHfwUXrFJ7UOpijvLzqPNZG1zUzQ6EGTVNa7Z445q5XFhW8fT1eLtuyGrj0I
         471ulT7lATNStZrV2aziqFl/eJIYNSlZ3nf+8y0Dci3VM5RU6n4zPhXQa1v30FzOk88K
         PvSjoDTLjotSWTLsl0VKdLosOCqJ/cUop8ddJ37lq3HlyRDttX76yawqICE4taoXhe1w
         ErcPIVfEAn6Tl6wQg0rv+fFeB5n8Pd/Lk5Vtu9wjQCbPJpvSne8z5XV3Y0EgqkTOU0+g
         Yb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763043515; x=1763648315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYfAGt7xLkn4IooIS/dHIQutIGT7n93ycU/0f7jdrwk=;
        b=SxNq+Ktb3TUrNDpxRXFMiTWtGJSEpnDouZOAaD5LW3enzZv2UEpWpaMY2nVua2LXgs
         QA2vPTtcyPDeNvOG0HWwfjGb3FIIq6eqR2thI4h4RtP2TGbW33+hWwZt7YM1Azu58mn8
         c/BjA/QJ9OFVGWBe1u4FJxhO93G75psxzJ7rPWNDyGAZ0PsPCDmTfGuTffEqoM8826gq
         HjUKwD0TMj2f0LVR0OdzPd8myeD0ejcFE7Mrx0GtBmo7SQr7DdbWtqO73QeQot+OWy3W
         HdLzR+TmMrQt7mKGuIk5MAyDIwTz56F/ztT2sQaP6C3zCmQLJCH1loiiQ3Lbo4/ZD9c4
         3PbA==
X-Forwarded-Encrypted: i=1; AJvYcCW4+YDqQl+xSv9aMCABzOOgH656onWHG6xZDYHrze232rXhLzdSRaP/aL/qPiSHi3LK3nliAAPmENVX73TA@vger.kernel.org
X-Gm-Message-State: AOJu0YxjvHPH8KPgCK2l13YJ2MRvJiG3/mf3Z8wwWkoOWKxflL6im3aO
	AxEHduOOrcME0hPrGwdBnqqPoOv8pnau7XzSmgL+DLicaC6FZLBlg07uzmMYpq7yBl6JVvTSf/V
	wUNAfCIDvUJpBvy8cjV3rSs3rjymr7FhVayvU1FwCCfYVXzPN/YWsDQy3qEFVHNKArTNq
X-Gm-Gg: ASbGncs94J29gnH4g1V1laOERhxxgVznpmCqRnhdLneLE+Zt/mHfLAVT4RYW7WFOmCI
	i8Rqkay6ZsVE9+oq+0fNm4PSwaXLpBjk8qz9S2ic7GDDY2/ZSvQZyTb4IMoLGTgQ/euPlZVItBN
	bcSANDdRKlq4TcR1EAgu7l1AgaTm3sjqgJVcNFsOppGiLD4Jp0db5f8UdhWFXU3OzOFhv/NVDGX
	116stPmiwIP5kK7u2ESHlygnWMWX7TfeU2WVG/9y75ijTEHrQgyZZXeB11ZPYkZqmyXIGTbiOov
	WXGKm1ayF22ETld+XoDRJaQ7jMKZoyaXjdX4S0gytvQsWsYeWyOimWCLxiw1GJbeLlPXWZGyver
	6x+3m/9h8MszIGOnjQsnkGXZ00Q==
X-Received: by 2002:a17:903:1c7:b0:267:f7bc:673c with SMTP id d9443c01a7336-2984edccae7mr85923205ad.44.1763043514538;
        Thu, 13 Nov 2025 06:18:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJyQhQCidxyHZGx2ofEawlrPhEHp8JTQarlTsdV8cD9Z81y5uxOIWAhSZjP2GH3r0u2/kFpQ==
X-Received: by 2002:a17:903:1c7:b0:267:f7bc:673c with SMTP id d9443c01a7336-2984edccae7mr85922725ad.44.1763043513787;
        Thu, 13 Nov 2025 06:18:33 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245f74sm27334445ad.39.2025.11.13.06.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 06:18:33 -0800 (PST)
Date: Thu, 13 Nov 2025 19:48:26 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 04/14] firmware: qcom_scm: Introduce PAS context
 initialization helper function
Message-ID: <20251113141826.qvjz4ozlnvx3ucw6@hu-mojha-hyd.qualcomm.com>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
 <20251113-kvm-rproc-v7-v7-4-df4910b7c20a@oss.qualcomm.com>
 <aRXHlL49sSGML__G@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRXHlL49sSGML__G@linaro.org>
X-Authority-Analysis: v=2.4 cv=E6/AZKdl c=1 sm=1 tr=0 ts=6915e8bb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uguQWuAc9R0SQO7IgggA:9
 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDEwOSBTYWx0ZWRfXwj44UN2GC8i0
 skTWyqMkbZEKvREnUJsUilCBQT4+Z5mWhaAItgOuCoHGIATYSRlZChcHPablHRvjV26tbTDIG1/
 5kHu0YPcpzvVvYeU/3rbjV/DxE9+E+9fLP3/CjoY2iGhcf9OICpqqi6M8GVfwXq4/mIxJo/zhGr
 C8b1qTQC4xa5jrRthL1NOfunxGfsFH2trebSxtWJI42JnSURi7VEmqtlt8WCnZXGON6bS/uCvQu
 UzelHhNQw7KWhV5InzzXz9RbNh6TxzwMMi1qQRedVBF99GR2vbF6KN71rsSAEeN6seKJphDFO5Z
 w3W5/1hPOkGgtWGSNnks/BrAeZUtlyemSYmcvh9k6eOQ700RMcSdRhMr/QceVnRP/GzbxbxFQi3
 vUYEslZxMFaFSBcBawxV8J/vHMZneg==
X-Proofpoint-GUID: kdCA24VkEazq94CFOT4DR0EtgB7SihDS
X-Proofpoint-ORIG-GUID: kdCA24VkEazq94CFOT4DR0EtgB7SihDS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130109

On Thu, Nov 13, 2025 at 12:57:08PM +0100, Stephan Gerhold wrote:
> On Thu, Nov 13, 2025 at 04:05:54PM +0530, Mukesh Ojha wrote:
> > When the Peripheral Authentication Service (PAS) method runs on a SoC
> > where Linux operates at EL2 (i.e., without the Gunyah hypervisor), the
> > reset sequences are handled by TrustZone. In such cases, Linux must
> > perform additional steps before invoking PAS SMC calls, such as creating
> > a SHM bridge. Therefore, PAS SMC calls require awareness and handling of
> > these additional steps when Linux runs at EL2.
> > 
> > To support this, there is a need for a data structure that can be
> > initialized prior to invoking any SMC or MDT functions. This structure
> > allows those functions to determine whether they are operating in the
> > presence or absence of the Gunyah hypervisor and behave accordingly.
> > 
> > Currently, remoteproc and non-remoteproc subsystems use different
> > variants of the MDT loader helper API, primarily due to differences in
> > metadata context handling. Remoteproc subsystems retain the metadata
> > context until authentication and reset are completed, while
> > non-remoteproc subsystems (e.g., video, graphics, IPA, etc.) do not
> > retain the metadata context and can free it within the
> > qcom_scm_pas_init() call by passing a NULL context parameter and due to
> > these differences, it is not possible to extend metadata context
> > handling to support remoteproc and non remoteproc subsystem use PAS
> > operations, when Linux operates at EL2.
> > 
> > Add PAS context data structure and initialization helper function.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/qcom_scm.c       | 32 ++++++++++++++++++++++++++++++++
> >  include/linux/firmware/qcom/qcom_scm.h | 12 ++++++++++++
> >  2 files changed, 44 insertions(+)
> > 
> > diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> > index 0a0c48fca7cf..e4eb7f3ab7a5 100644
> > --- a/drivers/firmware/qcom/qcom_scm.c
> > +++ b/drivers/firmware/qcom/qcom_scm.c
> > @@ -558,6 +558,38 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
> >  		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
> >  }
> >  
> > +/**
> > + * devm_qcom_scm_pas_context_init() - Initialize peripheral authentication service
> > + *				      context for a given peripheral
> > + *
> > + * PAS context is device-resource managed, so the caller does not need
> > + * to worry about freeing the context memory.
> > + *
> > + * @dev:	  PAS firmware device
> > + * @pas_id:	  peripheral authentication service id
> > + * @mem_phys:	  Subsystem reserve memory start address
> > + * @mem_size:	  Subsystem reserve memory size
> > + *
> > + * Upon successful, returns the PAS context or ERR_PTR() of the error otherwise.
> > + */
> > +void *devm_qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
> 
> Why does this return void* rather than struct qcom_scm_pas_context *?

I kept it similar to align with other devm_* api, however, I can change it to
struct qcom_scm_pas_context if it looks more reasonable.

> 
> > +				     size_t mem_size)
> > +{
> > +	struct qcom_scm_pas_context *ctx;
> > +
> > +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> > +	if (!ctx)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	ctx->dev = dev;
> > +	ctx->pas_id = pas_id;
> > +	ctx->mem_phys = mem_phys;
> > +	ctx->mem_size = mem_size;
> > +
> > +	return ctx;
> > +}
> > +EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha

