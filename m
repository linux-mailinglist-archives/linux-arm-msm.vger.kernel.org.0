Return-Path: <linux-arm-msm+bounces-68250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 796A0B1FDAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 04:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 344A13B98F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 02:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EBD14B96E;
	Mon, 11 Aug 2025 02:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cD+oaK6I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5684A1D;
	Mon, 11 Aug 2025 02:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754878854; cv=none; b=uyt3qwlCNXk7GlYQ/oRdVj0m1bJl0h2pBQ0UDwXNF6vF3TMNgTifhokIMKj1QeCSet21biiZmieUH27sfdMc4Yr6ixpolw28hQlmx+CSaOUa5wD+G9DocrXNx4aC7jBxnXbm47gFXhJUnCZVjXnABGa+S/OZrAQ04XT4SVQIaq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754878854; c=relaxed/simple;
	bh=/opjgRjMfSh0lFLnsYLiUzjkiaZOnDym8h13cc60JgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AFUv39QsBkQEwEqz/tC3yGuC+u338F9x3kzojAd6WfA6P0XT2lyvFGweYKyUYWcc3CSmTd19LDV9JWlVVHJrZT4ieSm8o8fIf8YRbhb2HLNIHBiHIjtLSW6R5ADbE0jhuVLDOZyHvEfSS8GCXPbnP3VgHRoPQZvqE58aaercgoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cD+oaK6I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57AL9NH7015810;
	Mon, 11 Aug 2025 02:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QT4lXVvaW/eTxV1T5ssSnrh45y2dsnIoYRNfT7wkJDg=; b=cD+oaK6Ib16UH+J6
	ZzTL83BCYKOjE9oJEZpTdeE/AKWcL2cDNTxFTVJLWxN5qw/BBULnQ7JMjpM739jW
	+GzRj9yfZxwdjc8WQ0YVEQ/93eDrRBviRID+GsvzMi5p3DmPaT0oC6SzvHIKgt3K
	rXlKOK2k9iJJT1NQxMlFcOQZ2FMxIXx+UsQJmyDeX/EfIzdX1fYgIKIWYMPAk0uC
	VxSxO4U1BZ1WHlvJqYg3q6XL9oK1qsVjwqPJoyCZerisCunJJlo+O61qq6rEcQiu
	mhf6P1uSh67HNqAQmkn7n012YCr1T/q/VN1LJ0Hc7HoB7yRnK4pMYgLZnxFypFuj
	sITAdw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g2tnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 02:20:49 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57B2KndX028570
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 02:20:49 GMT
Received: from [10.239.31.29] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 10 Aug
 2025 19:20:46 -0700
Message-ID: <6a56824c-349d-4cbf-82bd-1e99551c5fc5@quicinc.com>
Date: Mon, 11 Aug 2025 10:20:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: sm6150: Add ADSP and CDSP fastrpc
 nodes
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250729031259.4190916-1-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Ling Xu <quic_lxu5@quicinc.com>
In-Reply-To: <20250729031259.4190916-1-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=68995381 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=aAF9b7ESmjIPvdmNWt0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfXxOAKOWtCSXQ+
 MCGuokueVSO4tNmYe2ieAznsK6t0RhszCaw5yNsUwgnr8x5O79SpiwJksktUVNiFJIFqHIf4w5I
 +hrj4ZMGexRqYkRfcJj7pgND7ne1ZjexxgYGIfYjsiFFKfQrN8MCcq2Sc8zd8LF+/V5CMa54yMJ
 smaOx3yXpC/cNAuieyZ+6zOkD0eNx/7zuFEALQtBEMx/QD5mIbsfrHbf8Wcu5odMyj+Ri9wPkTB
 eh8hWEhVC+mvR9dcZ1d5A0oD0v4nDiQ4WqMPdMwqBJxQ3qEQB6ZhPrPOd74BkvC95oSyZIihgPn
 73kI/xQ2DJiT6XXbQquI1eQs7+SENYI5/DG8ZWz6T5kvHgg2PV6Bdg+nnAd4vTaUkTTPxviYunu
 Ng7HUwrG
X-Proofpoint-GUID: fPLavUpciCQQf0yPvmN1HvGJY1eJIy5h
X-Proofpoint-ORIG-GUID: fPLavUpciCQQf0yPvmN1HvGJY1eJIy5h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-10_06,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

在 7/29/2025 11:12 AM, Ling Xu 写道:
> Add ADSP and CDSP fastrpc nodes for SM6150 platform.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
> V2 -> v3:
>   - Add nsessions.
> patch [v2]: https://lore.kernel.org/linux-arm-msm/20250703055532.2199477-1-quic_lxu5@quicinc.com/
> v1 -> v2:
>   - resend patch.
> Patch [v1]: https://lore.kernel.org/linux-arm-msm/20250523103853.1538813-1-quic_lxu5@quicinc.com/
> ---
>  arch/arm64/boot/dts/qcom/sm6150.dtsi | 87 ++++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> index e033b53f0f0f..b01a7511b71a 100644
> --- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
> @@ -3172,6 +3172,56 @@ glink-edge {
>  				mboxes = <&apss_shared 4>;
>  				label = "cdsp";
>  				qcom,remote-pid = <5>;
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "cdsp";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@1 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <1>;
> +						iommus = <&apps_smmu 0x1081 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@2 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <2>;
> +						iommus = <&apps_smmu 0x1082 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x1083 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@4 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <4>;
> +						iommus = <&apps_smmu 0x1084 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@5 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <5>;
> +						iommus = <&apps_smmu 0x1085 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@6 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <6>;
> +						iommus = <&apps_smmu 0x1086 0x0>;
> +						dma-coherent;
> +					};
> +				};
>  			};
>  		};
>  
> @@ -3844,6 +3894,43 @@ glink_edge: glink-edge {
>  				mboxes = <&apss_shared 24>;
>  				label = "lpass";
>  				qcom,remote-pid = <2>;
> +
> +				fastrpc {
> +					compatible = "qcom,fastrpc";
> +					qcom,glink-channels = "fastrpcglink-apps-dsp";
> +					label = "adsp";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					compute-cb@3 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <3>;
> +						iommus = <&apps_smmu 0x1723 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@4 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <4>;
> +						iommus = <&apps_smmu 0x1724 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@5 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <5>;
> +						iommus = <&apps_smmu 0x1725 0x0>;
> +						dma-coherent;
> +					};
> +
> +					compute-cb@6 {
> +						compatible = "qcom,fastrpc-compute-cb";
> +						reg = <6>;
> +						iommus = <&apps_smmu 0x1726 0x0>;
> +						qcom,nsessions = <5>;
> +						dma-coherent;
> +					};
> +				};
>  			};
>  		};
>  	};
Hi, this patch has been sent out for a long time, but it has not been checked yet.
Could you please kindly review this patch?
-- 
Thx and BRs,
Ling Xu


