Return-Path: <linux-arm-msm+bounces-25037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47864925637
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F249A28ACD1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 09:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DE713C8EE;
	Wed,  3 Jul 2024 09:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hEsdm09K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2710F1A28C;
	Wed,  3 Jul 2024 09:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719998178; cv=none; b=Dokta0v6iCv5ZkrOVbkhauHXzjGT7rBhZlbCUL4j1IyKlyH5GQfMnaZEgw32cRcbLe/JWCV3/bzPiLXhky+LKyL6ZFO0eNy5JBDfff5tQKeh9F4DzBHI0eq67yfpw7vZIbRMLKotg5rVMVRqxjukwtg876dudniUao9VMikwbcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719998178; c=relaxed/simple;
	bh=EQ9ynuogKwqJotvG6/Q3XVZNpD2ItovSqDtXpxciwG8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rC4yiXQEEQxHljiempUKD0+pmkDQQ2/Ja07iwCf4hPj6zK92YMrB8t3j5aYOEfFTbg80gjnk3xrkVFDVyaSGH6t8nHwwiLjof1y9PT8aBC2jzIe8CT2R/IMkXZTJwDWw5tIf6N9uKI0GsImZHoIiIgR0zNt6iVmtyLk6OGoxEyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hEsdm09K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4637vq1W026223;
	Wed, 3 Jul 2024 09:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+fdzPPy73AwcqGd0sFY2QX/hNI/YC7EvKY8Xe7GoW4k=; b=hEsdm09KrbeEZhsS
	1yd1FWnMrM620d77NCNZRNWGYspn+hJmy0A8jpEAhUleEyJoxrsiJp6AbkHU18ND
	8AoS+8Rd0puBwC0S6h6n3T9AhteumIwdAVdrWNosjN9/b8K21s24GP0iuH4gTT2N
	H3BMVNg7T68uNtY7dAWvJbr0PbUB8pl/V4cxNUEO6Q8ETn+p006RM/3SttJsDdNJ
	gF8c7U9alFSlW/2WxCLKaEK/5irtM0tI9O2AnfEBjNWZ3rt8HxWwlRB6G3mrpjRR
	uG1TfXFrbL087P0vx+uYP4vndvMxEIDEG6aQwvqOOZ9UWGq20+ow/mFOEIcMG77e
	64YKWg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4027mnrnep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 09:16:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4639GBc8025021
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jul 2024 09:16:11 GMT
Received: from [10.218.10.146] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 02:16:06 -0700
Message-ID: <ba7d12d3-c582-45ec-beed-e81182fe3252@quicinc.com>
Date: Wed, 3 Jul 2024 14:46:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: sm4450: add camera, display and
 gpu clock controller
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
References: <20240611133752.2192401-1-quic_ajipan@quicinc.com>
 <20240611133752.2192401-9-quic_ajipan@quicinc.com>
 <76f5e3c7-a90b-42d2-8169-e5e2211a14a1@linaro.org>
Content-Language: en-US
From: Ajit Pandey <quic_ajipan@quicinc.com>
In-Reply-To: <76f5e3c7-a90b-42d2-8169-e5e2211a14a1@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2tf3mFBe-TlOvC8mIgbvW5ozTFNDXz5l
X-Proofpoint-GUID: 2tf3mFBe-TlOvC8mIgbvW5ozTFNDXz5l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_05,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407030068



On 6/13/2024 1:11 PM, Konrad Dybcio wrote:
> 
> 
> On 6/11/24 15:37, Ajit Pandey wrote:
>> Add device node for camera, display and graphics clock controller on
>> Qualcomm SM4450 platform.
>>
>> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
>> ---
> 
> None of these nodes reference a power domain (which would usually be
> CX/MX/MMCX). This way, the RPMhPDs will never be scaled.
> 
> The current upstream implementation only allows one power domain to be
> scaled, but that's better than none (see other DTs for recent SoCs).
> 
> Konrad

SM4450 doesn't support MMCX and CX/MX domains will remain active so
power-domains property is actually not required for SM4450 clock nodes.
-- 
Thanks, and Regards
Ajit

