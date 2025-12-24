Return-Path: <linux-arm-msm+bounces-86464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D66BCDB3B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 04:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D3E830224B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 03:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A9C30AD1F;
	Wed, 24 Dec 2025 03:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="go9K74CX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RoA3E5nu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E57430B50D
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766546218; cv=none; b=Ng1Vq8kDId0oMRsbdp8VPXaJ6/gDGyE7hvuoHCOKAbRNBfXWsGaPtVa3g08dDgRIUVlH37eyZHVVNs28jksLbHFoZq9ZcSEF5g6eGHnSuTTXyFvqPDJug0GyFnRDd1QpCDez7URSFqajgQMLS6pHZZbngZ0Ir/unW1eCTcjRnzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766546218; c=relaxed/simple;
	bh=jDy18Bl8S7lV1ZpdQ7ZoPgkwfGh4GA3WGjNchgjieio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZhJYR2r562Msl8LxS7ACMO80sWYUzVajoFbKz2IhpHaxlgJL46/sX+ZgkVb37va1kicxBT90RugjRoJlNj3lzE/0HlkNuoIH5R0vRsqpDnAusVRO8fAq3lfDvgHcRaSc+kg76bdt4nxdaZK6Xxg8V0RkUcRHUpSwG1ygpoq71Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=go9K74CX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RoA3E5nu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNGO9eY1018084
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Nk0WsZK8CkSWt1r4TFyPVt2eoNtbZ1f8MIJx7t15O4=; b=go9K74CXkJnh9R6C
	XTWY3Seqx6ORTystgebgOMWuMSUaktgVr/n67GGKrlBaZQ0Qo+ItWzBQK3dfY7I4
	KdDH6twL3+3uk/lykPkcSSSfGAcOsZiby+BO6/aCHFWIB++NWOUFb2u9I9EUt3zs
	KfV+ssT9UMTOFBzg0Boz3zxHdKQd2Ih8fx/DQe1mYGGA3biykXqG0vtTtISYWM5Z
	aEkQfHXF/v+ui6w/yIFwdnPYOtRbncxJsF1RNJQjx2N2DqXM/9lTrWFd66D+z9rN
	9Cn8o4pLwIqJ9RyMsHHYHoHAI/4/xOTs2dzOJNy8+6AqnO//hqdoNC1uKF2GUMBf
	OAa4zA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjs9kbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 03:16:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b8b79cbd76so3397475b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 19:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766546207; x=1767151007; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Nk0WsZK8CkSWt1r4TFyPVt2eoNtbZ1f8MIJx7t15O4=;
        b=RoA3E5nu9L0CmBa1M0223FOOM/8+guDPDod/+N9VQMHiXNOPGuD4W7H7LRqryABIts
         oNf0h2HIbZGrCGPTYk8O7vEk8mj4ZijcV/kNwnzVfnCYXlWOv5ZBFF0RU1SEvaaA7BXa
         u5/zl6Ao0MPk+FeptIBjZXtP5lD81TAdTfVFBXSVLqEIZQZBa1W8SIdmKyaCHb3zlyCp
         rf6whEg8bTq/arOoaEiMN60aINpaUfbft28l8hD1hyTiq8RKJ7fzQi3/l9cYeh5F+19J
         5084cdokUV9hPdg+lJkR0kJoIfufSlWwlCMyY3kqK4hWMlaFvHoWu43NcDzKwybgWosf
         PcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766546207; x=1767151007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Nk0WsZK8CkSWt1r4TFyPVt2eoNtbZ1f8MIJx7t15O4=;
        b=ISxRiaYUksN9XKGPWT0C2EUpIbmjGTxeBq4o4wNTTKePnnPAtseYHyTHcIk4jhNQbS
         k5H0u6pHRJYLbFqLUEZmjAIA9E6x+XM/nnm2Q30eE0IMVKj1i5QarJtxNHP1s3pEbTbL
         k4yw704PlBwVefqdGn9DQF0NBiU2nqQGIWxZ8UPn8klwNsYjoF5FMhf8QoGh6oo+WWdx
         d0t2ThPQE9gFElO9IfJiImhXcyT2H6IRpPfbB0mMwfS5wwtkQpYobFtanmISrkwAqy7L
         F150cZ5Qpvp7aQHwwPgqCy6UranmfAzPbkVrz93WaCxvp8BCr7NynDAJLmv3Sw0RKOG8
         GT/g==
X-Forwarded-Encrypted: i=1; AJvYcCWowam0nRjJSREksbo8wbSal2A99ei2cEh2GCQ7C5oUb+21x5XH0wkwOFew41kRRelnlhoRf962XGwE0HUa@vger.kernel.org
X-Gm-Message-State: AOJu0YzXlQGy7ron2Dtvi87db5KoXbM3qOpk5O4aQNm8prvhZjb2te4W
	+BTBWHrqjO6JD1B5+KBrnhb6rrcLFoNaMJMDmyL0FNTkUHUAYnXv4DhqUX5czEthPZUqeqCFYio
	YIBUKtPtoScrrLfioVqOUER3Z26fusUVeNIL8YzerV2pIqyqHv11eB+XAENKi/CEQtlEd
X-Gm-Gg: AY/fxX7xmAwTm47T4i8vrSpsE/BkK541DYxbTxgTE8J/QuaOkVP2rwt8pb4hSAIcTGB
	SWYqpHs724KN3sS4SPlJOLIuyX8oQNyjSChe84H49qI1/XGK5Yb2Z6XF/lG6L4oJhzNeeHs3xc1
	NCG/Iim2o+51/zjzpQisgiYor0sNRj9KSmNkUGQ6e0O8mB9QR2ARAT0A4BSK5znwbzTHkuLLU/B
	dfbnDc3xrvaUSgn9Ji9lO6I/iZ1tM2t9GG6LvmtSKbg6nbIlux74ge7veNwQHu+4BQTy4GVT9pg
	gC5FjtwIUSqmAdsot/sXC9GHrUS3Z4X4u0QJzPpOBS0gqHy8rxxEcbaYU87RULQ1txd4k/ESrDy
	kbCX2uTxMuJwZV/xn4x77uFTfBashJd4fS8fXpBWlIGwARwe1z7wn/TVsllrjClrKpSMvJXuCHv
	jXgxV/
X-Received: by 2002:aa7:868f:0:b0:7f0:61d:d092 with SMTP id d2e1a72fcca58-7fe0d7a28a8mr15002400b3a.21.1766546207305;
        Tue, 23 Dec 2025 19:16:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRektK2ratYvVnkQdAMzu6czAfpp3g6ScKADB4adV5uIh/oLuTQWgDuu/FCxCDHzGN/eSLgw==
X-Received: by 2002:aa7:868f:0:b0:7f0:61d:d092 with SMTP id d2e1a72fcca58-7fe0d7a28a8mr15002373b3a.21.1766546206785;
        Tue, 23 Dec 2025 19:16:46 -0800 (PST)
Received: from [10.133.33.224] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a84368dsm15288617b3a.2.2025.12.23.19.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 19:16:46 -0800 (PST)
Message-ID: <ae532ff4-1a96-4dc1-9fa0-81305624c9c9@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 11:16:39 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] dt-bindings: remoteproc: qcom,pas: Document pas
 for SoCCP on Kaanapali and Glymur platforms
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
 <20251223-knp-remoteproc-v3-3-5b09885c55a5@oss.qualcomm.com>
 <20251223-furry-mighty-agouti-a222f7@quoll>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20251223-furry-mighty-agouti-a222f7@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAyNCBTYWx0ZWRfXzXsI/zaQnZNA
 lx/wNL17HcpmrH9emJlSBm+hlOgQIx8NwfAZ9rUOZ1d0PP0jr01DlgUiGBDYXT66SEJUit/CC+I
 nnFLMHH+v2Vv/eRGN44dBYi6LDyO6Bw0u8glEoDVgCdkVKlXaohCLyGIR3T1vrqy0XkF659bcqc
 XxAcNv8fw/Om3o2nKnbmmnDZLq0Axav60Y3/Ie1LAkxYylTDKqj5hLiFxZtxTpmJLCIV3MiWHKc
 8XpDPF2uZnHg5hz0H4oEbZ0S3HM+qqTrf3CoYTX+xLYNNdcdkAQ4gDkrVl9j5zKxTcZsTW9Szw0
 x4N2pFdL5YME1tHwIrVyoOsc5Z1XkxnUZ5r2m1yhWsVIH7AKFa1no8zOGd+wznr7TJeZXv8tuCk
 c9uUQ+5tptYnktan+Y1ysAImvNIFygf3hnvEEJEuxlIE7kcZy2dVA9uxj6BeozP5UGbZsjN3uWX
 /JhbGdSCwIOuNWy7RrA==
X-Proofpoint-ORIG-GUID: r1HHmLaNr1Yp_s1Ld_u8v5STbCC01EoL
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694b5b20 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=dRLHVvS3EW7BnV4jGykA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: r1HHmLaNr1Yp_s1Ld_u8v5STbCC01EoL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240024



On 12/23/2025 9:29 PM, Krzysztof Kozlowski wrote:
> On Tue, Dec 23, 2025 at 01:13:49AM -0800, Jingyi Wang wrote:
>> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> index 63a82e7a8bf8..149e993282bb 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
>> @@ -33,16 +33,22 @@ properties:
>>        - description: Handover interrupt
>>        - description: Stop acknowledge interrupt
>>        - description: Shutdown acknowledge interrupt
>> +      - description: Pong interrupt
>> +      - description: Wake acknowledge interrupt
>>  
>>    interrupt-names:
>>      minItems: 5
>> +    maxItems: 7
>>      items:
>> -      - const: wdog
>> -      - const: fatal
>> -      - const: ready
>> -      - const: handover
>> -      - const: stop-ack
>> -      - const: shutdown-ack
>> +      enum:
> 
> No, no. Stop doing random changes. NAK
> 
> Now you remove strict order (see writing bindings) and claim every
> device like SM8550 ADSP PAS has any order.
> 
> And it is now de-synced with interrupts. Read writing bindings - this is
> clearly described there at line 90!
> 
> You can only grow existing list.
> 
> 
> 

the interrupt for soccp is defined as 
"wdog","fatal","ready","handover","stop-ack","pong","wake-ack"
while other pas could be:
"wdog","fatal","ready","handover","stop-ack","shutdown-ack"

so grow existing list is not work for this,

In the v1, got your comments to adjust pas-common.yaml for the interrupt:
https://lore.kernel.org/all/861b6ede-f168-44e6-85bd-10cf04dbcec7@kernel.org/

and in v2, interrupt are moved as part to the "allOf" with if-else and
also got NAK:
https://lore.kernel.org/all/20251030-venomous-apricot-falcon-b3fd64@kuoka/

Could you please share a example for us to understand how to maintain it in
pas-common.yaml, not define if-else and has strict order at the same time?
That will be very helpful.

Thanks,
Jingyi


>> +        - wdog
>> +        - fatal
>> +        - ready
>> +        - handover
>> +        - stop-ack
>> +        - shutdown-ack
>> +        - pong
>> +        - wake-ack
>>  
>>    power-domains:
>>      minItems: 1
>> @@ -55,13 +61,21 @@ properties:
>>    qcom,smem-states:
>>      $ref: /schemas/types.yaml#/definitions/phandle-array
>>      description: States used by the AP to signal the Hexagon core
>> +    minItems: 1
>>      items:
>> -      - description: Stop the modem
>> +      - description: Stop the remoteproc
>> +      - description: Wake up the remoteproc
>> +      - description: Make the remoteproc sleep
>> +      - description: Ping the remoteproc
> 
> So every device like SM8550 PAS has now four smem states... without any
> explanation. Read writing bindings - what does it say?
>

This change is similar to current interrupt-names property define 6 interrupts
but has minItems: 5

-  interrupt-names:
-    minItems: 5
-    items:
-      - const: wdog
-      - const: fatal
-      - const: ready
-      - const: handover
-      - const: stop-ack
-      - const: shutdown-ack


I think this should be "grow existing list" you mentioned above?

Thanks,
Jingyi
 
> "... and define constraints specific to the device."
> 
> "DO define properties in terms of constraints. How many entries? What are
>  possible values? What is the order? All these constraints represent the ABI
>   as well."
> 
> It is your homework to read the docs. Not mine.
> 
> If you want to change common list you must define strict constraints for
> EVERY user.
> 
> Best regards,
> Krzysztof
> 


