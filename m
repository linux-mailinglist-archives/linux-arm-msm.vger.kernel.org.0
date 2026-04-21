Return-Path: <linux-arm-msm+bounces-103895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAYKIFU252mg5QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:33:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB62438372
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83003301CA53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 08:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD2539936B;
	Tue, 21 Apr 2026 08:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MP5kkdzV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="egwjiMzU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B953C31F9BB
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 08:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776760173; cv=none; b=pqk/ccG3zAZLxeP2qtUmL6mpqeDR/v6rR0JeqLXMS302Mr9rO20zmHG649vtaLwG3vty3j5/isFTYK2/WwHatYZGkED74Ydf1acdhipERbIxQTP0E3lwrPorAmDAVZFwnYxNFjxxRmXCbZayHa+4KOVeUFbGjHvztEn9j5Ck00w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776760173; c=relaxed/simple;
	bh=PkWMnzjrKecO2svbBQnVSp7W4EQibMpw7S8p7SZb0xg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=K82HzOdhleoGZ0y78+tJh6T40fnXEoS4ZNfYnoC3v03QWW/jXEdtupxnAPeyGQ1vsmVa1u2DXqlwvIQp3eoqljAxrSZ2rwHUilkDFbwga9yd/72z0kM3F1spFpXoMKeeTlsCOchT8pJxUQCvhOxY2cfOozz59GEaPFC2Xtt5HwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MP5kkdzV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=egwjiMzU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L5dglD1011924
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 08:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BiVtU5gmBM28dpc+mHAbZrBSEi0ycTtyt2r9qTzHOkY=; b=MP5kkdzV9Qkid6hn
	nFU+eO6P6364zuxqGomA0pPfZv1IkGpuzDPXL04EYfmbrq50Fyuxs/XbTKEH8T6s
	XXGpB+ch6ZOYOxs+8x11otyQbGeVj2jCG161fLm6KfX4blquRBHDomDRLo72klcK
	R3RqnyZbKQrdK4TRW3niwPWTIrMMFFNpwOG1/+mFl9cQqPCVsgYKpGNwlto0fDpq
	UwpGZBCgboPyw5BisNR1Q2d5RPlp32qNVvtmZnBuqIsjw1eJ66w7lmJaXAKAD3uQ
	H9DGATDDZ5P077V+rvUe5Wfhpr2P+J+0CAAUmQFy/9Kz9S6CL7miuczwbbUkTvIp
	ra1J3A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt9029rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 08:29:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f756ebd0dso2588247b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 01:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776760170; x=1777364970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BiVtU5gmBM28dpc+mHAbZrBSEi0ycTtyt2r9qTzHOkY=;
        b=egwjiMzUoWjan4dUA0AQ6CCel+lmO8iCvDbSD0lCDPN1urevTJaXnSuQAfySIQ2/MZ
         Drj/2I2D12OpknWOUWraaK/FtKkmcixNMLCVGIdphtW1YScdvNw3AMksa7Ofg3Hr5caN
         z80fN8GbTU26AOTbLXw4dqZzHbddqadOe8S+J3XRXCtGWfh75I2qwdILZ2PmYJqztHca
         LWXtEuvB/aCTZXtvy3FQgY9kOm01B7kPW1zZ9p/Hkt5GdV/gTGDYlWs8dONfc9VcbGfl
         JDiEqb20++y18UMx0wPkdc8CoHMp7uaHFyM8NnVrtX9MswOBBTThcjqDkYqgF00+QKZs
         6+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776760170; x=1777364970;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BiVtU5gmBM28dpc+mHAbZrBSEi0ycTtyt2r9qTzHOkY=;
        b=fX33ux1+1lhWJY52Ytg6D0CsxYBlEaEpaOVymqgrXu8XkWX64XdwcQeboaDUdYsh/T
         ByVtqoFEvmHTYgMXt5AKIn/BBB47PM9ingwx3qPsAEhAVh4o1E/OA6CBKgDjU9MdFgbB
         pT8i88i4vm+TlgpXUrY5XoHcpt0y+eVITdBst2s7WGDg96Lcn7w8syKM/o6jhfUVPVo1
         zAMiRsOLzl8P8WowvDcGOptXVQ43M6fhUkXUk63WVPEuMsWWzcmAaPhbTH9nQehiuSe2
         rAm6xQ2Nv9qaiLLrI6LewsN7h9a6qFteV4miEkAbqqNNzRbR5k9Xnn3yYrszgB3N/aj2
         BzTw==
X-Gm-Message-State: AOJu0YzCa+iMNQUuZo+2XszgaV83g77Jtl9uFdQNgYNQTEHXCxSLbQVG
	V6FmArWwMhUiVkoEEDTziim6xV06XmSDLt50DeC0WaQpFclA2cjCudAwctjpucr++7omPifKuyk
	NFTBaNKvtKrRdp4OAbt9Wt3Xssw+1AkPlP6BJMcJsoPOez/KUPcQKsxsl7vSRPn7U4gdV
X-Gm-Gg: AeBDieviq46k5OsUo5m0J1gooBdkWnwx/MUUmzD3pse3r1LrUfzGbQD8e97Rsz3QRh3
	4KZCi6QavQDA1S1a1uJ0LHVXFWZJBzSzLOJ9v7zeanUPJpjZ8CWud7orQ7KObVbJBqy480uHInG
	5eeF4kexZNjPboFKRPbuHU/Vzz4FKN8u6x1jRbfyd+y2L/kUCFTZECNyeZWzt8U9Np35sX+vPGu
	+nz9iucl1/jfIRqbH6rzX6FZwJPfDM0uFRSBzjpcoCmpuLa5kHn0kOAcH9Cl0/2cwkWstISScns
	ljRQBIpnKlkMPnwWjmH2y8xirVJK4lpCm5Rbt/gCuzug1nKB3GXPOm5sKA6RQ8I8QZyXRU820I8
	qGyBLv2IW8V8+zhd1vBt/sgNaDdSlpZendne+gVzFPrhu8gAtPUUj6EkO/6E6
X-Received: by 2002:a05:6a00:2ea5:b0:827:3914:f130 with SMTP id d2e1a72fcca58-82f8c99190fmr19190171b3a.36.1776760170025;
        Tue, 21 Apr 2026 01:29:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:2ea5:b0:827:3914:f130 with SMTP id d2e1a72fcca58-82f8c99190fmr19190124b3a.36.1776760169433;
        Tue, 21 Apr 2026 01:29:29 -0700 (PDT)
Received: from [10.204.79.66] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebbcfd7sm16101796b3a.32.2026.04.21.01.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 01:29:28 -0700 (PDT)
Message-ID: <905374e9-1d90-4789-871f-f28e5d7ff8b1@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 13:59:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm630: describe adsp_mem region
 properly
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        quic_chennak@quicinc.com, quic_bkumar@quicinc.com
References: <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-0-03b475b29554@mainlining.org>
 <20260415-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v1-3-03b475b29554@mainlining.org>
 <70d4dbe7-0e5b-4065-858e-b5a57bbf45e3@oss.qualcomm.com>
 <54b1be0d-1ec3-405c-b1ff-bc759b80e7bc@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <54b1be0d-1ec3-405c-b1ff-bc759b80e7bc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e7356a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Gv3PURsRAAAA:20 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=OuZLqq7tAAAA:8 a=GXihVLZcTt7kJqBTt3IA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: M7GWo_bial9ToDcLr3RS2mRUnR3_BZXZ
X-Proofpoint-GUID: M7GWo_bial9ToDcLr3RS2mRUnR3_BZXZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA4MCBTYWx0ZWRfX1EhlOUiSuiHR
 +e7RTWAra4Vi0FcetNcTImJ1r3Cm6fdB+tkdqAFmC2FW8jNaPD/9o4TRix6dAPrvWMQ1yJsrB6H
 qWq0irqufJg28C7pNlm5EiZdvycv6c4ZP82Ey5ywydzywbTK8gR4/DVvB8TH8z/inBh84Y8UIEO
 xlNcAvZ+FlSYi1l+GgqPcrIezwfxXdHfbHJcT4fKd42jdb9whdmudT2+C9BKAIt58uMVy5i14Al
 b5De+sev0ZtLH3DmN+OKDfLZhs0clN3+mGjlGhWNqxv5lIho/hHvjeenSWdNaMfzfS9/NM+5/jr
 08jDcrQvpK3dkDTETWTkS1vHbvOE2ur9EKghjrh0oMtNpGWpainxBXYQB/h5a75KbCaa97m1j3M
 X/31Hxi2Pm2qI+/X2kMmIhdlbSUzaMjhQtB3cruI8kKkvMGu9q6y6rx7d+m5RAjEa0rO7IuR0SJ
 YkWZ52/1wH0+0Xt4LDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210080
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
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103895-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,mainlining.org:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,9f800000:email,f6000000:email,f6800000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CDB62438372
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17-04-2026 20:45, Ekansh Gupta wrote:
> On 15-04-2026 15:22, Konrad Dybcio wrote:
>> On 4/15/26 11:40 AM, Nickolay Goppen wrote:
>>> Downstream [1] this region is marked as shared and reusable so
>>> describe it that way.
>>>
>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L448
>>>
>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>> ---
>>
>> +Ekansh some insight, please?
>>
>> We're giving away that memory via qcom_scm_assign_mem() anyway
>> and I would assume that making it not-"no-map" could introduce issues
>> when the OS tries to access that region
>>
> With the current version and the upcoming planned enhancements, I don't
> see any major benefits of making this as not-"no-map".
> 
> With posted enhancements[1], the plan is to qcom_scm_assign_mem() the
> entire memory-region to lpass VMIDs. and un-assign it only during
> fastrpc_rpmsg_remove(). There have been implementation in downstream
> where this memory is dumped in case of SSR or audio PDR using minidump,
> so marking it `reusable` might make sense there, but that dump logic is
> not added upstream.
> 
> Upon checking the DT, I see a bigger problem here, this memory-region
> looks to me unused, it's not added under fastrpc adsp node(ref. [2]).
> Please correct me if I am wrong about this point.
> 
> [1]
> https://lore.kernel.org/all/20260409062617.1182-1-jianping.li@oss.qualcomm.com/
> [2]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm64/boot/dts/qcom/lemans.dtsi#n7500
Just had a new finding on this. There is one more reason why it is not
added as no-map in downstream. This audio PD carve-out region is not
defined for most of the platform's memory-map.

With a change to qcom_scm the memory during boot-up, issue was observed
on RB3Gen2[1], where EFI firmware was loaded in the memory region which
was causing boot-up issues.

So defining it as no-map might not be correct and it might need be
changed for all DT files.

I don't have a history of why it was added as a "no-map" region on
upstream but looks like same has been followed for almost all the
platforms. This needs to be modified based on the memory-maps and the
region needs to allocate memory in a dynamic manner.

[1] https://github.com/qualcomm-linux/kernel/pull/487

//Ekansh
> 
> //Ekansh
>> Konrad
>>
>>
>>>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> index 4b47efdb57b2..13094b5e9339 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>> @@ -495,8 +495,9 @@ venus_region: venus@9f800000 {
>>>  		};
>>>  
>>>  		adsp_mem: adsp-region@f6000000 {
>>> +			compatible = "shared-dma-pool";
>>>  			reg = <0x0 0xf6000000 0x0 0x800000>;
>>> -			no-map;
>>> +			reusable;
>>>  		};
>>>  
>>>  		qseecom_mem: qseecom-region@f6800000 {
>>>
> 


