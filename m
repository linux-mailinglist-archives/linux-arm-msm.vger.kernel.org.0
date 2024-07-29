Return-Path: <linux-arm-msm+bounces-27229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A44AE93F29D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4BF81C21864
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 10:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE02143C60;
	Mon, 29 Jul 2024 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oA5avX6q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1368674055;
	Mon, 29 Jul 2024 10:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722248770; cv=none; b=JwzLQ810KiCS01F0+l/BYmeRcpnY7lr44EEqnBRzP5ckf/oces1FXag/bI9+1a6Sf5ZuPWa8O98+N0JYHdtV3r9DFhq8H0oUXg1AxFNnPL7AT2ieuZR0oKAxYnoF5aKj1l9A8HO208ZEKi80yV6qAyRytb+EoGa0c98/kM0g53A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722248770; c=relaxed/simple;
	bh=bX6iFlfN0q1Gk2S9aLfzY0rCA8hJ02u78BUo63ZvLGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fRLy3v83g48zsNjnV4B3MTzvwcfrv8agAZyGXpkfMy4uwo+Z8HhWGkzXSG4qp/0fIsPZaqeNy4Rk7o+s2C/sfJCTOeJv9Fpe6wZS7nqgPiviBDM+PTTSjPgKkRmHasDPjtSSur5gihGOUSxzvp6uKgt9ACqUYM8wrolGbwXIx/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oA5avX6q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TAHiJa025339;
	Mon, 29 Jul 2024 10:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n80z9PgK00hA1131y8xwu/x/kpeyMX96EJWcMLCX5pE=; b=oA5avX6qzf6sQJ28
	VMQrVnvr/DpLmcdziiCqiafU3LQ7NeLgnsEnzYRNowMnasyEPg0r5kwl+LPyrGKV
	GJLcjFLYaX/VFi6iGmLD+C1RssfEcU6/YuKyzXiNFjaz+OdthX6LsPT7UPX/dIvk
	CXVDE0uQtlqET5qCPllZ1q+ykae7hcxnVHGEfAQrEeXibGyJz0l2uqofPmkJbb0M
	0nriRY0gX+ZJDlP+cudPwMh2keYvn05+k+kqfO2fElRmYS+DM6hglhAw4cg7BIXh
	ZIbH5gPCkzo8jPmIDH0vOXmKXI1Q7h75xQ5sLSrWz4tSQorBTOJNE2o0W0Sj3gDH
	36MB5w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mr7gm0jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:25:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TAPwoP015923
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:25:58 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 03:25:52 -0700
Message-ID: <2d5af39a-e7ae-47c6-8a6e-f8da5454c8d4@quicinc.com>
Date: Mon, 29 Jul 2024 18:25:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: ufs: qcom: document QCS9100 UFS
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Andy
 Gross" <agross@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240709-document_qcs9100_ufshc_compatible-v2-1-c6e6bcd0c494@quicinc.com>
 <94710b3c-9d94-4ecf-88f4-7827a67f7f13@kernel.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <94710b3c-9d94-4ecf-88f4-7827a67f7f13@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4x9E2YCbpVXQXkX96w3pwpRPfAsCTUsU
X-Proofpoint-GUID: 4x9E2YCbpVXQXkX96w3pwpRPfAsCTUsU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_08,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407290070



On 7/10/2024 6:17 PM, Krzysztof Kozlowski wrote:
> On 09/07/2024 15:21, Tengfei Fan wrote:
>> Document the compatible string for the UFS found on QCS9100.
>> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
>> platform use non-SCMI resource. In the future, the SA8775p platform will
>> move to use SCMI resources and it will have new sa8775p-related device
>> tree. Consequently, introduce "qcom,qcs9100-ufshc" to describe non-SCMI
>> based UFS.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Let's close this session and ignore the current patche here.
Thank you for your input.

-- 
Thx and BRs,
Tengfei Fan

