Return-Path: <linux-arm-msm+bounces-85697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F37CBCCC05F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 14:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB03A30069BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 13:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F147D2F83A2;
	Thu, 18 Dec 2025 13:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KOU1dt8b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dElsRk3h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEF723A9B0
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766064873; cv=none; b=BK6rAOKSxHp2/U4utChuE7T7wSX1/C8kyZ2hgwosvxwep8/ZOWIHhvoOoSWNNR4Vp7UnP9IYw6rOf55bamAAzq+oEzFydRLPDZ4lkPlUfGqEFhnPXfukqSZlyE3j7XTy91nYGg7SpBRt+ooyhTkwcg6mTDZHZzUX2bpnXddEsww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766064873; c=relaxed/simple;
	bh=A3vrSvKefbgiLFcF/6u30jKGL0AIghCF3/WhaEZ8mrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LlFy9Kb7TPfc59asaPIYV9Osf7V1aBNa/ZtRd1BbipZLtbMKTFp3U+A4Yr2GDH3nnkJHeyarSO7VWn4gAOlnZBiAizlk0IQqcV8RP5DCqiM2B4njjeg7EMMSRZUgdXlwI5oPU6BvgnvCIP8Wa6Bu2U3dcrJSvlMO2k410b9FHlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KOU1dt8b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dElsRk3h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI8navT527713
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VCAcKgTvkRu/yiuKK53q7ETXk2sn8Yq4Cdf45ThYPF0=; b=KOU1dt8b7lkKQw4x
	mYELBseBcOISwhFK1onrKsNDoV4tYb6Mh1wsVKasvs5/0rq5f1xouyE1XmomVSYR
	/xfSWU4loktiw0J54cwxV/vFrIZs6gxaS5nJCK4ekW3CPXsBvIS4zz0edkNUW3OT
	Ev6E7FdeOnO+qvjQDcznsxbB6zL6iuS5Rf7lM1GbsXqwegwWRyJC3vN0zzKJFf+c
	3NoJ9xc8ERub/p6U2du4uOvXbtVrOUAKSvL+Qgf5g//ng9X5NLV6aInNVoj03K8+
	rxujRSzWM7oIvujW03Afj4NFSrT6dbXJySwVdrBgmLFWVnSMi0um4MEhy/4V3ghC
	gu3XqA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b43mb2rfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:34:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2ea2b51cfso19075785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 05:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766064870; x=1766669670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCAcKgTvkRu/yiuKK53q7ETXk2sn8Yq4Cdf45ThYPF0=;
        b=dElsRk3hqxdAOh7aJgRNoXkI/rOQt3myUKFQls+zOLQuWPqIS72EQandyrrXPIvQjN
         uw/6Yf9GiS+sUZ8D8aNvW6nCiuVzX2aF3vS6Ii2Rf4i+bS3/myQmqMftBGLwKGwPngW/
         kDJbfNZW4fD7HoNntS6G83Dk58Tn4xt33Mc+AQ9OL8G3cGYo0pGIWWoXMQUdsMV0ZAQn
         TtezaKY/GT5pjx6R4hkITIQAvbhiNCDA4/8mB4uIHhCSdvdM+Tdm/knNf/ZOYex/FuWN
         fnekKDMRVOM5Q0EHB66iz3E9Fx9MeAugSAdlCx5jQJMAu3fbD8EWzusg/Io4vYvii6YQ
         c5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766064870; x=1766669670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCAcKgTvkRu/yiuKK53q7ETXk2sn8Yq4Cdf45ThYPF0=;
        b=G3H+b2QOtXzfCUPU5+ZIDbzmO1B7npKWcs+6BAp4BogQhpjy92TWu+2ZLRSTfc5KO/
         WWXIH3sEfuFnvtJcN9Do7KP7sDTjEwDZix5E1G2Vj9/60Q6I7eXwHh2fW6es7FwF/xe6
         TO+w+n5xNXbc4/KFOLymYY3CPsX475vx2HvgFZBpBNnPolM7JrQBaXxwnHSFY3n2NaX+
         DKxxi2TQcx3P1G3DinBEgL7vu6Eppr32J4rbe+hkZDavlevcm5pmqM/VDfMmrP+uTjhH
         Ii/Dy2XK3w1h6KMBMSq01KfBvT9o0sFTOVoGQk0TpGRsmT0EHHb3SeVlFszXR8JRZjFK
         H5QQ==
X-Gm-Message-State: AOJu0YwJ45w/N7Ku7fZYbqfsyj/7hbzcMKTf5hqGkT63Xys2nsY5hGX3
	uWGCpzQrzLS8+e6Dsqhf/QmBVPOZqRy5LOB4dUwmrxQmYCaE0pfCyDQSXV7MNUIYMztoD1a49d4
	DoTd60k0YPF/xi0JELhrstvTcDVVONLejt4ZMYrBrJZhc/kd1nomACcX1dp7tswd45puF
X-Gm-Gg: AY/fxX6cm5V5yGelH+xXDRytUwTs+HYa34IVh7GgQcdd/k84iwtVNr3KMG47A0B4098
	UGdb2n4O5nbSWJkY1j28PQS9BR8JouTLsTazevYIpAvvnz8UcwOQcHsODkR37BsA6rIL9BYCw3v
	hFl0xXFT3Jx+kMk1WAMR9LiDTFtsrJ8hWv7JyE3lEERpiU872iFZMixwdD2/L5RKkzWjdiWMboA
	z92Vt3vPprdONqLjq5gLF0pPamaW3+lai6cNR+C4pn0aB5Swylyo6n6SU/XHX2BKVrPED1jCAKh
	eAD9gJrTA9AaLXRQOOorqLufLyAk6CIA1BSNYM0G08mjBpBmWSZ9mqjmAZK/jwO9VXFjUbXBXKv
	tEeQBSEntqAmjKHZY1WziQ5HwKaq/CeCDMV3yUBquQhKI5ojX83xwguNi7Kh7R2FTtg==
X-Received: by 2002:ac8:5209:0:b0:4f3:616c:dbed with SMTP id d75a77b69052e-4f3616cdd1dmr13073671cf.0.1766064870437;
        Thu, 18 Dec 2025 05:34:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJm0Fcb4ntQziPMSv3Gzr92tFWG9TfR7vofTfYc2c+pUGKsA4Dt10/gneQgXVmIVAsFlTkXA==
X-Received: by 2002:ac8:5209:0:b0:4f3:616c:dbed with SMTP id d75a77b69052e-4f3616cdd1dmr13073501cf.0.1766064869974;
        Thu, 18 Dec 2025 05:34:29 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8023118af4sm234500666b.29.2025.12.18.05.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 05:34:29 -0800 (PST)
Message-ID: <646c0f6a-9d84-490b-a55c-7ff92e2b26f5@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 14:34:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 11/14] firmware: qcom_scm: Add
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
References: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
 <20251217-kvm_rproc_v9-v9-11-ab7ac03e0ff1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251217-kvm_rproc_v9-v9-11-ab7ac03e0ff1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WhtbQysOB9eWWy9E2LIO2EWVtR_CBleu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExMiBTYWx0ZWRfXwevgwxSdTCud
 HTLw9/Mee4dJw1oUpt0r4/Hetk4qgwfVp9QeL8V1BEvCiqT0Rz6F1+4GnuUMbcP6hB4zrTGeYTI
 gY2kwRJOQ80teZgaqBzTPHO/Bp1z9vPh69qUGC8dHAU6KTQ82N3HXNlJuQhBWziUlkxNZ5vMcz4
 /H4B5h0XghaVP+QKcPs3KOoW62nET3rKUa6osHUz+l4nb1Ch4fm7lI97frvsfu9E0jdzDCoP83D
 HBofKGnt1aSbytiKCv0wktCW+xbk5V7DzkUM++Mx9X03cU5wbFB4Mpe9LX1AdqzrEAMMmsaTDNB
 LQbq96V/pXYrkmTSlbD08s0JAPqyERWvBkk3+bb2Wt+K8j+SVK7UkMt/xxoqYDS0OR/3Ipgxi4Z
 wNPgzF2xaX7GBN/RwNIBdjEnoC2wtQ==
X-Authority-Analysis: v=2.4 cv=NPHYOk6g c=1 sm=1 tr=0 ts=694402e7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DAnVZNvwvk2Db0QD4v8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: WhtbQysOB9eWWy9E2LIO2EWVtR_CBleu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180112

On 12/17/25 5:34 PM, Mukesh Ojha wrote:
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

[...]

> +	memcpy(input_rt_tzm, input_rt, input_rt_size);
> +
> +	do {
> +		output_rt_tzm = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
> +		if (!output_rt_tzm) {
> +			ret = -ENOMEM;
> +			goto free_input_rt;
> +		}
> +
> +		ret = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt_tzm,
> +						   input_rt_size, output_rt_tzm,
> +						   &size);
> +		if (ret)
> +			qcom_tzmem_free(output_rt_tzm);
> +
> +	} while (ret == -EOVERFLOW);

This still looks shaky (do-while is convenient for calling this twice, but perhaps
the allocation could be moved to __qcom_scm_pas_get_rsc_table() since it's static
anyway, and then we can just do:

ret = __qcom_scm_pas_get_rsc_table(...)
if (ret == -EOVERFLOW) {
	/* Try again with the size requested by the TZ */
	ret = __qcom_scm_pas_get_rsc_table(...)
}

Other than that, it looks good (although there's still a lot of boilerplate
that we can't really get rid of with C)

Konrad

