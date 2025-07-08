Return-Path: <linux-arm-msm+bounces-64009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FC8AFC821
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 12:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D09EE3A6F60
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFA82356D9;
	Tue,  8 Jul 2025 10:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M9bFl1od"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBF320E033
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 10:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751969964; cv=none; b=gPjwmdrEf06Ts5UsL3UAxnbksXKGdo2ZxQj0dfWPuDjdyL0W3slQauTplI4ET2+mcWrCpkOirjMqYgsK6+q6kExn0Cd0XjNoZMIeN5Qzo3E0jliJqGY1QlDd/imBiky+xFPtNMkGQkIvBa5pmD/MG0QbZlBJgPa8YbYRCH5t4Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751969964; c=relaxed/simple;
	bh=4qyGCqoOctCX+ogPWnWHpeEY30lAlTFutKfubN8uP0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y0RAc5SDzkCfQy8soKIgsMqxDOVg0llvxGBJLZIx4fLx5v7k2iGu/uOaE02ud+HjOgMRXTmEIzm89j686ZfTrXaZhRy7KypZqdlP9e03pt9lxcuXS1nT4zsoJEPYebMqGntsS0es2vXsGM9LuqWCoesRSY8MOl3LXtvs0wHtFYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M9bFl1od; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568AAJve008388
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 10:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X8J5lvtE8rEXlZWpUd+/01lG085Osm/mImlq/Wf/j3c=; b=M9bFl1od0O73Mvar
	CVi1LSPqm3OaCNwM3NxMXQ8FA/pk9mpc9iMo1NZD7UUseSXR7pVyYyckfDVxbogE
	M3AWS5sujse7GEGQi8jH2ljNs1vQGlVx9Vfgmx+s9A4e+P4ffJ4n872473Bsj6zR
	M2NrH/lfRA/LjuG7+FWHlZbc/xP1rwjC8sVFbPIlMbtbaRhb9TcndSfgJybSt8da
	hEsLI66J6NWKjfitnGj29IkfhZ6x2Xc8a4gchC1pD+lSY8mt377wXFWSO9JuJrxO
	UslajnYy/6QG6s91dLJKMBv7MBwjph1yTmwl/8WEazYY1tgBmUkajpihdv/LUu0P
	IgBZ0w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucmvp5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 10:19:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2349498f00eso43605635ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 03:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969960; x=1752574760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X8J5lvtE8rEXlZWpUd+/01lG085Osm/mImlq/Wf/j3c=;
        b=W6DRcI9kZgeYe4vgqSJd45ZSKXiUcjg69eK8JJbSi/P9RNScTX41+mXredVlPyUcH6
         ULQdVIj7X3pbvqs4qssQPN7ixzz7O4CtNT/XjNctaNqbib0PHfc7i6NC3GUv3kbOhPaf
         2CBWdLg510XGrLixh8C7a8BM+i8lKyLnaOtd50Zhfpd7qjU7W0R4Who7cXymGwvBGTvW
         BODEorpq7jeUsuRUIPXKBAirDDlbfyTBwKFSl9cgtVYK5Sgodl7NzpyIT6c2HEibAip3
         GNOO3TtEP2hqYjxjqz/5SLcKtvFjo4uMLoIsnqsTlIromEBOEUJKlW3olw1TZbBHPzmL
         VSbg==
X-Gm-Message-State: AOJu0YygDaDt/f9wUsJt8cnkP+QOryg1LdlXuEQqI0T29w2+jwl7VYIU
	FdL2A/BiBXWpXN/IvHYJemq0V/SjGjjGtFph2ssGVatmA+aiI2AOAxYbmLagbSkAl8ilUMKn0vU
	RsTCzk+v2Pc7EVpEueuRw71O8hLiKnL6Ng0wjnc+MSR6dQYBGPF7ggVbe3H8vmmuNNxjf
X-Gm-Gg: ASbGncsTt6K/FCr0vPQQbTXT17Vbwh8cv9oEcEkhrR2aB5X9pI49Zp0IHh6RuE7V8kE
	HMACIvF/FaM/xdGO1j2CYn1AZIZuQKcsH19QOuxvLDU0DDqjmFINiKAc7HbppUwJm6lCHokqjtD
	CD3uhspANYVLYhk5Pj1lUz2znVy7YTRP+pnsT9rBl8IusZRI6e3ZnHmiIZTyIm+LYM9B7zsuofs
	ZdFZFwgE9ima3lutaqhPc5E2baUL4HyZGpUaI2RzPgcYURfnAgiHelFkDtkZTXvd30/TCaqAtwP
	KwWkArFCP6DPRN2wQ9LZvr2nSHdC1ypRRm/mb4YqwbQMnMX3UAewB90VF49mW7Q=
X-Received: by 2002:a17:903:1210:b0:234:595d:a58e with SMTP id d9443c01a7336-23dd1b589a1mr35282105ad.25.1751969960541;
        Tue, 08 Jul 2025 03:19:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2oy1IXFK4dnroISXWo5wvI3d7wBIDcdWSD2jINsA5MIuiH/xfR8VKPwrv2hUqbyGnVX8j/A==
X-Received: by 2002:a17:903:1210:b0:234:595d:a58e with SMTP id d9443c01a7336-23dd1b589a1mr35281825ad.25.1751969960142;
        Tue, 08 Jul 2025 03:19:20 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455d259sm115856215ad.116.2025.07.08.03.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jul 2025 03:19:19 -0700 (PDT)
Message-ID: <c22172c5-7794-4f88-931a-c578c906d91c@oss.qualcomm.com>
Date: Tue, 8 Jul 2025 15:49:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: ipq8074: Add the IMEM node
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250708-imem-v2-0-692eb92b228e@oss.qualcomm.com>
 <20250708-imem-v2-2-692eb92b228e@oss.qualcomm.com>
 <e7ad63b7-523d-4193-97b8-d33601de78f6@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <e7ad63b7-523d-4193-97b8-d33601de78f6@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686cf0a9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6ADn6bbprC_h0No-RiwA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: O20rp8z9JKTDYhNhtjzLZGVdG1B40oGA
X-Proofpoint-ORIG-GUID: O20rp8z9JKTDYhNhtjzLZGVdG1B40oGA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA4NCBTYWx0ZWRfX49rGpIstMaWn
 5tQIfichqnnBaijwmgl43H9No4l8nB823oPEWAnGEBptf1mO13JtU6rNsWNMKro07xeHnz3AS+Z
 FV/mBQOyRqEtiHGdBfBgyWoSlJ04KvTH3OJV+JQ0VPU/aIXJDg9MGu3ydxiY5B0DkhRE5lAUeKk
 JB7E3oj73bwX6AR8/7AvRh+8xE4g/TVIK0lWO+C88S8for6n1jYCl4kV9JNX+I98G0B13YYUxd9
 yhIkIjnFBFRIUxDOpJ3ntCMJ4FD5KMB4v0MGvsYAgAlFvs8v+R+K6xaWOCEpetdS+Rw2gUEVigY
 MHXTBDZA/fidt0zGkmh3rjioMhA+d9+Wb3BYuAovCo3WrK2olW1xuaMTC0sRuHArowCvgz6ZHu5
 IVD0J2PnAgmBDGM+xZ1jC3QCbygU7wT1OgkN5Ssyb0kcTfD9Mjzeducyb4Jggb75wivs6Y5+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=725 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080084


On 7/8/2025 12:17 PM, Krzysztof Kozlowski wrote:
> On 08/07/2025 07:39, Kathiravan Thirumoorthy wrote:
>> Add the IMEM node to the device tree to extract debugging information
>> like system restart reason, which is populated via IMEM. Define the
>> IMEM region to enable this functionality.
>>
>> As described, overall IMEM region is 24KB but only initial 4KB is
>> accessible by all masters in the SoC.
>>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>> Changes in v2:
>> - Rounded off the size to 0x6000 (Konrad)
>> ---
>>   arch/arm64/boot/dts/qcom/ipq8074.dtsi | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> index fffb47ec244899cf45984adbe8c4f9820bef5c5f..2ba07a02c222958b924c5bc178ac67f955088f7a 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
>> @@ -625,6 +625,15 @@ qpic_nand: nand-controller@79b0000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		sram@8600000 {
>> +			compatible = "qcom,ipq8074-imem", "syscon", "simple-mfd";
>
> It is still not simple-mfd. You should post complete node with children
> or do not make it a simple-mfd.


Sure. Based on the outcome of the series[1], will update it.

[1] 
https://lore.kernel.org/linux-arm-msm/073480a2-0b6f-4dc0-b7eb-eec500b3106e@oss.qualcomm.com/


>
> Best regards,
> Krzysztof

