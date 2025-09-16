Return-Path: <linux-arm-msm+bounces-73650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB9CB5910A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 10:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A3601BC2EC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 08:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B95328751F;
	Tue, 16 Sep 2025 08:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mW65n6/i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E61427E070
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 08:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758012167; cv=none; b=N8hPbhiEbkestgd0UEI9FCTV3lYiPuimdKVgsNrQ/Um87WIqzz+olFCxAErhkl8h0+JKjL2NfYZpY+ZAAwcw9ngI7b5Zu3bHDPcIS/GwxG1rshHiL0k8pEIowR51QPIj4pMGLLrXTa4/cZV2CXFppi6cjtDh5UL0LwftJApOxIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758012167; c=relaxed/simple;
	bh=zWJzRdOiaxDsYLrstjuU5mof3JSkrBSxG6+zqCW4wUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OpwmEzjkVCg+VQWQ3lTVc1MYNMemIOGEUtduI1MKdnBpiOYoea9OP+ZE43gzDq9aWl17ErxWmhoApRb5sTmC4FKxK3///CT4F+g8bnc+7ii/FQVHZSP3+Y/Vw7XGq1+tfghVbBNXJUJF2bzHoj84BynGf2thYd72B/GRGaPHZY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mW65n6/i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3pkr0020370
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 08:42:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yeg01tZKWracZvs2m+zBsbIUFkzq3IrS1xIM9ER4uT4=; b=mW65n6/i7D0zch3o
	Pu+QoWe8dfrRue7/v7YqWKeDrDN2i64B+qWpggWykgTIClOoLcLMZjUrD3CFMeJk
	AiP+0b55fVKi+Mcl3LVvLxYqQsHNApJaR+q2TTU25t7jR9F6cABsqKnuAsXlYxMN
	bZxtWa+HsgaIqM4/g9WXQcU9Ad0/S1txxt7Xxm3eJt9Az0vzTxsvrwj6B57xS81V
	9zFnLurbr+md/RaLnJOlc2AcsYmdIj3ymRG/xWKTrOP6n/GiEY6rRmieJBXcGvB/
	Gcxkm8Wf+q+0OSzUvzVols5CMf9fXUE0U6QeVp8/MGuY5/YDytaB9pCFmNfENg5d
	m9sCPw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chg176-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 08:42:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3234811cab3so4793577a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 01:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758012163; x=1758616963;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yeg01tZKWracZvs2m+zBsbIUFkzq3IrS1xIM9ER4uT4=;
        b=EGj9Fy+GU2ZHSR+tnRwK4xt2iiOoYzSw112YyN6x3tY4HHK0NOd0478ySI1MjUX41V
         McngGJgNZ5TcPVKkidewea+bRdqzAJy8I635IvA5PcGKcGeyiPLsS6WZ841LRf20gdsK
         zPSsxHspJIaWXEc1fxvBhFlUvrUguEeclYiztVWC2T0qQ0NSmzJMpLm0s+NbxXaYu7wF
         wgzlwXj3Q/GuX7YMExIKksPicL3qFK+nqTnIWrJoBkLtFK794WSX+KpW8JO8vDYSbjQI
         8yVjA4INK5NHE8RxjkQr7b8JjrdPDl20M36n8YJdDBMfmPW0buqiPagrNd4XS37V/Oq7
         deZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGhIxRdgq7XpkNWBbeGHHEaLRaSQSkFn/pVCZp0OS0fMHxlyqZEGhvIJ5da+D4nkjQoMOWcPnDkZyFSVJF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9nSlPE2CeMoXyiDB2MsWi9oqkfE9xtkW7Q+m25442jEFZk+9M
	b8C0INYHdHUjc6ljGf/dkLH0Ru0nbsYvkqEvM1G+UuqnI1KNtRUbtdPpHyOTtD2E1DP+rrMezOu
	n5pqVvWMK7Niv1jr4o4ecKyh+tD2McCWAO68mzQKkRPn6rseIIyfRgcPWRHq1vIF6bujU
X-Gm-Gg: ASbGnctFpjYWeUR7dskexcwH0YsYC4nciZ9xybjMt7+46wfp5NpHGNWU3aMe03eiqVp
	5HsXcTi/t9OUPzI6PlZqUtqfGRWTqSc2q3cr/GLM2ybugVPFNJLaymC+rPE4mT4x0S52k9DvUa8
	IxG11hTfVC6qSGLeTRH60GaP/M5tRRaipL/3g5+5eCswztZCt7iPeLdycDQhq5fjx2GmLIlZubT
	r3Gk4xa0x2DCV5lhYCxMyTelVTSTW0k+GfWC+1XUdq4v8cANRv5hJJ9YPDGMpvZzCRLaovLOzKt
	JR5S7k6dIlACiDU6SM9efk23raKfzXR8DnsYFWb96dxn+pjNQikrkGS0NoeZm3nn66NFNhxE+2Z
	IfXaUu5FRGEOPVU9+FT7TDIArmpBE2KXD
X-Received: by 2002:a17:90b:4f46:b0:32e:3c38:2052 with SMTP id 98e67ed59e1d1-32e3c38275emr8297626a91.22.1758012162918;
        Tue, 16 Sep 2025 01:42:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFYNr+REGvUDSu3d4mFMsdXpfUIGA7+I7Ce3HV8tezeHqBCm66TJGUtSsRPMBPiqBEQXoTdA==
X-Received: by 2002:a17:90b:4f46:b0:32e:3c38:2052 with SMTP id 98e67ed59e1d1-32e3c38275emr8297570a91.22.1758012162240;
        Tue, 16 Sep 2025 01:42:42 -0700 (PDT)
Received: from [10.133.33.37] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7769a0d00d7sm8621214b3a.37.2025.09.16.01.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 01:42:41 -0700 (PDT)
Message-ID: <0d658857-e1f0-4e5f-808f-ac3c051d8910@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 16:42:36 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/4] arm64: dts: qcom: Add HAMOA-IOT-SOM platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250910-hamoa_initial-v11-0-38ed7f2015f7@oss.qualcomm.com>
 <20250910-hamoa_initial-v11-3-38ed7f2015f7@oss.qualcomm.com>
 <aMPee9wEOrrW-KMU@linaro.org>
 <90dcca12-1a68-4049-bcbe-c333aed07a07@oss.qualcomm.com>
 <aMfT1_uyZETUEBYk@linaro.org>
 <3b81ea60-553a-48d8-b6c7-6b55673fe04d@oss.qualcomm.com>
 <aMfiCry1NDdd9AnX@linaro.org>
 <aa2677a3-7d5f-4abc-9bb4-7db53b9b8a0f@oss.qualcomm.com>
 <d5c1e2ae-e82c-47aa-97b5-a2020a8846fb@oss.qualcomm.com>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <d5c1e2ae-e82c-47aa-97b5-a2020a8846fb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c92304 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=nAuJzNkJE3ImTGlgKg8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9YyxrtT97l6RgfDiP2ulPbCzEri8GhvP
X-Proofpoint-GUID: 9YyxrtT97l6RgfDiP2ulPbCzEri8GhvP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfX4LFoxyR5y1nD
 q4PxrlZNqhfi6NBMsiB1HzNSyby0G5mp2NoFRjBqsSpWKjlk77y+5Gr+FlIDicewkHz/WAoOnt3
 VRqGlmdsjHuAECga9oe6+GGxdhWiY6GmiXBJIYrE2HvtXkU9jar8wbiisSaXlAJx8Uyks1qWAIO
 FFm+bI09oc9q+OjYDgsK518vf4dfqMiYH6IUnPP2gQrJfC7VvTsr9bwXPB2aQveWblww6C9v+X1
 nqXNM8ASa/hhlmYg/UgQEWPuAf3nYGfbGlVJ2IDNYNwRzKYhirxTfmD/n6hBsJfrNShbbT1RvJ7
 O97CZhdcUCv8ogHS9CWGSVT/uJJcKAqsC+o/miBTVzJ8p4eOeDPTAoXxzcPybF3T/8srm8yRfqn
 /dGZmnmC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036



On 2025-09-16 15:46, Konrad Dybcio wrote:
> On 9/16/25 3:06 AM, Yijie Yang wrote:
>>
>>
>> On 2025-09-15 17:53, Stephan Gerhold wrote:
>>> yOn Mon, Sep 15, 2025 at 05:46:09PM +0800, Yijie Yang wrote:
>>>>
>>>>
>>>> On 2025-09-15 16:52, Stephan Gerhold wrote:
>>>>> On Mon, Sep 15, 2025 at 10:12:15AM +0800, Yijie Yang wrote:
>>>>>>
>>>>>>
>>>>>> On 2025-09-12 16:48, Stephan Gerhold wrote:
>>>>>>> On Wed, Sep 10, 2025 at 05:02:11PM +0800, Yijie Yang wrote:
>>>>>>>> The HAMOA-IOT-SOM is a compact computing module that integrates a System
>>>>>>>> on Chip (SoC) — specifically the x1e80100 — along with essential
>>>>>>>> components optimized for IoT applications. It is designed to be mounted on
>>>>>>>> carrier boards, enabling the development of complete embedded systems.
>>>>>>>>
>>>>>>>> Make the following peripherals on the SOM enabled:
>>>>>>>> - Regulators on the SOM
>>>>>>>> - Reserved memory regions
>>>>>>>> - PCIe6a and its PHY
>>>>>>>> - PCIe4 and its PHY
>>>>>>>> - USB0 through USB6 and their PHYs
>>>>>>>> - ADSP, CDSP
>>>>>>>> - Graphic
>>>>>>>> - Video
>>>>>>>>
>>>>>>>> Written in collaboration with Yingying Tang (PCIe4)
>>>>>>>> <quic_yintang@quicinc.com> and Wangao Wang (Video)
>>>>>>>> <quic_wangaow@quicinc.com>.
>>>>>>>
>>>>>>> This looks like you should have Co-developed-by: tags together with
>>>>>>> their Signed-off-by: tags.
>>>>>>
>>>>>> We’ve agreed on this as the preferred method for marking collaboration, as
>>>>>> discussed earlier in this thread.
>>>>>>
>>>>>
>>>>> I can't say I agree with Bjorn there, but ok, he's the maintainer. :-)
>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>      arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 621 ++++++++++++++++++++++++++++
>>>>>>>>      1 file changed, 621 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000000..c7c3a167eb6a
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
>>>>>>>> @@ -0,0 +1,621 @@
>>>>>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>>>>>> +/*
>>>>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>>>>> + */
>>>>>>>> +
>>>>>>>> +#include "x1e80100.dtsi"
>>>>>>>> +#include "x1e80100-pmics.dtsi"
>>>>>>>> +#include <dt-bindings/gpio/gpio.h>
>>>>>>>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>>>>>> +
>>>>>>>> +/ {
>>>>>>>> +    compatible = "hamoa-iot-som", "qcom,x1e80100";
>>>>>>>
>>>>>>> Undocumented compatible (without "qcom," prefix). I think you can just
>>>>>>> drop this?
>>>>>>
>>>>>> This compatible string was also discussed previously and is the preferred
>>>>>> choice. I’ll add the missing 'qcom,' prefix.
>>>>>>
>>>>>
>>>>> Even compatible = "qcom,hamoa-iot-som", "qcom,x1e80100"; is not
>>>>> documented. And it doesn't make much sense to document it either, each
>>>>> of the boards using the SoM should have a more specific compatible and
>>>>> therefore needs to override this property. I think you can really just
>>>>> drop this line.
>>>>
>>>> Patch 1/4 documents this compatible. It’s another requirement that SoC/SoM
>>>> should follow, which Krzysztof pointed out in v2:
>>>> https://lore.kernel.org/all/aee74e0f-c957-437d-ab48-3977013c3116@kernel.org/
>>>>
>>>
>>> I'm not saying you should drop the "qcom,hamoa-iot-som" compatible. My
>>> point is that only the compatible list you use in hamoa-iot-evk.dts is
>>> documented in PATCH 1/4:
>>>
>>> compatible = "qcom,hamoa-iot-evk", "qcom,hamoa-iot-som", "qcom,x1e80100";
>>>
>>> The compatible list you are using in hamoa-iot-som.dtsi is *not*
>>> documented:
>>>
>>> compatible = "(qcom,)hamoa-iot-som", "qcom,x1e80100";
>>>
>>> because the board-specific compatible string (e.g. "qcom,hamoa-iot-evk")
>>> is missing.
>>>
>>> The compatible property you have in hamoa-iot-som.dtsi is redundant,
>>> because you override it with the valid one in hamoa-iot-evk.dts. And
>>> every other board using the SoM should do the same.
>>>
>>> I would expect that you can just drop this line in hamoa-iot-som.dtsi.
>>
>> Yes, the compatible property in this context will ultimately be overridden by the board file and does not have any direct functional impact.
>>
>> However, DTS/DTSI files are intended to describe the hardware itself, and this compatible string helps characterize the SOM—even if it is later overridden. This is similar to the role of compatible strings in certain soc.dtsi files.
>>
>> Therefore, I believe it is appropriate to retain this compatible and provide documentation to clarify its purpose.
> 
> No, if the compatible and model are not overriden, the carrier board DT is
> invalid. The SoM dtsi isn't supposed to be a "functional" dt, but rather a
> fragment, like a code header, containing most of the common functionality
> for includers (which is derived from the presence of the Hamoa SoM).

Understood, I will remove this line.

> 
> Konrad
>>
>> A useful reference for this approach is the imx8mp-sr-som.dtsi file from another vendor.
>>
>>>
>>> Thanks,
>>> Stephan
>>

-- 
Best Regards,
Yijie


