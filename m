Return-Path: <linux-arm-msm+bounces-52520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5072DA71591
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 12:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF855188972F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 11:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F461D7E54;
	Wed, 26 Mar 2025 11:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G+70spx3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DED786334;
	Wed, 26 Mar 2025 11:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742987857; cv=none; b=YZ+TErhQqbYx5rsSS+2ZH3iZDk+YAPtJCHBNgNiC6wacDvcelWg7ngkQ5QJc9nAMG0cBpSnEEVBQa3xJCfOmCMm2aBPFe2E+sv9a1rbJgVr7TA8hB+7MT7Hw8mYa/1ZsJFJ+KE7NJSF8u32CYN2EJvrAotVOsaNMBoUuzbmCVck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742987857; c=relaxed/simple;
	bh=SYQ6STxPtES09x40EhaD4RY+YCcpN4t4NvZt0NV8DsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UFKq/CU+I3qWxpF2scg+IrBMXC+p5CjDbFnsFtv7Ysinf7mrjZwo9J5bxcTPVIKnX9pjwNTG/082b4SUoE4cjRVAj71JuoxFbsPOvecVgfm+jXutauRFdAUhH1Tq7Fhjvsn7szL6FNq962uXWYNuJ9MNaiPmh/m4n9RTWcNMd18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G+70spx3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q73HFX024760;
	Wed, 26 Mar 2025 11:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VRvB5QYmwNmsc9sJz2cCF6fOR8fCvPSGWI55XmIU8fE=; b=G+70spx3RJyFFi7r
	eXjC6pHpZ83Y5LTjNBuQ3pRdO+U5Iljr/XaWD7fKWOZgPc+kaRKsleqa0LAYA3qM
	iIkoQIt4BIx1Z3pzVX13KK0TbSxgTf5ljak9tjB4Z0t8ZtASOoSImYzsBlUNqsfo
	r21+NMh7dqOs/8Wozq4PQaVjnx1JC1E5scA06PUIa6zHIoYIfYXiqqyeLsHSmBM5
	rmXa6KwdrcURsCi0DhhZrB9VkJdAhWY/tMSP6X7spQn7OG5qu0reFr0ujgY7vXBp
	qhouGJgGD97Rq6NyPLOd4XqfNiriKvPH8o57rFJ4LMRCHL/F1oSaTQ8KavPv1OWH
	rHz0Sg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd34qy9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 11:17:32 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52QBHVCj012832
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 11:17:31 GMT
Received: from [10.216.10.22] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Mar
 2025 04:17:28 -0700
Message-ID: <b28143c7-5980-4062-bf81-4ae9fd9b0258@quicinc.com>
Date: Wed, 26 Mar 2025 16:47:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] clk: qcom: Add support for Camera Clock Controller on
 QCS8300
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Dmitry Baryshkov
	<lumag@kernel.org>
References: <20250321-qcs8300-mm-patches-v5-1-9d751d7e49ef@quicinc.com>
 <7292158ac0cd6b944d9d1f01314d24b1@kernel.org>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <7292158ac0cd6b944d9d1f01314d24b1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DKRkXbju8wiXryKfj_C1teKKZsXutQRc
X-Proofpoint-ORIG-GUID: DKRkXbju8wiXryKfj_C1teKKZsXutQRc
X-Authority-Analysis: v=2.4 cv=P646hjAu c=1 sm=1 tr=0 ts=67e3e24c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VS-lLn47f0r1-IN3lE8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_03,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260069



On 3/25/2025 5:08 AM, Stephen Boyd wrote:
> Quoting Imran Shaik (2025-03-20 20:56:43)
>> diff --git a/drivers/clk/qcom/camcc-sa8775p.c b/drivers/clk/qcom/camcc-sa8775p.c
>> index 11bd2e234811..bd75f59d3ffe 100644
>> --- a/drivers/clk/qcom/camcc-sa8775p.c
>> +++ b/drivers/clk/qcom/camcc-sa8775p.c
>> @@ -1811,6 +1830,7 @@ static const struct qcom_cc_desc cam_cc_sa8775p_desc = {
>>  };
>>  
>>  static const struct of_device_id cam_cc_sa8775p_match_table[] = {
>> +       { .compatible = "qcom,qcs8300-camcc" },
>>         { .compatible = "qcom,sa8775p-camcc" },
>>         { }
>>  };
>> @@ -1841,10 +1861,83 @@ static int cam_cc_sa8775p_probe(struct platform_device *pdev)
>>         clk_lucid_evo_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
>>         clk_lucid_evo_pll_configure(&cam_cc_pll5, regmap, &cam_cc_pll5_config);
>>  
>> -       /* Keep some clocks always enabled */
>> -       qcom_branch_set_clk_en(regmap, 0x13194); /* CAM_CC_CAMNOC_XO_CLK */
>> -       qcom_branch_set_clk_en(regmap, 0x131ec); /* CAM_CC_GDSC_CLK */
>> -       qcom_branch_set_clk_en(regmap, 0x13208); /* CAM_CC_SLEEP_CLK */
>> +       if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcs8300-camcc")) {
> 
> Can we just use device_is_compatible() here? Then we're not specific to
> DT. Or better yet, use the device match data to signal this instead of
> checking compatible again, and possibly getting it wrong due to a typo
> somewhere.
> 

Thanks Stephen for your review.

Sure, I will use device_is_compatible() and post another series.

Regards,
Imran


