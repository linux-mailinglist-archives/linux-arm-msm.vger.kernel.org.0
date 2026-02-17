Return-Path: <linux-arm-msm+bounces-93194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJiQFql3lGlmEAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 15:14:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4AD14D0EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 15:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B10530490E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 14:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF9436C0BA;
	Tue, 17 Feb 2026 14:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hT+3rthc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iho9SRKF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935B736BCC0
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 14:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771337503; cv=none; b=l48oQP9eFBXLM1mDdTHWH8wFR1zzf6TtvY2DYv8XjwF1rbUUpzUEUsGyZE0RYK7CWi06fLGJ8ZYsmxTVFhYQSCquieEWhY6wAv68j+vUlKeBb3bG8nkdrcuLFfSUqcKLYPn6HwNPNtDWV6Ju6Hb1t2XpLRwUutwWesfKxa87RzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771337503; c=relaxed/simple;
	bh=jbgmdcTQxX7pyYFMINAL/5nT7jyyBScF9+NauEz/E6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=izbuBjL9fQ6ftRIggTTCiHWzLxNp4aZQfZ+QndnTxFmxVbSjNyyksst5LNhVMamO5iqFWu5tfgeWiMEpha/ShgVGPaieebko6JVbVHg0E+c7dHbwZcGZfJ1ZpJuB51S2R2pTgaaCWV/fp8QncoVwCMirE7kI0K+Z7MozdBijvPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hT+3rthc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iho9SRKF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H93Xkc287946
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 14:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z1exp7vWAOAc8GFVwCy/aOu418CWdLbMRQ0dGRhuTVw=; b=hT+3rthckeAUkSf7
	Ik3aPKqd2Ytki8m6GCCFOkTg+oDsN4fmmSJ0Dy4aOj/g9wevAwrNglBHZWY27h53
	id4lXQenRM1ayaKrD04TONS4AmGImKcEP2Wo/DALoXp6aJT/c9fi9tmXhR04EGKg
	SO9yM5VuprjfgZ6+/YUMsMbt+BPRBN0ucrSQjdc0yQbIHUdnGmc8Zl9gSxZ0oQbT
	muJ80Qr3gvujp/DzyX4tPw7zwl9Hflq73kipJZjqXTudiyOD6N+6w4VdZ2zWIA2n
	0MVKxNC+wcEHrSWVzRH4q3+aYsMrvwtj3iX7cuFPu4PEs+uWEKsAIWHG+fGTU4wq
	6ZB64g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrtk90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 14:11:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8243ae83898so1841767b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 06:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771337500; x=1771942300; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z1exp7vWAOAc8GFVwCy/aOu418CWdLbMRQ0dGRhuTVw=;
        b=Iho9SRKFqz/CljpeBNOw82HEmX9wPGlbu5QWSJ96orkt53OVobwb2HJ0hS92kklQhH
         aDYZZie+UAfM4KCV/o7fzNuSrYRrbhk8W71TKQBLcRVU22FeCxQRwqFMxSh8iY98lVmW
         bE4vh5ojH7/pY0fcFsxWtUb2OBacZgITe2lv2mal/O7O/yhd92kUNM1E4CFEVLs4ilsS
         EuI7V/Ijl+tIwEKoQTo0u68OZe5Pi5ufUl+PXaM9gZHUv9ONXKSiIYyTUKlqIC3JeaBl
         jDdiJuN6MHGnT/nTUnGc0FGJLsW1PFgnh/VukvHgbtxXdcwi6A5/JzfdByWA9raEIzjK
         3M5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771337500; x=1771942300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1exp7vWAOAc8GFVwCy/aOu418CWdLbMRQ0dGRhuTVw=;
        b=P+BTEWygV8DsQrtMjSjERkn4FGFxOyj/EG0p4EkCO4Ync6De4EdfyPcE2JpI2qNC50
         sheCp0PPExoOIcjdcT3CzBLLRDqOe/BRpqXF9mz/UD6Qf+F2gXVW+IC+frHHdk0Oazt3
         xwblCZtyGKXvdCvatm0ZDKvi2SLK70/Z9F7/WUIy94NUZTKURNpgyLU+q/mKYc8cERfT
         ewVs3HPbNtZcojwyK69mIML8IpMEvgjCsfcaM0Dt+ltdwV/jDwQoFnyz1rTYxNpNFuQs
         S+Iz5eR2KdwYwgxvB4SHfS/M6RCyxlfOutHNM8aLvkIkjAEVq3E/owDcyhmOVqnD5UWU
         IKTw==
X-Gm-Message-State: AOJu0YzxbQIsma9KvomavH5yOlrP64XFKj4dayr1/wj9FPbuc+iJbf5/
	VktWPzKOVyttQMZAWvYGn2dmgC/xhXPwMGQesxgpbc76wMDccTCBc3SkQt6U/6SNmGs7Itck8Al
	MwaklhozNDmK0rXUGTfBCyDLfwd/+vSqrgMWbLuX6ybRUbSXq4M2YdXRjNv/6TWNFpI4aLhxIaB
	Og
X-Gm-Gg: AZuq6aI2dwvczM9UU/tXglJ73RqOOU8VrIHlMUl465vD8z4WL7htL98CRNlrzeb4gW0
	O89uGIH8iiJ25Rthq6Ztko8BrCIps719vmjq3A4xEhwaanlOAxnR9bZk12f+udeMiyHAWd/iA19
	3G6UNjr/pQHWm2zgUZW05Yn2DHhdJq+wv5Vl+8yOSQJw3MBDq7uU4j/n/Mf2cTxuchors9a73fg
	wD7i+C8QSrlvFOtZRNDB7m3gRx84ZHdqZJbezK1UZ/UUsL+AicnGOTTuWN93HwCX4ZAAGYBDoiK
	LHyaLpzb8YMxfTdLd7UPu4bRwbj/ik/7FMFMoHZPPWwFYMPww6sZRp+yO7t8apq0z+6F6u4EzTK
	yB5B5GmfN1k+6VMqC7E6JujPxUHmboOyWALH9qTkTr6irDLOXM7jkfw==
X-Received: by 2002:a05:6a00:928d:b0:821:8230:235d with SMTP id d2e1a72fcca58-824d95f6a41mr10187833b3a.39.1771337499955;
        Tue, 17 Feb 2026 06:11:39 -0800 (PST)
X-Received: by 2002:a05:6a00:928d:b0:821:8230:235d with SMTP id d2e1a72fcca58-824d95f6a41mr10187791b3a.39.1771337499420;
        Tue, 17 Feb 2026 06:11:39 -0800 (PST)
Received: from [10.204.100.45] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b90b9fsm15414434b3a.46.2026.02.17.06.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 06:11:38 -0800 (PST)
Message-ID: <7161bb8b-f8e4-4efe-a136-40983678a84e@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 19:41:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] media: iris: Switch to hardware mode after firmware
 boot
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260126-kaanapali-iris-v1-0-e2646246bfc1@oss.qualcomm.com>
 <fLxe2FUgx2tsLsXWrEdDq_iHxUUnVhy0BT_zzO3t3rmpLau36zhbLaZFyH5tQZJRO-uLVcHm4RsG_x1PEVOnKw==@protonmail.internalid>
 <20260126-kaanapali-iris-v1-4-e2646246bfc1@oss.qualcomm.com>
 <dd36c365-cffb-4fac-bf11-40e4896cbab5@kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <dd36c365-cffb-4fac-bf11-40e4896cbab5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=6994771d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=PsZjGXtKO3tw9YjmHZYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDExNCBTYWx0ZWRfX6UxynZVfJHqj
 +dVK5boEaFwySRQM5mUe/2Pv2BTTAOcAjNG889GGH+fY9HKjvn8LB+qH9W+E+b6sSeMXM4aeDwl
 L81aQ1XZLMm4HLLzdj13/J3SnVnfl3SvL6+wfHyZlCB6iRrRMBQzRMd07tUUacJO2XWmNLqcUbv
 vztV/3UwlCj4N0A1cwAUl8lJTEyRsCWJa+jmLIhprav77/Y5melTtd6ORA4eBDyL8VnadwtNXyn
 79FIIWALXF/cbPJ4gdUboypZqSvXmRNgDCsn4ErlHB0H2LUSinMqBAKGteELe243hvvI2Q6s7vH
 3SVFMqLDL9mEJJqFPCIkunbyAQzvjAuSltcV8LEduCxTzk4IsH8Ecn306iYUyoYr+JvnUTVr299
 MTMqGKJVFsQDKYGN0hb2FazpmzTLVvigFjH/L9F47938YYI94wnCy7ET2EXYcJztteb0aZ0pyV1
 swisCFJ/MowfhY7xu1Q==
X-Proofpoint-ORIG-GUID: -2BBkRkTpYbLLWnZw0iLoQ3CY6A3OTrN
X-Proofpoint-GUID: -2BBkRkTpYbLLWnZw0iLoQ3CY6A3OTrN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170114
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93194-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AF4AD14D0EF
X-Rspamd-Action: no action



On 2/2/2026 8:39 PM, Bryan O'Donoghue wrote:
> On 26/01/2026 12:25, Vikash Garodia wrote:
>> Currently the driver switches the vcodec GDSC to hardware (HW) mode
>> before firmware load and boot sequence. GDSC can be powered off,
>> keeping in hw mode, thereby the vcodec registers programmed in TrustZone
>> (TZ) carry default (reset) values.
>> Move the transition to HW mode after firmware load and boot sequence.
>>
>> The bug was exposed with driver configuring different stream ids to
>> different devices via iommu-map. With registers carrying reset values,
>> VPU would not generate desired stream-id, thereby leading to SMMU fault.
>>
>> Fixes: dde659d37036 ("media: iris: Introduce vpu ops for vpu4 with 
>> necessary hooks")
>> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_core.c       |  4 ++++
>>   drivers/media/platform/qcom/iris/iris_hfi_common.c |  4 ++++
>>   drivers/media/platform/qcom/iris/iris_vpu2.c       |  1 +
>>   drivers/media/platform/qcom/iris/iris_vpu3x.c      |  9 +++-----
>>   drivers/media/platform/qcom/iris/iris_vpu4x.c      | 24 +++++++++++ 
>> +----------
>>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 16 +++++++++------
>>   drivers/media/platform/qcom/iris/iris_vpu_common.h |  3 +++
>>   7 files changed, 38 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/ 
>> media/platform/qcom/iris/iris_core.c
>> index 
>> 8406c48d635b6eba0879396ce9f9ae2292743f09..dbaac01eb15a0e622e85635fddd29c1f7fc18662 100644
>> --- a/drivers/media/platform/qcom/iris/iris_core.c
>> +++ b/drivers/media/platform/qcom/iris/iris_core.c
>> @@ -75,6 +75,10 @@ int iris_core_init(struct iris_core *core)
>>       if (ret)
>>           goto error_unload_fw;
>>
>> +    ret = iris_vpu_switch_to_hwmode(core);
>> +    if (ret)
>> +        goto error_unload_fw;
>> +
>>       ret = iris_hfi_core_init(core);
>>       if (ret)
>>           goto error_unload_fw;
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/ 
>> drivers/media/platform/qcom/iris/iris_hfi_common.c
>> index 
>> 92112eb16c11048e28230a2926dfb46e3163aada..621c66593d88d47ef3438c98a07cb29421c4e375 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
>> @@ -159,6 +159,10 @@ int iris_hfi_pm_resume(struct iris_core *core)
>>       if (ret)
>>           goto err_suspend_hw;
>>
>> +    ret = iris_vpu_switch_to_hwmode(core);
>> +    if (ret)
>> +        goto err_suspend_hw;
>> +
>>       ret = ops->sys_interframe_powercollapse(core);
>>       if (ret)
>>           goto err_suspend_hw;
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/ 
>> media/platform/qcom/iris/iris_vpu2.c
>> index 
>> 9c103a2e4e4eafee101a8a9b168fdc8ca76e277d..01ef40f3895743b3784464e2d5ba2de1aeca5a4a 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
>> @@ -44,4 +44,5 @@ const struct vpu_ops iris_vpu2_ops = {
>>       .power_off_controller = iris_vpu_power_off_controller,
>>       .power_on_controller = iris_vpu_power_on_controller,
>>       .calc_freq = iris_vpu2_calc_freq,
>> +    .set_hwmode = iris_vpu_set_hwmode,
>>   };
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/ 
>> media/platform/qcom/iris/iris_vpu3x.c
>> index 
>> fe4423b951b1e9e31d06dffc69d18071cc985731..3dad47be78b58f6cd5ed6f333b3376571a04dbf0 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
>> @@ -234,14 +234,8 @@ static int iris_vpu35_power_on_hw(struct 
>> iris_core *core)
>>       if (ret)
>>           goto err_disable_hw_free_clk;
>>
>> -    ret = dev_pm_genpd_set_hwmode(core->pmdomain_tbl- 
>> >pd_devs[IRIS_HW_POWER_DOMAIN], true);
>> -    if (ret)
>> -        goto err_disable_hw_clk;
>> -
>>       return 0;
>>
>> -err_disable_hw_clk:
>> -    iris_disable_unprepare_clock(core, IRIS_HW_CLK);
>>   err_disable_hw_free_clk:
>>       iris_disable_unprepare_clock(core, IRIS_HW_FREERUN_CLK);
>>   err_disable_axi_clk:
>> @@ -266,6 +260,7 @@ const struct vpu_ops iris_vpu3_ops = {
>>       .power_off_controller = iris_vpu_power_off_controller,
>>       .power_on_controller = iris_vpu_power_on_controller,
>>       .calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>> +    .set_hwmode = iris_vpu_set_hwmode,
>>   };
>>
>>   const struct vpu_ops iris_vpu33_ops = {
>> @@ -274,6 +269,7 @@ const struct vpu_ops iris_vpu33_ops = {
>>       .power_off_controller = iris_vpu33_power_off_controller,
>>       .power_on_controller = iris_vpu_power_on_controller,
>>       .calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>> +    .set_hwmode = iris_vpu_set_hwmode,
>>   };
>>
>>   const struct vpu_ops iris_vpu35_ops = {
>> @@ -283,4 +279,5 @@ const struct vpu_ops iris_vpu35_ops = {
>>       .power_on_controller = iris_vpu35_vpu4x_power_on_controller,
>>       .program_bootup_registers = 
>> iris_vpu35_vpu4x_program_bootup_registers,
>>       .calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
>> +    .set_hwmode = iris_vpu_set_hwmode,
>>   };
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/ 
>> media/platform/qcom/iris/iris_vpu4x.c
>> index 
>> a8db02ce5c5ec583c4027166b34ce51d3d683b4e..02e100a4045fced33d7a3545b632cc5f0955233f 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
>> @@ -252,21 +252,10 @@ static int iris_vpu4x_power_on_hardware(struct 
>> iris_core *core)
>>           ret = iris_vpu4x_power_on_apv(core);
>>           if (ret)
>>               goto disable_hw_clocks;
>> -
>> -        iris_vpu4x_ahb_sync_reset_apv(core);
>>       }
>>
>> -    iris_vpu4x_ahb_sync_reset_hardware(core);
>> -
>> -    ret = iris_vpu4x_genpd_set_hwmode(core, true, efuse_value);
>> -    if (ret)
>> -        goto disable_apv_power_domain;
>> -
>>       return 0;
>>
>> -disable_apv_power_domain:
>> -    if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
>> -        iris_vpu4x_power_off_apv(core);
>>   disable_hw_clocks:
>>       iris_vpu4x_disable_hardware_clocks(core, efuse_value);
>>   disable_vpp1_power_domain:
>> @@ -359,6 +348,18 @@ static void iris_vpu4x_power_off_hardware(struct 
>> iris_core *core)
>>       iris_disable_power_domains(core, core->pmdomain_tbl- 
>> >pd_devs[IRIS_HW_POWER_DOMAIN]);
>>   }
>>
>> +static int iris_vpu4x_set_hwmode(struct iris_core *core)
>> +{
>> +    u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
>> +
>> +    if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
>> +        iris_vpu4x_ahb_sync_reset_apv(core);
>> +
>> +    iris_vpu4x_ahb_sync_reset_hardware(core);
>> +
>> +    return iris_vpu4x_genpd_set_hwmode(core, true, efuse_value);
> I'd like to see something in the commit log about the efuse value. What 
> is it, why does it appear etc.
> 
> Because just to be difficult you are not doing a 1:1 switch to hw_mode 
> here, you're also introducing contingent logic.
> 

The reset was added _only_ on vpu4 switching to hw mode as there is an 
issue of register corruption if ahb reset is not performed before mode 
switch. Hence reset is made explicitly part of hw mode switch.
Its there in earlier code "iris_vpu4x_power_on_hardware" as well, while 
this patch is shifting the code to a vpu specific hw mode api.

fuse check is only to differentiate between apv and others, since apv 
reset sequence is different than others.

I can add these info in commit.

Regards,
Vikash

