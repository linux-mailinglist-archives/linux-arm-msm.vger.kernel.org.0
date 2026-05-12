Return-Path: <linux-arm-msm+bounces-107043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLoWHsLPAmq7xAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:59:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EE151B5FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 08:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8B3330571B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 06:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EF8357D08;
	Tue, 12 May 2026 06:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jalJ0c4C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9K/xqrT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFD135E947
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778568701; cv=none; b=GUXyerI7cwVQ15q2xmmesCDQ9f83G0aFjEDnTYR8g/CCqozRji8UBH2B7CKluWCdnEr61i16e7nTlftAdJ8H5vJv9574eDL82C5nqVFCU26L7gy4as5TfRE0fZjzzW/Nb8ZiBgn9eyv1PBzQviBHG7BcSD1JFsElsPLRbfixu3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778568701; c=relaxed/simple;
	bh=l2q/o3YLzqVvVBD9xt5YoGvrCny7mNfjFIlkwFKF4pI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hsILQPRsUJpVzlUUGJUFrJd4omY2ztmkp4WZgjHWFZIr+sJnAobzkvyE1Yu3ZodbNzi61v+Nis9r4vuu4LDoWfF7LbmiYOxLYSbJd42/TKlcRVIlKmX0R1ffxnMFMhAX4OlAnLkq6u+b4YJQ+UEq7KXOkQhV+WPfDhmM3Zd1sN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jalJ0c4C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9K/xqrT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C57npb2519075
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rps4+MRn8b+/NfK3qw8jn7TXbGFAbhWtr90VLiZIiHk=; b=jalJ0c4CDRMSfezs
	Dl1dgmNW9TD7oJ3eDj4RI0y0TKbotUzWHDqQAkQt/ETWFTT9E8HcQA7QBsein95h
	q8zAb3Dnyk0bYKEoq4LPZ1rQg1dqmQrlZbEfIwFJA2ZK8gf9p1stuiErrKt+VHkr
	LK6W0ELpbqUMMlTBPivsWakT7E6bOnhNVkgkEqsT0ITJTyo2lKgHFZ+x0gbiz/dc
	Q1IqiwG2vWxE7pULWT7QiEjCG32ULR/pRiYQ0k807dfoXn0rR2D+/MIJYorZ/CPJ
	dvZJSKY6X94gN7hJhNteIdfG7dIzE577ZGtN85AK1GytKWAV3+cnJs+kjH8Huro0
	Cymw0A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1hwqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:51:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c6e2a6ba6b6so668701a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 23:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778568691; x=1779173491; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rps4+MRn8b+/NfK3qw8jn7TXbGFAbhWtr90VLiZIiHk=;
        b=R9K/xqrTMUvi6syJAJF/ggyYfhvHflW+xPissLiPF/1mRRrTv+53I50YO/CHu/MrH0
         uAkwYRZCUQkaLAg0X8XgxRJmqMApFwy+sDYexu9dAs+NCH5kSgL5mwJz1v9D8LMab7zr
         jAiNSOa5Rt37uqqnR8wj0fVc8eh91C1q5MtjY1Qm69r9OxdVb/Z1IXrm8247G1FTCqbl
         sxrN/6xYKj5Jd3odQ4xzwUFBN9+RQiHM0R58IQOL6AUsEgL614lM1giaKOcDRqdxcwWy
         h0RZeqLsQeBRgRcWELndox30sYPZshhNtFeySp6BmJiD/95hLOa+2ehvsANldXdITDta
         CEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778568691; x=1779173491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rps4+MRn8b+/NfK3qw8jn7TXbGFAbhWtr90VLiZIiHk=;
        b=flZgdbTGbONFdtBj5sBzLqUjXhRhAq0GFy2yRIpntdKlYEtPUn9vdDymZOp/mlXqRb
         Qju1dmBn8uHOOuLItcaemwZSkj7GeKWd26DmydG/i/RWSdbGFddg6k/uMvr3+wpdFd8U
         k8hNfGAomPSnv333aO3DHGIk2gJFBuvGdjX4EfUXqlRoo3KhRsodjDjpsU3bN6yAlMUL
         WFIVmeF0ohZo61K07l0nJtsMtiJ3QlAeuRO2LJ7aik1Vm+7SQa776wKNPyXedg/hOi8Y
         7qHKtAUVnZ+7C8VZOW8cYkyWarsnUweq2/UZEoLjNku30iGGmrq+FFw+gQG85iboQ12j
         STXw==
X-Gm-Message-State: AOJu0YwdcMiHFa/c+0KDRMZ0bpYiEMHm9oLRBotz5Gpbrs6AGUc6ZVb0
	oyvXzJpIhJ87ZNMChxCHzLV1aq7baEMotdym0oDLufEdqu5nXYUv7AsspC+Oyzo401plHq8FNYh
	Oyz+xIDc+gkJzT8kw+irkX0HNlFhMrYNVoo4i8GtxbxxgnUUOzMkx9fGHoNOdJ9lrG/TE
X-Gm-Gg: Acq92OFf6aVHrPu7d4ALAkmF/7JjigpcAoP9GS9/FS9bTUo+VWrDvFN2hUpEpAfmNZ3
	eI5spIiP6osXK5EtCMhOPn05G/T6UKJaGO3rNQF9drpbcZJzLfKox98FN8xzUJmpxYVhTkMlgsc
	mw++Og+83obzC50KewHFdBJDjuG4gFLvSWomRVzkVoQTG5U2Y4HIvdmSYAnkOX7MzjBM2dgxSxM
	RuQeyuAdxMIQivCE3cs6YyoCkM9URuJPrlYE/PXo3Qtfh29OUQJ/zkIDnjFlRXbBfHxujK4QfXv
	hLM7yRmolDXsKyLUZR9NKDtoK6AHXX5xqEUnJOpld0vvC4B4xa0FHDvFPz2gICNgSBuaLcn1LuW
	PKiy6Z2mqX9NA2nFWdYhCh6wJdDW3UpsDJYPMvDOTUW/ZpTgUNIA=
X-Received: by 2002:a05:6a00:a804:b0:82f:21ee:270d with SMTP id d2e1a72fcca58-83a5aaf7794mr13651033b3a.1.1778568691150;
        Mon, 11 May 2026 23:51:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:a804:b0:82f:21ee:270d with SMTP id d2e1a72fcca58-83a5aaf7794mr13651009b3a.1.1778568690660;
        Mon, 11 May 2026 23:51:30 -0700 (PDT)
Received: from [10.92.198.185] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839683a6252sm22579715b3a.59.2026.05.11.23.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 23:51:29 -0700 (PDT)
Message-ID: <fcd68c71-2581-47dc-9e9d-2ef558b7a6d3@oss.qualcomm.com>
Date: Tue, 12 May 2026 12:21:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] ras: aest: Add panic_on_ue module parameter
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
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
 <20260505-aest-devicetree-support-v1-4-d5d6ffacf0a5@oss.qualcomm.com>
 <24e7a997-9479-447e-a1e2-cfab9a904668@linux.alibaba.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <24e7a997-9479-447e-a1e2-cfab9a904668@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: aPwPeL1eOdOlGEGEzDQhTIeJZ3N4EoBj
X-Proofpoint-ORIG-GUID: aPwPeL1eOdOlGEGEzDQhTIeJZ3N4EoBj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA2NSBTYWx0ZWRfX3jHXAvyhQwX2
 /TTkmHnqFIGlj4FDCfi9Mka8d5G93LJniimMlZs+75eK7tOZp/xGQv/I9DbYPsTI3halnhm+O01
 EOa/Mp9jezljLys0a0vDLMIar0GC3MBeqt2+TTqF4nzcgFKVqjZZEm8FkBPm5uqchAq6MY5fWGW
 /wJw4i6l1eJ0HZ23gRqHq2dJMakKyWcSMwUVbUAhe0y6u69Iu6osVtF92d8RiwW9f4J+C86WwuK
 I9OtXoOC1AXlMBIK8BhCIzBoQp0x39Mad+lSbiGY7x/cepPp9/1OWtL9nFdUryci6TBIT9BNYFr
 qtBXuCN/Ojd+JrVIlqNsMlC09cSfqwBnma2P6tQN3dHb+UafJJCcNoBexQv4HAuWMuoXec6BWlR
 EwZ2x4GVc476b1osl+v8CAHVUwOMgi1CAhH8huQgOLnlFGIjRQO/UIuz2lXFHlom0PHTv6Eubl9
 ools7RYuH6C3RE2DG6A==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a02cdf4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XXTmVIMiA0tzt-EScKkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120065
X-Rspamd-Queue-Id: 14EE151B5FC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107043-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Ruidong,


On 5/6/2026 1:36 PM, Ruidong Tian wrote:
> 
> 
> 在 2026/5/5 20:23, Umang Chheda 写道:
>> The driver unconditionally calls panic() whenever an unrecoverable,
>> uncontainable UE (UET_UC or UET_UEU) is detected. There is no way
>> for the user to suppress this behaviour, which makes it difficult to
>> test UE injection or to run in environments where a kernel panic on
>> every UE is undesirable.
>>
>> Add a module parameter `aest_panic_on_ue` When set to 0 the driver
>> logs the UE and continues instead of panicking.
>>
>> Usage:
>>    # Boot time (kernel cmdline)
>>    aest.aest_panic_on_ue=0
>>
>>    # Runtime
>>    echo 0 > /sys/module/aest/parameters/aest_panic_on_ue
>>
>> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> 
> Hi Umang,
> 
> Thanks for the patch.
> 
> I understand that this parameter is intended to facilitate UE injection
> testing and to avoid kernel panics in certain environments. However, we
> need to carefully consider the potential risks.
> 
> When a UC (Uncontainable Error) or UEU (Unrecoverable Error) occurs, the
> hardware state may be unpredictable, and data integrity cannot be
> guaranteed. Allowing the system to continue running instead of panicking
> in these scenarios could lead to silent data corruption or other
> unforeseen side effects, which poses a significant risk to system
> stability.
> 
> For the sake of robustness and data safety, I do not believe we should
> expose an interface that allows users to suppress panic on such critical
> errors.
> 
> If the goal is primarily to ease testing, I suggest handling this via
> local driver modifications in your test environment rather than
> upstreaming it as a configurable runtime option.


IMO, it would be useful to have a module parameter for this. In some
cases—outside of test scenarios—it’s necessary to avoid triggering a
kernel panic on UE errors.
Would it make sense to keep the default behavior as panic on UE, while
also providing a module parameter to disable it when needed? This way,
we can preserve the default safety behavior while avoiding the need for
local rebuilds just to change this setting.


Thanks,
Umang


> 
> Best regards,
> Ruidong
> 
>> ---
>>   drivers/ras/aest/aest-core.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
>> index b4f4c975da1d..9ce782a66edf 100644
>> --- a/drivers/ras/aest/aest-core.c
>> +++ b/drivers/ras/aest/aest-core.c
>> @@ -22,6 +22,11 @@ DEFINE_PER_CPU(struct aest_device, percpu_adev);
>>   #undef pr_fmt
>>   #define pr_fmt(fmt) "AEST: " fmt
>>   +static bool aest_panic_on_ue;
>> +module_param(aest_panic_on_ue, bool, 0644);
>> +MODULE_PARM_DESC(aest_panic_on_ue,
>> +         "Panic on unrecoverable error: 0=off 1=on (default: 1)");
>> +
>>   #ifdef CONFIG_DEBUG_FS
>>   struct dentry *aest_debugfs;
>>   #endif
>> @@ -342,9 +347,11 @@ void aest_proc_record(struct aest_record *record,
>> void *data, bool fake)
>>               aest_record_info(
>>                   record,
>>                   "Simulated error! Skip panic due to fault
>> injection\n");
>> -        else
>> +        else if (aest_panic_on_ue)
>>               aest_panic(record, &regs,
>>                      "AEST: unrecoverable error encountered");
>> +        else
>> +            aest_record_err(record, "UE detected, panic suppressed\n");
>>       }
>>         aest_log(record, &regs);
>>
> 


