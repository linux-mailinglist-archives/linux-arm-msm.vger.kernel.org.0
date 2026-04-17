Return-Path: <linux-arm-msm+bounces-103547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPqAK0tQ4mnx4QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 17:22:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 305C441C88D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 17:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61AD8309829D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743D430DECC;
	Fri, 17 Apr 2026 15:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HteCryr5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wp4cdBR2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E39E309EEB
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 15:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439260; cv=none; b=qw/zcGQnp+JRkSrUaAnzD9cyjvI2vBnfDoll2oKzo8+JrVbI3N/oLn+5FSsHki8gyJjr3IfqTjxwXL4b7t5csacO/32Kc8jLnGXX1AXqNNZ5IFv3xz50gixV510yiojk5PQVOdhCzjsqUyr2rfNmBrxQmsnAjMDn54x/zumasR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439260; c=relaxed/simple;
	bh=a7FauC0ZYkCg/2ybLF4UZWeFA6zFWNZD5fVdS0Gd9lk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=raPDhydqh2nvKDH398GGEu06QdZ6+JkVp1kXmux3U+RHkV4Ok+h83YK0lYvUfG07sOKyJmhuyje9rp/1aCeGR3awANXjNORyf32uYP+P46YDQx8L8FDAmsyMh9WrNOiYFjQPR6jJYZlrF8RzD0LErd7UK8Xf8ZuZ4ykYXUs3hQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HteCryr5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wp4cdBR2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63HCXU4L727886
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 15:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gubb6FwF0cLZ4F1DwUMU+nFt6EIaYftlxW5weLzFAN4=; b=HteCryr5VTxV0t64
	EhewlEN9HXGbRgPtIrVbLpYFrJsvPL+X85hGzLRujIY3OqaPkp2EWZpoYMADM2ET
	RKwIudZNz4PV9UvE3veLy2uP2+d6IOczsMlEWYMJmIZRmJzf3sgNr/jYKYKY3bOB
	+L61QIughYETox6zkkFB98SYLLB8MMn5HuZTwdAEnhbF2rRWzx3X7RS4/KNnN1dF
	GgfGGrdjhQMhVQ9UAvJFsz6u4XU4BDFB5aYHFla+LyyoqALMdBYdvmHz383PeTF+
	CsWNQ/jg9XeAv7P5VtfexFcuhBzqCQ4mqCG09beSHWWSZZXzNH9jxd7dgrFjFJ+z
	cWrxaQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkfyqsu1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 15:20:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b241be0126so16302925ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 08:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776439256; x=1777044056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gubb6FwF0cLZ4F1DwUMU+nFt6EIaYftlxW5weLzFAN4=;
        b=Wp4cdBR2TmnM1RDttf5deYzy88jizLGU9cO2aRKlkI5AfnkNV8yAmxNlolXekBFbuW
         9B49DJTx6t8p49uNSMdDH5wKFWl3Uz5p3CcT/8y9OwHR1RBwxUpW0LrqQWFj/tNT1vO1
         LcQoqsn/VodUqpA1pek1QSZtwH6IyeNi4v40P+FKDuSvzqXnzZ3ZISkaPjd9uRybNx5K
         jYPRxq4sL3PNCvfwwIBT0gUXtBbf+cbIMA2WbY8z6zRCjJdd4rPiDLnbAVn1Pgv+OUzQ
         e1ZdVuyamwVi+YVMZBGwg1BxNnYt87oLErtmZp1qb/MPgE+LWhqKeqPDaZ8uo8dd0gRf
         XlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439256; x=1777044056;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gubb6FwF0cLZ4F1DwUMU+nFt6EIaYftlxW5weLzFAN4=;
        b=Y72FhWgMf80SFU4u98/a7x8dK0oIMq2dHXP/IxVnmxpiYVs4H276Gb7DHWLOIEBCz0
         GtHDFdou12dnGdcQM6s/srL9LjSmzOacWnFCdVPBxZmbFW160wGodgCE/f+t0xdKQsqg
         HcPGL+GArubd00CypCwUEiB38vag4GE+lIw+J+lwnm+IsizGdCfnZGGPtxLOyKUQ5UdN
         kpg1xqv6mHWCARbbEhdX1fhqCbzOuXcY5/xaEbwWwmNg9rtLbFZodel0mxOy80TrDfcC
         jWIvQYcMN3qQBVNpqhg8usArm5pEE2+W9RNfnNuMsRksQKXaEwLmYAGMrlWCEww4SA67
         /A8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8mmLpYdqr19o/9CYW6WRZlXUJLiUIKjV83ct9PeKGM0mkPmzZWmbOoPaiDhNv7ymt6ZsxtqT419zrobJt6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq+0FkjGmER0WNljf0CaqKfaF1wJLjoKPZuegCPIMbNtBmpp8a
	70EtAdc8idSpkOnX7iIJDunTFmeATba1wPJ8bpb9TFN8K8sGhng/C9BjbY5qu9e87uDJSa8cnkE
	C6QQ4p6JoigZXnL8wUsBhIaPzXYalYLUYOeobY1Gpa/oQHvdgQZBxF6DdJcKdgGTny6vX
X-Gm-Gg: AeBDievjFmVWxq9DMMc26qY7tQkuwyCUvoDNFnsV2GD2JmtVqYHNGZi7jRXgxsDSKRq
	1sDgUz9W8WANamCvEza0cgzxjlAyTizNvmqjARhqmvIcLG6aEbU5DQr1R2zdU6BXB7NXZSfN5Vl
	RAkuz9pPHFzWe0EhKlBgOcF1PbGHMy9RtaM/9FONdNPXeWpib8QDqXR/DDDZQBmp2WpmKZAMYW0
	R3CMmeGYMDrT3P5suMBhKr364+5ggUomhRUWfhX21cqHVf73/NNcfnbv8C5PTfxoDEHv97hP3zs
	gyqE9SGQlnvxrSHEx+EZH9zGgJ2LdUjvisL6TStGeZy/HW0yo2mCoyZGaAlAnuyAgjkHRthDGRS
	pkwu6JDUuKEwO9mUD2Lut+CWd6KeH8QMfCNnRpA/E/soS/Qz37gRvbAzvVHPO1+DN
X-Received: by 2002:a17:902:8b87:b0:2b0:a980:367c with SMTP id d9443c01a7336-2b5f9eb0513mr25693845ad.2.1776439256233;
        Fri, 17 Apr 2026 08:20:56 -0700 (PDT)
X-Received: by 2002:a17:902:8b87:b0:2b0:a980:367c with SMTP id d9443c01a7336-2b5f9eb0513mr25693395ad.2.1776439255583;
        Fri, 17 Apr 2026 08:20:55 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab20c4fsm31121345ad.59.2026.04.17.08.20.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 08:20:55 -0700 (PDT)
Message-ID: <72badc70-8a49-1bf6-291b-1dcf245b8991@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 20:50:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH 05/11] media: iris: Enable Secure PAS support with IOMMU
 managed by Linux
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20260414-glymur-v1-0-7d3d1cf57b16@oss.qualcomm.com>
 <20260414-glymur-v1-5-7d3d1cf57b16@oss.qualcomm.com>
 <20260414063128.6ass64wfi7nmtzti@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260414063128.6ass64wfi7nmtzti@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE1NSBTYWx0ZWRfX8RNZvBhbmspL
 TCVocEXM3enDblWovjO6urp7M1oDmknlnDw90pN0IenQh811nyFibgpCunmG/fdub7g/dOJqAOI
 RGhxaYKSaaO+7/eiWTZn07rg1p78fZ8rvELSdllzl3wAOsZtT4kNz0ncei8Vq80plhKHueyMtm5
 RCDd7cxWENVtH8Hj5EBUOWwJ5Qwa0mVLy1wokrbPisjAH9izhjve5flvh7rb+J9iG0l0vnoSlOz
 TabxevsnTJK64uk8Bf634T+xzYoo465eibiuUdZS2DYS0j+h8kfOHWJEhLD+CmkiHPEwZwIvh+I
 BwR+f2saREyuvZPnAJOaYaL30JyQtOiF0X+S8FN7pLz2CXFDfwxHOTwchvJu0Yt2SldlYzdcEC9
 T9Puyq4cVkZnUxPjVfNvDmbustNe9DK6+FwI5cW1CBWOUu9ooY1KtyRjmKyWOByNL0kKX453zwp
 l2nG145a7n61EJVuJsw==
X-Authority-Analysis: v=2.4 cv=BZPoFLt2 c=1 sm=1 tr=0 ts=69e24fd9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tkXzD9pcQE_IdLLthRAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: lV9JgFjJQiNtLVGEZrv4BXkGphLA3Cy2
X-Proofpoint-GUID: lV9JgFjJQiNtLVGEZrv4BXkGphLA3Cy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170155
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103547-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 305C441C88D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 4/14/2026 12:01 PM, Mukesh Ojha wrote:
> On Tue, Apr 14, 2026 at 10:30:01AM +0530, Vishnu Reddy wrote:
>> From: Mukesh Ojha<mukesh.ojha@oss.qualcomm.com>
>>
>> Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
>> or QHEE), which typically handles IOMMU configuration. This includes
>> mapping memory regions and device memory resources for remote processors
>> by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
>> later removed during teardown. Additionally, SHM bridge setup is required
>> to enable memory protection for both remoteproc metadata and its memory
>> regions.
>>
>> When the hypervisor is absent, the operating system must perform these
>> configurations instead.
>>
>> Support for handling IOMMU and SHM setup in the absence of a hypervisor
>> is now in place. Extend the Iris driver to enable this functionality on
>> platforms where IOMMU is managed by Linux (i.e., non-Gunyah, non-QHEE).
>>
>> Additionally, the Iris driver must map the firmware and its required
>> resources to the firmware SID, which is now specified via iommu-map in
>> the device tree.
>>
>> Co-developed-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Mukesh Ojha<mukesh.ojha@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_core.h     |  4 ++
>>   drivers/media/platform/qcom/iris/iris_firmware.c | 71 +++++++++++++++++++++---
>>   2 files changed, 66 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
>> index fb194c967ad4..aa7abef6f0e0 100644
>> --- a/drivers/media/platform/qcom/iris/iris_core.h
>> +++ b/drivers/media/platform/qcom/iris/iris_core.h
>> @@ -34,6 +34,8 @@ enum domain_type {
>>    * struct iris_core - holds core parameters valid for all instances
>>    *
>>    * @dev: reference to device structure
>> + * @dev_fw: reference to the context bank device used for firmware load
>> + * @ctx_fw: SCM PAS context for authenticated firmware load and shutdown
>>    * @reg_base: IO memory base address
>>    * @irq: iris irq
>>    * @v4l2_dev: a holder for v4l2 device structure
>> @@ -77,6 +79,8 @@ enum domain_type {
>>   
>>   struct iris_core {
>>   	struct device				*dev;
>> +	struct device				*dev_fw;
>> +	struct qcom_scm_pas_context		*ctx_fw;
> fw_dev suits better and ctx_fw is always for firmware, maybe pas_ctx is
> better.

Ack

>>   	void __iomem				*reg_base;
>>   	int					irq;
>>   	struct v4l2_device			v4l2_dev;
>> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
>> index 5f408024e967..93d77996c83f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
>> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
>> @@ -5,6 +5,7 @@
>>   
>>   #include <linux/firmware.h>
>>   #include <linux/firmware/qcom/qcom_scm.h>
>> +#include <linux/iommu.h>
>>   #include <linux/of_address.h>
>>   #include <linux/of_reserved_mem.h>
>>   #include <linux/soc/qcom/mdt_loader.h>
>> @@ -13,12 +14,15 @@
>>   #include "iris_firmware.h"
>>   
>>   #define MAX_FIRMWARE_NAME_SIZE	128
>> +#define IRIS_FW_START_ADDR	0
>>   
>>   static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>   {
>> +	struct device *dev = core->dev_fw ? core->dev_fw : core->dev;
>>   	u32 pas_id = core->iris_platform_data->pas_id;
>>   	const struct firmware *firmware = NULL;
>> -	struct device *dev = core->dev;
>> +	struct qcom_scm_pas_context *ctx_fw;
>> +	struct iommu_domain *domain;
>>   	struct resource res;
>>   	phys_addr_t mem_phys;
>>   	size_t res_size;
>> @@ -29,13 +33,17 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>   	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
>>   		return -EINVAL;
>>   
>> -	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
>> +	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
>>   	if (ret)
>>   		return ret;
>>   
>>   	mem_phys = res.start;
>>   	res_size = resource_size(&res);
>>   
>> +	ctx_fw = devm_qcom_scm_pas_context_alloc(dev, pas_id, mem_phys, res_size);
>> +	if (IS_ERR(ctx_fw))
>> +		return PTR_ERR(ctx_fw);
>> +
>>   	ret = request_firmware(&firmware, fw_name, dev);
>>   	if (ret)
>>   		return ret;
>> @@ -52,9 +60,27 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>   		goto err_release_fw;
>>   	}
>>   
>> -	ret = qcom_mdt_load(dev, firmware, fw_name,
>> -			    pas_id, mem_virt, mem_phys, res_size, NULL);
>> +	ctx_fw->use_tzmem = !!core->dev_fw;
>> +	ret = qcom_mdt_pas_load(ctx_fw, firmware, fw_name, mem_virt, NULL);
>> +	if (ret)
>> +		goto err_mem_unmap;
>> +
>> +	if (ctx_fw->use_tzmem) {
>> +		domain = iommu_get_domain_for_dev(core->dev_fw);
>> +		if (!domain) {
>> +			ret = -ENODEV;
>> +			goto err_mem_unmap;
>> +		}
>> +
>> +		ret = iommu_map(domain, IRIS_FW_START_ADDR, mem_phys, res_size,
>> +				IOMMU_READ | IOMMU_WRITE | IOMMU_PRIV, GFP_KERNEL);
>> +		if (ret)
>> +			goto err_mem_unmap;
>> +	}
>>   
>> +	core->ctx_fw = ctx_fw;
>> +
>> +err_mem_unmap:
>>   	memunmap(mem_virt);
>>   err_release_fw:
>>   	release_firmware(firmware);
>> @@ -62,6 +88,19 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
>>   	return ret;
>>   }
>>   
>> +static void iris_fw_iommu_unmap(struct iris_core *core)
>> +{
>> +	bool use_tzmem = core->ctx_fw->use_tzmem;
>> +	struct iommu_domain *domain;
>> +
>> +	if (!use_tzmem)
>> +		return;
>> +
>> +	domain = iommu_get_domain_for_dev(core->dev_fw);
>> +	if (domain)
>> +		iommu_unmap(domain, IRIS_FW_START_ADDR, core->ctx_fw->mem_size);
>> +}
>> +
>>   int iris_fw_load(struct iris_core *core)
>>   {
>>   	const struct tz_cp_config *cp_config;
>> @@ -79,10 +118,10 @@ int iris_fw_load(struct iris_core *core)
>>   		return -ENOMEM;
>>   	}
>>   
>> -	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
>> +	ret = qcom_scm_pas_prepare_and_auth_reset(core->ctx_fw);
>>   	if (ret)  {
>>   		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>> -		return ret;
>> +		goto err_unmap;
>>   	}
>>   
>>   	for (i = 0; i < core->iris_platform_data->tz_cp_config_data_size; i++) {
>> @@ -93,17 +132,31 @@ int iris_fw_load(struct iris_core *core)
>>   						     cp_config->cp_nonpixel_size);
>>   		if (ret) {
>>   			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
>> -			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
>> -			return ret;
>> +			goto err_pas_shutdown;
>>   		}
>>   	}
>>   
>> +	return 0;
>> +
>> +err_pas_shutdown:
>> +	qcom_scm_pas_shutdown(core->ctx_fw->pas_id);
>> +err_unmap:
>> +	iris_fw_iommu_unmap(core);
>> +
>>   	return ret;
>>   }
>>   
>>   int iris_fw_unload(struct iris_core *core)
>>   {
>> -	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
>> +	int ret;
>> +
>> +	ret = qcom_scm_pas_shutdown(core->ctx_fw->pas_id);
>> +	if (ret)
>> +		return ret;
>> +
>> +	iris_fw_iommu_unmap(core);
>> +
>> +	return ret;
>>   }
>>   
>>   int iris_set_hw_state(struct iris_core *core, bool resume)
>>
>> -- 
>> 2.34.1
>>

