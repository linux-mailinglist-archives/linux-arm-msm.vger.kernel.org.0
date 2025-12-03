Return-Path: <linux-arm-msm+bounces-84223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 61520C9F015
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 13:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 19CB3348F51
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 12:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275D02F656E;
	Wed,  3 Dec 2025 12:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fje1H/Ov";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XWmV9HOo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9B12F5A22
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 12:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764765399; cv=none; b=imHa9sE8k7dphb6tbNtjS3LEdEiZa+q2+HJHUhyPUws9DvoZeTWg92ZHSH0S0MJ3uRgD4hiwH6XbsWLPyp7nunUIg8Ru0lgRHJLBs3JL9gnsAeEyA4g7blcBPOqR+w5Zdd2g/5/uGWAhTqeBOVr4Wn4m8b3uTL8fyVxCe0YiVAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764765399; c=relaxed/simple;
	bh=133zDIChdD60IUS6JZm2ZJGsM91OrEgjoeRRjXh18zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XT19cy54zGa7lZMc+vZ2HHCgUetRPlaeoxR8KTVeERt9Zfjpm4c9G/SkqnjAiguI7CSCIUCZGJg6nLD85NNDrjzc/qmU35T20DCEXOVS5Drb9B9tLDz6UuivSSz1oep4j8GBdRjwCuCJaON/wlu98HiMm2EtNMs9Ugt+gF1EX7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fje1H/Ov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XWmV9HOo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B39rbBA1928876
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 12:36:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ECdp/n5IfO3x2LfiEzdXETlp4AG0BzfMJTkuSdywFLk=; b=Fje1H/Ov3ZZtY/HH
	hJQtSmWleqciRpglbAms3u7r1TAc/2FJwlhNzPqu6FP8h8T+VrE3hVzhTNbESAk9
	2n/YbqIkz+qeHkB3Rlrmpf+PgC/xQDijkIxX4Ov7Byt0wKIG+M26Yt5nm3zEuIq4
	zILyGFTCBq3OqFEitnKGMzaBxgtvmjBPb0APfu04uNh8uBZHDMT5j5iUMCxmBizH
	OkqVEV/dlI5675cpRWxXomyRjpUVndTBZ2iUvKgV1Pd90P5KPvQepjybPzNTvSXU
	MReIvUI5h2Jn7yg/RcEy9yybKLpvKyzKWgen1sHaZ/fFbCkRHdfHNUikl3eCUyll
	saWNug==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atjyqge30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 12:36:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edace8bc76so13992661cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 04:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764765395; x=1765370195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ECdp/n5IfO3x2LfiEzdXETlp4AG0BzfMJTkuSdywFLk=;
        b=XWmV9HOoABMfPjeJNIvV6KIPrTD06o5GbtRqC1jxSnDUZxYuoxwm798ewVguBSXRU+
         ujv7A9dYdJDvPToaylEH6n1GV8SG+tivHVaHve3dhogUK/lm8D/ZslpOzrqDWcpiL3LQ
         2rLePKFs1Xvs/+3g8oWGIDEhYe57RaPB/Qe8rq6JQEI3v3RdOChUBKZS9zpNyac0+M4s
         NTLgS8e1JGKzffRle1wdwxPjIIbMLX/beLSc/Cpr8UrBIfaKvboWVXaqzChwbo3bB9/9
         kir8n6vBMLsFJhsIpKQdx4pEswqLvICJG6QDtH7GljxLmhLuMs7sH5rsiMZ1XT5w8y0I
         jmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764765395; x=1765370195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ECdp/n5IfO3x2LfiEzdXETlp4AG0BzfMJTkuSdywFLk=;
        b=wWoRFgKqOuxjfAWNjYoTT56yEnOzMPZZdvl71rIdAKnxO5ClI5PcIRxpFJGpO3Zj6N
         vlU299qaNWaXlovZIl8tbsxmTXCjMmM3KXkXMAPDMGh2sw8+IyK5cY3Oxe3tpw+Nt7Gc
         F/fNRGMLLUb6drl3LBtv5W9WNkiQqH7pqFpPIcecQsb1AdShPXESyTooEVq1x2h9V/Sw
         QKsmGFsKNb1PsWMm21cK9RPmQ2KFAbZKyNU07sGHPTi3C4JyF2ukWo9w0RIBNyDx+UZa
         M2cUR9+4OA4fwnrXZLHcTP8Q0NQBSNgb6DaOAeeZFKDcjZUDKdfSCcIcGh8hgZg4yZlw
         dB9A==
X-Forwarded-Encrypted: i=1; AJvYcCUKCH2sgHnuB4VSuHwqNaQF17St1QxojjQh8bVh8iOWcSTdSCDiB5O+Wj2d8tAMkVsaOG3BhCRKbLTUVQZF@vger.kernel.org
X-Gm-Message-State: AOJu0YypA/6/IMZb7FEb5zR+E5XPmLUNdbTwpb63qZ/Z4teB+ZmktAte
	Djk+4Z4kZb+cZ0+5FuFb74ErDMT2xaTFSlm7YfkKKcMrYQ5m9LcQjQDkWJIbfjUFinZih0RNtF9
	bQkLHvIFanpYs5Fd8dgsJ3aFmrNQeQ0USA9c/lYrMYm1OUrQSurDT91aJIPhFxAKAYPEJ
X-Gm-Gg: ASbGnct6dBPK8Kg7QIlj9/x5o5m/OpMMhm5xpltCetnqS60tmhGHXw0sz+UUZgL/q0o
	XQUOhYQ8aEmUn5jMcgvkIgSiRCRVJQONSp+t2zr/j8GswkKABnzm/HFr/LTpYG4SyDkq0jMq+Jd
	uwzPrP3mJ8QarBs3mgMI2xv03+WYi3sHay2DXUbDNT/efeNijRLC6fibaY30mIvbcCDCLBlXucv
	2pWRY7HIofOwg8r7Sg3a3sO1hQwCDRK7XJ2WIPYv7Md9hCe3b/jQHaCZR6KgIzjEinXDkknm9hS
	XV40+3gpkwBoOpocdRTV41IguWA+uV43jmI/KNDD60Z1KdogoV7ZRioloh7grmpq7bqLF/as0Wf
	10NfogQEF5Bok6jah1IFToaPS++9COClUs10ODMRyoI3J33SwqjQ6TawSvznOIUxGSw==
X-Received: by 2002:ac8:5715:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4f01752fdd6mr19881611cf.4.1764765395474;
        Wed, 03 Dec 2025 04:36:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgZNV2JmzxRkxvlZWlNQ34zmRdp6HoWlpB99+fd6sdr5WUTZMu9AQXTQ2JTGHrRS8I+lCTIg==
X-Received: by 2002:ac8:5715:0:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4f01752fdd6mr19881311cf.4.1764765394876;
        Wed, 03 Dec 2025 04:36:34 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a4b762sm1798644866b.67.2025.12.03.04.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 04:36:34 -0800 (PST)
Message-ID: <4376b7cf-7088-412b-8596-bdec5bdc273d@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 13:36:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-11-8e8e9fb0eca0@oss.qualcomm.com>
 <86f3cb9f-e42d-40f9-9103-1a4953c66c71@oss.qualcomm.com>
 <20251124152538.wt3kzztqmpr76hsx@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251124152538.wt3kzztqmpr76hsx@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fpnRpV4f c=1 sm=1 tr=0 ts=69302ed4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=G1CHwEGKOm80qSXAIBcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: vM3H1gdSqufR682EIXQ68wdgaUG1YjUu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDEwMCBTYWx0ZWRfX+z+79PyI2rdO
 qATOxOziKM+nUPrnadmDG1CmehQTpL5t9DjHrFIR1ZG3hQaG7ONuAXc2Lv3rw95n8wL9mLUcCI5
 PyW6wjcWAZYc7+uYhN3+UDHHZkLlRHbZ2bwg8p7D4D6oHRAKhGiTYWJsLTf4I+mAvHboVWDovsJ
 SvUS6/DeVXK82L+PxtyD/9BL0oZ8ABuKMvLPTMYrq/gX/sf8R1eYpzE0X1S+hpIHEBO2msHQ7NH
 3gsZMVEt0GU2S6OUaFayF5CpwGABRPjSeS+KGin3boVhexdMAcOGtM+jPQIP4lnsi4V8tJZ6ZN7
 F5Ik3dfGpE8DHdFatW3+Sb22z90dKyTsdc+ncwPsGvD6VMd73/YVMNwyf6Tsz55gXkWootV4ggd
 IK4uPbh2Mgb0+9vh2L0bkzG32NHvJg==
X-Proofpoint-ORIG-GUID: vM3H1gdSqufR682EIXQ68wdgaUG1YjUu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030100

On 11/24/25 4:25 PM, Mukesh Ojha wrote:
> On Mon, Nov 24, 2025 at 12:48:31PM +0100, Konrad Dybcio wrote:
>> On 11/21/25 12:01 PM, Mukesh Ojha wrote:
>>> Qualcomm remote processor may rely on Static and Dynamic resources for
>>> it to be functional. Static resources are fixed like for example,
>>> memory-mapped addresses required by the subsystem and dynamic
>>> resources, such as shared memory in DDR etc., are determined at
>>> runtime during the boot process.
>>>
>>> For most of the Qualcomm SoCs, when run with Gunyah or older QHEE
>>> hypervisor, all the resources whether it is static or dynamic, is
>>> managed by the hypervisor. Dynamic resources if it is present for a
>>> remote processor will always be coming from secure world via SMC call
>>> while static resources may be present in remote processor firmware
>>> binary or it may be coming qcom_scm_pas_get_rsc_table() SMC call along
>>> with dynamic resources.
>>>
>>> Some of the remote processor drivers, such as video, GPU, IPA, etc., do
>>> not check whether resources are present in their remote processor
>>> firmware binary. In such cases, the caller of this function should set
>>> input_rt and input_rt_size as NULL and zero respectively. Remoteproc
>>> framework has method to check whether firmware binary contain resources
>>> or not and they should be pass resource table pointer to input_rt and
>>> resource table size to input_rt_size and this will be forwarded to
>>> TrustZone for authentication. TrustZone will then append the dynamic
>>> resources and return the complete resource table in output_rt
>>>
>>> More about documentation on resource table format can be found in
>>> include/linux/remoteproc.h
>>>
>>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
>>> +			       size_t input_rt_size, void **output_rt,
>>> +			       size_t *output_rt_size)
>>> +{
>>> +	unsigned int retry_num = 5;
>>> +	int ret;
>>> +
>>> +	do {
>>> +		*output_rt = kzalloc(*output_rt_size, GFP_KERNEL);
>>> +		if (!*output_rt)
>>> +			return -ENOMEM;
>>> +
>>> +		ret = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt,
>>> +						   input_rt_size, output_rt,
>>> +						   output_rt_size);
>>> +		if (ret)
>>> +			kfree(*output_rt);
>>> +
>>> +	} while (ret == -EAGAIN && --retry_num);
>>
>> Will firmware return -EAGAIN as a result, or is this to handle the
>> "buffer too small case"?
> 
> The latter one where a re-attempt could pass..
> 
>>
>> I think the latter should use a different errno (EOVERFLOW?) and print
>> a message since we decided that it's the caller that suggests a suitable
>> output buffer size
> 
> Agree with error code..
> 
> This is kept on the caller side keeping future in mind. where we can have
> resource table coming from the client and it needs to go to TZ for
> authentication.
> 
> Are you suggesting to move this retry on the caller side ?

I think we got confused in the review of the previous iterations and made
qcom_scm_pas_get_rsc_table() retry 5 times (on the basis that "some" error
could happen in firmware), but if it's specifically "buf too small", we should
only need to call it utmost twice - once to get the required larger size (or
succeed and exit) and another one with a now-correctly sized buffer.

Looking at it again, do we really need to be so stringent about the maximum
resource table size? Can we just push the currently defined SZ_16K inside
qcom_scm_pas_get_rsc_table() as a constant and bump it up as necessary in
the future?

> Just for information, once video patches becomes ready, we may bring this
> qcom_mdt_pas_map_devmem_rscs()[1] helper for video or any other client
> should be do this here as well ?
> 
> I wanted to optimize this path, where caller is making a guess and
> gets the updated output size in return.

We always end up allocating in __qcom_scm_pas_get_rsc_table() so I think
guessing a number like SZ_16K which is plenty for a effectively small u64[]
in this file is ok too. Perhaps we could even shrink it down a bit..

> [1]
> https://lore.kernel.org/lkml/20250819165447.4149674-9-mukesh.ojha@oss.qualcomm.com/#t
> 
>>
>> In case it doesn't make sense for the caller to share their expectations,
>> the buffer could be allocated (and perhaps resized if necessary) internally
>> with some validation (i.e. a rsctable likely won't be 5 GiB)
> 
> Are you saying output_size as well should be checked and it should not be
> greater than something like UINT_MAX or something.. ?
> 
> +	*output_rt_size = res.result[2];

Yeah we should probably make sure this doesn't exceed a large-but-not-
entirely-unreasonable value

Konrad

