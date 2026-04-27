Return-Path: <linux-arm-msm+bounces-104749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGTMLm5z72kcBgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 16:32:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDA54746C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 16:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F31B4308891E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEAB739A049;
	Mon, 27 Apr 2026 14:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dk+PceQA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XOHRJ1Fc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A87F9C0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299911; cv=none; b=WpX8ERUfGa2tZr8sgKRIjhgVDOPpy2HQbqFdV1MPqwZdeR6pQEj5S2J3XK92GRmlRvJsyj9ryPkUO5QT0e/IVQtZTY1oM06N36p0T5/BteiMLqgWia42qZcMkYh+Q2GqxPnVaoqr1QqHQenwa8yG42qCjmTd4obHY38FhBrWWYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299911; c=relaxed/simple;
	bh=k6bh0Vw/IhCgq//XAl9md9ddxhBLBXBMxxj8buXykF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0QAfmybSaUwXi1kBjmyWyujYm3Y4NY+pIFl8y57eZEtazuTEi7+o51Xc9P4mnilYzB3YJnN+kv+97q07GF9xwyWptqY7fMb7P6kn3hQw12X9BLxx52ngu78iKCFjkKhaFudoCeSZ0Wofx9zOw5YfKznjiXGvCKcW1Pb/e9iQSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dk+PceQA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XOHRJ1Fc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RC5dS42006212
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IReQnGnIlvbqQm1h5A39po5dJakAPAgrvEnFlMBSbuk=; b=dk+PceQA+hQ1M5Aw
	MTce5JjUYzrJXb9VLM+jFQiVqMdyZ4y5+zPRT0tO33SAaF0i2cA+v2FtLzvAkjk8
	Yc+u2ivTO/v3Y89nAS2o2E2crpvydz3+yhMF0Kwem+sZqoTaKlEJwabLDe1dhyEO
	wkSaN6HmyZB3yXIOqYpP8MPk4DIOyH3Ku+Nk1q5ozImQg3b/36PTkIR0NpXqDg5B
	T1MO+OW5eDxWNSngx+h67AnwJitGm3IJymZnDkEMZ7Ohl1DTv8CO7huaEelmCnvo
	pcwqTKSqCGvzNIPsB91vktbM9HTnQBDio6ZNzjlwEoBchJZ6I5hWng6trkbH8+7J
	5InTJg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7gkgfrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 14:25:09 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9539e4725c0so307386241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777299909; x=1777904709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IReQnGnIlvbqQm1h5A39po5dJakAPAgrvEnFlMBSbuk=;
        b=XOHRJ1Fc7I9wwXwH+4+yknKKvLgFonnhdXPOj9r4i/v9/MkIRfp7oe6XW7qg+pN8K9
         x/gT2LlKq16jj1mzbDsFMkdn95ku+IUIOxmPprUHCDeh+92NAeLB6MzSPz0FiymF6NIu
         ZGNXA1Cp7zoVc8R5QM6XZdnbvA/IctPuCM/GH3l8EvxXLyhJSN/FF0F7zLXxNPvF4f7X
         ngYySfCZTu6K+0EQzmtqQ+ZTKlWQpbnUqm/P7UYCJ1wUn8ncRat9sX/efCVTWEtLvRbb
         TzUsobIfucwH2G3s9SrHv13s1KAHpayDPJy4OYnC+rdtREvdq5N/B7mBYsBQZ5yfImcF
         LFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777299909; x=1777904709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IReQnGnIlvbqQm1h5A39po5dJakAPAgrvEnFlMBSbuk=;
        b=VLvHu86nP2LUx4fSUtHHrzBqHnpKRWtObg7XqyyPgk8haEWtvJ7PaSENotmhcHAz1h
         YXwmBQa8mJ3j4A6NR52fuVBdAw526MG6r8GdfKkDU+65OEitZO/sNdKDfCPChFIYy6Fk
         BiC9+kX5hWI+1adr4uuH8+okKF2BEvb2zxZNfsw4QWoCdyU5UKyO190MwICyNUX4Kgiq
         Edisi24PrZLQRyLxYoKs7FNSZIDUKnWVcCkllFDv2VhX+r72dqAbEihYvrdvy9Znyjqe
         CkekEwYdU6bG5PIbNlMaGq0KjEf9J85tT3VfGuB7/HTwkysUv3WJx9bH+9gHGZ2TWAag
         lOSA==
X-Forwarded-Encrypted: i=1; AFNElJ+WZXebeezkPwTndIl8dFmYVzQ5zmhmJvy8tXiNHWAVm5e8LxUEg0bZ6l0ebSr2pujGwAyiDnaUV/SNevmp@vger.kernel.org
X-Gm-Message-State: AOJu0YxnmRpo3RaMmyyF8NuguRlODu9zOzBpGkoHrpRLOs+5ccaFBNR+
	T/P+J3VVBitLGBLslJEaA6uyIiR2bp8VIRP8rPYTdwK20ttx3KPt5W4XPrQo27NC88m2YybwCDc
	H7PQygfUW8cRuiX16FQnf9C/O5clvp+M1QM5v9KtQXfNfkk4/R34b7WGLL+a4zrJKBtjM
X-Gm-Gg: AeBDietfX7getX1OvjrquAMO6woo3czxBnWAtg/agoPPIKkjh75uJLtvWXWlq8oe1mG
	Czgu5NOQLPrfc7D9ZouJGaPRNBkCV88Nf8Xx51V31Jw0CWMT4aBS2NJgL2aD8cd3W65ptxDM+T9
	rEb1yghtzBqmhtPWlBjnNV6CicKNOV9es/LSB1UdLQiKiJA63MORiob61XiQnxzVDFnn+muVbuQ
	AaoYd+tEhZtXjt5cnJbgCq7A9mgHNXKaw+8jyp9gPZXTWW8bD0boQI1ArNjmNyQ0A7xHGQb88cT
	bxumtqCHDgfbmSFKpyA8bR31tV7ltM4hGDaE4A8jkwEu8U9TK6cHft44ndSA1a78ota8QEIgG6o
	pT5KHETvOKOZMLe6sHtnvcOcv/u6R5N5u6qmOCP/k8ED5XrDqct560kk7kBNceob0G/9HtlO2og
	tDKySPX9EoCDP7ig==
X-Received: by 2002:a05:6102:3708:b0:611:7722:a6a7 with SMTP id ada2fe7eead31-616f8072a0dmr8841437137.8.1777299908618;
        Mon, 27 Apr 2026 07:25:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3708:b0:611:7722:a6a7 with SMTP id ada2fe7eead31-616f8072a0dmr8841422137.8.1777299908007;
        Mon, 27 Apr 2026 07:25:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-672c4d4590asm6947034a12.19.2026.04.27.07.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:25:07 -0700 (PDT)
Message-ID: <7a39b2e4-d2b4-486d-a012-706f9ef86b07@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 16:25:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco-pmics: Add PON power key and
 reset inputs
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com
References: <20260122-add_pwrkey_and_resin-v1-1-a9fe87537816@oss.qualcomm.com>
 <0b4ac3c1-11b3-4991-83c2-0c39a81baa8f@oss.qualcomm.com>
 <ad9nbsBKCLyQ0tI/@hu-kotarake-hyd.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ad9nbsBKCLyQ0tI/@hu-kotarake-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GhLvOQ0CE1TDFeFEmvNjNGmGZuBX_m7_
X-Proofpoint-ORIG-GUID: GhLvOQ0CE1TDFeFEmvNjNGmGZuBX_m7_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE1MiBTYWx0ZWRfX5wxm0LBmlhN+
 8biMM/4WGRRLxNUx3Az4UjCy8X/icalTpokiFmTOwS8hiIY12Gn0Mt2/TOuPxHoBFoTSmbslIuh
 hNhONapnP8RyPnr6grm4yezuqzyBo3HYb4G84E+F8J+VuZOsSeJNNShxUJ6Tttp3IEgKnBzwVle
 YTpnVSL4Acwv78bdujxGpviJvpLSWrOom07qwpQvd6A5zoRhDV/WSaTqNhzEIjIeJ0tyFSdvBUb
 dkw5E7NP0I0gZVfD0qR/C7/djNB0Txq0dVupTSrUIqDOstos9CMkb2844082hdrpSSW89GEy8MV
 OPpF0QyCtH6A1vtGf9vxwilX9ABw3coMu6QN/QzVwSEPhg9l8Hoh51GoNb5G5cmS2mgFbpeFaY1
 VoIyqRHJzIV79/DOdesWjmTleDyHonZjhk91i9vtD08zPCKCRQTg4Isru0nEWKk8gqipmkcmBXQ
 IbUtRtjBYH4X/9HoShA==
X-Authority-Analysis: v=2.4 cv=bJsm5v+Z c=1 sm=1 tr=0 ts=69ef71c5 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6bjU-TzPh-P_-KBABl0A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270152
X-Rspamd-Queue-Id: 2CDA54746C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104749-lists,linux-arm-msm=lfdr.de];
	NEURAL_SPAM(0.00)[0.252];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.4.176:email];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/15/26 12:24 PM, Rakesh Kota wrote:
> On Fri, Jan 30, 2026 at 12:18:53PM +0100, Konrad Dybcio wrote:
>> On 1/22/26 7:59 AM, Rakesh Kota wrote:
>>> Add the Power On (PON) peripheral with power key and reset input
>>> support for the PMM8654AU PMIC on Monaco platforms.
>>>
>>> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/monaco-pmics.dtsi | 20 ++++++++++++++++++++
>>>  1 file changed, 20 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
>>> index e990d7367719beaa9e0cea87d9c183ae18c3ebc8..051407cd83eef8eace8521084b1ad012a5192ace 100644
>>> --- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
>>> @@ -13,6 +13,26 @@ pmm8620au_0: pmic@0 {
>>>  		#address-cells = <1>;
>>>  		#size-cells = <0>;
>>>  
>>> +		pmm8654au_0_pon: pon@1200 {
>>> +			compatible = "qcom,pmk8350-pon";
>>
>> I see pmm8655x has some slight changes vs pmk8350 (more configs but
>> generally backwards compatible if we don't use them), let's add a
>> separate compatible in bindings so that we can maybe handle these
>> differences down the line:
>>
>> diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
>> index 979a377cb4ff..14b85b0d97da 100644
>> --- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
>> +++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
>> @@ -17,12 +17,16 @@ description: |
>>  
>>  properties:
>>    compatible:
>> -    enum:
>> -      - qcom,pm8916-pon
>> -      - qcom,pm8941-pon
>> -      - qcom,pms405-pon
>> -      - qcom,pm8998-pon
>> -      - qcom,pmk8350-pon
>> +    oneOf:
>> +      - enum:
>> +          - qcom,pm8916-pon
>> +          - qcom,pm8941-pon
>> +          - qcom,pms405-pon
>> +          - qcom,pm8998-pon
>> +          - qcom,pmk8350-pon
>> +      - items:
>> +          - const: qcom,pmm8654au-pon
>> +          - const: qcom,pmk8350-pon
>>
> 
> Hi Konrad,
> 
> Based on the below discussion:
> https://lore.kernel.org/all/872faa80-d323-4625-ab8f-50ab2e0e8e0f@kernel.org/
> 
> I understand that introducing new compatibles without a corresponding driver
> change is not acceptable per upstream community guidelines. As Krzysztof pointed out,
> neew compatibles must be accompanied by the necessary driver support.
> 
> so,shall we use the old compatible in the current patch series for now ?
> And Resume the patch series at https://lore.kernel.org/linux-arm-msm/9c7521fe-5008-4daa-945b-ce3f5c0f6dc0@kernel.org/
> once the driver changes are ready and upstreamed ?

The last piece of feedback seems to be here:

https://lore.kernel.org/all/9c7521fe-5008-4daa-945b-ce3f5c0f6dc0@kernel.org/

where I believe the diff you're asked to implement against your patch is:

1. Remove the new if:then: block (since by the presence of
"contains:qcom,pmk8350-pon" in the existing one, the PMM8654AU entry (which
falls back to it), will be taken into account too, and the "then:" part is
identical)

2. In the existing if:pmk8350/then: block, the 'reg' part of "then:" is a
repetition of the top-level constraints (i.e. it's a NOP). This is wrong,
because PMK8350 clearly has two address spaces. This is further confusing,
as the commit that originally introduced this (03fccdc76dce ("dt-bindings:
power: reset: qcom-pon: Add new compatible "qcom,pmk8350-pon""))
specifically says "whereas GEN3 peripherals can have two register addresses"
- the "can" was probably supposed to be an unconditional statement instead.

The action from that is to create a separate, preceding commit, changing
minItems:1/maxItems:2 into minItems: 2 for both the reg: and reg-names
part

3. Run `make dt_binding_check DT_SCHEMA_FILES="reset/qcom,pon.yaml"` and
b4 prep --check before your next submission, and squash any errors that
show up

Konrad

