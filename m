Return-Path: <linux-arm-msm+bounces-87846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E11CFD47D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 11:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A317C305E156
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 10:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086492E7631;
	Wed,  7 Jan 2026 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AybS1e2T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RbO009lf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C1C76025
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782784; cv=none; b=rlJupq2wc3JCnJgJpUyNKxNi+NU11O6LBL+DGvpewfNUeQvYYTQFtr3QymMdQtP1Cu6qvYE1EmXoC3dUIYNTINDtQEXEq09f3dJoF0D+IX/DOyovagvrfFtCmUhwMiz+I5Lgx26uvjD7N+CcSt0VpAcYcmgv5VG6L7sVm8QO5Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782784; c=relaxed/simple;
	bh=q5S4fdHqMsch4td/h2LL4IrtKsgHVAuzwFGJs8ryTE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LsdqtnK/AaQ9BrttfCBA6Cy7hLscdXr6TLlfbe/UbzeHpVDlJqCpX7/PQ2tgAOaJKn3nBhc7YHULMYNQuJzXg2oA0tbCTbwJ/TdA1681eUv0waqEwderEfeznB8zUPXh1t6u7bqKl/pPMcmkkIV05eqBaKDTRdj5TZ/lffZIstY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AybS1e2T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RbO009lf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6074m14i1642761
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 10:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2nbs9WFJ7QadKnF6E6gy96Pbt7hBLo4hqc0fq+uZpnY=; b=AybS1e2T8z0cUUnN
	lxUakeSxOakxRcviDNWcI2yYplf8nOyiOdNzkJ+lqMrg7iniq4T8R512Q5g4M2qS
	nELQJ7tanNX0zWBobTexF4tmpoWWTpJfNiShRfpsJVccQ8HZhykbbVpdr75mGm6O
	rksZAT2lYf3iub1h4kpPRwTEi5hMDr9zo28hETAzoyacCa5qbWqpXVuR5No0bdW5
	CT3uOuU7vohsznImNTQsX3dxc3aFCA1BgA//HdU+EIdbNrLz6OndFJCjUlhDrO6e
	2jtiCdaIrWHipSq9VfizY4/JlrV2wEFTuUFXbHl2W/qxWyzIVnWs1AOZf1c/fo8q
	CVdqMQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhgsfh375-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 10:46:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f357ab5757so6307641cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 02:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767782782; x=1768387582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2nbs9WFJ7QadKnF6E6gy96Pbt7hBLo4hqc0fq+uZpnY=;
        b=RbO009lfZJJCw28Hta+iSYYoagbOKcl5uO9V0+k+vNPSX96M3XVfHkHml4exnDSWo+
         n4CHN79ZS1ODn3NvotZ3T9f7UTpAjiirZQ0Vtm/kaQ9aY9DXwveMNO6fheFIomrzYBwC
         cdhIy+Q5RFJzzcdiiM11UfSKqQQCHxDIJnhPnu8iKMadOSZK1fb9S7M1ofpNy2XDl83L
         +PIvD5u1e/n8nO2UgkvFxJ9d6qy+FpEXLlBUtVbDBjt3zvWNmMqV3DW5oWyCK4L1qDl7
         8apkMF4W2WpDPQ4PX2av0G1FsTwr6ljSZ2/6l+wrSDL+pLpWHn4mn5yhypJfco2EEFzU
         o4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767782782; x=1768387582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2nbs9WFJ7QadKnF6E6gy96Pbt7hBLo4hqc0fq+uZpnY=;
        b=GSVxiKjkUuHonYiBUXP+bFwIesiRVZ4AawV0by+PpfQnMMppQZ9WlDp2oDNSyZGO4G
         2cDfavCYyqeatdK94P7GM7/d/wcoDPwRHugKhz92APtESnxVn2/Feq6FQpUvyJWOlWTp
         2DL4IZ18jUwIusgwfGyhD+vX5vYW87JFevGSbw0dXIixR0ZIWCxVvjU0Tx2TGVu9+8mX
         rJN1fNZWXVC3JMooVelORBzjyUKF7iRgeDFYlkYAViUU2L2pnfG8u3vGSEuqBg2PtsHx
         msNWeh5qgoLMh09lpIEq6EerJqcFA/JuBqQKoJyLrdubM+dYx1QJjqtFTPvgljjdtEbm
         zEVQ==
X-Forwarded-Encrypted: i=1; AJvYcCURy1w5xo9d0hRefjMKVpX0BYD1WliUZEHXrjJSNV+leq52SFVO2VFZLQjgMOkJKsPg1n+W0kP/YtOcnoxY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc17Relxp148b3DRnEFoMQ2QFFbLHzBOZOHHvuSW8ZjTKz69Hj
	TdICG3Xodkkf6m/5jcZcYEyuhAhBEwAZSJ4hkBoDNoyVUIGNj2KDHffmvQ3avq7xnpk+ocLscTS
	oNAikoglZwzntwGljCHu2j55hfO34iZ2jfck1mgRa/rSsLtl1Pqzn/vr1N2N6DA5uu6Ki
X-Gm-Gg: AY/fxX5W2stLLqJRCOMtyGlBa7y0NYXaAuaXspZ5Q637sluqnCqmUvICtw0lelZnjgV
	5OWC8rY0Ypp/OOuTz0kVGYtbj8hypT/piZiY1F2zGyrExcPMN1oFLvgfxGCzlm5C1oneaEu3s6j
	y2IhU9EejYjslTpfyE2hNQM8PrehxIfwHXX5s7AaO/exL5TY5tzEEKS0nOUeDy+KAtuL0VXFZtU
	ITKo7PP+nQwWPW8lx8c9JV7vR3mw8udP+0z3pY6bnK/MP7FAfXFXe5X2vDlgwXw2rWo0ytb40tr
	YA09s36JrNRs+ItiXBupCXEwVuwdiz+esp73kESFgCQ6slaK9wTIQ9JYmKASj3Og3Q0OpFUoYai
	KHjKl5z8cFDVKB5OUPEPFCRiR738kHBQPQHQvjqieFXnE6cVTkRMzkG85wKgwIQ8JbQM=
X-Received: by 2002:a05:622a:8a:b0:4f1:840a:c90f with SMTP id d75a77b69052e-4ffb47e3b0dmr21036311cf.2.1767782781491;
        Wed, 07 Jan 2026 02:46:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEe6ogJjUEG1iOjplpGO6qSFKv7j2a4fS0YdQtvynV52g/BonPAF9TSUSzWAjYcQD1tMY84yg==
X-Received: by 2002:a05:622a:8a:b0:4f1:840a:c90f with SMTP id d75a77b69052e-4ffb47e3b0dmr21036051cf.2.1767782781047;
        Wed, 07 Jan 2026 02:46:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf65ca0sm4375962a12.24.2026.01.07.02.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 02:46:20 -0800 (PST)
Message-ID: <c0fd52a2-56a8-47cc-ad40-8c14c269445b@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 11:46:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] serial: qcom_geni: Fix BT failure regression on RB2
 platform
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        bryan.odonoghue@linaro.org, andersson@kernel.org, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
References: <20260107064834.1006428-1-praveen.talari@oss.qualcomm.com>
 <CAO9ioeUsLwOs2RqGPcbeuOpHg4zuwwsstjJnTCH4-oRL=ss6kQ@mail.gmail.com>
 <be79091d-3b2d-41bd-9303-2c8a64dde9c4@oss.qualcomm.com>
 <CAO9ioeW=7z=LchdOOfdtujCGJ5Yb3BxeLA_w=ktYQjgpyv2RaQ@mail.gmail.com>
 <36d8fb98-562a-43dc-8b47-b4f6d29475f1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <36d8fb98-562a-43dc-8b47-b4f6d29475f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4NyBTYWx0ZWRfX+ByHuBl73+NG
 qnuT/WvHnqlXPFx+sY+fH8QGPR0+a72BQzS7itqhyllhtZY7AZea6zUcAJVhJFZUQEBApl8tArX
 MGQ3JE1krqxmfsKeG0yZ9aCU0QewIEPWqzSj2L7Qo5l3UISVLLb7C0Y5W9MPBzZEuQerZ0rQxsk
 2qVTstQ9zXPjBHg0u+6B1b9y5ntLdms3/Z0fLgXT9XvPNOVVRWGOl0cqwzIoW5b65ZEBIU3ClEz
 LuACUbQAhLOq50xQKsF7etAejrkYFPDQTfWRYsCxngbvUiYcsSbFBDg85FOwPX4Qy3suC3w79mb
 xb2XOYVEFy29m67jl4WxpT5JrUG5tgvlqirmC+QLMclt326GU4JWpg1bIYuKePEBUtpz2YjRKD+
 S2Alacf+DarxsjRprk/n3zCaxMKdYvNYvNMcErY53tAAakPM6q54RzAFYJaGL1Ff4eijLdgMXvm
 shF++XSzCb/cfBujgLw==
X-Proofpoint-GUID: cfFTjhTe6_aSyUQZDUfv8g3-HqO4FtKz
X-Proofpoint-ORIG-GUID: cfFTjhTe6_aSyUQZDUfv8g3-HqO4FtKz
X-Authority-Analysis: v=2.4 cv=Abi83nXG c=1 sm=1 tr=0 ts=695e397e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=jycnLKW9hUOS54IP5eQA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070087

On 1/7/26 10:24 AM, Praveen Talari wrote:
> Hi
> 
> On 1/7/2026 12:52 PM, Dmitry Baryshkov wrote:
>> On Wed, 7 Jan 2026 at 09:06, Praveen Talari
>> <praveen.talari@oss.qualcomm.com> wrote:
>>>
>>> Hi Dmistry,
>>>
>>> On 1/7/2026 12:24 PM, Dmitry Baryshkov wrote:
>>>> On Wed, 7 Jan 2026 at 08:48, Praveen Talari
>>>> <praveen.talari@oss.qualcomm.com> wrote:
>>>>>
>>>>> A regression in linux-next causes Bluetooth functionality to fail during
>>>>
>>>> linux-next is an ephemeral thing. Please reference the exact commit.
>>>>
>>>>> bootup on the RB2 platform, preventing proper BT initialization. However,
>>>>> BT works correctly after bootup completes.
>>>>>
>>>>> The issue occurs when runtime PM is enabled and uart_add_one_port() is
>>>>> called before wakeup IRQ setup. The uart_add_one_port() call activates the
>>>>> device through runtime PM, which configures GPIOs to their default state.
>>>>> When wakeup IRQ registration happens afterward, it conflicts with these
>>>>> GPIO settings, causing state corruption that breaks Bluetooth
>>>>> functionality.
>>>>
>>>> How does it "conflict with GPIO settings", what is "state corruption"?
>>>
>>> I mean the issue occurs because the GPIO state is being altered during
>>> the wakeup source registration process..
>>
>> Altered how?
> 
> During the runtime resume of devices, GPIOs are configured to QUP mode. However, when registering the wakeup IRQ using dev_pm_set_dedicated_wake_irq(), these GPIOs are reset back to FUNC mode, which impacts the RX GPIO and leads to Bluetooth failures

"QUP mode" and "FUNC mode" are tough to swallow even for an insider.. How
about:

"qup_x" and "gpio" pinmux functions

?

Konrad

