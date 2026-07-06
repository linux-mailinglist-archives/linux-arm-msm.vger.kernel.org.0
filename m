Return-Path: <linux-arm-msm+bounces-116712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2ay5AceQS2p7VgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:25:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B7F70FD11
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:25:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="OBJYeT/U";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=J83KRUBr;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116712-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116712-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F8F63484DF2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EAD3CF02D;
	Mon,  6 Jul 2026 09:06:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03243424673
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:06:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328818; cv=none; b=uTe1nIPMJXs9OacVu24FmYvbe5Y/3raxU3jbXib236dgLRWTl4MdFeK9Wt09jMl7sp3TUNJzhSjeK/FCUBfB9NtojbfPdisHr7zCeMKEJI+XjP+3PgSbklMvt2mx41bItrl/X58o1syliakJOklUZXvbUOVSzRSGP/NJtiMSW5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328818; c=relaxed/simple;
	bh=ZwTTelmznCo6ePzhwhGkrzjsXOlhzD8HcbphQBRt7Is=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cPPkoEAN3fsoKNBA5eqZ1qg57CLsBcR/ngtpsdfRyXVG0qH14EHqtREF5hKTiHfMQoUgIicwFYmTIWe33v0ZIzCH7c16Z9+qyK/IJ5VqrC3yjiSf/vkhMEExMpHn45u2N7dsJEHnaA09Ry15MUJyy66M1dW4YhwPFGYeVf35IkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OBJYeT/U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J83KRUBr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693sXM4108047
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RUN3RCsTUv18V7czcf4SZLShjkkb8twB9ACp3z+QL8E=; b=OBJYeT/U4p3JFZJd
	ICiH/MiZG0OcTsJgxnyvwqfnF+35jDPxoSBmaTH5G6QfZNbb5RrU66gaxG2gh3Dk
	0H/s9MmU3dp3OPPlNXNnM6QL2B0aMZ+H0PNZ+hi8C4MwQDEHlqtsnpjt5uBYhT/m
	y2uspnpeJaHuvcxhFIXMR1uyVR+WWsrKXhVUIWkAD0BAGVLcz80YsyL3Csf7LOAA
	e53NV+AN76kRGSDincS/rWiEUjK+sKEnpdDlqYCKJj7pq00dIIKvwy5ivAVwEH7E
	f/w4VGJPc9p4sSwtFPCYTjhd2BoaULnFRC3xi2Y8b3bXRXoHWmpuQC1JVSs42igI
	J6LzZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxrerj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:06:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92aea0d801dso254758385a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328809; x=1783933609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RUN3RCsTUv18V7czcf4SZLShjkkb8twB9ACp3z+QL8E=;
        b=J83KRUBrM3xbjQ7aS2rF3kjls0KJjLFPaILLcKF+pi+/roDWgJb2PdiKiJ76Dw3cUw
         kMbVkvRdzbsx5zoUkCG1s9zYmca9cK2+mQD3951alGiS5pLwag9upQro8b6ReQYDIvSg
         6JJiYKGb1Ub2c8aMfrcwNilxTLwGXuwFeP4a22GYdTRvKQsLFWQI7OhIBiSds0NU0G32
         CFEsCROjH64LbrccK8Ubu9+FWM1OOXA51KKJWALDOk1zpM4ypbN46l7+DRHx5GsbhfWC
         qUWqMwcXh1OH1JZBtkHJrX/qMWcQMogsnZ1WalabX6zPsprm7ozirb9v2kcGjmgKiQ69
         7MSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328809; x=1783933609;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RUN3RCsTUv18V7czcf4SZLShjkkb8twB9ACp3z+QL8E=;
        b=kc5u57Oolxd8zxqaqM/W4UFdy0pEtaWeaz0a73dBP/0N0xwPomkP+md7+2jQzUYJLE
         ouUTn7l/e89Bpknv0AtAfD1kRyJl+9MfYKXguzcAqluIdhNQhCjPQFKzKvl8GGwkqyt5
         14OSKY97Cz/ig0uIP//kripirDlJ3IBQrVfFG26nOAdtahnZdBYapaK91Qe0B0hJ5de6
         yC72cPJkUCrN1rv+zDbDPSz+i/WwR5HjLfpRp3t2bkg4+gRX+4ME29N0/ILcWcnlspkq
         N00TERCW6e+wiambpKQ+nrpAO6rL3e5K3KDbKlzMIyoAymf4RS3lnvk/bHOBKQNDJ6uT
         t4zg==
X-Forwarded-Encrypted: i=1; AHgh+RouJ49U8Mvkz9yKTJy4V7QhsJ/4O2ifgAjrFQIogaLcnfWN+whrtSz3iZxzhnFWL0trmnrQMGpxECGifvWv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0g23yGWqA3WMiRt9Uwpnt6fCNZrEcr3k1L3PI3J6THAEGCuuz
	w2jI0y2HfP53f2NbmOgqPOnACqx5j4/mGWVH2NE7IAphmRG3RaHm9U9Iwo1d+fDh/5SYodzM/av
	ErjKePz3ZjIJTsQyVmOyt7xhczB57wB9sWBiP5JCldkFNKtxUmOaux9lcP2YoU9Qp0s6ZrIcTMz
	22
X-Gm-Gg: AfdE7ckuH846yIsgmI8a0la9tK4UarthXyml8pvEenVtAIUduHTHFTCNtBndEO/D458
	V4LxhVQzkziQ9q6TeKr5IOBBaYbX8x9VuaA4aYfczVF0Zswr47AUXhtem3o79gHYAceymf/WsOr
	f3ykb3zjXWxBYOgNh96ZMLSztvgpvjLddzIUMK+2VWe/Eo7yLxmYwmiwJRt0Db+WenpPqfZbCuW
	H4oMYcdxiCQTGTb55UJS9w9b8MezFhcPWl5IfdJi/ko5JhPXDQ1bz7NrhznioQGwU/hk6kNHQMW
	jBAhiyIyIBIHeSJtZO+l/IbmmDbQUpHVyRkwbKYZ/hQxCNf/khhDyZUbcAlORKROMTPGynhMJs4
	DEc37ZLWzyF+f29QPWeykSBwXpy/Hnw==
X-Received: by 2002:a05:620a:450c:b0:92b:6805:9197 with SMTP id af79cd13be357-92e9a4ff4bamr1206105785a.63.1783328807303;
        Mon, 06 Jul 2026 02:06:47 -0700 (PDT)
X-Received: by 2002:a05:620a:450c:b0:92b:6805:9197 with SMTP id af79cd13be357-92e9a4ff4bamr1206102785a.63.1783328806765;
        Mon, 06 Jul 2026 02:06:46 -0700 (PDT)
Received: from [10.40.99.10] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b629a1c7sm699473966b.30.2026.07.06.02.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:06:45 -0700 (PDT)
Message-ID: <954ecd7d-9aa0-4caa-90b7-0da990ff7c6a@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:06:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa: Fix xbl_tmp_buffer_mem size
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
 <20260525114749.5939-2-johannes.goede@oss.qualcomm.com>
 <7d2aedb2-4bcd-4453-80be-5c7ca6bdff95@oss.qualcomm.com>
 <7ebbddb0-175b-4023-91ee-93d23e5162ba@oss.qualcomm.com>
 <21a97c4b-293f-435c-91fe-ca7394b5a2b0@oss.qualcomm.com>
 <829fa641-dbd4-4319-90a2-99a24934e0df@oss.qualcomm.com>
 <037099d6-b8d3-4578-a08e-9ea594025ff4@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <037099d6-b8d3-4578-a08e-9ea594025ff4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5SCPEZ-nhN6YtiOvILl2YgZOITK5hpth
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b7029 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7K3b00r082jI9b_r_CMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MSBTYWx0ZWRfX2WXOzxvD1XwH
 y92WWe75G7pLIp+1aq15QFX0/6eDUEV5bOQRkxcNGShd4CCr0s6WTW7fdNTeGHNAPatxgrjITQq
 cP0CV/c5EGMi7XtzlGoYiwgm1LN13E0=
X-Proofpoint-GUID: 5SCPEZ-nhN6YtiOvILl2YgZOITK5hpth
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MSBTYWx0ZWRfXyuBQqd9eKkWY
 F1Oj6HRISCtmUacPo1EVWWyF9+4JsOjTInoWazIhr134Ej0qj9pFZ/+68QqpWXvUj+dDHI1bTTy
 tjQ/5lLOgKacfY20UpL+5rsEhLEmPP6U91uSDP5ESAb8tPJFIf++6Y6e7H+QMYR2Yvhhp5uPqa0
 D0oC/HWYMuArNyr8lTrVgxUkCQVvl4vFp537ViMI1tIRz7Vh+Mx6aIz29eIv2+IJcFMvEdvud/g
 r9ldoNEAkYbJdrZ3PQXBtEYG5Gd9TOQe3ogueeWTNjRY6jrJqXhzqntOq5Ek28xxJeQHujUoOxC
 8lx6hpRRN5TMBj8bD1cvGS3GB7YG0u70kdPC06K6l0MD4F63hO7JKkMn/vUep5Q4KEMMy9p8xnR
 2WGA/dAqutScpd5+DVySUbt5B5dRZZWF1bfWVq8Eo4eIp6T4sgsKPXqPMv2BTI0j4M2hdwvSaa7
 mDJv6N2cOdHHaZq4gLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116712-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60B7F70FD11

Hi,

On 19-Jun-26 5:06 PM, Konrad Dybcio wrote:
> On 6/16/26 10:40 PM, Hans de Goede wrote:
>> Hi konrad,
>>
>> On 16-Jun-26 1:04 PM, Konrad Dybcio wrote:
>>> On 5/25/26 2:46 PM, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 25-May-26 14:29, Konrad Dybcio wrote:
>>>>> On 5/25/26 1:47 PM, Hans de Goede wrote:
>>>>>> The EFI memtable (shown when booting with efi=debug) shows that the
>>>>>> xbl_tmp_buffer_mem region size is 0x1c0000 bytes large not 0xc00000 bytes:
>>>>>>
>>>>>> efi:   0x000082800000-0x0000829bffff [Reserved    |
>>>>>> efi:   0x0000829c0000-0x000083efffff [Conventional|
>>>>>>
>>>>>> This fix aligns the size with the EFI reported size and makes /proc/iomem
>>>>>> correctly show mem blocks matching the EFI memmap:
>>>>>>
>>>>>> 82800000-829bffff : reserved
>>>>>> 829c0000-83efffff : System RAM
>>>>>>
>>>>>> Instead of:
>>>>>>
>>>>>> 82800000-833fffff : reserved
>>>>>> 83400000-83efffff : System RAM
>>>>>>
>>>>>> before this change
>>>>>>
>>>>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>>> index de0f2346cb38..5a2e84365901 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>>>>> @@ -582,7 +582,7 @@ tz_stat_mem: tz-stat@82700000 {
>>>>>>  		};
>>>>>>  
>>>>>>  		xbl_tmp_buffer_mem: xbl-tmp-buffer@82800000 {
>>>>>> -			reg = <0x0 0x82800000 0x0 0xc00000>;
>>>>>> +			reg = <0x0 0x82800000 0x0 0x1c0000>;
>>>>>
>>>>> FWIW the reference memory map shows a contiguous block of:
>>>>>
>>>>> 0x8280_0000 -> "no reclaim XBL scratch_buffer2"
>>>>> 0x829c_0000 -> "reclaimable XBL scratch_buffer"
>>>>> 0x83f0_0000-0x8400_0000 -> "no reclaim xbl scratch_buffer1"
>>>>
>>>> Thanks, so the first part here 0x8280_0000 - 0x829c_0000
>>>> aligns with the EFI reservation and with the dts reservation
>>>> after my patch.
>>>>
>>>> 0x829c_0000 - 0x83f0_0000 being reclaimable matches with
>>>> both EFI + the dts (old and new with a different start)
>>>> having this as usable RAM.
>>>>
>>>> The 0x83f0_0000-0x8400_0000 area seems to be marked as
>>>> reserved by neither EFI nor the current dts...
>>>>
>>>> With the first part of the reference memory map aligning
>>>> with what EFI shows, I think this patch is correct.
>>>>
>>>> I wonder if we should do anything about the 0x83f0_0000-0x8400_0000
>>>> range though ?
> 
> [...]
> 
>> [    0.000000] efi:   0x000080800000-0x000080dfffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> =>
> gunyah_hyp_mem: [0x80000000 - 0x80800000)
> hyp_elf_package_mem:    [0x80800000 - 0x80a00000)
> ncc_mem:        [0x80a00000 - 0x80e00000)
> 
> then we have these ranges that are absent(?) from the efi map:
> 
> cpucp_log_mem:  [0x80e00000 - 0x80e40000)
> cpucp_mem:      [0x80e40000 - 0x81380000)
> reservedregion: [0x81380000 - 0x81400000)
> tags_mem:       [0x81400000 - 0x815a0000)

Ack, which is why I keep these reservations in the DT in patch 2/2
note the EFI memmap does not mark these as RAM it just skips this range.


> 
>> [    0.000000] efi:   0x0000815a0000-0x0000819fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x000081a00000-0x000081a3ffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> xbl_dtlog_mem:  [0x81a00000 - 0x81a40000)
> 
>> [    0.000000] efi:   0x000081d00000-0x000081dfffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> RAM
> 
>> [    0.000000] efi:   0x000081f20000-0x000081f2ffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> =>
> usb_ucsi_shared_mem:    [0x81f20000 - 0x81f30000)
> 
>> [    0.000000] efi:   0x000081f38000-0x0000826fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> just normal ram
> 
> 
>> [    0.000000] efi:   0x0000829c0000-0x000083efffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> this conflicts with:
> xbl_tmp_buffer_mem:     [0x82800000 - 0x83400000)

Right, that is what this patch fixes, the size of the xbl_tmp_buffer_mem
reservation in the DT is too big.
 
 
>> [    0.000000] efi:   0x000084000000-0x000084afffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> normal RAM
> 
>> [    0.000000] efi:   0x000085380000-0x0000866bffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> =>
> spu_secure_shared_memory_mem:   [0x85300000 - 0x85380000)
> (hole)
> 
>> [    0.000000] efi:   0x000091480000-0x0000a67fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> RAM
> 
>> [    0.000000] efi:   0x0000a6800000-0x0000a7f00fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000a7f01000-0x0000a7f01fff [Runtime Data|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000a7f02000-0x0000a7f04fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000a7f05000-0x0000a7f0cfff [Runtime Data|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000a7f0d000-0x0000a7f18fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000a7f19000-0x0000a7ffffff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000a8000000-0x0000bbc0ffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000bbc10000-0x0000c177ffff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c1780000-0x0000c178afff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c178b000-0x0000c3933fff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c3934000-0x0000c4c76fff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c4c77000-0x0000c50aafff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c50ab000-0x0000c54fcfff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c54fd000-0x0000c5b12fff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c5b13000-0x0000c5b21fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c5b22000-0x0000c5b23fff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c5b24000-0x0000c5b34fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c5b35000-0x0000c62e3fff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c62e4000-0x0000c62e4fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c62e5000-0x0000c62edfff [Loader Data |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c62ee000-0x0000c65f6fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c65f7000-0x0000c66d5fff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000c66d6000-0x0000cf6ecfff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000cf6ed000-0x0000cfbb9fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000cfbba000-0x0000d0020fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d0021000-0x0000d5135fff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d5136000-0x0000d5136fff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d5137000-0x0000d5cedfff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d5cee000-0x0000d5e7dfff [Runtime Code|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d5e7e000-0x0000d6c8dfff [Runtime Data|RUN|  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d6c8e000-0x0000d6c9dfff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d6c9e000-0x0000d6d02fff [ACPI Mem NVS|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d6d03000-0x0000d6ddefff [ACPI Reclaim|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d6ddf000-0x0000d6ddffff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d6de0000-0x0000d6e0ffff [Boot Code   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000d6e10000-0x0000d7ffffff [Boot Data   |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> as described, RAM interleaved with UEFI regions
> 
>> [    0.000000] efi:   0x0000de5b0000-0x0000e46fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> This doesn't reserve:
> 
> xbl_sc_mem:     [0xd8000000 - 0xd8040000)
> reservedregion: [0xd8040000 - 0xd80e0000)
> qtee_mem:       [0xd80e0000 - 0xd8600000)
> ta_mem: [0xd8600000 - 0xe1000000)
> 
> absent:
> tags_mem1:      [0xe1000000 - 0xe36a0000)
> 
> 
>> [    0.000000] efi:   0x0000e69c0000-0x0000f84fffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> and absent:
> 
> smem_mem:       [0xffe00000 - 0x100000000)

Ack, which is why I keep these reservations in the DT in patch 2/2
note the EFI memmap does not mark these as RAM it just skips this range.


>> [    0.000000] efi:   0x000880000000-0x000cc236ffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x000cc2370000-0x000cc6bdffff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x000cc6be0000-0x000ffdffffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x000ffe000000-0x000fffffffff [Loader Code |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x00000c264000-0x00000c264fff [MMIO        |RUN|  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
>> [    0.000000] efi:   0x000081a40000-0x000081cfffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
> 
> =>
> xbl_ramdump_mem:        [0x81a40000 - 0x81c00000)
> aop_image_mem:  [0x81c00000 - 0x81c60000)
> aop_cmd_db_mem: [0x81c60000 - 0x81c80000)
> aop_config_mem: [0x81c80000 - 0x81ca0000)
> tme_crash_dump_mem:     [0x81ca0000 - 0x81ce0000)
> tme_log_mem:    [0x81ce0000 - 0x81ce4000)
> uefi_log_mem:   [0x81ce4000 - 0x81cf4000)
> secdata_apss_mem:       [0x81cff000 - 0x81d00000)
> 
>> [    0.000000] efi:   0x000081e00000-0x000081efffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
>> [    0.000000] efi:   0x000081f00000-0x000081f1ffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |WC|  ]
> 
> =>
> pdp_ns_shared_mem:      [0x81e00000 - 0x81f00000)
> gpu_prr_mem:    [0x81f00000 - 0x81f10000)
> tpm_control_mem:        [0x81f10000 - 0x81f20000)
> 
>> [    0.000000] efi:   0x000081f30000-0x000081f37fff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |WC|  ]
> 
> =>
> pld_pep_mem:    [0x81f30000 - 0x81f36000)
> pld_gmu_mem:    [0x81f36000 - 0x81f37000)
> pld_pdp_mem:    [0x81f37000 - 0x81f38000)
> 
>> [    0.000000] efi:   0x000082700000-0x0000827fffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
> 
> =>
> tz_stat_mem:    [0x82700000 - 0x82800000)
> 
>> [    0.000000] efi:   0x000082800000-0x0000829bffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
> 
> =>
> 
> smaller than
> xbl_tmp_buffer_mem:     [0x82800000 - 0x83400000)

Yes and this DT reservation conflicts with:

[    0.000000] efi:   0x0000829c0000-0x000083efffff [Conventional|   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]

Again, this is what this patch fixes.

>> [    0.000000] efi:   0x000083f00000-0x000083ffffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x000084b00000-0x00008537ffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
> 
> =>
> adsp_rpc_remote_heap_mem:       [0x84b00000 - 0x85300000)
> 
>> [    0.000000] efi:   0x0000866c0000-0x00009137ffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
> 
> =>
> adsp_boot_dtb_mem:      [0x866c0000 - 0x86700000)
> spss_region_mem:        [0x86700000 - 0x86b00000)
> adsp_boot_mem:  [0x86b00000 - 0x87700000)
> video_mem:      [0x87700000 - 0x87e00000)
> adspslpi_mem:   [0x87e00000 - 0x8b800000)
> q6_adsp_dtb_mem:        [0x8b800000 - 0x8b880000)
> (hole)
> cdsp_mem:       [0x8b900000 - 0x8d900000)
> q6_cdsp_dtb_mem:        [0x8d900000 - 0x8d980000)
> (hole)
> gpu_microcode_mem:      [0x8d9fe000 - 0x8da00000)
> cvp_mem:        [0x8da00000 - 0x8e100000)
> camera_mem:     [0x8e100000 - 0x8e900000)
> av1_encoder_mem:        [0x8e900000 - 0x8f000000)
> reservedregion: [0x8f000000 - 0x8fa00000)
> wpss_mem:       [0x8fa00000 - 0x91300000)
> q6_wpss_dtb_mem:        [0x91300000 - 0x91380000)
> 
>> [    0.000000] efi:   0x0000e4700000-0x0000e47fffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |WC|  ]
>> [    0.000000] efi:   0x0000e4800000-0x0000e69bffff [Reserved    |   |  |  |  |  |  |  |  |WP|  |   |WB|WT|WC|UC]
>> [    0.000000] efi:   0x0000ff800000-0x0000ffffffff [Reserved    |   |  |  |  |  |  |  |  |  |  |   |  |  |  |UC]
> 
> llcc_lpi_mem:   [0xff800000 - 0xffe00000) (UEFI reserves more)

Regards,

Hans



