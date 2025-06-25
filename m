Return-Path: <linux-arm-msm+bounces-62417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D135AE7FA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 12:38:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A255E3B3E9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 10:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FC212BE7CF;
	Wed, 25 Jun 2025 10:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hakSl2lk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429A71EA7EC;
	Wed, 25 Jun 2025 10:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847843; cv=none; b=ZXq1KzZ4Iyjs0BQQBGjkQfFnQJPwtIGEl24CGTo81/4/F/IktMWAj7ECAlMxfCJ/ZZHdtaNivr7b7cSH6mcQgYJC9DJkJw1Ta0zZVEOqBGNODGGlVgO3sIA2gIIkP7X00q8T9wsHL/OJ8As8tzTX/iEH3t3XPHsH+pAa6DN0+W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847843; c=relaxed/simple;
	bh=0KEbB6f5VBwoO2sG26tjSrVS97uN4p3KOMtcGcwxfwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UwOYJ4RTCBp+NxGtZtMAit1HoggPfyLciZ7Igg+2Q3RSBAixTEyIuKqchyR6b9r0qcAAZlo4Xzkrk9WKCgmM1QTsOHV56FsiUgVrpnjbYoAihK5Bth8TG0evfa4OyaQScf+rSoxA1r/QDdFi4f0oAjOzi2duDIKdH8soOUhh8sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hakSl2lk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P40qYg021010;
	Wed, 25 Jun 2025 10:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TY0aRHBLdl0DmpqVjjZykDuD69OMabfh0VxTT1y+MDk=; b=hakSl2lkAgNh0Yv+
	EUij9HmpGjgnPcoYDkndFJao/bNoWTm57cWKWzot1FX819LJx+UYLxNm0pKvMzPO
	Zrj1nFQ+rL4YhzSH7TVowzLl50Fcz7zfHO6gobQ1TZD9N3rItGQWPwdZ+9HyyPhx
	uYXVqZBFg6np1kbwMgT5Mr7OmUNhHKtb221M+ajxQDecvu23RSw9Qdj8D3KM5gPo
	imiUPThdGe9NeBYtmi3pAC1NrYdwdifEsWDrsPIwvRz2mAEn8tQLAFHdSvY/7Nvc
	bJs0DyIcbOaUuukY95hk4N+POdEjdozKowQw+FQtiPBBvzIv46dt2hnq4d9bgZkY
	86ZP1Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwwu2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:37:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PAb7rD018872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:37:07 GMT
Received: from [10.217.217.109] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Jun
 2025 03:37:01 -0700
Message-ID: <8fd3b2fb-51d1-44dd-98d9-d7e01693fba9@quicinc.com>
Date: Wed, 25 Jun 2025 16:06:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/10] clk: qcom: dispcc-qcs615: Add QCS615 display
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
 <20250612-qcs615-mm-v9-clock-controllers-v9-5-b34dc78d6e1b@quicinc.com>
 <09c40216-c0a2-4698-83b6-b838c28eed84@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <09c40216-c0a2-4698-83b6-b838c28eed84@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: P2LSXj0nm9Daqaaa040_c9vmHzNIfNoN
X-Proofpoint-ORIG-GUID: P2LSXj0nm9Daqaaa040_c9vmHzNIfNoN
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685bd154 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6_WM4ebCss1HmxTYlEUA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3OSBTYWx0ZWRfXyqtzY9id0Qfg
 zxkSE1Jgl3+nCOOVo1G0VM84lELyx2JiPMUJhjCyRz/buy8dvqoUPFr3Hm8XMIksX3zI3gyj1qw
 y6n7BZ4WgMXs8keR4RObrrkcu7Q9uKnLCojCPVOazcZFlLwpFMT1fiCTHXD0bgA+hjPMSX/i56E
 eKGKXX8gI4RmBZWV5ErubwvmFvIRmhHZJP+IdWO6nH+VSVq4xf6tLQ0VTjVkCdTCFzs904RHsSj
 ipSC2DdMRWBIuDCBKZAo5QOf47a7DJjTAU6ve+iTI/wFsidMPRCIsq27vygmX/D7I8GI8tJEXyy
 WewvMqYX+pU8e6+QuC3jMaDPqlQPIYraqUGObKs4mTgOuLG3IDbDK9meTiyr0ufE3+rfeEUQa34
 /sdcoblK7GVIgiyyEg/j0Gv6o+/iDBMqcCjDitbutLm3TOPTN7Sw32LbGQ79H8Kk3r90vsBb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250079



On 6/15/2025 12:39 AM, Konrad Dybcio wrote:
> On 6/12/25 11:55 AM, Taniya Das wrote:
>> Add support for the display clock controller for display clients to
>> be able to request for the clocks on QCS615 platform.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
> 
>> +static int disp_cc_qcs615_probe(struct platform_device *pdev)
>> +{
>> +	struct regmap *regmap;
>> +
>> +	regmap = qcom_cc_map(pdev, &disp_cc_qcs615_desc);
>> +	if (IS_ERR(regmap))
>> +		return PTR_ERR(regmap);
>> +
>> +	clk_alpha_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
>> +
>> +	/* Keep some clocks always enabled */
>> +	qcom_branch_set_clk_en(regmap, 0x6054); /* DISP_CC_XO_CLK */
>> +
>> +	return qcom_cc_really_probe(&pdev->dev, &disp_cc_qcs615_desc, regmap);
> 
> Similarly:
> 

I will update in the next patch series.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad


