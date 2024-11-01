Return-Path: <linux-arm-msm+bounces-36795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADED9B97D4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 19:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D8341C2111B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 18:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6D81CDFBD;
	Fri,  1 Nov 2024 18:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hXB2cBDY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4AA1AB6C1;
	Fri,  1 Nov 2024 18:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730486591; cv=none; b=V63KvBvW2WgmhvHxbZ3E9XoaY90NnfDNNR2mPjYMkUojH8BKihftaAtQoq0Yyv2QijFVZ9LceKOzjRi3A8Rm9uh1zzPhwOg8evA3czNSLmR1a376nV+nUIjiUYmhzoftBFfhQ0Un5D64M0MUMKSi6Zbcuix1oKxAKfowPnuMJy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730486591; c=relaxed/simple;
	bh=j3OTeLdioiEXWn4ftMh38JgfvmXciXzbfnqa9kQhC3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IO2x+oTpDZift9M7gsk8q4TBucRftg/Zh8yO5q3ja/lNpNFs6FM4pok/d2EjswJc0JBqrbbPZTrjDPDcQFRD+cXTFiswf+VOxuPKy4lEp0mfXEeHuz9f3yO78Fruotk0FiXOyuEdmcySmrNarTPDMCjQQpQxJhFofLGVah2Js7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hXB2cBDY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1GcF8Y028274;
	Fri, 1 Nov 2024 18:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k13nb62oaBC/LKwTpq5E66VPRLY65tnsSUNT62O3KVQ=; b=hXB2cBDYpIJmKdhq
	NxcdWMpNlDg38fnl0inMdXZZTCmlnT9OW6SXUQuiFxGGeqIdntNd/+TuSnU4FInG
	mJ2+4MDO2o1IChwZsY+I/QZWObdBSlW5W8cgQqi0gk/dn3mud3xgTH1kje3oWLod
	C3tGVV0IbzS04roZCamCvrslqLRgpXZzvpYyfpz7I0I7DYtYs99YR1x6weeUw5nx
	6yzImzuy/eIUZ6N38481Vn3Rv+QcvPMxnu1CxlMFedJfQV5kJWMzsHN8Lc0WERG8
	sckV3KpK5edZe/JYg4MDYAiDV6kLIssK6lgl+YNP24XWaKjxUGoz341PQdmDjToT
	sv5eZg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42mu7c9vy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 18:43:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A1Ih3IH003537
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 18:43:03 GMT
Received: from [10.110.33.199] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 1 Nov 2024
 11:43:03 -0700
Message-ID: <883b48f2-26de-4d44-b26e-a84ed0d46fd8@quicinc.com>
Date: Fri, 1 Nov 2024 11:43:03 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8750-qrd: Enable ADSP
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
 <20241101-sm8750-audio-v1-4-730aec176459@linaro.org>
Content-Language: en-US
From: Melody Olvera <quic_molvera@quicinc.com>
In-Reply-To: <20241101-sm8750-audio-v1-4-730aec176459@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0YSAUrnwyHGemuw8Pq91oMvacZKX56bT
X-Proofpoint-ORIG-GUID: 0YSAUrnwyHGemuw8Pq91oMvacZKX56bT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=548 adultscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010134



On 11/1/2024 10:19 AM, Krzysztof Kozlowski wrote:
> Enable ADSP on QRD8750 board.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Firmware release will follow up later.
> ---
>   arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Melody Olvera <quic_molvera@quicinc.com>

Thanks,
Melody

