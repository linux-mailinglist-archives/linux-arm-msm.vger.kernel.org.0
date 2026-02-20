Return-Path: <linux-arm-msm+bounces-93493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFOMHyFBmGneDwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 12:10:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2292816729A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 12:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57FEF301DBA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 11:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A23F34166B;
	Fri, 20 Feb 2026 11:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H5SNVp2N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ig3l85AE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910D234107F
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 11:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771585817; cv=none; b=O7s/i3TerEYy80tY10Es1yBalzeJ5ZWh6Ww5kIRwFZJFd7X5Ltdvw4e6HcgGlXjirpJnpbyOwRJyFFnkHonCgtuWv+dOfqPA+NCPTJeoRUWPYHg3Et2CUFNLj2C8FXmUDA5khViUKsL7FnLPRahXAnpvc94hIQZAmvubdQmYtUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771585817; c=relaxed/simple;
	bh=YFTx5JzO6hdif+NXdu+tL2OXihfY9pkT1jOqIFlYlrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uFDPYzYxprETETnXnJsV0Zlne3KYDF48cGCrUeO9USpLA/rGMaewAIblM1en3glfQj5wbQNRa9WDBNyqnS4NtFB19XwJtgeYQEUIWFTGkDUvt2Dcc+MRlVcI7ATBszZ9TnfTcNlkvM5ifHc2TJHsLEnDs+DD7LdmRMxjJvCWtOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H5SNVp2N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ig3l85AE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5Ro5a2506249
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 11:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	61/rCzwORZndLIGbcVlI50UTlMsefy7X7t83r0iNUjg=; b=H5SNVp2N6TMauYtM
	Y0xl0mpNNWsPLCYvcbHKsCS4fcQ1pOVbrsPu5Kra7+z723yDfmTMZSzeJuf5Az01
	DoibhWoRj65fNZYPZNt94Ji2Ni/WibUjowsqaSrnm4EfFo2B8/ZVxk3nqyMQyZ+o
	IpdDvkFgpRpsEuZgyGcUIymP0icrfQ84DtzjWX4YdSukSIMPwfHJ7BnAT3PYDmwG
	WvPTIwpr67NgxNLVuk/307I5IKNDz5N61iZiKwAc98dKfhFipM8VaQMV15VkpDLK
	QwwUfAs7dWYZfaU9Zlv9y5Fgox02tZcG2SLBqyCyW+aQROhpSBYZan2d7Sp2mIDM
	yZr7TA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cee2s9a45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 11:10:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354bc535546so2256051a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 03:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771585814; x=1772190614; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=61/rCzwORZndLIGbcVlI50UTlMsefy7X7t83r0iNUjg=;
        b=ig3l85AEGzykl1lsPEbW0OmlFQZuGDY2JKU0vLOJJ4x/ASkhcsa71hGM2L1cZPYoRL
         ieMdrEPGVKqi+BUdwV0SpIpGFJ44ZWyIMxLeHKVogA6dBgg+fkoT1aGwJhxd2/KMfNHG
         xS1O39S811FNBMZlgPPNuTSbZm4QbLhIv6zosf2V6cUXLh2BM6Zd8/pzUDbEiv2oJABC
         IocyLumMi8QQeh2n7iWZkvZDeYCVjfIlxL0u+iKfp51mkWfx0ziDs/fk6ft2Dm2b+JaV
         tJPSAb/h8bAf5Xz3v3LUXPLSWZO/cqzI0XAU2BQJ293cDWVnmsl0oWv7UjEk0hONJU8x
         iuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771585814; x=1772190614;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61/rCzwORZndLIGbcVlI50UTlMsefy7X7t83r0iNUjg=;
        b=KAS2MO9kPU9idEg5RDEOFzVC+rKD8IgiNlxRNds68oQSwkHnyndGtGPeq2+f+tfTZi
         mOFIF59ycTQle1V+XhCrypOO0Gz+3bU3Jv/gctfA37Bom9ndZ6qIXtXgi7CvZXn5A1+m
         k4DW0TLhkXpYrDDx4gYY45ZG0XJjqhPJ9nPUOFd6nCAS68z9QAFC0StPS31rA5Opf33L
         JxyarU82iJNbEeZftMyPJtrCfNxpwjN4VEzUDChvfCFGzjeROsz3optZD01GJMmVz70G
         XKVWx/aXvHk15LKfZO3MeCvoNs6EtlZQv/aVoCABOsDkVu/jMWmb5rDeDm/cSSqg1iqP
         uSwA==
X-Gm-Message-State: AOJu0Ywb13dqOq1VpuPC3QtReGW9PSwEV1284ks8G7W0AhoIa1tXh0jF
	VNAWJP32Bx2yqbsGq9PPbFg8uJFl1ObtwLQLedjAX784O+VYV5Fo5hCBbhug1aoDHpIZkIC8WBZ
	/DMyaNJu/q73QdgAMsaLgQMojuRHwZZWUTIk72mOB0y3v6OE/eOoaFNByDppXiM27vN4Z
X-Gm-Gg: AZuq6aJNXCD6A2qGFMLVwr2tFwHaOcuaU453RsdDw2L1bNTej6PUEs0w//uzfmq+4Gd
	u3AWIz7GIdTI3IroPa2RcltKSUeQ9XBgoRwFzbvXmArl2SB1aiLPmKaHUV2rsCL/9oTdvpuRAbT
	vZIr3ntAIRpt1Y7ynnzh9wDPRgJH/emFuLym2UmvmypDvCyTqcKQBszLBUvA0vXDHY9AVg4ALow
	cbeFTSwh8pqOoy7s+ZHO2mxgBy4O3d3qA3LvgJEgqytlv5CzkH7ZLRUCBf/SGZN0SX/5ex/2Eqg
	ipyw3813R8kvGGTuGNvLez/WMloXdUU7WNuq5r5W/zqTXolAlBXMjSeduRKjp0HWLZTi7VNSIOX
	OnNvQsvAIbUW1WLK9Ez4iwRK+BwlPJ6WrpjldlzHhfYtcLs9GMmI=
X-Received: by 2002:a17:90b:50c6:b0:354:9bc2:8821 with SMTP id 98e67ed59e1d1-35844fc80e0mr16533652a91.30.1771585814221;
        Fri, 20 Feb 2026 03:10:14 -0800 (PST)
X-Received: by 2002:a17:90b:50c6:b0:354:9bc2:8821 with SMTP id 98e67ed59e1d1-35844fc80e0mr16533620a91.30.1771585813739;
        Fri, 20 Feb 2026 03:10:13 -0800 (PST)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3589d81cdbfsm4059185a91.7.2026.02.20.03.10.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 03:10:13 -0800 (PST)
Message-ID: <0f566afc-27ca-4326-a83b-aac92ba50037@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 16:40:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa/x1: fix idle exit latency
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260220070204.101672-1-daniel@quora.org>
 <8e670f28-9a2e-4495-9b84-8b1d9c0542ba@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <8e670f28-9a2e-4495-9b84-8b1d9c0542ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8arr5auhGWgL3q5_Z1CSeMK-OfVDbo7Z
X-Proofpoint-GUID: 8arr5auhGWgL3q5_Z1CSeMK-OfVDbo7Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA5NyBTYWx0ZWRfXx9g3pHFfr1eu
 T/MUBEkYu9vZRLZo0Zvzl7AZqqWI9pUbcBkY+3hfEoLSTv389qs7zy1sR11fUq573sClQQ/AjQk
 +y+YnFnbfW8IyMLeFmYP0U40BlRGa+Ow0oa5uwPVfdcZ/STaXeWvh3lTqLSo+XEBmd/HRlANn4n
 NkYTMrcLN+4k+AkAfAJYX5eM+bskxnW6uLBvSiqQ40Q2RptIfe6G/Ta8/ByXqqpJQHZX+7uOmc8
 SbowtwsOCQhMa2Y6Fo0bPhcF5x5a2XUyq3QWiiOSIi38Qv+OLuHu3i+mzwu86rWoynY8h/2BJrL
 93uN2D05Co95e1ZSPlzzimK0gyTx/8F1GbFNbPZh30zBvfFFj4p6IL+Sw1NaIgdof00ohH9C3Qz
 9oCMSB8UhTvbM1qoxsPQoxUzBPHzNrGiXVuPV3aRSqxIMh0PfaupHKjhEq8zhf1lq5ie6i1O47U
 Ll7+NpINn2jgH/4nX1w==
X-Authority-Analysis: v=2.4 cv=NajrFmD4 c=1 sm=1 tr=0 ts=69984116 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=t9ty7G3lAAAA:8 a=WuxQf6WQNWpv0iiEd1cA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200097
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
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93493-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2292816729A
X-Rspamd-Action: no action



On 2/20/2026 3:11 PM, Konrad Dybcio wrote:
> On 2/20/26 8:02 AM, Daniel J Blueman wrote:
>> Designs based on the Qualcomm X1 Hamoa reference platform report:
>> driver: Idle state 1 target residency too low
>>
>> This is because the declared X1 idle entry plus exit latency of 680us
>> exceeds the declared minimum 600us residency time:
>>   entry-latency-us = <180>;
>>   exit-latency-us = <500>;
>>   min-residency-us = <600>;
>>
>> As 500us idle exit latency is overly conservative, fix this to be a more
>> realistic 200us, in range of similar silicon. Tested on a Lenovo Yoga Slim
>> 7x with Qualcomm X1E-80-100.
>>
>> Signed-off-by: Daniel J Blueman <daniel@quora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> index a17900eacb20..b870f4dc9c42 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -269,7 +269,7 @@ cluster_c4: cpu-sleep-0 {
>>  				idle-state-name = "ret";
>>  				arm,psci-suspend-param = <0x00000004>;
>>  				entry-latency-us = <180>;
>> -				exit-latency-us = <500>;
>> +				exit-latency-us = <200>;
>>  				min-residency-us = <600>;
> 
> +Maulik?
> 
> Konrad

Linux dt idle driver sums up entry & exit latency and displays final number as total exit latency at
/sys/devices/system/cpu/cpu*/cpuidle/state1/latency

Can you please keep 320 usec as exit-latency-us to match with downstream 500usec total exit latency number from cluster_c4 state.

Thanks,
Maulik

