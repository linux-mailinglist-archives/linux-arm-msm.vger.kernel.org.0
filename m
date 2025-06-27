Return-Path: <linux-arm-msm+bounces-62814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1021AEBB51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 17:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EF211C63194
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 15:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848652EA732;
	Fri, 27 Jun 2025 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OnDg/9hd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CAB1C6FE8
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751036988; cv=none; b=g33W3IKsWAtqe55CFjNnpErxmmo9trEC4ajl3e7x4SOpjlBmJyIi9xTRh+W+YPI9fF+eRryBqDsX9f0nfhB3w4HSVwydkVgDvZt+OPD4RfXkIHKhnP64qXC5lemFFu0RiKO/g6rKJPCdp53gXjHfKycHASBLIq0/1P9EH+9Xrnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751036988; c=relaxed/simple;
	bh=Rs39AICjklGcyc7xDCTetXh1jXW242vqtldO29LpJBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O+0k9ttS+JH8AzfP4kdlmHjG8g9bZ/MceZU5fkaCUpH3F+FU7jmysGjT0U1UfD4HoB4eMbR6X1GAj/dp6EUxm+UjGVk2Ug1CmRm5YobpxCQpIo8Kl2e5aybJW3PRBGvVZgxXGu0QV0n5na98BwfakfYCB/D0lANWh9lDQc2zKpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OnDg/9hd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCCUvW029118
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8MYuuA2G+3W/uvr0CyQxqIxAaENDczI3l8DDQQ0A/Hc=; b=OnDg/9hdtmSvSmLL
	ynNfsbbnIiwSr9BjDUizsy7NdocbsgLRPVZ1tZY6zI7W/Znhw5Q4VQmtZrZNnYkN
	DrXQjKxWT0Vkmprkm49OW60kG8OGUUGZDnbQQm0RKrQDzN0YpkuG1As1fmIE0j9X
	ppMNRr0jnxXFUULrFbUiGAwN1dYnVf9B+5BvNXfNKdjpKCbrqaqsp7uCiALDTNh8
	48OotKF8Ohg6Tf/NX5ME2xK425160xlk4oyt9ZZUpMsyhIr5GO4VKadfXtgdFlD5
	KQYz61rXfD7H/NAyGfYIBX+JulUwZApu4X5e5u6qr4TV368xP5cmi6MgLbKcPFoR
	t5LcEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47hkpbhx8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 15:09:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09a3b806aso42276185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 08:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751036985; x=1751641785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8MYuuA2G+3W/uvr0CyQxqIxAaENDczI3l8DDQQ0A/Hc=;
        b=ktAR+CHmhdCFV8XFcaLeQ551YIRFSRbdQf3NJoaOMvBYPtyFiPJ+ZxJr+mToETQbv8
         ZYnFUXof4VsiePzsGr+jW78PY3EkwOMDl8TJPYIuTLQ0hx//9x1OX4gTaLZfMh1JA6xb
         0vEP6tY8wTdm4XkhRfxehdVTLZRxkY1B3g9IgsH8PUbz8SKihd0RErmP8Y1OOwQEdWhs
         9A1PWR3GDwanUkuALcV2c4Jgkrrk1CfqxOMLn1KeQZBfIodSAAbWpcei4GGoihOp0Vqf
         dew3Sw2CklON0tXpjejWJ+xLGFb0KzOwe1tqGrCqlLCsZs/RRNdQUyxPnFV4M+Ee6x2e
         3Sqg==
X-Forwarded-Encrypted: i=1; AJvYcCUn+LJO3cIAP/oGPFZAhMGDdbAQUiysSiv9KgqaUqml3ZXvpxdFihOXcs2l1gtGFuHY0qvmJcO1aeU31ZN8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/VXA1AGaqwG61rthnfBKHchS/XPf0LNeqpMhh5YVyB9PXQ25J
	u//7p2hT0SFpeTZKcteL6MdP72XjMVC+kyOEEWOlGlPwqZUc0Dg+fhuLfZbjNJVnw3v6n6tIPk8
	BEzC+LQ0OdUm0R8CWhAPUt+N0MtoRyIUrQiBkCaygnWAhb8QU2aI+1zQI64k71byU08XI
X-Gm-Gg: ASbGncvpziZoeBBF+MHhEkBUOZ/4mb1SBZsO86MjUnV8nrz2p+zCacHyfC1RirTE8hH
	Sz1FEp4j/XHmHyrlQDsFDh08QchJOQljX26eG3UT3CdNlybZEKRYXuEuTwVMKMCo9QSLohEYf+9
	ZmCm7yNmrh1t7Vu7thkXGYFpaewGjf4gfbwuyiPahR8eWx74f6ThzRpT+/ZY/QhWBJfL0fKvEnm
	J5hrWAYJ8YyzJ7YfFot0z6Y1RsRxD7Cp7F6xU+cn5A1R0WofU3Iyk+0zV61DIN3OzUDKiUPMrVI
	9c6/eJdhYb8ymIDke5K8Jdmgbo5YhKk24DD6DVibfdnOMU5hiZSlMN7vtePaBCvAfTzClsaopi9
	Nb90=
X-Received: by 2002:a05:620a:6011:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d44393af52mr210731685a.8.1751036984776;
        Fri, 27 Jun 2025 08:09:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt0El1GcFRYFDLI+q1hURApBGF+0X3eNxXSn7/tVJPwdQii+67Yzh11WAEpAraqUYgdU6DMQ==
X-Received: by 2002:a05:620a:6011:b0:7c0:c024:d5 with SMTP id af79cd13be357-7d44393af52mr210728585a.8.1751036984230;
        Fri, 27 Jun 2025 08:09:44 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8292076csm1554764a12.32.2025.06.27.08.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:09:43 -0700 (PDT)
Message-ID: <c37349c0-8ec0-4654-bc82-15190509ddeb@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 17:09:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
 <20250612-qcs615-mm-v9-clock-controllers-v9-1-b34dc78d6e1b@quicinc.com>
 <f0483597-45b9-49f8-b316-a9cde7b98d81@oss.qualcomm.com>
 <9a9d84e3-49de-4fbd-9c0d-180e3e498125@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9a9d84e3-49de-4fbd-9c0d-180e3e498125@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyMiBTYWx0ZWRfXw8EspzLD0cEg
 e6v6B6Z7l4kdj+MPRm7V/SzXbPrHwIhCjLZilGpP3m46Ool+NFCE61TAcxbNShqGxtFmHrEs0DJ
 //GVYEHql4WlYk5HmdKPyjnmvbd4NaGsl3hxu+2ZKxKFIkduvsEekWoTI3c29JsRfoq08jtwP4q
 QuHpmj614T5xmR4HTyFw/LFXvh7Q5/jOslbIk6KHd0bCsAj03j5v84f8RYZvIbbRzwXDS3K/KUB
 sCidGEMy9PMb4KCaYUppx+clrhY4j5zmBuYDopfsK1L5RzfPFQrUouQ0WStOcq3s8kK32Ydd+wU
 dE+sYx+eaMgAgMgBEfugT8LxQfbxL/8YmmBXPRROmrS0fbZQHxngQry0YpD+iXqeRkdRakpnU13
 iAA8S0+KGo6n4eaZK7FxkwWskQPT51xa9JdeehspBNLUli7lgyBa2hZNUvqY+1jSAQQVEmBu
X-Proofpoint-GUID: z2mZRH4osnAJXV-IovgbNpTE5JTjdi0M
X-Authority-Analysis: v=2.4 cv=AY2xH2XG c=1 sm=1 tr=0 ts=685eb439 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=Wx9hSxQhFZ4lEN4NqugA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: z2mZRH4osnAJXV-IovgbNpTE5JTjdi0M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270122

On 6/25/25 12:31 PM, Taniya Das wrote:
> 
> 
> On 6/15/2025 12:20 AM, Konrad Dybcio wrote:
>> On 6/12/25 11:55 AM, Taniya Das wrote:
>>> The alpha PLLs which slew to a new frequency at runtime would require
>>> the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
>>> which can support the slewing of the PLL to a new frequency.
>>>
>>> Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---

[...]

>>> +	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
>>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
>>> +	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
>>> +
>>> +	/* Ensure that the write above goes before slewing the PLL */
>>> +	mb();
>>
>> Here however, the write may not arrive at the clock controller before you
>> proceed to slew_update()
>>
> 
> Yes, it is required here and will keep it.

You should change it to a readback instead

Konrad

