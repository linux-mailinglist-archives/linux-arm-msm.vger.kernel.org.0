Return-Path: <linux-arm-msm+bounces-76759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5F2BCBC5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 08:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD094423981
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 06:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD499235045;
	Fri, 10 Oct 2025 06:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1KDE9Fw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AABD227E83
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 06:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760077300; cv=none; b=HcoV92EAiairy9io6KRIXJEpyHGud2bLTudJJ1X0xSShPA1lMtx8cFtSSCVLQSArvOobsyjj/afdwd3VyRRtW6QkJs/aqQbzSmiffasQigpPiD7cUPxCR1mNdZmjYSLgM/Ys5nMS4Y3sQAlx68eOO+Zekj0yi3u2cOgWRq6P9Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760077300; c=relaxed/simple;
	bh=aMhdMuV/5n0XxxWRTIt0WPoXUXnD8K8moBE09tX22ZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VB1k8S2ClqRooF1TiVKYloHrsMwXh5K3UgcoPEjCu+F6ibxp3i5sUrQX6q63eog1C6D+FPHJQ1+Hcwv89115jahIMtsX9k32gBHTY0OG0A4XTxeeMVu6HAU5HAiNc8FRS4pGRBRorICsckNt1b+/xh7uR21r9fpZ6wXPET6/TQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1KDE9Fw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59A6JRBw013060
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 06:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e13hlBdIwI3NhYtoZcu6Tz3K
	/F+frP7s8cc8T89sknA=; b=S1KDE9FwlBShxZetwR2Wc3JULQL/BcRy5swN2OGM
	ngAirXrgZzpfEZUYf2uSUE2GrxEoWy3FW0k10ga6oymECKO+5BpXr/49AQvT5e61
	Ocfw1gKk/fFPHdKDx3k1a6y7lgBrEiToXG7bPE8J9owzVsglZWTOa/zh9B6c9rF9
	3hA2De7sBQTRqeLVcMvl/xqSS+JTRV2FRPPbz8Vx6OD0FVlmx49uXfm5er6dC8RP
	pVcauezBTcfpFDIYz01gKLl86YXTbvMP6NIyu/gCcmoFQp7UITPQuthPfCAzn0Qp
	c10mYEjrdiUgjX9lCbeuis97mnTyCJ5Y0/ovhu+GcJ1GQA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4knavh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Oct 2025 06:21:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2698b5fbe5bso42681335ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Oct 2025 23:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760077297; x=1760682097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e13hlBdIwI3NhYtoZcu6Tz3K/F+frP7s8cc8T89sknA=;
        b=rnT6N1EoBv1dVyu5lz2sLDN1UrhZ7uYQvuNsvSnbQrb2+dFwXzQoquGV5MjViNm2NV
         tXf5EwoVDbxhfM2MkNYRxp8QLi30GfjamkMeur9CttEq63hIMFn0DC/3WvfLbUuxiZE9
         8+mPG9gL7DBDVm0KL1bglC5iCkjw9OR35AxnyJDHrJlffvivt84vf90niLkAwpH0oTFf
         g8K0BqmHzhvDXVEiN0hJhiVoxMQ+1r7uIguBl+GWEddypcmIyTg8dBTfxapsuWINHftL
         2QWree2J3EKaVVZu4REHH88fzAx/9FsuIFg//NzqIxahqyP1oydu0FoC4n6v+cAyn0MA
         j09Q==
X-Gm-Message-State: AOJu0Yw485whvR7xD06GgKRAhZ5XqN1I9UAyT46fp74a6DcE0ZWcE3eb
	7v1sLIK28tBQmE1btQdDQoX0p1zex+7kHl4NzGcUky5ewNObvezOTGQ0o5CWKL6JEu0P7qlAYSS
	N28ZfjXYulQJDjWYZPKcLFXZLBONkwqBrSMHMJ/cw6bDoKO5WbNmuSRYrMtj6GRocOAjb
X-Gm-Gg: ASbGncsswbrGSjtqJHweCisgqampIbop7Y5omsRe+a8Wm7VoQSI9GcfHKLaak91/U41
	AfS4TxVY/9RFe1SlzwY2TVi4UoWnkMOT2tzR0q6sKlxtfW8LCRiLGKXsCycawOUMUCyphxmaQdW
	l/M5VfjhGY6UnXTHJUbei6NDpDkcU2BSUCoVoesxxD1gJkqXWUCGdkFvFKyUEJY6smZ8Oj16e8Z
	HPALnwFvFl7jWWw3i6yyeSupxbM7tmZLX6ZiXYMrs8nUykQAdYV8DegpTw8j2SdWjLG4PdKcgAX
	VNWhXlKvtsro4yylTB8ZFZdFbvyeHI5Qs1NlZEcI6m5F1FOzLPqymhk50T418tc0sog=
X-Received: by 2002:a17:903:2c0c:b0:24c:cae9:77bd with SMTP id d9443c01a7336-290273032d9mr131306205ad.54.1760077296977;
        Thu, 09 Oct 2025 23:21:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEm5rfxpK9hr9wzL70jfmd5cFc+zBjzoFBTNU0+gbJ7q4MWYYUoZ/cU4hiwJy2Hc0lOqq0CRg==
X-Received: by 2002:a17:903:2c0c:b0:24c:cae9:77bd with SMTP id d9443c01a7336-290273032d9mr131305985ad.54.1760077296377;
        Thu, 09 Oct 2025 23:21:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de658bsm46996665ad.22.2025.10.09.23.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 23:21:36 -0700 (PDT)
Date: Fri, 10 Oct 2025 11:51:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 04/12] soc: qcom: mdtloader: Add PAS context aware
 qcom_mdt_pas_load() function
Message-ID: <20251010062129.xuh63zgbc3pfp3ar@hu-mojha-hyd.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-4-de841623af3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-4-de841623af3c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=dojWylg4 c=1 sm=1 tr=0 ts=68e8a5f2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=hC_cApFbebj-mLVYSEcA:9
 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: tdEoh0Ny7mzqdlc63A-lq0MrPAesbQ6l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX+xmOseLZJ/Y5
 mZ0WwGMG/8K7zzKDc1lEwqvqVpIrUjbR95KAoCEfmkt5oIIRY3KM8vvuVM6Tdi96cDjUKqPJrG4
 mXG0kkryyCBkEC09vu5z+k0TPczBYSPw2G3YatuK7Z4StqKjtBor874X5AYylK6f27pqD2Uf1Fr
 jfKdkdJLs27r41alTSyR6ichS6HJekYs6rdMXvzG7kerfqFvFGNfFpUnUQGuUgJs0Oh61+oeBHH
 v2XJVy6Rt5IrBnszaC+BDwUAre9KfjIobOyqgibnKHkm9/9YzCzN/R7nRI60BNi5WSH163TvQMP
 O1KLEcVokyIZVJkGThKYIlpGj8ZINkI3SEU488iNmjlX6pJKAVuDaO3Wr3aia0j5r6q0ERFDuBX
 FsEJb2CmEsOPaPnkQ4z6DPUQQph/YQ==
X-Proofpoint-ORIG-GUID: tdEoh0Ny7mzqdlc63A-lq0MrPAesbQ6l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Tue, Oct 07, 2025 at 10:18:49PM +0530, Mukesh Ojha wrote:
> Add a PAS context-aware qcom_mdt_pas_load() function for remote
> processor drivers, which can use the context pointer returned from
> qcom_scm_pas_ctx_init() to perform metadata verification and memory
> setup via SMC calls.
> 
> The qcom_mdt_pas_load() and qcom_mdt_load() functions are almost
> similar. Clients using the PAS context-based data structure can adopt
> qcom_mdt_pas_load(), and in the future, all users of qcom_mdt_load()
> could be migrated to use qcom_mdt_pas_load() instead.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c       | 29 +++++++++++++++++++++++++++++
>  include/linux/soc/qcom/mdt_loader.h | 11 +++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index a5c80d4fcc36..31855836b251 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -486,5 +486,34 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
>  }
>  EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
>  
> +/**
> + * qcom_mdt_pas_load() - load the firmware which header is loaded as fw
> + *
> + * Client should initialize the PAS context with qcom_scm_pas_context_init()
> + * before calling this function.
> + *
> + * @ctx:	PAS context pointer
> + * @fw:		firmware object for the mdt file
> + * @firmware:	name of the firmware, for construction of segment file names
> + * @mem_region:	allocated memory region to load firmware into
> + * @reloc_base:	adjusted physical address after relocation
> + *
> + * Returns 0 on success, negative errno otherwise.
> + */
> +int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
> +		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
> +{
> +	int ret;
> +
> +	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys,
> +				ctx->metadata);

There is no user of qcom_mdt_pas_init() now after this, this can be
converted to __qcom_mdt_pas_init() and removed from exported list.


> +	if (ret)
> +		return ret;
> +
> +	return __qcom_mdt_load(ctx->dev, fw, firmware, mem_region, ctx->mem_phys,
> +			       ctx->mem_size, reloc_base);
> +}
> +EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
> +
>  MODULE_DESCRIPTION("Firmware parser for Qualcomm MDT format");
>  MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
> index 8ea8230579a2..2832e0717729 100644
> --- a/include/linux/soc/qcom/mdt_loader.h
> +++ b/include/linux/soc/qcom/mdt_loader.h
> @@ -11,6 +11,7 @@
>  struct device;
>  struct firmware;
>  struct qcom_scm_pas_metadata;
> +struct qcom_scm_pas_context;
>  
>  #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
>  
> @@ -23,6 +24,9 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  		  phys_addr_t mem_phys, size_t mem_size,
>  		  phys_addr_t *reloc_base);
>  
> +int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
> +		      const char *firmware, void *mem_region, phys_addr_t *reloc_base);
> +
>  int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
>  			  const char *fw_name, void *mem_region,
>  			  phys_addr_t mem_phys, size_t mem_size,
> @@ -52,6 +56,13 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  	return -ENODEV;
>  }
>  
> +static inline int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx,
> +				    const struct firmware *fw, const char *firmware,
> +				    void *mem_region, phys_addr_t *reloc_base)
> +{
> +	return -ENODEV;
> +}
> +
>  static inline int qcom_mdt_load_no_init(struct device *dev,
>  					const struct firmware *fw,
>  					const char *fw_name, void *mem_region,
> 
> -- 
> 2.50.1
> 

-- 
-Mukesh Ojha

