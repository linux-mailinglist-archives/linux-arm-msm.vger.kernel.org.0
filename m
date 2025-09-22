Return-Path: <linux-arm-msm+bounces-74477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EE2B93464
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 22:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 708251906A9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 20:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCB2279787;
	Mon, 22 Sep 2025 20:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SEhbu2QF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA1C1F91E3
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 20:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758574385; cv=none; b=SjibUMmRpghZXxy4mdI3DChfwhU6mVf/S0TltYWKPYQHz2VTcuQz7ZzA6BWZ1He/Bi6St3coAlRVyKPkb9WrtpRXV+4vP749WmjE81VxLdwi46dDJNsLwEES2hIVRN8QKDjZzFXEZVpysWcbywTkemHJHF5WsjpPPmqrcLcwGAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758574385; c=relaxed/simple;
	bh=wJKOVxTWl3mVaWN7uXpUfUAhskBfIXlt5pRVs9BcJVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gvD/uWgPaDjrceNbLOkOhA+Sc6TBoNbZEUJT13AB/kU0OUkdyMyeVXZqOKaoYzXmfPEd8ZL4xe4QecEKlgBGTmpDmO4NI0V86sTbezBlt+6grM9Zdtsk2456133NH4cbfy/LY/WIYl667aM8B3zLOlJj3VThuhJZNd6uiV4QCNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SEhbu2QF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MI1F4d004283
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 20:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9Wu9mtQgEpP2zjRZmcsIaHLYNEVblC9DYlSfNlL2BY=; b=SEhbu2QF5h7XomJp
	Vj1CGhEN9jpJfKWjsFGKoxC2XGuNzsxqyQR1EQlCU1FtmoCbrCnYtukQ1tmxqHfh
	kNGii2eEpwlFZgIwtwqSnKpfxUtam162ni19KUpK/0YNUG+/MmpI5pvrzSdkYX83
	T0Kkczmxihstc0P5l05b8ENE/RG/YO+4TVZjJWk7BLxhJ16r/L813d/dxqSixjVI
	NAssD0i3oL30XMleY9IRtugLXGYLUqAaR2zRYY7cSTQ3Z3xztY3N1e8qBV+W6/Ef
	dMe5Buu5tjK4GwMXuxCmq7Yn29cWKSHGcNZ+qe6ICjlW3v3yjonqtGzVJw+RXB4+
	n0YVdw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fe375-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 20:53:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32ee62ed6beso6606853a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758574382; x=1759179182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9Wu9mtQgEpP2zjRZmcsIaHLYNEVblC9DYlSfNlL2BY=;
        b=THwO8Vmb/xYNQo+TjpxyQPr2yxU6p8V0tYI/pQnEpFgPMK6B4jggHcK5sUphDgamKk
         atzHlB14UvlwniAQJCwi256UaMpHM6+oOcr4g7SFiyWmFlrd6oN1+6OCqy1Cv1+5D2LN
         fq3nilulVBQF58E6DDJlvViDwKsWiWlFzgz/SD7rLNShyBNd1wNSD8Ewm2q2Z039a6Ge
         LRudcr8uMq8NvlLy6G2I5SXIVQ8ag4OA58R2TNkWlcqpoNui2w7XgubFTmczxzCpeZPb
         jST1j34O37JuhIXweny1fkH2IVWh+xxnkhCNvZzCgeErBA7i4M3iyar9DEjraQOSKEBC
         S/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVvVdmDXrowhhBocZXPnwUXBNr3czLpuOEnTVG5mXG6YYEI+nR4TnXcTu34IcnZ2adIpkNcwGcoTjRI0swx@vger.kernel.org
X-Gm-Message-State: AOJu0YyNe0UocP4C8N/FI7qzVAO5o0vh6pqweeAhlmfvVpZJsuowptQD
	GYLBPXl/sA6UZDRq6LcZVsO5Yem+702A0JJyy5Zzjexe9jhbblMQd4jo63WbDl7fnx1m0a/PGcy
	d50QnkuUJs5F5H7k97+0cinF4hXIJpMdOjGqCcijdoLYms6kMm1+adB0bGmDjX8IfwPx8
X-Gm-Gg: ASbGnctR3BkD3102Cwd1RSA3y3Z2GlC4eYc1SWyvUx/74E5ald26qVY48DChtDVcilI
	PsHSREIITPlG3kCMFvueUDtBebP3b6PmZeUI58ILZayEipjcZlwGHzIPNB4E10JfRlLEojE0wi+
	bWAs1nuzmGhDyvgaZzzS4nk5dozG6OmFTJDM6F+1sNlqgrsgbidUFRAg5F/F58nJ6s62nBh6wVW
	F8PrwZuHZlSaqj3QstCZOEm3uldNWwXzVm+F2EehGa6n31Ig9IrsorGUCuOq6PvA3dJs+WNORWT
	+e+Oz6Ymh+e73qdjLiMG/HUD7WOkVW6qkZevEkIydsB5y8pyCNltNptaThO8lZhlDjqD8QhYSOH
	YioQvYQRnO4JesGZj30Rb4jURfsf2Fwg=
X-Received: by 2002:a17:90b:1847:b0:329:ca48:7090 with SMTP id 98e67ed59e1d1-332a9a03323mr314251a91.37.1758574382407;
        Mon, 22 Sep 2025 13:53:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmGBgoTPZCCqPtAA5u6G0ADv+sA5Otpw3FKsEi++cUEokO+1hOzsSKXTEDIDmo6qjE4PrGIQ==
X-Received: by 2002:a17:90b:1847:b0:329:ca48:7090 with SMTP id 98e67ed59e1d1-332a9a03323mr314228a91.37.1758574381933;
        Mon, 22 Sep 2025 13:53:01 -0700 (PDT)
Received: from [192.168.1.239] (syn-075-080-180-230.res.spectrum.com. [75.80.180.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33046a4d0basm16048941a91.27.2025.09.22.13.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 13:53:01 -0700 (PDT)
Message-ID: <588fd98b-ed22-2940-a749-d4601f77b0b1@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 13:52:59 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/9] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add
 Glymur compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-2-wesley.cheng@oss.qualcomm.com>
 <nkkimxkdp3q3iiyv4ic6rxnwwedq5tnnn2zismqf4pdocvmono@xltxaqz6rb5q>
Content-Language: en-US
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <nkkimxkdp3q3iiyv4ic6rxnwwedq5tnnn2zismqf4pdocvmono@xltxaqz6rb5q>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PGi-gJ0g7lABy3XhNKKIR6ysIch4WBDA
X-Proofpoint-GUID: PGi-gJ0g7lABy3XhNKKIR6ysIch4WBDA
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d1b72f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=agQD+r7xwyS+FYqxhQjztw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=Sr9xLzlp0V7X-QRcIyAA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX7+R+lGiroeEn
 wLhXheS0OWreO0woi1wi4TwkJ/ejw8nmsLiWg8wkW46jKQtErCCRGeUN9B1gd/VvWbmVah/aTgU
 l79biSkecDwrqzNmnFdQyezLxwLO85Ut72f0ZVKaXTTlyMvUB3rmM5CcHGSOip3hzfhWTxTVQwB
 d8vx3zHakfz3eZdjL16keuAsn57axWKcP/wwDWtaygY6dTkD9RaO62IyZzAq320Aoa9vqtzDHvc
 m1oXpNxdMHhZT+DiYTw0AuN7eI0NlUwcGUXon0xaeMe2jP0Wyw0q7ZS3KrsSknhyp9DoXBSOH6e
 ZWKm10V8lUgQD2s28Pb5u91PhB8QVizfz7ROfLFqREZOult7yjgqJ1mxudWeVtdWALeIJau/zG4
 ZRwVdXMO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_04,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037



On 9/20/2025 8:18 AM, Dmitry Baryshkov wrote:
> On Fri, Sep 19, 2025 at 08:21:00PM -0700, Wesley Cheng wrote:
>> Define a Glymur compatible string for the QMP PHY combo driver, along with
>> resource requirements.  Add a different identifier for the primary QMP PHY
>> instance as it does not require a clkref entry.
> 
> Are register programming the same for both of them or not? If it's the
> same, it might be not necessary to have different compatibles.
> 

Hi Dmitry,

Yes, the register programming sequences are the same, but the number of 
clocks are different between the primary and the other controllers. 
Specifically, on the primary USB controller, we don't have a clkref in 
the TCSR.  Was just adding a separate compatible ID to define the max 
clock items.  However, I do see that even if I only need 4 clks (for the 
primary) it technically doesn't break the DT bindings definition, as 
minItems = 4 and maxItems = 5 for the clock and clock-names fields.

I'll just go back to one compat for the primary and other controllers.

Thanks
Wesley Cheng

>>
>> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> ---
>>   .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 45 ++++++++++++-------
>>   1 file changed, 28 insertions(+), 17 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> index 38ce04c35d94..e0b10725a1c5 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> @@ -15,22 +15,28 @@ description:
>>   
>>   properties:
>>     compatible:
>> -    enum:
>> -      - qcom,sar2130p-qmp-usb3-dp-phy
>> -      - qcom,sc7180-qmp-usb3-dp-phy
>> -      - qcom,sc7280-qmp-usb3-dp-phy
>> -      - qcom,sc8180x-qmp-usb3-dp-phy
>> -      - qcom,sc8280xp-qmp-usb43dp-phy
>> -      - qcom,sdm845-qmp-usb3-dp-phy
>> -      - qcom,sm6350-qmp-usb3-dp-phy
>> -      - qcom,sm8150-qmp-usb3-dp-phy
>> -      - qcom,sm8250-qmp-usb3-dp-phy
>> -      - qcom,sm8350-qmp-usb3-dp-phy
>> -      - qcom,sm8450-qmp-usb3-dp-phy
>> -      - qcom,sm8550-qmp-usb3-dp-phy
>> -      - qcom,sm8650-qmp-usb3-dp-phy
>> -      - qcom,sm8750-qmp-usb3-dp-phy
>> -      - qcom,x1e80100-qmp-usb3-dp-phy
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - qcom,glymur-qmp-usb3-prim-dp-phy
>> +          - const: qcom,glymur-qmp-usb3-dp-phy
>> +      - enum:
>> +          - qcom,glymur-qmp-usb3-dp-phy
>> +          - qcom,sar2130p-qmp-usb3-dp-phy
>> +          - qcom,sc7180-qmp-usb3-dp-phy
>> +          - qcom,sc7280-qmp-usb3-dp-phy
>> +          - qcom,sc8180x-qmp-usb3-dp-phy
>> +          - qcom,sc8280xp-qmp-usb43dp-phy
>> +          - qcom,sdm845-qmp-usb3-dp-phy
>> +          - qcom,sm6350-qmp-usb3-dp-phy
>> +          - qcom,sm8150-qmp-usb3-dp-phy
>> +          - qcom,sm8250-qmp-usb3-dp-phy
>> +          - qcom,sm8350-qmp-usb3-dp-phy
>> +          - qcom,sm8450-qmp-usb3-dp-phy
>> +          - qcom,sm8550-qmp-usb3-dp-phy
>> +          - qcom,sm8650-qmp-usb3-dp-phy
>> +          - qcom,sm8750-qmp-usb3-dp-phy
>> +          - qcom,x1e80100-qmp-usb3-dp-phy
>>   
>>     reg:
>>       maxItems: 1
>> @@ -46,7 +52,7 @@ properties:
>>         - const: ref
>>         - const: com_aux
>>         - const: usb3_pipe
>> -      - const: cfg_ahb
>> +      - enum: [cfg_ahb, clkref]
>>   
>>     power-domains:
>>       maxItems: 1
>> @@ -63,6 +69,8 @@ properties:
>>   
>>     vdda-pll-supply: true
>>   
>> +  refgen-supply: true
>> +
>>     "#clock-cells":
>>       const: 1
>>       description:
>> @@ -110,6 +118,7 @@ allOf:
>>         properties:
>>           compatible:
>>             enum:
>> +            - qcom,glymur-qmp-usb3-dp-phy
>>               - qcom,sc7180-qmp-usb3-dp-phy
>>               - qcom,sdm845-qmp-usb3-dp-phy
>>       then:
>> @@ -129,6 +138,8 @@ allOf:
>>         properties:
>>           compatible:
>>             enum:
>> +            - qcom,glymur-qmp-usb3-dp-phy
>> +            - qcom,glymur-qmp-usb3-prim-dp-phy
>>               - qcom,sar2130p-qmp-usb3-dp-phy
>>               - qcom,sc8280xp-qmp-usb43dp-phy
>>               - qcom,sm6350-qmp-usb3-dp-phy
>>
>> -- 
>> linux-phy mailing list
>> linux-phy@lists.infradead.org
>> https://lists.infradead.org/mailman/listinfo/linux-phy
> 

