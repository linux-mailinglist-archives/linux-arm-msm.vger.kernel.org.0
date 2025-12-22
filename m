Return-Path: <linux-arm-msm+bounces-86250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AACCD6BA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 17:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B66DC30221AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 16:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8336350287;
	Mon, 22 Dec 2025 16:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lye7C4yi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUvrZjuf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF4334FF7C
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766422632; cv=none; b=q6UoGRArK/DSiBaprkgzWToCfQ00hZygrYg4lo1CSX0EOrx+e8thVqRBihxRllLwOanuwbVAOijcalPguM334GLWR/+lybxsRoLa3OqjGIfM+Zz4r/RyDxnMbQ9AOYGRmp0sWhvWO36McJyzkwpG3y8Gn98TlgMh6YYbwoVVBOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766422632; c=relaxed/simple;
	bh=xV6tWgjxZaXKfkrPw5l/uzOAaZsuSpJiThtogYYnDTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zam1Aggm1hbd9PD6YZBsWeENqw3B0eFgv/VKOvSnr/0JRQKHNV4IAS9LK6is9ehY46wYafjZiuGjx5Hp2NwPK58JiMqEAYPbR5tzAM+UdDS+5Gf/8qteaBvdkckGbK7ZK4owmPR/eeGhzkQiJvDcOl7dlClkdRPD5vZ5bHNbzds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lye7C4yi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUvrZjuf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BMEBwsd1894837
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 16:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4itgOftOBi39v3+Y6wa7zx7cM8P0meLsOdf8/g/via4=; b=lye7C4yiuqPLel88
	HPjm+8uaBtuxa3yyOHwh+GY3XIatjzgnZCsGY2fsw1lPxqqMMamgVc0ktvkg/0nU
	05DH+C2j7hcGr4pOk30N4qYefy/mBWQnnKLwTWqOBKGZ+imEAVCe1Ozjp6jeiqkn
	i39hcH2pVNn0JxF+ITsmzv+FRazzD4vydZEfLWRzTdEgfTV+tSB9y8JPK8BdM1FE
	d+yG5AVxDufijhKCnBvKHHt8jIkUcB+3ICYyGQtwc0khA3zHQvPZ5+6mjy/HsHi2
	5+ZUuvM9Dxu0ys9sZ3OIOeAgngMdiEVYvcgiXLwOWSmBhMr1oi++5T5Vm/KyTQ1a
	JwEnkA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b74taguvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 16:57:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f29ae883bso59516775ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766422629; x=1767027429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4itgOftOBi39v3+Y6wa7zx7cM8P0meLsOdf8/g/via4=;
        b=BUvrZjufjNZiV46lq+7neHqdgxSSJiH7IMrC7M3zQGKRoT3/ZQBFuP6GAVG8RN/RDc
         shgGHcNdcb/Jsmj0oPuoK84lja9v/vivhWzkcJDg/+d/WObcdOVncvj45aGuLyqEvRJQ
         NH17xh0CsHFSrMZJpPKNqzFISLFRgHH8z17yljCsqs5kZ8Aj/v9RhMcGGkTetBj8J3Vy
         KhMLX49tCHLFTbKBxg1YdL0oNma1m6wxoBrtQS7WrPhU7DM+fBIhWlB4rldVwkt067pb
         ef98vDQb5yJuXdOe/gKYRFZSYn67aBvbzTIXYzEsxcsXTRu+Ko7NJxZcdlTyXkF3ucRc
         merw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766422629; x=1767027429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4itgOftOBi39v3+Y6wa7zx7cM8P0meLsOdf8/g/via4=;
        b=XBJ34fjHR1ZqTEEPmQXyBuZpmdCUPWU7I0KBBf2acqkF3PQmf1tbcOF4FGPNPiWRaV
         7AiZwySJuqOVHa0vJKJvBQftTTO6Wbz1VByoVtfhMcwuwsDPRa2c+hXmllH0XXaUaG5/
         VyruX5UorDah+wuPnR+DVgZg2Ny5MlfQ1tNkr1DWTyEtpdpvgJlR+r2Yex33maRXTYJj
         q2kGVJ/L8Z9PLI3Rtg2m5gGek0x8WJKfaIpzWBpYNOcBNTFZphuwbu61ZWF29DJRnzwf
         bE0tzufu0U6akAyPVPecfs/zyDo9NPMlAXGwLUzQuWYo56VoVgXXzKcD8QLQGMS79Nh2
         TgNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXK3G/OhSVhYs2Tr1higvpal+zKAYM6TnFVDNh5DLNgtqsiQNBOXzzrn0r2yXtPfCwGNdOXQSB4/p3BHmEq@vger.kernel.org
X-Gm-Message-State: AOJu0YwFS6vR3RggMA4iJt9a1StV5S35f9djnSrx0L1hhWeSQsFoacls
	CnIuSsQZL0OsOSs2lJVC9yRewcuN21p8FNVVxXcvFBuKCS1ceQfqI8cluaiNq33E7BG4EncfMv3
	Fvw+LB+4d1XaRENfQI+TiGIIbJLLuwfjC7G84Hw0ZkQyh8e4qYL/2ht7kMUHD4Y6XHiv/
X-Gm-Gg: AY/fxX7Q1A30acb4Od9FJDkEfa8f7lon2DW5OwWZSJPCgN3K8MiTpOwPyugK0lFg56Z
	1sMX1EiTtgUTWCtXIhsr08qXLS9PZC3a5JuBGyA7l0z0Bc4NaGH1oQnGz3C5X+6YJeJgbR5LAcV
	jJGRZwFKKJYJIrJeq6ryTJq2q0Zuetdl/oWBUCSn7HNdNyHMs0VFLIb9fr9HmjijZYErJB/1I9d
	3uTolF7SQAYbAMHwmEzq1YMp4pbVaGtEN0hmCVWnKV1ojC2XXN4yeM6aCqZ5IziHRwP+zviYI0I
	e9eReILDR/iSUI/eAUxvuZvcqv1/bdku1D0p6eJvw1IDg2schOKshikowNua+CdwU3ydUdS6+MT
	0KE4+8ahz+MING1AHpbNoJdJF6q9ErFX3q3OM
X-Received: by 2002:a17:903:2448:b0:2a0:b7d3:1bf4 with SMTP id d9443c01a7336-2a2f2212833mr125103635ad.5.1766422628892;
        Mon, 22 Dec 2025 08:57:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDKazaiIoCtCLvy9WCpAv5NHiSa0bEoYQsJ/tn3nK095kVKTp+ibCk6SgPCiILA+nQ1SiDjw==
X-Received: by 2002:a17:903:2448:b0:2a0:b7d3:1bf4 with SMTP id d9443c01a7336-2a2f2212833mr125103405ad.5.1766422628416;
        Mon, 22 Dec 2025 08:57:08 -0800 (PST)
Received: from [192.168.1.5] ([27.57.93.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c9b51esm101496025ad.43.2025.12.22.08.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 08:57:08 -0800 (PST)
Message-ID: <698bb8b4-d6ae-4a97-8cc3-9e48ea8afd2e@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 22:27:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs8300: Add clocks for QoS
 configuration
To: Krzysztof Kozlowski <krzk@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
References: <20251128150106.13849-1-odelu.kukatla@oss.qualcomm.com>
 <20251128150106.13849-4-odelu.kukatla@oss.qualcomm.com>
 <8b8d35d4-ee88-4d91-aef5-0e77f03f59b0@kernel.org>
Content-Language: en-US
From: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
In-Reply-To: <8b8d35d4-ee88-4d91-aef5-0e77f03f59b0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DPiCIiNb c=1 sm=1 tr=0 ts=69497866 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=luqpl2TCSyK2LuNNAmtdDg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=P0VVE0QUFgw9kxqKfqoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: hdD6uMHAsX260xyZn6_NkbVcdlSgD8HX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDE1NSBTYWx0ZWRfXz8IZQyYmaiqx
 SjnCHO+9VSjh4k4ti1FWCtf2fb8l2vE+4lVdj1hNli4LWRC7U/E9r9959HIX69hqwkJDmgsBR5S
 5LfQj2voHNPjyfIPAxrmTJFMWSU/9TP2HSDq9CJvGQyKstlnHWjWsYRXRv5IXiyljQt+PYc0ebD
 Xz4Np+p/qYSjqdr74RFQPYPsj528h+3LPqv7fbFkeL9t29TjtbIzh7mrPfVDCzJrdWrtc/ipIYm
 TVBAsQhFvOonT6wqdzJ9XwiVY8O+3uXCyK9/DALogiJ96dLyS2LozV4zSD5RXN/n5wyhC6bvU85
 EJKxWIPRWBAqNW4UKRNoUL0YijdbtEpuof9d9RpwEiNSKudyjZUpy1RwoW3uvqhTV57XaW/t2AV
 BiIwR8XuDkvnnWWLVhhVXl0MhhFM/MS8nG5QnRcK8/k9zhArTTxMbof9DrbdAFAW+neTYWgumQh
 zBWF2YVeVoxJbqytZGA==
X-Proofpoint-ORIG-GUID: hdD6uMHAsX260xyZn6_NkbVcdlSgD8HX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-22_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220155



On 11/29/2025 3:04 PM, Krzysztof Kozlowski wrote:
> On 28/11/2025 16:01, Odelu Kukatla wrote:
>> Add clocks which need to be enabled for configuring QoS on
>> qcs8300 SoC.
>>
>> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/monaco.dtsi | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> index 816fa2af8a9a..6139511ea525 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> @@ -2226,6 +2226,10 @@
>>  			reg = <0x0 0x016c0000 0x0 0x17080>;
>>  			#interconnect-cells = <2>;
>>  			qcom,bcm-voters = <&apps_bcm_voter>;
>> +			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
>> +				 <&gcc GCC_AGGRE_NOC_QUPV3_AXI_CLK>,
>> +				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
>> +				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
> 
> Your binding said all interconnects have clocks, so please update all of
> them. Not only three out of 10-or-whatever-in-total-you-have.
> 

Thanks Krzysztof!
Not all interconnects have clocks/MMIO, I will update the bindings as
you suggested in the fix:
https://lore.kernel.org/all/20251129094612.16838-2-krzysztof.kozlowski@oss.qualcomm.com/


Thanks,
Odelu

> 
> Best regards,
> Krzysztof


