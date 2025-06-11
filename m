Return-Path: <linux-arm-msm+bounces-60892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE718AD47B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 03:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66A203AAD8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 01:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA172030A;
	Wed, 11 Jun 2025 01:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fUmzr6VA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413971F949;
	Wed, 11 Jun 2025 01:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749603929; cv=none; b=Oy8jKchh44EaCq5uxubPxEw7kpBiULEGZBMjfP0QAkWc/sa3uqis8wcTjhTb7dj5PKtUDlMYPH+xyWd7wZvZinS1vjLSxkDJNgcGSSENvA/ofAKUeY/uyBYINsJlhMTxynEqU2QVvA4ffyq2eYJG49TOnDrkv4wCN8yjukl9LOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749603929; c=relaxed/simple;
	bh=dOkoIKcGlaQosiiCi9rgVkqR/O0cr1xBBo61BLwUxgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=P1oU45R4JqWTrRg37h63/7iVv5hx5KINkeW1PyG2cKxZ+B2uSBgYHfO7CF1hsCNU1YmaJZoVG4Kvam8aborpEquZ8zdZGFbphzWzTOyp753URIqdmnkam8RtwYLI2lJOTGIc6CgVZhBxtGan4f4RQySCtpWds464NLoV424lko8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fUmzr6VA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPqps030889;
	Wed, 11 Jun 2025 01:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v+a+SXakBgY50D6h/qPLnwaw5txhUBpHruIFhwWc8qY=; b=fUmzr6VA47VhQnXC
	EP3/0eJesu+tjlNO0HFMUEUfX4ISm02lnF4TfeuOoHRHMPdQqYijoZgcM9Fi54uU
	rvqB2XtsapJIdQ+spj/0X+W0JSwXRr5jvpR5GoE8R+8jOLN6hYhqeY791B10LMqo
	3tFe1huk3AMsIddZ8FkjKapE+G1WC1ObWY8aqPRYtasXy113KTPcF/1SQSgy9OyF
	u63X/xQUWp/6ce9LCtN8b0Y8oTpyUhQKpB0wLF4yw72uALg8y+xlWCsr5UMQm5ym
	7u8wMjcwfwVQsnNS6KAqu76yod73kEpjgkBwC5X7+A6rSpIjRV/P3SfIoZSdnkze
	t3x/yA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2tdw05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 01:05:23 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55B15LIQ010262
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 01:05:22 GMT
Received: from [10.64.68.153] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Jun
 2025 18:05:18 -0700
Message-ID: <6759e8c9-53a6-42cf-8199-d6836c77445c@quicinc.com>
Date: Wed, 11 Jun 2025 09:05:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: disable the CTI device of the
 camera block
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Gan
	<jie.gan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250527015224.7343-1-jie.gan@oss.qualcomm.com>
 <5fbb515a-c3d0-4bbe-a689-41e730ecd952@oss.qualcomm.com>
 <9a156925-cf7b-4d2e-88a8-fdfed5528553@quicinc.com>
 <1fef810c-47fe-4f6d-95bc-0d72dbd63bf0@oss.qualcomm.com>
 <79f5e42f-f857-4247-abf9-d0f3f5c1a498@quicinc.com>
 <f3f8f446-4f0d-482d-952d-35c80d7d7881@oss.qualcomm.com>
 <405f0432-3f07-45be-8511-06235dcd84d0@oss.qualcomm.com>
 <a63ff3a7-c67b-4251-81f3-ce6cc3a3d068@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <quic_jiegan@quicinc.com>
In-Reply-To: <a63ff3a7-c67b-4251-81f3-ce6cc3a3d068@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ivas1hn-Oh8OBIRpnoa1XYVwqQ8lY5Ki
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6848d653 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=P-IC7800AAAA:8
 a=OefDGO8NFz7VKNv-hUoA:9 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: ivas1hn-Oh8OBIRpnoa1XYVwqQ8lY5Ki
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDAwOCBTYWx0ZWRfX7BjdkqVQz4HV
 JGegskcinglcHH+M0Rfv28+o3qXvhu+j8GpOORbqy0sVEDSbjI1OF3sDd5r0C6S/FVV7VE6LMiF
 OKvf+I8fHMa9E/GphiQ3mWiwOdABHvJjF9IK3B653PZ+X12bRudN3bqVqxm8lVqM/DpzHK5Ka8R
 nfNAA5+R/IcK5D6gJPsatGlufG/AkZidJpNKCDCUn1SnManFqseGdzyla0Ls0PGc4jgVSdR9lEo
 Mx+HooWb3R0kLaQmTUgEUuq1n/e8jmL8leUSHYDpZ/kseiQIrxkUlFq/aNS7UUgwq3iGvRHy+n6
 okCB60p+vLP74EkglY2d+I8qWBppvMRVxwrYbG8STEZHDX61d11BsRErtR1t8LSHTT+hZOwnmrr
 lRvMMaAMzYwezo2SPKB+bJCCaTSKxeN36fNZLGma/acLQMgRWcDcWLZ2qtckuyBd7VHO+V6+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_11,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=956 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110008



On 6/10/2025 9:24 PM, Konrad Dybcio wrote:
> On 6/3/25 5:17 AM, Jie Gan wrote:
>>
>>
>> On 5/31/2025 7:05 AM, Konrad Dybcio wrote:
>>> On 5/28/25 5:02 AM, Jie Gan wrote:
>>>>
>>>>
>>>> On 5/27/2025 6:41 PM, Konrad Dybcio wrote:
>>>>> On 5/27/25 12:32 PM, Jie Gan wrote:
>>>>>>
>>>>>>
>>>>>> On 5/27/2025 6:23 PM, Konrad Dybcio wrote:
>>>>>>> On 5/27/25 3:52 AM, Jie Gan wrote:
>>>>>>>> Disable the CTI device of the camera block to prevent potential NoC errors
>>>>>>>> during AMBA bus device matching.
>>>>>>>>
>>>>>>>> The clocks for the Qualcomm Debug Subsystem (QDSS) are managed by aoss_qmp
>>>>>>>> through a mailbox. However, the camera block resides outside the AP domain,
>>>>>>>> meaning its QDSS clock cannot be controlled via aoss_qmp.
>>>>>>>
>>>>>>> Which clock drives it then?
>>>>>>
>>>>>> It's qcom,aoss-qmp.
>>>>>>
>>>>>> clk_prepare->qmp_qdss_clk_prepare
>>>>>> https://elixir.bootlin.com/linux/v6.15-rc7/source/drivers/soc/qcom/qcom_aoss.c#L280
>>>>>
>>>>> I'm confused about this part:
>>>>>
>>>>>> However, the camera block resides outside the AP domain,
>>>>>> meaning its QDSS clock cannot be controlled via aoss_qmp.
>>>>>
>>>>> Do we need to poke the QMP of another DRV?
>>>>
>>>> The AOSS has a clock control register for all QDSS clocks. when we vote the qdss clock, the aoss_qmp driver will send a message to AOSS to enable the clock control register, then the clock control register will enable all QDSS clocks.
>>>>
>>>> The QDSS clock is not a single clock source, it is a term that representing all the clock sources utilized by the QDSS.
>>>
>>> What I'm trying to ask is, is there any way we could enable that
>>> clock from Linux? Can the camera hw turn these on? Maybe we could
>>> trick it into enabling them?
>>
>> There is a power issue if we keep the debug clock on with a long time.
>>
>> We had a discussion with AOP to check if possible to add the debug clock of titan to the QDSS clock list, but they need time to evaluate it.
> 
> Changing the firmware is a band-aid solution, as the update will never
> reach millions of devices on the market. I'm curious in whether there's
> any way (or os-accessible debug register) to manage the necessary clocks
> from Linux, as a workaround.
> 
>>  From Coresight view, what we can do by now is disable it in DT to prevent the unexpected NoC error.
> 
> How about something like this:

Thanks for the suggestion. It makes sense for me and much better than 
current version.

I will send a new version to fix it.

Thanks,
Jie

> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> index bb8b6c3ebd03..fc2ab750f2cd 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> @@ -2461,6 +2461,9 @@ cti@6c13000 {
>   
>                          clocks = <&aoss_qmp>;
>                          clock-names = "apb_pclk";
> +
> +                       /* Not all required clocks can be enabled from the OS */
> +                       status = "fail";
>                  };
>   
>                  cti@6c20000 {
> 
> Konrad


