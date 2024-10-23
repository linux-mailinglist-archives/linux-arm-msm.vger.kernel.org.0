Return-Path: <linux-arm-msm+bounces-35595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6F19AC88B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 13:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C05C0B24821
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 11:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6466D1AB533;
	Wed, 23 Oct 2024 11:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oD8nWIOr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3AA1A76B2;
	Wed, 23 Oct 2024 11:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729681547; cv=none; b=OoYpwIDmcmE/cSH0eRD7pjlR7kXVA1pcJFIUNk+EeTbPW1NyBWv3MtclMbtyFk0wWhX9k1FBxDVqw8pV6IYdJ/Vcv3Y54N/p9Fx35fgswUUJjUrJTFHNCk/gdOu1hqVpqzm3C2pZvnTYpCDIwABbz6IE0MaI7fKSev0RAWOKyN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729681547; c=relaxed/simple;
	bh=RoJupA/pJTuOcTKNTkoFEuEcqD6COhEJm8+MmObXwFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rGn6cMusB7ZtKLAPL+GsRjWaXAwSPx6vw2YuuZ3tZzolZ8GebAOORZNLi92uOKKOYO5c7/BjTqkDeB6KId9b6GWHsDDTckzPhmnczMjcz4Dhyq79XxdaRZlSGtN31CapctHsD8vx0P2gj88tSuVLvycKoT+LL/nbRxti7wLLp3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oD8nWIOr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9w7Jj027468;
	Wed, 23 Oct 2024 11:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8bl46XToNi5CdCM6CI3wWfowVn/5duNkEX4nzsCSJg0=; b=oD8nWIOrLytAkXvV
	SpXrcwMFaCHr83YxmKFl36kylNwvzsylLr8+w+RyIdI0xcw93jK4UEPx00Y5jCGJ
	m7fMNRqfo81w/NL39/YPxDbgEA4RvG3U01zWIO4F4+7v3BbO5/UU+edO842WLmQ7
	xCQrDLWrVSZ72nPJdu5NP3rRfq8po0CApB74Dxg+nnBaw0Rs8TggK/wWyHVV43WK
	Uvh+a2GcNHRRrm25h2Kb1+uk5sP3CObR6xgXn6YXhlvKQVinajWx5tjveIGIZNnv
	+0LLE3JVSiTUGhxi1m2Xw1EJwdR96KyYNTL3AoJRmTeYxrMg4iHvAYa24rbXqZW6
	ia0kCw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3whvwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 11:05:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NB5e3Q031828
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 11:05:40 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 04:05:37 -0700
Message-ID: <f67d0fcd-4940-a57a-0e11-b98ed29cd09d@quicinc.com>
Date: Wed, 23 Oct 2024 16:35:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/2] X1E001DE Snapdragon Devkit for Windows
Content-Language: en-US
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <krzk+dt@kernel.org>,
        <robh+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <conor+dt@kernel.org>,
        <abel.vesa@linaro.org>, <srinivas.kandagatla@linaro.org>
References: <20240911073337.90577-1-quic_sibis@quicinc.com>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <20240911073337.90577-1-quic_sibis@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9ZE_5B1kWbiKYkbDRusaaJx6GMuaxhRZ
X-Proofpoint-ORIG-GUID: 9ZE_5B1kWbiKYkbDRusaaJx6GMuaxhRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 suspectscore=0
 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230065



On 9/11/24 13:03, Sibi Sankar wrote:
> Add initial support for X1E001DE Snapdragon Devkit for Windows. X1E001DE
> is the speed binned variant of X1E80100 that supports turbo boost up to
> 4.3 Ghz. The initial support includes the following:
> 
> -DSPs
> -Ethernet (RTL8125BG) over the pcie 5 instance.
> -NVme
> -Wifi
> -USB-C ports
> 

Hi All,

With the X1E Devkit cancelled and with no firmware updates promised for
it perpetually, please chime in and let me know if you still want to get
this series and rest (external-dp, usb-A ports, sd card slot and 3.5 mm
Jack) merged and have it supported upstream for the folks who already
received it!

-Sibi

> Link: https://www.qualcomm.com/news/releases/2024/05/qualcomm-accelerates-development-for-copilot--pcs-with-snapdrago
> 
> Sibi Sankar (2):
>    dt-bindings: arm: qcom: Add Snapdragon Devkit for Windows
>    arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows
> 
>   .../devicetree/bindings/arm/qcom.yaml         |   6 +
>   arch/arm64/boot/dts/qcom/Makefile             |   1 +
>   arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  | 813 ++++++++++++++++++
>   3 files changed, 820 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> 

