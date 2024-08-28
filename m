Return-Path: <linux-arm-msm+bounces-29734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 549D89620FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 09:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B9221F217BA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 07:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E0A1581EE;
	Wed, 28 Aug 2024 07:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Xsub3MDE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44CE1CF96;
	Wed, 28 Aug 2024 07:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830013; cv=none; b=vBPgQoXSYpPlx6/glGxqVW15aHHlWE/9FEyEHUF0WDbAG0V0aS6r+PoIgToVk3EDthJjVMflUbaq2Tfv3OMNovY1bnALWW8g+lx2sFLSbwF1M2j5ly/Ne3h3LFZoJ475hCcLRqK9hW9rz6mot6aWXztI6bAOqlvoafUjXpyfszg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830013; c=relaxed/simple;
	bh=b86Cyv7arWZ0BaPvb8ISF9bILJ8ttG97X3JRCVu6I4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IMR7Sh/c6p3mDTBlfQqvepGE5IOOx7QixKLR9oI4Tsp7Muv8Nqq+cBLkMeG92pPZTQoudUuTY+zlwFT7pNCjXNIWJgKfbr9KRuqXFXpkOy02J38x/71kcfDg3LZAx52Z8cmJKc/Apu2AKuyzGpCsQVK+2umVUzzt/CHx7qBL3xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Xsub3MDE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47RLZuqL026999;
	Wed, 28 Aug 2024 07:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cl3kJatMgq3eamHSbjuBhCzO+Cgifq1qpc27jNaDPBk=; b=Xsub3MDEu9MDK3MN
	FApj9vDfPluMdKsNW79Yc8yhK78yjFp15t5vmGtwXJBRcpc4xtvCLR1f+YLj7BUC
	i2jLIByrrTOTWZv8YuSK1GLJh3XwyL/OijG5nscpgnY3qtSFikWfJdrbfK5T+g4A
	mCukcS+WrsrSzAGR+Q5FXkNHiWqF7oAKuXlSUhQ/xR7QqwxMXFzTPFay1vWJd2yv
	5xS5hOhyJ1Xh8Nf4a70WlFmRhDu3cF/k+Abhv36tVctCgx+ApUKX8AJX3Lgej39O
	CwyXHvtY70Cb+ixMlNRxD1joKy3LG3b2dBgcaFpXeKkRaLMsxtcinnfV5ZeWk7Zd
	HkYAaQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puth1gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 07:26:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47S7QkCM004460
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 07:26:47 GMT
Received: from [10.218.5.19] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 00:26:42 -0700
Message-ID: <72e3dc83-2bde-467b-b52c-40af7c5d151c@quicinc.com>
Date: Wed, 28 Aug 2024 12:56:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] clk: qcom: Add support for Display clock
 Controllers on SA8775P
To: Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        <quic_imrashai@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com>
 <20240816-sa8775p-mm-v3-v1-6-77d53c3c0cef@quicinc.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <20240816-sa8775p-mm-v3-v1-6-77d53c3c0cef@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Y63029wExIPKtz4VZRiLu_of-9y4F7bc
X-Proofpoint-ORIG-GUID: Y63029wExIPKtz4VZRiLu_of-9y4F7bc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280052



On 8/16/2024 12:01 PM, Taniya Das wrote:
> Add support for display0 and display1 clock controllers on SA8775P
> platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>   drivers/clk/qcom/Kconfig           |   10 +
>   drivers/clk/qcom/Makefile          |    1 +
>   drivers/clk/qcom/dispcc0-sa8775p.c | 1481 ++++++++++++++++++++++++++++++++++++
>   drivers/clk/qcom/dispcc1-sa8775p.c | 1481 ++++++++++++++++++++++++++++++++++++
>   4 files changed, 2973 insertions(+)

Reviewed-by: Jagadeesh Kona <quic_jkona@quicinc.com>

Thanks,
Jagadeesh

