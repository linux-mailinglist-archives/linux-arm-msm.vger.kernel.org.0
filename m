Return-Path: <linux-arm-msm+bounces-82369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1FCC6AC1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 17:54:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D438F3A22FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 16:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76262F49FD;
	Tue, 18 Nov 2025 16:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJ9rnNlF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KSH3hUha"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0002329C67
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 16:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763484182; cv=none; b=BHvTP9ySNtOwBBr8vweFxMCkttV3x1m0Ul8SR7kdc5OD+S2DTZotu9s4F/sQPfOtfPmoQtTtp0mwMgvxM16xM3zs2OLU75eaLATkwb89Empq2hYf+U7rs/CxMhYUNPfy5Ye2iA0twCIq5prBw7Y3+zvf6RGbbY8zqIjIveMdu2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763484182; c=relaxed/simple;
	bh=SxXDkH0uydEg0P7HjnL36I+WfP0T/L0dxQo4T89vUd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHX4n6a3auOOt6QtzyVT1v1DSBjJKwMtlBd6kD8l/qnkkQn6mJx5TWvG7MUk5my6RCGc2WBuSIAJx7eDdwLBepZO94MmCeLg3UD4j/FQvLKANzSWM4z2AO6EHyfxtEy6gA1OqKUjxvJvCfcLEkOLuTF4IbVjfmsPzC3w09sbEmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJ9rnNlF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KSH3hUha; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIFwkGc2194538
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 16:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9e8FkMMpOouMo4+1r0CLYHKO
	N8kEn7MpWmw/3G+upC8=; b=mJ9rnNlFsFZ8okS1RQ8CK5BzpNQLTEXeCiA24jBy
	aF7vQCjMlznsktKgBUTB+IPXiOoe1HGbQk/GCrtJnKDB+IAZfAwY4wzNfni5JbXb
	UzrI7d2YrR1cn4kdQHqhcRc1Uw98zSjacKMhLKFAANOQ8PI3DD8ZjrOZf1Doy63U
	r6GLro70Y5+DwPwtorYQvuej0AcNKmzjbX+dSSAl8Izb+ErxNDun4G+o3dkhgFeE
	ftLdGlHJUkgaNB30IR2uUBko+7XbDiPM0foniV0bkpVLQ1kklNvePvQ/+cY/47D8
	HueqchWk41eJHmn0ZhGLOjCUaDt4El8HBLl8G1RTkVMjCg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agn3y9gnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 16:42:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7a99a5f77e0so11728991b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763484179; x=1764088979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9e8FkMMpOouMo4+1r0CLYHKON8kEn7MpWmw/3G+upC8=;
        b=KSH3hUhatuRoppTICvK6Ms0d62P9Obb5nWdh5k2694VCZDe5Gudiwrtt5sI0RN/CNc
         9ZgHhJCPZ2RwnhTyWd8C4srUbVpApVE6VtKh4uuByNZPqvcFVTwLMI8oJvRI+ZnxPr80
         RbQHFeaHxJjCrnuQwbU0snnV2ODYurO0RI+upNI9XXGrN0VzES25WRyv6QbPgvUWsrUI
         g6/832GqXum/GVEJud5BSqCOLLTX1UFJ6cgdRgINDNUpDQVb3QVoG3zpao483cyXeVwN
         KNcpbig8rSyxmW0ap4TCos3glNzVbFBjZEQmtWeKrX5XBtW/UREm50PeTR1NzTdJIn7a
         9rnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763484179; x=1764088979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9e8FkMMpOouMo4+1r0CLYHKON8kEn7MpWmw/3G+upC8=;
        b=BQIkQ5T4XT8y65YyjLK99tna54raasj7KPGB9pFGJYLpZlm6HPPUyKvQbO1cRoC7RV
         SqANV2G8aROvKAmQfYkvLeUldPux/MPO8/LKUXqBNFStWAeE7OCra8ve1pK1GqfIOvwk
         VhVUnOjepT1h4b4tMH6Mmyb65FtiUrNchPqIIyxFrXG1f0YJy7sjndTFMFWmnLuzYuO4
         G80WSioq3tc7mmrwzD4tUp6vBaCKiHaYXRDmiQmyy4KnHO+w1WAegHslpkUp73QUpu3W
         +tyv08ttO2r/mIh8e45jT2aWIX72jUs0zwmNmJ5t+bN2oOyLAuP5uBr0FDioB1GgNkbf
         noeA==
X-Gm-Message-State: AOJu0YxTU4CkYSsPJcNt23XjzrsvznsqqtBb8ZM4+pUNZvlxxGMjG1pL
	Arlwtb4QtT6TE0rYTk+SNge9+M3QomWl0qDmeHdUQ6UIcl+D0KCwbGvlAlvpdQrjYt3EVmYRp92
	gFH/jyDdb1GzC4r2V/1Jsth0LboBwFN9c/L5ppYiu4tJjqWHc3Iy3nds8S5dY2nubpHaF
X-Gm-Gg: ASbGnctHTiD2KRmwkIwLeaSE4/qu4uhHvaZljTUkTMeMxhWblToPruodLJRhqYrgA7l
	RiBZJoyViHiD6Iq80JzCguDuUbDzTJWxZBBLqoQH3yWRndJGtCj3rFVg4V7zkZtXr0wRe5uzj2v
	ntRJ7E6uQdYGCSZ8o+K+XUToCISVRkSzjSXP2A3XPw+UIDu39Vbx7WlKHnq228xV0a3/NNji/I/
	nY0He4q+9vuwerpnA3l+/e2nHMJoqLoUIzzH9AWhGiZ86oRbL5RshJk2mRLwOegWePVwcuTYR32
	tpuG65MWNOwBU1cdJM4lPY5rACFUD4V9ibUZMjfgbFZB+nzbOO4aYnkCczBX04FWWnfuij2zFfN
	VTVANYH9ANB9QifD2HOK3bmFYBg==
X-Received: by 2002:a05:6a00:22c5:b0:7aa:3642:2173 with SMTP id d2e1a72fcca58-7ba3c087d4bmr22595549b3a.31.1763484178849;
        Tue, 18 Nov 2025 08:42:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/rMOaMFg7Po57XsiubX5Y1BBeJihzInIA+j7lCqPD33sCPd/S3CbW0di+VBPDBkQNGy5cvg==
X-Received: by 2002:a05:6a00:22c5:b0:7aa:3642:2173 with SMTP id d2e1a72fcca58-7ba3c087d4bmr22595502b3a.31.1763484178172;
        Tue, 18 Nov 2025 08:42:58 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aeda22sm17089697b3a.2.2025.11.18.08.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:42:57 -0800 (PST)
Date: Tue, 18 Nov 2025 22:12:51 +0530
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
Subject: Re: [PATCH v7 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Message-ID: <20251118164251.enicfamfjvezy5hb@hu-mojha-hyd.qualcomm.com>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
 <20251113-kvm-rproc-v7-v7-11-df4910b7c20a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113-kvm-rproc-v7-v7-11-df4910b7c20a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEzNSBTYWx0ZWRfX9dsmIPQPlazl
 8X0KTQkhPDpixTGnUr7ifIfdM9GLpkqxosTPIPGgz6137MoOf+AcKQr2shF7CHiuLMma7YYgXJH
 JeJL5vSbAwCHseWBPGu6E08EVO2Al5XnSZ6ORtcviBZVGHSlKGAuDFqeezrjoeM0wv+HRMsWY3K
 H3BZx3JakYHFFt2ZE3eYL6TM99KeT662WQb6UV1KqGYNTJ5Iitdby/QgdkNGkU9zQCr76wOM7jz
 WYNNoZMi7W6odLeJ824LZxR1qHpLbw5yK5x4A4JEM31FXbWrMXudfGXgwrwxaqTUiqVj5g4DARw
 SA+yCgR/yvA8WUredM3/XNFGfR9X+Kirp7XwohKS6q+uve84CyaF+LOaDwDChPN/goOimZtuAYF
 w6h+jTiTFnNZWAK7bk+ZzFsnMSv7NA==
X-Proofpoint-GUID: sGe7mwWk_ySB7DChioC6rqnqIPIm5dnB
X-Proofpoint-ORIG-GUID: sGe7mwWk_ySB7DChioC6rqnqIPIm5dnB
X-Authority-Analysis: v=2.4 cv=FtIIPmrq c=1 sm=1 tr=0 ts=691ca213 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LFohi5oHqGIkdHK9ScwA:9
 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180135

On Thu, Nov 13, 2025 at 04:06:01PM +0530, Mukesh Ojha wrote:
> Qualcomm remote processor may rely on Static and Dynamic resources for
> it to be functional. Static resources are fixed like for example,
> memory-mapped addresses required by the subsystem and dynamic
> resources, such as shared memory in DDR etc., are determined at
> runtime during the boot process.
> 
> For most of the Qualcomm SoCs, when run with Gunyah or older QHEE
> hypervisor, all the resources whether it is static or dynamic, is
> managed by the hypervisor. Dynamic resources if it is present for a
> remote processor will always be coming from secure world via SMC call
> while static resources may be present in remote processor firmware
> binary or it may be coming qcom_scm_pas_get_rsc_table() SMC call along
> with dynamic resources.
> 
> Some of the remote processor drivers, such as video, GPU, IPA, etc., do
> not check whether resources are present in their remote processor
> firmware binary. In such cases, the caller of this function should set
> input_rt and input_rt_size as NULL and zero respectively. Remoteproc
> framework has method to check whether firmware binary contain resources
> or not and they should be pass resource table pointer to input_rt and
> resource table size to input_rt_size and this will be forwarded to
> TrustZone for authentication. TrustZone will then append the dynamic
> resources and return the complete resource table in output_rt
> 
> More about documentation on resource table format can be found in
> include/linux/remoteproc.h
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 158 +++++++++++++++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |   1 +
>  include/linux/firmware/qcom/qcom_scm.h |   4 +
>  3 files changed, 163 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index cab4723eb33d..0b156709af38 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -27,6 +27,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset-controller.h>
> +#include <linux/remoteproc.h>
>  #include <linux/sizes.h>
>  #include <linux/types.h>
>  
> @@ -111,6 +112,10 @@ enum qcom_scm_qseecom_tz_cmd_info {
>  	QSEECOM_TZ_CMD_INFO_VERSION		= 3,
>  };
>  
> +enum qcom_scm_rsctable_resp_type {
> +	RSCTABLE_BUFFER_NOT_SUFFICIENT		= 20,
> +};
> +
>  #define QSEECOM_MAX_APP_NAME_SIZE		64
>  #define SHMBRIDGE_RESULT_NOTSUPP		4
>  
> @@ -764,6 +769,159 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
>  
> +static int __qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt, size_t input_rt_size,
> +					void **output_rt, size_t *output_rt_size)
> +{
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_PIL,
> +		.cmd = QCOM_SCM_PIL_PAS_GET_RSCTABLE,
> +		.arginfo = QCOM_SCM_ARGS(5, QCOM_SCM_VAL, QCOM_SCM_RO, QCOM_SCM_VAL,
> +					 QCOM_SCM_RW, QCOM_SCM_VAL),
> +		.args[0] = pas_id,
> +		.owner = ARM_SMCCC_OWNER_SIP,
> +	};
> +	void *input_rt_buf, *output_rt_buf;
> +	struct resource_table *rsc;
> +	struct qcom_scm_res res;
> +	int ret;
> +
> +	ret = qcom_scm_clk_enable();
> +	if (ret)
> +		return ret;
> +
> +	ret = qcom_scm_bw_enable();
> +	if (ret)
> +		goto disable_clk;
> +
> +	/*
> +	 * TrustZone can not accept buffer as NULL value as argument Hence,
> +	 * we need to pass a input buffer indicating that subsystem firmware
> +	 * does not have resource table by filling resource table structure.
> +	 */
> +	if (!input_rt)
> +		input_rt_size = sizeof(*rsc);
> +
> +	input_rt_buf = qcom_tzmem_alloc(__scm->mempool, input_rt_size, GFP_KERNEL);
> +	if (!input_rt_buf) {
> +		ret = -ENOMEM;
> +		goto disable_scm_bw;
> +	}
> +
> +	if (!input_rt) {
> +		rsc = input_rt_buf;
> +		rsc->num = 0;
> +	} else {
> +		memcpy(input_rt_buf, input_rt, input_rt_size);
> +	}
> +
> +	output_rt_buf = qcom_tzmem_alloc(__scm->mempool, *output_rt_size, GFP_KERNEL);
> +	if (!output_rt_buf) {
> +		ret = -ENOMEM;
> +		goto free_input_rt_buf;
> +	}
> +
> +	desc.args[1] = qcom_tzmem_to_phys(input_rt_buf);
> +	desc.args[2] = input_rt_size;
> +	desc.args[3] = qcom_tzmem_to_phys(output_rt_buf);
> +	desc.args[4] = *output_rt_size;
> +
> +	/*
> +	 * Whether SMC fail or pass, res.result[2] will hold actual resource table
> +	 * size.
> +	 *
> +	 * if passed 'output_rt_size' buffer size is not sufficient to hold the
> +	 * resource table TrustZone sends, response code in res.result[1] as
> +	 * RSCTABLE_BUFFER_NOT_SUFFICIENT so that caller can retry this SMC call with
> +	 * output_rt buffer with res.result[2] size.
> +	 */
> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	*output_rt_size = res.result[2];
> +	if (!ret)
> +		memcpy(*output_rt, output_rt_buf, *output_rt_size);
> +
> +	if (ret && res.result[1] == RSCTABLE_BUFFER_NOT_SUFFICIENT)
> +		ret = -EAGAIN;
> +
> +	qcom_tzmem_free(output_rt_buf);
> +
> +free_input_rt_buf:
> +	qcom_tzmem_free(input_rt_buf);
> +
> +disable_scm_bw:
> +	qcom_scm_bw_disable();
> +
> +disable_clk:
> +	qcom_scm_clk_disable();
> +
> +	return ret ? : res.result[0];
> +}
> +
> +/**
> + * qcom_scm_pas_get_rsc_table() - Retrieve the resource table in passed output buffer
> + *				  for a given peripheral.
> + *
> + * Qualcomm remote processor may rely on both static and dynamic resources for
> + * its functionality. Static resources typically refer to memory-mapped addresses
> + * required by the subsystem and are often embedded within the firmware binary
> + * and dynamic resources, such as shared memory in DDR etc., are determined at
> + * runtime during the boot process.
> + *
> + * On Qualcomm Technologies devices, it's possible that static resources are not
> + * embedded in the firmware binary and instead are provided by TrustZone However,
> + * dynamic resources are always expected to come from TrustZone. This indicates
> + * that for Qualcomm devices, all resources (static and dynamic) will be provided
> + * by TrustZone via the SMC call.
> + *
> + * If the remote processor firmware binary does contain static resources, they
> + * should be passed in input_rt. These will be forwarded to TrustZone for
> + * authentication. TrustZone will then append the dynamic resources and return
> + * the complete resource table in output_rt.
> + *
> + * If the remote processor firmware binary does not include a resource table,
> + * the caller of this function should set input_rt as NULL and input_rt_size
> + * as zero respectively.
> + *
> + * More about documentation on resource table data structures can be found in
> + * include/linux/rsc_table.h

nit: Fixed in commit message, missed here.

s/rsc_table/remoteproc.h

> + *
> + * @ctx:	    PAS context
> + * @pas_id:	    peripheral authentication service id
> + * @input_rt:       resource table buffer which is present in firmware binary
> + * @input_rt_size:  size of the resource table present in firmware binary
> + * @output_rt:	    buffer to which the both static and dynamic resources will
> + *		    be returned.
> + * @output_rt_size: TrustZone expects caller should pass worst case size for
> + *		    the output_rt.
> + *
> + * Return: 0 on success and nonzero on failure.
> + *
> + * Upon successful return, output_rt will have the resource table and output_rt_size
> + * will have actual resource table size,
> + */
> +int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
> +			       size_t input_rt_size, void **output_rt,
> +			       size_t *output_rt_size)
> +{
> +	unsigned int retry_num = 5;
> +	int ret;
> +
> +	do {
> +		*output_rt = kzalloc(*output_rt_size, GFP_KERNEL);
> +		if (!*output_rt)
> +			return -ENOMEM;
> +
> +		ret = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt,
> +						   input_rt_size, output_rt,
> +						   output_rt_size);
> +		if (ret)
> +			kfree(*output_rt);
> +
> +	} while (ret == -EAGAIN && --retry_num);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_pas_get_rsc_table);
> +
>  /**
>   * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware
>   *				   and reset the remote processor
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index a56c8212cc0c..50d87c628d78 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
>  #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
>  #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
>  #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
> +#define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
>  
>  #define QCOM_SCM_SVC_IO			0x05
>  #define QCOM_SCM_IO_READ		0x01
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index 42621770edd2..5c87c7e431e8 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -86,6 +86,10 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
>  int qcom_scm_pas_auth_and_reset(u32 pas_id);
>  int qcom_scm_pas_shutdown(u32 pas_id);
>  bool qcom_scm_pas_supported(u32 pas_id);
> +int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
> +			       size_t input_rt_size, void **output_rt,
> +			       size_t *output_rt_size);
> +
>  int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx);
>  
>  int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
> 
> -- 
> 2.50.1
> 

-- 
-Mukesh Ojha

