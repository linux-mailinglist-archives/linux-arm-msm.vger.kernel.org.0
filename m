Return-Path: <linux-arm-msm+bounces-109212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LBHA0siEGqsUAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:30:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3A35B135B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 11:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8673830086D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 09:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43741386C9;
	Fri, 22 May 2026 09:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVYZtXiQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGryQmYV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4603B5E08
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779442246; cv=none; b=r/EyY6+8yPOd82w9Hdt4R8LiIbsuNVwdnYfm5jMSRbraC4n8iZukuObgQOnM/6+RqOfo+Wz/uVtkoE1uD2zESzvyQfRUGHs8bK3+wmDQ1Cj7vHm+CIoWGVyoWeN26CYGzLbiwL9xsn7Mk0akjiOKHzd9T4gFzmPW5J7JxXKOfC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779442246; c=relaxed/simple;
	bh=UMQAUsNjrWcfUgwwUpJCdT7jtfG0UQMZ4o+VMv4vPP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oAKf5BQjimYca1ZrJFSpO4Y2VjT/a82eC/Qy84MFuQk5IuE1w8NmjtRNCXOYv7skeXqZrSKqOiHUf7xK1kI5tdDAaFjCUL4xnzJLkecHZChsA03gahnJMjWK9dywfW90rM2RCZwehNo2UdOO8Aa2g1dzqO6EarfKCnE9EROTk+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nVYZtXiQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GGryQmYV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M7Fbvm779483
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SAIFtLKu+vGu7qZ4vvvbMM2OnE0zcwInjzx49aFw+LY=; b=nVYZtXiQ7bPKs9JU
	L/Dm1Vu1Inaa3e5LpuE0rsL+xzZx3YPGYjgVTvI1NinUIDLxIWtCUAS1/SKnjJGP
	Vl1hygkZZQR8ErHB8PO1uqQAZVra/7hlp3GVyZM5ELwSIlAWDRJWJgTMsI/EKCJ3
	yXeFw5CuXB3iXECJHPzRk+gKTJV7c/rkpb32wAN0mPz6LRDNVMG5AB6A+m8ES9Ew
	5DV84k5Hsl0iDasSeiViQXwamBuVP/DVrNzeX42tD7CvvxGwQ4D9WgwCIfx43nWB
	NStIeeFf6FwxMuxsc6WeALicntNa28jB2pWU1VIXTBPoF0Q737kW/VReUQk/QXiy
	IDc7Aw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7at20n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 09:30:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-368f2d76b04so6694243a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 02:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779442243; x=1780047043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SAIFtLKu+vGu7qZ4vvvbMM2OnE0zcwInjzx49aFw+LY=;
        b=GGryQmYVOeBYeaPkVULnB7TamhkP+thOcAZVg0jwEsxqP708G0vH3+/kf3V8Yd0OOo
         r0WhzjLmpR6kaVdaVnehs1dCu36cudyVUlSzTPiIFh5Fc53wiyVrcO+Bl/NBYdSCUuM0
         UTx+0I4akzXVh3UDmUtydPtakpM0DsfdHY1sXxTJkuK6ESS1z2vdryoPCz23+uxRWQqX
         LtzHzCsL3CkLQJAviQdajk71nRfJqhEuBWk22dcDyushGAn/aTFnPOr0AclmdOBwm4xi
         4PWM6xTpI0WN+5fmSvGy1C8WOUnTfX3l/i0lkyiykrl7ZO/HNHLPtIUkCPSU/7+6Sx0N
         Pvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779442243; x=1780047043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAIFtLKu+vGu7qZ4vvvbMM2OnE0zcwInjzx49aFw+LY=;
        b=dTdkgJj65SUWoXp/5qDnF1Lg0KvuXl04jJ/DtZ0ZJfNh9s1vlHlleh0vwyBRuRSn6h
         wzY/ODXe/N+TNeeZAf/A7zpwjJKnkyYXF5SURuoLOmyrS2e4qxisVk4Itv2FkzdHvnYq
         rtazdrKVxAm33fnNsGlrzG3qrtKMvov8zkBnbSBazBrA8cDebWOWmLLbn4PFrNiTI5Ua
         /8UdlHx0s6vDv6rK9DGhVYxcmQACx0pNw+3YQ/C2QTYzOzmGLCkLB51zeWeTghHhZdZj
         z54+wROv//3UsJ3mO4xNXuHxs5iVrEIB8zQHJgVGfVphvg0Q2i8X9JXVmgeNfRATstRW
         /MOw==
X-Forwarded-Encrypted: i=1; AFNElJ9th5cbbqAu9vN4tclt9GxCRJUMsl7jLpCYIu/B48z9x1DHZOxvaf0Ju2vbDuFtpzkOw4jaiqdiqjy/uP71@vger.kernel.org
X-Gm-Message-State: AOJu0YwhGsjrVV40cgBn4OrQAfGbfJjK54zUqxx1bGtWTlwM1zowGT+4
	PG8nbjSoqiCReY9VOwpFLXsgY61Q5ypYUcSgEmM7PCWrkz9KiH7ssrywD0WDdiT3PlKqjytu1tH
	NCORNgDc/aV7q9YxvhmM8NlhGdHfn2W68SVolX0MpOSWYGsYUa6MK5PKu1jLV/FFBBYXV
X-Gm-Gg: Acq92OFei+klSBxMIwzz1ArFIRodUSjLRffON7uoj5PoGIrDj/apLQ58dOD4e8La0qd
	XAT+H+wkLiDUk5rtRQlCRMq/fsyCJohzigk34ikAF3QTH8q+p/kGe22SB2121ucRAeCvUo6nDmj
	75INRjv4ZNkUCR3DvUYyIanQAaNAcX8ryrTk4BVuMNMyYhLX/Jldq1QnecB+54/0kJxJFeqdhXp
	PphhBXaxwk2CLl/33CTk0PNdGHzmxJshSq9eBX7dlwl0uVypDXCAR0T3XJcl9opfl8WNeXQPW79
	MghQyENOuXIoGbf97xh0m2/6imx/K/G5y6BcuNRnP/fVMxr/D8fCvkjG3vIKprdg1/MP5P3IneV
	SurhW1Jim6bQf9eFUyvRSL2MUTGii7IfQW8pTlNd371+/eQf/7tSH+MAq8hQ=
X-Received: by 2002:a17:90b:564f:b0:35b:e5ce:73bb with SMTP id 98e67ed59e1d1-36a676f5108mr2537001a91.1.1779442243287;
        Fri, 22 May 2026 02:30:43 -0700 (PDT)
X-Received: by 2002:a17:90b:564f:b0:35b:e5ce:73bb with SMTP id 98e67ed59e1d1-36a676f5108mr2536970a91.1.1779442242763;
        Fri, 22 May 2026 02:30:42 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a723cf27csm1400022a91.13.2026.05.22.02.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 02:30:42 -0700 (PDT)
Message-ID: <b9d6d3b8-ce3c-4179-8e78-fc7494ba322f@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:00:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: cpufreq: qcom-hw: Document Shikra
 CPUFREQ Hardware
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260521-shikra-cpufreq-scaling-v3-0-883c13d1e514@oss.qualcomm.com>
 <20260521-shikra-cpufreq-scaling-v3-1-883c13d1e514@oss.qualcomm.com>
 <20260522-massive-hopping-oxpecker-d9dcca@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260522-massive-hopping-oxpecker-d9dcca@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pt10oEg__NHZRSFWVd6F5NyHwulVoJU-
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a102244 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KaersKY4o62IQMGDIjUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: pt10oEg__NHZRSFWVd6F5NyHwulVoJU-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA5MyBTYWx0ZWRfX1Y6B2lWcxuxV
 6p7IQeu2V2FCIh5BBUVmyaqJRyFCfoGKI4EHenztsRrXZyJwDhlhntmz7FXExUdkEs6H+9hKi92
 wOpEkwmR76o8vhZQOa3+aDPxpiNi4RL6hEzqysQ7ZnEj/i1AkPzy0jUkriyPHUr/kKyexzN/I7n
 /SUzzUhDU2iXeSsZzScABQdB0CK8G5o8CFVeOPqf3PSCRlCBQKZqnSfMQzF7v4Vt279wtzXcWg/
 HPPhFwjZRLuU5uhDR+55D6cngUcQqciaewevtu3S4RIt3bzHmwW3YOYQWGKJK+ZeOa06d/YBtOI
 rWoIYsNqr0QbKGbROz8AQiDcrLF7uAgSuVMxHeakYkhcdx6AWL3h7RQSCMJCfoyX/L/uWC5K7FK
 JZLrRd+v06I40rqDpRmc1Oz1oWI+Q/5oedV/qJ771xATkrpfuUEsudfvVYmrGgTCLb678bYDNG0
 z3GnK3+YhmjKXn7ZkGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220093
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-109212-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE3A35B135B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 22-05-2026 12:05 pm, Krzysztof Kozlowski wrote:
> On Thu, May 21, 2026 at 07:36:04PM +0530, Imran Shaik wrote:
>> The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
>> but supports only up to 12 frequency lookup table (LUT) entries. Introduce
>> Shikra specific bindings to represent this constrained EPSS variant.
>>
>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/cpufreq/qcom,shikra-epss.yaml         | 96 ++++++++++++++++++++++
>>   1 file changed, 96 insertions(+)
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> There is no "qcom-hw" schema, so no clue from where did you get this
> one.
> 

Actually, I picked the reference from latest Eliza/Milos commits. Will 
drop the qcom-hw prefix, and update as blow for Shikra and post next series.

dt-bindings: cpufreq: Document Qualcomm Shikra SoC EPSS

Thanks,
Imran

> Best regards,
> Krzysztof
> 


