Return-Path: <linux-arm-msm+bounces-31676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B15C4977864
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 07:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60ABC1F25420
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Sep 2024 05:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A609E1865F9;
	Fri, 13 Sep 2024 05:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MvCSVYSB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2651B13F43B;
	Fri, 13 Sep 2024 05:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726205730; cv=none; b=ceAaPNs0BH29baFjW/wwVZJmCG6A2FEn11/SnYMncQfpcMpI4I3jYrbyW6ZyGJk2krKU5BZFpSH/e6V7zECv3rFfc9zkZ3j4QjBHaa3uSulahfKkTuhEqPaGHLPKWWTzAmvu6befRRw1mlc642CbaXxRgKj8ttTAOpuqKzs3Nls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726205730; c=relaxed/simple;
	bh=Sk9EosdX7eYLZJt95vDTXyObnjCPXLlz69yjq27wCsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ikC726zMA30SGmh2BnV1m41gdLxVOaBr/fYSxh9leYhdO1WPFsrpFmFbtripghMgBkk+s1i9zc+0lBsHGz62Hy1Q9aLcHab0GTZ5LPOAe/GB505xhM2xCpNonu0LrrwZ3Z8uZ/TAzCS44xKlqbKuAUsZ+JZKfe6gV7iXrUOz5Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MvCSVYSB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CMB6HY030252;
	Fri, 13 Sep 2024 05:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PMhu6u9A/pHxse+3Fq3t17KJBUMNf/TeryRE3mrkxW8=; b=MvCSVYSBCm76bQkK
	77mZRW1PCVVcVSBHWPqQ6KZhK7l2BT9Vu9EFcxXrBQ7zPN7hzP05TcShSaPxhTcf
	7WuDeUTz5ooQq8utDoOVA+r+U6JD1lg5T0dmyhnrVYhcFGZwHBpQwDaavfw7LIAU
	Q7f8gI6rEtHj/xD0Xv7DKEp4A76XP14yn91j0blJtUd4y/fA0GoBeXYN7JdOFvbE
	Q7CavsSPyQDbUwS4ipe+mamnHLq2YTHjTWxY78wuh/rdoE1AhlxPZS37JRoWRj9o
	h3xBkVqgKXzeatR52spI12WXqEiQR6KzGPGp0QqoPKG1Q1jnQObTETCrgsQJidsR
	/YihVw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5a7qb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 05:35:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48D5ZOb9019870
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 05:35:24 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Sep
 2024 22:35:19 -0700
Message-ID: <7dc023b2-1e20-4ae1-a6a3-7056bd005ee5@quicinc.com>
Date: Fri, 13 Sep 2024 11:05:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: Add support for Global Clock Controller
 on QCS8300
To: Imran Shaik <quic_imrashai@quicinc.com>,
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
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>
References: <20240822-qcs8300-gcc-v2-0-b310dfa70ad8@quicinc.com>
 <20240822-qcs8300-gcc-v2-2-b310dfa70ad8@quicinc.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20240822-qcs8300-gcc-v2-2-b310dfa70ad8@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ibLp2e6apTeI6VYkfU6ZLdlDOngidBSe
X-Proofpoint-ORIG-GUID: ibLp2e6apTeI6VYkfU6ZLdlDOngidBSe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1011 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130038



On 8/22/2024 4:57 PM, Imran Shaik wrote:
> Add support for Global Clock Controller on QCS8300 platform.
> 
> Signed-off-by: Imran Shaik<quic_imrashai@quicinc.com>
> ---
>   drivers/clk/qcom/Kconfig       |   10 +
>   drivers/clk/qcom/Makefile      |    1 +
>   drivers/clk/qcom/gcc-qcs8300.c | 3640 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 3651 insertions(+)

Reviewed-by: Taniya Das <quic_tdas@quicinc.com>

-- 
Thanks & Regards,
Taniya Das.

