Return-Path: <linux-arm-msm+bounces-36502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3C69B717D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 02:10:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C894F1C20B7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 01:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986983C463;
	Thu, 31 Oct 2024 01:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EpvHI4EF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4221D186A;
	Thu, 31 Oct 2024 01:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730337001; cv=none; b=hTwG7CpIafAz2WVWBkylT0oUzRZhVNypodP3I06JbF1La1qjEp0wLZTWrvN11626euHE9QwZRaOw7qb9QG1FkGPqhscZk8cohM6JtSA5SO6VxDIDx3MU+KIYA5Jv3Fqgpt/HCWml3zVq2EVhMM/nY2+EsCP6ObtacTn1Kg7N/0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730337001; c=relaxed/simple;
	bh=yYhWaamNjlqFFpqW425S0NndidrwKuVwYYQUsXnnGNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FhRPNoqwBBoX1gatW6PhyfWL/nBEw1kKT14u8ydPoAzK+eDNZDkxqGK3U3Z+DoUzPIynkZmf12p0HLhOKIZoIdHF2Bt87YLB0sTk359tQ1p8UBFy3cctZRLF9h5tubOdulQ6iCi7FESOVdyisgQfaD0xKJMwP+26PlT3ty1sd+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EpvHI4EF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UDqCSK032239;
	Thu, 31 Oct 2024 01:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ikH4uFBlJjlet4b79cIIFpIAty3aXL85MXeU+eUJ9DI=; b=EpvHI4EFQjtGOEMi
	dUdajScTt7ttuYYMQbUO6NltnaoW0Wb7SFeM4oTdr66aHcW2LujJErOJ29cCFrMn
	BgLakobwN8d/rETQhB9fgU0UPx8GrLrOX20HRAw+hfT7VCN0VIoVkF+7wBK5Hfaw
	2AN17wJiZ844oJX+u8wQAwBRc6p6eftvytF6vcCypPU7qVfVsxVl4M1TmEwl4f2J
	I/FJ3TJrSIa/KbGbPJnZ+YlA+HTV+VvuBsEuSw3KrkQLgaSYIQNbj2Ed4k8Buxr4
	bWQyZLZkX/AoBAYVFH+UO5gjXY+XhpPMn25T8WbGh/WdkJxnJ2JVI5YMCzAdRjGQ
	qY5vTw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kp2g9jwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 01:09:54 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49V19rlp029422
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 01:09:53 GMT
Received: from [10.216.12.123] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 18:09:48 -0700
Message-ID: <d25ee628-7a05-4d53-ad4a-e4feddfe6591@quicinc.com>
Date: Thu, 31 Oct 2024 06:39:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] clk: qcom: gcc: Add support for QCS615 GCC clocks
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com>
 <20241022-qcs615-clock-driver-v4-4-3d716ad0d987@quicinc.com>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <20241022-qcs615-clock-driver-v4-4-3d716ad0d987@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: v6NDmE9WzrAc2MEA6LAr8yETYietvM_Z
X-Proofpoint-GUID: v6NDmE9WzrAc2MEA6LAr8yETYietvM_Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 clxscore=1011 suspectscore=0 impostorscore=0
 mlxlogscore=939 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410310008



On 10/22/2024 5:22 PM, Taniya Das wrote:
> Add the global clock controller support for QCS615 SoC.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>   drivers/clk/qcom/Kconfig      |    9 +
>   drivers/clk/qcom/Makefile     |    1 +
>   drivers/clk/qcom/gcc-qcs615.c | 3034 +++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 3044 insertions(+)
> 

Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>

Thanks,
Imran

