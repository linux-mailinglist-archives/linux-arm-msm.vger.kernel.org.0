Return-Path: <linux-arm-msm+bounces-87993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22152D0144C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 07:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07D48304869F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 06:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFCA33557C;
	Thu,  8 Jan 2026 06:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QKhnNDBN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M8t85zK2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DD733BBBD
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 06:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767854550; cv=none; b=nn6TCQK1yWUxvNU5IwsPmyOH4eKrvd6qebJ5nnd4iyfVQPpK5xmsqCrFi9A0HmJmcdqtXva8amfsSQFOiZZrpytmZ3Pz2eH0vYJjX/uI/4a9VMZDVVzqpdtu8r1Ufub2fAxeasGgSdlDtW/W0a3j1j5l2oMJpb5C/nidvnby1m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767854550; c=relaxed/simple;
	bh=gjY9ZKn8AerPInOiDxILLNSmV+KOCcEfYN2pjsDhsqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AbraZZsMf/xAOz/Jo7RLgeXwJeMKE2PyAke+6aTxv/h0yXsp2HmYrE9gJU9b5AoKbIaru4ttMk9CmybGZgactphex2BuOaWq8yVPdh+YHAnt5XH6dvc/CCn2isxrqtmr/R+OD4HT33Rz6WZholjikg+J2WV1xoIXLL6c3rSexmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKhnNDBN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8t85zK2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60846dgV2783439
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 06:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R0HL95ihOA9A0q4vhcsR+DDHK/KRkyUqp/m1FXpo87I=; b=QKhnNDBN9kV34WFr
	rdpYxIJE8Uq8tARAF734Y+13k6u76CdN+/DVscaKDwDm7SIt76Bb2Hv8MdwK6ATe
	bP6pF0akP1Z0IBg/rD9VYnwIbM6K4yp9v4Po2S9Gxa6HyyzLjMm/pn7pQmiBs7zo
	s+2F1Ttt34k4/A5/HXgWK7IShhyreF2lkeC6RzSSof/379YCQlZU3wVs7PieElTq
	2yjrfKz01c0KMUKBl11LLw71H6atUfhdnB3ghODVMJ0JPu05OKcIfTJsaP7bZQwh
	0rcEWhH3sWHnONHr3gXKm7lM8h3BtKB4ouQFWjiI7BZc3Tai97F9CamOICPq3++5
	nuH+Jw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj58ugdfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 06:42:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34aa6655510so3245621a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 22:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767854540; x=1768459340; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R0HL95ihOA9A0q4vhcsR+DDHK/KRkyUqp/m1FXpo87I=;
        b=M8t85zK2wEGdY61/WlWyP9BNOkZ+u8D3VxxUTw2+vuXVmFuGOfqpAgcIYZMwMsTcqi
         OsOEJ6v+mS4idiKqim3oxmxnOHjZ+K2hC9ZTBLDqgEqtwGVe33m62S+u93HOKRcCCnxO
         35PhguxfDmGFtJ/ooIGh4XW79FP+v1VGHc2ePD8eRpbjjzJ5KwleOVknsa9CxWMo8PyQ
         ln2RE5nQl6KvRy9gaCGzK2kz3qbSLl8b3mHMpc9UreKkKqDCM/ZR6PrtHoNapmIy8k5n
         EUpSyzuUwvG2J6jp45kHZ4/EnMhVRxyFrscJ4gNAEM2e+Ri6wsqjQ+qzNn6MPB/vlkXh
         rtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767854540; x=1768459340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0HL95ihOA9A0q4vhcsR+DDHK/KRkyUqp/m1FXpo87I=;
        b=Nb9OLPi57zKf6g+I/ysFw3feD/orp126FrvWyaFJrJIjmqs22e1+icgxMG7D8Rap60
         B4Gt3d1kLQSrFHvwW/HHpnt/XZQhNlU7wxCQGF6ATbbDFtzIHdg7zR9jkJNUzVmbui8V
         kVn0OOGjq2TbLvQs3rXVLV3qhCEqm85DIhY6m/Zv5HTFvxfLPG7VWjywjCieis/dazoz
         lvhOtpKj9hGcwLpa9Ntaf9UfQbhuelPAYAv+L8Jm9tguu890X8t9E/pO5taMeS0IglVu
         ynSoT9F/QjR3KvavORN6rI1TzbLkyEZYhIFJYkqTHeyWKWWJSs2By50gOjccLLxRgU+Y
         LFhw==
X-Gm-Message-State: AOJu0YynZepxQVoEpn1fILg4iqErq5eYfOxlyMSDWDefkAxiUDCM8NQP
	4GlFBiR4MGyYe5tH4u/z8YaPbXXtfaixFFn/7Kw3SEvi/jeTBG0GilX8WmTAUBGK/p+En1tzXFU
	qcNk5thBsHNqciW03nPCD0rNwgb2puFYYcRY4sT3RFe5K28Km/I4z+1AA1/434jCZH0+B
X-Gm-Gg: AY/fxX4+QGdD4g4Lzn8wNp73gAcKSPIYWDMyAmzTwpcsx9iEfJP1KORQJ+X3cx5nSiW
	ku8AkDh0gLz8xJKi6WDjcUxTDznXy8DSzMevz1R9HjiSLMs+t5kS6+Ke+VNYabxQ07f+bdXK4jl
	qhSyCchjC30hgL5NDn//+bWvcuksIAIIX1edYrAvJVJq4SfoBiDhYp52LxkPpfqyksL+THMDORZ
	0K38dV916XC1Cmml5vrYzCg1QCevyll+WUo1uBuGSxkd3Oh9Ef7CyxhBWpZQR4PJtdaMZpER1Si
	ZXNa03H64k5Iku0d7pN6hMBYqeVCuRxrlLnXIJJFjnFGZueXOSI+syYBR5Rd6EBl62V4+Ae4wH7
	vXSg0VOdD+AEDJaJhWAl2xxLlKLf/YKmtkow8ch4DbJ5a/DL7gaThZVlppwZT3ly9vaSp9ghxIV
	g=
X-Received: by 2002:a17:903:2291:b0:2a2:d2e8:9f25 with SMTP id d9443c01a7336-2a3ee47f0a8mr48295295ad.33.1767854540232;
        Wed, 07 Jan 2026 22:42:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7M+L6O5fEzMSPTGxFCu18f1uj4PsDXgMaJwRJ81d5LiIm1cAmxdvtAeQNQJeQcqh+4t1ljw==
X-Received: by 2002:a17:903:2291:b0:2a2:d2e8:9f25 with SMTP id d9443c01a7336-2a3ee47f0a8mr48295015ad.33.1767854539759;
        Wed, 07 Jan 2026 22:42:19 -0800 (PST)
Received: from [10.133.33.102] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8803sm67804025ad.71.2026.01.07.22.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 22:42:19 -0800 (PST)
Message-ID: <196858fc-e425-4cc0-a4b8-94a0ff4e512d@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 14:42:14 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] clk: qcom: cmnpll: Account for reference clock
 divider
To: George Moussalem <george.moussalem@outlook.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luo Jie <quic_luoj@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
 <20260106-qcom_ipq5332_cmnpll-v2-1-f9f7e4efbd79@oss.qualcomm.com>
 <DS7PR19MB8883C5FF92412F106B8D41529D84A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Language: en-US
From: Jie Luo <jie.luo@oss.qualcomm.com>
In-Reply-To: <DS7PR19MB8883C5FF92412F106B8D41529D84A@DS7PR19MB8883.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA0MiBTYWx0ZWRfX83ZjFGSziozo
 fGeGmJt8BwvYMeHO22d/PIio+05l+H253AXE2iBiW6lPL2LZD3S170HppM6SYttKnuw3kQ8vGRR
 0wTeH2mymPHlPe0undvOjpMZNUNXcMjozSSshBzIOkSerc0xdznEVMCHm+gMWC+l442yxjy6aGm
 PffoZvzvZ1EsavJafZYK/Ve4N9c/iXwngR0gWhR+/vkQ5p5RYvlNkb1HikIc0byYKscE4GneWm1
 EQYKM0MchFcUmuYfjGHoHgIeiMCUF4yyUFE60B5FuEG+d8OOco5YGofA+M4AaeswjDQdmoCaUB2
 YMO11FbuHb4jNHk1KOpKEAZMCxGzrq2hZ0JJjd7CMHBe+iQrKB8oGL8cyLPAuhkTe5pj0IyRQOb
 xyxKJzfHZEbtEF/AHbb/YYNNoiqU++KMe7vnj1QWWErAP4SrGijxKR9lTA08VET4QaRn5xK0WC8
 O9Kbb0FRrWThWB/eHpg==
X-Proofpoint-GUID: yM4pLgd1R8d4h4lXXMiDNZmHBo8sI5Mh
X-Proofpoint-ORIG-GUID: yM4pLgd1R8d4h4lXXMiDNZmHBo8sI5Mh
X-Authority-Analysis: v=2.4 cv=CMgnnBrD c=1 sm=1 tr=0 ts=695f51cd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NVhx1d5adPAbhb5xwd0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080042



On 1/7/2026 9:17 PM, George Moussalem wrote:
>> Read CMN_PLL_REFCLK_DIV and divide the parent rate by this value before
>> applying the 2 * FACTOR scaling. This yields the correct rate calculation:
>> rate = (parent_rate / ref_div) * 2 * factor.
>>
>> Maintain backward compatibility with earlier platforms (e.g. IPQ9574,
>> IPQ5424, IPQ5018) that use ref_div = 1.
> Just tested this patch and can confirm IPQ5018 also has a ref_div of 2.
> With this patch applied, the correct assigned clock rate of 4.8GHz is
> also reported:
> 
> root@OpenWrt:~# cat /sys/kernel/debug/clk/clk_summary | grep cmn -A 3 -B 3
> 
>                                   deviceless
> no_connection_id
>  xo-clk                              1       1        0        48000000
>   0          0     50000      Y   deviceless
> no_connection_id
>     ref-96mhz-clk                    1       1        0        96000000
>   0          0     50000      Y      deviceless
> no_connection_id
>        cmn_pll                       0       0        0
> 4800000000  0          0     50000      Y         deviceless
>          no_connection_id
>           eth-50mhz                  0       0        0        50000000
>   0          0     50000      Y            deviceless
>   no_connection_id
>           sleep-32khz                0       0        0        32000
>   0          0     50000      Y            deviceless
>   no_connection_id
>           xo-24mhz                   0       0        0        24000000
>   0          0     50000      Y            deviceless
>   no_connection_id
> 
> Once accepted, I will submit a patch to correct the assigned clock rate
> from 9.6GHz to 4.8GHz as the ref div is now properly applied.

Thanks for validating this on the IPQ5018 platform.

