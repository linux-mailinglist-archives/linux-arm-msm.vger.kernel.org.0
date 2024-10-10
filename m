Return-Path: <linux-arm-msm+bounces-33902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4C5998BD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 17:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6755D28C3F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 15:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A1F1CDA24;
	Thu, 10 Oct 2024 15:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G6GOVFPU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4472A1CCB45;
	Thu, 10 Oct 2024 15:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728574510; cv=none; b=my3C0is79O4OrTFxfjQfLK7odcFJ7bI766xRfls/ZI2clZStse7r0UgV1fqv41vDIeGtkORGVLfzAiSlLCZXlwMjcl7ujfKrtQBtaIqcpaW95eGjcEngjaaveE5uy1QfJE1gW2YnGsOtr7r8UOyXqQdWvDGN5y4MJIkkdwtC92M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728574510; c=relaxed/simple;
	bh=M6ArSolFyRhvgkpKBLV7GgtTxF0gj+vbVhIhSxcQfz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oU+VdF/qpLPtrTw33TqPW24/y8QS0fPt7BzBaj1FVi0I5gSinWcXSo9Nq+de5TeneD8AgccNqOL6+YZomDxSi7BYVhC1lTLC8eU54/w1nP37UQYiwKGQ/OsSYh4YtUhCk6ACOGySvi2/6WGR9hacXNutX08EFHBzrfMhQxLYyPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G6GOVFPU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ACUXAm011324;
	Thu, 10 Oct 2024 15:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xhv5/1S/V1CCa4a0mCm7Uj1o1bdgK4qmxRkHgQo8kPM=; b=G6GOVFPUj4kQEOl2
	vFVBryxGsrCCUHTrghdSdPAkb4C2RceiiOOua7u6TSsCGKuBV7FI4dHIuIwrojD4
	Nk1j5n1gvRmHUh3s1lOe1Uwjzdo/Svx2jUBxLaErUfMoO+rTrDwuRgVEHOLRN8Pp
	pVenwF7LN7rLrTgA/T5k9oUogzIF6eWLCShrHp1c6nnyazwb666P0DoHBgkAHGJ5
	clJmzMy3wUe0TRMi9IfMdFnYmLiIRhFqBn8uZ4UYqVZovVIloI+CyitV4umhoPbm
	vOjbxcsyLo0NdL1pufAPQODg68mDmMQN11/GArhEXh57MeFvd5ivz/i2+yQi/ays
	plWe0Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425xthu0ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 15:35:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49AFZ3oR004477
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 15:35:03 GMT
Received: from [10.216.26.125] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Oct
 2024 08:34:59 -0700
Message-ID: <b03d111c-7e58-4320-b909-becb35f53767@quicinc.com>
Date: Thu, 10 Oct 2024 21:04:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: Add support for usb nodes on
 QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>
References: <20241009195636.2649952-1-quic_kriskura@quicinc.com>
 <20241009195636.2649952-2-quic_kriskura@quicinc.com>
 <xwidjnw3fqc2slwl3vftw7yi4j7juiw6rwszjhtxepqd6zz33s@ncoi4aikbb4e>
 <fe3ebd31-946c-499f-ac96-2cf71c6752e6@quicinc.com>
 <CAA8EJpojz9-xhoxdp78b5=6R8gpjjHQgjb_P0LGfHs4PsdS3vA@mail.gmail.com>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <CAA8EJpojz9-xhoxdp78b5=6R8gpjjHQgjb_P0LGfHs4PsdS3vA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 75O4s2h5osZLlMSJgUpzP-Rv_2rt-VyH
X-Proofpoint-GUID: 75O4s2h5osZLlMSJgUpzP-Rv_2rt-VyH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 mlxlogscore=959 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410100103



On 10/10/2024 8:42 PM, Dmitry Baryshkov wrote:
> On Thu, 10 Oct 2024 at 17:57, Krishna Kurapati
> <quic_kriskura@quicinc.com> wrote:
>>

[...]

>>>> +                    resets = <&gcc GCC_USB20_PRIM_BCR>;
>>>> +
>>>> +                    interconnects = <&aggre1_noc MASTER_USB2 0 &mc_virt SLAVE_EBI1 0>,
>>>> +                                    <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB2 0>;
>>>> +                    interconnect-names = "usb-ddr", "apps-usb";
>>>
>>> As this is a USB2-only host, shouldn't it also have qcom,select-utmi-as-pipe-clk ?
>>>
>>
>> Hi Dmitry,
>>
>> Thanks for the catch. You are right, it needs to be added according to
>> bindings. Since I would be sending another patch after this series to
>> enable the second controller, would it be fine if I add it in that patch
>> or do you suggest updating this one.
> 
> I think it's better to fix it from the beginning.
>

Ok, Will send a v2 adding this quirk.
Can you also help review the DTS change. So that I can carry forward and 
RB Tags I get to v2.

Regards,
Krishna,

>>
>> Also I see some others are not using it as well, like sc7280 which also
>> might need to be updated.
> 
> Interesting enough I don't see this option being enabled on SC7280 platforms.
> 
>>
>> Regards,
>> Krishna,
>>
>>>> +
>>>> +                    status = "disabled";
>>>> +
>>>> +                    usb_2_dwc3: usb@a400000 {
>>>> +                            compatible = "snps,dwc3";
>>>> +                            reg = <0x0 0x0a400000 0x0 0xe000>;
>>>> +                            interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
>>>> +                            iommus = <&apps_smmu 0x20 0x0>;
>>>> +                            phys = <&usb_2_hsphy>;
>>>> +                            phy-names = "usb2-phy";
>>>> +                            snps,dis_u2_susphy_quirk;
>>>> +                            snps,dis_enblslpm_quirk;
>>>> +                    };
>>>> +            };
>>>>       };
>>>>
>>>>       arch_timer: timer {
>>>> --
>>>> 2.34.1
>>>>
>>>
> 
> 
> 

