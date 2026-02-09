Return-Path: <linux-arm-msm+bounces-92204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GgnD/hziWnl9QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 06:43:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2581E10BCC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 06:43:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8E40C300463C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 05:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE7A230FC0A;
	Mon,  9 Feb 2026 05:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yy6Yv2m0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cayzPD4N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BB530F7FE
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 05:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770615795; cv=none; b=DUjEgaXrjKU1RmCBCb4Cu7rQc/w8Ngcx6I/DAW29dRrU4WMNzgNqyLZ6vVqW9c6/Nq7yhcXZ7eO7cXJ+k9xEepH//GI7t4ibwbwURR8euXMOz3IupZ02U/ABMrlRVnKTPDNh2wJxJy/DUv31F65GSQTbRCVj5PUjlPMafDAxKlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770615795; c=relaxed/simple;
	bh=BgQyBP2POhvf7dfpLjckZBvIentNI3ZdpYWQIxuUchw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c4gKOrl5N3NODKhXOBEEz+BfRuUYeQ4yfCLMuUKxn+4ZnIDpuaxmhGm2ijMdzQP+nnNIKxQKHt0yCMiPUUzUSTbEirTBhb+p+exgHRuMXSXJp/gUofaj73lOTcRYbNwzQDC+857xY9UTEAJQrfkG3JzkK/kfkRM5FWG3IwNWeYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yy6Yv2m0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cayzPD4N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61952fQH2586857
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 05:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KaS2bDCERxGhUQ++FUxZO6KStC/Aihej3Lb7UvRApxA=; b=Yy6Yv2m03ywgi23l
	BlxcDT3W0OVd5hlS6HKORTcgJx/MmfPcjWefRPIBRYCG4GNpBk/o9UJEftf4HUYQ
	dPsXKB5CKyRxuF5VMEO2lxsp4ofDAybB+FinuH4zLsC0hNAduavCxzBqKKvojUNK
	w3MPmi49TPgVZBes70I22sEgLMRNDUZBRVFh65NxhX3WdlWua9ILOPpfMrcOfPtb
	i/w8/lvJ6Us9gbPeUnbpG5JfD8fq65FUnd3Nsdxj7KWmXC1zEr+tD2/qJGVr0ixS
	MP3PeszMGAeaqMfAdFOybKxkRWV5qiJ+KLpIOD6dhp6/oRBe/O70wgGfYcHtcjXd
	rfb2sQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c793bg3cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 05:43:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354490889b6so7547115a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 21:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770615793; x=1771220593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KaS2bDCERxGhUQ++FUxZO6KStC/Aihej3Lb7UvRApxA=;
        b=cayzPD4NYIyGb9Q7+x1tzL+vE5Qzix8lv7vikXsYgFWftcCBo4vPjg8JORX6KkTTZn
         XQ09JYGpQp6hVM8zNa5WVUIEq6Fp8niCGVCHlDyJiRmHO0AOqT22wxbNfUgNc2qLWId1
         CHxZllMDiv31FjddUvNpILYKKdaibIENrfD2YPXp9q/RSJHstDovXtmO59v/youxrmzb
         kB6wlr9CVLSsvkiNlqhS6Bsx8aCCMEu/rJM1HGjMUAPNK8XME4Ar+7Rc1cUpcM5X+Am7
         jc90WiQgjWM+s9lxLojIA+1PXNIqeFS618LmfqwiWsWZQq+8fXOfa4Kl680VjMykz+ux
         NawA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770615793; x=1771220593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaS2bDCERxGhUQ++FUxZO6KStC/Aihej3Lb7UvRApxA=;
        b=PEEnxbX+QQx7R/yavBN04o8ocY0RJDzPjLIv0wOneCPyV/RGORAIqUWb8gQBZkj1ib
         d8QXJn+p54EmrQM0mKIBDiwKq/kg3mKbLe5+rp8Oq85ziN5nscaPw0KaDKZcF+rw+xsB
         yLE4ThdCheTbRjlqjWhUwZvO9t3hvkMcTb+Lj6V/G120y/d4EvOHgZfMmpTfFFtY7LXq
         DoC8ZEO6t7P6qDlt2ur2NXIVAKKhf++CeUEpCo2hiFVpprGlk065P6U2FBGyMLT4jTEB
         cEZHKvU1RLiEFXSJCSMocMFb08zB9aIBVZAQFkzrNgWxBf4sBrS209ZcONDw0qDJVncu
         foGA==
X-Forwarded-Encrypted: i=1; AJvYcCW9kBZqsFJrqwEUZDfN4IsKN4RBPm6WfM8dEcRKh3NQ4NdBlh9zIAM5aS3KhDkIx0yYvMzdvQGa70Jp0hKy@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl9IeOqDmOM04EN8wL8JnnBdlvT69dlqrPRvUvHFmf0as2LRDb
	Wwppf0sFlmczBKYmaIUSDlwhZd0PDAYrA7sWv188/stRitF5lCaHtX2Bp0pRrKD5h3tl66ZRghG
	9vJKsj0766TE044vu5lvy/wg4kpCNy5lVvE9XUfCEQIdBezoUCzymCfIa/fACGwk3bwOq
X-Gm-Gg: AZuq6aK5tINlDr10iw118x0h2EelmOoELI9jYGRf3xUrnnH3nUdnEdNRhBRLpqttC29
	VR8lghasYs4uHkGdCwZ/miRdB8xMHWuuvbvu22/DzyYXohaTiJbHVT5ih4w6L7N99mfWx1Ps2HT
	QLypqgH0fw5ilr3EszaQsdUvE8/o1C1U5UBR+oJvoH6P4RMFJ4kH6Fm86i9QQJT1jynt3dRbxXl
	D9cN5zXwTvS1x/fKx4FONad3FHVwHJ79dKiY+WQGpGeRQsCkUg/a4oqSr6vZTUDDiDYdNXwbyli
	ABwtAc7MRufGI8m0ZCrDBSljlXKJnH2LEDblQJdqrMDezE2fGVkdCDNPSNRms9BWC4p3DqnXN8x
	olbm8UEehjr0RzN3MtR9grUG6x9wEXWwkQ6kfUq0=
X-Received: by 2002:a17:90b:2f10:b0:353:e91:9b38 with SMTP id 98e67ed59e1d1-354b3cf5762mr8768918a91.34.1770615793404;
        Sun, 08 Feb 2026 21:43:13 -0800 (PST)
X-Received: by 2002:a17:90b:2f10:b0:353:e91:9b38 with SMTP id 98e67ed59e1d1-354b3cf5762mr8768882a91.34.1770615792855;
        Sun, 08 Feb 2026 21:43:12 -0800 (PST)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb5e406asm11797632a12.22.2026.02.08.21.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 21:43:12 -0800 (PST)
Message-ID: <b217a08a-2755-4ef8-bf39-af1c3e628cf8@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 11:13:06 +0530
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
 <2830a189-a5ce-45a0-92fe-7a01c3b012a7@oss.qualcomm.com>
 <6efcdf51-bdb1-4dfc-aa5e-8b7dc8c68cd3@kernel.org>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <6efcdf51-bdb1-4dfc-aa5e-8b7dc8c68cd3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ctOWUl4i c=1 sm=1 tr=0 ts=698973f2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jJ6LFyVhKJnmHHG_DRUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 9q2OswAJCLFGrFffho4-ickLRZP4aaOm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA0NSBTYWx0ZWRfX/9VHHXzTomTA
 dH5B+QDY6tiOZG/mzIJsvs5CPrvvv30j+/yRLWSxlVOrW82H8P65bfxu81WIP0Kvj87r5fMBswn
 GIWo4MpTkXb0ca/jRtWQM5WzGGf0lWdVsE8M2Fwge6fxKz+du8zjEsvSkBilk9BKReKyJ2IYSsg
 DPS/Y3zY69F7eJIUqoDTdXD2VSPg37PdL0bhKDFclzHpy1z8/QtV7pXa5f5feHxc3liLC5bNxv6
 b2Q7jFDxaz+8HmUakJFgkR8qzSu2KvhW7fRF1tmtAIR+lOdTkE5C6yc6Hom5Lo6C5r3zYuQRuZ4
 ltrhwwhzImrNVh1Cv4WxCoIVvjDjP65Z7lu+dl2pYBVoRfFUqptHZdfEHch1whSb/sXlNsuyWHl
 T76oV6KhSt0H5bGSUaO13ZlpYKBrCEBxndhtNq5254APsBoO+27j3vr9n7YoLw+Db2/cFvFQA53
 HKpyQ85mnhd98vlnoBA==
X-Proofpoint-GUID: 9q2OswAJCLFGrFffho4-ickLRZP4aaOm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090045
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92204-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2581E10BCC6
X-Rspamd-Action: no action

Hi Krzysztof,

On 2/6/2026 4:20 PM, Krzysztof Kozlowski wrote:
> On 06/02/2026 11:07, Harshal Dev wrote:
>> Hi Krzysztof,
>>
>> On 2/5/2026 4:47 PM, Krzysztof Kozlowski wrote:
>>> On 03/02/2026 10:26, Harshal Dev wrote:
>>>> Hi Krzysztof and Konrad,
>>>>
>>>> On 1/26/2026 3:59 PM, Konrad Dybcio wrote:
>>>>> On 1/23/26 12:04 PM, Harshal Dev wrote:
>>>>>> Hi Krzysztof,
>>>>>>
>>>>>> On 1/23/2026 2:27 PM, Krzysztof Kozlowski wrote:
>>>>>>> On 23/01/2026 08:11, Harshal Dev wrote:
>>>>>>>> Update the inline-crypto engine DT binding to reflect that power-domain and
>>>>>>>> clock-names are now mandatory. Also update the maximum number of clocks
>>>>>>>> that can be specified to two. These new fields are mandatory because ICE
>>>>>>>> needs to vote on the power domain before it attempts to vote on the core
>>>>>>>> and iface clocks to avoid clock 'stuck' issues.
>>>>>>>>
>>>>>>>> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>  .../bindings/crypto/qcom,inline-crypto-engine.yaml         | 14 +++++++++++++-
>>>>>>>>  1 file changed, 13 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>>>>>>> index c3408dcf5d20..1c2416117d4c 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml
>>>>>>>> @@ -28,12 +28,20 @@ properties:
>>>>>>>>      maxItems: 1
>>>>>>>>  
>>>>>>>>    clocks:
>>>>>>>> +    maxItems: 2
>>>>>>>
>>>>>>> This is ABI break and your commit msg suggests things were not perfect,
>>>>>>> but it is not explicit - was this working or not? How is it that ICE was
>>>>>>> never tested?
>>>>>>>
>>>>>>
>>>>>> I took some time to educate myself on the point of DT bindings stability being a
>>>>>> strict requirement now, so I understand how these changes are breaking ABI, I'll
>>>>>> send a better version of this again.
>>>>>>
>>>>>> As for your question of how it was working till now, it seems that
>>>>>> things were tested with the 'clk_ignore_unused' flag, or with CONFIG_SCSI_UFS_QCOM
>>>>>> flag being override set to 'y'. When this is done, QCOM-ICE (on which QCOM-UFS
>>>>>> depends) initiates probe _before_ the unused clocks and power-domains are
>>>>>> disabled by the kernel. And so, the un-clocked register access or clock 'stuck'
>>>>>> isn't observed (since the clocks and power domains are already enabled).
>>>>>> Perhaps I should write this scenario explicitly in the commit message?
>>>>>>
>>>>>> To maintain backward compatibility, let me introduce minItems and maxItems for clocks.
>>>>>> When the Linux distro uses CONFIG_SCSI_UFS_QCOM=y, we can do with just 1 clock as
>>>>>> before.
>>>>>
>>>>> You must not assume any particular kernel configuration
>>>>>
>>>>> clk_ignore_unused is a hack which leads to situations like this, since
>>>>> the bootloader doesn't clean up clocks it turned on, which leads to
>>>>> situations like this where someone who previously wrote this binding
>>>>> didn't care enough to **actually** test whether this device can operate
>>>>> with only the set of clocks it requires
>>>>>
>>>>> I believe in this case it absolutely makes sense to break things, but
>>>>> you must put the backstory in writing, in the commit message
>>>>>
>>>>
>>>> I took some more time to think this through, and I agree with you now Konrad.
>>>>
>>>> These DT bindings appear to be invalid from day-1. ICE being an independent
>>>> and common IP for both UFS and SDCC, it cannot operate correctly without its
>>>> power-domain and clocks being enabled first. Hence, it should be mandatory for
>>>> them to be specified in the DT-node and the same should be reflected in the DT
>>>> binding.
>>>>
>>>> The only reason I can think of for omitting the 'power-domain' and 'iface' clock
>>>> in the original DT-binding for ICE is because we failed to test the driver on
>>>> a production kernel where the 'clk_ignore_unused' flag is not passed on the cmdline.
>>>
>>> That's a reason to change ABI in the bindings, but not a reason to break
>>> in-kernel or out of tree DTS.
>>>
>>>> Or if we did test that way, we were just lucky to not run into a timing scenario
>>>> where the probe for the driver is attempted _after_ the clocks are turned off by the
>>>> kernel.
>>>>
>>>> Sending a new patch, which makes these two resources optional (to preserve the DT
>>>> binding) would either imply that we are make this bug fix optional as well or
>>>> asking the reporter to resort to some workaround such as overriding
>>>> CONFIG_SCSI_UFS_QCOM to 'y'.
>>>
>>> Either I do not understand the point or you still insist on breaking a
>>> working DTS on kernels with clk_ignore_unused, just because what
>>> exactly? You claim it did not work, but in fact it did work. So you
>>> claim it worked by luck, right? And what this patchset achieves? It
>>> breaks this "work by luck" into "100% not working and broken". I do not
>>> see how is this an improvement.
>>>
>>
>> My point is something more fundamental. It worked before and it will still continue
>> to work if:
>> 1. We pass the 'clk_ignore_unused' flag. or,
>> 2. If the Linux distro is overriding CONFIG_SCSI_UFS_QCOM to 'y'.
> 
> I do not agree with this. I already commented about your driver. If you
> do not believe me, apply your driver patch and show the test results of
> existing working device.
> 
>

Apologies, it seems like I failed to explain correctly what I meant.
Here I was talking about the existing in-tree ICE driver and not about this particular DT
binding commit. This commit, as you rightly said and I mentioned below too, breaks backward
compatibility for existing in-tree and out-of-tree DTS.

>>
>> But that does not change the fact that the current DT binding does not fully describe all
>> the resources required by the hardware block to function correctly.
>>
>>> My NAK for driver change stays. This is wrong approach - you cannot
>>> break working DTS.
>>>
>>
>> I agree that this patch in it's current form will break both the in-kernel and
>> out of tree DTS written in accordance with the old binding. If this isn't acceptable
> 
> What? You just said few lines above:
> "it will still continue to work if:"
>

I hope I am clear now, 'it' referred to the in-tree ICE driver and not to this particular
DT schema commit. :)
 
> So either this will continue to work or not. I don't understand this
> thread and honestly do not have patience for it. I gave you already
> reasoning what is wrong and why it is. Now it is just wasting my time.
> 

Apologies again for the confusion. I totally agree, as replied previously too, that the
updated DT binding breaks backward compatibility. Like I said, I will post another patch
to preserve the correctness of existing in-tree and out-of-tree DTS.

The only point I am trying to highlight for everyone's awareness is that as per this bug
report https://lore.kernel.org/all/ZZYTYsaNUuWQg3tR@x1/ the kernel fails to boot with the
existing DTS when the above two conditions aren't satisfied.

Thank you,
Harshal

> Best regards,
> Krzysztof


