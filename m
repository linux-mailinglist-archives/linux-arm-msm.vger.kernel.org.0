Return-Path: <linux-arm-msm+bounces-62414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DCAAE7F5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 12:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D770D7B5EA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 10:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CBF29B23C;
	Wed, 25 Jun 2025 10:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XzToSTZ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B6C234973;
	Wed, 25 Jun 2025 10:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847522; cv=none; b=WFM7kfL9uVKvu6liSIXvp0LTkvKfANncNwvokXBjgQWQuOWCcGRxaiIs0Vih4X6UmXP2RmER0WCAVDVJkRku1QgJKeCu152N4uhgiehsjW5tGiJiil4aKcCe1/B1blnsLLuO+HYsDCegStWjkxo8o1iVB5D1tqzShQG0C0aunTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847522; c=relaxed/simple;
	bh=MVQyRP7ou3C9eiGaJ25M29N920io5Ky5/lKMuqm1vLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pK7DkKUo1u++jOutbIUwf01QF+nYlBam3zsOJNSZVJW76L0jBU7M6mWV3GPNy8iboCwkJJTFIwqXa4GeYFrG+Z9iYzT3FTvV4YDsu+48rsy0lyCm/Xmbed8a2Q2X1rJr8Uv1NEANjgoji3Kd8Kml5EyQDkHIOJFBlDd+y1TGs64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XzToSTZ0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5Uaie014612;
	Wed, 25 Jun 2025 10:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bqNfxhiVgtp6+b+dgaD2EKdBvt2O27n714u9pvQagvI=; b=XzToSTZ0KsbbIJtH
	RpNbVkpTzIIIb1YzfKdUbgPnLWnMBaLCaaVtDyUl+GnP2rx29vzWXTyGHLnS2h5Q
	vexLBZGPXICymQWLnnPPLU7GRHi7vFIcn6dmXSDsQ7U8SQKMlKHQbjrWz6YJhMsv
	RT9wcWroniGIrkgomUmbc/T6fRrH81Fc/OKVQHifYL4ITNrx05vKEEXKkmO27uxb
	H4ZoAucXMoo8k03wj8RcbIoH29Q9tNP+NQYXaJHwzZFgjQONRkLyF+ACrlbyg1HQ
	T+and0y93ENwubsYz3+mv2T3Ome4lsF9KsdGQBIl0lTi7cjiF85F07+3J705Bl+c
	tp08Lw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpys08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:31:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PAVo2x005987
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:31:50 GMT
Received: from [10.217.217.109] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Jun
 2025 03:31:44 -0700
Message-ID: <d2821ffe-32c4-4153-84fd-df4bc7d2b3e5@quicinc.com>
Date: Wed, 25 Jun 2025 16:01:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/10] clk: qcom: camcc-qcs615: Add QCS615 camera clock
 controller driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
 <20250612-qcs615-mm-v9-clock-controllers-v9-3-b34dc78d6e1b@quicinc.com>
 <b89c5809-38c3-4b62-b26f-073869674b95@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <b89c5809-38c3-4b62-b26f-073869674b95@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685bd017 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=G33nDIIeno827tu5fgsA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3OCBTYWx0ZWRfX+tZcl40zosdR
 ECvQ8R20nwv+WOy7ENtVN5lr/KaamnN6XC8t5gYQMBGk3Pzk8HZ6JBY0lBhvvfND3Xcg+DlnwB8
 n+FrAqhNQ+iB7PLOzk6/fkhe46A3rnO0LcOABsa0noQD3XUt9VGJukQrh9YqYUpCVYK2DAI8WyS
 rsPknSaUifiRcv32P/8sbuNogv85GG9d+ZRt1rMAysLysjmcwEpWuloGIFpA5hvfWltKHIiMoC6
 9MnSXK+8Fg9GSugoikOme82jOhZEdUEnSOH2CvWPkxcR/xjp04WJ6RkkV8IYhvmxDcmF/T/BsJf
 4qUE31Qc5BjGCrEe8a3n9LaHf/xdNgMbs/F1TCfTy7RsuggRJ44xtJxz2qpK5CJbRwU25YPLqfm
 suvMPeRqedn/t0NUdzQEnJhFN/KToufJb0nszJzXeLLqvLwClLb1RR24l0X0hhsOk+W2RBVU
X-Proofpoint-ORIG-GUID: aVU9lOVhjQEr9x5G9R3MQaOsCUQ8-jFN
X-Proofpoint-GUID: aVU9lOVhjQEr9x5G9R3MQaOsCUQ8-jFN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250078



On 6/15/2025 12:37 AM, Konrad Dybcio wrote:
> On 6/12/25 11:55 AM, Taniya Das wrote:
>> Add support for the camera clock controller for camera clients to
>> be able to request for camcc clocks on QCS615 platform.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
> 
> [...]
> 
>> +static int cam_cc_qcs615_probe(struct platform_device *pdev)
>> +{
>> +	struct regmap *regmap;
>> +
>> +	regmap = qcom_cc_map(pdev, &cam_cc_qcs615_desc);
>> +	if (IS_ERR(regmap))
>> +		return PTR_ERR(regmap);
>> +
>> +	clk_alpha_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
>> +	clk_alpha_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
>> +	clk_alpha_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
>> +	clk_alpha_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
> 
> Please convert to use Jagadeesh's recent helpers
> 

Yes, will update in the next patch.

> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
> 


