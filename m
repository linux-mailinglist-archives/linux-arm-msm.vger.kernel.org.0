Return-Path: <linux-arm-msm+bounces-75315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00799BA3E33
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 15:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEAF23AEF35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5065D27EFEF;
	Fri, 26 Sep 2025 13:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QLPBysvb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDDD270EBB
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758893252; cv=none; b=mudhb2luAmSZpO7alvxb7NcpXuYCRxw24DIQrHuffJ1+AS9EU9jUO7NLcMF5cwr1nrLcd6knnOVydurMynUWaReQSxTXEUN9TfWZPRADvgv3Mn7y7Q5+mzjJ+NA9pr4o9dGgbCVuTda56bLMBps9W6Zw1O0ud3LZobJVZTuoCPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758893252; c=relaxed/simple;
	bh=MClL6ZOoCXuxx1RDtmqkqa6SczgkMum98AA3U884PbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WnneK/ZhSP/EoIxkZliWLwm6tnRXHo66jz3N4OBZTfVBtPOT8rMnYji8/X6sMxuUD2QgN6Tra9w1EzVRIrU3dgRCcivhWdgIdo2RD1Hi9FpdCti+GTTwJXQeuEry90nePG4tA/tgJrZnUHRhr5JBp8D7E2JkKg1h2lpoQR8Um0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QLPBysvb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QBa8Po001360
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t8/ksjeEymK8HBnfUn37iS94Fkf2ZpcygrXIiyllIqg=; b=QLPBysvbkIh6XVAG
	1e9ABxb/Z/SgKaLC/DtdqOZdp7TmINkuhqAGhKINOdLy8fIgUBtc6V64uLFweBop
	QsdZW/rJ7lUdVaFftl9VksxEzoGIX17yG+AUCI9ng4HkWn/rwl49oHdyw/L+NoA5
	4GHzrBy/uH3FERLDvCOSR9lhJsVgumHx1y3jaujTSKkhCNJyZiQWEKBau/WEIN7d
	oi13XKKbGnk203whalEDx19Vl1K7xzkI+t9U2gYjFKcLsHAU8NkANAoGl8tNXDVK
	pemVK2yayROUNRkcenAdAWpJpDBZJXhcXCOtQIuYXLcjvMcI26faNEzabJrDyY5w
	SSVklA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49dt3g88ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:27:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-853f011da26so76274085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 06:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758893249; x=1759498049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t8/ksjeEymK8HBnfUn37iS94Fkf2ZpcygrXIiyllIqg=;
        b=m0kSSAaVAUhG9ra1q1kHyLelP0ptG/fBR0zAwVJ1rrEImee7mEZF7X9c0Ti0OO/bfS
         rJEvXOMWuDJOXvOfrzIuQEq9fRATjh7q94/HvAO2q2lfvAUCHlbrpH1td/3ADyVA7usG
         nIo1qgCX9Z+xpMZ5HjzG4plgTV8FJ19KrkZRwlX7Qewe3BvwFBu3Swjv3QkvHHfL075o
         zqxgiDBZl/Vz8OqClwPiCHOIpG0e5TaWsPAv52POIroUVMxlYEdX1eKUSkrJzvK23Ao+
         yYq/HpG5jsE2sO1g6Pc3N0IWSpbukcum0heLyczPS6UcR4GNkSAZMUM2Vt5QvxAA8186
         SVag==
X-Gm-Message-State: AOJu0YxDPj69qAZ47GJhsqny5r+5/mTEogLOHWi3t3acVpf7k6HRQmUN
	6Hf0VF8eJEtqvbqIKU1HWXws9hFaCkqzh/P2dod1c1ccDviRMcK5dQ8sBf8xToaou1kw0u/xcyF
	omEYPCOYgI06Wuw+BFngC1RjMrj+oFkcbaCy3DskhnXa/Csfb7asgt1iRivA6siTE+oDF
X-Gm-Gg: ASbGncv6UldgxD2iEwrxGk4z0xBGvTn1NqCJG+ktYT1+NEd/BC/DxYS6FAeuJYaswGO
	1GgRR4TVkm0srjDc+pSIzT5+aLCEAEe+2rA5NdyYMSTy4FwarzJz0UiJgM33ZD/sC/ShRQvC8u+
	xL2/DdEmyYbPYynh6WXzh6EI3izqMqWNcnXFzxlnzMvagMZy9/29IUfm5wa1iJZtHQqOoIYJjMg
	MW4pjhsa1z8641N0ygzH6Wk0byuWKgJhbyGNgnBO7mBfwLxxyojKoDmEuO2D+V1wT53nRz+SgF2
	AFCN9bW5Z197RInNWvYlt5uuWQ8X1VTIZZwyJyyHwxf+wq1g+juMxN7ZkSw0WtA5d1ZHSlgiCKl
	EXMa60TczUBIP+dddk/l/qw==
X-Received: by 2002:a05:620a:568c:b0:85b:27dd:84cc with SMTP id af79cd13be357-85b27eccea2mr478562585a.5.1758893248610;
        Fri, 26 Sep 2025 06:27:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFz0ZOL7APzcqCaK7Mg+0jgxlw42jENUTuNml2I098P+orgcmCXHakc2Xh3/amKGZ80bY+MQ==
X-Received: by 2002:a05:620a:568c:b0:85b:27dd:84cc with SMTP id af79cd13be357-85b27eccea2mr478558785a.5.1758893247939;
        Fri, 26 Sep 2025 06:27:27 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d1671sm374952666b.3.2025.09.26.06.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 06:27:27 -0700 (PDT)
Message-ID: <4d815ed8-18db-462b-80d9-9768b51a9788@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 15:27:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/14] arm64: dts: qcom: sm6350: add refgen regulator and
 use it for DSI
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250921-refgen-v1-0-9d93e64133ea@oss.qualcomm.com>
 <20250921-refgen-v1-9-9d93e64133ea@oss.qualcomm.com>
 <DCZZV93PMWRZ.1J9IZBZYP5RGM@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DCZZV93PMWRZ.1J9IZBZYP5RGM@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=df6NHHXe c=1 sm=1 tr=0 ts=68d694c1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=qxRITnKSTm-n5raOyfwA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Zl0_qgR0GIicTwPmYIS_NNeg5AKx-PKo
X-Proofpoint-GUID: Zl0_qgR0GIicTwPmYIS_NNeg5AKx-PKo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDEwNiBTYWx0ZWRfX0S7vETMQig/j
 jAhTK8a9cNjtC0uOKuaXhT7lNGipzqueiABW0lJqOjwl2yQ9IAciejdXeTO5NcmVKru/WsmtweX
 nGuQR1+Xua5CzeA1UwBOO/dxspzjx9BO3oJwU2Uvc9B63UEDox+Ml9LdKb5B7fNmGS5EJHyWEb2
 rFLFC+2Cal0n+VzVoCpQf//6E/89jsnrPm126HLAHc3Hwm+arxq9+q5bActHhHnZXhgMZoKxvmJ
 gJuk2QwQOtamhHt7ey+p49G6TGIs0WALjm7Bw+PQnWFEC5IjSGIP1dAy+GoELlcaOT8kZ/P7RpR
 o+lWtetpVPWuIOthKcw5mA/lnKTRUAy/sAeIVvqgDmTIoutXAs27owweWLQmFnIiGggYR8zP67i
 AoCknLXVjcRFZf+Dyjtv2eCGs6MDKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509260106

On 9/23/25 9:17 AM, Luca Weiss wrote:
> Hi Dmitry,
> 
> On Sun Sep 21, 2025 at 9:09 AM CEST, Dmitry Baryshkov wrote:
>> Add the refgen regulator block and use it for the DSI controller.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>> index 8459b27cacc72a4827a2e289e669163ad6250059..dd009569a6683a25f13b068e3e0bd8746b2ac501 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
>> @@ -1768,6 +1768,12 @@ usb_1_hsphy: phy@88e3000 {
>>  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
>>  		};
>>  
>> +		refgen: regulator@88e7000 {
>> +			compatible = "qcom,sm6350-refgen-regulator",
>> +				     "qcom,sm8250-refgen-regulator";
>> +			reg = <0x0 0x088e7000 0x0 0x84>;
> 
> Are you sure the size is 0x84? Downstream and hwio_bitra_V1.cmm would
> suggest size to be 0x60.
> 
> For sc7280, hwio_kodiak_E5.0.cmm does say 0x84 for refgen.

0x60

moreover, I see that there are two refgen regulators..

Konrad

