Return-Path: <linux-arm-msm+bounces-36473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D82BA9B6B5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 18:53:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DDC62824CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 17:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED9D19CC14;
	Wed, 30 Oct 2024 17:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IvOfUXPN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100491BD9DD;
	Wed, 30 Oct 2024 17:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730310779; cv=none; b=aj8eaOputKQtxwZeHB0GgIUnBf3cxG66DCJX5G7dTu3OO8zha7L0t1xLM4Ax29QLJfE2JDdJM0rjbV4Ltesx8kkj7Sbf575MSnAEnp7O68CV6qbaEmxWwBfJJ8UqVqgNIVvgl9AkC6OyTDA3U6u2QTkStP43m0vBPu+ugKw72/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730310779; c=relaxed/simple;
	bh=wpy2zs+vyKoPzcsJP8EV44v4Vm34XzUjqdBgP7ZPjvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DlveRMwfkErZ/xREsdsgyaKt39PmjgnyrJITI+R+khsba+FL3nonUcif+gUN+gtvRJmuTubcsAqk2HqPE4m1ZFyJz5OsNQF3bSMWmFN4HvEb2/43QRaHdUJ+xdzQxRjyR3rSSXwvAoNiD80NiHM0NMEe2pd7SX70stbxzMqdfbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IvOfUXPN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UCHO4Y020417;
	Wed, 30 Oct 2024 17:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k7vaGGF0ZQrdZ7T28DJe6eUEwES7PAilGNP9n7e2Pvk=; b=IvOfUXPNyWHiHEmk
	F0hhAOVfy3G2/LgOBHDctw0mdpH/FNyr57DmUrHHTD+6NaHJadBy8cUNjgs44lKi
	h4UdXa4LYRggh9khKx+tWRkLzsL2nA/b8an7AsrqNraHr724gU0mpdIkT6UB87JR
	ECaMGRdnAHcd4v2g8sTJX9sTn4CZNLPCXrp1dTQuFfpKbEndLMq7KdpHgsflMQ/S
	4QaS4PmU0xiIsHqJQsXodV9dxR8i4i5HMevXh5tOzSAN++iDzP1CJktKxvHzrQ88
	PCPJNaEP2ArTV3ukGGetEkYN3bz6MUqJm8q7F7gNoXJGyv3cLgqgle07CoMPo9IH
	zHO+Dw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kmp0gxta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 17:52:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UHqGi1015906
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 17:52:16 GMT
Received: from [10.216.35.255] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 10:52:11 -0700
Message-ID: <b1e9f8ce-b8cb-40a8-a69f-9433073922f3@quicinc.com>
Date: Wed, 30 Oct 2024 23:22:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] clk: qcom: clk-alpha-pll: Add support for dynamic
 update for slewing PLLs
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>,
        Abhishek Sahu <absahu@codeaurora.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        "Stephen Boyd" <sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-2-4cfb96d779ae@quicinc.com>
 <f78c5fce-4d7e-429b-945a-8e62cb9a2350@wanadoo.fr>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <f78c5fce-4d7e-429b-945a-8e62cb9a2350@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2NVBuc5c9uwG282KIp6GcXxW4_gTJ8KA
X-Proofpoint-ORIG-GUID: 2NVBuc5c9uwG282KIp6GcXxW4_gTJ8KA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 clxscore=1011 phishscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300140



On 10/19/2024 1:50 AM, Christophe JAILLET wrote:
>> +
>> +static int clk_alpha_pll_slew_update(struct clk_alpha_pll *pll)
>> +{
>> +    int ret = 0;
> 
> Nitpick: unneeded initialisation
> 

Will fix in the next patch.

>> +    u32 val;
>> +
>> +    regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_UPDATE, 
>> PLL_UPDATE);
>> +    regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
>> +
>> +    ret = wait_for_pll_update(pll);
>> +    if (ret)
>> +        return ret;
>> +    /*
>> +     * Hardware programming mandates a wait of at least 570ns before 
>> polling the LOCK
>> +     * detect bit. Have a delay of 1us just to be safe.
>> +     */
>> +    mb();
>> +    udelay(1);
>> +
>> +    return wait_for_pll_enable_lock(pll);
>> +}
> 
> ...
> 
>> +static int clk_alpha_pll_slew_enable(struct clk_hw *hw)
>> +{
>> +    int rc;
>> +
>> +    rc = clk_alpha_pll_calibrate(hw);
>> +    if (rc)
>> +        return rc;
>> +
>> +    rc = clk_alpha_pll_enable(hw);
>> +
>> +    return rc;
> 
> Nitpick: return clk_alpha_pll_enable(hw);

Will fix in the next patch.

-- 
Thanks & Regards,
Taniya Das.

