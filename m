Return-Path: <linux-arm-msm+bounces-89343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AB5D2E170
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 09:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EE443048177
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 08:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860E5305E21;
	Fri, 16 Jan 2026 08:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hXabDyZ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OvsjcRNM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85E62F6903
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768552471; cv=none; b=rqmhDRYjFI4kvIwlK46drDYFcIhaoVfd6ii9HdG4NL/vGJlfcnOtvwP2TUfiqZRss3GmE/kMYGxwjA3lK4tTV66K9QlpOizDlgk+F7FstoqFWP8u3/GPgcjItbmYVo5OgvPF5+NXKj7A8QseryKDHHz9ChMyKxe0zxeJ29BG4WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768552471; c=relaxed/simple;
	bh=AgvUAbPqleTF+bvSeUFP5QtroUDWiTtUGgc/oDofEmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UxkbjgZde6UlnBNn5GlWIlvfE4l2A3RVeRDvBRkJr1F7alneb/phtShEiwaqbCnTB+4VRyO6C0GeM6tPEWPmcva20MQkB5Ta2R0HDS3ZuPjxBIocsoYtanchUCW0WUY2IVg2k8GcBeCxh5Sdv/Yt1EG+xQIyNo1LN6jETb0kEiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hXabDyZ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OvsjcRNM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G7watk3074974
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M09NfFq7Qcp5En4G04EchSnWL0qU/hS/cGMF+zc9G4A=; b=hXabDyZ2TBeZlXXl
	jtP4nYTQsqMYMs0HOxPMXQKxc5YWG3YEVmVG0XPQea7fMtB48UK1BccRr6uiK936
	WhJEBKipMvfECaxR9Tdd/macY8/LIVjUpElvrjSm5ujg2shuoK62Wa0X+YHnxXuR
	NcNxAU7DBYhlCysvPpB3/q5/o7EvSzgrSWzWknJcmr60KeSQ6kPKPBpUKTz1tv3Q
	DhaTBsnI40+XXZfd0FwPcWMCYOJJjAcyET/5nWzrikGtF+QmwOoCCa4Fbm9M9C26
	lifaKVDY5VbPHvQqxxGkgaXMkrXtoDt7Fs9wrkaVT8fjNCn7AzeY8TrUYOiO5C/t
	WzMOYw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq98jsedy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 08:34:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a3929171bso38839296d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 00:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768552467; x=1769157267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M09NfFq7Qcp5En4G04EchSnWL0qU/hS/cGMF+zc9G4A=;
        b=OvsjcRNMTtNamHHATkeO2KDWd/q3RDcFyd5ulJzWkTpESCSy3R/exGzGXxsl1OEClk
         hsuUjIFYUGJBBCnrKg/z4aJtPXhOD0bGTDYEkRecCEs6Tr1O0Ve3Pf9ZRmDi2SVgEkg1
         PTHDd6i4qi1/JNYeHmmqWhiw5h3KCC/pyZicLIVLi/s6Cu6qElWqwNmT5LK9oAnm/26V
         kuTgztEV/TPW+Fy/+pZ7vSZ/WP9ShPQIj67cJfg69CAqOmwWYKaDZNdbkfZVq31jWwbR
         FzlPiH12Upz8L1lOpjFdAk40U5V1OsJ3W3qOveJPNBrMPZqTBHGYWfmkeY3QDAfC3ITf
         IefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768552467; x=1769157267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M09NfFq7Qcp5En4G04EchSnWL0qU/hS/cGMF+zc9G4A=;
        b=huGWPQZmLQr7+6nG1IGVzLXYl7wD2QH6q3k9qOyxd3GSl/DKTIYcPJK6TldyzZwb2R
         PDijW0f4zVS1SHPwjCHlieDFxlopNo3N8dTjeeS+eoMX3ukDaVPw2ctuzYYc+amDxjnM
         2/qRWtitHzagmNV6AG4go0brkclcUebrAmc24vH/7EhZpTD/s3I7rs3x2V5Lii2I57QF
         G9abm6QCnwLz7PuoM8riwb5Z9wZ2xgKR9DzIBOQxNLvwc7uEJcCrb8dGfC9sxoh58mSK
         FZcbRg4KVXlI49OONiKYRLPY8BzjV5p3sRX+nz69WYEhxZaJARpw4Wr1/assymjjrLlM
         rhHA==
X-Forwarded-Encrypted: i=1; AJvYcCWNW6Fp1ywFX2VF/DpLUIPa69+rwCgEOTui/pdMFpaXSFFZT1V5Zez0iyWA71icHBAo1QR5Y1g00ANjIZjF@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd9ZENrN5CAysMeL7MYdmNDTRVwkuAlwZVPsz6EC7Fti9yPV+4
	7hMkvTvuHKzfsd6ubysMZisWBN49Iol4K129Y8Rrn/2Zb19wMZn5NYavz8V3dvA+uC1sCZkp+51
	ShwjlMjXpv4zvabp55LDW0bCscjHjeEkzlWoXNo9gL0vAuRYdKDJq2j0qY+Lp9pchdn9F
X-Gm-Gg: AY/fxX61brd89bZSg+Hvg9PtcYpS2zG/l7VUiectt+i3Rj0fs17yyiyus0OthRC8BW/
	xEII7TQve/BGPLYg7Sx4DEAiY5vG9zF24doiPASDpN9LRaVcmH405ZO1iWJaj3QpJQGFj1BnoZd
	c9kKFhstMw/HHFgaVb/so9WTkiDYdl0F7lfrXFtKD0O+21x3J2LjjXMcxdugeuq7N34OG3n0jn8
	6BLcUqHyMm92Ko9FTRzDsgt/0rqe6STnzl4NKVW190s2rNSxQARdY/baFoDaVhMAEJ3fW0DCiJK
	lfQXjWYjwSzEQIj1hIyDiNfbl9uQmerKmb+9FQ8s7QOCugW157xtjtdHitZqR3okf+3tRlWHqwS
	AdzM6i9WgqrmT2p1njkT2PTJ8CXkSV61ZHVI5VNisWOdn20HyLYpT1vTpHKmpq7WW+6I4WOHoyw
	==
X-Received: by 2002:a05:6214:130e:b0:786:8f81:42f with SMTP id 6a1803df08f44-8942dd88ec0mr34294976d6.39.1768552467171;
        Fri, 16 Jan 2026 00:34:27 -0800 (PST)
X-Received: by 2002:a05:6214:130e:b0:786:8f81:42f with SMTP id 6a1803df08f44-8942dd88ec0mr34294616d6.39.1768552466704;
        Fri, 16 Jan 2026 00:34:26 -0800 (PST)
Received: from [10.111.171.115] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6040casm19565916d6.21.2026.01.16.00.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 00:34:25 -0800 (PST)
Message-ID: <025cefd3-888b-4744-bde3-2d5c007db66f@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 16:34:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] dt-bindings: i2c: qcom-cci: Document sm6150
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
 <20260115-sm6150_evk-v3-2-81526dd15543@oss.qualcomm.com>
 <20260116-malachite-spaniel-of-refinement-af22ae@quoll>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260116-malachite-spaniel-of-refinement-af22ae@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=asW/yCZV c=1 sm=1 tr=0 ts=6969f813 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=-6nChnoGJk84s89d4NQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rhPDEqm-x6XIpQEkAubg9HSI-ZQlA66r
X-Proofpoint-GUID: rhPDEqm-x6XIpQEkAubg9HSI-ZQlA66r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA2MSBTYWx0ZWRfX5kGRtBE6Ev+V
 YgansP87NxGY7ZoUW9EowElCQ/t8xKuHtQWA+VuPVuyelkhNbw8D6VHmfGxMYJrUoY4lIx8k0FI
 Ytjh6HLdPbvSuPwZwHG9e4ZJojOEQbkkPzRPeB9v3akDoYoXDK9RMk8GRC94hvVnr5BLPF6D8Z0
 igeoSPIjbuPuHdgAAZ5lUEaJzN1IVXQs3yy1teH0VAiRGnlifFEqimbxxVIi2rlTFOh/tZ+ahpb
 T5O7K1j+Mru8Osq8RpbCAVgpyQwK2Elv5gHtpmhcNrvHtk3GutVkqcREGiAavK+WlNdVni00amk
 ONewISq6yQhBHG85TJKN6fqObHTikr3JDEyQL9kuIl2qUw63DKkFoAVrRENKFxF1HVxNTmz/5q8
 MRYSzZj8HZmMhpdJn+b9sOyoM75yeHjR0+n8hj2MWFNt8Y3OWhFDrKV7smyWBiZ8bhEQvBvt6UY
 oR0M7/eGU/VwosLAPpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160061



On 1/16/2026 4:28 PM, Krzysztof Kozlowski wrote:
> On Thu, Jan 15, 2026 at 06:12:38PM +0800, Wenmeng Liu wrote:
>> Add the sm6150 CCI device string compatible.
>>
>> SM6150 include three clock:
>> bus: Bus clock responsible for data transfer.
>> iface: Interface clock responsible for register read and write.
>> cci: Clock for CCI core operations.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml          | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> index a3fe1eea6aece9685674feaa5ec53765c1ce23d8..3472670fdc908ef8f3b3afc68ff437c0435b69a7 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
>> @@ -33,6 +33,7 @@ properties:
>>                 - qcom,sc8280xp-cci
>>                 - qcom,sdm670-cci
>>                 - qcom,sdm845-cci
>> +              - qcom,sm6150-cci
>>                 - qcom,sm6350-cci
>>                 - qcom,sm8250-cci
>>                 - qcom,sm8450-cci
>> @@ -263,6 +264,23 @@ allOf:
>>               - const: cpas_ahb
>>               - const: cci
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sm6150-cci
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 3
>> +          maxItems: 3
>> +        clock-names:
>> +          items:
>> +            - const: bus
>> +            - const: iface
>> +            - const: cci
> 
> So basically the same as camnoc_axi+cpas_ahb+cci, so just put it into
> existing enum with qcom,sm8550-cci.
> 
> I asked for this at v1.
> https://lore.kernel.org/all/43efa6fd-53c3-4680-8aca-7b37089ca295@kernel.org/
> 
> 
> Best regards,
> Krzysztof
> 
I raised this question in the previous version.
And got reply as:


---
me:

+                       clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+                                <&camcc CAM_CC_CPAS_AHB_CLK>,
+                                <&camcc CAM_CC_CCI_CLK>;
+                       clock-names = "camnoc_axi",
+                                     "cpas_ahb",
+                                     "cci";


         clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
         clock-names = "camnoc_axi";

If this is acceptable, I will update it this way in the next version.
---
Loic:

No, the idea is to name the clock from the device’s perspective.
For example, from the CCI perspective, you typically have:
- A core clock, clocking the logic, which could be named 'core' (but
'cci' here is ok)
- Clocks related to the bus interfaces (such as AHB or AXI), which
could be named 'iface...' or 'bus...'.

This approach clearly identifies the role of each clock and keeps
naming consistent, without depending on where the clock originates or
its source name.

 From that standpoint, some of the existing bus clock names defined in
qcom,i2c-cci.yaml are not ideal. You can find better naming in bindings
like qcom,i2c-qup.yaml or qcom,i2c-geni-qcom.yaml.
---


         clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
         clock-names = "camnoc_axi";

so is this acceptable?


Thanks,
Wenmeng




