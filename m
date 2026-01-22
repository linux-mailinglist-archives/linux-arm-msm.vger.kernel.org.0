Return-Path: <linux-arm-msm+bounces-90253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBgxNX1scmlpkwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:29:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 127CF6C6E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 19:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0BDB831AC797
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 17:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9410334E768;
	Thu, 22 Jan 2026 17:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OqpLPXkl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K6QysO+U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E66B34D901
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 17:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769104064; cv=none; b=n9o2WqYsmCxnpp/ufh3sQ04wCw7TtAs/1o3MA/hkV0BGonO3CpmQY+jJgRhdRULuHt9sR2ei9PNcBG+IlgnF4GaqYJ6svygXzpuzE2hGcITErc+RrpiQVR2F5z7V4NjBwvKdqbghxsWax9sd6fj9O3C+QK1OImCvXAlf7XfB+QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769104064; c=relaxed/simple;
	bh=TJYVng5ooNRXlhReR3miRJabSf+2TZj3StXKPu8Wk6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=idixyDL6CaSrPEpEHfRcJRuncE/JrFqfIHs9eC2JE3JnvPMnDjdkdpDqDClR3l6a4+iPSuNyCaEnjZAFgPIHMwd+7GB6sWSxLw2miOfi6mYPVEn0tJKCHPuSyoixhzeU+1p7b9tDCQa49Wh40FucE2n45VF2f1W0lKFjELLI2GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OqpLPXkl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K6QysO+U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MH4gW53283135
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 17:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2R3RKHslFgOwADY1M4XwAYjSWwrDntngEiDVY4reyNA=; b=OqpLPXkl7QjwA/IE
	Auj4O1MspLQEssHbFSoTM6f1oT2/azwukEpf5V3d3AYrqT1o2RFdgBe+pMQNwSES
	WiSjTT8+j84YdtMOVQydt1vOapXh0+AleLHSlnxjccyHHUh/B2Dd1bNtywTmtlBt
	EIt1tUgUugxUPhhlTnI+gO+Am6C+f+3tzQeVg0E6Qt+biwTmZIkfuIk1gflGeHoo
	BqzJY+SbGbPwza05l4rW/IkrZLjaAnyeLwr8GppO5tTV59gVgEt7Rr5jglFxzwYv
	jrumqxFXNvmvN+L+SbnZVjp4Lld81SkJXq6fYQsLESrlYdwEPsY1GKz0ipljjA+E
	6wNFkw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buqyp068w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 17:47:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c69fd0a87bso100019685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jan 2026 09:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769104050; x=1769708850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2R3RKHslFgOwADY1M4XwAYjSWwrDntngEiDVY4reyNA=;
        b=K6QysO+U+I/JhZcvbJ9BDZ9XeUQsoGG4Ewz9B4Nv4uWiwtTNNmRhji4IKI6T3W2VOl
         fFy6IaemN77YmrqYRO0HYWHXFEX0mMK4u8Z8g+HiQzbDrzCzjK/re6P0akmbesUG349J
         FTfxKo1y0qk4eh8VG23fJXrwU0e3ctzzB+cNgW3KX+zZQdTBSEk/73181wwGdtU9CsgP
         vF/BLXcwl8UAsM9LZjf8W1BwgeyZzB8jZDd+f3KBJQUMEGUBXbH2QPgnHJ8HdYqbZTJD
         MfxDMjol3fh2C0DcS/3XQBeVW5YMF0rIJxaVzNJiV6QKxbUq+f84GFwlw37fr09ce9Hu
         TZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769104050; x=1769708850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2R3RKHslFgOwADY1M4XwAYjSWwrDntngEiDVY4reyNA=;
        b=iQMWZsOsqtpFBfxzhkN++gdAxWbSufatF0dZdbz8GuNDWzaBwyrLWo6dtsDtFsbyw+
         Qyh9Nqkz1WsfttsM8mYqaB7K4LnEsWx35/4XpCUjDtOjDI3dZ1pMlrGbsqw9cVKid1NF
         VqYQiK0IY0vXVxD8l5nnSB+MUc+wxZAOCnHN17aUyLSx8HyL00MV5le02owCWFRs8NDk
         poPu7A5Agl2h3SkNCtxjp3AqQS+yag6TXs13hNxFYwSNUSD13AAuc+oZBEBu9FOTntay
         e0V7Or5prieNlAl8CGIHPWoPrwwS/mnkvsLMI6zMEaIWg13T2HdSJ+2RDAq4e1833cZU
         vRQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPyI+bt7AHXiO0hnwRTYJlcjo5ZB6+gfcYoKGXSEhztDYtzUvVp0yYikY/Rj0z07i78gC4dGeN3WBDQem8@vger.kernel.org
X-Gm-Message-State: AOJu0YxultyCmA6VZs1kQR0trnUWhdosESCbbyWYhyB5yykNxer87isV
	4+Fk3XquqiFKB38nN/kep5vObEP3raO1gj7EirWmFTOVKhwQ2UQZq9FXsNN8RrnESUL4C1q+enC
	BDcKOLOeS90SNKdDYmF6jWYtMx+rBjQwN+32N0lqRvMGIOWJwXhqsJkSZYa0I2nd48+R0
X-Gm-Gg: AZuq6aIJWUMtPzVIE0K++1b0jB8tNoQbX8cLT6osMf2MlwG0ybqS0Dd6rYqlQZoFZuO
	3BTxMmX6HRbTqz9o7O14Kf0qPhesjICWNEgyNs/F2wdE4HRJvqBn+55XOSshqercJOBXJ1I6A+J
	KQ7QrEqvHtX7Zm+gAnNglD1XVuPyuOeR/yOqH0IwLDJfDDF8d7u8qEbLgSZujfje/TpFQmv6Opo
	qjiq4yCiTkpc6/YkxTB4ZuG8QoyZSsjAElaoZEL/11YgA4MOwqACxQ4EourX8QhQUor4QLXgVQl
	8y6esBbFbQZWCqfkhS3HBhA6DLOFzBPC1w8ZRy709Yww/9W3Qa7pRB+aINlM1jJew+e2ehyUarp
	jNxpJFp8co2+Sj6qNll147Q0ur/8MUBAbJ5MbvO7H5ujn/EAFXQE9KlkbltAIs23Cfu4=
X-Received: by 2002:a05:620a:1908:b0:89f:5a1b:1ec9 with SMTP id af79cd13be357-8c6e2d803e7mr32094785a.1.1769104049985;
        Thu, 22 Jan 2026 09:47:29 -0800 (PST)
X-Received: by 2002:a05:620a:1908:b0:89f:5a1b:1ec9 with SMTP id af79cd13be357-8c6e2d803e7mr32089485a.1.1769104049311;
        Thu, 22 Jan 2026 09:47:29 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c96f4sm1729814066b.40.2026.01.22.09.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 09:47:28 -0800 (PST)
Message-ID: <36533a12-9d92-42ab-9e5f-a26f538520da@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 18:47:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, KancyJoe <kancy2333@outlook.com>
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
 <01de9fc2-f60c-4bc0-af61-c070213df29b@oss.qualcomm.com>
 <53a1370b-89a4-4276-949a-e3ad95dbad2c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <53a1370b-89a4-4276-949a-e3ad95dbad2c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMy+3oi+ c=1 sm=1 tr=0 ts=697262b2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UqCG9HQmAAAA:8 a=KKAkSRfTAAAA:8
 a=ujkSvRmCcq-OA7eOwGAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UmBGHoN4w-zi6AAtUmOw-3PT7ZmD844E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEzNSBTYWx0ZWRfXzegra68hXDnA
 n0JT8AmB9uwNv+AbFk0knoiVuYeZgoyvn+VN72Osga3tauX8x3W8Chie3DGRg3Qd2APlIuoXW95
 0d4A8+cXV8GXAd709gMfiOp6WElkUuZvnJz4rSanXDRObEzkyzTxVG2F5z9KMLUR8I0pa0ZRZcP
 w17+ETiCdusLd6gSQUNhkDCdOffntgpdR0xkSxXAn9eH0zVakNlOOBbrH65YJTFypmXXH2cqco8
 jSWP0P84CUrpSa+dVx3HcrzIqVzlM4oTQNkRsF6knR+5hyGL6mbVLXg2/4w9Gdqx5Bh1m2F9lHo
 JguUPVSfeElIKOId52LcyU5N/d71IuNvPxYAPh2EgEVEHj7C4vtn3ILPEtCR+DrhUDf2qEkLmqz
 Aj9WGWrPrUdC7AQgSWCFNtnmf1q+rCfy5o1RjFGjk89jw92uqBZd+CzwUP5DFf7CyVS20g6KTP6
 kj9EtL7BU7bBrCOEcKg==
X-Proofpoint-GUID: UmBGHoN4w-zi6AAtUmOw-3PT7ZmD844E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220135
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90253-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,outlook.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,linaro.org:email];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 127CF6C6E3
X-Rspamd-Action: no action

On 1/22/26 10:25 AM, Neil Armstrong wrote:
> On 1/22/26 10:15, Konrad Dybcio wrote:
>> On 1/21/26 5:40 PM, Neil Armstrong wrote:
>>> From: KancyJoe <kancy2333@outlook.com>
>>>
>>> Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
>>> on the Qualcomm Snapdragon 8 Gen 3 platform.
>>>
>>> The design is similar to a phone wihout the modem, the game control
>>> is handled via a standalone controller connected to a PCIe USB
>>> controller.
>>>
>>> Display support will be added in a second time.
>>>
>>> Signed-off-by: KancyJoe <kancy2333@outlook.com>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---

[...]


>>> +&pcieport1 {
>>> +    pinctrl-0 = <&upd720201_active>;
>>
>> Is this a regulator?
> 
> There's s 3 gpios, the 3 are required to have the controller to show up,
> it could be 3 regulators and a reset line, I don't know. The controller
> needs 1.05v and 3.3v plus a reset signal, but I don't know which one
> is which and if it's really regulators...

I'm not going to make you.. but if you would like to open the device
and poke at it with a multimeter while toggling GPIOs... the footprint
for this controller is freely accessible

Konrad

