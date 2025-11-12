Return-Path: <linux-arm-msm+bounces-81416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B807CC527F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 14:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C292D189457B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 13:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8AEA338580;
	Wed, 12 Nov 2025 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DkzSjzv7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S9XAWxXC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA00E337B9E
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762954471; cv=none; b=uoh/37u/Pnn3GobVg/LEIUDyo69cRL8z4XVTWAF08JqsrKC8seAQx0R2uL73ZrZFXZmxsJDyXHg+NHG4jTGUSc9yDPvJncJjsXdKHxdT+tMuQj5FUOd52rQIP7RZXkwNeA74eEnXjAetB4ZYqOXN25rn5ecETYWX5N4Wy3cZgao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762954471; c=relaxed/simple;
	bh=yZlm64Xo7tNfkx1+xvSIHbmWeEwKfmd5rKUB4NN5lWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NkDu97OmcZ5Z9GMJ2kgUzM29AFwdRyMAW0kd3ezEZ6hY+LLXReF4nhVdH98jgAWZTYiAUU2i3mGIodLsvNAbZArk5oM3k34nrp522NeVYiIHrXPqvcoexYauV12HqSznaCMKsx/PZHupm46xR34LpHYdCAvYe9scGKMN3Hfsg2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DkzSjzv7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S9XAWxXC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9hVuC907661
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 13:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qGXDUZfwsFaeBt+mI+uOkjAH29Y58afQeL3Rc1JtMjU=; b=DkzSjzv7o890FYzS
	PBiPzp55r4DJMOP29CmA8Sqo05Q4TKIbmj95EaPeqWWnkd7n7ssJzT3K6OzItw+S
	SiyjcxBWTAHBfIoyfvSdtNrjopSWDFF2z0DEOUztvgtFdJptwCS3nI/ef67tW/ho
	kmDq/sUiFJYzpxvmVLww9GJAyVxCl32gu1Apg/6oi4GqVGn9smOkS/cDbPDlC50T
	7YvxvQyN4QIevIwB6DvVJkSWE50k379exeVVACRgedoP3kTRA+dI8cmfXTrIhfam
	/V6u8uGdGYwaE02sycCc6ANZDLWkvMkv6fosAbUnSW/isUMVUfi/9uLrywQ4/sLQ
	4nyjVw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqur8ma9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 13:34:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b25c5dc2c3so25081485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 05:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762954468; x=1763559268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qGXDUZfwsFaeBt+mI+uOkjAH29Y58afQeL3Rc1JtMjU=;
        b=S9XAWxXCw/Eo31SAF/l++4GSn4kvoMaeU8OFBqp6BNbut8+Ud1DjCo+hNs+LFFRuYF
         RATW9d0GAE/mpy/Ngjq/r+Q262TPCE7NAPeVIItckxfG1537JfchDZ8+xui2XyF8fpmG
         KmYsjb5hnLVSyE15+mFjaoRDoSD+uszzM4PT5+nQyq57l3tgZo44lOr4spUk6NTFcvmo
         DQCRq/MTMCofL1GPsYQ1p5CiWA38dknonbmseIULG9Czix5+9vazeJcP5R6C5wpEInQL
         O0lBYQvFpinOq/x0uyCfNLNAyzarQ1Ke/WERFDVuTn8zllloQUADpoJ5xrMYCw7B46AE
         Qvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762954468; x=1763559268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGXDUZfwsFaeBt+mI+uOkjAH29Y58afQeL3Rc1JtMjU=;
        b=XYDQFgAGo9QmZv/138X6SnXn1/tuQms3ZXabHcJ46+C7OyucQDVDYnz0hQ6r6UMCVa
         Ajxo/0f/38UCCyXwaZVhqLoHvsZBqU2CizTbkz7iDrgdEmbW/RNsdPf0mFrqOK99j+3T
         eZ3I/Xyj7F0l9Bs8vluA9bnCXxGWEsKcxIVwp/Ocyd+k7ZmZTJiJQCoByzPFlihVGTQZ
         bcuOC2VZ6cX+pPkMVxY1sEc4Z+tqdZz/dDgkt9pLjc2hasjzGfHCtec23QOvtZT7SN+/
         r+QhEVgxka7ESz7OsBsoiumo32BQeILuVWMvYVTkPTX/02MzZuEsIuMhqLGkmXrECnHP
         1p+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXQdKVQKYAC8ZrArMcvAfke7Dw3/mcls93hrT2m4VeH468c1uDOZl9woA3HajTmQ6a1lvmZTld3ytRfiQS@vger.kernel.org
X-Gm-Message-State: AOJu0YyqHuRCg0gOgXcsAS1ik+Oy2WAkg91hRXacAf0ELDWB70nu1KgQ
	Jko3Ju9FWj+9IljTufS2yJo0nN1ECXCJBz0Qww6BOcKbD7nvuNgtKeLHd5KTO1zOvGcHp7/U5EF
	M0TPxJwYLrAyXTiHmR4/Mz7Y1b7NyV5MgUZP2BOUrKkqpazNXHLRiAQNZbpZu/j14MFju
X-Gm-Gg: ASbGncsGQfctdcb/QfV6LIIi9HQDVyoLWLG/wpLYD521jBqapAzzeEgpsfZbryYBWFO
	vZPVNOxV8FeljI7WD2BMsA4PF+aLQMh6p0yl1NqlmC+t3VDOHEkPChU+Ja++4lSWgP/Y43TzajF
	GpeJkxN53B22T7IST83EoUG2bB8JEqxuTcEakGmchu/kJEqkfU9Sr3TG6EIC6ns0KKzljJRor9w
	IItg9MTgXnrTDNZx1OyRK7qQEk0XYQixsPUvlsIDc+6hPuKJ9SNN5WySq+kpSpQq7cJwPrfcpSf
	WTAQ3t+OBmjQqoRkcLeeG271J6FAHtQTR6t5GOOUcxYgeOldvsSzGc8UTg1YdaQsGrptqCux91w
	zarQCGLz/BQROB4BP8G0+EI3qZ4vNrfKgyXQo8OV75ITK7Ky0dBeILTUt
X-Received: by 2002:ac8:5808:0:b0:4ed:a8f8:307b with SMTP id d75a77b69052e-4eddba75ee9mr26331681cf.0.1762954467868;
        Wed, 12 Nov 2025 05:34:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxtX+WAajjcT2p8bWAOl+s/zxUhDfeHoxA5vB04XFWyNVaIXKxhv+DFjlp7i/O3F94Gm5Rmg==
X-Received: by 2002:ac8:5808:0:b0:4ed:a8f8:307b with SMTP id d75a77b69052e-4eddba75ee9mr26331151cf.0.1762954467258;
        Wed, 12 Nov 2025 05:34:27 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7339a7078dsm105318066b.6.2025.11.12.05.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 05:34:26 -0800 (PST)
Message-ID: <5a1aaf4a-c5d5-42e1-9044-d12a6c231904@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 14:34:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com,
        dmitry.baryshkov@linaro.org, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Eric Chanudet <echanude@redhat.com>, charan.kalla@oss.qualcomm.com
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
 <CALE0LRupg93WsBVc62Lqt-T9qmK5MdEYoScxyP7=ttKJYXAsUA@mail.gmail.com>
 <33826089-54b5-47bc-8a5b-6004c7a276b8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <33826089-54b5-47bc-8a5b-6004c7a276b8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEwOSBTYWx0ZWRfX5UoHH5OPa7PW
 dWr6GCoTtVUukONnQw5m39oOUbCzmVGIVlxeKBRZgCU+g3Uiq4N6gNam/LuCcTZKwYm/5hN8ha0
 ZZbICdTli8awP+RksR19T7Z8HCvbhtoMKjmWvF6eih+rAq7IMMtgP4HKGFxBsJdKuIcDOhtrEsS
 H87/faDTrzfYY1UMjbuFj19Yy0+gmVKNHap1vtfDoNA1Q+cbr63SQruZazwYNhTu98Wx4WoCjPA
 PMUtuWx4+UYA4YSVWjl8WOSvNo6DyiEugZQOgQibSRu5yOFtM6VoaDWqA/174t1DAWom77fEzH4
 NFcvqfF/NErKntLkMTsDPk5DfGnKlOAmNlr7wE25+JkMtgnvS8/dMLMZnAn3CKK7UXSjDaV7TqA
 mZdh8T9ENVEfvtJQm7dR3cBK18IRmw==
X-Proofpoint-GUID: I4oPCK0dSuSTxtNy0IyiHCQLYyw2bMtu
X-Authority-Analysis: v=2.4 cv=bbBmkePB c=1 sm=1 tr=0 ts=69148ce4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8
 a=i3X5FwGiAAAA:8 a=EUspDBNiAAAA:8 a=SKrgUew0zp_WtuwtRiYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: I4oPCK0dSuSTxtNy0IyiHCQLYyw2bMtu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120109

On 11/12/25 9:45 AM, Bibek Kumar Patro wrote:
> 
> 
> On 11/7/2025 2:58 PM, Enric Balletbo i Serra wrote:
>> On Thu, Dec 12, 2024 at 4:14 PM Bibek Kumar Patro
>> <quic_bibekkum@quicinc.com> wrote:
>>>
>>> This patch series consist of six parts and covers the following:
>>>
>>> 1. Provide option to re-enable context caching to retain prefetcher
>>>     settings during reset and runtime suspend.
>>>
>>> 2. Remove cfg inside qcom_smmu structure and replace it with single
>>>     pointer to qcom_smmu_match_data avoiding replication of multiple
>>>     members from same.
>>>
>>> 3. Add support for ACTLR PRR bit setup via adreno-smmu-priv interface.
>>>
>>> 4. Introduce intital set of driver changes to implement ACTLR register
>>>     for custom prefetcher settings in Qualcomm SoCs.
>>>
>>> 5. Add ACTLR data and support for qcom_smmu_500.
>>>
>>> Changes in v18 from v17_RESEND:
>>>   - 1/5 : No changes
>>>   - 2/5 : No changes - reviewed-by tags collected
>>>   - 3/5 : Addition of
>>>     pm_runtime_resume_and_get()/pm_runtime_put_autosuspend()
>>>     around register access of PRR related private interfaces
>>>     as discussed in v17_RESEND.
>>>   - 4/5, 5/5 : No changes - reviewed-by tags collected
>>>   Link to v17_RESEND:
>>>   https://lore.kernel.org/all/20241114160721.1527934-1-quic_bibekkum@quicinc.com/
>>>
>>> Resend of v17:
>>>   Addition of minor fix of the build warning reported by kernel test robot [1] by powerpc_random config [2].
>>>   [1]:https://lore.kernel.org/all/202411140748.6mcFdJdO-lkp@intel.com/#t
>>>   [2]:https://download.01.org/0day-ci/archive/20241114/202411140748.6mcFdJdO-lkp@intel.com/config
>>>
>>> Changes in v17 from v16:
>>>   Tags provided earlier not collected yet on patch 1/5, 3/5, 4/5, 5/5
>>>   due to the following revisions:
>>>   - 1/5 : Move the CPRE workaround out of qualcomm specific logic and gate with config
>>>           , update the silicon-errata.rst file
>>>   - 2/5 : No changes - reviewed-by tags collected
>>>   - 3/5 : Move the compatible check before assignment of callback as suggested.
>>>   - 4/5 : Add the actlr setting for *adreno variant* of MMU-500 as well.
>>>   - 5/5 : Due to changes in 1/5, minor refactoring had to be done before adding table.
>>>   Link to v16:
>>>   https://lore.kernel.org/all/20241008125410.3422512-1-quic_bibekkum@quicinc.com/
>>>
>>> Changes in v16 from v15:
>>>   - Incorporate Dimitry's suggestion on patch 4/5 to use dev_dbg instead of dev_notice.
>>>   - Fix kernel test robot warning [1] coming for 32bit architecture configuration.
>>>   - Updatingthe tags
>>>   [1]: https://lore.kernel.org/all/202409230343.Q8KnYl2w-lkp@intel.com/
>>>   Link to v15:
>>>   https://lore.kernel.org/all/20240920155813.3434021-1-quic_bibekkum@quicinc.com/
>>>
>>> Changes in v15 from v14:
>>>   - As discussed with Robin and Dmitry modify the actlr table and logic to use
>>>     compatible string instead of sid, mask for device matching which is
>>>     similar to qcom_smmu_client_of_match mechanism.
>>>   - Expand the comment in qcom_smmu500_reset to document reason why CPRE bit is re-enabled again
>>>     after arm_mmu500_reset resets the bit.
>>>   - Rearrange the series in order to keep prefetch setting patches in the end.
>>>   Link to v14:
>>>   https://lore.kernel.org/all/20240816174259.2056829-1-quic_bibekkum@quicinc.com/
>>>
>>
>> Hi all,
>>
>> I've been looking at the evolution of the Qualcomm SMMU driver
>> (arm-smmu-qcom.c) and had a question about the design change for
>> configuring the SMMU_CB_ACTLR register.
>>
>> It appears there are two different approaches:
>>
>> 1. The "SID" Approach (Older): In some versions, a driver would use a
>> large, platform-specific struct (e.g., sa8775p_apps_actlr_cfg) that
>> maps individual Stream IDs (SIDs) to specific ACTLR values. This
>> allowed for very granular, per-SID tuning. For example, a device with
>> 10 SIDs could have a specific setting for just one (0x2141), while the
>> others used a default.
>>
>> 2. The "Compatible String" Approach (Newer/Upstream): The current
>> upstream driver appears to use a client_match array (an of_device_id
>> list) in qcom_smmu_init_context. This maps a device's compatible
>> string to a single ACTLR value, which is then written to the device's
>> assigned Context Bank.
>>
>> I want to make sure I understand the implications of this new, simpler
>> approach, as it seems to introduce a trade-off where granularity is
>> lost:
>>
>> Multiple SIDs, One Device: A single device that uses many SIDs in the
>> device tree (e.g., the video codec, which might list 0x2141, 0x25C1,
>> 0x2161, etc.) will now have one ACTLR setting applied to the Context
>> Bank that serves all of those SIDs, even if the old SID-based list
>> only specified a setting for one of them.
>>
>> Am I correct in this analysis? I'm assuming this was an intentional
>> design choice to simplify the driver, based on the assumption that all
>> SIDs for a single device (and all devices with the same compatible)
>> can share the same ACTLR tuning.
>>
> 
> Hi Eric,
> 
> If a device has multiple SIDs, all serving the same functionality and grouped under the same "iommus" field, for example:
> 
> iommus = <&apps_smmu, 0x2141, 0x0>,
>           <&apps_smmu, 0x25c1, 0x0>,
>           <&apps_smmu, 0x2161, 0x0>;
> 
> In this case, all the SIDs will be associated with the same context bank. Even if the three SIDs have different ACTLR settings, since SMMU_CB_ACTLR is per CB setting, all SIDs attached to that bank will share the same ACTLR configuration. This is why we designed it to be "per device / per compatible".

Does that suggest the settings may be slightly suboptimal?

There's some work being done to allow more granular association of
the passed SIDs:

https://lore.kernel.org/linux-arm-msm/20250928171718.436440-1-charan.kalla@oss.qualcomm.com/

Konrad

