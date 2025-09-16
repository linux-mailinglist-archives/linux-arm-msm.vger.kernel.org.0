Return-Path: <linux-arm-msm+bounces-73618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C67B58AC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 03:07:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC09E3ABB00
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 01:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1EE1CEAD6;
	Tue, 16 Sep 2025 01:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgA42yIt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E5B20322
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 01:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757984837; cv=none; b=BcG6SBUGr8tHhoMlMZSwHGgxxG7+LSpA7w7yQVLWoclLOktYXLIVWLAIEgw0aVi4PG4/bRc1ymukVzFa5Yvhd6jSNsTbWDzThJVQOq7zIHzP7iEQrF1SB0ev+NGHlcFdBz1yK3tcLK30dgSrlHMFgabWy6DfO8VaKe+ocTTQXdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757984837; c=relaxed/simple;
	bh=Ej1M7Lb0ez3FYXyEYoQtM5ZlcsYy2QCsELs/7QLVuSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CUB/X9oyGD8ILxjy7bvtRrT+RPRBCUy3+xcBOrIxqYdDGtWLrxcTTjX3Cm6HUKaE8i7qHYV/cv6yrc9M3TRcP7Z5VuQE1lwGoi18hVWT05ShB7DTUolUqVKBhHV7aUviMlFVmL5iyfQVSiVcZ9oS6kbbEKRkVSl8lTOw/roF1R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgA42yIt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FFsHgu005059
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 01:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJ7wAHnzIyQb7pFtsPfAGf8Lzws9Z/gnzK2Icghh4B0=; b=QgA42yIt0Q+xZPlg
	xHLcCpy18CiVmLxUDr1ZMXVCdinKaF0wzhjI8GhR/5t57/NWqu6VZsnMly5VJU0U
	BE98TlKC95mpD1+3Bymf3ImTrQ9OrIomkYsNqTBV5y5h4ykz9nKLywctnDvrDlCy
	Uba4Y5Hk6FU4G8cMWeHI8j/KWkXtkMLVYnp3jw+KIJEYJKiRlr0FB4RI1CCcdfjF
	bRszxtDsMTGRvJwHxOWjKKt76rKFwFn1F73RDrju8LSd76KujZve0pTjvEFm20Is
	u9IEUn0+U/E+iiMI4xtDLkZp/Ud0R+tTCehpo7s4T7dZg0ifQx1GcrQxPHfKHGNS
	8zAVKg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g12jht4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 01:07:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77615793f06so3530470b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 18:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757984827; x=1758589627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zJ7wAHnzIyQb7pFtsPfAGf8Lzws9Z/gnzK2Icghh4B0=;
        b=aRXn+oUiWuSfjeIOZvwvsw7cANmBgX1qV2UzIHVbgcPr2NpW/A7R09259yNU1UFZyi
         BmjkDlS9Qry7A42RhvKYWJDRlISwSv/BT7widbf5nQ7AsRlQqkE+55hbMj6VH+UHyLLM
         dhTksERtueG0D39o4+Bj7PtS8mG6DtMvfZWZfVMQwLAWBKuU/uIndpaU0fEDfkoI9yaX
         pCZtPvH2f2tupCXdVY3CfHitpQYmtThcIjRecnZkFuM6MN66YsdGAyJbuIBV80WAUrVe
         CO0T+HfJtdYLLbBVWQbZoRyKFjj1RntF3XljwMcDu6wcFvaZa2B0Ip55cIVvZV94zmf6
         NGyw==
X-Forwarded-Encrypted: i=1; AJvYcCUf0kgyiAMSS7dPkPCy4ZY4ycLHHgdn+VcCVnD69E9iQPVkahDxVzYAJ7KknsrPEj3ItY7bqIDPa7sdni5t@vger.kernel.org
X-Gm-Message-State: AOJu0YyTgYK9ZFqr5QBFGGzExFPxX3NNNCiYYLn2bwLEMUsvJRzScU/x
	OJiITo/xH3CfTWsNcJ2O0vr1kBcOiGJCJnb/9/mCTHHO2WAc4k82PijeTFur2Tx6FbUXwhMgfN/
	Pqi++lQ+H4JOwQQmswSTPPd6eV56fIIwJtNyWPiKj60QkDi0t3zN2Gl/xjHtDKVZnSZGO
X-Gm-Gg: ASbGnctL6Ov+ouCsTpR4IAzPYkczXVhfogu2LrIYxtc1vrmeilEX8+04fO9GnDDNDvT
	KuxdWm8xZw9S9MWlRqaw6+as2nDxaNt8rmm3j6/GVHSOIHDIjpcI/wvTmNQW19v3NBV6x8rZt6u
	jVlBc1POGZDa7U3UHxeIz0cK0Gp/ig2gWjLSUBBY8LqXPGUjDiHZL1x4OjmBFUb1kRwM5ItFR+I
	bRsPudlpMmtS0ZwKeZ85yRKsogKKrPZuICkhmpGskAw6OyOjqhj0mEYd56T9MjJ4nrvEoHck+JQ
	cmAowPP80xNddLnHYpvWoxEvWYOZt6dyZE1GOmq5M3PASUnencHLAVWEL1JCYhi+2oUsuxTohrh
	nWb2StxN0ZO9DpYsGzdkLFyOZnvjzojhuxw==
X-Received: by 2002:a05:6a00:140b:b0:772:4759:e45d with SMTP id d2e1a72fcca58-77612187dcdmr16870651b3a.22.1757984826789;
        Mon, 15 Sep 2025 18:07:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVs31FmEgidBmlFAP6xDrtJIzXrTQX01+uXUWk8n4bzgO78tNFCFr69YkqcNPr9LfNID+jJw==
X-Received: by 2002:a05:6a00:140b:b0:772:4759:e45d with SMTP id d2e1a72fcca58-77612187dcdmr16870617b3a.22.1757984826313;
        Mon, 15 Sep 2025 18:07:06 -0700 (PDT)
Received: from [10.133.33.244] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7762c225d2asm8516269b3a.65.2025.09.15.18.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 18:07:05 -0700 (PDT)
Message-ID: <aa2677a3-7d5f-4abc-9bb4-7db53b9b8a0f@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 09:06:58 +0800
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
 <3b81ea60-553a-48d8-b6c7-6b55673fe04d@oss.qualcomm.com>
 <aMfiCry1NDdd9AnX@linaro.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <aMfiCry1NDdd9AnX@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: f37In-wNuYSDc-KFE6a4z7hRWW-CKaCq
X-Proofpoint-GUID: f37In-wNuYSDc-KFE6a4z7hRWW-CKaCq
X-Authority-Analysis: v=2.4 cv=E5PNpbdl c=1 sm=1 tr=0 ts=68c8b83b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=BKvH8aPO6oRNhvS168oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfXxTyBD1hr1pUU
 BWMv//IOyESE8aVvozEKIBJZcUj5HQRiOiOOCNpDJQ3+Es43Ob+6gZqsxsipDJEiYcrPollO1Ck
 cZKp03G+gX51COfSyVoVo9Z2vSWBoo6ejzDGH8kYSqkCRMGGxu7ZxcxQnoE2zPLhwX1zuHVuV5B
 3qvRYGtIF08TWqaeL16y6vUWLNMQFX/Ol0NRMGbCG0f6O3Gun30KTREYlP8KvSPh1w3aVMBoCCw
 olKdJe8tqAlqeUE8jGnXf4SN/QfZqKZC/5QyynfkFVTlNoTYsQdT2TMNgi3EVC+MV0pPgXOscxE
 6joO75+VOmzGxu6JZ38u3mTtEuOwdtNS4XUuMypuvO0dIuUekHSo9jo27CwO/l3m9mfnalQC4oY
 mJEk2VD1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_09,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086



On 2025-09-15 17:53, Stephan Gerhold wrote:
> yOn Mon, Sep 15, 2025 at 05:46:09PM +0800, Yijie Yang wrote:
>>
>>
>> On 2025-09-15 16:52, Stephan Gerhold wrote:
>>> On Mon, Sep 15, 2025 at 10:12:15AM +0800, Yijie Yang wrote:
>>>>
>>>>
>>>> On 2025-09-12 16:48, Stephan Gerhold wrote:
>>>>> On Wed, Sep 10, 2025 at 05:02:11PM +0800, Yijie Yang wrote:
>>>>>> The HAMOA-IOT-SOM is a compact computing module that integrates a System
>>>>>> on Chip (SoC) — specifically the x1e80100 — along with essential
>>>>>> components optimized for IoT applications. It is designed to be mounted on
>>>>>> carrier boards, enabling the development of complete embedded systems.
>>>>>>
>>>>>> Make the following peripherals on the SOM enabled:
>>>>>> - Regulators on the SOM
>>>>>> - Reserved memory regions
>>>>>> - PCIe6a and its PHY
>>>>>> - PCIe4 and its PHY
>>>>>> - USB0 through USB6 and their PHYs
>>>>>> - ADSP, CDSP
>>>>>> - Graphic
>>>>>> - Video
>>>>>>
>>>>>> Written in collaboration with Yingying Tang (PCIe4)
>>>>>> <quic_yintang@quicinc.com> and Wangao Wang (Video)
>>>>>> <quic_wangaow@quicinc.com>.
>>>>>
>>>>> This looks like you should have Co-developed-by: tags together with
>>>>> their Signed-off-by: tags.
>>>>
>>>> We’ve agreed on this as the preferred method for marking collaboration, as
>>>> discussed earlier in this thread.
>>>>
>>>
>>> I can't say I agree with Bjorn there, but ok, he's the maintainer. :-)
>>>
>>>>>
>>>>>>
>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 621 ++++++++++++++++++++++++++++
>>>>>>     1 file changed, 621 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
>>>>>> new file mode 100644
>>>>>> index 000000000000..c7c3a167eb6a
>>>>>> --- /dev/null
>>>>>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
>>>>>> @@ -0,0 +1,621 @@
>>>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>>>> +/*
>>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>>> + */
>>>>>> +
>>>>>> +#include "x1e80100.dtsi"
>>>>>> +#include "x1e80100-pmics.dtsi"
>>>>>> +#include <dt-bindings/gpio/gpio.h>
>>>>>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>>>> +
>>>>>> +/ {
>>>>>> +	compatible = "hamoa-iot-som", "qcom,x1e80100";
>>>>>
>>>>> Undocumented compatible (without "qcom," prefix). I think you can just
>>>>> drop this?
>>>>
>>>> This compatible string was also discussed previously and is the preferred
>>>> choice. I’ll add the missing 'qcom,' prefix.
>>>>
>>>
>>> Even compatible = "qcom,hamoa-iot-som", "qcom,x1e80100"; is not
>>> documented. And it doesn't make much sense to document it either, each
>>> of the boards using the SoM should have a more specific compatible and
>>> therefore needs to override this property. I think you can really just
>>> drop this line.
>>
>> Patch 1/4 documents this compatible. It’s another requirement that SoC/SoM
>> should follow, which Krzysztof pointed out in v2:
>> https://lore.kernel.org/all/aee74e0f-c957-437d-ab48-3977013c3116@kernel.org/
>>
> 
> I'm not saying you should drop the "qcom,hamoa-iot-som" compatible. My
> point is that only the compatible list you use in hamoa-iot-evk.dts is
> documented in PATCH 1/4:
> 
> compatible = "qcom,hamoa-iot-evk", "qcom,hamoa-iot-som", "qcom,x1e80100";
> 
> The compatible list you are using in hamoa-iot-som.dtsi is *not*
> documented:
> 
> compatible = "(qcom,)hamoa-iot-som", "qcom,x1e80100";
> 
> because the board-specific compatible string (e.g. "qcom,hamoa-iot-evk")
> is missing.
> 
> The compatible property you have in hamoa-iot-som.dtsi is redundant,
> because you override it with the valid one in hamoa-iot-evk.dts. And
> every other board using the SoM should do the same.
> 
> I would expect that you can just drop this line in hamoa-iot-som.dtsi.

Yes, the compatible property in this context will ultimately be 
overridden by the board file and does not have any direct functional impact.

However, DTS/DTSI files are intended to describe the hardware itself, 
and this compatible string helps characterize the SOM—even if it is 
later overridden. This is similar to the role of compatible strings in 
certain soc.dtsi files.

Therefore, I believe it is appropriate to retain this compatible and 
provide documentation to clarify its purpose.

A useful reference for this approach is the imx8mp-sr-som.dtsi file from 
another vendor.

> 
> Thanks,
> Stephan

-- 
Best Regards,
Yijie


