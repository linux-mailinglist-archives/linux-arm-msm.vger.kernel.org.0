Return-Path: <linux-arm-msm+bounces-38831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE759D5EC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 13:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADCA1B24052
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 12:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AB21DE8A7;
	Fri, 22 Nov 2024 12:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LikYZeHl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF811DE4FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 12:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732278427; cv=none; b=BdIGG8wYgQzxel0cSBd1a7Xu4rQLOn2FX1/g5Sc4LlukYJW+1GKRTh4b72mE/2ocXNmTcjXFcDGy7fMX1fMcPP4+tkTLDQ22s0JQhuSPWIABEWU2pgd4Y3kVMaDLWDP7Gd3saC0m/FgXbwD1m1Fxs2ayZdJO8aBDZMdyyEFmWUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732278427; c=relaxed/simple;
	bh=4aiIpJh+eaWD1gIxrNVIvVmyVJxSvmNVIjIhN4N/AG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/F9LLWA3TJOxdA4cnhAXDdlBelhCcPTPz2Nb3uPzphrt39ypPgUjwHbTTGA5Ac58jidcUvVHMS+u7YYt5S4y71ggrOR3x2NWu1f8m+ApF7oC63pDhpgnGUeaWNKs7xvLzS1eYlqub5M0S1mh8H1fHvtmE2qgN2AHn5/VRog0Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LikYZeHl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM9cEDk019250
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 12:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+wZgnTIzj6zzY7f1RVOrNUBpDHPvehTTFEmYM7pOCzU=; b=LikYZeHlygIePHea
	W2zu2mlbFotHL93VjTEWOlsvaRtkmZ2vo/v4hUhRglgAwN2t/arperusDMZbt1Zn
	81t0bIRs7+td6oa6IZOKeZkaLLnxM7J8KF7XzAHYSWMVovwS0rNN7wcY86nBeXqC
	G1wUCrGosXQTQqz+FbA/KPnTVl9iObtRNZIlJO8f4DTAnqvuQWnWZbTcgCcZAekg
	RKGBb/o//uk9xgMznAu0Z/CAKDalDlNASEPd2yengspNl24eZ9vY/HRdMHdvpPqU
	JnfPbY1K1ummTCW3agzvWxSDJItJyHislLObTOQ5HxzW9epKvBXfpagWkcggSt7j
	dFNLWw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431c7hqd8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 12:27:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d407624cedso5740536d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2024 04:27:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732278424; x=1732883224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+wZgnTIzj6zzY7f1RVOrNUBpDHPvehTTFEmYM7pOCzU=;
        b=uJWLOjk/20J6PoVEpn2pbMIvyZZ7qOBX0v6ZQvLvL+SE4t00k9bFN+9JeQhLdPjdiE
         MQT6CNNlXYpSqd7rAuq+MMEUOG9JiRDthpQwVRATqVCnV1rnGtd7vvNfvq1uYabZT8qm
         In8NKYx4XxnO/DrSBoSHYmO3vWAkwmH/hmWIPIzu5Ow16B3qr0kYGwjT++mFHDtZkAVO
         mNe7s9AiJL/raCuKYPR/wKFeByDiWHkitfY6QvZMW/NCfpIoLD9ArLnc3gwvWR49tRWC
         DWX6eBV1WtHeEyJKwdRXraxmyB8sMNf0S3Yped7uyDdp2oi9d/D5mCYwSQ+4PpwhCvWj
         XMlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpii57at0H6Qn7/+CDXkiTlOhASykf7jJmBuhmUuU+Ota178aHhhKB+K74XP/QujFuteKTFN0gohVItxnf@vger.kernel.org
X-Gm-Message-State: AOJu0YxoDnLlnoWxO5Yy3/6XFNOyEVypnE5H7dPWIWYwDp7MqMSnYZYJ
	J3ZLBDR+6d0NxXuDw1EEx+AYMX2kgUWGEZqh+WCN2Br00ulVurzwImebAhk7rsG/H8fsA9vM1IR
	vCLEzcTsfLJ8ynh76TA7Ds8KSdPEr+eAqyAdOsfkdqklWzKACjoDPdiS3Ia7enmoG
X-Gm-Gg: ASbGncvKqAkkXODrGohVoQgtvISiR3r8pBLsoqsSLTCMLmXh3TfHf9DgBSL8povFVaw
	jm9Jyg4Frn0ae5x3HCagC91XuKzHjyDApuFvpJ4qYGIFArBpUUYb5FHgDQ2UvqroGMNjq8ubONu
	PBvu8Hv40eQE0cvn3YmGFcnlGOlvFJataXtLdLO81odxw+1ivEboLTIJtLPKPPFE1Udci5akA5W
	hHsrFzIUyDIx56yNUBfdVY7+ivK2WA1BBk3kEgf2CEVkhzC68lpJfubVArKRS+26Hda4JpGcex0
	BqQz44MedAJTpV3Vkbe793/4VTNZmpg=
X-Received: by 2002:a05:620a:19a3:b0:7b3:2107:302d with SMTP id af79cd13be357-7b51461660cmr166624285a.16.1732278423875;
        Fri, 22 Nov 2024 04:27:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAti18gerkPsJy9ehvlQkHYHYc+es+uoyJF0X67DaPecp+BaAqZTDlar6rEtD5dCOPx62iFg==
X-Received: by 2002:a05:620a:19a3:b0:7b3:2107:302d with SMTP id af79cd13be357-7b51461660cmr166622685a.16.1732278423450;
        Fri, 22 Nov 2024 04:27:03 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b28dd83sm95189866b.25.2024.11.22.04.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 04:27:03 -0800 (PST)
Message-ID: <c2800557-225d-4fbd-83ee-d4b72eb587ce@oss.qualcomm.com>
Date: Fri, 22 Nov 2024 13:27:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
To: Yijie Yang <quic_yijiyang@quicinc.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com>
 <20241118-dts_qcs615-v2-2-e62b924a3cbd@quicinc.com>
 <ececbbe1-07b3-4050-b3a4-3de9451ac7d7@lunn.ch>
 <89a4f120-6cfd-416d-ab55-f0bdf069d9ce@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <89a4f120-6cfd-416d-ab55-f0bdf069d9ce@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SM-yLl1ZoPKEKeYpjx_UEXq3rdljQjMB
X-Proofpoint-GUID: SM-yLl1ZoPKEKeYpjx_UEXq3rdljQjMB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0
 mlxscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=829 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220106

On 19.11.2024 11:09 AM, Yijie Yang wrote:
> 
> 
> On 2024-11-19 09:27, Andrew Lunn wrote:
>> On Mon, Nov 18, 2024 at 02:44:02PM +0800, Yijie Yang wrote:
>>> Enable the ethernet node, add the phy node and pinctrl for ethernet.
>>>
>>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 106 +++++++++++++++++++++++++++++++
>>>   1 file changed, 106 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>> index ee6cab3924a6d71f29934a8debba3a832882abdd..299be3aa17a0633d808f4b5d32aed946f07d5dfd 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
>>> @@ -5,6 +5,7 @@
>>>   /dts-v1/;
>>>     #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>> +#include <dt-bindings/gpio/gpio.h>
>>>   #include "qcs615.dtsi"
>>>   / {
>>>       model = "Qualcomm Technologies, Inc. QCS615 Ride";
>>> @@ -196,6 +197,60 @@ vreg_l17a: ldo17 {
>>>       };
>>>   };
>>>   +&ethernet {
>>> +    status = "okay";
>>> +
>>> +    pinctrl-0 = <&ethernet_defaults>;
>>> +    pinctrl-names = "default";
>>> +
>>> +    phy-handle = <&rgmii_phy>;
>>> +    phy-mode = "rgmii";
>>
>> That is unusual. Does the board have extra long clock lines?
> 
> Do you mean to imply that using RGMII mode is unusual? While the EMAC controller supports various modes, due to hardware design limitations, only RGMII mode can be effectively implemented.

Is that a board-specific issue, or something that concerns the SoC itself?

> 
>>
>>> +    max-speed = <1000>;
>>
>> Why do you have this property? It is normally used to slow the MAC
>> down because of issues at higher speeds.
> 
> According to the databoot, the EMAC in RGMII mode can support speeds of up to 1Gbps.

I believe the question Andrew is asking is "how is that effectively
different from the default setting (omitting the property)?"

Konrad

