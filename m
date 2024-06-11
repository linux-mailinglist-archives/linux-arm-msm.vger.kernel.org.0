Return-Path: <linux-arm-msm+bounces-22308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DC2903C81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 14:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 880251F23B5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 12:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDDF217C23A;
	Tue, 11 Jun 2024 12:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H73y7y0+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BE517C20E;
	Tue, 11 Jun 2024 12:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718110540; cv=none; b=U2CW+xi0x2NFoQH65pFZTDzr4oj5wy3KLyLdLJxEMn4r1x057PnsHVaGQv4JqNcQAJNY9EbhV5SIi6Z9YsLX7fW7Z8i/K6ZgyzeCBbxBO+o1EoV0GV7QHIGL1EFaTfm1LoqaWnWnYaQmWIHfQbW2NNDCD/rmQvbRltu4qPmpOEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718110540; c=relaxed/simple;
	bh=t630DEduj0LmlW15BvzG4knc6MgIMMv1Lu3hCOJHSKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D8K+m+DICSPNSgkzIe61H3xfJI4FtHRk8VtoGyYndTnOi+f6S+C4K0HLMg3l0LkBT17w4KqNmWNpvAVGzTsuGDpd1DX7maU+51fYYBb7pLfjB95wIdrbq+ICZxSJMui8oHIyi0LGc9Zd1u/zK40wf1tv1Tef+MMDabZIHwsm6bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H73y7y0+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B4slbt030133;
	Tue, 11 Jun 2024 12:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XfMYvsvrclLUrWlXbdiA9z3Az4igamXXYXC4Fdu3De0=; b=H73y7y0+oYSu+BFS
	02lUXFbndviRGVqIkqPvqpDVpspZTSjTi46ybUZRR1DEKWshvqS/BjcaKYhzlj+4
	oOReCaqNBaba2IOtIsfg9qdCKbQaw+sWtBfNTwZxnbq1FN69tBUOyOraaobsND+z
	0SGtF8lQAozGEgor4k0UIa4eGMpqj8dlpi72CYKsZUBSWVBxsPjztWeqxVw2lNGA
	+cbVyR51pkE3+2X9sAlcidlidf79h4U0TwOLdhozOeVFfsW+4/Uftc4GLrxbIfTG
	NLHWt2Ertos+IvxFew15q4/f3wA7SIarxjMfh5ip9UgTD+ENByU8x9d60qiOUqWu
	SoHJ7g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymevxefnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:55:22 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45BCtL60019055
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 12:55:21 GMT
Received: from [10.216.51.73] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 05:55:16 -0700
Message-ID: <0393a600-609f-45de-96de-a0b0c5d7ac85@quicinc.com>
Date: Tue, 11 Jun 2024 18:25:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] misc: fastrpc: support complete DMA pool access to
 the DSP
Content-Language: en-US
To: Dylan Van Assche <me@dylanvanassche.be>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Caleb Connolly <caleb.connolly@linaro.org>, <phone-devel@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>
References: <20240524161423.15392-1-me@dylanvanassche.be>
 <20240524161423.15392-2-me@dylanvanassche.be>
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
In-Reply-To: <20240524161423.15392-2-me@dylanvanassche.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: z8sj3dswpcq14DJWDtPD5JoZ3qfBe1IF
X-Proofpoint-GUID: z8sj3dswpcq14DJWDtPD5JoZ3qfBe1IF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_07,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0 clxscore=1011
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110094



On 5/24/2024 9:44 PM, Dylan Van Assche wrote:
> To support FastRPC Context Banks which aren't mapped via the SMMU,
> make the whole reserved memory region available to the DSP to allow
> access to coherent buffers.
>
> This is performed by assigning the memory to the DSP via a hypervisor
> call to set the correct permissions for the Virtual Machines on the DSP.
> This is only necessary when a memory region is provided for SLPI DSPs
> so guard this with a domain ID check.
>
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
Reviewed-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>  drivers/misc/fastrpc.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 4c67e2c5a82e..c06667b29055 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2255,6 +2255,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	int i, err, domain_id = -1, vmcount;
>  	const char *domain;
>  	bool secure_dsp;
> +	struct device_node *rmem_node;
> +	struct reserved_mem *rmem;
>  	unsigned int vmids[FASTRPC_MAX_VMIDS];
>  
>  	err = of_property_read_string(rdev->of_node, "label", &domain);
> @@ -2297,6 +2299,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		}
>  	}
>  
> +	rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
> +	if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
> +		u64 src_perms;
> +
> +		rmem = of_reserved_mem_lookup(rmem_node);
> +		if (!rmem) {
> +			err = -EINVAL;
> +			goto fdev_error;
> +		}
> +
> +		src_perms = BIT(QCOM_SCM_VMID_HLOS);
> +
> +		qcom_scm_assign_mem(rmem->base, rmem->size, &src_perms,
> +				    data->vmperms, data->vmcount);
> +
> +	}
> +
>  	secure_dsp = !(of_property_read_bool(rdev->of_node, "qcom,non-secure-domain"));
>  	data->secure = secure_dsp;
>  


