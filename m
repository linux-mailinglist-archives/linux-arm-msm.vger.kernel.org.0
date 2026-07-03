Return-Path: <linux-arm-msm+bounces-116300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KgE0NmCcR2rGcAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:26:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 50632701D32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 13:26:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LQrmJqkA;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KH1kcI1T;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116300-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116300-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3253530062DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 11:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9553C4175;
	Fri,  3 Jul 2026 11:24:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A0E10785
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 11:23:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077841; cv=none; b=T5wtibgp8PXNm9z2OYTl9Azdz0L/KMkl48CkuNVQee63L3gUgn3ytKXUV+Xc8fw284LmVYjGSGVVF48M5B1NpEDZiB8jGcbR1nNNQkwGe1y86rmvRvSIaiQDvlDoIsnJXt9Vu0nuoz/we1fy5nQQ6NvgaREY6SeW+eGRmnipIQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077841; c=relaxed/simple;
	bh=mwnWfpoFX0WoGZt4odfIXDBkd+ff1gg5vvITu9t4j+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LELTfaWOdxypYoo+h2fKTFShuB4zif2QyTUYkgchhA9wzmuX8UTNL9f+Z2DxVG0wBsXKUulhZT8abAAgswSVMFpdJwMIBf4KKBFqVSFyfe/Y6VYVVBw1ZhzfQSheo8tZipCF9KubIGjoWjfCcQrOHfNT0oZ/CGs1pGET4hTURKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LQrmJqkA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KH1kcI1T; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635s00h3124215
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 11:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z91LT0SZT2lRw+H7fyjC1nc3O1zsp0mqhLL4IOjJ1IU=; b=LQrmJqkAWzSpq0Qp
	G64DYaCOfFfM9b8YySNWYmHhV0KVzsTovnJoRZbusl8MzHzYpBJ1IdxFhdaL6vjm
	V1dCA94ZgZpP5Pw4CQNedDzPAekk74CsaxrcDQAogQlTcUGhsBGc4do+rNJ+QtH2
	QSxqijLAZixBOIH7qMxX28U7eSiVgcNLQPKV6fJBNbuFoQIPkFfM2fb8UCuL5Oi9
	nYrO8vfinH1nResuE63/RQjP76sIMyYAGKqX4CEoFdwe3x4NHOX9P1FFsqfGRjTo
	uk9/TGAHnFR8OT5AcnhM6sO1uDUU17H5//df98H63v+MPAh28ITvkgmbneQf7Qqr
	GEjkug==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnpd2wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 11:23:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381120d6d62so876976a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 04:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783077830; x=1783682630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z91LT0SZT2lRw+H7fyjC1nc3O1zsp0mqhLL4IOjJ1IU=;
        b=KH1kcI1Taj2jUVG5IvQmh+R+UiXd7/wlgRdt2zX8wi0itkFRvINmNCrixFQq/+G+7q
         9bBThPT/+Ds6f6VkdTDJdqR5REgOVDPxkrQCRwuWAZ6XvDq9CaanaThv2VhJ0BB3OMd0
         9s1v1UfYJcTPqFh6gwOwn/kbOi8uesacLMnfhcyg6EWmixdgIKg8gxM333OAWXpZYwhA
         BEqSmJ9ctMy9ZdmnyWRNwi+Y95B8xihZzkRqDbOiGbIynNOE1pwSEDttmknrp6uGa8cT
         fIax4y07e0iX2Gsd8SGNVsDZJqQaKPYT3ADO/QaSb+H00yGrPoERx6UtEU5YL4Zsk8Bh
         QeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077830; x=1783682630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z91LT0SZT2lRw+H7fyjC1nc3O1zsp0mqhLL4IOjJ1IU=;
        b=f3acqlBGzA/qnqFVnbKmVqsLj6P5R1+e7xt9qnsY5uy9jZX9AstP8cMu4ZQ4FwLns9
         cfjm+LUcsqTB6dTJAniLL3pbQtkjp1p2GYR+csUsmRS7dXI0kYtxfolYRm0m0E7eW1Vg
         RgUo3+J8IH1Kgh0NuXD7PSiT0l5hsPlIOVmK564vVE48vDSmVlPegjRErt/XgA/5AjJR
         P67gGDD7EM4Oj9HluPHlAcTAaf4V7FXzZi04RZcH8MZA711QKZ5q2F2XKM8XXgJTl5Sd
         zahZLzsNINFkMgMR/iYk5rlPL/rvPMABL5e33X/AQcS1ceBO2ZS66rSzKpGGT+Y41lGQ
         gB/g==
X-Gm-Message-State: AOJu0YyozVPh9hQFdoXPxnryh6l/gqI+U8tjTgvvp/2NCKHpUYf1zgjt
	E//GwWN4n5kXfQCVEmXx0uGjogremXAlelXnd1eT4Gbf0A+n8XnS2UTzgrFPCSj85zVCf9NJXCt
	2a12XLMDXVK2ouFJdO2AQ7I4xggvYKX/0jOipc02Kel7xWC5HBAPD1IxaSVkeV4Sgbc7p
X-Gm-Gg: AfdE7cmTwDSLMeFUuQ06UvJ8dgbVCp3kJqJrvNxt/yIa+bgzOwGfFyxbE1Xmr2A2Kkf
	6KnMBm4036IfulgHnuCvEWCaTBZmfPyGczZqN9J86uiHFMgH7T/k7DTmmZ12S91V1gkSB6NaD1k
	emxdsjRpMVAqQOWBVe9PiJcMode4QuJe0F7LuP8iPFhch8lBMwxj9IrejkmBDRbuOGGtYMLMMp7
	FLE8CbQhDM9bt4E8Z8s3AVeF74JOndfrMvhiLFn+XVBV2kGvLMUMNR1b6DRcJOQHO/lFYbuyrLu
	eVd1mad2hdyEUg9vAzinSKDgZSaQBf2vxIhnkDbib+3PLrV18e9rkvU1nBvW2zXkclgklYFBokB
	mSMUnmh4nV5Vhkg+6SXDu7eLoYtVGC8bP8u3Rynw=
X-Received: by 2002:a17:90b:48d2:b0:381:21ea:913a with SMTP id 98e67ed59e1d1-38121ea9b72mr3025215a91.22.1783077829562;
        Fri, 03 Jul 2026 04:23:49 -0700 (PDT)
X-Received: by 2002:a17:90b:48d2:b0:381:21ea:913a with SMTP id 98e67ed59e1d1-38121ea9b72mr3025177a91.22.1783077829052;
        Fri, 03 Jul 2026 04:23:49 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd221bsm20485342eec.22.2026.07.03.04.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 04:23:48 -0700 (PDT)
Message-ID: <c26de7fb-30da-4f7a-a3a9-413e6c0f028d@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 16:53:43 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kernel/cpu: Disallow offlining boot CPU based on config
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Thomas Gleixner <tglx@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260605-disable_boot_cpu_offline-v1-1-4c68fe1a6cf8@oss.qualcomm.com>
 <9b5ea951-6880-4ce8-8764-fd6bf2bd57a0@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <9b5ea951-6880-4ce8-8764-fd6bf2bd57a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDExMSBTYWx0ZWRfXwGg4zwD3HpFE
 tTrhroah0g/grwC2L8hKKk7PsQ8y5JwT1xJNqeyhTmct1Lm6Oluzg6t8X1IPlK5tYr2FV6iNCnp
 RY0nLrb69/OhBy5uuIwiZYl5TF0z6jM=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a479bc6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JzDM9ypL2hb05KE4TY4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDExMSBTYWx0ZWRfXy0QbObAdGJ92
 u8PIce1BdNDvGBkxUDv4xlux6AV3bhS9vNW+GW3zWLVfQ5uTchHtDUk8DGqTjDBL8rsnuRXlmua
 Gyi6EbjW0r3hBXqfoDjGAyzmG5whJkU8Nrv4sykeEJekf5JjLZkBaufN+STIrlbEIY+F3mfapjS
 yWM+0I6fbWv7DPrMWEwBSfsaWL8/y4C9G63AN8BazAIwADJ9i4rOJjLCM5OPUvH5E+ITpP2FB42
 vyqx51aGb36jWgDdhRnCLfrmTV12sY6KkFUiDT+Mi6e6U9S7ZT1b3vqNI2MxVuxn+epZa3rQZct
 zcO2KrNTOa2IIdBglPyJsK90iDqlwM9aBHzdyJD5Gx0+pUvrymRRbRZDlj4LDZtZR9VTQc7CAic
 8HefvfrXZcYX7/U2FYSeI7sBsxTp2kKuVarPe8B1W5gZ90BlOPhcqsmzY7gR4R5CYUAqWDNFzmE
 0ylreKrfP7V1rOXjjmg==
X-Proofpoint-ORIG-GUID: yJTzw1O_Ly5HVFMrY3OYmnS-ZnsO8LDb
X-Proofpoint-GUID: yJTzw1O_Ly5HVFMrY3OYmnS-ZnsO8LDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-116300-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:daniel.lezcano@oss.qualcomm.com,m:tglx@kernel.org,m:peterz@infradead.org,m:rafael@kernel.org,m:pavel@kernel.org,m:lenb@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50632701D32



On 23-Jun-26 5:10 PM, Daniel Lezcano wrote:
> 
> Hi Sned,
> 
> On 6/5/26 12:30, Sneh Mankad wrote:
>> The Qualcomm SoCs like LeMans, Monaco support suspend to ram which leads
>> the SoC to ACPI S3 similar state where SoC is turned off and DDR is
>> retained.
>> The hardware design on these SoCs forces a constraint to suspend and
>> resume the system on boot CPU / CPU0.
>>
>> If CPU0 is already offline before starting suspend to ram the
>> freeze_secondary_cpus() picks alternate CPU as primary / last CPU and
>> proceed further to invoke PSCI SYSTEM_SUSPEND.
>> This leads to a system crash.
>>
>> In order to prevent such an issue introduce PM_SLEEP_SMP_CPU_ZERO_STRICT
>> config and when enabled prohibit the CPU0 to be offline.
> 
> What is the status of this change ? Are you planning to send a new version with the check inside arch_cpu_is_hotpluggable() ?

Yes Daniel, I am sending v2 with adding the check in arm64 specific file.

Thanks,
Sneh
> 
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>   kernel/cpu.c         | 4 ++++
>>   kernel/power/Kconfig | 8 ++++++++
>>   2 files changed, 12 insertions(+)
>>
>> diff --git a/kernel/cpu.c b/kernel/cpu.c
>> index bc4f7a9ba64e62d76fbb2b362f243c918defe5bc..1c878db1d9cb6df0e31cb55343851aab4e38a3a0 100644
>> --- a/kernel/cpu.c
>> +++ b/kernel/cpu.c
>> @@ -1478,6 +1478,10 @@ static int cpu_down_maps_locked(unsigned int cpu, enum cpuhp_state target)
>>        */
>>       if (cpu_hotplug_offline_disabled)
>>           return -EOPNOTSUPP;
>> +#ifdef CONFIG_PM_SLEEP_SMP_CPU_ZERO_STRICT
>> +    if (cpu == get_boot_cpu_id())
>> +        return -EPERM;
>> +#endif
>>       if (cpu_hotplug_disabled)
>>           return -EBUSY;
>>       return _cpu_down(cpu, 0, target);
>> diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
>> index 05337f437cca29da57864583166d7f9abd526507..0b342b3a4a5650a1927dc4805d1515e1d9e067c6 100644
>> --- a/kernel/power/Kconfig
>> +++ b/kernel/power/Kconfig
>> @@ -401,3 +401,11 @@ config ENERGY_MODEL
>>         The exact usage of the energy model is subsystem-dependent.
>>           If in doubt, say N.
>> +
>> +config PM_SLEEP_SMP_CPU_ZERO_STRICT
>> +    bool "Disallow boot CPU (CPU0) offline"
>> +    depends on HOTPLUG_CPU
>> +    depends on SUSPEND
>> +    help
>> +      Disallow boot CPU (CPU0) offline when the suspend_ops->enter()
>> +      has to be executed by boot CPU.
>>
>> ---
>> base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
>> change-id: 20260603-disable_boot_cpu_offline-eb4f55ac96f2
>>
>> Best regards,
> 


