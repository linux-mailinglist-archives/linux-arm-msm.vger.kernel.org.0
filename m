Return-Path: <linux-arm-msm+bounces-86547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F461CDBF1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 11:15:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9B2CB3027CED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E543346AB;
	Wed, 24 Dec 2025 10:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjZSYxdt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O3vcEA2v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAD832FA25
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766571108; cv=none; b=o1faZWV6ou0cW0GmF2YR3sasb/ljewnEDQwjSK0UhuRQd1sQp5zoYyFC53DuXFfWlwaHR4f5cF/lWm9FFhUtJumOeWIQlBf1bNuIChbw4ZISqkx/+v3xwMEm+OsegOJ20XhO+2cOEMifOq1M4wntLwQdaJ4I1lhum9URQvnfPw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766571108; c=relaxed/simple;
	bh=0+LzigftUlRjypYE7eKHbXMl8C6YbFGHAlET3r9jYMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=olXJ8avC40ZvoO1mDLRgfQdh74y7eoloW/ylmYmoWff7anNzyRe+T1Zz7b5VymQSJsa+9kO/QRXHUg6R4PEuxWE+e/LOYHXhIZmo6GqeHxvHQi/TxobrgnfnN7O23mgUsX79WsE4FYQKVYwhS0L4ApmiOZSZPZ2OUTWBA0AYubQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SjZSYxdt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O3vcEA2v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9HEed700565
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Svub1lU8ZSgyZ0FEnwysVHAmS9UtLZzdyHUW+Tohk6E=; b=SjZSYxdt2qoOIAnh
	sPT/EtoFzR/AwExHlaMqaGu92FAjXvr4mI/r4uIFkGszTaRob3AZ65FxNpZmSx+B
	3zraQBeYRFFTb5xW2K4U8xyfKGiAp6NxTxyKmBv0jmmQJ09FEVR64SJxBdhhy9sl
	WCiJ5FiweTQixePBqHVC+J1POROYTAWLRCTUa6/99utOu7pdlfCOThZzLn3BdLn6
	6BQK18B6FA7PT/LjV6H7Ch5smKCsJk9D3N5z/hYMHLNaLOizMdS7n5HFn9+1x6q8
	xMu0W+z/wm3q+vhcUwb8SDsC1H06QMqda5bEkzaPeHGZ0jClBtj0LNMvJZ7QbLc3
	GljtdQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jud5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 10:11:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso61978925ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 02:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766571105; x=1767175905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Svub1lU8ZSgyZ0FEnwysVHAmS9UtLZzdyHUW+Tohk6E=;
        b=O3vcEA2viZ3YgUK9+c0aWZ/HMJMkoqpIY97uhD0jaFrbC1AX7AEFlrgJYdsNDBAJ3x
         iJHyK4Hw/CTSwucY6NX9pgen0TtpkyKUwSLKs/4vDaCcEf/Uu4Odb3aYQy84G0OoG5fc
         yxAp3cU35xViShPa6QP8nWTOOBsMWRw/pFPwJjVwHhBKNCESdBO6xbUslzXzsUKYYxUg
         vvEO3I5LLNPnzNaAWuP6E/neyqRSQlE+D73kZ5mAcjE0bTSE4BWbWEBwUR/lZhwJA8hD
         nUP85/DCThNJlxJJcYFQum1KvY5ZvazX657dRqdRkuph7ATOonMmEH0aPEHQAtNOa8Hr
         7e5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766571105; x=1767175905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Svub1lU8ZSgyZ0FEnwysVHAmS9UtLZzdyHUW+Tohk6E=;
        b=lSSnsRndgvjspbiMfeYR/XDrrkalr2rexrnmwbwTRq79RTM1Yp8Zot8VHr0SKBwoxl
         y5fDTD9LHdDLoiPo+hdSCnJbV9I6VwXbZZoTMbDxu8FX5DPNEUxZOB6RvB/fnEt88a8C
         6Czs84Fev3d8zyhisQYL/Vg7mbEDu8Ap9XTJLI5AuFVOpvx46Q003qxsEpq4hFkRvJik
         aavj0RUpuMNbUOwKn/6qHIa4yfg7adr2dxdVX7j9VZ6a375p9gQl5mPMUDzsVbNvpe9s
         cSbLpqCbD7d/HOwDp/0rpTcBAfDN0Nfu7Q8wPw9Qh0dg9hvPpTHGhkEboKGZWsnUvoaz
         IU1g==
X-Gm-Message-State: AOJu0YyOWob0FNcMnj/cpOBFaaMJIcHuS5YygmbSXBZZnEzn7He0doSr
	CT3pJ4A3jQJtZV4+1TEPehsJMxSVgUncH8CgbeIIFIIoH7yIlHUI4hLaJ4uBAh/nr+zN25nd4vr
	6wQRYr4urGafvUFnaUAPKMueIDS1INJzlsHJPSZhKEyCXUciiToGesUFLl9PYnokRnbqk
X-Gm-Gg: AY/fxX785Rs43PSW1YOn/2QYWJPFDULye0GUg46vQUCYn43M333/wuueDV/x3ykshdT
	BMszLA89wOUHHVxn0frs4WUovfLzpvcMQgsUMHOrI15Z/kRVlsMcBfQS4scI4foD3iB2lv1kTGb
	lQH+X0+FvCBTWnglw7kRBLTj0ss2V2//Kbo149gg/+XJh94/U02NbrARz5sdKsQFgpjXhh58/Iy
	yAhSK/8tuNDRWHv4RcoxrRa+UQVhVEck+rU+LhwZ4DVGhXM/Ps6YxY+HwszV4VWfhX9LaouAmBe
	QBM29WhNurEl/0N98ARYZUdlezjw/COe9XqmJo3UTy8rhmfUQfeK6m68BlBCwA+TK5BrYQvudZh
	7/OVayt01MsJ7QQUlPdm3+oTiYesqklWDX74/+Gaw5Q==
X-Received: by 2002:a17:903:2cd:b0:2a0:e532:242e with SMTP id d9443c01a7336-2a2f220dd7bmr160503265ad.11.1766571104930;
        Wed, 24 Dec 2025 02:11:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPP9Ip+0lDlRJOgiICxJKR2lJuGko3g+A/N9Bn0a9iSgphrPC7hgQ2nkVu84feaV3gcN9RWg==
X-Received: by 2002:a17:903:2cd:b0:2a0:e532:242e with SMTP id d9443c01a7336-2a2f220dd7bmr160502985ad.11.1766571104446;
        Wed, 24 Dec 2025 02:11:44 -0800 (PST)
Received: from [192.168.1.11] ([106.222.232.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66bd3sm151171405ad.1.2025.12.24.02.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Dec 2025 02:11:44 -0800 (PST)
Message-ID: <a0df9078-f05e-40bc-a708-cd03eb86839f@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 15:41:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 8/8] arm64: dts: qcom: Enable cdsp qmi tmd devices for
 monaco
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
        rui.zhang@intel.com, lukasz.luba@arm.com, konradybcio@kernel.org,
        amitk@kernel.org, mani@kernel.org, casey.connolly@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
 <20251223123227.1317244-9-gaurav.kohli@oss.qualcomm.com>
 <2ce05668-e4b1-4943-aebd-9ba57f4c8363@kernel.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <2ce05668-e4b1-4943-aebd-9ba57f4c8363@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4NyBTYWx0ZWRfX/zv+wDkZRlmH
 LtG666kBIUeS2FW2emMuL1aenNEqf4GByfKukmhjg5756KMnuNhM9p7+sUtjm5QG0nV/2H2uAlH
 6ecjgd0SEGf++nqN/9dpqW3bwK6x5uVX6pzJDpAWaU6PCl4tFeaPbdBJPt5RC29Qi5G5hYhz6AO
 XsGO7o6fyDD87VH58eSmATTNjxSm02R9f3EzrJGlQqi5woCFdeU3OS+SYETN8OC2Z5+pu3SVVyI
 jRsWStQ9lC/wTYLLB+uIOTdkxOvnngRkPYbOY1q5yC42NHTHdvaWECchNrg4pDkadsMEZEUzuIU
 5cMg6ZcPP7KMrCI0HwKTNwKyzKGL8+3bLTX6hcm9ZViMpR1vGrZ6byjzPi89clWzoPjDDhSOCYg
 5g5HX7LkgvCCi456aMQb5ZHyq/gOmGSiFGcmE7J+1wGuFoUMbovvLog2Ag4SaqTi34wTRlzYP+k
 dto23guKja6uWf9ZAcQ==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694bbc62 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=pk+8NuH2X28N4C0eta/h1Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JG_C0qjW1QYSyXvylJMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: _smqAMOpioeIqWh-mpJr2hkGzoe7eXXx
X-Proofpoint-ORIG-GUID: _smqAMOpioeIqWh-mpJr2hkGzoe7eXXx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240087


On 12/24/2025 2:28 PM, Krzysztof Kozlowski wrote:
> On 23/12/2025 13:32, Gaurav Kohli wrote:
>> Enable cdsp cooling devices and thermal zone cooling map bindings
>> for cdsp.
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/monaco.dtsi | 92 ++++++++++++++++++++++++++++
>>   1 file changed, 92 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> index 985e37bf4876..1fe148ec5cf7 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> @@ -6217,6 +6217,14 @@ compute-cb@4 {
>>   					};
>>   				};
>>   			};
>> +
>> +			cooling {
>> +				compatible = "qcom,qmi-cooling-cdsp";
>> +					cdsp_sw: cdsp_sw {
> Another LLM generated snippet or just mistake?


All this is manual code, will fix this.


>
> Best regards,
> Krzysztof

