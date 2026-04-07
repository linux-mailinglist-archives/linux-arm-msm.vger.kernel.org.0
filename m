Return-Path: <linux-arm-msm+bounces-102048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /Ld6CsuJ1GkrvAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 06:36:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F443A9B51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 06:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DE0630166F8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 04:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F101A9F88;
	Tue,  7 Apr 2026 04:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lf0FvsxA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ozj6roag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450B62AD3D
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 04:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775536584; cv=none; b=Km4gW4eVGPwWFXa8bqXf9R9pYDXbmqYiY6GyxV+QodMu0U/uyUU9IcWS937xH1mLfwGWkiegQ/ZGNr3DCMk+E/Kf8yXV8CELS4wnWb8fxpxJa9uMnvpHhCTF8rC7RC2NdeDFQuBokzOhxShmc/qfnlxFd9oDV8jW2K0LKb6ixvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775536584; c=relaxed/simple;
	bh=JgDKTasJUayLCHD+Kc/rGxSiOf8rZ8VEd4Sv851vOr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aPVU6vuq5ehyhcDvSbD+BycUG8hZEzRZSx+zS3bttIDOTy/Q6Es2y/Bm1NX0UAXh01b1XcdiMInA7eMJDBADJ44Mj21m7U+Bvk+2Jzx/DjfnRCczGVEqrtDNujnJwFrlHPsOjL24sDdqwkmoLNUeudSqX08LNIyPFSO9PfwdBQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lf0FvsxA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ozj6roag; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636LQUm81407039
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 04:36:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J94ZVuzwu9K2fbOoqhqmXlR+x27Ar5N3kXchAi9R2to=; b=Lf0FvsxAlVdOcsKz
	sF0Sq3+l3YNb6Mvm1IVITwmD0DWFI8Bsq/j+zXulyiuQK4O1xbuIHsLrPOAy1IBG
	2c+JWW7Fl14WpvIyd3mzyci1y/c0LXMLMhDlV1u/AgSnkh2AJmIbcUEj65G7CP32
	b9+WUuofJV+kwMEqJFziUAdJ535tsLvS4rxjWFjvBMJ9T7rNC0/egsif/+IBIoEk
	0lkN3h/a8mrRFUiyBHFwTW84KiI9JkQidDd0ta5MNojQ9ToCFyCoWCE2wRaBcPax
	SDVjZA32ssIBfvM6uF1Pb1HOcxWNTr5s/MIkWiojdDm9mVtU17MXNKNykikoJdOC
	LI0LhQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmras1ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 04:36:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35449510446so4990841a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Apr 2026 21:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775536582; x=1776141382; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J94ZVuzwu9K2fbOoqhqmXlR+x27Ar5N3kXchAi9R2to=;
        b=Ozj6roagpXV1cA0sjfoj1KAYtOixg6/IG4SckWWkQNHXtKnRP8192NvjG3t3BOL3zB
         wIt54FaD5Dmui2aCKP/b6CzG1+KoqZlV4vbZs7RJf/Ez63PRbSWT+IEGUmXOXNk5vyhl
         xUo2wQ+uu6kmqjVUWFXVHIKg22eNZCYCpUaU+TVzeuCqigbFacHUL+6cAu4/Ny7yfAoz
         6NU5qfDbXaZYkliNzEKwVHta7sCgLCMB3c21RTFx2fvZM4NutqVJXo3rYudu0Fbwmm+6
         oSAm/yQB/eiyX3u40Li5i6SFnnKVvg+xuVjgbxDJXHNOEVHfC51uPvXOI2p0Dn5d/sz7
         zG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775536582; x=1776141382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J94ZVuzwu9K2fbOoqhqmXlR+x27Ar5N3kXchAi9R2to=;
        b=B1fn6wO12DIXjyrQIqZ7xVIBKr4NbVRv7GbcEod4rWeYOujWrQzyWK9qim4+nw4aR3
         QjxZTr/QvK1docJDEWpwkSzKXbFiDCKVadEAzvmpKxs54ivf2mlUuCHMyt0JKVoPCgzt
         9YZEmj4eKp1wVHBaSQ/CQ4woHR4PerTgu49ySFQf4/uh1B0ygqvoJhWumqt2GN5mW8wI
         XB+cHOKCrrj8VVO1t1zYJYnyNMsUKrIcI4kwp7KHQSJm6Sb1wIV8NXkfFz0eljCvmeFb
         9gE1mayKetggThALoX09dOXawqzuAyimR3jFc+IGk09WAW6HAYL/lAVnCYfrkckQWK0W
         Z9Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWc5rcomgeboYvnB0n6GAXAiFpPmvoPE11ySNkBwHTldPZITFu9mgkXAyM+P1FnruGSsjPF8cfUbZcwAhml@vger.kernel.org
X-Gm-Message-State: AOJu0YzEORj3Ix5z7D6ziXn5u7W8QDOrNoC0Z/ekgouBz/6YCXlg86Mt
	efNCIliDhONZj9nYrBvfyH/zpatFgtRVj16BendNS6tpr0beRLUWtalOgnEtXVHTzoe12JItOys
	B1XvymvtXPi+yE6AZv2Ny5mtq0fN0umTEzfv1h/euKAzmaEWT0sx+gs0yVUHWFnRcqBzR
X-Gm-Gg: AeBDiet0Vk6sh2FNFhSziczGxpDuHPRHZd9U7L9g89q2r77h4Tqw029BFWbHwXH9AfK
	ByHkAxfsVZAq8e2vs7g89qAqeHoeFOrig+DprMbMK39DKZ0VVnn6CZPLIGUOAcFxQUzV+JCTabR
	zu8dwLeBewfQJJMPdC9HORwB/9slz314bp8TrE68/4D4Vs4vrpic6C4An6WzznLUXwQ06cJsxxB
	m5G2w9weu/jAl4taq3WTf1BN0R65nnsKaDoZ4tRKlvj8EGvTBVMKUAm61X50PUHr0LYqg9HP2kD
	k1Ru7gWPQQNUrs6wD5HTVFAuZbMNY/pw2+xBcxihkDmjCQDQrDnpPCyRBAd7nEwOXmrdBBDVDx/
	mwgQOOaeetb13uNJY7db9oWEf+yUBfndChqPLaaUTdfIG0+1adlgw
X-Received: by 2002:a05:6a20:3d05:b0:39b:fad0:6edc with SMTP id adf61e73a8af0-39f2edaab1emr16119215637.6.1775536581793;
        Mon, 06 Apr 2026 21:36:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d05:b0:39b:fad0:6edc with SMTP id adf61e73a8af0-39f2edaab1emr16119185637.6.1775536581336;
        Mon, 06 Apr 2026 21:36:21 -0700 (PDT)
Received: from [10.217.223.92] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76cffd9611sm11404687a12.17.2026.04.06.21.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 21:36:20 -0700 (PDT)
Message-ID: <f05ac643-1ec4-4700-aace-c1a9d0cd9e07@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 10:06:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: kodiak: Add iface clock for ice
 sdhc
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260406-ice_emmc_clock_addition-v1-0-e7b237bf7a69@oss.qualcomm.com>
 <20260406-ice_emmc_clock_addition-v1-1-e7b237bf7a69@oss.qualcomm.com>
 <ggkj63sjoeqedsahze423723qs6tvcgmlnxqn2usqipve2yktp@45aas5zypfzr>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <ggkj63sjoeqedsahze423723qs6tvcgmlnxqn2usqipve2yktp@45aas5zypfzr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rIYjWXJcDeTgdZIZNm9KBVWBvHnu8Cx1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA0MSBTYWx0ZWRfX0nlzYLclesWf
 1O16SXTCLNPiofDti3lWCVT3EJlKMFbll8iXqG2fBEjZaWSGyvZMjVn8zh9NLueB5RfiyQEgH2n
 UEKriBWUIEV7exlt5lE1Kx6rcz0zzV9yGAYm8dDyFt2pdcKLrWRF4qJ5JELA00aXPaV90qI1wK2
 yGxz2dq42PLzSwmNFiU8YyOy37wo27QF9QjgUXlO8OxKZRAsn1gwJMMSFa0Xu0GBx3XpcxysMP5
 qftyjhG2ta1HrmrA+CVMv6zH9TQnWEPzv6bx/XjaxLn4UUlc57bnz5wLufyPg6PRpGossJj7qIz
 T7iFvcrZLVtASGI4HXScDqJtELKvlMzVgOuQnVLEVLLRXoPVGO53kmepceDpb/CE/eVF2Fi45dj
 LUqBDlUyg5ugBsX5FyNms3boIh1/HKn1d6CXtCGygzBvXhSfQQMchqvPr+LAfKj9Kfng83oxstY
 5Hnf+pEEPaDl51buOiw==
X-Proofpoint-GUID: rIYjWXJcDeTgdZIZNm9KBVWBvHnu8Cx1
X-Authority-Analysis: v=2.4 cv=D/d37PRj c=1 sm=1 tr=0 ts=69d489c6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gBggw25WdKopFYHr0XkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070041
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,7c8000:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102048-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 86F443A9B51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/2026 12:43 AM, Dmitry Baryshkov wrote:
> On Mon, Apr 06, 2026 at 10:00:36PM +0530, Kuldeep Singh wrote:
>> Qualcomm in-line crypto engine (ICE) platform driver specifies and votes
>> for its own resources. Before accessing ICE hardware during probe, to
>> avoid potential unclocked register access issues (when clk_ignore_unused
>> is not passed on the kernel command line), in addition to the 'core'
>> clock the 'iface' clock should also be turned on by the driver.
>>
>> As bindings allow to specify 2 clocks, add iface clock now.
>>
>> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index dda4697a61b7..5e6b659e8719 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -1082,7 +1082,8 @@ sdhc_ice: crypto@7c8000 {
>>  			compatible = "qcom,sc7280-inline-crypto-engine",
>>  				     "qcom,inline-crypto-engine";
>>  			reg = <0x0 0x007c8000 0x0 0x18000>;
>> -			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>;
>> +			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
>> +			clock-names = "core", "iface";
> 
> Inside the schema the clocks have maxItems:1. Please update the schema:
> Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml

Thanks for review Dmitry.

Clocks maxItems are already 2 as per below dependent patch.
Kindly check cover letter for dependency to understand more.

https://lore.kernel.org/linux-arm-msm/20260323-qcom_ice_power_and_clk_vote-v4-0-e36044bbdfe9@oss.qualcomm.com/T/#m885402f4d828804501a3982ae8b8a5a028e15a89

-- 
Regards
Kuldeep


