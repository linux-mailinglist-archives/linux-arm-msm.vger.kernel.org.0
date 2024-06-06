Return-Path: <linux-arm-msm+bounces-21851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CE58FDE80
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 08:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 596521C23A09
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 06:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD4D3CF73;
	Thu,  6 Jun 2024 06:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="czKuIsd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1582576B;
	Thu,  6 Jun 2024 06:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717654300; cv=none; b=eKdxnH+umdLcdb9e/UuOlsTIA3tU1Lx/3aS5KG996ruJxgTaSf6S7lNB2T9EZrpDOhGKLdyGXxeE93+ZX3922YdS9aHwVIQSVxJ6EwE9F2Qw1kyRqlibzJVFzVg4yfgmDiR8lFgG4Is3pSPaXMvzSNdLWKGNVrWjOoB2OSi+9aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717654300; c=relaxed/simple;
	bh=8t8GqrE9igKsHXbHUsO0YQpu7quqdO/sjnwgir25+xo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qM3Dzi8OO69rqSytMV9CF5EKTKx+RHnPJqyVrBOGOPMBB218WAaXCDZUJOXpqx/2wa2ADcp0bC2gzDq51Sr0JIL8T5ooun/9cScbMBA6LuEaq+v6xMHgbewHJkG4hV3n3llJ94qziER3Yd0bb4ttcsOq3YMx7/dfLP3aWX+togI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=czKuIsd0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455I2jeO013971;
	Thu, 6 Jun 2024 06:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6AsnmxVVbU7WdXutARzYu6ckxAXWOB5d2hWAzut8hks=; b=czKuIsd0XPdhj8mx
	P590rci7xVbofX2F7fEg7DErp47934vA6mTvUHgiT/fAqUaNXcmOM466IrDqcpWL
	cCD17/7GJa+C/9e2RGXTuy0+OnW5GAopA8SH3S3GGgYcf9L8WVvtoSeBLgwyiNUq
	/qVZ4Ur+iCeGu1TsgFosysyQsesdFkuLZ8cP3OrZxjh/FHtAhT294xVFUPIivTUh
	db7pRMVkXvBIAMet4tjLE0NQLYOBP4LSS1fBSkXc2SCKaUsrlA+57SOZxvxdzvcy
	cVLbIYF5KZp/CgDNQKrtzrXFHMLXkif4Ar1YtWAk6mZkHvHLlp9+xxNrXc8gQth0
	LFsGHA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjvxy97my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 06:11:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4566BSP6004623
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 06:11:28 GMT
Received: from [10.218.10.146] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Jun 2024
 23:11:22 -0700
Message-ID: <664cca91-8615-d3f6-7525-15b9b6725cce@quicinc.com>
Date: Thu, 6 Jun 2024 11:41:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V3 7/8] clk: qcom: Add GPUCC driver support for SM4450
To: Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
References: <20240528114254.3147988-1-quic_ajipan@quicinc.com>
 <20240528114254.3147988-8-quic_ajipan@quicinc.com>
 <ssnyujhgz64mbxawb43okjkdidd3tbxwjob36ikgbogy64xuqv@ckvir5vfqo63>
 <63d35ddacc113598f1822486b882552a.sboyd@kernel.org>
Content-Language: en-US
From: Ajit Pandey <quic_ajipan@quicinc.com>
In-Reply-To: <63d35ddacc113598f1822486b882552a.sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oz3MYEvDsO1nCe3XwPLEHzl9WDMbYrKr
X-Proofpoint-GUID: oz3MYEvDsO1nCe3XwPLEHzl9WDMbYrKr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=958 impostorscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060044



On 5/30/2024 1:18 AM, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2024-05-28 06:23:27)
>> On Tue, May 28, 2024 at 05:12:53PM +0530, Ajit Pandey wrote:
>>> Add Graphics Clock Controller (GPUCC) support for SM4450 platform.
>>>
>>> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
>>> ---
>>>   drivers/clk/qcom/Kconfig        |   9 +
>>>   drivers/clk/qcom/Makefile       |   1 +
>>>   drivers/clk/qcom/gpucc-sm4450.c | 805 ++++++++++++++++++++++++++++++++
>>>   3 files changed, 815 insertions(+)
>>>   create mode 100644 drivers/clk/qcom/gpucc-sm4450.c
>>
>> [trimmed]
>>
>>> +
>>> +     /* Keep some clocks always enabled */
>>> +     qcom_branch_set_clk_en(regmap, 0x93a4); /* GPU_CC_CB_CLK */
>>> +     qcom_branch_set_clk_en(regmap, 0x9004); /* GPU_CC_CXO_AON_CLK */
>>> +     qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
>>
>> I pinged Stephen regarding these clocks. LGTM otherwise.
>>
> 
> Looks OK to me. I assume that these clks don't get turned off when the
> GPU power domain is turned off. If that's the case then presumably we
> would need to turn these on and off during power transitions.

Yes, these clocks will not get turned off with GPU power domain 
transitions hence explicit on and off isn't required.

-- 
Thanks, and Regards
Ajit

