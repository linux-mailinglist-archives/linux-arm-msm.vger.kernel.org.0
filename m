Return-Path: <linux-arm-msm+bounces-37234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8149C0557
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 13:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD1F9B2422B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 12:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4332220F5D5;
	Thu,  7 Nov 2024 12:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n6dstFS/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB262076A5;
	Thu,  7 Nov 2024 12:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730981306; cv=none; b=lsTt3Gc4nS+Yn4Osxi/oXIHrggdQZnRvgWuwHjwHNWwWbx4CqzN3p7HwdyBKx+em6j7b/n9U1RZyO4cTSUO0fIO2Ji+OVK35oCEFMYu5EykhsxXphr6MDHd05GjhtVmoBTAfvUTXgAYaOhJp2h8jsBG6qRBAKGRW97GbbEu8uZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730981306; c=relaxed/simple;
	bh=M3TLAFIJ4/kVYb6Psr+D6CGPXSYJcvxy5NdMfI5i/hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RlS8qSA+CZYzW+fjfWvk4MTfEMCsXHXaaRDzAvnnOVAD+I4HmSKN4IrIhwsRm2989yK3lFreh1qz/7//xUvAGoINmsGVrAQuTry8LL8+CJTST4EGxuQyawreo6DaqqAOl+MQ8cpiZ8L0lB/iMK3knS1ZqkyvBh0V+foS6LIfLhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n6dstFS/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A79LW0d009664;
	Thu, 7 Nov 2024 12:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8AnuIQnNPLUsevNU7FkVO1ndU0mlURvYfRqITOX9XXM=; b=n6dstFS/j0JfheMc
	ImBLPzcHIBHcPksVPIZS0pgRJ99MSkVT50nKdtcumUaDQK4/ReoN/E2orgARYfaI
	eorhbbcw2LnfbdNhMJdOmdWuo0uDUVreC2pDqAMCN0eQHZYczE2xgQALkXHcoj0h
	5o4O9/8lvTJFE0buyotL3YPp+vVyzX+9PYX71xFploKC91RstiRZRqbRdI8AzApN
	C6L99bc0mYpO9Hdyjo1YnRjUFM3p7R/LQzcyS5W9652fpd1rc/ifUJUV2rvolzgC
	NoJ8pLbzD48p8SibOmrHGuYs4njH6mvnFiZhQxfnU5YXxVgpAWVeeS/WApbCEvMQ
	tE4mJQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42rtupgepy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 12:08:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A7C8F5t016657
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 12:08:15 GMT
Received: from [10.217.238.57] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 7 Nov 2024
 04:08:11 -0800
Message-ID: <1eda19f0-8e9b-4629-8ad9-57d7eea572f2@quicinc.com>
Date: Thu, 7 Nov 2024 17:38:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 0/2] Enable TRNG for QCS8300
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul
	<vkoul@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_sravank@quicinc.com>
References: <20241106110002.3054839-1-quic_yrangana@quicinc.com>
Content-Language: en-US
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
In-Reply-To: <20241106110002.3054839-1-quic_yrangana@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -5A_3YGy1FzttJkG5Zbj34mYXut4XGRm
X-Proofpoint-ORIG-GUID: -5A_3YGy1FzttJkG5Zbj34mYXut4XGRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=722 clxscore=1015
 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070094

Mistakenly uploaded the base dtsi change instead of marking dependency,
will be posting V2 soon.

On 11/6/2024 4:30 PM, Yuvaraj Ranganathan wrote:
> Add device-tree nodes to enable TRNG for QCS8300
> 
> Yuvaraj Ranganathan (2):
>   dt-bindings: crypto: qcom,prng: document QCS8300
>   arm64: dts: qcom: qcs8300: add TRNG node
> 
>  .../devicetree/bindings/crypto/qcom,prng.yaml |    1 +
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 1380 +++++++++++++++++
>  2 files changed, 1381 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs8300.dtsi
> 


