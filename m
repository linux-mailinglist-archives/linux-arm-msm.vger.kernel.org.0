Return-Path: <linux-arm-msm+bounces-113608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L0zyJX5/Mmqi0wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:05:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1130698CC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:05:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NafohgMc;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LXV388aY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113608-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113608-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D17F8301FA60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 11:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA4333F394;
	Wed, 17 Jun 2026 11:02:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E9D3382CD
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:02:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781694164; cv=none; b=mwbApOOVkTI8PexSNj+YspVf0uSvMCcu/Ph9KLXzziU9Ckump+Malh6fpDqqsVzz5cmOjObaqLQRtgR2kX1U1n3DiYYFwq7YWbG+5LqqDeTUdYoc+xVbZcCWx2CAiflWT+3V0sSB+JEv7Q6AlJZLxNsFBrqQxKdDLYMVTFQM4+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781694164; c=relaxed/simple;
	bh=J0WyCYNudbDkep66LezhAjJxPzWMYml0V4bTjmbw73E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oprd0oYOrc4rjJEnNMhnCBrFnBYd4rrvohvyzB3KBekz2PmKTkXaOFhkwcSMIWW/pBCf+Dm+clx5uvgmZg4ohz6ijV4MMV31d3oMQNxkcCu8X7azgdxLrIXvShBhaU+oRFYQN0/hzBj9L7g64X/YF/ZKGWmBjHziGd3w3hpjj6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NafohgMc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXV388aY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8UfWC1654299
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Guz5UHflJ3DoWFEEdxnqeNFGkLQOQlrubHs+L7C4cYY=; b=NafohgMcIv76F/a4
	5ayEzGKhYHSSwF+qRdbsKELK4A5EP+aDv3wFBmcBIPFKK5RKi9H4OubhkeP00Kuj
	tZdOTUjWbr3mJiRlT/0fYdj8EDNG9i6Z7xDJldWbqEgsb5mvPPvE8LR9LAz/OYJ8
	7qzPx3b093IA06wSGlip0zApHo2e1DwB1KyYPwdRx4suw7qE9U70co8mj5DDUPzI
	f1ccPWH93ki5YIbh5OIomY9uorBD7UN0VytRD0rbxXiNYFP0KCMLM7OS1rNxf3Uy
	u1etMmP1eTFuK2nlefJcTmk0yTD95YRzuRA3Y/jkQaQ99eUz2sEIRSPWZQNt9vEC
	L417uQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueer2qfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 11:02:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84534f17866so8138b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 04:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781694161; x=1782298961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Guz5UHflJ3DoWFEEdxnqeNFGkLQOQlrubHs+L7C4cYY=;
        b=LXV388aYiXG4BCwf6n2KpBDlEBjusTm5JTaeNXtr3ieV4WCMmN5Gv18BCqVoDkOU1u
         rfTUVOBeu1yxwmExw2faVWglRYd8k5ORw0j4LA8vjnXnKHPxRtpnVdZdfKwLVicm9lzY
         bQ8HW+iRpCyGXCGYJxABIRPJCguPDcarD4wgD/GyHI9OanrtLHij0NvyDwfVSIpgUZFT
         IvryVQKrAIaXFH4ZvXeEvgIm3micu2xEAOTixMbYE9ugee3RYG9yBpfzFPtSfyxvADNo
         jHEx4UQVOdYPsNmDuvp552kG6tOxEMdUJvs1pF7kENac4Ph2oX3yhWIGK1zeKcW0f5a0
         de8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781694161; x=1782298961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Guz5UHflJ3DoWFEEdxnqeNFGkLQOQlrubHs+L7C4cYY=;
        b=OV1Wj4OnkqgombquAz3vd/JLG8IdXimzGkGGb9gUgCBw5kpL3lyXmnPiMp3dr8lWjG
         npvB4iB9bl4lP2aZi4u8TTSbpfrqZcuQhO+KgF/IOjd1gkFSWFDApo1TxHWM+HSJNygZ
         ANnRYsMJMnqv+YjwdiWqzeX0eneQ6ydf+QSqVJQY8NDiQw45wWu8Dkh0mzOamBOivLBa
         puYI4spAvCrhhAB+Prk+ncBaBxSZn5cga4hjPSQLXVEBp1D3YJ3BgUDxs0HvyCR4iNJw
         X7HQRaj0E1tTSw7W4WVAVCQEKiuRt4K0tYl9X2iMFhJ71rYOvUHOQpFuc///6Wn+mFuh
         VeFw==
X-Gm-Message-State: AOJu0Yxs+lDCJbo2w+PlvVvLQVkXzwLGrTryZhhplaGcVfWvkZod1yX3
	JCsB0g2WxO3MXFusqK5tKOtyNRyrwN7LYKUi7sOyTU6FlQqtsqqGsBHqI8oyPtSt/fOqqMKkdmQ
	494AXwuL/8shit4fSI3TJwMm8miGHmqN1KNH1N1VUM+bTyXNXI7F3v8gt+OhonTCrmJIk
X-Gm-Gg: AfdE7clsO1vAc51aznaevPE4ToN+wPw18F7pgSubfSB0kSiKS0tiZWsyT0TDG1986qu
	uQsqvJlewfJtmmvJ7uxk1kDwp9Lb8pzvT6duME6Gq9JlpiJbsNtz0+yexZJ5mSHKcW1pUgnxbhD
	lyI++Mofj6Mv8YhbgKH+q73efVKoZAjmsK414BP3VRKmCmeoMWl0F74Yu8mgHz8rttQZOA5opH5
	Fl8L9m56QmuDZg8tdEYUdi1iMEVV4NHLITr3rgSPKhmks1H0XVdtTCnwlzMFR9DJdu70UD+b7n9
	R4dLb7BQ+0W+Dh8lUNLQpVapKeIUMtVzmnJPidm2cHTQq9OODhyS2GqkXAbLr6xpHfjshXouf1G
	vSeeU7bwF11kDu8EHQie+05P+TrRt0QJdc3RaDFgo06HmMlF8wEX3rWjNWgos13CyXuYbGn1T0O
	TYNXlx
X-Received: by 2002:a05:6a00:4510:b0:842:2cda:7a9c with SMTP id d2e1a72fcca58-8452454cd14mr3324102b3a.29.1781694161628;
        Wed, 17 Jun 2026 04:02:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:4510:b0:842:2cda:7a9c with SMTP id d2e1a72fcca58-8452454cd14mr3324050b3a.29.1781694161110;
        Wed, 17 Jun 2026 04:02:41 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acf2ac9sm15780135b3a.21.2026.06.17.04.02.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 04:02:40 -0700 (PDT)
Message-ID: <c7191868-d141-4095-b703-230237721f28@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 19:02:35 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: input: Add binding for Qualcomm SPMI
 PMIC haptics
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260616-qcom-spmi-haptics-v1-0-d24e422de6b4@oss.qualcomm.com>
 <20260616-qcom-spmi-haptics-v1-1-d24e422de6b4@oss.qualcomm.com>
 <20260617-wakeful-gorilla-of-feminism-75287c@quoll>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260617-wakeful-gorilla-of-feminism-75287c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rtMnvhFP37xGolxMtCdo0o8a0e84yjFN
X-Authority-Analysis: v=2.4 cv=Mr1iLWae c=1 sm=1 tr=0 ts=6a327ed2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=SMdS_jwxfo_ZY5qVgdUA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: rtMnvhFP37xGolxMtCdo0o8a0e84yjFN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfX7wLqgE8xxUv7
 pawBEkEYyGcQiGTVD3KKDTvyEN08Wv4Lbwra3CXpHJfSF1kuTu45TXvjCe8sURdeJ+X1gFXSqOQ
 BifngqB9v15py6OxZkxkR1PdVjom5Ho=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEwNCBTYWx0ZWRfX3zcykdrxJ1G2
 pKuqJnXPTW5E/w9Is42rHD1hkH4aAC4Ehs6lS8RlewrLWP9WtJCgR/K78kmSK+q09TfN9cbfroJ
 KTPwcnr9/GDV2ZPBkHtpXurvapQk2bJxazU1TGOvhvKfsC0PoFN1lmfRppIQRK1TDp8nCImAnDj
 3gYX2nIUncGbT7juJ2xMZbYkvuYSLjPRE08pjcPsBagQZ5Uwnjw6LleZlbMwkvZz8+2Niwq3dTb
 2yfyUR2S1uEFE4b/+HWo8rIBXN7a4RF/t+lkFsBKXeku+qtGnpWljHPZCnv56AMpuG1/HNFP3To
 +g12RP3wOejajo+a6UWUN9ZwJlUIIF0RXHv4mKcENMoVV228hvqfbqiwYtJZwpPUMOcWJbRvpGY
 qTGC5F3uwG2JM8TdQPYe/a7C85lhoNH+3iKR/ADKdSQUfKqqDCa+839h0PAMg5Cyoz3XnVHa8qu
 sZs0YhDdcqVxsnUrxhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113608-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dmitrytorokhov@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1130698CC3


On 6/17/2026 6:35 PM, Krzysztof Kozlowski wrote:
> On Tue, Jun 16, 2026 at 03:08:24AM -0700, Fenglin Wu wrote:
>> ....
>> +
>> +  qcom,lra-period-us:
>> +    description:
>> +      LRA actuator initial resonance period in microseconds
>> +      (1,000,000 / resonant_freq_hz).  Used to configure T_LRA-based play
>> +      rates and the auto-resonance zero-crossing window.
> This does not feel like static characteristic. Isn't period depending on
> intensity of vibration you want to have? Why would that be fixed per
> board?

This period is specifically used for playbacks that require 
auto-resonance to be enabled, which I referred to as "T_LRA-based" and 
"auto-resonance zero-crossing window." It plays a key role in the 
"DIRECT_PLAY" mode, which produces a constant vibration effect. To 
adjust the vibration intensity during this constant effect, the hardware 
does it by scaling the peak voltage of the driver signals, rather than 
changing the frequency.

>> +    minimum: 5
>> +    maximum: 20475
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - qcom,vmax-mv
>> +  - qcom,lra-period-us
>> +
> Best regards,
> Krzysztof
>

