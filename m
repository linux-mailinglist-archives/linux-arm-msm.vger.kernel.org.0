Return-Path: <linux-arm-msm+bounces-103247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMVDB7RT32l1RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:00:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB37402429
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B190302F730
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 08:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D5D43D524D;
	Wed, 15 Apr 2026 08:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZ0Uebp4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j/0WM6et"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2906F18DB1F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243396; cv=none; b=GIfJRSugQUmBUo01gCZplYhBwaMb56LkQz0xJriQUYQ85ENz4F7eoVcD6woRB13og7oGcvRy+dGcZxsNBQwd1lmAoMMc8gMhh0NvHZll3oC765/atd6Y6W5lzNIBus8eRo0xwf/mZWZK3mGtvRcl9xyfozCBhmS9sh89T5luD48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243396; c=relaxed/simple;
	bh=VYwZ55ze69o8u7PZFAwrAHqzRNPJl92Yyq9zPCoHx7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxbJDz2YhyFdFp4SHb1wrGFBhn3rlU/EXqmkceWMiEn7UyBa9qHYdQCb7yJ7QuuiFPRxgBqI8ZGEp/tIf92iSCZX/gntfzkejemRDz5KBvAG4oAo/fB8OOqWBYAslkKDR4nTHZNhWfKMY1igyXhWUYBm199FVqJgAq+7xcuH8sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZ0Uebp4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j/0WM6et; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F85dJG3936607
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 08:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/frILHXn/mBZKU9JIR1yyak2aX5M5anTEZUnZNPv1tg=; b=hZ0Uebp4YXLPvPuS
	TMSB9U4WGf763twYB1B8nLl8B+w/ms8UWc1c0eaXwsLm8JlEI/k3yeAROmlhZYZU
	BMjjfc5BFpsR8gM9c/84Z5kmqyXgHNyn0d0vYTaQsgqfL0aD2BnfKKmC4Cg8Ee3F
	XClWDtXkEClEUROTdCs+42bDVPRmpJ+jso9bgPakXb85QzynCVz+ZkSMDbPcxpDe
	Nw6c+ibDRautVTfWM9YdmMPnxVkBF8H23TW33LHqObJ72kq/PhwSwrLr0VVJQ5Hr
	j/A5C1gB8JTv8v7jkwoxYD3KUaddLB+jZ0IyfPHzH1KOB25wLjhqkK0DgL2WPSpK
	FDKx5w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrbf328r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 08:56:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8acb3741d12so8725736d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 01:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776243392; x=1776848192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/frILHXn/mBZKU9JIR1yyak2aX5M5anTEZUnZNPv1tg=;
        b=j/0WM6etUArY8mLMrfObGMLULt4ruZrqCBgumQYYVM0uLsUnYLCOeO8d/Ecx6/AFDg
         DdAPIJMNGiZA5WVvSFOnP26Z2V9iq2ILjYHyLxLlUkEbjW++kdNdmuyWgD41FNkTDHdP
         KE/fHrnEwxBEMxD/rf6vSyIboV4aEB0SkFhfoCGbVLRDnxstyNinZQ6EQP1tC+XAP93W
         YNt67Myxfgi/UtrCqdywHe32+v7mKgcxXQe4OAkufMExJgC/QBbJDPYQt9s80bvVi+so
         sjMYNkEmN+Cym6C86sQp88OAtHl8AoQFORNyDH8aVmFEuINwhAMCg1ik72LFM6s9sHvi
         D1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776243392; x=1776848192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/frILHXn/mBZKU9JIR1yyak2aX5M5anTEZUnZNPv1tg=;
        b=QkZ4bR6ffRRC+scpw7IKA0/2+osO0m3fHWR3sRzn9953sGoxkPVLqO4dTUTg1xZmeX
         gh0yWUUJQPMuiheGXSeUlELxwuJxIT1Yl727qTw3kRMDntVtLVeSJ0QZj9cI+vQ1Rfcg
         ihgK2p5qNsca+OKqFw+hNrUzb+hI0AllnUi/zc/Ojc3hjEzwip9ibhoxqDoUcAa4gZZn
         N7Q4q118jCptXI9HKpAby+hlfqLPcDn6sYi5PUf3h8rgBrMIdlb7H1ieVCjQJfDH+DoG
         ax1PjifyXEmHzMe8tpW+LAN6HrPX3+SuaB+iKJepc2D54u8JINlB7oaiA3fsvoxckBJ+
         fR1g==
X-Forwarded-Encrypted: i=1; AFNElJ/wU7aWJtfcPnVyt2HzM+dnuvhxmb4K2jR5HVQ1RQNENzD4Cotp8oq4r93yWCKGoUNV0TIrs6oY3hBniP9Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt3JPgF6KI5x8FIordaxd44/znVKK7QF+t2gTMLm+h4dnud5oB
	b7NCY8839ANKGRbcUQQoCahRRui5mEtictbwl62hb6JOYmY7+fHJdJCLR0SGKk8/nLcH+2rMnx5
	h3qUGkiKgZ2vMPf/8wzJSgYU5+bfMI10t6GqQ6/eu6/XPxFPzFRy+Xc2s6fJWGMDSJjVJ
X-Gm-Gg: AeBDiesnR/saDiLE0NPxS8G3G5JtqjMGD1LNSItdJo93nDu8SUwe68/3jCLb0kWQLPv
	a1kZdn1Nu5yRwUppDazPJE9bsQrGUKZtWXSmaVO2LV/DufhQEIpZx3S1TGauk1wXVa22yJFzcrT
	pAFGDuEkyXTd8CSm1IA2BRslhQNd8ttJ8g0DptuRIBGuk58+AQAt94TvDkopuaeT3ALlMohqw6P
	HFRZlXQ6+GkZvwkJ+3cMIHYZzBVo8GhM43PNPpTm4D/Wu9v7VDR8ZwWnJbFHI4S+h8KB9QOX6cH
	OPA/BTJ4SUxIa3/gYrrEXgN6r/IyE1Y0NMsmkVTxg0vk2hISNM0XCKg3VopTRakJRP/gehjmjev
	MoFHhqnJIFy42IuL/ehQDwnFT3VVQeVW/KX71VEymjj5ipTjbSq0XAiWd5hY2pieZ2p9EmRQ7Kg
	MVJ24Yxb1kTPbtgw==
X-Received: by 2002:a05:6214:da4:b0:8ac:8337:ca0e with SMTP id 6a1803df08f44-8ae6a92e620mr18291556d6.6.1776243392449;
        Wed, 15 Apr 2026 01:56:32 -0700 (PDT)
X-Received: by 2002:a05:6214:da4:b0:8ac:8337:ca0e with SMTP id 6a1803df08f44-8ae6a92e620mr18291296d6.6.1776243392002;
        Wed, 15 Apr 2026 01:56:32 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1773c381bsm33817966b.40.2026.04.15.01.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 01:56:30 -0700 (PDT)
Message-ID: <64ddaf47-d780-4058-9788-7e734a7070a0@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 10:56:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: Enable CAN RX via GPIO expander
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, viken.dadhaniya@oss.qualcomm.com
References: <20260402105253.3009382-1-anup.kulkarni@oss.qualcomm.com>
 <tuanv2szadq5pnndy4zfxg4mo73pplfv3omanpsc3mcjorpmbc@itd2hayrix5h>
 <9cf3b035-79c0-4e9b-8ab6-a81f8d27728f@oss.qualcomm.com>
 <lghedhcnuh2fm4mp64mkgsgtpkd32yneftjazgrye7bovxxaby@uscrda3wtyoj>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lghedhcnuh2fm4mp64mkgsgtpkd32yneftjazgrye7bovxxaby@uscrda3wtyoj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DX2HiA7MeS9_NZERrSWBbDwDN8ajgZMl
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=69df52c1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=WNm122a_XVfSPSTBZdMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: DX2HiA7MeS9_NZERrSWBbDwDN8ajgZMl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4MSBTYWx0ZWRfX6t9NEVmx7+1v
 H+5AJ1QGYbZCrKFNYQr2L6716sJFskaFRAODKJaXqjJ1PpPZ6xH1w8iTYnqHE0M1w1vDWzCJFYL
 icZxQ3W4Or/KVDgHS/tS0ChG0f63NV6xDNvJcy6ntrCnkXfL9iDnLz1k8mthOW34l4Xh471ITTH
 LoTNGAv8xofn8J8qErjA7ycg9lqeh01j3/LRMRRsI7Nd0sqcLUgjBoXjMcXka4KbAUForIsPqJg
 6Gp8ncmRfXmh78qfQqE0Mb5vt0V86XGSss6ZePGh9P+owQX4gB8epjFuwUjqIR04MicIT88VVNX
 LB29yK28DisqL4pnQS51PALPAywgsAjLtAPwZhts6jfWwX2I+Ctt1jj3inNRHLpJOAIWBHyHLS3
 pt1iaxkI/rbqTVoL+V9gLoXEgZ+Qbo3IlmE6C1pXzgyinlNbm7PjwcR+DIp9zqlIVJNSe1cSc0i
 koGDDdu6hTsmBIcuJ9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103247-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1AB37402429
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 8:09 PM, Dmitry Baryshkov wrote:
> On Tue, Apr 14, 2026 at 06:20:14PM +0200, Konrad Dybcio wrote:
>> On 4/14/26 6:08 PM, Dmitry Baryshkov wrote:
>>> On Thu, Apr 02, 2026 at 04:22:53PM +0530, Anup Kulkarni wrote:
>>>> Few CAN controllers, part of RTSS sub-system on LeMans, route
>>>> their RX signal through a I2C GPIO expander at address 0x3b.
>>>> RTSS subsystem is an MCU like sub-system on LeMans with independent
>>>> booting capability through OSPI interface and supports peripherals like
>>>> RGMII, CAN-FD, UART, I2C, SPI etc.
>>>>
>>>> Describe this hardware wiring by configuring the expander GPIO 4 pin as
>>>> hog with output-high, asserting the selected line during boot.
>>>
>>> Missing platform name in the subject.
>>>
>>>>
>>>> Signed-off-by: Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>>>> index a1ef4eba2a20..b8371bdf9933 100644
>>>> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>>>> @@ -615,6 +615,13 @@ expander3: gpio@3b {
>>>>  		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
>>>>  		pinctrl-0 = <&expander3_int>;
>>>>  		pinctrl-names = "default";
>>>> +
>>>> +		rtss-can-sel-hog {
>>>
>>> Why is it being described as a hog rather than a pinctrl used by the
>>> CAN device?
>>
>> My understanding is that the CAN bus is managed by SAIL ("RTSS")
> 
> So, Linux can affect what is being required for the safety island?

Seems that way!

Konrad

