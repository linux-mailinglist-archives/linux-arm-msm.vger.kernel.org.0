Return-Path: <linux-arm-msm+bounces-65814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E04B7B0B6A6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 17:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A7A53B65B4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 15:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43B021D3F6;
	Sun, 20 Jul 2025 15:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPpK+mCf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3518C21CA0A
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 15:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753025055; cv=none; b=q+E0noprIFCyek+J39FYJXkUuB50un6ST/Qrd6NW2J0Fr2RMOpUbXn8vQ7fpDBOLmFeYHZUEHidDrbaZNsInh0LiAyyvcWieOr3UDRAVrq4BQgLDoGHyJmcYJJOOEgrVfIofBCFGMOx+7HBI89DQiGag0FgIlhGFABMSC4VU6Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753025055; c=relaxed/simple;
	bh=5RovnvTDAuovyn4cAtpqbi9TnjFhXvo6Fxsbgus1QVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EzgT7Sf+/w3/QvsaM2wkSLIJnlyc2FJPY+RM1caGG9Oej1WfunDZdbUdhNk+WGX1X9wFJKRsfzIXWyAiaQjd+izWdLeqJfvVERPnhhgKLdqtdXKlU2Buw4SCeNKpHjPZBe3jH0scQZ4gB8pGf18tgbe3Sst0kW4HkDA1wDxkad0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPpK+mCf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KDF5AG016556
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 15:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cn5tyQX/xC6r7LynCtZ+cKfCSqVjcFVIFtjOQjXs2ws=; b=aPpK+mCfhjIK+hdD
	kc7epzo/3ZcjON3f1eCOhZl/+jNOdPGmcQe0iNhhRhkIZJxBFvmBjEoG1lDhrawW
	WKq8fUcUjITAkKZzMs73dSdMwxcenkCPDRygzrp9jTPA5TCb+IpU5l1TO9gUjEjn
	ONgP98f1kU/BXLkWA+J5p+fvp4ddAsZCNepIyspJVfaCI6rC/WhfESxgFavA0MQj
	xyUzWh6zHybxc0wpKiHYy6v3wdM1ZNTEUA9HpxdNwFdx7oe51MwYXq20yqCTd74B
	OuFamdAimiUVF3VTbfn1qr3alGcNCYIS8se8lgB8HqvLoCOma2tcZP4HfSkiwwsb
	fGxYvg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q2dk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 15:24:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2354ba59eb6so50628605ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 08:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753025051; x=1753629851;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cn5tyQX/xC6r7LynCtZ+cKfCSqVjcFVIFtjOQjXs2ws=;
        b=RChemLeWCviii05WeGUR/hRK/Zjp7PCho2f+Z96fLsGMiOc9HgTtOE8K2fzFsQVLAi
         yKFOP+GhG7MJ25sCM6gvZ5VZMHqTztvfksmTG10VLTRUJB7sLFn9DfD73F7VnCWzXpME
         JKyo3e5OHwcQOw4wIJqjCnAAj1fs2O0xEyzbB+cjkKgy0agURnUzD5yuQXkbqnMbmwXa
         XlId3Vq5yBoD9FkSRu4WAUMlwnBmngLAxAS4P3RzXJ6rur6TNNlp9FNU60R/0WBSAsYh
         C4xJrTpqcc/NA/CjRIjNh0uMpo6cJIl3V+w7PDJneA4puZ4oCxa00kjhGlale1kKFswD
         DQRg==
X-Forwarded-Encrypted: i=1; AJvYcCU6TAjKFdSI367yfyHY+8Df1cb3R8FLU3zDEfn9WSyP0pTe/WTpZuNgNYWkeP99w5rez6HNjBJOVVQUb1dx@vger.kernel.org
X-Gm-Message-State: AOJu0YyoCYB7nOtDs+nC76CasxMkkybF32XKdkAfx6u08gItsUhVlGjg
	hJcnJMhBluLJ2SlioT99cSDZvSfsoNJmB2NtA1+1JrndqkaGdxA5amKtGMpYyDIhmmATYXE3plN
	kgL0W9vbX2UEEQfeEVzDHYseOzEWT0KZH9BmVudjTi6kR1/ecbI7STSMgoe+QasI7gsSL
X-Gm-Gg: ASbGncvLESQaARNWs0WetzVNcgFdbkPXcFtw8b0LGjGnxIgOtgoe/YfM7OoC6zItQCy
	0pG7VfYSo2lGLg7oax8KflecCXGRzeVKxNyjCzTcWl9lBgGPkknavAt1dVO7YpVCQ2AGIaMaeXb
	V9V9IyyKMaEaa2KKkIqYoArG1HsmebuxXBLiGAnZn0Q09C0sirWkXPF//FH0c4u50pYM5uNe2qd
	hHaCazQyMmsq3joQMGl6Dc/57s7QPcn8TFXEUHqwfxXSfg/G/QrCTsqTO9R89X58TIO+mmSX5sg
	05wZTRCjq+6vlJPahX9ZeW2WiMQmu3lGJbFx/7aHyhRa9L/Qdr9mwXuUESgHliA7DfywPPj/APl
	A
X-Received: by 2002:a17:902:e845:b0:234:d7b2:2ac3 with SMTP id d9443c01a7336-23e256b5f6amr233001345ad.20.1753025051534;
        Sun, 20 Jul 2025 08:24:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUOqsroGWNvuq0aBkHthsIfTFvGKyjKlWXBZvHeY8vMrQhZYhY78dv87gCgxB4llexBH7YVA==
X-Received: by 2002:a17:902:e845:b0:234:d7b2:2ac3 with SMTP id d9443c01a7336-23e256b5f6amr233001145ad.20.1753025051069;
        Sun, 20 Jul 2025 08:24:11 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.229.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6b561bsm42672895ad.89.2025.07.20.08.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 08:24:10 -0700 (PDT)
Message-ID: <d604104f-837d-34e2-ac62-261a8ccecfed@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 20:54:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v11 2/8] power: reset: reboot-mode: Add support for 64 bit
 magic
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
 <20250717-arm-psci-system_reset2-vendor-reboots-v11-2-df3e2b2183c3@oss.qualcomm.com>
 <6vlm3ybjpy2jq3cr2pzj4vcmqwoissdml2xmhfzlulfbrpzakt@xrepu6c5zykb>
 <713b2cc8-1bc7-a8b7-678b-5fc7fe25615a@oss.qualcomm.com>
 <8d4a42b6-657f-4c30-8e25-4213d8d53a89@lunn.ch>
 <1653597d-4d6b-a771-fbd8-c129c630ac0a@oss.qualcomm.com>
 <6227828c-5db0-41c8-956f-eea6f790ccac@lunn.ch>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <6227828c-5db0-41c8-956f-eea6f790ccac@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDE0OCBTYWx0ZWRfX92cq5uLLIc55
 hBdhXXo1a3SLAJ/ksQVEIJiadLkxm1tT05xVBn/0AL9Ra2Wk1n525+SUsvdjcEBsD/JZ46Ep3jL
 JCruZQ8uvJfccQmMa+pwcPDzLP+/IxXU3zDYdufc0aCdfzYK7NW6ofGkYvfiBn/IVLV5WCtAGLJ
 YYXhYY6cjJCYaHQiHrSxV4zxzbIQ3IjEu+uHpL5oq0JjPxFX9vE3RZH7n3ac8Y80v0Sj8M/RzPy
 oXQpMX5IyE9Fc18YTMKfgEK3antLD26halI/3BqZz0iK06WJK/ywxmrm6CCJTV4pP4hEOLtUJ28
 yD99xVg8cZ+idH7wtD0PiK8FX3z5O/g4HIvfipIcKlGeCtPdIUYvPIDiO4xnferoKtR/m3km3xf
 7jnLp4PfIW/GcRHdV3q7QljgFsAbKgcgjiMrdSG9TiyhvF1Lrea+lSEw1iPN5Qh38lXXl6G9
X-Proofpoint-ORIG-GUID: INVfb8sI7EBFRw_G9bEPget9a3Igg0L3
X-Proofpoint-GUID: INVfb8sI7EBFRw_G9bEPget9a3Igg0L3
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687d0a1c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=AKgrFWMC3jRjh4njwhq9Fg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EyloEgBdZQ85O2IC3a4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-20_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=762 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200148



On 7/20/2025 8:46 PM, Andrew Lunn wrote:
> On Sat, Jul 19, 2025 at 11:07:47PM +0530, Shivendra Pratap wrote:
>>
>>
>> On 7/19/2025 10:27 PM, Andrew Lunn wrote:
>>>>>> +static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>>>>>>  {
>>>>>>  	struct qcom_pon *pon = container_of
>>>>>>  			(reboot, struct qcom_pon, reboot_mode);
>>>>>> @@ -37,7 +36,7 @@ static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
>>>>>>  	ret = regmap_update_bits(pon->regmap,
>>>>>>  				 pon->baseaddr + PON_SOFT_RB_SPARE,
>>>>>>  				 GENMASK(7, pon->reason_shift),
>>>>>> -				 magic << pon->reason_shift);
>>>>>> +				 ((u32)magic) << pon->reason_shift);
>>>
>>> As a general rule of thumb, code with casts is poor quality code. Try
>>> to write the code without casts.
>>>
>>> Maybe something like
>>>
>>>       If (magic > MAX_U32)
>>>       	   return -EINVAL;
>>>
>>>       magic_32 = magic;
>> sure will update it. And in above, should it be recommended to add a explicit
>> cast(for any avoiding any compiler complains)?
>>  like: magic_32 = (u32)magic;
> 
> I would hope the compiler/optimiser can figure out from the test the
> line before that this is a safe conversion. So i don't think you need
> a cast.
sure, thanks.
> 
> 	Andrew

