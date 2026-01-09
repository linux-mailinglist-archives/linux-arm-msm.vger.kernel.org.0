Return-Path: <linux-arm-msm+bounces-88276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B83D0A325
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 14:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 387963215A49
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 12:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B553535C191;
	Fri,  9 Jan 2026 12:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="isagW9Oa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PeJ8+G8t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2B435BDAF
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 12:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767963230; cv=none; b=f5et+G8zoTvObbqZ1c/azQ60hkkGWHnohRIw9zLjvB/G7T5VCLjO9ZLrlli9wItXksnTc3rskcBPGHpHwwwcw2O/iNJYhK0xSVsdhg+Ppu+h192fkr+uvlARM/v3e72KXHY4CPAD+y8ESaFyzMVQ5OdUFHLxNtKbMaPUhcOwLzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767963230; c=relaxed/simple;
	bh=QnYYrlkVYCiOvJybO7kvRZie0Ce4eLvKW8PoPZQrr/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PxxtXIR6O4wwo4edFrRc146z4lpvqgNNXWfcvvatlEoXmFa+PlvFwuUdomD8ShLyn2VORhqvaYcnxNzGECDpFcydsXHI+RUW2t8ClcD9SPJ8/spnHkmus4YdAXX277o2FYpWdqDTZk365SzPRmc6lnzXwJCGGotAKsKBA72VVUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=isagW9Oa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PeJ8+G8t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099XjtB1048558
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 12:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vm/SUKhAk9K8mnKqx93R11C/mB3zc2gCcqEuYGanqE8=; b=isagW9OaX1wmnQQn
	BkJg8gEWx9S9Jnst1tymTCkHCB1Af/PelmcQurgA7IA2ajg/J26NctQnoOvOZyMb
	ydBNQvvXPKr+EjNNRIEhiRSPrKDnyDIazKakg3dCF+yiJdzhRvhQH8k+YfEydnT9
	A4J2lgTPrpN8d+vRxB2x8g+WEXvNLiSRaslNseheZ3UMfj+ADVshcPrtDj1ZLeU2
	qMUv9j5PTzu1D/mNvpNpTvvtnFOXvXrQUQdMUj7YnNSkJ5eUxYU1bszT5tQTX3to
	H6jgSdqzzed6bO4NBclCGeS6/aUI66iaMclYkLKUB2ZhZ9D9zwHMSZv+SVwkY+S7
	iPIQVA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjy5b8hb0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 12:53:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34ab459c051so9555037a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 04:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767963226; x=1768568026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vm/SUKhAk9K8mnKqx93R11C/mB3zc2gCcqEuYGanqE8=;
        b=PeJ8+G8tPwW2ecAEzm0R4zhPmUfYptTllxPuLFW+Vi/oFzIIIKFkiEXxV8E8KDucq6
         Rk3vaVmyj/HFf/P07q4ifWmvWvpiPS/b+fdHw5s0+jOmjHx6eEhs3wpxAwDyA3nXFluV
         VG28+XTxJK5aTOIlvN0YbMUi3Yt+YiJrhY+Q2rRG3Y6DIELApjaC7Pe7lZ68zHNQHOaG
         bSpQKdqaCdFa1Ur/ioZwc65zJtM84FJN6Ld2CuWZ7qfOmFzzyOdP573tiwNq+DBocKj2
         cmJz0w07+bsyvWdcfqyP2N5m0dmzlbmpQR8zB+pTqSzMVcfFsdYY7fe7I5PpMrYsQKMN
         zOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767963226; x=1768568026;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vm/SUKhAk9K8mnKqx93R11C/mB3zc2gCcqEuYGanqE8=;
        b=Sg3hHBdJ1UkYqhHgDdFzD9y8NqU7RW7iJTiZJdBnIY1ULBiXBT8JBI+dYC6H0m/Cia
         SnaVKoNh5jTB7BWQW5Otv0H9VAt9IC04AIAqje8SL+GqFQukEloZvWC0cKKWeSyoaVMV
         3O3fYi3RaOPlxIg5W0g05ljyyzHwHvbahRoX0QJakAhlcCeeAyt7TC9zpJAbINhJsKUQ
         anN94MZIknTCdyEfzJgydT+v/NqncBp6qhiI0uipvy13TDGVESY/G7W7s/K/bLnObFeN
         QZ0AM0V55zozNzZWh5fLSQlDGbwWxPoPm6DBqrQk5VVqCJVkN1HJfj/pfuKG4IZM1S8I
         acdg==
X-Forwarded-Encrypted: i=1; AJvYcCV1vz+3EH243bbi9GgeZmOOT3CR/eg2MCU4DI1C70Xel1t1zcMTWb7tv1pKkuRRDi28mRsF/sFVt1afrU+U@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxygvcr3SXVEVeDwnAdZbSxkVEEKZQTrQZBI53UDFjGpFqSnj3
	P+QcjHc3DOkxr5WflNEp2ZMO6+6MSoMRaujspiXHBo/VPpluvXq16x58g7LcxTMMSWAjhseXHtu
	hfO0+QtYO7nM/LJoGJ68rICYN2woapA7GMB2Vkm/3bfVzulyHi47ryvZpL7vMPAPSMt8f4Q8/Hl
	Q5
X-Gm-Gg: AY/fxX76P/vqhbqWIZ8YUuFhLvBBTzUTX4OM8pPBmsByPN8OCb4Z7bFd8SNH99feL++
	98pHWczsGMvSKfY8ExpS//pjC5JfyEe39JgIdpJe8BsYbWe+ifm7yULj4XeHhfiCO3Tlovk5cEa
	w6sbbpc82RY3pMWhdo18R6TkPUmxPxiR5BvjMrgXzNlyYV8MpTMC1yNm7ch7IcfWrFqiAA6Wf5j
	ZQNHFzQ6CjMOSvcJpdo1SYeL2wBYIcvFY2eI1fQwKgGZIcs9960LIvYiEJn+UxS5ZIkImIvpuxp
	RO5jd4uuGiug6YZ/PWxvoYPwiEbAwB6wFjtq6EkrxBrGP59UqYDJykfbqfDc2HE6sadDOPJ5wsM
	iyjWK0t1GjPhMLnd82UO4RfXeDkNGr2vvNHDgc4BdWA==
X-Received: by 2002:a17:902:cccc:b0:2a0:980a:4f0b with SMTP id d9443c01a7336-2a3ee49c6e8mr110019415ad.40.1767963225696;
        Fri, 09 Jan 2026 04:53:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCAxCgt3csbgYVuO8d3lkQPzp1KHgfQ/XXqrK1SLB1uYiZr92CZeF2Ey6XP0Z1Aldq+GsmnQ==
X-Received: by 2002:a17:902:cccc:b0:2a0:980a:4f0b with SMTP id d9443c01a7336-2a3ee49c6e8mr110019155ad.40.1767963225231;
        Fri, 09 Jan 2026 04:53:45 -0800 (PST)
Received: from [10.218.4.221] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c4796asm107201835ad.34.2026.01.09.04.53.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 04:53:44 -0800 (PST)
Message-ID: <5cdfe5a5-3c78-45a2-886c-768b224ad776@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 18:23:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus
 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: mkl@pengutronix.de, mani@kernel.org, thomas.kopp@microchip.com,
        mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
References: <20260108125200.2803112-1-viken.dadhaniya@oss.qualcomm.com>
 <20260108125200.2803112-3-viken.dadhaniya@oss.qualcomm.com>
 <n6affntgff5wy4xmm255v5h2ejpepicpz2cybcuvsxmry5td6u@jucskv7zrzvv>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <n6affntgff5wy4xmm255v5h2ejpepicpz2cybcuvsxmry5td6u@jucskv7zrzvv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tfRALh8q2yxRSI4K7sUV9bQBsfbR-9i4
X-Authority-Analysis: v=2.4 cv=JP42csKb c=1 sm=1 tr=0 ts=6960fa5b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pyxDk7YZ_2sT_cTTTuQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5NSBTYWx0ZWRfX2zHrk6LaL1Tf
 ZHu+twSYLMVuG5TJ77+mHKozaLR3vHiiFjKhp32cuhYQFGJePtS45bACxHo8Y60mW1zpU5Y5sHx
 GR0AtiCXj7/pmknEm9j37WRx1sJp6SE29i1PhS5HuxIg9BNzTeGjXeaVQTMP/doS0P49HIP0Qvi
 s2gmWH+Yf4hbcPAAnhpxg1XOxVNWuvP9JBgPAI/jmX3kyicOPrj9LurfYxsmoh/Val3p862zd2Z
 EWkbcTl0YXwXDdd9sm0y/eSeohzVMOfNLNk9syd44qXbH97MldWnovr2MJW5X8E+G3tdnpiA+qi
 9iCCJPEuaG+HhxcFIA4EGTYn1vUHig97cdcK9toYfb+B3IENWUIhq7rNW1xBbPvRRZmJRjaxQX0
 Gga9DKWB/Iv+NrG2RrDa0ldcEALyYOCRyWvinQOS7jP4c4Ad638ugsBeQfVT2q+bJ9sgYc54ASn
 fEytlDu0pqEYHzuXMdQ==
X-Proofpoint-GUID: tfRALh8q2yxRSI4K7sUV9bQBsfbR-9i4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090095



On 1/8/2026 7:33 PM, Dmitry Baryshkov wrote:
> On Thu, Jan 08, 2026 at 06:22:00PM +0530, Viken Dadhaniya wrote:
>> Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
>> The controller is connected via SPI3 and uses a 40 MHz oscillator.
>> A GPIO hog for GPIO0 is included to configure the CAN transceiver in
>> Normal mode during boot.
> 
> The main question is: what is so different between RB3 Gen2 and previous
> RB boards which also incorporated this CAN controller? Are there any
> board differences or is it that nobody tested the CAN beforehand?
> 

The behavior is consistent across platforms, but I do not have details on
how other platforms were tested.

On the RB3Gen2 board, communication with the PCAN interface requires the
CAN transceiver to be in normal mode. Since the GPIO-controller support
was recently integrated into the driver, I configured the transceiver using a
GPIO hog property. Without this configuration, the transceiver is not set
to normal mode, and CAN communication does not work.

>>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 30 ++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>
> 

