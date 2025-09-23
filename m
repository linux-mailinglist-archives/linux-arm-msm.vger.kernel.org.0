Return-Path: <linux-arm-msm+bounces-74544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E73B975F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 21:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5DC37B0967
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 19:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E51302CB2;
	Tue, 23 Sep 2025 19:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ixd2zA1N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E272DC33B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 19:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758656219; cv=none; b=uJKIV3jEY8vf20nbq3nv9r7ILFoLSHPuBNhSMpFiEDlCwUZT9+9jJZZlTSymLtFTyZNgzEob1vEzgeKLEtfb3+RLvEufvp0BkSYVF3f6+vi0WTWzo955qQeW6e1D0/1s5GBtLwT1k2b4OTKlPJRJctjg1SRbtcj1HRoxD21zjN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758656219; c=relaxed/simple;
	bh=1iqe1y2ibI+fHdNR9WdsYwRbrTafRFMRYIggoMNDtII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XCnTsClxvrShQu9pmUeqoENGYkCL3hNL0tl59bEV9yYO1X/KYLW0K3utKZOQ9udJef/6mBhiGO8Cq9cB7zIHBdsUETjqQHGWPnA8dYk2rUcN2OAKQYl/5FJfKo2A21Ov35tjLIfysRoAnrbBcb9vlKzz8Y7eqn58Y3JcM4mIUnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ixd2zA1N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NEpoRw014597
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 19:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aJneKB6KUlYtnPIPcPrOqQOo+8uP80oakK/pn7zFJCw=; b=ixd2zA1NnKzqnOhq
	d2ZzEpMjcuwg+2EHlZrLhD8oW9qTrB7WEKcN6uiBS9yzBJL81zzoF79Z46pj3Yev
	Wfq6KidPBDuUDUgq+1SPcO9qXZdSfyXugG/yGi+SpJTTsXn1hIFKfi71D33lRw3w
	BBzPWnTxHDuGMG0IABoE1Xl8mZkqutkvketAZXxdsFFKNw797+VM2X2k8sOJbRIO
	JYUFDiinEErxwpPb6jqrXV5pOtNxgeDZ1PjifQSObGwhNO6MnJ3ikpAOXd2G+HMG
	hAmFe3klh7x8gTlUlo37/ivHd4RWAMVV5lwoQhGQ+Dt/RP97nqVE3BVI6BeHTd3B
	V/3/RA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp08vnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 19:36:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77f3aa0f770so4517171b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 12:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758656215; x=1759261015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aJneKB6KUlYtnPIPcPrOqQOo+8uP80oakK/pn7zFJCw=;
        b=DRe1PLBTe3Fod12DqRerHt1xNyLD7nZw3qCNtpyyVmNhKisvvTHHKdSOCZ3sc62vTw
         Ln36L804cG8rZuykpS23qnLP+l1ijaBJduWY8ilznQa8kUo0vKT51WhMft+tAZbrR2RX
         rYkXWB29dvD1hrXLtb1YeKT1sdM+Hc6ae+2nyngnMjQ+TER5QfSNQzlDYOB4ueoI4WET
         ju/rBU+3S0UTVYWZgmVyQw+6Wioh8A1sLXwCLaq4E6//ZWyUXyxEhFTz90uL8dAJEJ+u
         I67ih9RLr1gHdJb2MiECaHbRK4LAxTQeBboznS/+sKI/ii5pTqO+MxqdjJpRLQScmXN/
         tNaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg4o79dRBZCaM2HKxRLTNW0eAVrgR/u2ueQJN6yOri4j78ji+tDHWeda99YQYXRf7LXezJzwfgMEqrDl9K@vger.kernel.org
X-Gm-Message-State: AOJu0YwuLqEkGqEwbjEBHfUl7fUh1kHwTq8KRbbdDZvgbCN7tIkZ0Cy0
	O3Ow3UriFm+Xt2i62yZ5aoypS5gh5D8lVOpRX2x48n5/VUGL2fvH98Ov5kfQeR7zLHP1wS28W5x
	QPW40X5XANlVmBAlvuOcQiKsPTNyquaCLik/mZhxcaVySn+F+6R1rgH2vGBciJSyd0KR2
X-Gm-Gg: ASbGncuHu9ptEXX312D6pTfBQPN6lM8MbLHv8D1o0eqAjmRai8XtcVmH1Yd0fz+iewA
	6G47mb3B3QeiK8gwEOW3EAXSbbUOrDaDrAvGrxP5ZxQLtaJPxujX4JWyej2CT/rcwTLopIcXn5D
	QSzRJYfpNMKa8JNPXPapVn7ExzrDtYrj78298a9CeXnzggOV1PmuHqhjU2BS5x2BbFDup8cytXQ
	beYE3Bft/+yRxaj7a0ws985uCdiS5f/8gMpiSwuoAE+kSM0xhM3Zj2XpiYNtnrx1gW1U6HW5Kvy
	Uh8D7QNmDueXsjJEviOxuEZNuQLMqfe24wImmBjSRvXHZSbMFXVl9yDE70NrnVVAfCiNCmZkrVP
	7kU/SoA==
X-Received: by 2002:a05:6a20:3d1c:b0:2ac:7567:c069 with SMTP id adf61e73a8af0-2cfdac2f25fmr5659668637.17.1758656215462;
        Tue, 23 Sep 2025 12:36:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS/UpqR/9Of4sY1TBzz+iudIRPwp/SAd9XDBUzr/RWXOhBvNioYOHJ1X+iG1pgZNxz8t6Mhg==
X-Received: by 2002:a05:6a20:3d1c:b0:2ac:7567:c069 with SMTP id adf61e73a8af0-2cfdac2f25fmr5659637637.17.1758656215026;
        Tue, 23 Sep 2025 12:36:55 -0700 (PDT)
Received: from [10.73.52.96] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f315254edsm7397688b3a.84.2025.09.23.12.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 12:36:54 -0700 (PDT)
Message-ID: <f1b53a1b-ff29-38a9-db54-8acfd1abac7b@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 12:36:52 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/9] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI
 PHY compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-3-wesley.cheng@oss.qualcomm.com>
 <7gvp6pshp4eiugk3qodg2ub3azu365loturidbkxqly6nhtgq7@bxnkxeqzarkv>
 <4116b593-d36d-df10-6101-4e3539b8b812@oss.qualcomm.com>
 <pvma73qs7msh2qkoaqhfv5v57f3asduuutwf73ceyrxbpsv4sl@fd6fs6yrfjp7>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <pvma73qs7msh2qkoaqhfv5v57f3asduuutwf73ceyrxbpsv4sl@fd6fs6yrfjp7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d2f6d8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=ySdWX0gGKps6jh8XKZoA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: A7dD8MvVOXsqAehHiPLSdMNUBZ13E5UF
X-Proofpoint-ORIG-GUID: A7dD8MvVOXsqAehHiPLSdMNUBZ13E5UF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX+5hNg8iGM1J+
 aAWvL3XOUC7mZ0tLblj4QSb0MPnuaHbS2YWvt5V2eeMEzRcFB63MZJ0QRCdFhUMhu+q04rp7Qbo
 8XCw4bAvbyoWCpqttPudoIIdBNDNb4qaeNXAhSdoGSFx7/RfcUsPSPlheDwdsZB9IWczbCkfE3C
 fKrMiFVQDVBX6BE2lUY2hUPEhwrX2ErtSBaXmh73AzjgESxrn2Ku8Fxas+BbuqtzNE5Yran5dfw
 m/7mbktM78Bse9ewRhE3V23TWFradpIR7VFOaKDpz+sz9aGpWo3sIiPApDpDO0Kyw6t/921JWN5
 NOY5HlBPHd3POVMnZVmcpNalbAQPNyAPt0ePOWW2f3CTkIG2BIxtBHd9OH6bg6BROMEzWHaMOkh
 KaNFX/RW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138



On 9/22/2025 8:40 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 22, 2025 at 06:00:04PM -0700, Wesley Cheng wrote:
>>
>>
>> On 9/20/2025 8:22 AM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 19, 2025 at 08:21:01PM -0700, Wesley Cheng wrote:
>>>> The Glymur USB subsystem contains a multiport controller, which utilizes
>>>> two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC.
>>>>
>>>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml       | 7 ++++++-
>>>>    1 file changed, 6 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>>>> index a1b55168e050..772a727a5462 100644
>>>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>>>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>>>> @@ -16,6 +16,7 @@ description:
>>>>    properties:
>>>>      compatible:
>>>>        enum:
>>>> +      - qcom,glymur-qmp-usb3-uni-phy
>>>>          - qcom,ipq5424-qmp-usb3-phy
>>>>          - qcom,ipq6018-qmp-usb3-phy
>>>>          - qcom,ipq8074-qmp-usb3-phy
>>>> @@ -62,6 +63,8 @@ properties:
>>>>      vdda-pll-supply: true
>>>> +  refgen-supply: true
>>>
>>> You've added it, but it's not referenced as required. Why is it so?
>>>
>>
>> Hi Dmitry,
>>
>> The refgen clock isn't always required on each and every platform unlike the
>> .9v and 1.2v rail/supply, which directly power the QMP PHY.  It only really
>> depends on how the refclk/CXO network is built for that particular chipset.
>> The refgen ensures that we're properly voting for the supply that is
>> powering our CXO buffer.
> 
> So, it should be marked as required for those SoCs that use it and set
> to false for the SoCs that don't.
> 

Got it. Will fix.

>>
>>>> +
>>>>      "#clock-cells":
>>>>        const: 0
>>>> @@ -139,6 +142,7 @@ allOf:
>>>>            compatible:
>>>>              contains:
>>>>                enum:
>>>> +              - qcom,glymur-qmp-usb3-uni-phy
>>>>                  - qcom,sdm845-qmp-usb3-uni-phy
>>>>        then:
>>>>          properties:
>>>> @@ -147,7 +151,7 @@ allOf:
>>>>            clock-names:
>>>>              items:
>>>>                - const: aux
>>>> -            - const: cfg_ahb
>>>> +            - enum: [cfg_ahb, clkref]
>>>
>>> Why is it being placed here? Please comment in the commit message.
>>>
>>
>> Main reason if to avoid having to define another IF/THEN block, but I can do
>> that as well if using enum here is not preferred.
> 
> Is it some new clock that hasn't been used on the previous platforms? Is
> it actually supplying the PHY rather than the controller (note the
> CLKREF clocks on SM8550 / SM8650.
> 

On the recent mobile chipsets, we don't utilize the QMP UNI PHY, so 
those would be n/a for this.  I checked x1e80100 and sc8280xp, and there 
might be an error with the x1e80100 MP UNI PHY definition, because I do 
see that there are TCSR clkref control for both MP QMP PHYs, and we 
should be programming those...

In short, yes, this clkref is technically "new" in that it adds the 
references to the TCSR handle that controls the output for the PHY 
reference clock.  With that in mind, I think its better if we add a 
separate IF/THEN block.

I will submit a patch in a separate series to fix the x1e80100's UNI PHY 
definition, once I get a chance to verify it.

Thanks
Wesley Cheng

>>
>> Thanks
>> Wesley Cheng
>>
>>>>                - const: ref
>>>>                - const: com_aux
>>>>                - const: pipe
>>>> @@ -157,6 +161,7 @@ allOf:
>>>>            compatible:
>>>>              contains:
>>>>                enum:
>>>> +              - qcom,glymur-qmp-usb3-uni-phy
>>>>                  - qcom,sa8775p-qmp-usb3-uni-phy
>>>>                  - qcom,sc8180x-qmp-usb3-uni-phy
>>>>                  - qcom,sc8280xp-qmp-usb3-uni-phy
>>>>
>>>> -- 
>>>> linux-phy mailing list
>>>> linux-phy@lists.infradead.org
>>>> https://lists.infradead.org/mailman/listinfo/linux-phy
>>>
>>
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy
> 

