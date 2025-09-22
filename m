Return-Path: <linux-arm-msm+bounces-74383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6607B8F13A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 08:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2F0D7AA385
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 06:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D097242D91;
	Mon, 22 Sep 2025 06:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnGtzfUq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7C021C163
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 06:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758521315; cv=none; b=M6Gr99JzW28UIgYZ5dKq9+96tERsasmhi+IuEnJ/SAwLrjV/BscCe3Bu2rQslH1bTK5ZIt+hkdrgGDNH3lXTZkJCf0wRQLVxot/ikBA4ZDH2m7kmOLBx9T9qi0ebkR3b2moOxX5GMlG1BcuMFPLk2TVt3MT6Q4fjAMmwrh42DYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758521315; c=relaxed/simple;
	bh=IDeCGnTalHX3T7NUX5lLcn7U2RTxQnMhyPrXKtsl/Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yv5yZdZdvyGOBDq1v2VFG+JWgJcrPsYYsqpzdo8aPbMm63sbcpWqMpJqghih0tKZ34nI3lKh/xiSDtxbIuMq3+1E8J9PTgiyYp40Kbomv2p6LgQzdWPhkSLIzMSZAtYpZ+ZQVXzUp92xD451t0WXOLmOUWBkS03unHI1c4pMOKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnGtzfUq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LF2D99006850
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 06:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DNso+X5TFBbICS+hz8yOAV8D
	VBBPw5nkoo+yOiUYWYs=; b=KnGtzfUqHLrbX4ktl+2QnrCpFZSZLZ1axdHY5Bh+
	BKm7tN3ognSbn8ZI00Ka05LEB7TE86+hHcmYmmLeLN+RwfSpibv1+de3S85AxKEI
	FBJ/yHrxs8ztw1neg3IKZLFCvqJNU3rsA5Cs2cYvjpfa+sdWsLQ6JukRIV5IdO8M
	CAGu3XDx9iU5RjNYxOWp2J0zP69ZTvyxWpX9sZZSc2byDnweEeuJOP1Vz2+mL+52
	zQYXmB3yP8tXmzKDQ7IHRe7pz5aHSGZp9O1Onlbk13J3PBSqbhd337pduN6/fbFe
	K3kmpmQS7ADMb+KAD2IPVHXlUdkrGcEFp4cL9DemW0Nebg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnksx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 06:08:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b54d6a67b5fso3052036a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 23:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758521311; x=1759126111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNso+X5TFBbICS+hz8yOAV8DVBBPw5nkoo+yOiUYWYs=;
        b=R2wwyYBvE/4nnVvLhB/HrARoeT2Tw3NePEkParGvsDNT0AxovqHdFTw3+wp5GXkYn+
         FCWZn4EVMNuZc3WPXCFMVInLSTbj52ie8jQS7CNHMHN4V42jLwksPhDGencmQIaf4icF
         kSuSA4QDSAjob6rutakEozI2g2WOk4tjCSNl/Jb6F+VuQlm7XDJ1IhpQTLd9N8YmR/C2
         HjaZARWy7kimve9eppowHwmmH6UZiXR6tTRNO53J8uHOyuL5eiFdH9iuJivczlf50aIb
         sWrPEPQrizmHImsrdYC6vCkLm+8ipmOGFnE83bWnDs3aphLnKfWq4YmQELpdOrllzFMB
         qpQA==
X-Gm-Message-State: AOJu0YyjJH8SBW7Qwpj8mmBgoQoM1k2tXq0pvvEqM8M7cMmThy9u2wfX
	Vs1jwbdMHukboO0og95wMnpMxYvPpwU7KApgKEzN5Bn/Tp1oCZ5OIg9xNOIXjeR/Qand03CAraV
	kfYp1v37qfTXwiNmog6XCpEHx0cJwlej+MOCAB3PAwv4wDxLjx1/5DWbnD0C6uGJ2RlAq
X-Gm-Gg: ASbGnctQN1pszpmaXOgjEUH1nIu3TP+RQfkrCKuXLmBhdXlCJu1Z6QDEXqaDYjJby7H
	9A0ZtJBZfynQMu6G4h+SOV7auwYjF1cwfRlVbAq887RApV3tAny+rvSBmYXrFvtFseSjwqj5X2W
	66yY7lknrlv5UnOr7KKCljH6IkWOMFtu0VwhOT6bdVwRQTBF8xp6eRzRH4G10bOepTc/PT/vmzt
	ZydsbTEyfByyPruErqInsH88vwURqV/4N+Gjole5q22BCPpvEepXulBvn88QIaLw1tNZBrhgbe9
	erOO0tQHzfrIVMMH22Yk3b6js9NKWBS1uR6TWImes/Bs5xxQDyBiA2pMCSRMTj2By+U=
X-Received: by 2002:a17:903:22c9:b0:277:9193:f2da with SMTP id d9443c01a7336-2779193fd50mr35333175ad.5.1758521310850;
        Sun, 21 Sep 2025 23:08:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKFMR8879Pl4lZyZ2YF4Lh/8cDAxLwZpRuzeHq+bU9jRrd9agMM6wzkTs9ZZ4iKfo4TduB4A==
X-Received: by 2002:a17:903:22c9:b0:277:9193:f2da with SMTP id d9443c01a7336-2779193fd50mr35332945ad.5.1758521310376;
        Sun, 21 Sep 2025 23:08:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802deeb1sm117970665ad.78.2025.09.21.23.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 23:08:30 -0700 (PDT)
Date: Mon, 22 Sep 2025 11:38:23 +0530
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
Subject: Re: [PATCH v3 10/12] remoteproc: pas: Extend parse_fw callback to
 fetch resources via SMC call
Message-ID: <20250922060823.upc6r7mbxcm2c66w@hu-mojha-hyd.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <20250921-kvm_rproc_pas-v3-10-458f09647920@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921-kvm_rproc_pas-v3-10-458f09647920@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d0e7e0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=fIUZ2iN8pujUo_8L_LEA:9
 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: yOmwJuhCyteBFRMvPP5nwez1hQk5xTiu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX46kfZzY6NoW3
 ecDN+lDsrqhhI9BMGXLC3Cc7fA+UtJzIAa4aq/DBMPL1Oi4/gjtj98ucI8foazAUn4b8FsGJWDw
 Ytu9e+tjUop4p254yIRJDoxM2CCo3J52pzO4Z6Ly/JAWsMyT9mybNliZVvKX9hHhRDAtHVHPbxd
 GqOp8EaG3gxMEzOzJzY4n0oMxD607Fh98fyElydv8TOG3P9K1N+UrcgdehpfEhGnp9ASOMmnkzr
 tusl80/B8qIDwmLqyOmUjHtMqGrTZG6smmTyF+DjuYCm4lpbAVcYqnUTzZ4RjRLYk28frSLvIjV
 +KDZIvD9zSRq4owlB/9+RK4moLNIEJ1VymSI2yIUgY8uefJWP9CMZ/ShiBjigWh86IFBWgXr/bL
 mjo1WsBf
X-Proofpoint-GUID: yOmwJuhCyteBFRMvPP5nwez1hQk5xTiu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_10,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On Sun, Sep 21, 2025 at 01:11:08AM +0530, Mukesh Ojha wrote:
> Qualcomm remote processor may rely on static and dynamic resources for
> it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
> or older QHEE hypervisor, all the resources whether it is static or
> dynamic, is managed by the hypervisor. Dynamic resources if it is
> present for a remote processor will always be coming from secure world
> via SMC call while static resources may be present in remote processor
> firmware binary or it may be coming from SMC call along with dynamic
> resources.
> 
> Remoteproc already has method like rproc_elf_load_rsc_table() to check
> firmware binary has resources or not and if it is not having then we
> pass NULL and zero as input resource table and its size argument
> respectively to qcom_scm_pas_get_rsc_table() and while it has resource
> present then it should pass the present resources to Trustzone(TZ) so that
> it could authenticate the present resources and append dynamic resource
> to return in output_rt argument along with authenticated resources.
> 
> Extend parse_fw callback to include SMC call to get resources from
> Trustzone and to leverage resource table parsing and mapping and
> unmapping code from the remoteproc framework.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 60 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 58 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index ad87e0334a7d..9a0c0e8f5506 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -34,6 +34,7 @@
>  #define QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS	100
>  
>  #define MAX_ASSIGN_COUNT 3
> +#define MAX_RSCTABLE_SIZE	SZ_16K
>  
>  struct qcom_pas_data {
>  	int crash_reason_smem;
> @@ -408,6 +409,61 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
>  	return pas->mem_region + offset;
>  }
>  
> +static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
> +{
> +	size_t output_rt_size = MAX_RSCTABLE_SIZE;
> +	struct qcom_pas *pas = rproc->priv;
> +	struct resource_table *table = NULL;
> +	void *output_rt;
> +	size_t table_sz;
> +	int ret;
> +
> +	ret = qcom_register_dump_segments(rproc, fw);
> +	if (ret) {
> +		dev_err(pas->dev, "Error in registering dump segments\n");
> +		return ret;
> +	}
> +
> +	if (!rproc->has_iommu)
> +		return ret;
> +
> +	ret = rproc_elf_load_rsc_table(rproc, fw);
> +	if (ret)
> +		dev_info(&rproc->dev, "Error in loading resource table from firmware\n");
> +
> +	table = rproc->table_ptr;
> +	table_sz = rproc->table_sz;
> +
> +	/*
> +	 * Qualcomm remote processor may rely on static and dynamic resources for
> +	 * it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
> +	 * or older QHEE hypervisor, all the resources whether it is static or dynamic,
> +	 * is managed by present hypervisor. Dynamic resources if it is present for
> +	 * a remote processor will always be coming from secure world via SMC call
> +	 * while static resources may be present in remote processor firmware binary
> +	 * or it may be coming from SMC call along with dynamic resources.
> +	 *
> +	 * Here, we call rproc_elf_load_rsc_table() to check firmware binary has resources
> +	 * or not and if it is not having then we pass NULL and zero as input resource
> +	 * table pointer and size respectively to the argument of qcom_scm_pas_get_rsc_table()
> +	 * and this is even true for Qualcomm remote processor who does follow remoteproc
> +	 * framework.
> +	 */
> +	ret = qcom_scm_pas_get_rsc_table(pas->pas_id, table, table_sz, &output_rt,
> +					 &output_rt_size);

It is a mistake from my end, this pas->pas_id should be pas->pas_ctx

> +	if (ret) {
> +		dev_err(pas->dev, "error %d getting resource_table\n", ret);
> +		return ret;
> +	}
> +
> +	kfree(rproc->cached_table);
> +	rproc->cached_table = output_rt;
> +	rproc->table_ptr = rproc->cached_table;
> +	rproc->table_sz = output_rt_size;
> +
> +	return ret;
> +}
> +
>  static unsigned long qcom_pas_panic(struct rproc *rproc)
>  {
>  	struct qcom_pas *pas = rproc->priv;
> @@ -420,7 +476,7 @@ static const struct rproc_ops qcom_pas_ops = {
>  	.start = qcom_pas_start,
>  	.stop = qcom_pas_stop,
>  	.da_to_va = qcom_pas_da_to_va,
> -	.parse_fw = qcom_register_dump_segments,
> +	.parse_fw = qcom_pas_parse_firmware,
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
>  };
> @@ -430,7 +486,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
>  	.start = qcom_pas_start,
>  	.stop = qcom_pas_stop,
>  	.da_to_va = qcom_pas_da_to_va,
> -	.parse_fw = qcom_register_dump_segments,
> +	.parse_fw = qcom_pas_parse_firmware,
>  	.load = qcom_pas_load,
>  	.panic = qcom_pas_panic,
>  	.coredump = qcom_pas_minidump,
> 
> -- 
> 2.50.1
> 

-- 
-Mukesh Ojha

