Return-Path: <linux-arm-msm+bounces-53964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CA2A857A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 11:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C6E9444C58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 09:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2852980C1;
	Fri, 11 Apr 2025 09:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+nyk4Zc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8583B1D86F7
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 09:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744362772; cv=none; b=PJlerPDr4VULf80OvoCzb3CskaNRlbKjla1rVDESyD7ORWtuVlDAIOLayWeT0QL6KfVkTRtQ+xwMJRwOEoV/kAbjjs1wL2yyUVP07cDEA3NkpnAGh5UP/3anHXm8yT7NzYffyjTQ/iFOKq/Urk8gJklloUPbPJlHRSW+6urqUzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744362772; c=relaxed/simple;
	bh=J7XDaq6Fzcu3LKJgn3em7G0dQjSod3759TenPNx4+KU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YpdBQ8PsygHXSQu3DiZd9y8wKuLOQu4Lp/jR1VEyasvLB3/GjWwdEUwGvZcP1csIOwfOXLZc2sMzKqlXACD1g3ROX3LAOQ0wCmeieAsco+Unbu50aY4mUtAVbTMfgcFfVznpkR/fbNd2z+SuxREv/zHq3n2kIB9u1uXdEc8B7Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+nyk4Zc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5FoNW014062
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 09:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G3HOluKqctPwQrSo4G7IAe5B5gxHuXZ3+l/nljxHsY4=; b=S+nyk4ZcqTEsFn+l
	o9FKgCU3PPn0Mqv7Mwei4uS3LwrU71lY5eoM9JX0EHW/vXGyeD7j/2N3N6CvIbJ4
	cDO6/byWpEgZRgDamr39HNCwsOw8KzjcgINXgFHLD1NmndOrRNesK50YlyT2clzT
	UDSf7MMVb6bbJooN5vsgGbAaQXBrbJRgrEyMg49OLsc+FqHhv9FLFx2CY7QweiyM
	U7EAfsMJXiirxVETcs8wkbOJjVYSRcy4GX+PPDiBYh+wU3mIUi6AVItHODvDtpg5
	JgycD/YjdgasdxkJWYfoFoOkOv7HucIiMw6nWYwZCjMrz7vNAASyCjWQei7UAhKd
	wAsQGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbehwv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 09:12:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5af539464so48535885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 02:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744362767; x=1744967567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G3HOluKqctPwQrSo4G7IAe5B5gxHuXZ3+l/nljxHsY4=;
        b=St1TTjahHh8tLHd0jlqORDSmowY7x0GHaz1qi+3maN/DAGcEhCF5qYilZiXflGdJKj
         0gDjMPeXG3V3VLeV/W+SozCxzE+hYljVt3e5BXXHoBuDqgJqRR2JUvGSDnH1J7ZNAD/n
         wgZIoHPxBkvUkDGU4Y/zE3hGZNv5/EmcjgdUYO2/Qhr8WQMi1+X5/275WREY6VHr7Rsc
         DcT2Q632V2k6TpGaU1mgvCXbv5qLISsS4Syjtzw9QwWqXdQMhhV7+dmqFurqThdO5x4C
         R0ia8H5Z3wB7cVy1dBAhtd5ikNNtqPTjQRlIvURtKAzwDwABLLsPthmWsxQHaYXSIAUm
         Dsnw==
X-Forwarded-Encrypted: i=1; AJvYcCVE32Qz+rvdVk0QQtdszKe+Ze45TK0P/tzNtv+oy2FLKVPe3euA0/iEchARZG52rRRXHFhtPsWUBLB1uwaC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6isvzma4MuXHe8vsVpLWJ5hzTGG8Emr7/nzY1/ehAQorCUmXk
	/eFoPADdSdLIQKwbnckTxPT887F2TizzuL2hhqAJe/bWiZM2fiz5uurdOo9mhlcIF/dmS/hK3lW
	fUse0RkKQysoB2bS0Nz44zPTktz/ppxqLRh1SlarOATER1Mv5cCBAzbI8G2WgzgL9
X-Gm-Gg: ASbGncssDz0HLL6IB1uIYRJeBv8OxacN8pToBI77d6dOO2VAUCIrRJQBW7ag15RuUhx
	8oV4ViUQU64kvzwxTEjRHBeZWymOHrcuhfefVs/YZeIqjVx5hFdY3XVzEiQWJyH9yHF2jATVECd
	CPHSCaiNvFFd+5tPQZV0HE7RoRYoAzRhbAw1ihfgvn3OmzubV5CRWm1aL3a4ALRkBOaVTR+/rSg
	ECDji2gnTLcEbEUdBKe45hE0Znb+R9e9msoAeuljuAQM9BWD+8KdM1CM7PIFCEF+tHULAAbotop
	XqQhml3poEF4jzDw8PZPBL1xp87jbjLKKzQJ0JmRRS3OvessLQSMrjxXcY6UIKdmLA==
X-Received: by 2002:a05:620a:45a4:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7c7b1ae7e0bmr43740985a.11.1744362767337;
        Fri, 11 Apr 2025 02:12:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVK0+xVb3bjCDWjDFB+3HJHEQTn3mmJWfagdLHaEIdyk0IFFuKB6mjJY1EF99mfmbRJ8LZqw==
X-Received: by 2002:a05:620a:45a4:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7c7b1ae7e0bmr43738185a.11.1744362766919;
        Fri, 11 Apr 2025 02:12:46 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ef5653bsm708672a12.20.2025.04.11.02.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:12:46 -0700 (PDT)
Message-ID: <e3dda8bf-e19e-4dde-83a4-7876ca81e5e6@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 11:12:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm6350: Add video clock
 controller
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
 <20250324-sm6350-videocc-v2-4-cc22386433f4@fairphone.com>
 <1c09fee5-9626-4540-83fb-6d90db2ce595@oss.qualcomm.com>
 <9eb6dfd7-2716-4150-9392-98e26892d82d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9eb6dfd7-2716-4150-9392-98e26892d82d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: coKZUn5FeteTzLnBLEcQ81_BG6qpFEKM
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f8dd10 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=6H0WHjuAAAAA:8 a=xtG956_-b98l_g2qRQ4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: coKZUn5FeteTzLnBLEcQ81_BG6qpFEKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110056

On 4/11/25 9:15 AM, Jagadeesh Kona wrote:
> 
> 
> On 4/1/2025 10:03 PM, Konrad Dybcio wrote:
>> On 3/24/25 9:41 AM, Luca Weiss wrote:
>>> Add a node for the videocc found on the SM6350 SoC.
>>>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> index 42f9d16c2fa6da66a8bb524a33c2687a1e4b40e0..4498d6dfd61a7e30a050a8654d54dae2d06c220c 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>>> @@ -1952,6 +1952,20 @@ usb_1_dwc3_ss_out: endpoint {
>>>  			};
>>>  		};
>>>  
>>> +		videocc: clock-controller@aaf0000 {
>>> +			compatible = "qcom,sm6350-videocc";
>>> +			reg = <0x0 0x0aaf0000 0x0 0x10000>;
>>> +			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
>>> +				 <&rpmhcc RPMH_CXO_CLK>,
>>> +				 <&sleep_clk>;
>>> +			clock-names = "iface",
>>> +				      "bi_tcxo",
>>> +				      "sleep_clk";
>>> +			#clock-cells = <1>;
>>> +			#reset-cells = <1>;
>>> +			#power-domain-cells = <1>;
>>> +		};
>>
>> You'll probably want to hook up some additional power domains here, see
>>
>> https://lore.kernel.org/linux-arm-msm/20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com/
>>
> 
> On SM6350, videocc doesn't need multiple power domains at HW level, it is only on CX rail which would be ON
> when system is active, hence power-domains are not mandatory here.

6350 doesn't have either MMCX nor a split MX - shouldn't both normal
CX and MX be in there?

Konrad

