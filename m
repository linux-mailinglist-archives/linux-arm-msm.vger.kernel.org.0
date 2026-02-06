Return-Path: <linux-arm-msm+bounces-92011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K6fM7u9hWmpFwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:08:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8711AFC805
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 11:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E7183055324
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 10:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D588364EB6;
	Fri,  6 Feb 2026 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dcn5YSV3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="il2iCOeu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA1D364E84
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770372477; cv=none; b=LfeJOLFwfG35qEInwlchW4t4pF9hP6oJmQCUQegsVrtgDNWdI0gVACoQ+huCs03/6J9Fjw7isE3c8YAlfbLP58CyCFFFKI0MC8eFZf+5aFLu/CcNUOlMtwtgcxKAa4ugIpForH3Tk63T4F5ZdncxRv0bR38UsVTSK+bQp3Xkizc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770372477; c=relaxed/simple;
	bh=0E9mo9DN1FKW4XT+FTAM1wtcU1yuO3ioUMePcL/S1n0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ifl9PIp9ZNV+Km4KHdAtUBLVH2ZonPUvcgFdG6z3pL6OQt9pBoLYaHPnUYYB/Qwa8W5V5kNJCcE2TOVki2M7dKCaztz1ykhloeBg5eDoI1q2O1Lw2apUBCLmy6fhisUfJa0yZg5u8Hm6CvQ9wslOaO1XBZm9qRasgAPX8zUheIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dcn5YSV3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=il2iCOeu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167XeuZ1852690
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 10:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GBAVQJHWkIYxF69dv/EgYfX5c7wHd9L4aO+a81IvwWs=; b=Dcn5YSV3SFQbb68g
	Nqh5z0qTdFpB5uQIZ23t6mk0FjvE9hLI/HfBhIIQ+gRaNYvYR7K3vR2j0H9L62EU
	GHQMNuPh+ujWPExEuRhaAsyHtGm2igGxuBDzXWM14l/hYCpeMq3cc3exUVsVlM6b
	GgHQAVQSl8DbthWO4v6W21y/4GyKD3nas7oS+l+ai/eq+HIwc1Jy040h0IYblIka
	8MCRyAF6dJLM7ovh+KYOV/MVPa/4l7QwgB8u1YPVc0dnxgcWmh4E6dQp3wrezqhr
	awSpg1l/NguiwZCCEnR7Pgv7SCBddsowip3y2nQPbaWR8QWM/0Z1+J23TMLynwRc
	XeqJMA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c148gsn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 10:07:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c613426e8dcso982868a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 02:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770372476; x=1770977276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GBAVQJHWkIYxF69dv/EgYfX5c7wHd9L4aO+a81IvwWs=;
        b=il2iCOeuBlKCzqsKPFhFdZE6JytqDt6AGZZIieigSH4yPft/bF6QzA/y7l9MZ2SK0M
         DDXq2FORJZaWp1LCMLrTiP5zyzNaqu/t5iWhog/x5QCAv6LNkGdc53UV8tEW3G4LitLA
         d2N6ZJIBsOhlBARnRB3Va/ESDtwnyjnuPvujb8HrG6s4tbUrkYTQC2laUPguL7r5UCCz
         OY995vCFQk8dmALOy36cs5kFMHosfite20O834D0y7eWcpgQegnKz+Wt4LEe4RJaCpPx
         auEEhq9AVvM/xCR8a5ojtI4yten832SHTQKryi3BnMXmuSMOe/djuVlnka/UVyeBjXPU
         WN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770372476; x=1770977276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GBAVQJHWkIYxF69dv/EgYfX5c7wHd9L4aO+a81IvwWs=;
        b=PRSeSOb307RvbSA1ubfTHuyNZA29YIw81+cnP+qzpKfKzd5+qX3NtpywfKWNmb/48X
         01/b9Mb7ThpQNEHckEc0ORpCcTI5wOeXyo/fKV02DLX7OYuwqCXX/X3XoIn/HvQl9pYj
         J+cWJpr6gxe42N1hSpxUfnY9i/ZDgANB0VTWeF8R/5FkhFosYTIrrWInJdUDtlWc1HpA
         +raPQcvaB4Wq2v+MOJv5fzi0QEz3EIA5ZeZVSufuI60BnKnUNsNddLkYspsvu1RLn79z
         QgNeRBuSKyDiGwy02AXLYSf+Da2mmmy+41pPlIlLpvjK8CSaKF0Ku7/xkEWKhV1ILMXy
         +B0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUctaxTSb6xRSDYezv6LAPIX24H7j2WSCSwGfYiuok3Hlvf/gHJorkbR5Mw4HKN+2PT7UqBiLB3vNBt3Mta@vger.kernel.org
X-Gm-Message-State: AOJu0YyhMcB00XOkM04gD7Q/WbyNtNmMtgouSE4u/mCDGriMaFr4XqQU
	KUzcB7M8tXjuUG1z6+LSOhb1PtUTT16RJHmq7C59cO7sTFoAXiD7iEQyTMpRcUtHxlGKEDn1wS5
	wZcfRWIiA0AxYg9DE5uS+iiy3yUK6x4IbBeLm2SwAdhvCqUJOjnuv6KXiRbUQ715OPbJh
X-Gm-Gg: AZuq6aK4XjW2SH9TGYJcAJzGnT0pbZCAGrp5H3ngJya07c5+Ls6wD1fBk/43qSVyhs6
	asS532dUC93wJEv+XTeMU7xcfAKHigZsAUfgbn+wZicCMgvHzKuk5xJEdU1EZNc9q+zfJjfGoli
	0p/hzI/rm6g/58zMmRabUk7SU9/uKXKyPo/WcrL+3kwsqavJGRPqxLR8L9auFvhi3ccPuR3Lelg
	19saYLMJ9C+T1XmbI7JD2oOZ4Yyxkq4T5DeT07yxnUuy67xJKBfVpTm8Ii8G3exP+ewd6G3ba0z
	CUhPKRHAZxBNesQM2WT5wufj1EABkmm9UxCjdNLqxez1VCAqDPldhfF5S+lfInccxofVJZ9kM9u
	2q8jLmCSFjB20ReueMdtTk/foZ1HTYnZdw3VvPyQ=
X-Received: by 2002:a05:6a21:6d9b:b0:38d:f661:9940 with SMTP id adf61e73a8af0-393ad37760dmr2428841637.60.1770372475902;
        Fri, 06 Feb 2026 02:07:55 -0800 (PST)
X-Received: by 2002:a05:6a21:6d9b:b0:38d:f661:9940 with SMTP id adf61e73a8af0-393ad37760dmr2428801637.60.1770372475334;
        Fri, 06 Feb 2026 02:07:55 -0800 (PST)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b4607243sm1148402a91.6.2026.02.06.02.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 02:07:54 -0800 (PST)
Message-ID: <2830a189-a5ce-45a0-92fe-7a01c3b012a7@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 15:37:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] dt-bindings: crypto: qcom,ice: Require power-domain
 and iface clk
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Brian Masney <bmasney@redhat.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123-qcom_ice_power_and_clk_vote-v1-0-e9059776f85c@qti.qualcomm.com>
 <20260123-qcom_ice_power_and_clk_vote-v1-1-e9059776f85c@qti.qualcomm.com>
 <14a71b33-4c10-41b0-a6cb-585a38e05f56@kernel.org>
 <06160c6c-a945-467a-be82-7b33c5285d0f@oss.qualcomm.com>
 <7216c86d-2b87-496c-9548-ccdcb3c98b6b@oss.qualcomm.com>
 <1f99db18-d76c-4b87-9e30-423eee7037e1@oss.qualcomm.com>
 <dd34525c-0a25-47ae-9061-c4c7ab708306@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <dd34525c-0a25-47ae-9061-c4c7ab708306@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=6985bd7c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=lLI43KLFf-FV-pE1sQEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2OCBTYWx0ZWRfX3FGhqkeI80oB
 WuON+VJrGXWy1/9DkvN/LKrTykIH1dgbK84V2hQc8w1qhPIz2SbXBxrcRGXfFfMTwIcPwF6gGrL
 ibnKFi0n5EL9SClUzWkaY760AucI7OwKQTRe7igcPC4TjIW855VVP2QHGZgJxqqzdXiV39S882P
 BOwNGsfUqO3wZj63k/UFFE1nvz3CGccgyQmRmra+UFOBOfNWOcVvQpdJrEkjfmkFYBt8vP7TxKN
 J3yha6TSMJLSjQSj65nMDdLaD4zvlp8/BpfcoSUqU+APVx+d7MqaIGiw/dvdOjnMNth2yCc7zDe
 2drmjGEM/fivzKou0LwN997mrpAQKdJpe822Vie/7aUQQwcdsqnLC9VlFpKm2bnZnuD5fuasQQB
 O//k35xiuicfg+QBciw3nDK0Jn/WloK+l5MKC0eGimRIt7fs2wzc1ZSNC7tRp+zoFsDTIGmU4dE
 0MitJcbQn1zbwvR8r7A==
X-Proofpoint-ORIG-GUID: VF7YjUFpxm9t1CaEzVajvxa5wOnPV4TB
X-Proofpoint-GUID: VF7YjUFpxm9t1CaEzVajvxa5wOnPV4TB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92011-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8711AFC805
X-Rspamd-Action: no action

Hi Krzysztof,

On 2/5/2026 4:47 PM, Krzysztof Kozlowski wrote:
> On 03/02/2026 10:26, Harshal Dev wrote:
>> Hi Krzysztof and Konrad,
>>
>> On 1/26/2026 3:59 PM, Konrad Dybcio wrote:
>>> On 1/23/26 12:04 PM, Harshal Dev wrote:
>>>> Hi Krzysztof,
>>>>
>>>> On 1/23/2026 2:27 PM, Krzysztof Kozlowski wrote:
>>>>> On 23/01/2026 08:11, Harshal Dev wrote:
>>>>>> Update the inline-crypto engine DT binding to reflect that power-domain and
>>>>>> clock-names are now mandatory. Also update the maximum number of clocks
>>>>>> that can be specified to two. These new fields are mandatory because ICE
>>>>>> needs to vote on the power domain before it attempts to vote on the core
>>>>>> and iface clocks to avoid clock 'stuck' issues.
>>>>>>
>>>>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>>>> ---
>>>>>>  .../bindings/crypto/qcom,inline-crypto-engine.yaml         | 14 +++++++++++++-
>>>>>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>>>>> index c3408dcf5d20..1c2416117d4c 100644
>>>>>> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>>>>> @@ -28,12 +28,20 @@ properties:
>>>>>>      maxItems: 1
>>>>>>  
>>>>>>    clocks:
>>>>>> +    maxItems: 2
>>>>>
>>>>> This is ABI break and your commit msg suggests things were not perfect,
>>>>> but it is not explicit - was this working or not? How is it that ICE was
>>>>> never tested?
>>>>>
>>>>
>>>> I took some time to educate myself on the point of DT bindings stability being a
>>>> strict requirement now, so I understand how these changes are breaking ABI, I'll
>>>> send a better version of this again.
>>>>
>>>> As for your question of how it was working till now, it seems that
>>>> things were tested with the 'clk_ignore_unused' flag, or with CONFIG_SCSI_UFS_QCOM
>>>> flag being override set to 'y'. When this is done, QCOM-ICE (on which QCOM-UFS
>>>> depends) initiates probe _before_ the unused clocks and power-domains are
>>>> disabled by the kernel. And so, the un-clocked register access or clock 'stuck'
>>>> isn't observed (since the clocks and power domains are already enabled).
>>>> Perhaps I should write this scenario explicitly in the commit message?
>>>>
>>>> To maintain backward compatibility, let me introduce minItems and maxItems for clocks.
>>>> When the Linux distro uses CONFIG_SCSI_UFS_QCOM=y, we can do with just 1 clock as
>>>> before.
>>>
>>> You must not assume any particular kernel configuration
>>>
>>> clk_ignore_unused is a hack which leads to situations like this, since
>>> the bootloader doesn't clean up clocks it turned on, which leads to
>>> situations like this where someone who previously wrote this binding
>>> didn't care enough to **actually** test whether this device can operate
>>> with only the set of clocks it requires
>>>
>>> I believe in this case it absolutely makes sense to break things, but
>>> you must put the backstory in writing, in the commit message
>>>
>>
>> I took some more time to think this through, and I agree with you now Konrad.
>>
>> These DT bindings appear to be invalid from day-1. ICE being an independent
>> and common IP for both UFS and SDCC, it cannot operate correctly without its
>> power-domain and clocks being enabled first. Hence, it should be mandatory for
>> them to be specified in the DT-node and the same should be reflected in the DT
>> binding.
>>
>> The only reason I can think of for omitting the 'power-domain' and 'iface' clock
>> in the original DT-binding for ICE is because we failed to test the driver on
>> a production kernel where the 'clk_ignore_unused' flag is not passed on the cmdline.
> 
> That's a reason to change ABI in the bindings, but not a reason to break
> in-kernel or out of tree DTS.
> 
>> Or if we did test that way, we were just lucky to not run into a timing scenario
>> where the probe for the driver is attempted _after_ the clocks are turned off by the
>> kernel.
>>
>> Sending a new patch, which makes these two resources optional (to preserve the DT
>> binding) would either imply that we are make this bug fix optional as well or
>> asking the reporter to resort to some workaround such as overriding
>> CONFIG_SCSI_UFS_QCOM to 'y'.
> 
> Either I do not understand the point or you still insist on breaking a
> working DTS on kernels with clk_ignore_unused, just because what
> exactly? You claim it did not work, but in fact it did work. So you
> claim it worked by luck, right? And what this patchset achieves? It
> breaks this "work by luck" into "100% not working and broken". I do not
> see how is this an improvement.
> 

My point is something more fundamental. It worked before and it will still continue
to work if:
1. We pass the 'clk_ignore_unused' flag. or,
2. If the Linux distro is overriding CONFIG_SCSI_UFS_QCOM to 'y'.

But that does not change the fact that the current DT binding does not fully describe all
the resources required by the hardware block to function correctly.

> My NAK for driver change stays. This is wrong approach - you cannot
> break working DTS.
> 

I agree that this patch in it's current form will break both the in-kernel and
out of tree DTS written in accordance with the old binding. If this isn't acceptable
at all then like you said we need to move forward in a way that preserves them.

But I am trying to highlight that if we go forward this way, we are all agreeing that
kernels with these old DTS can only work under the two conditions I described above. If the
kernel doesn't obey either of those conditions, the kernel won't boot.

If we are all aligned that preserving the older DTS is very important, since they
still 'work' under certain conditions, then sure. I'm fine with sending a new patch
that doesn't break the ABI as per my initial response. Let me know your thoughts.

Cheers,
Harshal

> Best regards,
> Krzysztof


