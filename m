Return-Path: <linux-arm-msm+bounces-28727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE1E9540EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 07:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3DCE1F24856
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 05:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBF0F78C7F;
	Fri, 16 Aug 2024 05:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j/kViwn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D0A7641D;
	Fri, 16 Aug 2024 05:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723785235; cv=none; b=DG2ZpZatR0loUN3mFrezpVZxlS4FvS7UVOIl5Ba7xexZOpA5I+BVy1bAOMHCYfwfk2Fn1277Qat6DVMXcFnv2Ez/TJhsc8mrP2TXcop5p9GQw8ZxbZTkP0YQ8jZkZeLsJUqjpCT/hlaKbhGPLLmSaBwyVDqeeoxlVAb+tIJP7vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723785235; c=relaxed/simple;
	bh=OBT/HsjGoegZMDtCA24xDApxAH9Q4d7YJagWXkh+Ri8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tiCpd++7FdIPRVFOMJjIKF50LrVbo0blRyerhQaxE1WRzMPw69CxaWCUexQh+GmyJlP/EPz65Tk/mGgocQWeI69RMFhOp5FzsXpTNQBnrz67tmGS3WnfU6zEPhgpfDp25/nrEDSgK43oFyvOoYTQ6H1VvuA1tizQQI1tYeCiZ2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j/kViwn2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FKvOnL025792;
	Fri, 16 Aug 2024 05:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uBMVROx+2VWs4/OL46Go0GfpX9elxo7Yx9eikb9ktH4=; b=j/kViwn2cmWEoaUp
	DkMcmavNVBPCSATJQbE8Krj/OjyWC5xe/jCgZ1CuG8iGJN5xN5FxJMqUT6OGUlEv
	/+PH45Z6PrTH4+b5o+8P9d2TWca9H/yS5WPepQo1HnMxaOAoC1CWnPLsf0I1nRFx
	3e4chUQ7IFHVCapG0huS7G0CNVK6wH6S8j2BhNXkdG8VZAMmMO3VmdYI58S4YnLB
	lkVZbFOUdrlL5ZmHva9ZidWqPbT5BuzLW2XXn7cxNeJSwI/FwmQGPqL7BLQtI/HC
	S9/H5PcrjUHEp1ja1c7bcW/zc4VTaxKxhR083obcfa4JyUoliBiKvaCS6RUYyQjN
	W6QvWA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 411s5pgru0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 05:13:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47G5Dn94017280
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 05:13:49 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 Aug
 2024 22:13:44 -0700
Message-ID: <a619c8fa-e107-435d-a09f-487c31e68b86@quicinc.com>
Date: Fri, 16 Aug 2024 10:43:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] clk: qcom: Add support for Camera Clock Controller
 on SA8775P
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_imrashai@quicinc.com>, <quic_jkona@quicinc.com>
References: <20240715-sa8775p-mm-v3-v1-0-badaf35ed670@quicinc.com>
 <20240715-sa8775p-mm-v3-v1-4-badaf35ed670@quicinc.com>
 <c3126e10-05f9-43a6-aa9d-d96354e27382@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <c3126e10-05f9-43a6-aa9d-d96354e27382@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ExS3d4yUcOfHVBRxD2xxWNHhjoPPgjVg
X-Proofpoint-ORIG-GUID: ExS3d4yUcOfHVBRxD2xxWNHhjoPPgjVg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160035



On 7/16/2024 5:37 PM, Konrad Dybcio wrote:
> On 15.07.2024 10:23 AM, Taniya Das wrote:
>> Add support for Camera Clock Controller on SA8755P platform.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
> 
> [...]
> 
>> +
>> +static struct gdsc cam_cc_titan_top_gdsc = {
>> +	.gdscr = 0x131bc,
>> +	.en_rest_wait_val = 0x2,
>> +	.en_few_wait_val = 0x2,
>> +	.clk_dis_wait_val = 0xf,
> 
> Shouldn't this also have a .cxcs relating to GCC_CAMERA_AHB_CLK?
> 
> Konrad

Not really required, this external GCC clock would be kept always 
enabled from GCC driver.

-- 
Thanks & Regards,
Taniya Das.

