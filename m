Return-Path: <linux-arm-msm+bounces-65019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76172B057CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 12:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE85E18885B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 10:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D511E2D8380;
	Tue, 15 Jul 2025 10:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XwLT4iIj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C771A314E
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752575343; cv=none; b=Xqm0+VugD8tuEMzZUEVxT9KiYu3Yi6KE7M+WWB1uWm/0anunoVnZkBt1Xhw4ztzWOXI9tZ1zqh6XvTmP6GcAxQFmTpvsWv3kxA1PowtefVonqcR5DXF4/jVcsGj/5THhl+fsTIQB2NHpIUVPsyMwdho4CRxpIc1yTLIObJBvloU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752575343; c=relaxed/simple;
	bh=ZEgO3lH2hzHF//JMtK2ZnM6seDwOMGELOQYhm4cdrYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H9JzKwJkKXF/1g3jEEV5sqhHlK/WVvUm7av5AYDldX2zRdxkhWF4c4zqKjMMhDSySDM0k1vy4qtprmVN+LGG7YKKPNkk7eEM/3jR5RekcOz9CJHSffY3AC6Arh7h1rEMig53AttpPmBrOSmcGZsqJaCXqsEAiWtVqF59dMCfE04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XwLT4iIj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F8nOQU002934
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kVPowsM+d6fWRiJIvpglMMopG/Q1tPU3fDdYNGxzkiA=; b=XwLT4iIjkAhIa174
	rsto9PPMC/1uXlY8m1M9YljnX2GGpbe0WJZo5GgSfaxAu+UYAOSK05uFrFsSTjRQ
	rOsn6mqi+QCzC6hCE+i9o4l2bIANERU7kgvKD66zCY/8CRbTHFt2F6q8R8svb89k
	O8RleXYSIXWC/gA7szwkZYaSX6d52KVRLa26lD9l7fxmGssbVchqVEa2IoNptm4s
	RZ/Ga8Kr6zaasvgkVQojMcY9VbQz3am8F6MqPYnjsg4Bqog0c5RzgY8nWNKQjVZb
	imuyAC35d5mmRcZcCtrr16hA2DWS3eVWhmGwjWABPW5iJ7C6qokbOaEcMrJXw3Xs
	xh2Slw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufut7qr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 10:29:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2356ce55d33so80590285ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 03:29:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752575340; x=1753180140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kVPowsM+d6fWRiJIvpglMMopG/Q1tPU3fDdYNGxzkiA=;
        b=N4wAtSXVtkgFQvFYco7gEo2dEFmoMa2yjf/wtgv0yLzE/WuB6JdKB5Wl4vXC6W5TPf
         KzoGgZaUcvwzF7DGszosp4ZnUGFzj9jGj14peuteGjYWIW7L78gxgHY1Bj7HZPfZrWlr
         88K7HqIdmSZm3ACZE2a7PSiKvUsIHyll8GugbQUa/N98NSYBIgZRjsOsPTjgOoME4wV/
         ygd72xqpoLoH1JBB4sRSTD+oKShyrBaTrvgBFNHaSIAp1cSQFbhB1sUARyLZPmo5OphT
         MZQMpiTTvIbzq/XaYkj80+bifUzEq8UuK0yEeVgE/9BFISRQQ9u+W3n3aGdIPOGc9QJF
         wZAQ==
X-Gm-Message-State: AOJu0YzFa+FqCDBzdNMa7xSCQhUqKFijfdvan9S1Irpqh/YqQSLGRwnD
	VgMTlmSQJmJjzIR7ieKZXiT0eKjxYDF6qTAzqb2stOZU+rRlpTAAQL+H+m+H87oUYtN9Ir5g1gx
	ZuVNZoCcoSq507OGH2jH21YpDsb5LfK9Hx1YU1I092JyVP2Y8EgszV7IXO05kJzcSX3nUCNGAWg
	rY
X-Gm-Gg: ASbGnctvZV6lpBDtGVJTHyjUz+seIf/GHqQhl32V3rzxqtfAIe8uDjCA2Z6cLc06Q2+
	+xSfMAk6x9BCc6XJ5gNno8JVmMoqiEV5lt31gL6EIuE2y4glpAcNOdc7oYx7GXKZKOqNsXObzn+
	tZaecyTVV1rYfXknzIUSkVF06XmECjlXz7g2q0rVuz2XyHOo+YnAidIEb9yqlL1TkCxuYC0HVMg
	7wMpUVywNZI0ZOSKwcYwdremSQ1O+OSiViWBXsPxBv8u8PACuMDs+JJtk/U0Kg6iUw6vgDCDDRP
	eKfQiemRR9FNoBORlIG8YpuumJ6lPIsxIsRlCnM2tvVjacVJfcoaBRojODP+5KLoFFcE
X-Received: by 2002:a17:902:ce12:b0:235:88b:2d06 with SMTP id d9443c01a7336-23dede2d033mr232140935ad.6.1752575339765;
        Tue, 15 Jul 2025 03:28:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQvHlIm2ZFVg3ms0rTHfqoxKjFKkIFJO3VSd6Oiellb8AgeQMN/4FVNCtTp9DnyuFnHGFROg==
X-Received: by 2002:a17:902:ce12:b0:235:88b:2d06 with SMTP id d9443c01a7336-23dede2d033mr232140505ad.6.1752575339226;
        Tue, 15 Jul 2025 03:28:59 -0700 (PDT)
Received: from [10.217.217.109] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322df2sm107059075ad.111.2025.07.15.03.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 03:28:58 -0700 (PDT)
Message-ID: <be19d5d8-c94b-4262-9ba6-84f231911142@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 15:58:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250714-b4-sm8750-iris-dts-v1-0-93629b246d2e@linaro.org>
 <20250714-b4-sm8750-iris-dts-v1-1-93629b246d2e@linaro.org>
 <5dd36649-821c-450e-bdcc-871735d10059@linaro.org>
 <15b8b9e0-a211-4102-9b68-994c8ab50a7a@linaro.org>
 <b5a68138-4eca-4bdd-8f72-d80236b02c0a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <b5a68138-4eca-4bdd-8f72-d80236b02c0a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e7gGSbp/ c=1 sm=1 tr=0 ts=68762d6d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=sUZyiCKN5GdxPoJR-UsA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 7eG-YySEvprYyw-o1rK8lVM624Tae15K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA5NSBTYWx0ZWRfXwMRTtLyqRwmY
 ksVzsz3x4ipzkEyl+sdpA8mls8N4Qqyl1cJoEFMzaQ9eyQ/Gw33mrvoW5GP1GZ5dltVbSZDFbnr
 GaS6Jb/v09Lq/3FSYztikSJwp0f7JS3KqGHYDChKICSrMM+FPmr/LnGyW0F4ywkJbhF33RX2lqM
 S9Yj9vz4d64+1k5amkgTQyLoFNvqOdaQZSPNaeq5YZHYZ1t/kziF0s2N9k7mc4szfWaGVFdY7h6
 Rc3PqfvQVXrjOw3hlMbwfHDvTLa3spKINjA5L2fC3j5Q6uKSngNas5Gc5vCwMNuYtfcVG6ZqxBt
 jaXnD4OvaNnCzCmlZ0LsraMkYJVGfeek75OrYS/dNblcmGY+riIpbAOQp6XX171QH5Nu1EsruZr
 A5LaLqQKGcnyrH8sxpzzvzaYcCi+7p9WiBAhDo68W3JwlcbShFwmX71nFn3Ci/FyDm86Cf0r
X-Proofpoint-ORIG-GUID: 7eG-YySEvprYyw-o1rK8lVM624Tae15K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1011 adultscore=0
 malwarescore=0 mlxlogscore=773 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150095



On 7/15/2025 3:39 PM, Konrad Dybcio wrote:
> On 7/15/25 12:07 PM, Krzysztof Kozlowski wrote:
>> On 15/07/2025 11:32, Krzysztof Kozlowski wrote:
>>> On 14/07/2025 15:55, Krzysztof Kozlowski wrote:
>>>> +
>>>> +		videocc: clock-controller@aaf0000 {
>>>> +			compatible = "qcom,sm8750-videocc";
>>>> +			reg = <0x0 0x0aaf0000 0x0 0x10000>;
>>>> +			clocks = <&bi_tcxo_div2>,
>>>> +				 <&gcc GCC_VIDEO_AHB_CLK>;
>>>> +			power-domains = <&rpmhpd RPMHPD_MMCX>;
>>>
>>> This is incomplete, need second power domain and I did not check against
>>> qcom,sm8750-videocc schema before sending. I will send a v2 a bit later
>>> (maybe some reviews pop up).
>>
>> Heh, no. The DTS here is correct. The videocc bindings are not correct
>> (and that's not my patch).
> 
> Well, you want two power domains here in either case..
> 

Videocc code changes are yet to be sent with the fixes.


-- 
Thanks,
Taniya Das


