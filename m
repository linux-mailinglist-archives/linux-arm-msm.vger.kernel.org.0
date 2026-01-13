Return-Path: <linux-arm-msm+bounces-88800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63176D19A17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF282305CD26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 14:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27D82C3266;
	Tue, 13 Jan 2026 14:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jk9+WCRW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BMgOL6F2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BAB2D374F
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 14:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315869; cv=none; b=stQOcrZQMv0VSEi4stq0S6m+Rl7t0WshklPfwPU1CAfgUH10UXsah94BawkR6+hlfF/oAW06WbWUcAJV4epfeKEWV1LrEhuvpLfuaQwQLsM/zJW4m2xhoxiBoKBrENW8hXlUa8DH4uS2nc565b674kD0I9/YpcbZE2Zyz8+17xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315869; c=relaxed/simple;
	bh=2nUj0YvcLFuPq/h4uiDiJYV9JPHbujqeRFJqXOynDEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BoNHuj3hUiCBXE5/iV3lvvYLlnUCvAltL3sdN4FsoBJQ+URmlN8UHQBfQa7I+8pfNJhqhioQoUa/WbxPiUZSnTvxz9t9ypc5pdLOM7ru0J0HGduy1xxhjjKuEfzMjfo0fWYa+Cjx3h7yp1FqCIfNm1duHuazMFIZ7EqGdLSogvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jk9+WCRW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BMgOL6F2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DEjJ7D4080696
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 14:51:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jtSdc8DZrSmGyslV6uF/9RQzrVXkskQKPFX+tg7xvZU=; b=Jk9+WCRWb1fMEAze
	kOWfggqsomC9/9gF3bIVWXPdPjmYFAo8dQn1dOyiaIrBPgO9CI7Wp7ipl0z0cc8v
	E3CNtv9Td6R1rDsk+ZHPs0Qyy8mwjuQz1cT9qe6Q54MklQB3a0TI/xFZai/ePfM/
	yKKDDdw+ADiifd25HP/QpBHDNKjSrGOwKuN6ABOcs+yFTLHJ1juHvhiCz9Sfhgmj
	yktNlhu9YUkMBPFWo2KCbSGcwuGuy/w0En5EGCfZ/3zGxO52iTkpt6tR6vYEetxc
	+axuNKKjU9A+CBd3p7PN9myUD5aefv58DW0bfyc4aeNdmwgcoq0OOjoviE65lXgz
	e3cw9A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnr3e80kk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 14:51:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b25c5dc2c3so154716485a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768315865; x=1768920665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jtSdc8DZrSmGyslV6uF/9RQzrVXkskQKPFX+tg7xvZU=;
        b=BMgOL6F2cb8UB8QVasVcxPnpTc/nAW6h/mhmt+Y0/FUsYCBsR9NuHKaFufViVhwpQN
         xzjAejlDSQ41LHRQiMeGLIhVHHoevPWwoD+PYh3SL57A1f8MwMNSeAlhSiK3uUxHUMRm
         MkfbpdVFfcKBWQV9QlVIS9FLELFQNiqioNkNSUbpfRHJOblR/TRxW84Sv7Cajr4djY8Q
         nD/QIjiceBuRfN1qAVm6wAx8eGPYZ27C1qhk7qbNQ2cQGF+Z9UohopUPAZzhMGdtlGu5
         sjT8bNjtCTzaRDKIoDSFwqMsprM1cJ/iNM/gMt2tDbo1JPxOXVd2yfvxXc3ArbndbFxz
         3Qtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768315865; x=1768920665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtSdc8DZrSmGyslV6uF/9RQzrVXkskQKPFX+tg7xvZU=;
        b=BNtg2aKWEMNDdcNYlIs3L+vn6ZFuCJPSWTw3EGbE7vrYPCTQ6IMn0hxYG5kBsDXJPy
         8eUDX9O+DqkN/l4tImQaEG/BqMCtmO4fmWgL3STZxRQpcHhfuL/rwAMkzYRFG+hKNp/i
         OJAut345w7SuIBkdG24SdQOuqxiyAT4QRutQzX671JPFolkZ/dW5l0oFJYcA0eMKPPC9
         bPwYYI7mB5m2tjPoTqQzf2dcy8ydFjVo3TqCWl3weO6qM956tgOsr/Y5d4g4CVWRd6gT
         pbVApxS+Fk4OH3dQVL8eWq93gLVmvJezYoN+7KklrrMwM7FhbXyyw747wGDOPelRwfX5
         NMxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbZGt7g5at79Kn1ZJrpoo78VPJvKar1ZHl8N4/DeTfXgIjcHniOWMczB/ctnVZWz6VZWIy4K6pNJmoEMxe@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm2HNmQSKHyh/Ri6j+oSD5kLnDUiGxAVfHGhpenr0qlEKwmE7a
	ZBXyWL/J/sVHglm9dgelUxTMU2PxEpthD0fOk5N4mu7srVhlYEnJFgPryaWzFq8viHy+8w9LbZD
	JSsaCp1FSy9zV1p2ZkxB2ScNr8cFDxMJcNp0SCbOmV1XOtWds7gDjjyQWIK+8058PaAW1
X-Gm-Gg: AY/fxX67dcn3sNn6WcbbgjXgeUl/OFgL6SmuB86JyCOm42rXNMjFmN+RdNodSE7VQs7
	S804DRRvxdCHrsKW/Dhhdc1t/bXYj2BudgebSnEYV8gZ4FGvFj8BllFBuj+XXpVJNJsEqAE4lzZ
	ei8W0pPKAZMbCKMTu9328hHLkzGGHtYvsXnQ8TrH4AvyJdBtQMU07DgzASwwuKEccO/3MP3MdzA
	MlQegQ0Qdj58FA78tFupULv3J4Y+8XYHbNBH0aYLjSjblgOkY0tREgPEFzEKCYdbGJWmEiI45O4
	OY6dQdY0UmOpRjzIoof+5rDx7sGyTFT+Xmv0HnxdAeBxgC3RFSKYYPIFunELckxq9+gkb39uPFF
	61DmkFgDIEIbm/g/iP9Rpqf965RImQtRoWWHJ5hnwIGh7DonoPPfRzTulPpVG7HleslI=
X-Received: by 2002:a05:620a:700d:b0:8b2:1f8d:f11d with SMTP id af79cd13be357-8c389365c0amr2112729385a.2.1768315865184;
        Tue, 13 Jan 2026 06:51:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLf/yNnTDE13ciYzPMadWSpxOvbX2cTLvRSze2xcqIJ+7Ha0WubguCkyEWH65yQ0GG0Vm98g==
X-Received: by 2002:a05:620a:700d:b0:8b2:1f8d:f11d with SMTP id af79cd13be357-8c389365c0amr2112725085a.2.1768315864620;
        Tue, 13 Jan 2026 06:51:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b8c3f89sm20278699a12.5.2026.01.13.06.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 06:51:04 -0800 (PST)
Message-ID: <85c067c1-8a73-4bd5-8561-2cf80e2eab2b@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 15:51:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus
 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: mkl@pengutronix.de, mani@kernel.org, thomas.kopp@microchip.com,
        mailhol@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        linux-can@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
References: <20260108125200.2803112-1-viken.dadhaniya@oss.qualcomm.com>
 <20260108125200.2803112-3-viken.dadhaniya@oss.qualcomm.com>
 <n6affntgff5wy4xmm255v5h2ejpepicpz2cybcuvsxmry5td6u@jucskv7zrzvv>
 <5cdfe5a5-3c78-45a2-886c-768b224ad776@oss.qualcomm.com>
 <wbx2qrkhpsntggzqkzkpi4sa6qv3buhkjbwmjoa7zgw2oc4b7u@qugyhcxb6qrh>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <wbx2qrkhpsntggzqkzkpi4sa6qv3buhkjbwmjoa7zgw2oc4b7u@qugyhcxb6qrh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TPFIilla c=1 sm=1 tr=0 ts=69665bd9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=IvRgekr50X0SvLIQHyAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyNSBTYWx0ZWRfX68c2TU0GVmyl
 pGAVj+kiQpHbH++aw9g6gN3lPXnlHxgM04HIWW+hqnsAI6S1ZmB5FRNupJJFkmIIrUKIk1u9uKN
 5B3Pjw44ks0BO+SDPVonqtRhSAD+C8rDC9KqWXf/sCUiUH2ZwjHMu3LuaNsCGcbtLGOGLqXC1sk
 P7rowQrVvF4/T0yOswR7DAKbWWru5ahUiCoYvQw/8KxCWxb5c1uQQlnkJ6EGYkfeS/PM9HYj/tK
 T3ym21OaHsoxMsCcR98WDjU7MfUA0K1bGfi3J7XY6q+ivTmSP7f1ZolxGDEbjKSqdRQCzH+JM8L
 GNHWqSItPhvy5QlricgWjwNdzw+GaVD5/QmzM5aWoOJqBs7tdOAFbvsVNHZxAU95HiHg/1qkqOZ
 B7ezFuwfINGp4PRRQokPSqPRR/SrEWBFrSMvJqkHWcPOVxRIFR+DXV5ba1qhXxnRARpyeitbGHm
 ykKEiWia6h5Xx+J0/aQ==
X-Proofpoint-GUID: Y2DHbyYch_aJhccM46fIxB9yPUsjPHOh
X-Proofpoint-ORIG-GUID: Y2DHbyYch_aJhccM46fIxB9yPUsjPHOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130125

On 1/9/26 3:05 PM, Dmitry Baryshkov wrote:
> On Fri, Jan 09, 2026 at 06:23:39PM +0530, Viken Dadhaniya wrote:
>>
>>
>> On 1/8/2026 7:33 PM, Dmitry Baryshkov wrote:
>>> On Thu, Jan 08, 2026 at 06:22:00PM +0530, Viken Dadhaniya wrote:
>>>> Enable the MCP2518FD CAN controller on the QCS6490 RB3 Gen2 platform.
>>>> The controller is connected via SPI3 and uses a 40 MHz oscillator.
>>>> A GPIO hog for GPIO0 is included to configure the CAN transceiver in
>>>> Normal mode during boot.
>>>
>>> The main question is: what is so different between RB3 Gen2 and previous
>>> RB boards which also incorporated this CAN controller? Are there any
>>> board differences or is it that nobody tested the CAN beforehand?
>>>
>>
>> The behavior is consistent across platforms, but I do not have details on
>> how other platforms were tested.
>>
>> On the RB3Gen2 board, communication with the PCAN interface requires the
>> CAN transceiver to be in normal mode. Since the GPIO-controller support
>> was recently integrated into the driver, I configured the transceiver using a
>> GPIO hog property. Without this configuration, the transceiver is not set
>> to normal mode, and CAN communication does not work.
> 
> How do we verify the mode on a running system? I have the boards, but I
> don't have anything connected to them over the CAN bus.
> 
> BTW: can you recommend any simple setup to actually test the CAN bus on
> those devices?

(please document the reply to this somewhere internally)

Konrad

