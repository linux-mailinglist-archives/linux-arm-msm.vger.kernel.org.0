Return-Path: <linux-arm-msm+bounces-72559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C1DB48C65
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 13:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A32E1B24FA2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 11:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 141992E5B11;
	Mon,  8 Sep 2025 11:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnVhBCf3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B6A2FB624
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 11:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757331625; cv=none; b=MNT0VLfuSBuKKrSBAl/LsEnhloxJddlYbfY0HtIYLqsadoeVfLuHYDj6H/L20XLYBgL3obaoZ7VCNX3PLL7IE9Z6qkm6MPoWYQwZZbZgbriSO/x/ClicdkxRpy+oeMzDaqqKOUj0eagAOU8Y90JQFt9honTfkhY1UtndhORQp+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757331625; c=relaxed/simple;
	bh=mkZ6cmKwkvA3JrlNWuoEOfbkg9E/yY2SgCd/wPVk0Bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B+lTM+oBQRMqPeN0jP4dL7mJp+8ShOdyc9KYI0ZMcc4nF/JSWsb53ag4zqWVR9sV/cYc7PjlKPYPyrEjBrQoEW68DX4WkbRqfxlE2Ol2eK4WhuykOdvMAEJO2kfDDKx6dpr7b/nwjD+nTBHZ7xxXGALXxJMYQTmQUEgWu80B9RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bnVhBCf3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889RrxC031220
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 11:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NnEbO7ArMxQ89jgAEQwVkzyZoAUuZFaKn25X0Rq6OME=; b=bnVhBCf3W5YshFsc
	JTPN2wRztoaTNpoO2lYqtUE5Q/kBi8X8bL4Jfi1y5JNY84n93nx/6hOUiF6tHvEg
	eEdmDS/A5DKloz5qnPXVgew7SCHnTdpEFshGM3ctH0aJ8RGz1vmvgoWyM6660R47
	+O2/mGJYtmnzNFroX7p9WXwG3P3jVQIxfZgi2qvn/GiihOWvSztZvyI9tv0bUlOU
	/8pKuNGJLnhszzG3Z0D6MD2x2S2YlIOpFq1RHPxEr2rIdBn7Ma63/zftjyxESLs/
	1ngsUbu8nMb98pPZOfmGonsKZzWxQfirL/nUD904xBg2mi+zt/way+9ct9ZoiTd2
	ZBvVWA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j4hgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 11:40:19 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-72d3778ba04so6753386d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 04:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757331610; x=1757936410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NnEbO7ArMxQ89jgAEQwVkzyZoAUuZFaKn25X0Rq6OME=;
        b=nUefOuj7yURhq/+V2TZMlxdRypJjqfzLo7vFofSE/GoLOknAuoVyErYwD1jpuVGq5E
         tz37+06JZs4wp3idq4vtU/zOUwrhp+F7+XqU3JyxXV1qUUsoRCt2bFA/1jLpzvgkl/P7
         kD9OXbd5aazUgakTydKuIAcOT0ZBaxxV2AuE1coZzP0SeLAPpAT0Nh7vf4DQaw00VqRw
         aPf/9t9hlbeFuJgLpTBmDoQ5jT1Q0ppjnXzbT7M0rYiaB0Z6FO2v2gDgV3zWlaNdYGGp
         5tyDaw+XtYsHdl2qD2ujUZBI3g2Aot7h5nNpqkrfCl1PyNbdMR2fwxmVRQFka91ewOsg
         zVTA==
X-Forwarded-Encrypted: i=1; AJvYcCVY1qYIgwpH5CWIGETh+UiKThRnyKrav02Ah2mFEsD5qXdv94OtjReH/cpHqiA+s0sQ6VTbCGrorYd9O2dP@vger.kernel.org
X-Gm-Message-State: AOJu0YyNux/oLvYJmFDVywzRv5HPhbPca46wP+4EMERcyrnStx8exQ1P
	tvzSfQ95VjjhV9can+2K1rvPwUoDkMSPz0o8ptKWWEGt/yKRRXIGr78oXz56h4AQ4fAdidC4tJH
	/ADteSqrt5FTipt63HpgWLhfMcNuoXgybjLm4lLt/steegGCkhVk2dXIFXn0+Cyr+c7rb
X-Gm-Gg: ASbGnctva/8VBDTE/oGVq3pDI0ERJ2HIBnFk0tohLkkIhBDAjM2PXfVq3vJf4MUPyuT
	J+isPc/rE8UOmeo0f29T7iJITXjHup9GilMoRvEvdcUm5u+u2y5fjdFcYvPvCJ6U5pyxN879Voz
	J9+unLiPy2Zz5VyVmeJ7pclPh8moJGV/28TWHKCPC6aCN/MCAg1OWIvJY72WXZ61Vu049z+eDVZ
	FV3mzHZsc96J7+3hW/F5EseslDy9y5sw1mnKeiZroURqotLKH8Y72xOJmiFT2kfhwz/vfqRJJbg
	HvgNa7sxenoOE1XX1GYVKs9C43DZIRzy8KV4PzuvMl/AbWRxN5G/XJUd8O3lprDjTG/obTMKtSi
	77oriL7iWqv3gCkFxdYYpdw==
X-Received: by 2002:a05:622a:1355:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4b5f85310efmr55841101cf.9.1757331610315;
        Mon, 08 Sep 2025 04:40:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxfpBCfjkE1QhZrW+7/NQDQGsgDEMhq3BgEaMgwoV6K03PfppLuh0RrNhfqqjSD1n65xJK2Q==
X-Received: by 2002:a05:622a:1355:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4b5f85310efmr55840761cf.9.1757331609503;
        Mon, 08 Sep 2025 04:40:09 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b046f888b95sm1229367066b.34.2025.09.08.04.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 04:40:08 -0700 (PDT)
Message-ID: <365b984c-a5e0-4fa3-a011-b897107e2b92@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 13:40:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s:
 add HDMI nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250821-topic-x1e80100-hdmi-v1-0-f14ad9430e88@linaro.org>
 <20250821-topic-x1e80100-hdmi-v1-3-f14ad9430e88@linaro.org>
 <a38df652-54c0-4216-9aa5-c8d32599c8f7@oldschoolsolutions.biz>
 <c66fe361-74c9-4471-b371-353ca582bb3b@oss.qualcomm.com>
 <xzw26v6aqutgau3zwm3njblf2qw2em53n45ju2yhhfh7uhyxbz@6kqvink2chld>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <xzw26v6aqutgau3zwm3njblf2qw2em53n45ju2yhhfh7uhyxbz@6kqvink2chld>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX85/RDivvSxV0
 UZBqXap6hl6vwA/BbJXxw4yjkpuOsZBEYnkFU1+kT0e3JiCVpNlygwOyKFwtCH7LcjNx/EmV+0x
 ozzgDYzjj5rvwtXfyx0sFfXiGtM3NGmzaEoLYehRTa8ZqGR1bA2/+zBAqm1gbqoQjKxsk2clMIf
 g2dyRMkznO/8sLUUxcG9gdDJRlufwsDHQW7ZuzS3Nk0T4XmFYzfjS7sjGNU81LMMzwK6HaVCzk/
 3f3Xw4Jbo23Marrj1eXh5x/65PzQeYTEZ636LeIilKnFmWRK2w1cW27Oy1FUpwGcDtqLhJ/JzmC
 tyEnddwEnwTWpBSeN+w5AQRUrVPd84nibnUQwyQMV0Pvu9Z6AFSICKrCwp4uCLI+icB0HaTDRYV
 ZEEn3MOC
X-Proofpoint-ORIG-GUID: 17IajUDoijB6isRLjBINmxP4OrshoTeg
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68bec0a4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=0cVmaDdcn-jcdQdzUFEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 17IajUDoijB6isRLjBINmxP4OrshoTeg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_04,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

On 9/8/25 11:39 AM, Dmitry Baryshkov wrote:
> On Mon, Sep 08, 2025 at 09:16:29AM +0200, Konrad Dybcio wrote:
>> On 9/6/25 10:41 AM, Jens Glathe wrote:
>>> On 21.08.25 15:53, Neil Armstrong wrote:
>>>> The Thinkpad T14s embeds a transparent 4lanes DP->HDMI transceiver
>>>> connected to the third QMP Combo PHY 4 lanes.
>>>>
>>> [...]
>>>>   .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 44 ++++++++++++++++++++++
>>>>   1 file changed, 44 insertions(+)
>>> [...]
>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>>>> index 4cf61c2a34e31233b1adc93332bcabef22de3f86..5b62b8c3123633360f249e3ecdc8ea23f44e8e09 100644
>>>> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
>>> [...]
>>>> +&mdss_dp2 {
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&mdss_dp2_out {
>>>> +    data-lanes = <0 1 2 3>;
>>>> +};
>>>> +
>>>
>>> Hi Neil,
>>>
>>> shouldn't mdss_dp2_out also have the link-frequencies property?
>>>
>>> +    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
>>>
>>> Or is it something the bridge already negotiates?
>>
>> No, it seems like our driver falls back to HBR2 (54xx) ever since the
>> driver has been made aware of this property:
>>
>> commit 381518a1677c49742a85f51e8f0e89f4b9b7d297
>> Author: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> Date:   Tue Dec 27 09:45:02 2022 -0800
>>
>>     drm/msm/dp: Add capability to parser and retrieve max DP link supported rate from link-frequencies property of dp_out endpoint
>>
>> Dmitry, is there any reason not to allow HBR3 by default? Is our dp
>> controller/driver not smart enough not to advertise rates it can't
>> support, during negotiation?
> 
> I don't remember the exact details. If I remmber correctly, there were
> cases where using HBR3 resulted in a less stable signal than falling
> back to HBR2.

A very early revision of that series has a commit message that reads:

"""
Since it is not every platform supports HBR3 link rate, this patch
limit the DP link rate at max link rate if it is specified at DTS file.
Otherwise, the max dp link rate will be limited at HBR2 as before.
"""

Konrad

