Return-Path: <linux-arm-msm+bounces-36794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DDC9B97D1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 19:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A77002811C2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 18:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4009E1CEEA0;
	Fri,  1 Nov 2024 18:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pNqpzaBJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3D71CEAC2;
	Fri,  1 Nov 2024 18:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730486554; cv=none; b=HA9ADboVgkMxgm8tEnCUXkoaVrhJqp3NIgOghvM6xRWgPySoephnVW1cf8gZBGHpvpx5GvSctObIT/SZk6mg96rwfi8nClnD4pzKHaFhzb5ZA6G8ex/1xKw3nb7ZEGls+3CvSU/nU5XPeusSuwX++qsVp4zTCCeOVdcU5A+DgGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730486554; c=relaxed/simple;
	bh=xWpT/mxlrL9D7Odl5e7VeESi0LgN6lMj+B8ERQAS5k4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CaKmRTaGtFjUTfjX4xmY3WDdi2XShhSWaPXLoi7mj5YONylnNXA4Xuu0P9zS+yFrlftH58f886HWekiYiBPk1R7ZyxOWw3FYg9/M5R5olfIrlBcB/mGuA6qrBo1wHZzfBxCGsKPMejvIP2kjC3QUztr1Flw87SvfBfcaQxscI6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pNqpzaBJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1C4w0V019835;
	Fri, 1 Nov 2024 18:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Bi1+NpTxbR3CpMOTalm++0m245kAEpxCa73NE+jHeA=; b=pNqpzaBJkyKOYUYc
	JZCKTYT2YY0WKtBWv0cGPyVT3mjPJheaB6CGyctcXuXh0sZ1JBHK0rnzTxTE82tE
	6dOT4akR2Q4aouJYpEDQeRfhpEq5NkMe/fVSx6oseFFqrM1Xk10MJtwQ/ExYyP/P
	tEj79y5oOCB9zdXwqWomP61YGx5dfJ3MJu1uWefhCukUq6kocPrhfZKwZAWRX5rs
	TYFmg4buzg2jnsOq5nKX/9Tq2j4bot1GMAlLF3ESiOSny5Qo+/WwpEhXAjyLOPPr
	IMceIS6wMCAHd+VFAId4Q2jAa235FOAW+0l8RZNa4q+I62ZCb8B3WAvggN3bz9EN
	DxJUZQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kmp0rb7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 18:42:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A1IgS3O021221
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 18:42:28 GMT
Received: from [10.110.33.199] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 1 Nov 2024
 11:42:27 -0700
Message-ID: <b109df4e-1526-4803-bfa9-d130381710af@quicinc.com>
Date: Fri, 1 Nov 2024 11:42:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sm8750-mtp: Enable ADSP
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>
References: <20241101-sm8750-audio-v1-0-730aec176459@linaro.org>
 <20241101-sm8750-audio-v1-3-730aec176459@linaro.org>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <20241101-sm8750-audio-v1-3-730aec176459@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lFj-5ax8GTmB4bif4K5lIxF5wcAdZn-z
X-Proofpoint-ORIG-GUID: lFj-5ax8GTmB4bif4K5lIxF5wcAdZn-z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 mlxlogscore=548
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010134



On 11/1/2024 10:19 AM, Krzysztof Kozlowski wrote:
> Enable ADSP on MTP8750 board.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Firmware release will follow up later.
> ---
>   arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 7 +++++++
>   1 file changed, 7 insertions(+)
>
Reviewed-by: Melody Olvera <quic_molvera@quicinc.com>

Thanks,
Melody

