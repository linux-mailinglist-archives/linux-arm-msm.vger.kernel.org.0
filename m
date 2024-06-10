Return-Path: <linux-arm-msm+bounces-22163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F741901D94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 11:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7367D1C210D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 08:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BD87404F;
	Mon, 10 Jun 2024 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GDHCD/ie"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9381674048;
	Mon, 10 Jun 2024 08:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718009892; cv=none; b=ItaI67X0YtDXOqFmiC9rzXkryQ2dBnMTfQIgMqpsMR+8vtOAkt9jDKUp4En+fveSUZRYzmbBPUNAWJi3+UnH8Ji19SNIws2aoQnOUw1XyhKvW7PTq2Z6pwARTGcoBwirvbqDurfa/5UAtiHIlgjJMVb0svgIJx0Y80+bZTUmSfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718009892; c=relaxed/simple;
	bh=kCLgm/ob7tKIJpCCqdEArhf70gyowPRyHlr6YQKmgN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gUpQ2XGmifhsJGUIWx3TgVCSlEYWjx5HF+jt0dpNLDTKMvHm4omlX3SDSA2OxQXlriJ9V+NpdEsBvWeqEKAr0HJGcy8aJZQ9frdeQ902tbXg7+sZI6qgCtUjeJp8JDyA3XeF5iWK/imppMvpaAYOD4JNQZk1TsSQXF4wUYUT2Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GDHCD/ie; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A1QNT4011973;
	Mon, 10 Jun 2024 08:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRXb8CbQK9AsGPcEcK+89IETcDeKaP+c/nhkH2j229Y=; b=GDHCD/ieV4uEAfqY
	VlOr+LoNur9M6FDPbs/vQpMPmbOp2FNTvC+oN/8hqzynCm7h0FIJPD5Z5DmqIOCU
	pN7xia8ahr4KN7fiIfMl+CkfPmumiqSd6rdRGwGm31/axuzH2rVzTI7umkyTQElI
	fUBSmCLBu8zXR3/VjVvEUPkaGTw4NxASxB9vmwECnVmGbOarEAQ8QfxPq5NhZHv5
	8gzXLLh38vpa1JPn2MNdgyVBDbolgMnZs0927I0gWR1dtvMCEZ3IgoExZd76WwmA
	jEXXlV66VP0QEWCebtbbKMsocI/1YxkS82LuruNP6/NWIedWSTfB4DApNvqgwx2R
	pycXPQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymgk8u420-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 08:58:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45A8w5sW011138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 08:58:05 GMT
Received: from [10.218.0.85] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 01:58:01 -0700
Message-ID: <e6eb1eb3-1130-41ec-bae9-25dad6d22bdc@quicinc.com>
Date: Mon, 10 Jun 2024 14:27:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] clk: qcom: gcc-sa8775p: Update the GDSC wait_val
 fields and flags
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-3-quic_tdas@quicinc.com>
 <9163bc46-983f-4d5a-b009-c12ddd5a5c8a@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <9163bc46-983f-4d5a-b009-c12ddd5a5c8a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nVjpNyfzdLR8qCFhgpeB6KJb3I06h5JS
X-Proofpoint-ORIG-GUID: nVjpNyfzdLR8qCFhgpeB6KJb3I06h5JS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406100068

Hi Konrad,

Thanks for your review.

On 5/31/2024 6:52 PM, Konrad Dybcio wrote:
> On 31.05.2024 11:02 AM, Taniya Das wrote:
>> Update the GDSC wait_val fields as per the default hardware values as
>> otherwise they would lead to GDSC FSM state to be stuck and causing
>> failures to power on/off. Also add the GDSC flags as applicable and
>> add support to control PCIE GDSC's using collapse vote registers.
>>
>> Fixes: 08c51ceb12f7 ("clk: qcom: add the GCC driver for sa8775p")
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   drivers/clk/qcom/gcc-sa8775p.c | 40 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
>> index 7bb7aa3a7be5..71fa95f59a0a 100644
>> --- a/drivers/clk/qcom/gcc-sa8775p.c
>> +++ b/drivers/clk/qcom/gcc-sa8775p.c
>> @@ -4203,74 +4203,114 @@ static struct clk_branch gcc_video_axi1_clk = {
>>   
>>   static struct gdsc pcie_0_gdsc = {
>>   	.gdscr = 0xa9004,
>> +	.collapse_ctrl = 0x4b104,
>> +	.collapse_mask = BIT(0),
>> +	.en_rest_wait_val = 0x2,
>> +	.en_few_wait_val = 0x2,
>> +	.clk_dis_wait_val = 0xf,
>>   	.pd = {
>>   		.name = "pcie_0_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> +	.flags = VOTABLE | RETAIN_FF_ENABLE | POLL_CFG_GDSCR,
> 
> I have some old dt for this platform, and it doesn't mention the downstream
> counterpart flag for it (qcom,support-cfg-gdscr), so please double-check
> whether you really want to poll gdcsr + 0x4.
> 

Yes, the older code did not have the cfg-gdscr updated in the DT, but as 
per the latest discussions with design we have concluded to use the 
polling of GDSCR from the CFG register on all latest designs. We added 
the support in the latest DT as well to support for 
'qcom,support-cfg-gdscr'.

> The magic values I trust you have better sources for, the collapse off/masks
> look good.
> 

Yes, these are the Power-on Reset (PoR) values which the current GDSC 
driver overrides in gdsc_init(). The GDSC driver for older designs 
needed these overrides from SW, but the newer designs did not want to 
make any such changes.

> Konrad

-- 
Thanks & Regards,
Taniya Das.

