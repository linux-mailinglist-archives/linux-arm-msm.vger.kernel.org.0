Return-Path: <linux-arm-msm+bounces-52391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8C5A6E3BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 20:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A68CC188CB64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 19:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1099F19DF41;
	Mon, 24 Mar 2025 19:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GT3qJCzT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FD419E994
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742845225; cv=none; b=fHHahcydSjTHVpQ5X3eZfqCMaq978PDERGjjqXBpWdvOkd6u5ZdBOAlmnriHzAB2AOJDCPSpv+nPquUrVogT8HI3oY6UNHvfybxpRvgUmvg1wND8AtOW5xP+aYzdpKs38ti7FBPAF/63xZXI8h6YB8PxBYv6/2S8KjokR7HchUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742845225; c=relaxed/simple;
	bh=xi7LbnLQ4rKZkjcEyFAQuz8M/UMzMxoB558+VusoweQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rBiZvX0cuVow8kKZAyKpQV3x4lUvzHLyy8+9t7Ljq3G/YGA3G5GsqVnbY2y/u3dMsTCg/TNR8a9opWV5+Q3P9H4g9ONbC9MJQmn5X9lWsCQgU9klbHPSin1ZXbDxatOCwUxyw4o0TBWx4CQmvY88r+8eVvaE9uVk7ZderWFeuoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GT3qJCzT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52OIIlYd030645
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 19:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SXkQDm5kLEwRx/9skftTv0348QA9ONLJ31YS8DxZVvM=; b=GT3qJCzTmLqmm0bj
	uJsjLBe2dbGCV9zX2nagOBGDEapytOchxqjstr1CoyO+0cZ7CxkebFlp4jz+qWYY
	yi50H2x5ZJ0CghHV5WJFaOoN11J+Asqc1B8LkQWdKyeLFZxUe7rU3GF0sqYF4jAE
	LyTO939T7GRLCk4L99nVbwUm9Twh/n4EdDQ4Aqx/PyWYNa/0wTdkSIoZyX49HDlI
	BSjvhW7vl8V5fIqRSwK03LYe3Jebm0ufKfpcediLIw8a0ToXwImW3qYCGvKMRWjM
	up3F3qSpI3gpfqmrkXifU9koVpdXStVOC1Rnfpzk2Yrbr0HQEfG2g5F/sLF/wOCk
	nBvt3A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hpgbdcv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 19:40:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ece15fd50fso4190786d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 12:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742845221; x=1743450021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SXkQDm5kLEwRx/9skftTv0348QA9ONLJ31YS8DxZVvM=;
        b=TfeNE9MReSj/y+4I9IMvobTlFUq/Wx/z3Tjb3njxpbpw4sMlkhwzFxGgR5rdHexzdy
         6OdFnieAh6qg6jRUdY3AAr46Q/IqK95KvpR8MApODkUE8nBqlcutwDtNRdm4EqX6TO1w
         /F4be2rcHpJZsDQENtT0HNEnOBIvpVwEw44II5UGlWPYLuP6lig+fvxSNx0PsOdV+Bys
         oR8taZhhwocaD3v/2agJ3UF+NixaIKLNjHEmIo74ma/l8NPUoJgVIABxXSPM0ALBI7xO
         UdBk9Lsc+LZKnHP/zKbxqFwHzXBI8GiuRb/KnVgYWQHNWhDJK8n3Q5d/OXgIgomopbeH
         Gl5A==
X-Forwarded-Encrypted: i=1; AJvYcCXwHCXhJja8jr+zR9LwipzHoKdCgJIFOFcxFQHJ78pi202lyL108voMTbXg3P7LGbK6CamCz4zTlWv4Z4lR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6T4X2joragZmKTQCZ7Z+cEpz/Zno31C9QzBzrDoUNbg3rxmLM
	D3x1k23R4YmrwFwfNC5IHUq81zd97EJ7/qXH0/u6zjUneRnBSwJJtB/s7CDUf1g8/sBnFlmAczr
	MzeqO5OIvfkQMQ4gSTb3LsI+f5htLhzdUyMFgyK5WbMkpqqvF6KkVa1BSbsyv9pw8
X-Gm-Gg: ASbGncsToXxZuBrs+LZZJgrVprkpOsZTEHJVXwrGOa17CkeZWm+8ezCy3XKeUV3kp0O
	M8NUpy6sGR7bOhHEWgx8mDC3PykzVrIKNwGfdBP2vX01ni8bpz8vjKN0R70T3sY5j8wK/jtCOJO
	VJOf2Dz9QlifHGw0yKDO0nMCeuRzxui3c88sEhgPTemBigtQ41ZS9exic6CCi29IIcyAMghSJrc
	IfjfBbrjnnS1ZLawROMiXH8FYl6CeWK1UeQnCR3QUhP08uHCtg5whrQ7u4CQ/+FhTU8+geEJ+7C
	J6xa4BrPHKgwhpY8T8O5PzgiCp6o+am5qpoCFSSRdi8S9L+6c5l2OEpPVPmHwPLui6hkWw==
X-Received: by 2002:a05:6214:d46:b0:6e8:9f7e:8116 with SMTP id 6a1803df08f44-6ed0c13c39fmr1497246d6.5.1742845221022;
        Mon, 24 Mar 2025 12:40:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFQUXqX98PoTYrIeAXqtc65qYw2xYP7aqUrMBdk906XfKx3SNLE/xosilvypduLiXYKvY6Tg==
X-Received: by 2002:a05:6214:d46:b0:6e8:9f7e:8116 with SMTP id 6a1803df08f44-6ed0c13c39fmr1496986d6.5.1742845220449;
        Mon, 24 Mar 2025 12:40:20 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccf879casm6659504a12.27.2025.03.24.12.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 12:40:20 -0700 (PDT)
Message-ID: <5b7bb606-c763-4243-808e-5a1dd2f5b17e@oss.qualcomm.com>
Date: Mon, 24 Mar 2025 20:40:16 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: ipq5018: Add PCIe related nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Praveenkumar I <quic_ipkumar@quicinc.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        20250317100029.881286-2-quic_varada@quicinc.com,
        Sricharan R <quic_srichara@quicinc.com>
References: <20250321-ipq5018-pcie-v6-0-b7d659a76205@outlook.com>
 <20250321-ipq5018-pcie-v6-5-b7d659a76205@outlook.com>
 <a4n3w62bg6x2iux4z7enu3po56hr5pcavjfmvtzdcwv2w4ptrr@ssvfdrltfg5y>
 <6fa2bd30-762b-4a3a-b94f-8798c027764a@quicinc.com>
 <ys56uezoe7uuhsvtejnptjuluvphpidg5tzx2d4x3bi6pan7aa@en3rx3llns5s>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ys56uezoe7uuhsvtejnptjuluvphpidg5tzx2d4x3bi6pan7aa@en3rx3llns5s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BoydwZX5 c=1 sm=1 tr=0 ts=67e1b526 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=UqCG9HQmAAAA:8 a=KKAkSRfTAAAA:8 a=Hb4tMjJCnwUsYDbdA0gA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: JXV8zhEhh4-2KcnZqlbeXyUk_Fq6pZcz
X-Proofpoint-ORIG-GUID: JXV8zhEhh4-2KcnZqlbeXyUk_Fq6pZcz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_06,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240140

On 3/24/25 12:36 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 24, 2025 at 04:48:34PM +0530, Praveenkumar I wrote:
>>
>>
>> On 3/24/2025 1:26 PM, Manivannan Sadhasivam wrote:
>>> On Fri, Mar 21, 2025 at 04:14:43PM +0400, George Moussalem via B4 Relay wrote:
>>>> From: Nitheesh Sekar<quic_nsekar@quicinc.com>
>>>>
>>>> Add phy and controller nodes for a 2-lane Gen2 and
>>> Controller is Gen 3 capable but you are limiting it to Gen 2.
>>>
>>>> a 1-lane Gen2 PCIe bus. IPQ5018 has 8 MSI SPI interrupts and
>>>> one global interrupt.
>>>>
>>>> Signed-off-by: Nitheesh Sekar<quic_nsekar@quicinc.com>
>>>> Signed-off-by: Sricharan R<quic_srichara@quicinc.com>
>>>> Signed-off-by: George Moussalem<george.moussalem@outlook.com>
>>> One comment below. With that addressed,
>>>
>>> Reviewed-by: Manivannan Sadhasivam<manivannan.sadhasivam@linaro.org>
>>>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/ipq5018.dtsi | 234 +++++++++++++++++++++++++++++++++-
>>>>   1 file changed, 232 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>>> index 8914f2ef0bc4..d08034b57e80 100644
>>>> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
>>>> @@ -147,6 +147,40 @@ usbphy0: phy@5b000 {
>>>>   			status = "disabled";
>>>>   		};
>>>> +		pcie1_phy: phy@7e000{
>>>> +			compatible = "qcom,ipq5018-uniphy-pcie-phy";
>>>> +			reg = <0x0007e000 0x800>;
>>>> +
>>>> +			clocks = <&gcc GCC_PCIE1_PIPE_CLK>;
>>>> +
>>>> +			resets = <&gcc GCC_PCIE1_PHY_BCR>,
>>>> +				 <&gcc GCC_PCIE1PHY_PHY_BCR>;
>>>> +
>>>> +			#clock-cells = <0>;
>>>> +			#phy-cells = <0>;
>>>> +
>>>> +			num-lanes = <1>;
>>>> +
>>>> +			status = "disabled";
>>>> +		};
>>>> +
>>>> +		pcie0_phy: phy@86000{
>>>> +			compatible = "qcom,ipq5018-uniphy-pcie-phy";
>>>> +			reg = <0x00086000 0x800>;
>>>> +
>>>> +			clocks = <&gcc GCC_PCIE0_PIPE_CLK>;
>>>> +
>>>> +			resets = <&gcc GCC_PCIE0_PHY_BCR>,
>>>> +				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
>>>> +
>>>> +			#clock-cells = <0>;
>>>> +			#phy-cells = <0>;
>>>> +
>>>> +			num-lanes = <2>;
>>>> +
>>>> +			status = "disabled";
>>>> +		};
>>>> +
>>>>   		tlmm: pinctrl@1000000 {
>>>>   			compatible = "qcom,ipq5018-tlmm";
>>>>   			reg = <0x01000000 0x300000>;
>>>> @@ -170,8 +204,8 @@ gcc: clock-controller@1800000 {
>>>>   			reg = <0x01800000 0x80000>;
>>>>   			clocks = <&xo_board_clk>,
>>>>   				 <&sleep_clk>,
>>>> -				 <0>,
>>>> -				 <0>,
>>>> +				 <&pcie0_phy>,
>>>> +				 <&pcie1_phy>,
>>>>   				 <0>,
>>>>   				 <0>,
>>>>   				 <0>,
>>>> @@ -387,6 +421,202 @@ frame@b128000 {
>>>>   				status = "disabled";
>>>>   			};
>>>>   		};
>>>> +
>>>> +		pcie1: pcie@80000000 {
>>>> +			compatible = "qcom,pcie-ipq5018";
>>>> +			reg = <0x80000000 0xf1d>,
>>>> +			      <0x80000f20 0xa8>,
>>>> +			      <0x80001000 0x1000>,
>>>> +			      <0x00078000 0x3000>,
>>>> +			      <0x80100000 0x1000>,
>>>> +			      <0x0007b000 0x1000>;
>>>> +			reg-names = "dbi",
>>>> +				    "elbi",
>>>> +				    "atu",
>>>> +				    "parf",
>>>> +				    "config",
>>>> +				    "mhi";
>>>> +			device_type = "pci";
>>>> +			linux,pci-domain = <0>;
>>>> +			bus-range = <0x00 0xff>;
>>>> +			num-lanes = <1>;
>>>> +			max-link-speed = <2>;
>>> This still needs some justification. If Qcom folks didn't reply, atleast move
>>> this to board dts with a comment saying that the link is not coming up with
>>> Gen3.
>>>
>>> - Mani
>> The IPQ5018 PCIe controller can support Gen3, but the PCIe phy is limited
>> Gen2 and does not supported Gen3.
>> Hence, it is restricted using the DTSI property.
> 
> Ideally this needs to be negotiated between the PCIe host and PHY
> drivers.

Would it not fall back automatically?

In any case, I'm fine with this, so long as there's a comment above it

Konrad

