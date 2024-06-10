Return-Path: <linux-arm-msm+bounces-22179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE00901F1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 12:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 594CE1F239AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 10:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5901D78286;
	Mon, 10 Jun 2024 10:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cOeZP9Wl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAA928EA;
	Mon, 10 Jun 2024 10:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718014773; cv=none; b=cPe733k4aLkdIUvCiIzXeeYeLYAPgc1+xlPLF+2WDqxSoaF5AxaD6g2TMy2DrUEw7cUzn0iXLGwSOPNOHZq+3s91aSri/cuyyYi9CofF2BpF5EOonNuTw7uk5UF5qcsior1hJp4QCQ9pQ/ZLG28sICr15KrYuJvvXD3rihgI5CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718014773; c=relaxed/simple;
	bh=oO2YmJMXj3A+49hdNWVklQm3eKkfZg9EkXp+2vd116w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bG7DlCM6r8Kh+bcpkxDvIpjZWRBCByGeLROI0JH0tFV8rjg1aIDFyn6AbtEghdMZx0hlXQgIJjEnLgBdT0vDGcAiSi+kak54qVNYJVs39nYJ6mpWlz80hhc0UuwrIYFgh47wCVp/hjkkT8x9n8VXlNlX1kCKam568HQLIeNU9fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cOeZP9Wl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A0pj2X024513;
	Mon, 10 Jun 2024 10:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pa9odVGxJih84B9SRyuNV2/D3RGNj+Ah4P2b6NAAMqI=; b=cOeZP9WleJlbWzIQ
	ZxABGRmShNWU+FMo0XhcMS7nwD+6uNt560YHJJM7DNu+br6upJmnrmfofzhePln5
	GT8kwgiUdDb/QUNFkNmC3K9rOQq9wjgkNDWaXqmPBdmunEavTOWTEyCnd7rynMX4
	VlTrrHNAWOTq4rtalVJSEyDfvhamnSTGPqxyuOfNpc4QNK8zUKY8ghWodWsxWDrA
	NKBQuVcSve6TCC7GXyiwsteD+V1pU7+/phYUvR/R2JPpYBRoBOKYNal5DJXZk7lq
	T9zCsmr43oqdx6O3Bu01hgCEHBva809Id8PO5C8etr2oEz9K5gKuWEkZurdE+Bi9
	3TXt8A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymfh33n2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 10:19:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45AAJQlX008521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 10:19:26 GMT
Received: from [10.218.0.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 03:19:22 -0700
Message-ID: <2800ce74-44ea-444b-b00f-e07bbfdd4415@quicinc.com>
Date: Mon, 10 Jun 2024 15:49:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: lpassaudiocc-sc7280: Add support for LPASS
 resets for QCM6490
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <quic_jkona@quicinc.com>, <quic_imrashai@quicinc.com>,
        <devicetree@vger.kernel.org>
References: <20240531102252.26061-1-quic_tdas@quicinc.com>
 <20240531102252.26061-3-quic_tdas@quicinc.com>
 <6aad6a71-dd2f-4682-91ea-835357342ba1@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <6aad6a71-dd2f-4682-91ea-835357342ba1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ig7mJrryaM8ger02Lvq3AXU-ikT-yrP7
X-Proofpoint-GUID: ig7mJrryaM8ger02Lvq3AXU-ikT-yrP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 mlxscore=0 mlxlogscore=787 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100077



On 6/7/2024 3:00 PM, Konrad Dybcio wrote:
> On 31.05.2024 12:22 PM, Taniya Das wrote:
>> On the QCM6490 boards the LPASS firmware controls the complete clock
>> controller functionalities. But the LPASS resets are required to be
>> controlled from the high level OS. The Audio SW driver should be able to
>> assert/deassert the audio resets as required. Thus in clock driver add
>> support for the same.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
> 
> Please stop ignoring my comments without responding.
> 
> https://lore.kernel.org/all/c1d07eff-4832-47d9-8598-aa6709b465ff@linaro.org/
> 

Sorry about that, it was not intentional. I had posted the v2 and 
decided to split as it was delaying the other changes in the older 
series which had more functional fixes.


Picking your comments from the old series.

---------------------------------
 > -	clk_zonda_pll_configure(&lpass_audio_cc_pll, regmap, 
&lpass_audio_cc_pll_config);
 > +	if (!of_property_read_bool(pdev->dev.of_node, "qcom,adsp-skip-pll")) {

Big no-no.
--------------------------------

Yes, I have already moved away from it and introduced a new probe to 
support the subset of functionality on QCM6490.


------------------------
 > +		/* PLL settings */
 > +		regmap_write(regmap, 0x4, 0x3b);
 > +		regmap_write(regmap, 0x8, 0xff05);

Model these properly and use the abstracted clock (re)configuration 
functions.
Add the unreachable clocks to `protected-clocks = <>` and make sure that the
aforementioned configure calls check if the PLL was really registered.
---------------------------

These were made for alignment of code, but existing approach was not 
touched.

---------------------

 > +	lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc_reset";

Ugh.. are these really not contiguous, or were the register ranges 
misrepresented from
the start?

 > +	lpass_audio_cc_sc7280_regmap_config.max_register = 0xc8;

Provide the real size of the block in .max_register instead, unconditionally
-----------------

This had a little history behind this approach. During the driver 
development the ask was to avoid duplicating same descriptors and update 
runtime what is possible. That is the reason to update it runtime. The 
max register size is 0xC8 for resets functionality usage for High level OS.

Hope I was able to clarify your queries.


> Konrad
> 

-- 
Thanks & Regards,
Taniya Das.

