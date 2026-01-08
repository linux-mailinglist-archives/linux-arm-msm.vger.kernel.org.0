Return-Path: <linux-arm-msm+bounces-88019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BC242D033C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 15:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EB163046995
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 13:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31A3374160;
	Thu,  8 Jan 2026 08:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e39SOX3h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JmKMQfko"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ECE364057
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 08:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767861424; cv=none; b=AZc+oC4cItWQn7UR9T220SR4Kr//0iDA8zKq45fj3gtoUjBmWLZGAt8zHN/4eii+BG+mfbRa4gKQetofO1K/O+BberIG1wqyskc1zwbywR5oJFcVL63fR3RLBP7OaHZI0NhWNOUqcgKj/03lhr6/0TpunSKMQ7ArJVMmeCH1N/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767861424; c=relaxed/simple;
	bh=ZWPQtEfuH8UxyooPW+VVMcCXbhPGC0MHcCoU9e8N7Xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KbvQmTVYCAgQwN0ZZMR0GnE4J9+Ksca7695/VCBNm0QFuX6gYELC2lmMNoNdTGbst68Upz2u6b3iso8dAgKn7X8AeAD0azCcAcOebMGV0tgZE1jq07gLYkyyc3Z0UI3PKFLZ+WLgT5TPV7gCMKLp9/BFdqnf6t8zZ3sBg6oe08k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e39SOX3h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JmKMQfko; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60819SXv4052247
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 08:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CTYkMR7xz3gkF8DeE6cwDcRKpU+RkFDd6XJYj6feXs8=; b=e39SOX3hqlhsgBov
	2zhYNcpPw+K4LItv4gL2syck03pFC9BcijJbizIHCInq3bsOX90u/LePgEDitCvL
	aYYJuqRoT8JEeXGOi2cWIFfrP3Iu+DBHThQHpblgr0m8a29qSv6bTURLVBUMPpxI
	ejfSwHiSyV9S6/JdwwUAKN39RfRN6PGpvct4zPz8VvAArpSk1yK2jX9et+ouJOno
	G+3dak7i5u0T6ip0avy3nM5+3+yCxIhEt4s+fPmYNgIEb+msSd1NJTRwPvpuSKCQ
	TpvyDSXxqdRhEd7xtscEbawotXfZPgbeLPuNyMx6Wn5fa7anCXttjGeOJnA3VDh9
	HFVrhw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2n8h8m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 08:36:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b1be0fdfe1so93839985a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 00:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767861413; x=1768466213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CTYkMR7xz3gkF8DeE6cwDcRKpU+RkFDd6XJYj6feXs8=;
        b=JmKMQfkoajDEyBmsujaOyLb0QsxFBzCBeBC0Jn5soZFOuR9MzId5a77IyWcaCPaSCQ
         OfwBmMm8TW3dhfw9pMMWNED6ZnhdJMZmwYWfCk2wzTUHdicteUE+5B8xe5JDA55I3XNE
         0owlebLIcG0Ye5lpCbshnN+6k0A7IS0LmZocN95vV+wPBxohHA9Ruxva+EyZlQMKOGQB
         NasGZhrT1k92HN8YZGWvY/bOxZ4L+Lz7L8BglNflzJk3MSsATXZQ3IGqzbcqNVbjMbH4
         KzXbbgo6cQjWGbRLwHdy1At7GFvkLLKFKXPJ2tsvEbfU472Rm/2l5MiKkAx5/G98vVV4
         gxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767861413; x=1768466213;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTYkMR7xz3gkF8DeE6cwDcRKpU+RkFDd6XJYj6feXs8=;
        b=Fowo9Py3vcSRKUHcWE+W1D4d685i6J911FU3Df4+doRYrWsClXX/eaqL3+4xk0ntfO
         LJFzRQPlFcJCVaUKwKuRxS03/h+Crj0T/aLdFFCZkWjf6/ZJ2Ea+hUkiTNE3Q742GVEC
         db7J94C/WDR2RsmVlayUTEw6nGMkXX1RBdMQsgt9wzLCJ3MTAe9Es8AoHRH9td++MmDt
         u28OPSczAuQvHZyMtu2KK4GYfC/Q1n1dLSjLj0PQVeay6jol8btby2oB0hZgu5EYQyRp
         A8Rc5AsjTw1ucFguNkK9Vf4qm+qIJqsTkQ+PLnEzb3sZdQYBsDSxqdaAGDzIt8OTtrUv
         BJOA==
X-Forwarded-Encrypted: i=1; AJvYcCU68Wdy0jj5XmAKejL7TWCI5gWZKcywonM7yPbIa3IM7OvNDdpGEosTB/3PM10r3+hZXeQ789Ob28AJ05KG@vger.kernel.org
X-Gm-Message-State: AOJu0YyOZcNsxDIO2k60yAW48C8MWf5LVeymkgI/BUiD3VV0a6t6F3mH
	dtazPCGpv65kjFw8lhzJVmY1uGEB8NIg5SofQnU/d6BB3hcmjkfHiBPVb++AyxWjQBRyNrVVVHh
	/17ZqeYjDmrlrJFe1K/iROD8k9O1mBCbG0fk2FkPqxzXIX01qqD99wNh/DI2cHG73PrZf
X-Gm-Gg: AY/fxX73FvsqKlIdHgpIP/v5aHmIC2dtVZ1P2Bp/ZYCfFUWrOeC4dks+pTRaFIUFUt/
	C0t/F8SAiRFHzgesnPxKjTq7vc6IDchb+Vn32zZ1XuVEGPj8hpW5byUCw/pSL/JJcpXDgAW8pg9
	H7uZoPn4BkWz97BN/JoxT9G61lnLUK6/DFW+8rXBnMiMD39oFKKpaA61vr7sZPw2AI7gGDujfKT
	D1VQU++qrXnwdb6ATkQ2lckYjGcfu2LI5ulw4we4YsW/U5MZHdEbO+KwpMnQBv29sOg9m9YiHqs
	MHnVFa0WZTpTgCSgEUBRZpE/F0ZpL2YAsIPtDal90hQYo7GNUM6bH2i/l5q7EIQHy7cguN3/1x0
	oc2a/3NnW+JXLRteWdcqiXiyH3bcZtc2gAuIXRWQdO5cXHMaTfdZr40YtBZDK18NVk74=
X-Received: by 2002:a05:620a:40c2:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c3893a11a8mr526597985a.5.1767861412644;
        Thu, 08 Jan 2026 00:36:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFD4aMxeE3c1H2Q2++mWBFTI86MgR9CL/2fTHJtpaEHuAcSdl7Wh34p2mHBfT46XOdc3dNojA==
X-Received: by 2002:a05:620a:40c2:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c3893a11a8mr526595785a.5.1767861412072;
        Thu, 08 Jan 2026 00:36:52 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d683sm6954708a12.34.2026.01.08.00.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 00:36:51 -0800 (PST)
Message-ID: <4d95232c-f59a-42c3-9eb4-934b58429d25@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 09:36:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/5] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: tessolveupstream@gmail.com, andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251230130227.3503590-1-tessolveupstream@gmail.com>
 <20251230130227.3503590-6-tessolveupstream@gmail.com>
 <30ee8541-3ec2-49ac-8fe0-987cdc5b16e7@oss.qualcomm.com>
 <14613f89-6be0-4eb3-beb5-375ab008a313@gmail.com>
 <c3492b90-bb48-4584-99fd-b1b6832d22ff@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c3492b90-bb48-4584-99fd-b1b6832d22ff@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=695f6ca5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=qqEUINORgcf7CWWjMcEA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: MOz-1nakSTwSVVxpNLenMgsTGVI1QBs0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OCBTYWx0ZWRfX+bEV9x8y5LQV
 9ptTqpHoUHK0JATRc5Keqs/girx3M1pI0YPoR1Rva2D/NNsostkHR0at0dVU2HG13npoch/Nx8y
 Xp2sEqeOw4miLrz/ICNbsJ/ZzCMy68EvruwIs7Hv+e6Zwe1j01MoPkdyXfLgzcC6HbqtBHV3Uxt
 tWoRdccsvyNjodP3qjBOq8jUelKZq2JatH3MlFzB1B9jngwsrcBSYifi+7ANqeHwSfz3IdPGrCA
 usVTY4BImkE/jgxSRlcx1dH5eujdDLaMJp6ZkWdmUZ6pc6OQaWFSBQ1XV+bdPBs3WLV48oAhptw
 J0y01aDJjVmvN3bWCIT8+r/N589jfNZglNKg/rcrPXG93lP4AHjEUcO1A0AXb6O+vLHqdpc3t4p
 QKaKZXk1YPimZqUfbJ2v6QiGkGJ8xFS+MUz7L4Uw2HKvOEFfbIDCs4Hmu3HQ2teKA/7bxFB9GMs
 +6v5A+NF9exe3Ir1svg==
X-Proofpoint-GUID: MOz-1nakSTwSVVxpNLenMgsTGVI1QBs0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080058

On 1/8/26 8:36 AM, tessolveupstream@gmail.com wrote:
> 
> 
> On 04-01-2026 19:16, tessolveupstream@gmail.com wrote:
>>
>>
>> On 30-12-2025 20:21, Konrad Dybcio wrote:
>>> On 12/30/25 2:02 PM, Sudarshan Shetty wrote:
>>>> Add the device tree for the QCS615-based Talos EVK platform. The
>>>> platform is composed of a System-on-Module following the SMARC
>>>> standard, and a Carrier Board.
>>>>
>>>> The Carrier Board supports several display configurations, HDMI and
>>>> LVDS. Both configurations use the same base hardware, with the display
>>>> selection controlled by a DIP switch.
>>>
>>> [...]
>>>
>>>> +++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
>>>> @@ -0,0 +1,126 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> + */
>>>> +/dts-v1/;
>>>> +/plugin/;
>>>> +
>>>> +#include <dt-bindings/gpio/gpio.h>
>>>> +
>>>> +&{/} {
>>>> +	backlight: backlight {
>>>> +		compatible = "gpio-backlight";
>>>> +		gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>,
>>>> +			<&tlmm 115 GPIO_ACTIVE_HIGH>;
>>>> +		default-on;
>>>> +	};
>>>> +
>>>> +	hdmi_connector: hdmi-out {
>>>> +		status = "disabled";
>>>> +	};
>>>
>>> This should be a &label_reference
>>>
>>
>> Okay, will add it in the next patch.
> 
> I noticed that in several existing .dtso files, the root node is
> commonly referenced as &{/}. In your comment, you suggested using &label_reference. Could you please clarify which specific label or 
> node you would like me to update here.

&{/} must be used for root nodes in a .dtso (for it to compile). I meant
using a &label_reference for hdmi_connector

Konrad

