Return-Path: <linux-arm-msm+bounces-104422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHQsI7BA62nZKAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:06:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D40D145CBCE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 12:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 271D03007C97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935AC362149;
	Fri, 24 Apr 2026 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="glZWhGsW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LSMBiFW4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3267435F196
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024927; cv=none; b=JleAsvyF5nH+auQt7qdPT1Ec+UIhqzNkF6vDzmzJDOrLRib6QVkGTnwWW5jyezBDxgMkSB2sVWws8xxyK7GB2CsrRu0BaQCmn9laC/vv4dmZsgQDUOfnbNikhxcE6CCc47tQYyT8VKZ4TfmxxjrG+Dvi/wDiYh29/OPqn2OBKq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024927; c=relaxed/simple;
	bh=k7o/UioGECwM5LJZQFS71Sh7ZW7KHZ4/bSQ3a82xFC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LJfVXu+OsBcqloYaPNsF6J4Bqx5MnRB2rZzEuD4xBdaCZNyjGJCclddu8/j86MUsoVltz1QD8kivWnm0GPpPFplTuxAtBHPm+MaHX9C3WxLBQ3ZOlcPEGL32DTKzDpq7jKgN0O8iY5k9tgoomp6/XX/9LCMjWm18laG7krT6eOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=glZWhGsW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSMBiFW4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8ueDJ2710093
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wbirre9qTSAm+YSJOM1lqnCtSWn/eJ4q4YzLVrR0LIg=; b=glZWhGsWiALR9ps7
	vAsKQlz9Ae3CRq3IiOgw/qFaP5k5knD5CkkjQo+d+FfbNwW2LlKlV/LSN7b7Ag8C
	oO6q41/NUP3IYfDDH9WHVQvDxyHu9QFSwXqTRewsaKZs9nHNhS5qkiPTAPqzvZBX
	j+KKTvfF5XdwpvoGqq9tfWtSYMzNLJZauj9oCkmfHoTLYMukAPbHuilSXpRZQPpK
	dGh2agQagDTtIBVszj+jV9lktNu10gu+R97cIYWsQqPzKv1MoyBgSjPf2CExhnWr
	durCPotRamxgsgePdxKCnzpkyRhkmVW/YIH2H0hfO0ZltupyKgW4jRcC5Br3gCSx
	TkhqOw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqqu9uhfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 10:02:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8eb530174f0so149087585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 03:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777024924; x=1777629724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wbirre9qTSAm+YSJOM1lqnCtSWn/eJ4q4YzLVrR0LIg=;
        b=LSMBiFW4XWmQEAOT6IKU94JjoLvjIFhMS9EdmBXzpPdVYAAiir6o7UtJkUH/51RJWV
         ctt0WfQNXtiyLxYYEX1vQcNtefaZQYmkus1Fa7LwLJhyPHnUAATpsegbXe6ntjZ9OkqK
         V54XL3+PRarhfdCcuZ4lj4Z4P4gTZU1uN/RQpcF3h8TeFLF+QToS/uYZG19rojh41LXU
         3BF3sfdJ1rOc7uG7Cxzjd6NZXghnlCYKnlHAmTuSx6tzaOLDJSYFVrsBFXunUvaPcnj/
         O1srEA+0K/qYOkrUk3BwImhR86xGnM0UX5g9U3t7IBBmmzaB96ITo0WtJVtx1Pl0F16u
         bwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024924; x=1777629724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbirre9qTSAm+YSJOM1lqnCtSWn/eJ4q4YzLVrR0LIg=;
        b=JpdNwjKLXatX4kRbGXivQqlAiJ1n7NMQYvTHJTtnmAxiTCi4OD8+YCzk72ZeR9UHvg
         lBtZHdZse65CTQZ58ZAWHmXPP9IKz7CB2GxTZCGpZfZ1GRuLId8t5hKGPqwu16s2kFrE
         6FCXr8Z6bNGoz5z2DU/9OgRTtTPeKiPInDDRJrE1/upslf+Mt2S3VM3BJBn9tz6tbKvE
         iUhgFdT9PtAI5bupjLgulNeHjJjqrPqITRcUDD7IsiJWakD6N77/nPHvz27kL+J2Gd9i
         LqM9Mwdd294bn/6WBUBIqg4oEEJHWmpsRnZdnDhJef/TFYD7rQD7hPlF06tMwY8xM1Ry
         sLvg==
X-Gm-Message-State: AOJu0YxvqnYGKT7Oh6VeLekxboKACXrcc+kuLNKUAUMXORO+I6xHS2qd
	aajiUGrrHosl/BWV+9s/OO/tYYdYrSzeLD9G2wKY2cYEn/5YK0gJrw2dF4aAFq2Tubt2RLRIgGo
	SKM8tpneNzBEcEwdJkNLWihlEL1m4mBiCx3UFEoAyN5usmRiZ0qXEVoXK9h10IkAi8V/d
X-Gm-Gg: AeBDiesKz9LmH00Prwii5XUqJomxS6nktdFGG2YPB7NJefCutZBwhOSUOCcrsKIMUfy
	S9ndZbdeG0GUOKfzmEXo6wcpDlNxJD3n7n154ijTwKm8xNHOeaxLERwWysCULkB8qApQYtk2YGt
	mAEvB51rbYQJolMb5Iryp+uUK5wdDRBKdk4Gpr0MsAEyq6XdBUOew9NMO9AtPDl5vugGyPz4bds
	Sl42KN4FKcIycjWcdSPBwnvCNzsf65JK2MT9ANy0drX456H126lAxdTnkKpVJrseTE2XFdiXeqz
	GFsftwJQPsaC0JNT8KYEi88bUcSHllc9Fd6Likf0L/lFDtfbp1Oo43LXJ7Qf+21BU0dQ5s6ktjP
	rLMIa4m+6H32VThI0Q2mAOCB7PkM5BStQLT7fr8I7DCj2Shp86RWbsqU7/icYZbGssrTFzgKkPS
	rju2fJk/Wih4JcSA==
X-Received: by 2002:a05:620a:4114:b0:8f0:7516:da94 with SMTP id af79cd13be357-8f07516e2aamr856452585a.1.1777024924147;
        Fri, 24 Apr 2026 03:02:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4114:b0:8f0:7516:da94 with SMTP id af79cd13be357-8f07516e2aamr856449585a.1.1777024923735;
        Fri, 24 Apr 2026 03:02:03 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67325fcad48sm4622364a12.17.2026.04.24.03.01.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:02:01 -0700 (PDT)
Message-ID: <c4d611b4-eb49-467f-aac3-e944b219f464@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 12:01:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sdm630: assign adsp_mem region
 to ADSP FastRPC node
To: Nickolay Goppen <setotau@mainlining.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-0-274ba3715db0@mainlining.org>
 <20260422-qcom-sdm660-cdsp-adsp-fastrpc-dts-fix-v3-4-274ba3715db0@mainlining.org>
 <0d411167-caad-4f6e-b52b-de7caeaf2333@oss.qualcomm.com>
 <e0c2c127-9f27-4d8e-802f-bdf1acfa960c@mainlining.org>
 <94a977a4-0664-48f2-9aae-821119581d6b@oss.qualcomm.com>
 <af584db7-8d21-4dc1-aae8-0496be27fe17@mainlining.org>
 <22faffca-b4bc-4e43-b33f-2c5a7152a218@oss.qualcomm.com>
 <7ca1a729-b8c5-428f-8785-287c5c7c73b3@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7ca1a729-b8c5-428f-8785-287c5c7c73b3@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0B9NkoEm7VyKRE3G20REQrAENk-FDAfm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5NCBTYWx0ZWRfXzmAw1R8iIZWP
 vXB8RpGDm8SXQIeFO9O8Xfih/UaV2/mBKMZdomay5TQfzh6t++LySP8Gidkogacxp3CtTARJsoR
 J24EDFAYrSl3U24xo1phD4FCKDuyl0pdjwSYuGkdwLgokrtdZCszIpvdyTjxnAKp4gY7A0B7EbO
 m58UuvpPXxGgfi4A4q5V6JsbpoPKGIkVpA5G1Zsbln6LIJZOEGyUiq/k4AbzBaBIl4FXUeWGiqL
 os3CEXl/1nbIb5gusPdU+n4vDfoRx7HcGTbh3th3LeXnlPz8/lEBM7SAVXQoWdM31SnOLmcLaPb
 /KD7LFV45CDau6x7TuqbmmwGRTIaJOOs986UlxBUsZnlDzmLVci2AwgJdmMkgDvrEvGVj+nXiFz
 9DuthBJkoJp/Aq5SYsQvIjF4ZlpzLDsAEB0ye3TiMBq1SWYMejHfvAgH6eT3R+jZIssFA4sh33Z
 WU6AkYRDF3dEh/fe/jw==
X-Proofpoint-ORIG-GUID: 0B9NkoEm7VyKRE3G20REQrAENk-FDAfm
X-Authority-Analysis: v=2.4 cv=QJNYgALL c=1 sm=1 tr=0 ts=69eb3f9d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=Gv3PURsRAAAA:20 a=EUspDBNiAAAA:8 a=OuZLqq7tAAAA:8
 a=kavRCsagfbASwgqc5RYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240094
X-Rspamd-Queue-Id: D40D145CBCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104422-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mainlining.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/23/26 5:00 PM, Nickolay Goppen wrote:
> 
> 23.04.2026 17:39, Ekansh Gupta пишет:
>> On 23-04-2026 19:18, Nickolay Goppen wrote:
>>> 23.04.2026 16:08, Konrad Dybcio пишет:
>>>> On 4/23/26 3:06 PM, Nickolay Goppen wrote:
>>>>> 23.04.2026 14:05, Konrad Dybcio пишет:
>>>>>> On 4/22/26 5:39 PM, Nickolay Goppen wrote:
>>>>>>> Downstream [1] ADSP FastRPC node has the adsp_mem region assigned, so
>>>>>>> assign it to the ADSP FastRPC node.
>>>>>>>
>>>>>>> [1]: https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/
>>>>>>> blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1693
>>>>>>>
>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>>>>> ---
>>>>>>>     arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 +++
>>>>>>>     1 file changed, 3 insertions(+)
>>>>>>>
>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/
>>>>>>> boot/dts/qcom/sdm630.dtsi
>>>>>>> index 36b419dea153..af2bc29ccdad 100644
>>>>>>> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>>>>> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
>>>>>>> @@ -2458,6 +2458,9 @@ fastrpc {
>>>>>>>                         compatible = "qcom,fastrpc";
>>>>>>>                         qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>>>>                         label = "adsp";
>>>>>>> +                    memory-region = <&adsp_mem>;
>>>>>>> +                    qcom,vmids = <QCOM_SCM_VMID_LPASS
>>>>>>> +                              QCOM_SCM_VMID_ADSP_HEAP>;
>>>>>> Please double-check that, the VMID used to be different on
>>>>>> older SoCs
>>>>> Do you know how to check that?
>>>> The least painful way is probably to add debug prints to what downstream
>>>> calls hyp_assign_phys()
>>> I've found in drivers/soc/qcom/qdsp6v2/msm_audio_ion.c the following vmids:
>>>
>>> VMID_HLOS= 0x3
>>> VMID_CP_ADSP_SHARED33
>> This VMID looks correct.
>>
>> Just had a look at the downstream fastrpc driver code in the same tree.
>> The fastrpc node in DT[1] is adding a "qcom,fastrpc-vmid-heap-shared"
>> property. For this property, the VMID is getting set as
>> "VMID_CP_ADSP_SHARED" in the downstream fastrpc driver[2]. The
>> hyp_assign is happening during daemon attach call[3] with srcVM being
>> "VMID_HLOS".
>>
>> Thanks Konrad for highlighting this difference in VMID.
>>
>> [1]
>> https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/arch/arm/boot/dts/qcom/sdm660.dtsi#L1699
>> [2]
>> https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/drivers/char/adsprpc.c#L3602
>> [3]
>> https://github.com/xiaomi-sdm660/android_kernel_xiaomi_sdm660/blob/11-EAS/drivers/char/adsprpc.c#L1999
> Didn't find the "VMID_CP_ADSP_SHARED 0x33" in the upstream bindings. Does it need to be added to the bindings?

Please do

Konrad

