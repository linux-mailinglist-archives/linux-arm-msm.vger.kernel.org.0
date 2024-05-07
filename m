Return-Path: <linux-arm-msm+bounces-19387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DC58BEBA1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 20:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BA741C220AE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 18:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220A516D4F6;
	Tue,  7 May 2024 18:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kWn57Da/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6584C8A;
	Tue,  7 May 2024 18:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715107422; cv=none; b=ZNua72qRNr5SlkYWEYVvl/tG4INVBFbkyuGvzWL6Q1PFGzGd6y8O7LB/N1nBegqWNhxio3mfd91TFbU914vtzJT1XvJMElHUJdnr+O+zXVYRrq9c+h3qSN5A9cQ4BoV9GFV9ZrRwKD2XUp9n7IkCCN+WKuqIREIR3tojUE+k2WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715107422; c=relaxed/simple;
	bh=ZOmzU0CvOJI++Zhf9QtCz4Fyz7ks9uSOclvdvTs/RkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Tmk6wyEQYZdIzq2XHv3hEx4u2fKHYv3oN+nn6Nl+0PgDk1X6WvjRTRudP5DoZpyJvxHYm9YSZYdw59o9gruv5tlC3m35XGm/9Qag6PKr+CwPl9UQUhfDh/O8boTPVXr4bIYgE5amVOzYV2Jw8eBOi86KzrYlIXltS4xSFUIY6rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kWn57Da/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 447IKmMS015024;
	Tue, 7 May 2024 18:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=qtbjKV1COQJkwbSR/pNfVXT/je6N+V3bgEm5XP+w/gU=; b=kW
	n57Da/eWH0NsbR+02ullKBGMPD6WMBNWAJFiHBCbIOv8vXn3yn77ec4nS8Ex50Lg
	olN17/+OjCXHAlPzMjP6eRZSO/2dY/l431k0DqijLF2hcJzpDu5Z1OZo+2ppfHo9
	uxite/ZBKFKuXNU7Kzaxg2n0dDHJAs8vMshxDdDRafaLLJ8FreAhWix11Xhl3IHO
	GiCGk3ARR2/OOIXzJNXx/PsEGakT7mZbGH7H4Czwn6UKc0Q2qIK7Hu6xDJsjSl0U
	gpQshXKj9fCb6bs7E4n1gOyjNj1uV7pn+H98BQB0U79wgPJJsuFOfbTDYnHOqgd1
	TzpB0SDqkWS+LHBDGbFQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xysg8r1s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 18:43:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 447IhZCc021332
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 18:43:35 GMT
Received: from [10.110.125.244] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 May 2024
 11:43:34 -0700
Message-ID: <6d7ac6dd-94b7-908c-9dfa-68efdc48e006@quicinc.com>
Date: Tue, 7 May 2024 11:43:34 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge
Content-Language: en-US
To: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>,
        <andersson@kernel.org>
CC: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <konrad.dybcio@linaro.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nankam@quicinc.com>, <robh@kernel.org>
References: <jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc>
 <20240507163045.28450-1-quic_vvalluru@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240507163045.28450-1-quic_vvalluru@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WZ1ZEdG_VgokprOp3498ZZGxhsZ9vHjT
X-Proofpoint-ORIG-GUID: WZ1ZEdG_VgokprOp3498ZZGxhsZ9vHjT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_11,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=799 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405070130



On 5/7/2024 9:30 AM, Venkata Prahlad Valluru wrote:
> Rb3Gen2 has a lt9611uxc DSI-to-HDMI bridge on i2c0, with
> reset gpio from pm7250b gpio2 and irq gpio from tlmm gpio24.
> Bridge supplies are Vdd connected to input supply directly
> and vcc to L11c. Enable HDMI output, bridge and corresponding
> DSI output.
> 
> Signed-off-by: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
> ---
> v3: - Updated commit text
>      - Arranged nodes in alphabetical order
>      - Fixed signoff
>      - Fixed drive strength for lt9611_irq_pin
>      - Removed 'label' from hdmi-connector, which is optional
> 
> v2: Addressed dtschema errors
> 	- Fixed lt9611-irq
> 	- vdd-supply error to be ignored, as it is connected to
> 	  input supply directly, on rb3gen2
> ---
>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 85 ++++++++++++++++++++
>   1 file changed, 85 insertions(+)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

