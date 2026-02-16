Return-Path: <linux-arm-msm+bounces-92932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCDiLAsEk2nF0wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:48:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BC01431E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B5A9301372B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B5221FF4D;
	Mon, 16 Feb 2026 11:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T89IcOM1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fFP/m6Lj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3A53033FF
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771242502; cv=none; b=kmmXUiZYCsIUd6k6+0+DMIxVYnCUMjbFaXfJ9AbO7Sgyu5rDotS9Ivr8PmF6DIxkRtCST1G0Fp59KX3BrsAFoj/KoyOiv7hMOSGwx/DrLNz0mKslSpa2L9IOngywytQOjy7he8eR3fOGOHWL9vETexaQWn17QN6wYb6+g4+CGic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771242502; c=relaxed/simple;
	bh=qwjysGjuC4LBHkczyMiF/TwadNUOL4VjAFK9WAGwol0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qFwX71A/4HyseuDNwBGvKBZAW+76/jQKN2O/XvMQI4LlAkiYSqsScHN2KZ0TLdOlAarFIS4goKF4PyjJk5WfDjcS7qo4+wxlY293dAfAzJynTD8RlhTieOWZP4Brd3YMaPCuo/Dzxje9iUC0I4rEpJVSC3VKtHCKVMblyfLUCqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T89IcOM1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fFP/m6Lj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GARVWW3022652
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qPz/r+I7ZPnTWvM7FzhPzlDlleVHYkZ5De6HnTOA5C4=; b=T89IcOM15Wjz1Dp3
	TUPehrZNl21fePbqNXyhfSFQwQYtRMT0SBto4/uScpmnkK4ODyH/uQ0pdAHqAjmC
	aZyzhHrfxJraNCK9rQHI7xdxZWy4eOs9/U6k8hprLqjQGsV9KmTuHpRVjibpy58B
	uK2uuEfEfKMQKEKVkxDGhaFEP2l+YgjhZDNb1v5bnPk2Fqxw/Y2dsVoXqZ5djT3h
	saF1xK7d+LpBKOlMtYCstZasbFZpP7tVCvhFWZKIuys9dnXHD+ou8AjfqIQ/36zH
	JgAOZECud0jbQVCPQsN8mYqUVo62vN+9t4nNIfH36it1B96W5mt3CUodSBtRl8jb
	wEIvNA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cah4sme2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:48:20 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-894a207e7cdso21757626d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 03:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771242499; x=1771847299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qPz/r+I7ZPnTWvM7FzhPzlDlleVHYkZ5De6HnTOA5C4=;
        b=fFP/m6LjpDlCJ8CD+VUibwVewtTazOA65aeMnMZAuGuvGocrSH4LPL52611DhhvgSU
         0+Jioj5LU6SU2fuZuge5lQ/x/Y6b31AcjHkR7+Clm3+guffEwK3JzX5CWRVvxIxC8ItX
         OF0hRRZw2Ys0vJNAOwckwKWS6orWzvIrrR/F2vs5P5X9RApc+e0k3y5u6rEe70SG6rj2
         +uKwo1ozZt+kM1vmpeKLntsp+1154DfXaUrIB7XaYF7REkfZDLL7iClaCLb7mE8pLZD9
         uTwDio4carzQBBDdowwb7U81TieR8NqtHqt+Btycbyzhyd1Qa2tsarXFj4pPWFNLG6vz
         Y7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771242499; x=1771847299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPz/r+I7ZPnTWvM7FzhPzlDlleVHYkZ5De6HnTOA5C4=;
        b=f9c7K9vzafs4UL2YGmnFZQeI64SuZn9SptV2mESD5cZibOPz8/tGmD+baTLyck+PAD
         ZDUstIr4obJk/VkFbUCzhKZKhCA5eHUsN+oLPFIVAvuKxw5HeUQsJ38+9GYUDVtSNK3C
         VPG6RYlq0eGDVWJII3OdHeNOFm+bkzZpw/QuxNTjjdJBlxQ/wuap1HGG2gC/Yn0TKMTi
         z94TvB03Jd3mpovyB0JSwjnb77HMH1DvqMcLsd3wrfDtpv8YYJziTKK9altE2Kq3l1Sp
         MU9JeD+r2iD1G1nujRent6Q/iFj20oV7r4tAr2kcLcoZwY88vcCVn1fGza9jNAzesuZ+
         PbJg==
X-Forwarded-Encrypted: i=1; AJvYcCUdlJOODr7W1ooZH6tZRq2MygIcY6bLspGKpkB1M7SlTlDkk0IWhP+5+cNmJwvSsKqOj+WiithWMQHXKePu@vger.kernel.org
X-Gm-Message-State: AOJu0YxbepknKycPGkdj4Uf7DRFonceGSaWaz3V1YtyOLMNx7/JdT1cR
	W0ap9Y5EwQnhuGYDcNx/QGMuwiCw8yNEHdDjnFDJ5zp09Gvg2lk4EwhGJseiCUKqyUNHHglI2XK
	inv8TBTlNyL4YQ1TxTByS6twgncAWVvrl6S76rL7Uih4oHIs8V17WKUsqCV/bRu7eJMv1
X-Gm-Gg: AZuq6aIvY3D5XC5NTU0F09G22P8Apd7wpYfZl/KUV+LvJFBQsp78HWQ51kbfcC6djXk
	uZW1QE5Wpe5IRa5qCHtpXUUMHgYyVKhUclbKNBd016aEXhmcu+27/kW+GFXLxdDoUfw9c5ucIWs
	3MQT4s0kK9qkHIgWnl2y5cDp7ClqaeTh+00oGrCQyfAdHVH9LO+ICTlFHGSQXtc2liy5ZxdUzBA
	8kijEQ9ETvF9AIIop1wS/pdWDbUvxZzeEknTBNMJb1dJMWX5g9nPsKoalpjiQbkWDRZTJUwpUad
	0WTHQWYeCrkDJIahPgCeVA+tsYs2/aE6YY+NZ7vqllbgQiLKz3OuubWAwZY6UhgKVzAae5l0oLX
	FtS3ItHwq+rs/EQva6NvE7qQDlJhFEj3Hg0+c9ieACqh28A7pKmRbJwRUT/BCIoLmu8o5fCBLsH
	9bquY=
X-Received: by 2002:a05:6214:8001:b0:896:f317:17dd with SMTP id 6a1803df08f44-897346262ecmr116266376d6.0.1771242499497;
        Mon, 16 Feb 2026 03:48:19 -0800 (PST)
X-Received: by 2002:a05:6214:8001:b0:896:f317:17dd with SMTP id 6a1803df08f44-897346262ecmr116266216d6.0.1771242499112;
        Mon, 16 Feb 2026 03:48:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fcb0ab637sm226904466b.39.2026.02.16.03.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:48:18 -0800 (PST)
Message-ID: <91425550-35f6-4941-917c-f639dfadb42d@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:48:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
 <98ad13d8-82d0-4def-917d-b99cf455c5f1@oss.qualcomm.com>
 <fa6ce650-42b8-4090-9c80-7f4e4c85a96e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fa6ce650-42b8-4090-9c80-7f4e4c85a96e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDEwMCBTYWx0ZWRfX09EvvekkkJgx
 IOA6ZpBfcV8Y+3PYP54HuBp9nuQaO3Dpj1+ajXmfgqROQUwypkb3SHn4tsFOgPws0nXCbyGcq2H
 yzS4yeGne4ADlNMLbEcyYMHMGxKNKIOm7fEWHFfJfvTnJKGo50vGEsgj/5qiRsKcIvbXoYe5Pa9
 dASgUVvlCtS9eGnbqrP8ET6Zk+9E+enKbIJBPzzsnMgkp1SIjKfYXTPZHMzxRVDxtdoVE2KB+2Y
 Pf795Z+lk67W+dVPH+RxKm0WpFfP4W27zMRqswmQq63eKO60OZpkS5w+qKtRpLXnc+caN86nm1o
 723kh2StW3jh1ABNN+pa9RZVu9uajI66MVTS2Bhbmg2guqmIz8I/Bx7xp3+9hvzBfg1A4IJ7Imc
 FnWXbOwLef8/ILNyKK/gnnlnW2MmOwRN48PvroRma/6h+O3YpCH49kmvRHDbGzyW7aC9x5IRci4
 09E6HWqcUzo+p8FVs2Q==
X-Proofpoint-GUID: BMqcptrGzTUwj2ZmxhTOi3valZOJLiU0
X-Proofpoint-ORIG-GUID: BMqcptrGzTUwj2ZmxhTOi3valZOJLiU0
X-Authority-Analysis: v=2.4 cv=EbXFgfmC c=1 sm=1 tr=0 ts=69930404 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=TNIZ4HkRKK3UB0IB75EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160100
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92932-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 31BC01431E4
X-Rspamd-Action: no action

On 2/13/26 12:55 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Konrad,
> 
> On 2/6/2026 2:41 PM, Konrad Dybcio wrote:
>> On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>> Enable Qualcomm BCL hardware devicetree binding configuration
>>> for pm7250b.
>>>
>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/pm7250b.dtsi | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>> index 0761e6b5fd8d..69ad76831cde 100644
>>> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>>> @@ -202,6 +202,16 @@ pm7250b_gpios: gpio@c000 {
>>>               interrupt-controller;
>>>               #interrupt-cells = <2>;
>>>           };
>>> +
>>> +        bcl@1d00 {
>>> +            compatible = "qcom,pm7250b-bcl", "qcom,bcl-v1";
>>> +            reg = <0x1d00>;
>>> +            interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
>>> +                     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
>>> +            interrupt-names = "bcl-max-min",
>>> +                      "bcl-critical";
>> We should strip the "bcl-" prefix, since these interrupts happen
>> to be under the bcl device
> Ack
>>
>>> +            overcurrent-thresholds-milliamp = <5500 6000>;
>> Is that something that we expect to change between boards, or is
>> that an electrical characteristic of the PM7250B?
> Yes,  It can change based on battery used for that board as these thresholds will be close below battery OCP spec.
> It is not based on pmic spec. Max current threshold support for specific pmic bcl is taken care in driver pmic data.

Okay, so this property must not live in the common PMIC DTSI then..

I think ideally this could be communicated over battmgr, since it already
has a lot of information about the battery that's currently connected to
the device. Do you think that would be reasonable? Would you know who we
could talk to internally?

Konrad

