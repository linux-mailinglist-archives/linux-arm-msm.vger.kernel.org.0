Return-Path: <linux-arm-msm+bounces-111784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 33jNK/6PJmomYwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:48:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF7A654BC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 11:48:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JKftAluV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=AprmnVGK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111784-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111784-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 24CD83026769
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 09:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6DF3B4E94;
	Mon,  8 Jun 2026 09:45:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630833B14D5
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 09:45:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911940; cv=none; b=TLaYcFl9Fvuve+kW/CK5YhUqxGFznOyYrObUuS2u+gs1kZRMJZCkjyt5t+NBPrlpGOcRxFi430J2nqzSYpFlgNc+m2iyljdUPzcRoyOZSHK5vQhbRpzXGh76t/kATt/XxCF5POu4qIarbi9itMTzD/EOaVZ+pbrZG5rfPVsXc5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911940; c=relaxed/simple;
	bh=9RRZpASQS41qwqOO37RHHFfJF8TpxC/j+aBOgczgifQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lu2X3lUsDT7vMrz7jPpJK3juaAnwaJytf13cvHRqynGPNHPieDySI6IAHGwNsQoQzY7jOFu+GyP/MQQcHacwFims6g7Gy98pXDDd+BtJjFoyr8e6SsORpm6sYViUJXXLLrJC5yZF9nH3Q6h0i7ntw4pIqeuFGepxWlyrrT175+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKftAluV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AprmnVGK; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586QpTc2771071
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 09:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wPnIboRKsGmpiz5atmsmV6r9S0cjd+eGf5563PqK//E=; b=JKftAluVGr8ERP6D
	Mm5q9pRK+wS6Gs5IGCvN9sELS8zKr5H79eMz456wQ9gjONeneQR9H7e/Nxdibkp9
	PZRdKAbduWTrgQkkV49c4gaFkJA5sk2IM1182fsyGRlMzwPGxtOjhCyTlJRTYkVt
	FtxKuxtvJDCV7+VH2QIn4Wn/6wB/n6dsdZuyAx4W5DOQsKt1vkaef4lZhFJuTS0Z
	uHGMBedyBtW8Hw0l7weJV+vI5StrhRh16tct1rfwXUGPjPn4WaXWtdY62dsTM2FW
	CpOfPQwcFSHzdQ8s7epGoHDMQ+r+978RNCiLq0XHbu54zWIgYiYYyQAoXVsp9l8o
	3yB7jA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embx6f3hh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 09:45:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36bbbaf6b23so910319a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 02:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780911937; x=1781516737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wPnIboRKsGmpiz5atmsmV6r9S0cjd+eGf5563PqK//E=;
        b=AprmnVGKkRq2UCtWvF8OwCvx76iJbGbBjToLPTyN9pknbgCEuVz1rWqluQM3IT4m9n
         du+o3m72O8lDcwvWQDdkypcRDXyRgcXp/aLixSwAfDwucvV2DSfLo61AMe9lUo/u1OeM
         CRRUPtnLGrD6FHYxin6rkACBxG+RWkAYleCdSHCop19PX8hWqzN/PcGveM+1oepwmymt
         IShvMHYIPtegGxGObNaRYRn7X2SqEQf7hJdH94FpiSAoU8EInunHsA7NxYqUHUI+Pf42
         Wg00xkQwKwLqpZ4o/ccqf3cECcHiF6cexuNpS3vnyYFcF+57FcAwl/dfAN5B2xQM+j7f
         J7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780911937; x=1781516737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPnIboRKsGmpiz5atmsmV6r9S0cjd+eGf5563PqK//E=;
        b=o+a3sP3S0tg2iVSe5p1a/atWvg4Qyqxj0GaTBbnBdpISOnTzDnh6COPGz6Wtl7pSou
         szyHaomBF6fpDVsru6T2dElz5JASQyU0ubYUmQX++NK0aO4DNijhASp0CO+bXSkiHE2w
         iCEyxYcctjGrngNH0IpvL4RPLqEvttcSl2M3Bww5lSkH8lM6xzZZWE909ywbgMYFBz+y
         2zFNfqwjMS/3e7q12Z1PF5V6KetrvXjOGaxfDISTOLiqlTy0PM0yxnXknRV1WjTZ2az7
         iEhB3NH2Kv8w4tuD19EsF4gu0yvdRFU7uBhlPZO3oZo4Aug7VZuATu2OhPxwsmdgpa56
         kcOg==
X-Gm-Message-State: AOJu0YzOshhfTmwC8znsj9Rsu/Up6JcQv6+eSeEqMJrTXVTfjUqJB7I9
	44xN9iemoUAcOtBRd00CNy6JWInuzqBidwTt5Txcpzq7eZa8+0NgIDg1nmQqZd0PActwDYtkOpH
	2gZ5sVxMaQthkEUpxfIc5XFQALJzItlNALLR/eTZVMgeAJFnqlJ+jOTsL3w8eYTzXaDuU
X-Gm-Gg: Acq92OE9dKgCrA/R2lCp3+/q8yaNhWsL0liFMqtRH/QjMF/PTUVMUp3LuIBK8v/slFK
	MHSHYo9rFNkQLCh1t1o3NJStXm39ab5SXa1i1V2vpqKxWO5b6MArixZFuJ4+p8UIgk4fXtAcghO
	orhb2RBbe3zGkq23fotNqCkiN5uygTSUlKOU/wJCROLSMr1nQyIAPJuuq3Zp3IYUnhqWwwU2MU7
	7WYM8zPEXJbrlEvZIHDxAzHA5/iJDZ89vjvZyOD5CAz9lrMhUb/3PrCBkKrAQAHLVx758rankHh
	C0DyaUk3n+L53d6NV65rMYV8WWeUSthYL1bOBoryyESbnH3aAuh8y3DUjd8fD/3rPvGP/HZryUO
	8TO5mmhgVmyI2i21++qOaLFLJgLS0Bmzbad2HAPN4pr/oMWzXXuqnO2nEB2OgLw==
X-Received: by 2002:a17:90b:538b:b0:36d:f28a:c5e2 with SMTP id 98e67ed59e1d1-370f1eec20amr8065568a91.8.1780911937110;
        Mon, 08 Jun 2026 02:45:37 -0700 (PDT)
X-Received: by 2002:a17:90b:538b:b0:36d:f28a:c5e2 with SMTP id 98e67ed59e1d1-370f1eec20amr8065539a91.8.1780911936605;
        Mon, 08 Jun 2026 02:45:36 -0700 (PDT)
Received: from [10.92.194.172] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282379db0sm16632418b3a.24.2026.06.08.02.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 02:45:36 -0700 (PDT)
Message-ID: <d275959d-4a79-4804-a160-94a9aa89eea5@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 15:15:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] ras: aest: extend AEST support to Device Tree
 frontend
To: Ruidong Tian <tianruidong@linux.alibaba.com>,
        Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck
 <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <4eeeef74-8a27-470c-b516-095f029b9e9e@linux.alibaba.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <4eeeef74-8a27-470c-b516-095f029b9e9e@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a268f42 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=SRrdq9N9AAAA:8
 a=EUspDBNiAAAA:8 a=bAntFOdrss-Er4w7wzgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA5MCBTYWx0ZWRfX+9jvajbsdNsp
 LVkH1VfuwziBXpTZFdWG+N2ZD4l5Ol4KxnOhK7CSMqVoLBTkoXu+z6vGVZLSzCBDv4nmwZdKeeX
 QpGlAlQYhufQl93GVTjWIK2peZ35RujOfQBOOi5AAFL/8Q/cppIFmPW5k0+gxy7Nkfn7Hy2sFmU
 eCESgxew7cqDgWpm5e+BOY3/NhtlNfQbJleES5MllNbwNex2sLReb2pVzU78zTYLTqBwwUPzJiu
 4b8hcasVtXqOwPe9szGsbsRxXLY8kPqfAEuaD60F77+UUxn3NS++DGynZ50ENQxK+WTvsfjWzU9
 RT//KFtcNOosbZ18lytOpASrX0Jq5I40/ydMGXmarLkQbKPDmlv7PGYXILxdnm5x72B8lpflj6b
 SLHlZJ0IMtEy7H9vj9D0u8n7fS1yRGs4D51j1uWqKcq+uDTk3DIDDR2JUaFuuah3FvKK2m0yQLF
 sBLnvq82/hbkvybe8eg==
X-Proofpoint-GUID: LNUY9yr53SLgS0k2ZNeaa-n7g9hhiFR4
X-Proofpoint-ORIG-GUID: LNUY9yr53SLgS0k2ZNeaa-n7g9hhiFR4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111784-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,arm.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,alibaba.com:email];
	FORGED_SENDER(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:tianruidong@linux.alibaba.com,m:tianruidond@linux.alibaba.com,m:tony.luck@intel.com,m:bp@alien8.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:mark.rutland@arm.com,m:sudeep.holla@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-edac@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:faruque.ansari@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CF7A654BC0

Hi Ruidog,

On 6/2/2026 12:59 PM, Ruidong Tian wrote:
> Hi Umang,
> 
> I have sent out v7, and I wanted to highlight a few changes to make it
> easier for you to adapt the devicetree support:
> 
> 1. I stopped passing device information to the driver through the
> acpi_aest_node structure. Instead, I switched to using the device
> property infrastructure and removed the aest_device abstraction layer
> (which was originally introduced to support CMN). This should provide
> good compatibility between ACPI and devicetree and avoid the need to
> write extra adaptation code for devicetree (such as aest_of). In the
> ideal case, adding just one of_match_id should be enough to make it
> work, although this will require you to update the DTB file accordingly.
> 
> 2. I removed the use of genpool. The current AEST driver only needs
> memory in interrupt context, so genpool is not needed.
> 
> 3.The driver has been renamed to arm64_ras.
> 
> I have already applied some of your previous fix patches and added your
> Signed-off-by.
> 
> 
> Best regards,
> Ruidong

Thanks for this summary and for re-factoring the code to make it easy to
adapt for DT as well.


> 
> 
> 在 2026/5/5 20:23, Umang Chheda 写道:
>> This series extends Tian Ruidong’s [1] ACPI-based AEST support series
>> to also cover Device Tree based platforms.
>>
>> While the existing AEST driver relies on the AEST ACPI table [3], many
>> embedded Arm platforms use Device Tree exclusively and cannot use the
>> driver today. This series adds a DT frontend that mirrors the ACPI
>> implementation and feeds the same core driver, keeping ACPI and DT
>> paths functionally equivalent.
>>
>> Along the way, several correctness issues were identified in the core
>> driver and are fixed in the first part of this series.
>>
>> The DT frontend is mutually exclusive with ACPI and does not introduce
>> any DT-specific logic into the core.
>>
>> How to test with QEMU
>> --------------------------
>> Tian Ruidong's QEMU fork [2] emulates AEST MMIO error records on the
>> virt machine.  To test the DT frontend:
>>
>> 1. Build QEMU:
>>
>>       git clone https://github.com/winterddd/qemu.git
>>       cd qemu
>>       git checkout c5e2d5dec9fd62ba622314c40bff0fbecb4dfb34
>>       ./configure --target-list=aarch64-softmmu
>>       make -j$(nproc)
>>
>> 2. Build the kernel with:
>>
>>       CONFIG_OF_AEST=y
>>       CONFIG_AEST=y
>>       CONFIG_ARM64_RAS_EXTN=y
>>       CONFIG_RAS=y
>>
>> 3. Add the following DT node to your virt machine DTB.  The QEMU
>>     fork maps DRAM error records at 0x090d0000 (SPI 44) and CMN
>>     vendor records at 0x090e0000 (SPI 45):
>>
>>       aest {
>>           compatible = "arm,aest";
>>           #address-cells = <2>;
>>           #size-cells = <2>;
>>           ranges;
>>           interrupt-parent = <&gic>;
>>
>>           /* DRAM memory node — MMIO at 0x090d0000, SPI 44 */
>>           aest-dram0@90d0000 {
>>               compatible               = "arm,aest-memory";
>>               arm,interface-type       = <1>;
>>               arm,group-format         = <0>;
>>               arm,interface-flags      = <0x22>;
>>               arm,num-records          = <4>;
>>               arm,record-impl          = /bits/ 64 <0x0>;
>>               arm,status-report        = /bits/ 64 <0x0>;
>>               arm,addr-mode            = /bits/ 64 <0x0>;
>>               arm,proximity-domain     = <0>;
>>               reg                      = <0x0 0x090d0000 0x0 0x1000>,
>>                                          <0x0 0x090d0800 0x0 0x200>,
>>                                          <0x0 0x090d0e00 0x0 0x100>;
>>               reg-names                = "errblock", "fault-inject",
>>                                          "err-group";
>>               interrupts               = <GIC_SPI 44
>> IRQ_TYPE_LEVEL_HIGH>;
>>               interrupt-names          = "fhi";
>>           };
>>     };
>>
>> 4. Boot QEMU with acpi=off:
>>
>>       ./qemu-system-aarch64 \
>>         -machine virt,accel=tcg,gic-version=3 \
>>         -cpu cortex-a57 -m 2G -smp 4 \
>>         -kernel Image -dtb virt-aest.dtb \
>>         -append "console=ttyAMA0 acpi=off earlycon" \
>>         -nographic
>>
>> 5. Verify probe:
>>
>>       dmesg | grep "DT AEST"
>>       # Expected: DT AEST: registered 1 AEST error source(s) from DT
>>       ls /sys/kernel/debug/aest/
>>
>> 6. Inject a CE error via the QEMU MMIO fault injection registers.
>>     The QEMU device accepts 64-bit accesses only (use devmem with
>>     the 64-bit width flag):
>>
>>       devmem 0x090d0808 64 0x80000040   # CDOFF | CE inject
>>
>>     This triggers QEMU's error_record_inj_write() which sets
>>     ERR<n>STATUS.V=1 and asserts the IRQ.  The kernel driver's
>>     aest_irq_func() fires, reads the status, and logs:
>>
>>       AEST: {1}[Hardware Error]: Hardware error from AEST memory.90d0000
>>       AEST: {1}[Hardware Error]: Error from memory at SRAT proximity
>> domain 0x0
>>
>> Testing
>> -------
>> - Validated on Qualcomm's lemans-evk and monaco-evk board with DT boot.
>> - Validated CE and UE injection via debugfs soft_inject.
>> - Tested ACPI path is unaffected: ACPI boot continues to use
>>    drivers/acpi/arm64/aest.c unchanged.
>>
>> [1] https://lore.kernel.org/lkml/20260122094656.73399-1-
>> tianruidong@linux.alibaba.com/
>> [2] https://github.com/winterddd/qemu/tree/error_record
>> [3] https://developer.arm.com/documentation/den0085/0200/
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
>> ---
>> Umang Chheda (8):
>>        ras: aest: Fix shared processor node handling and error log
>> messages
>>        ras: aest: Fix CE/UE error counts not incrementing in debugfs
>>        ras: aest: Skip unimplemented records in debugfs
>>        ras: aest: Add panic_on_ue module parameter
>>        dt-bindings: arm: ras: Introduce bindings for ARM AEST
>>        ras: aest: Add DT frontend for ARM AEST RAS error sources
>>        arm64: dts: qcom: lemans: add AEST error nodes
>>        arm64: dts: qcom: monaco: add AEST error nodes
>>
>>   .../devicetree/bindings/arm/arm,aest.yaml          | 406 +++++++++++++
>>   arch/arm64/boot/dts/qcom/lemans.dtsi               |  41 ++
>>   arch/arm64/boot/dts/qcom/monaco.dtsi               |  41 ++
>>   drivers/ras/aest/Kconfig                           |  15 +-
>>   drivers/ras/aest/Makefile                          |   2 +
>>   drivers/ras/aest/aest-core.c                       |  63 +-
>>   drivers/ras/aest/aest-of.c                         | 673 +++++++++++
>> ++++++++++
>>   drivers/ras/aest/aest-sysfs.c                      |  27 +-
>>   drivers/ras/aest/aest.h                            |  15 +-
>>   include/dt-bindings/arm/aest.h                     |  43 ++
>>   10 files changed, 1310 insertions(+), 16 deletions(-)
>> ---
>> base-commit: a67b7fd0dd1f6ccf3d128dc2099cdb07af1f6a09
>> change-id: 20260505-aest-devicetree-support-a3722d90e1f5
>> prerequisite-message-id: <20260122094656.73399-1-
>> tianruidong@linux.alibaba.com>
>> prerequisite-patch-id: c5a7c6431c6c1e6351241e694ee053800039d41d
>> prerequisite-patch-id: 1f6e2c20829eee41a210dd8a538f1e8efcc65872
>> prerequisite-patch-id: 5556287e3f46c2ed2c0431c53c7782e87bcbd866
>> prerequisite-patch-id: 2edae0a136d7779b8f686181720e71d044a73311
>> prerequisite-patch-id: b5190b2844dcb01e72f87a59f3a29548795fdb82
>> prerequisite-patch-id: 7ba848583708b2ae776a7ce847bb056e3de7f77b
>> prerequisite-patch-id: 397e5b22802b67942435f4f2968f0b1e210ba0e8
>> prerequisite-patch-id: 2169f4b65537eecbd0ccbd2ad6b28c64ec44655d
>> prerequisite-patch-id: b626f85d98747595b3240bc49e6ad9c9dd5c0fa9
>> prerequisite-patch-id: 1323dfd2eebad2ef6514dbbce58ba08e8859f894
>> prerequisite-patch-id: 95b826e5e329408437a3ef336c4f45d4d74f82bb
>> prerequisite-patch-id: b60ff489a5a33c5d5220fa8144af7b7511769cba
>> prerequisite-patch-id: 43f35a52b8a3d13c938ff08083403c1d3bd0df8b
>> prerequisite-patch-id: c55d4e9117ca36d3c2cba82d550a618cb82bb745
>> prerequisite-patch-id: 3885e10f318ae8101d6909b35d92a976cc359e3c
>> prerequisite-patch-id: 92958cde05577f069c5659018a274bb39cfb6b24
>>
>> Best regards,
>> -- 
>> Umang Chheda <umang.chheda@oss.qualcomm.com>
>>
> 


