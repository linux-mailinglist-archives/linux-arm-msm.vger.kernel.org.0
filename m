Return-Path: <linux-arm-msm+bounces-77759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 699D7BE7EB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 11:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FC6C5E1097
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 09:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95A72DAFDB;
	Fri, 17 Oct 2025 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eWC4xYmJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363332C3244
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 09:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760695075; cv=none; b=UvPdkinm18UHL2OKoUgNq027bLaSRG0OJF81VyHOIxpj0UOP4ha0faMgpJPKO0avowGdZCw/TIvS/ONdvV0bdSv6kyL8aiWvWLm25Rd2ZXhI5bYFo6B6GHiQ/n+FAs5TY2y1QMa6kWpziIIZ0lnPjyHQkUVAW3SjGbUE7Sski2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760695075; c=relaxed/simple;
	bh=79n+Qc5yBix+U3wmFnS6g8a/6+I1OaBQNl/w9qZHo+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=If1UO+SZJVsnaevEILFyIhTXWOn+2HlUzVmc6zbEt20oDb6aPZGjXN5afK3ZgRA1w0Y2tY/Kh5uegKgZ5jQjEBoZ9iyIOTOaaX0vwhyx/CFKh91AUaicmp+ksy5tGbA5rGxYNSqa8yLK+zGG2OCZTb7T2xqFc/NUdYeoZquqZFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eWC4xYmJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H88UJJ029768
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 09:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZIs6t3bvk1JRGW3dHYxMA/phlwEXTSoBjQ3c0yvwb9U=; b=eWC4xYmJNDSDSXpD
	oLv9F3SyfQXF43GJxe9B4XT19cWMzUJLWOuV69V+TTnNlRUuIBmdrGnvuQaejN7W
	jxgm5gQBM12gFJAKBHCrCPPTj3l3WckIEMYeUpGbTUYQKug6AQsqlNF2A4QM8FPK
	gHSA52Cb9lEtnT52KMgHa9ERYWazEon3O4M/OudfvHj+cD72OBphNbekX/KqoFNR
	QDvjGk498O0zkLvunJZfXZvNWzmLeP0X2ldyygaesGjMt93xoUgiUAa7iK4vRSNV
	13xEsjFb9ojoaYdONuhW7j+Gw08XPOv2T08B0YaY2UcY2SsMCabVIAGXOToTLkLM
	42fA8A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49u1h0ue9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 09:57:53 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c28cecb4cso714496d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 02:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760695072; x=1761299872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIs6t3bvk1JRGW3dHYxMA/phlwEXTSoBjQ3c0yvwb9U=;
        b=D0Y2cH2wx3nGRdXnCXbxFB44QJMycoFFwdQuQHkj8IcSEurw+GoGFEesah4xFr9el2
         BLrvNvhVl94DI+bSjJc31ee8j5g5G5v5UQCY6+AdYBZvL5mjNWtLqWJZrfdJ3BYMO9JH
         2wa5sG70BQPMGzqSxNMes6lpS0XMO5YdvIt0mMV4E6n5TfJcJfJyzSZepUmN3oYH+Mt8
         BuimpmtTX3rtwpAHetYmCY5qzxGw1HHEK0ORMHmT51nA9U2p1uc9Y6X+wwT5ei1xVLYC
         l5K+ywJs8MWdlzRe61KArsjQ3q0Hsmhyan6JcQ3DxbWPlBiBvgjibVBRerhdzZEu3URE
         ICHQ==
X-Gm-Message-State: AOJu0Yxhh+S1KIUqC3wNE8/57/WHMsHJYFghrWtZJBHfirSScb4vcXLi
	xz3BVdX+swHL+7nonyMfpfNrxnySCpwD8L+OISO99A6Q2tNL4woyLjFM23s0v87pckRhxx6MZH8
	g/WEwVI+AXE65vQMavQGXeHV2DgOx509HsvAaGyUaqThaDEOgkWYlJ62MVYnM4UmvNvvD
X-Gm-Gg: ASbGnctXT9IrL4NLwo9bxVMUGHOmg/cn74fybcl8i35A4f6ShRkvg/Q9S2IYybFhS2o
	a60um3qppgRJapdowISSsqoUBmZgb6qEdTMPzkJ+a1S+pESY04dankQs0PHcBFDmcRd52nbBfqy
	M3JAbTX9oQyTgFVPcsv317lOSPDLsZRPRPXdABfx/BCxa2yIRi+Lt8B5rzUGn0BpU0LPtqSrPFS
	N8R0rRZ1Yb1//2Gq6mSBx3mVeAFDpH/yA68bzcQyGCO63WapLUWVYIQUqnYPONmvcDofhu5YAf0
	RBG8XTEGOfFM8f4JDAfIi7b53BY8aDGXj4xNJEwCAxXNpwQO7YnYpSadIL2CbXrCKN8AsKD0oMQ
	4iwLtRjid61NmAN4AYlaWIK7IwPsJVCpXd3PWzPWWJfV+grWi+b1Gl4ec
X-Received: by 2002:a05:6214:5093:b0:794:3dd3:a98f with SMTP id 6a1803df08f44-87c20554074mr28562586d6.1.1760695071625;
        Fri, 17 Oct 2025 02:57:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+uuhZ2faNWvGjsfla4IBwM8DyZoVgJS2ll2X9Y+bS8GMrP2glkecYidQ6wG3U6fUy/3KYNw==
X-Received: by 2002:a05:6214:5093:b0:794:3dd3:a98f with SMTP id 6a1803df08f44-87c20554074mr28562496d6.1.1760695071129;
        Fri, 17 Oct 2025 02:57:51 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63b6b1f5b24sm16496480a12.20.2025.10.17.02.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 02:57:50 -0700 (PDT)
Message-ID: <8fd387f5-5b4c-48ea-aa3e-f453ddd5b159@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 11:57:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-shift-axolotl: fix touchscreen
 properties
To: Joel Selvaraj <foss@joelselvaraj.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250919-shift-axolotl-fix-touchscreen-dts-v1-1-60e26ad4e038@joelselvaraj.com>
 <8a5eecdd-d80f-4955-8ab7-cf6fd991a3b7@oss.qualcomm.com>
 <267eb29d-b506-43df-9380-3d79798c772c@joelselvaraj.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <267eb29d-b506-43df-9380-3d79798c772c@joelselvaraj.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=esXSD4pX c=1 sm=1 tr=0 ts=68f21321 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=WFa1dZBpAAAA:8 a=PdSRdi2-gu5LpHnKsfMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=MZguhEFr_PtxzKXayD1K:22
X-Proofpoint-GUID: NPxh6DT_bPEzN03GE0oJ00d57wlyOFdD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDA5OSBTYWx0ZWRfXxvn/Za2pz9I6
 uZGMXfybQ5gfMGoSuG72OWHcq8ep1IXl72rPLGhhpnEiFW7iCdFOzVv1eU2YW6c3ofAYqu70ZSm
 /d1q4EFZt7wFkqMyDqVWbeIaD6qkfhnAAcuE64Clve1dC5d0YACQTo4sYyE/Km0daVmxwvRS15n
 A5c2MNy4y5Aq97FSKANWKJqWB6EsJPZpWsvQKYcsi8QrwRd2cAr3+dePU6lfhJSvdqMhD4L6P0w
 lcq3g8HwdO9m6akiZRmABZOGA80oiyeqaDRNSHxgfYdizhtHnPLb1akTHijTGoJufRUceTla1vE
 BhVvRipoei3ahkLLVsDMSCAQyUZFBJl79Ukf/lq+tMiuXGztaJrJjunKfpsX2fW8kRJmbXkmW9o
 Dvx2ca0GsV2St9YE6vBfsQvT7TAzbQ==
X-Proofpoint-ORIG-GUID: NPxh6DT_bPEzN03GE0oJ00d57wlyOFdD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510160099

On 10/17/25 9:13 AM, Joel Selvaraj wrote:
> Hi Konrad Dybcio,
> 
> On 10/6/25 9:49 AM, Konrad Dybcio wrote:
>> On 9/19/25 11:02 AM, Joel Selvaraj via B4 Relay wrote:
>>> From: Joel Selvaraj <foss@joelselvaraj.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 17 ++++++++---------
>>>   1 file changed, 8 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
>>> index 89260fce6513937224f76a94e1833a5a8d59faa4..d4062844234e33b0d501bcb7d0b6d5386c822937 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
>>> @@ -434,20 +434,19 @@ &i2c5 {
>>>   	status = "okay";
>>>
>>>   	touchscreen@38 {
>>> -		compatible = "focaltech,fts8719";
>>> +		compatible = "focaltech,ft5452";
>>>   		reg = <0x38>;
>>> -		wakeup-source;
>>
>> All the changes look good given your commit message, but you dropped
>> this wakeup-source property without explanation. It's fine to do so
>> if it's intended, but please mention it if so
> 
> In reference to the touchscreen/edt-ft5x06.c driver which is used here, 
> I am bit confused how wakeup-source works. Does specifying wakeup-source 
> in dts automatically makes "device_may_wakeup(dev)" return true, even if 
> device_init_wakeup is NOT configured in the driver? I noticed some 
> drivers do:
> 
> device_init_wakeup(dev,device_property_read_bool(dev, "wakeup-source"));
> 
> but the edt-ft5x06 driver doesnt do the init, but directly checks for 
> may_wakeup in suspend/resume.
> 
> Few scenarios based on the driver code and my understanding:
> 1. if device_may_wakeup will return true when wakeup-source is 
> specified, I probably want to just remove it, because irq and regulator 
> is not disabled during suspend and this will likely cause power drain.

I think this may be the case

> 2. The driver has an option to specify wake-gpio. In which case, the 
> touchscreen is put in some low power hibernate mode with irq and 
> regulators still enabled. But the touchscreen controller used in this 
> device doesn't seem to have support for a wake-gpio (atleast based on 
> downstream code). So that is not an option.

IIRC Shift was pretty open about development collaboration.. maybe you
could reach out to them to confirm on schematics that the GPIO is
absent?

> 3. if device_may_wakeup will always return false since 
> device_init_wakeup is not configured and since no wake-gpio is 
> available, the irq and regulators will be disabled during suspend. 
> Therefore, the device will not wake up from sleep even if wakeup-source 
> is specified as the irq is not going to be triggered.
> 
> So probably no point in specifying wakeup-source either way I think? But 
> I am not sure which of these explanation is correct and thus not sure 
> what to mention in the v2 patch commit message. Also, there is a 
> possibility I am not understanding something. A little help from someone 
> will be very nice and sorry if I am obviously missing something.

I think this is intended for things like double-tap-to-wake, which
obviously need some hw backing if you don't want to just keep the
touchscreen online at "full power" 24/7

Konrad

