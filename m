Return-Path: <linux-arm-msm+bounces-62418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CE2AE7FB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 12:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 887A81C20C7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 10:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F10F29E105;
	Wed, 25 Jun 2025 10:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EgQNlkH2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA6E2877F5;
	Wed, 25 Jun 2025 10:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847921; cv=none; b=MhIvhbWEfkbdTf+u6EaMfsHu0sxhOdSU1C31EZ5MGmioVy0EYunx8NQkF84ultdtCIuA6Kt0bcAbFkqEqcu1m2NM+BWRyQV2iUvyqpNCfpgPKQ8E4D9gIlU7Bvx51A/j+zTajXqZhNQ3uFd6EOD/WsNFVhS34o5Q4kX1mW/UCns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847921; c=relaxed/simple;
	bh=BHIH2xnfg6MfSiBQC4N9Ry30SiQ5UwSkVTUBWgDdxSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZJ33OLZgIvs17WJsECP6LXNZbaCTvgOXmbw+e7I44iy2CHRc+gjXO+q0jtlVPbgU4sBq4EWTTrep0w3T7dvagDkS8PNIgemsHURgtNwECpjlGn8E1DyKRpH+AzaSyL+eFfUVV2+qIZRcqf4sjmxViqWB2T8/DduJ95mp4ePPayE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EgQNlkH2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P669Ct022985;
	Wed, 25 Jun 2025 10:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QXh663B64GL4OkzQVCeMKC+9kMeplcOr+dSF4BGsGvw=; b=EgQNlkH2bTLeb6fL
	b0na/tEllrDY+L7mK06fJFmmQ/7PiAQ3+KYNwy7eEEjOmzAwDVYYcfRP82JY/+8P
	WQewCoCAvHQQnwvlWluuagvfCV9tb+QlcIM5XOKt4mG3HcUCptINnx83FUApJusN
	9mvSiJ6bVOkSia2GltRc8b4yJ4WLgUCJmeXveOXr9YB6rlYItN89hR8jPTPjK5RB
	lGR5sPHygoMVCws4GlL8lSWj6pqTU0cmg3CLUrAGRRAF1nYgQmUi4OlcLv7ra5Zk
	9uiACsFH4G03DccqC1bVM2tIynqErZrXKVu/rrj+i945daUJQSB8dbVJ/8cZN+VG
	PQSCvQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgfjyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:38:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PAcTpT029099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:38:29 GMT
Received: from [10.217.217.109] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Jun
 2025 03:38:24 -0700
Message-ID: <b631c81c-50e9-429a-bca0-828d99076f3a@quicinc.com>
Date: Wed, 25 Jun 2025 16:08:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/10] clk: qcom: gpucc-qcs615: Add QCS615 graphics
 clock controller driver
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
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
 <20250612-qcs615-mm-v9-clock-controllers-v9-7-b34dc78d6e1b@quicinc.com>
 <75fea0f5-88ca-4099-ba48-997e46bf4de5@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <75fea0f5-88ca-4099-ba48-997e46bf4de5@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: j_y1SPe-6nBJhxdf0dbmSXZUwvqCZytd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3OSBTYWx0ZWRfXx8+CG4SjSGyo
 k1TdYB3Am8HL2UmZ4Asb6sf9O+mD4eWdXy574VxzioW6pKrG0hORWAdoScxjgc5YtXE4iZsR1Y9
 p4A6YbDfqi9NTaX7GRLuF/hAA5uqjfJE22dfhaMTClm1eM2yX8JyP2jOoINMS/OhEUzpEKpea/g
 38hYSaeEpPnYgi7G7eIyZu18FEBXhhIDg+mcR1SI47081Ej2udjgJRalLcgET/aGDY5+1cJuZSP
 CDVmTB7UC1GkE9qABywEtadzcdDhX7VMHEDfgZ1N1YoR6SJ2lplBJ99qGJ78KVCjL8+L0ukizS+
 QwnTRHJ/bzZYpi1515VdSlcP37DeurCzI4p+AKv1f++gFUvElna9zc/zddm7TQINJ8G3oCnJqpi
 BcSyjZnehin4qYSr32WR/z3MCGmXcul1EFu5YyHbIAdlbTxFXQtIbnoiIV9Jaoj8iTH8HY3L
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685bd1a6 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6G9fbBdXaqdFCPydoIcA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: j_y1SPe-6nBJhxdf0dbmSXZUwvqCZytd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250079



On 6/15/2025 12:49 AM, Konrad Dybcio wrote:
> On 6/12/25 11:55 AM, Taniya Das wrote:
>> Add support for the graphics clock controller for graphics clients to
>> be able to request for the clocks on QCS615 platform.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
> 
> [...]
> 
>> +struct clk_hw *gpu_cc_sm6150_hws[] = {
> 
> "wink"
> 

My bad.

> [...]
> 
>> +static void configure_crc(struct regmap *regmap)
>> +{
>> +	/* Recommended WAKEUP/SLEEP settings for the gpu_cc_cx_gmu_clk */
>> +	regmap_update_bits(regmap, gpu_cc_cx_gmu_clk.clkr.enable_reg, 0xff0, 0xff0);
>> +
>> +	/*
>> +	 * After POR, Clock Ramp Controller(CRC) will be in bypass mode.
>> +	 * Software needs to do the following operation to enable the CRC
>> +	 * for GFX3D clock and divide the input clock by div by 2.
>> +	 */
>> +	regmap_update_bits(regmap, 0x1028, 0x00015011, 0x00015011);
>> +	regmap_update_bits(regmap, 0x1024, 0x00800000, 0x00800000);
> 
> I'm going to assume this is not the same ramp controller as:
> 
> drivers/soc/qcom/ramp_controller.c
> 

This ramp controller is at the RCG level, which was very specific to
8976 and not same at the CC level.

> ..or maybe it is one, but we need to set things up on the CC
> side
> 
>> +}
>> +
>> +static int gpu_cc_qcs615_probe(struct platform_device *pdev)
>> +{
>> +	struct regmap *regmap;
>> +
>> +	regmap = qcom_cc_map(pdev, &gpu_cc_qcs615_desc);
>> +	if (IS_ERR(regmap))
>> +		return PTR_ERR(regmap);
>> +
>> +	clk_alpha_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
>> +	clk_alpha_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
>> +
>> +	/* Keep some clocks always enabled */
>> +	qcom_branch_set_clk_en(regmap, 0x1078); /* GPU_CC_AHB_CLK */
>> +
>> +	configure_crc(regmap);
> 
> Likewise, please rebase on Jagadeesh's series, which is now in
> linux-next. With that:
> 

I will fix them in the next patch series.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


