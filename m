Return-Path: <linux-arm-msm+bounces-39788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4D79DFB5B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 08:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63034B23286
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 07:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D4B1F942E;
	Mon,  2 Dec 2024 07:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aPgUE9S+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA84481A3;
	Mon,  2 Dec 2024 07:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733125069; cv=none; b=iaU44rQe6qOX/k9NjUV7/cODO0t04FJaa8cWWUVVaDd82xctE8WxU0RKetT75YdA0aWuHNzwRPT1CeYycBjnAOa6Bil/wO3295VC2Sa/LrjKeyo/SZHStcPJV7R8IPpYFqxnambZz9y9Z13gjLAVQEyrZZ+qbfeJ4+WqwTxKnXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733125069; c=relaxed/simple;
	bh=Zo/1lq4114fTgE1uOwAWvhggEIBZ35CCQbl00ZlgQkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CN6xz9R+/iUSz2S2j5ndElSCTZgLKJkCVyRXez2VJNofKvVCp9ruDOt5Uc4/SCTkqMHK/TV/gRuaGwx0GtXPTne9Bm5i2m8tcsWwGj15SCkqgtbw2Iu1OPHnfZRKQsKLMzES21Mc46OdO61cGHyJL8RGXXwW+eToCF3yoFkLLKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aPgUE9S+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B1NGR0o028211;
	Mon, 2 Dec 2024 07:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v26/TYOob+NECfnPBpMu7z6StsYT9j5xEcam3fwIlbs=; b=aPgUE9S+gEkelo/M
	e3kNbnO6OOX/CM1QNfdytGYcJk4j980xmQ38QcvvLCDvsd8z/E/sWzqM+i/5IxeN
	7WKFqFx73e1C6ulU9BZqBU4FtPG543i/1IbX5LyZyv1PkNj3ohI36UlfcAAZSYZb
	8F9UmTi1qcvriPC3jLMIeRbSqr2FvxC+Q1q2pJl2CXziKl6mnX401LC8LDdx0jRL
	fiNpnjf7h0bC6HnjNfkmYKtblCUE0dqAOqH8xO1pHbBxM6gSACKXN4HCpG1W1s2z
	vA16C+5g8aaaH3wQesu5Fsc/Wow0ZUxZDQ4sAftgfbUhJ6KFMQV9EobKuKR1mJaZ
	T0S/yA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ufe3r8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 07:37:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B27b7sJ000401
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 07:37:07 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 1 Dec 2024
 23:37:01 -0800
Message-ID: <8d08c539-6abf-4def-890f-e54176f26efc@quicinc.com>
Date: Mon, 2 Dec 2024 13:06:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/11] clk: qcom: videocc-qcs615: Add QCS615 video
 clock controller driver
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-10-7d3b2d235fdf@quicinc.com>
 <d4afdd01-3147-4cfc-820a-f6004637e6bf@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <d4afdd01-3147-4cfc-820a-f6004637e6bf@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: o78Pex3XS_OFdCfr-0bRkYSDMPy3W05E
X-Proofpoint-GUID: o78Pex3XS_OFdCfr-0bRkYSDMPy3W05E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=959 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020066



On 11/9/2024 10:52 PM, Bryan O'Donoghue wrote:
> On 08/11/2024 04:09, Taniya Das wrote:
>> +static struct gdsc vcodec0_gdsc = {
>> +    .gdscr = 0x874,
>> +    .en_rest_wait_val = 0x2,
>> +    .en_few_wait_val = 0x2,
>> +    .clk_dis_wait_val = 0x6,
>> +    .pd = {
>> +        .name = "vcodec0_gdsc",
>> +    },
>> +    .pwrsts = PWRSTS_OFF_ON,
>> +    .flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
>> +};
>> +
>> +static struct gdsc venus_gdsc = {
>> +    .gdscr = 0x814,
>> +    .en_rest_wait_val = 0x2,
>> +    .en_few_wait_val = 0x2,
>> +    .clk_dis_wait_val = 0x6,
>> +    .pd = {
>> +        .name = "venus_gdsc",
>> +    },
>> +    .pwrsts = PWRSTS_OFF_ON,
>> +    .flags = POLL_CFG_GDSCR,
>> +};
>> +
> 
> This looks good to me, except; could you please check if venus gdsc 
> should be the parent of vcodec0.

For the video gdscs we generally do not explicitly need to mention the 
parent GDSC.

-- 
Thanks & Regards,
Taniya Das.

