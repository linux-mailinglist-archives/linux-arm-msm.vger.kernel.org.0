Return-Path: <linux-arm-msm+bounces-29181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6DE959746
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 11:43:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F4541C20B24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 09:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0504D1CDFBA;
	Wed, 21 Aug 2024 08:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DhLGASOm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300F71CDFB3;
	Wed, 21 Aug 2024 08:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724228715; cv=none; b=I5HZcM34HjXacwdBKrWS87j+pwb1QMOOkATo2443h07BzY0q+0R7B7H5UXz8qsONk1jSu73bALMkqZkhpY6kC0nfOOr1h+JXmbXEB3HZas1VEBktHNcV+UYJ5LrngVPjLTs9Iy5dkHspIRxv2rCbfkUEWPz2wHUmUQ/ofSeVJ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724228715; c=relaxed/simple;
	bh=ksEwtx6MK1MO29JZVBLTZ/zuhbAx+9T13AxqU65ha+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mZjprMh2fH7z5T6Y56wP2AdNcq+3YusY1kBEtHEtPE4k5EXgspsZ78jkt4Yu/ITR3VqKcJdnKRLe6w9uT48AlILPNPLUa7BOVmkexppu+QYv+fY0PMzxw4fX8s3HjQkLGn4ZzUfP7CcxPqNN+5ajAH96PDGJuB6cr0HTcSvj+f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DhLGASOm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47L65Ta8024473;
	Wed, 21 Aug 2024 08:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tQFN63z5zVyACKkqiHRlSRLD7DQ1AMvOTunOX5dSs54=; b=DhLGASOmP/sYoKFz
	CUeQdo+LMppl2Otp48CfFzrrXb1EAqdDrZlyFT1iWhEHbPbULFwLpM2X8r5+lL9K
	5tUGkhpJkON76rOQeS+SC9RjxWImdJ3LTZJ5as3tu67ac0m2q/bA7PwYRyf7jPp/
	WsHnH8lNYZ64/ASnd/kVlUvaWXHJQFKyRODqViwqV1owQ2+8pp6dlqTEypu9yw+S
	F+Ar3tygRhZ4T+n9AijnSVImVU7KLrKHWRJ4r4Lc6hb7nkDyocsuJhXGoa1/u97l
	VIPPFl8MrEDGsEfEITnGR+NV2MSgmKp6uNiMatW4ybZ9HYhcSqyfmeRzWgsQjyQr
	Mv3ZBA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414pdmus3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 08:25:07 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47L8P5j5025859
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 08:25:05 GMT
Received: from [10.216.8.12] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 Aug
 2024 01:25:00 -0700
Message-ID: <6016f2ec-6918-471c-a8dc-0aa98fc2b824@quicinc.com>
Date: Wed, 21 Aug 2024 13:54:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Add support for Global Clock Controller on
 QCS8300
To: Andrew Lunn <andrew@lunn.ch>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        "Ajit
 Pandey" <quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>
References: <20240820-qcs8300-gcc-v1-0-d81720517a82@quicinc.com>
 <20240820-qcs8300-gcc-v1-2-d81720517a82@quicinc.com>
 <a7afdd6d-47a1-41c7-8a0d-27919cf5af90@lunn.ch>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <a7afdd6d-47a1-41c7-8a0d-27919cf5af90@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 90ASgeUzY0yu7HUlsbJzQvY0H5JxiK8b
X-Proofpoint-GUID: 90ASgeUzY0yu7HUlsbJzQvY0H5JxiK8b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_07,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408210060



On 8/20/2024 7:36 PM, Andrew Lunn wrote:
>> +static int gcc_qcs8300_probe(struct platform_device *pdev)
>> +{
>> +	struct regmap *regmap;
>> +	int ret;
>> +
>> +	regmap = qcom_cc_map(pdev, &gcc_qcs8300_desc);
>> +	if (IS_ERR(regmap))
>> +		return PTR_ERR(regmap);
>> +
>> +	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
>> +				       ARRAY_SIZE(gcc_dfs_clocks));
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Keep some clocks always enabled */
>> +	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_CAMERA_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x32020); /* GCC_CAMERA_XO_CLK */
> 
> It would be good to document why. Why does the camera driver not
> enable the clock when it loads?
> 
>> +	qcom_branch_set_clk_en(regmap, 0x33004); /* GCC_DISP_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x33018); /* GCC_DISP_XO_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x7d004); /* GCC_GPU_CFG_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x34004); /* GCC_VIDEO_AHB_CLK */
>> +	qcom_branch_set_clk_en(regmap, 0x34024); /* GCC_VIDEO_XO_CLK */
> 
> Why cannot the display driver enable the clock when it loads?
> 

These clocks require for DISPCC and CAMCC drivers for register access, 
hence kept enabled at GCC driver probe. The same approach is followed 
for all the targets.

Thanks,
Imran
> 	Andrew

