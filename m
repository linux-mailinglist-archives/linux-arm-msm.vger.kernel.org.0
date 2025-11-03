Return-Path: <linux-arm-msm+bounces-80123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A105C2CB10
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 16:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49E9E18904E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 15:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A98431AF3C;
	Mon,  3 Nov 2025 15:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h5XRBiMn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ROfY6fqi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD84131A561
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 15:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762182642; cv=none; b=DDg0t+d8UK5c0YVpdhksIEk2ZDW0p9rVDuaJ4OeKzqg/M5UpnXTL6Ye9H51Z+aAiOkfmXmN2XVR1ie0nclpwvY+3Irui7ZcbExc4jkE7xbiYaeSHvUjuyE9J3VJKCCuur5yh7Bs110kOuLYKkmh160GFeqDRJON4sb2Q0WtM32I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762182642; c=relaxed/simple;
	bh=TBKnHfAjKl2ppaBTrHo8XUhddBKvleNXHX7YIvz+Vks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AC/wJuBUdzOokVnkQXKwysNnuHcy/M5dU7e7yFmuCIaXaDvx6sGa1mWgdrHBcGqHbk6g5kfvpY1RGb9viefPJq8RTKM+kr6bVxV6ILJnrhnBlzu5k6RGPYRYwW8OX3BktVNLkUn7eNsQHDrDeJF6H3PVALtlbK9uheSqGMFImIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h5XRBiMn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ROfY6fqi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3ARmqK2890308
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 15:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8A3ArCRCRZvjuVlwNozijUVtgXW3fKedq0/+bH1wVyU=; b=h5XRBiMnTdzCOert
	CSpYbXagMQp95wfOIY7F1YBzJP+zgyNmWp7Z0BUNEtmitaYTamVNTW5wGfUEx3wc
	hUyAd1x7PcKsSf7a3ZoZRLgevUL4/wzCL/9PlxbgqKZzOa2Ksz6b0t9lKGbsP+2c
	gdUkpJkVSRh3vIYqmOcVVYWNBycNuXe3FdQ5Fjd5nrVsEpvLpEDbzn8TsKhrKiYy
	W+fhIACm2OCpJpBcGlrAl8QFSj6qlQ4iMYWHqAphryw8RuOeEsosG3UeaeGK6mPl
	/Cxe4Ykw43NxuG9/BhEtkrA8VHUiw57kKD2PAwNjSVWvUoyet6D3aT78NAzcjHNS
	jEYq/Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6tnrgpq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 15:10:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-290e4fade70so54596565ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 07:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762182638; x=1762787438; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8A3ArCRCRZvjuVlwNozijUVtgXW3fKedq0/+bH1wVyU=;
        b=ROfY6fqiBOYGA0XDh0YGUrS3EnsL9fyvqZIqQd4S2BrW30iz+WTQRFobPoy+yXqwnf
         Qxa2gWWBkwOYtXzWo2O7C6qRgLIMG0PbQaWHwkdxmAKdEfn7ZOiWYB4lU2BpIrbQmIgI
         HjAzZXE16jCO9QdqUJPyJ3dLIY/HYrFRM7pDd7f76qeoAHY9aidkyjMH++eXXZIc03gf
         FFBLyFphcEFJheXlLsmQGo+KwoWPS0EAPv55h5/fDxd0DDGkomgBfUAROoQidm/Vby6L
         MQI7C0Xb4htLIKGT5ay582xACQcspBzZB1N5cld0iEzBQPvrCxiWcFRMNDaQf1yKgtlM
         XS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762182638; x=1762787438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8A3ArCRCRZvjuVlwNozijUVtgXW3fKedq0/+bH1wVyU=;
        b=Mu6YQ1wltokEzK/BopuKUNmL8VDu1ypjYB2bS/omwuvSl0Wug976JnojmWcf6WJZhs
         JQpJTBpuK47d/VHGgE5reCBEXe5Ptvh3V44kzLDMusQUjFjfiSpEfTnxzU/bPyHlkrDQ
         TAorfjUaOMCE2IRxaAyizASCbOK7NM8It6XgY+S2JlhHKZBeFFyu9CRyGkxj1Yp+x8B6
         ElyXuxvVlnN/uAs+mCuoGWUiKiEjpOh2ED6l7qAodr5jz3geRBaObM1vlo0V/6QSWQ+G
         GqjhkD2++8PWTd7A0xsRbWcAL/XsTDoT6vwEbv01v2usHPVUhmL5rKy71ZLQMNXzPqCZ
         HrcQ==
X-Gm-Message-State: AOJu0Yytu39EQP7oVzHloTqNpVRaBlS0rZX6K31lkVIq9lSTi1yRWBus
	w4mK2ynXh9K+E+dVcdzcdKRGaA+CpY8Nrj2Ua/cul5VccvWgX60uSjaMkSj/Hxk/VLXU+005etU
	YPfarw6SdkpNpI6+ZadXKg4sUJDpqnkVnonVAoYE6Qt1ffhNijo3dU6F5MIyOslO219tu
X-Gm-Gg: ASbGncu/FEF6UODi8HzjlMGPIVm9IybRQ8OEA98rDoOX1zR/OCQErTUcBtsbwfzdokz
	LB//uXnz9SSnzMJw5WPN7vxDm79ptEV6rbPgW/zcWwmskjnXR2B2XN1WJ2wg+ODXQYRqTH/6Hpb
	CM/n9QBrw40VfcKKiOSkTPxzS4M1r2lxSmAKLc1EdLXzNE71MlatiBC1o565TtGICiIdFmepFPv
	cDd6kSCcEy+a1u6f+KvRgCXRdND7chONLIOFjQs8/6TND7Y8nRLgni1192R8V1ojpLx4LwFxiTD
	mE33LueBmxornYx5WB0TEkaslTor8eI4kWG3bRzAaBGNWJI5baMVdpktXAMjOsMSN/Oo31bwD4P
	H9Ht01mY06Gqm+017Fk4d+w==
X-Received: by 2002:a17:902:db0d:b0:295:2ebf:a514 with SMTP id d9443c01a7336-2952ebfab79mr133843565ad.56.1762182638342;
        Mon, 03 Nov 2025 07:10:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmJGKc74YxWJtzu79C/yJHL0moK9Q/+vml8R0VgH1+FevtH2JLVIgQZLv9SJFbT82nEI/2wQ==
X-Received: by 2002:a17:902:db0d:b0:295:2ebf:a514 with SMTP id d9443c01a7336-2952ebfab79mr133843035ad.56.1762182637764;
        Mon, 03 Nov 2025 07:10:37 -0800 (PST)
Received: from [10.206.104.82] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29557bd3679sm90327165ad.87.2025.11.03.07.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 07:10:37 -0800 (PST)
Message-ID: <fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 20:40:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/3] arm64: dts: qcom: sm8750: Add USB support to
 SM8750 SoCs
To: Bjorn Andersson <andersson@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251101174437.1267998-1-krishna.kurapati@oss.qualcomm.com>
 <20251101174437.1267998-2-krishna.kurapati@oss.qualcomm.com>
 <f2724aed-c39c-4793-9522-bae08ea97a05@oss.qualcomm.com>
 <ev5gosxqguzdbufy72gcjmt4m4z6kc67jcaznrhvvjldcps4g5@fntcevrjpqsh>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <ev5gosxqguzdbufy72gcjmt4m4z6kc67jcaznrhvvjldcps4g5@fntcevrjpqsh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzNiBTYWx0ZWRfX7OTtUcjSSdwg
 9sn8m1W4ysQ43MpDE/oL3J3q/zOkssrQO+45WEBmX++YGUGlPhUXWDdEQh/nWEoVPljew4HJPMi
 5XrvZP87WS1lGQ0TFjfAOrAUuxdxkIlXp6SPtSIKIX2QDEzrkmrnYBBjj4E9cMguanH7hNGH0OH
 RZVyQvS0imUAKSvwVsd3tDN2j/LFFF53xVYx0JqWCYheyZgVNE9OkqzgFUDN2M6G0pyrtj/aeA1
 m16b+swZcKHvxjSiMTbEGC4WtyovdGvJ85dtHfHaVNurWI1q2z+Lbi/p/KxPR1pth62m08o57wj
 W/dN5EqB5p03jYobZP7jlG3BmBzYvRquDcpmwWkyF8ayu/KiXjok9CnQ1FDLAM5awanhoqhhlMR
 DSmBSxOKpFD0KU6+w3bVpz/dBG6AVw==
X-Proofpoint-GUID: zpIdkXrvDKV4k_kLe6vH48hlDZ3cB4Z8
X-Proofpoint-ORIG-GUID: zpIdkXrvDKV4k_kLe6vH48hlDZ3cB4Z8
X-Authority-Analysis: v=2.4 cv=BrSQAIX5 c=1 sm=1 tr=0 ts=6908c5ef cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=uOomqL60Iwva-KOcEcAA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030136

On 11/2/2025 9:23 PM, Bjorn Andersson wrote:
> On Sun, Nov 02, 2025 at 12:43:07AM +0530, Akhil P Oommen wrote:
>> On 11/1/2025 11:14 PM, Krishna Kurapati wrote:
>>> From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> [..]
>>> +			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
>>> +			required-opps = <&rpmhpd_opp_nom>;
>>
>> Probably I am missing something, but which power domain associated to a
>> rail is scaled to NOM corner here?
>>
> 
> That would be the parent of the GCC_USB30_PRIM_GDSC, which should be the
> CX rail. We currently have a NOM requirement here just in case we're
> going to operate a SuperSpeed link, and the driver doesn't scale.
> 

This is a bit concerning. There are other subsystems which share CX
rail, including GPU. So a hw spec violation on USB may impact these
subsystems which would be pretty hard to root cause to USB.

@Krishna, do you plan to fix this with a follow up patch?

> 
> That said, your question is very much valid, because on SM8750 GCC
> doesn't specify CX as a power-domain of &gcc, this vote goes into the
> void.

So the fix is to just add the VDD_CX power domain to the gcc node and a
gcc driver change to enable "use_rpm" flag?

-Akhil

> 
> Regards,
> Bjorn

