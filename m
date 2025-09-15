Return-Path: <linux-arm-msm+bounces-73473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AC9B56E25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 04:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EAB93A5C9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 02:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F5420B7EE;
	Mon, 15 Sep 2025 02:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pwn03HvQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DE61E520D
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 02:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757902345; cv=none; b=TT4K6fl2TgFZvUHu1uZnJp2/G79mC4OLr6fJcAinrgGEg+GAhk/NyJzjb3Df7YccbA3jiU2f3CYCU+SjFI4cbLBPAghLXzx9XibxlsN3JMjv7tHDC9t6nlNAf0afcrCWjO0nlJXew02X4useZSbM/NptRTNYFLch0FXpqoF97WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757902345; c=relaxed/simple;
	bh=0GHhTioe3fCzuyp9mgFvVSdfYm6wWU9Ggz+bSvzK37E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jZeL/1qrNL4DCpfyuDDupQgL3tvk+4Q1LlluG1J3g1pImIDLJkn6rSLCU5F54j0TohSQDRWaRSb2SpYKhnbOfJpd2EWOxyf7zLCI/oRRIBDiPjoyBOZWRIK3PDz+GOYfmOdcaj6aPM7E4gJxIsENo38UpUZq4zElVWSJ5GODeH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pwn03HvQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58EMGkle031305
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 02:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PKDP3y3fslPbwAzXQxnOfgYXvBbN4x4JP0Cd/lcj1w4=; b=pwn03HvQRx+QOzw4
	CNrv2nPnVR4EeS9xj8OwLkCSr3pDrKIgrnn5zGPD6OSmIVbhIuMRk/sM1ymsiuVT
	UoS/3B+TTm/PGg6AavsVUT4c60pJjr0xcGi9prdqNa44mlAqdwApVpOZeG3y0UvX
	5IneyOQFUpA0/tBtArlsBq/qR6ft07Uf6Q6qHrzeGWpJTijH9Tg/tNPoO+m9+M0/
	hXH4VFmAgZX9tScMTUu3BD0M1gcLnYput3L0TM/Neab7F8N6YEqtMys+8kGWxZQw
	wPMwYjVDG1DxGXPQGiFAaohIH1ZzUMzmiCNs3TWZdLZSxm4hte3uTUf1yOseOq7I
	4TtsQA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951wbb1j3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 02:12:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-324e41e946eso6771751a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Sep 2025 19:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757902342; x=1758507142;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PKDP3y3fslPbwAzXQxnOfgYXvBbN4x4JP0Cd/lcj1w4=;
        b=BUP9fcWaJ4+51lCE/VxSWZjcn7jtvP14T3U7eRguY+k1jNIFdh3MG3ofruf51wFc6l
         b6boSCXdEr2RvvidfWQ6dBq+ArZw3jxxX53KKHViXvckfyFqGOB05F+jbeE6xiVn/oZO
         mtWrk3cnwTAIHTCp2CocYBUT23677gA+mBSvPH6QW7fdu/nku5uZeABq+s3e/nJOKAwd
         oRCGaUMlFWJqlhGiNR7yulP/hyQl5hCY2XVK2J4rgyqcaaQO3FH4hIQNp3WwElDRBOmo
         6IuTrwiarArNApeUGha1uA65aLNxpGhuULmbEiTKyEWUvJPdiTAJdJ1bFSOESoqFnRy1
         iwMw==
X-Forwarded-Encrypted: i=1; AJvYcCW1vx7uuDByZkeFdGO9NdTe0rBOl3Y8NTAhn0U+wowJ9DSoQOTwbIfDgHZ9vaoGAcsFQHojsvGdwRRajAIr@vger.kernel.org
X-Gm-Message-State: AOJu0YyzRs6JsJ7gApV0OcuuzW0d4xjk38QOOziPIBknU2VAWwiPJoYa
	6brh6Fnko3XftUBU2f78NYTAc8a6atauyYx7/tunR5le1JeFyw3DOWU8HsV2N8/ohEbJ/R7Zqaw
	vcxPEbzI7xdQEG6LY+Blx+wjlGheNybMoZY5vxK/2k5JmtqfNoUp2S/7aUueAuwiK70MrpMujlW
	gp
X-Gm-Gg: ASbGncsTOVdXHkGc/i3/d4elR86AyZO6lPhc5XdgE3eaRMOC1hu6ZkAsqPBbpzeM/mi
	sZMOQHPeY8VqzCNPYIdLH6ZI9HChDUEdUwfOsHkl6K7e+mP4A6M0RfBeMuXTSMi7QYdZFhcsrjw
	gdLaTTN74hoC0vlNi8KynIigRZ/8PVbv6GMV8XIK/NAQ5NfKxGYYaIN+as/5DHQHxsGFWFcuAmD
	1vPAQ3R04Ik9/THg9ER+D2/rILrh7ZatyAXqpU+YR5xkOLBNlNb76Vi+PcaXONkfUjwxCaRceB2
	MGjQTuJi1ze5tNeoQhlQgEDnO8xz4ZgdWBhgXYk1jXZt8r3Mjx85m55NX/SgepCoXwcY98COTex
	2VXhjrdAN4F2H/smNc4YyOLkJgc4ZQBKT5g==
X-Received: by 2002:a17:90b:1651:b0:32d:3895:656b with SMTP id 98e67ed59e1d1-32de4ed5b88mr14891970a91.12.1757902342273;
        Sun, 14 Sep 2025 19:12:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkLWVKWY8dJJSoWF5RHJnh56tViKNJ+59aIriO7fADzS1hQtOLicZ6cEGv4usM19uQ2SmK5Q==
X-Received: by 2002:a17:90b:1651:b0:32d:3895:656b with SMTP id 98e67ed59e1d1-32de4ed5b88mr14891940a91.12.1757902341829;
        Sun, 14 Sep 2025 19:12:21 -0700 (PDT)
Received: from [10.133.33.181] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32e1e5ad768sm4381659a91.0.2025.09.14.19.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Sep 2025 19:12:21 -0700 (PDT)
Message-ID: <90dcca12-1a68-4049-bcbe-c333aed07a07@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 10:12:15 +0800
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
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <aMPee9wEOrrW-KMU@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=68c77607 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=g_NBhjyYV65zCQWelF8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: f_DD7tSjUQZhIYu5TTNx85NuMrN7xJmC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDA0MiBTYWx0ZWRfX4oRP0NrnEoiX
 MrKg8b2QaBb8Ynemh852qC8U5fEaohiM8zhyN39zT6Z141/q7YunVhPyEP4v4hpuYlGYARllv7j
 1ez7UsS4By/5MNghEraiBKlvnw9DK3eFaCMCL5Ebs83MKR/WYguh/1XbBz7EQoSU+7H8B+1bJSu
 xNvaFfG8gUZCDxi0ssAl1MHyT4kRg0vjWBW8g/tEZackIFIQ5QU1AZhaFh24+y7eF6RGnGGIvSn
 egzoyGgaL6GPzz+jMh7LhuvEkntVCuxLNS13QNHwDEb1IoqIY4QeFcXV9Y9teZBRLRwGjYqY+2J
 0heipaZwNT/JFF+5CDWYPNp+rZy8VH0BP+hDC8Q7Bw3AXAqXFEQIKN5IaDOaaMLNRvP4ARKRkqB
 +7KC3Y7h
X-Proofpoint-GUID: f_DD7tSjUQZhIYu5TTNx85NuMrN7xJmC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130042



On 2025-09-12 16:48, Stephan Gerhold wrote:
> On Wed, Sep 10, 2025 at 05:02:11PM +0800, Yijie Yang wrote:
>> The HAMOA-IOT-SOM is a compact computing module that integrates a System
>> on Chip (SoC) — specifically the x1e80100 — along with essential
>> components optimized for IoT applications. It is designed to be mounted on
>> carrier boards, enabling the development of complete embedded systems.
>>
>> Make the following peripherals on the SOM enabled:
>> - Regulators on the SOM
>> - Reserved memory regions
>> - PCIe6a and its PHY
>> - PCIe4 and its PHY
>> - USB0 through USB6 and their PHYs
>> - ADSP, CDSP
>> - Graphic
>> - Video
>>
>> Written in collaboration with Yingying Tang (PCIe4)
>> <quic_yintang@quicinc.com> and Wangao Wang (Video)
>> <quic_wangaow@quicinc.com>.
> 
> This looks like you should have Co-developed-by: tags together with
> their Signed-off-by: tags.

We’ve agreed on this as the preferred method for marking collaboration, 
as discussed earlier in this thread.

> 
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi | 621 ++++++++++++++++++++++++++++
>>   1 file changed, 621 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
>> new file mode 100644
>> index 000000000000..c7c3a167eb6a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
>> @@ -0,0 +1,621 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include "x1e80100.dtsi"
>> +#include "x1e80100-pmics.dtsi"
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +
>> +/ {
>> +	compatible = "hamoa-iot-som", "qcom,x1e80100";
> 
> Undocumented compatible (without "qcom," prefix). I think you can just
> drop this?

This compatible string was also discussed previously and is the 
preferred choice. I’ll add the missing 'qcom,' prefix.

> 
> Thanks,
> Stephan

-- 
Best Regards,
Yijie


