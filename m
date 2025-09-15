Return-Path: <linux-arm-msm+bounces-73524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E38B0B5752E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 11:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97BDF3B9B06
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 09:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 934212EFD99;
	Mon, 15 Sep 2025 09:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IovRb94M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE1A2C3257
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 09:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757929580; cv=none; b=RJtbYTExiilH/BF0C3XvMbFmDDF61L71gOhIJnB5m5dGLVUKcnGrQvMLnKmjYpBrl9U9YOrZSfUMP8nNnNovVVxiUcpZckzcFq8WSzL8YLDeLr4Yqm/44Z7XueXvyLqxAyR6yVnMtVdF/qzYX06aasPO+cRtCn6RR27+LGHt9H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757929580; c=relaxed/simple;
	bh=M8e2y27K3A6dpsBSo9MEi4W0aa6bQrCDhahqiCtj7eI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IoWk2keZE+5jMwikZZ7ryr/0peQttfKX5lQ80cDG7xKQmlUQ3nNs2t38/JDxNc6EOnWeQmrLuy1x9LTWaOhocdFgVTSxc1ufs/y7nDdLOtPsoCehpC6ldvb/IdyEq+8Ls23rq8owoTiehEdYBTB4g7HKixuTXq5kkh7GH7orr8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IovRb94M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58F8FgUF020553
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 09:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XKYBpf/YuTgi1/R2heAtYg9SuIoT+bGQO1rttRChYWM=; b=IovRb94MHriGQZXU
	DQR8Y7pY7IeSfAOCKiKpCMkWWPuay301yCzM1dQgf3UmSJQvPozLVJ/Ko8TvM0qS
	SVhGp3vaOb1cvUUaMsdmB395sMr8z+ecOKjpbe6vho4QCt9fr1y0QSe7p+isYS2h
	zfLUswMwfIS5f27E+pAlG5PRnSKPhZQdxqMvsSJchRokVznu4WwipHuKttbJ/jc5
	1MwPe6NxBHX+9iUUjI2IlylvQ3qhQzpjE+2k1b1YmhWlkaB1S4rBzLO1FLONQuNy
	QBCg4/xyXVxXXHVh+1YjWKK75eHfpI3AfddO/NHpCa25jjGLFAxaBo2Gaa2j2YvZ
	oQ8rBg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950pv4env-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 09:46:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77260b29516so7935455b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 02:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757929575; x=1758534375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XKYBpf/YuTgi1/R2heAtYg9SuIoT+bGQO1rttRChYWM=;
        b=BujrlFFJFo24ErzeIwzuNUwthvLWuyodzfdT9WUMmT4ZNHtuswyF/l+QuxbPrJbl4P
         kQdd43IU8oMlCaQVNsktGPO9Zl4dERlLwOQRzdsGp/9G0gnH7EvT44edUIVTZ3jGw0Go
         3F6cC6/2/Zik4R9pGGBt35+sdTZi69XiI9rPjNg/0e5CYr4/36PXv9aVbE70p6JoBT2H
         B7cEkZv2HKvg2xze19CedRVS+UcARXkTv502+9i7jH6phjHjAnzJ9tC+5Fkagdm7QfTg
         YVpDG/SxucMI3Aadg/FoaK6Rr3OG3h55Uzb7lk9C7n+xji91MBfqclPiEBseCBYKWJgt
         h2lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaZ3V9T9/vJGXrQ+f2b5sGYGOyN1hsxNfXR9pCfU+lzr1hRJu3z8PZWgGwYzsJaF15qIHO72BgO0iJAQYO@vger.kernel.org
X-Gm-Message-State: AOJu0YxKejepdHW8Jc4mQKUWzlZJGiQR0kUHGAXWfxOmrxP8AlEGUtZY
	vTuNDX3/z7Y6lbIh0fq11LVu1tCZeQNcvFXjjrUpNstSLCO+QxUjrpiUQXK4pWNP9IQ/rfE+AqE
	cTzY08Pc6lV81GcehHmBPFe1ktB1j3Xn98LSzdf3M4GI4CeR8bwkSI+En7GCxsX5gNf/f
X-Gm-Gg: ASbGncsOJbGpaDd4VB5YOQC83sMHr57dx7VvySTNp2G+95aSEIjN/4c3TOb4wzkANhi
	XNwr1Ij4LzYPHmUgjsbzGNRIetLyUCn+d63Dh195rznUyD6Ohbf8i5A/xE8PclgXLCCTzWHD7vT
	Xox039dSRVTH6gch2ZY5/28z0KmxffoRsxz0Hc8tNu4vlOL/OowvuTEf6JEnPT+RxQTGkBwiSIr
	vbCJgc7zqZji73aq5M+S38FHPnTRAjymi6WnygASYquFQub/8b9rkiYU6Z8HLQjdMRKDS0b++Aa
	9bCVD5f3xjU593tAY+OeyB4YnIS0YxvRLMcxiccfnxCGIqPvT8UI5OVjqePIdKEWBwFKXZglJKT
	g1Ola/PL2OMVmNd7FAzfSnc1YaqKa2z4Gew==
X-Received: by 2002:a05:6a20:1586:b0:240:328c:1225 with SMTP id adf61e73a8af0-2602a49d995mr14316724637.12.1757929574998;
        Mon, 15 Sep 2025 02:46:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa4BidIfDh3AtMcW/itG57vXFSTbsRdVvF4+01fyHzNCi0wK6V3NSVHYYncqWgx10dq0+bFw==
X-Received: by 2002:a05:6a20:1586:b0:240:328c:1225 with SMTP id adf61e73a8af0-2602a49d995mr14316695637.12.1757929574550;
        Mon, 15 Sep 2025 02:46:14 -0700 (PDT)
Received: from [10.133.33.238] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-777d3ca57e2sm3503834b3a.33.2025.09.15.02.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 02:46:14 -0700 (PDT)
Message-ID: <3b81ea60-553a-48d8-b6c7-6b55673fe04d@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 17:46:09 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/4] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250910-hamoa_initial-v11-0-38ed7f2015f7@oss.qualcomm.com>
 <20250910-hamoa_initial-v11-3-38ed7f2015f7@oss.qualcomm.com>
 <aMPee9wEOrrW-KMU@linaro.org>
 <90dcca12-1a68-4049-bcbe-c333aed07a07@oss.qualcomm.com>
 <aMfT1_uyZETUEBYk@linaro.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <aMfT1_uyZETUEBYk@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: a8zr2Omty_P07fROE-ngKOjfRbRmNVrT
X-Authority-Analysis: v=2.4 cv=PsWTbxM3 c=1 sm=1 tr=0 ts=68c7e068 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=HIKkmpGtg5vrm0Pab0QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: a8zr2Omty_P07fROE-ngKOjfRbRmNVrT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAyOSBTYWx0ZWRfX4hqmtC2q2Gfv
 6ZphOLpdfN1FOApxYVXovsIajkV0ugEicQf2TjGv2KPf1uEaLPfgFPQR1l2tzG3CPVEZ5XcIadj
 9k+k4gZ325BwvWiSFEBNdnUb5iHwyb0pR5cYBjXIGXw95g4scLlYeDq32QW+KXqwfiRM5QMtifZ
 3Msdmuis89cDd9VgTSiZwbzbncUxnZdx1yVHMNrlOD29ucIjdZVrkmTLW/93hYh8HmRD6cG9ku9
 VeTnsrnIehX8i0np3j2p0tRgWdgqJpm6oWl6UPrQaWppmzlgZxPRWDJudS4Hvq3LpEe8UsdWBWW
 A3ba2ZapG+tcZ2xlyCF8tXI3xybmvXkwOe2QknwcspysopjLTe6zz1Wrf1I21KrraP0KgPyF9FB
 K9TmLyqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130029



On 2025-09-15 16:52, Stephan Gerhold wrote:
> On Mon, Sep 15, 2025 at 10:12:15AM +0800, Yijie Yang wrote:
>>
>>
>> On 2025-09-12 16:48, Stephan Gerhold wrote:
>>> On Wed, Sep 10, 2025 at 05:02:11PM +0800, Yijie Yang wrote:
>>>> The HAMOA-IOT-SOM is a compact computing module that integrates a System
>>>> on Chip (SoC) — specifically the x1e80100 — along with essential
>>>> components optimized for IoT applications. It is designed to be mounted on
>>>> carrier boards, enabling the development of complete embedded systems.
>>>>
>>>> Make the following peripherals on the SOM enabled:
>>>> - Regulators on the SOM
>>>> - Reserved memory regions
>>>> - PCIe6a and its PHY
>>>> - PCIe4 and its PHY
>>>> - USB0 through USB6 and their PHYs
>>>> - ADSP, CDSP
>>>> - Graphic
>>>> - Video
>>>>
>>>> Written in collaboration with Yingying Tang (PCIe4)
>>>> <quic_yintang@quicinc.com> and Wangao Wang (Video)
>>>> <quic_wangaow@quicinc.com>.
>>>
>>> This looks like you should have Co-developed-by: tags together with
>>> their Signed-off-by: tags.
>>
>> We’ve agreed on this as the preferred method for marking collaboration, as
>> discussed earlier in this thread.
>>
> 
> I can't say I agree with Bjorn there, but ok, he's the maintainer. :-)
> 
>>>
>>>>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 621 ++++++++++++++++++++++++++++
>>>>    1 file changed, 621 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
>>>> new file mode 100644
>>>> index 000000000000..c7c3a167eb6a
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
>>>> @@ -0,0 +1,621 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>> + */
>>>> +
>>>> +#include "x1e80100.dtsi"
>>>> +#include "x1e80100-pmics.dtsi"
>>>> +#include <dt-bindings/gpio/gpio.h>
>>>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>> +
>>>> +/ {
>>>> +	compatible = "hamoa-iot-som", "qcom,x1e80100";
>>>
>>> Undocumented compatible (without "qcom," prefix). I think you can just
>>> drop this?
>>
>> This compatible string was also discussed previously and is the preferred
>> choice. I’ll add the missing 'qcom,' prefix.
>>
> 
> Even compatible = "qcom,hamoa-iot-som", "qcom,x1e80100"; is not
> documented. And it doesn't make much sense to document it either, each
> of the boards using the SoM should have a more specific compatible and
> therefore needs to override this property. I think you can really just
> drop this line.

Patch 1/4 documents this compatible. It’s another requirement that 
SoC/SoM should follow, which Krzysztof pointed out in v2:
https://lore.kernel.org/all/aee74e0f-c957-437d-ab48-3977013c3116@kernel.org/

> 
> Thanks,
> Stephan
> 

-- 
Best Regards,
Yijie


