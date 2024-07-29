Return-Path: <linux-arm-msm+bounces-27202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DAB93F1D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 11:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01E1A1C2147C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 09:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184D513FD84;
	Mon, 29 Jul 2024 09:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QLX3cZ1W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F32F13C69A;
	Mon, 29 Jul 2024 09:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722246690; cv=none; b=Z4KTUkc8t226O07pG+oqY1ZHi6mvVyZx6GrcjlUXTLQWkkdhduvkWHC+4YhsvRWHh41aIzriH5bm4NcIZeUlVEm4M4fTWG5UuP6CiA6dYTKvd6XZyLmwOP4MoNxFCZhG1XN7Y/33uhqAh6Lupah4BLN+ML2St8FNdFyfLP8So+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722246690; c=relaxed/simple;
	bh=DOTu0rJ3iILK3+V+lnH6jhOZA1lOsErN42ACsBX1ySQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lGxi8NP7+uz/RD0Kj+WpqZaKNdubxNejWdkWP0ca8Zc354JdrUMGTibhd+qOC0SBR5h6deRBH00zx3Xg0C/4E+zzowlWj3y3Yesz2BCt0Npizx+HpPPoA3QZcIlgFmQRhpbiOYBVQ5eUqXXIFihHOkoIpyTo7lH4le+ncRKkm+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QLX3cZ1W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46T0Mnk3021749;
	Mon, 29 Jul 2024 09:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m7Pz+WwT/MdZcCPf9EI5hI3gkf8LyJ4h4WvRd1mUXVY=; b=QLX3cZ1WSOwVn8MH
	u4tSE74cnMsk4yEbHbXKR4Fxhi8hvykVuLcbPfsreIxYGvcMZmRIR6IYiEzNydUV
	whKgeIuM9dnEqMrHXEdFU+13ng5y2Bdv3Xp6c3fvgQLWfzjP7Zxa98cUlhhIjn0m
	RSTA02aqjWGi1c0mdr3Fr4Ww9P04SiXDWjFQXwU6fcAtDqGMNYQuy3Y75b72I/oU
	tlIqmC1ps9bQjNxFMPpKqmlq8Zc/D7SbXxMzfPX+K2KodfqJTluh8ZCMGoJac3db
	cmUVX0vAiQGuBWAWzl83uxoiV4gOs/gO2oVkoVta4xLigBepxH/nlZwV3O/3ez2x
	eNXqyQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mrfxkr36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 09:51:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46T9p0Ze030806
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 09:51:00 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 02:50:52 -0700
Message-ID: <972803d2-eec3-4b67-b541-d3fd68475681@quicinc.com>
Date: Mon, 29 Jul 2024 17:50:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: net: qcom,ethqos: add description for
 qcs9100
To: Vinod Koul <vkoul@kernel.org>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        "Paolo
 Abeni" <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh
 Sharma <bhupesh.sharma@linaro.org>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <kernel@quicinc.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20240709-add_qcs9100_ethqos_compatible-v2-0-ba22d1a970ff@quicinc.com>
 <20240709-add_qcs9100_ethqos_compatible-v2-1-ba22d1a970ff@quicinc.com>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_ethqos_compatible-v2-1-ba22d1a970ff@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _kYcTH8GoA-YQKZUtBSHPmNd2bH7hQul
X-Proofpoint-ORIG-GUID: _kYcTH8GoA-YQKZUtBSHPmNd2bH7hQul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_07,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 bulkscore=0 phishscore=0 clxscore=1011 mlxscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290065



On 7/9/2024 10:13 PM, Tengfei Fan wrote:
> Add the compatible for the MAC controller on qcs9100 platforms.
> QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
> platform use non-SCMI resource. In the future, the SA8775p platform will
> move to use SCMI resources and it will have new sa8775p-related device
> tree. Consequently, introduce "qcom,qcs9100-ethqos" to describe non-SCMI
> based ethqos.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>   Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 1 +
>   Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 2 ++
>   2 files changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 6672327358bc..8ab11e00668c 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -20,6 +20,7 @@ properties:
>     compatible:
>       enum:
>         - qcom,qcs404-ethqos
> +      - qcom,qcs9100-ethqos
>         - qcom,sa8775p-ethqos
>         - qcom,sc8280xp-ethqos
>         - qcom,sm8150-ethqos
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 0ab124324eec..291252f2f30d 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -67,6 +67,7 @@ properties:
>           - loongson,ls2k-dwmac
>           - loongson,ls7a-dwmac
>           - qcom,qcs404-ethqos
> +        - qcom,qcs9100-ethqos
>           - qcom,sa8775p-ethqos
>           - qcom,sc8280xp-ethqos
>           - qcom,sm8150-ethqos
> @@ -611,6 +612,7 @@ allOf:
>                 - ingenic,x1830-mac
>                 - ingenic,x2000-mac
>                 - qcom,qcs404-ethqos
> +              - qcom,qcs9100-ethqos
>                 - qcom,sa8775p-ethqos
>                 - qcom,sc8280xp-ethqos
>                 - qcom,sm8150-ethqos
> 

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Let's close this session and ignore all the current patches here.
Thank you for your input.

-- 
Thx and BRs,
Tengfei Fan

