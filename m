Return-Path: <linux-arm-msm+bounces-80736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B6CC3F644
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 11:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A7663A601E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 10:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DA6F246BB2;
	Fri,  7 Nov 2025 10:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJxoCSHy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HDkQbD46"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADB2305065
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 10:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762510832; cv=none; b=CnBfITTCwqxVil4WyH4M79C805lHtvP7ugmdy2DXyNBJIeR6koyifHV9QbQtrI+6X0vjnLb2wF9NHEaCI5P2c/9xVvd4bFp1vz4QMFHYW1yI/qSYpge4n7NfZ9rU4shUCC6uDNJauHvKQIJG+FrFuRw4hIvlnH5Fk2Xk4iPKiuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762510832; c=relaxed/simple;
	bh=KDQZASLrkmCmoVDWZ4mfO4WbfI88ohemMu2pR3sptiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EL5Bee1DjJySgSjgQ85P+6euF01JLbMe/zPiBjURfnjabBnnboWiyXNPoGxuR1tQnMYvmjfdMq8GFlvZCcsd8DA4KkFLC+LUjpSi++JZo9SN7gLHOvRr27DRWZeN4I3hrgqlulyePLAJg0kZDnfQlaAeGv2RPms+U0su1AXFddc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJxoCSHy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HDkQbD46; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A74lLQu568151
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 10:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CQVsKl2qmC0w0jI/a351jFJB+7WeW9QV61JB6YU5ccM=; b=IJxoCSHyBFfj+L32
	JuFKfjUhIdJMLOtIQNSJCrgf0i+GEMySGzl+3ijVen+akmBwKRGDlwUhVZ+3/s1z
	JptYQJk9uZ2M7siVtge3Iijw/0WqKVN2a9r8Fg9tnc2ivMXJr5JNyYikeAdpAY3g
	Mxb/kf6yEhRCMw05XaLPNkTnnEjRdl82YBBtNXU74FVuKT6o1CfWTM0aeDAGXA1F
	p/M+wHpRpZsjo/jLjxXmkhJPLzeAIqiCGl3wJK754gLB3i7Ll6QmC8G86OjomOBH
	fhHAAvXl+UMDv0uvyvhlmtIXR8ejS6j/VFDuzG8RIE4fE1tIrk6SjDlGxx4bQv8f
	+EXK0A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a905qjm8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 10:20:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8b86d977fso2055791cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 02:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762510829; x=1763115629; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CQVsKl2qmC0w0jI/a351jFJB+7WeW9QV61JB6YU5ccM=;
        b=HDkQbD46nritWWIDDH6RS6dOcux7ppBqsKtc5RJaWWTOuhg5yRScfx8VmcbZ3Stl4x
         ciUlst0Zj3gHF/hl/sNO9LvskeEbqNUzUc5CqIeQ79WfZ+n2W79DZ/hxbI5jykMoqprW
         avmoHvvPZDhwjKmDsY+bj0jTlKa/SZH+e39Z2eL1G2R2lXSaFieWILY6AIJWn/ttn5nY
         jfbpqj1axnZF6dIZAWmKaKIebSHtuvHkj78PKB9tkVMqH46Gw8bv+xpg5fFTEw7mAEAY
         WeJUP5HHGzecZ0hgjkzAVzHsfIo162dHerWqreTHgwLVZWwMXxyAhT3cOnf5i3ozCUpa
         OY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762510829; x=1763115629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQVsKl2qmC0w0jI/a351jFJB+7WeW9QV61JB6YU5ccM=;
        b=Eb5FxXYSAI299wYeqQaH5iU53xo2jTmO+In5phHCXFvZxE/l87U0HUAmQYGXyxwdfM
         uSDbQlACEiGPBV5l00ENHkPyWCx3gGiW7dH8l5dpqpxpuNq9LH9W3OsyhfSjK6kWeARS
         j9SpYlzRzl+gHMV1CKYOB5rq29kRUZp3nBs9s+Ut2JuKWc/B0qZorRyOP/a7I50LzmGG
         glcsntJcM3Bf9AvtF32Bw541K9pqTWPzDwim66guHiSwHJaKXyvLEufPTRKCUmi6noOs
         ZilBQ/ct8N/fbIMHMZjKrM74siSlrCwRwehV9FY1nCw93itJ/MXKk9pjxi5mU1TjZBzp
         YUNA==
X-Gm-Message-State: AOJu0YyOXDEsDysB1oEaZkjp4QpMwophcA64e/smrZYyCxGxSmN6FRMd
	wbS8pqazO4q4lnKc6pTrz4cD6olTJQxSq+3j9wufUkjQaCpdL1AyhudVecUiDccOXRSmQ6ybDAm
	BHsBFBKAmUdKPk2ssqeQ9jfejoq1ZdVflWsHwRszq7IpmgcS5/MNzVSvV+Q+uua3OIDiM
X-Gm-Gg: ASbGnctE4vQpTddli6rboudDRZ7By/7CF9umk5fjsZk7wiFqOkUkGnJlS940+eyIX0i
	j9yXV1LkUsMvAAFgCV4otnHGV5/b0qK+5/XyDt5bVHR0kM4qJo7nm2J/fwB5Tn8wdAWnJGGrxr8
	HCowYrGOz34jCfjjvnA9mTfBd8d3XsRZ7FPuMKsjUm0blzck/wSKrJHBBRPRydYxr0dgNcelICL
	GCHQ4lrrXeCdS3Yd4nvAOB05HFXVNax0StYLxXFAcngIO2kYe//q/OlUtCsJfwmtdwDsObVFuuN
	4koeHUMcY4CV5Phtlpnd8dyF+7GMQ3D5bt9JEwO9RE11PP/oz+D1gEetyfbbCjH935AQCGDRKDE
	mhfcopsqKEPMgPaQB7zeGgc6T8GLZhbb/JmlTd+iNhK4MawffAmZP2Ez3
X-Received: by 2002:a05:622a:199e:b0:4e8:90f4:c3aa with SMTP id d75a77b69052e-4ed94a66baemr18205151cf.8.1762510824251;
        Fri, 07 Nov 2025 02:20:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJIVPnOvmyTVH0e5HZ3aXk1EooLokFdRBCR92GRsoeTkafjiPomnHduQIF3a+MkVDYX/7JZQ==
X-Received: by 2002:a05:622a:199e:b0:4e8:90f4:c3aa with SMTP id d75a77b69052e-4ed94a66baemr18204991cf.8.1762510823728;
        Fri, 07 Nov 2025 02:20:23 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bdbcb04esm211292966b.3.2025.11.07.02.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:20:23 -0800 (PST)
Message-ID: <5239980b-f74c-4458-a7e3-a5e7f6927449@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:20:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251104-kvm_rproc_v6-v6-0-7017b0adc24e@oss.qualcomm.com>
 <20251104-kvm_rproc_v6-v6-11-7017b0adc24e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104-kvm_rproc_v6-v6-11-7017b0adc24e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7CYKFpjrUPNlBvSBpjKiHf20ngAWUNcx
X-Proofpoint-GUID: 7CYKFpjrUPNlBvSBpjKiHf20ngAWUNcx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4MyBTYWx0ZWRfX4/AHikNYx+XI
 z5Db4GBYJ6KVRccuTK35siSclvwonKdd8tUMStILRMpjHLReRoF+l9SwKBQs+ac4UweNdkkzduO
 4NEPOSoyIkHbvJIJFlJBgG5xYcZLov6sdmVLLXv2PSo7Qpi92MRAid/GAr5KyH2cc33jIQq2XZB
 O+UlBfs3m+ApHah5GAQ0O3rmrUSw/oIqs6wSywR3xGv5eDnLYEo2eW0goBJ01WPJMyqjW/it8jx
 YAksm6M+Tqs6b4gwR8AFSQyqXqvMhV3i5ziX70cqorhy51XzIwxGAsXIy2xgyGnudW4Gp7owl6d
 po7iGs3tiYEZZuwIcvrPcHQ5xHz573MwldGEpM/lWD2uTOD5OiWFVhyhpTLaqCyzh3Y1EDy+iot
 AtZNYS9RsEC6X0qNEXAnc34c1tp88g==
X-Authority-Analysis: v=2.4 cv=D6lK6/Rj c=1 sm=1 tr=0 ts=690dc7ee cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iT3TN3GgVcFq34hkIgUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511070083

On 11/4/25 8:35 AM, Mukesh Ojha wrote:
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

[...]


> +	/*
> +	 * TrustZone can not accept buffer as NULL value as argument Hence,
> +	 * we need to pass a input buffer indicating that subsystem firmware
> +	 * does not have resource table by filling resource table structure.
> +	 */
> +	if (!input_rt)
> +		input_rt_size = sizeof(*rsc);

Would the expected size of the received data ever be any different
than sizeof(*rsc) anyway?

[...]

> +int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
> +			       size_t input_rt_size, void **output_rt,
> +			       size_t *output_rt_size)
> +{
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
> +	} while (ret == -EAGAIN);

This should at the very least be limited to a number of retries

Konrad

