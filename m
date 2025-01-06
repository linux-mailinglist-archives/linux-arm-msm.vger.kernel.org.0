Return-Path: <linux-arm-msm+bounces-43972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0599A02097
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 09:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A031188400E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 08:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C1C1D7E26;
	Mon,  6 Jan 2025 08:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ntIW2Ucl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A39C43172;
	Mon,  6 Jan 2025 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736151874; cv=none; b=Da7smeQEJPItsoS32YM/iDehN1izKmtEdMufL3cEoH9aiv4BEaqQPjFA4mKN09GFbo900/JeLnN2i8pQFtzOxR8h1a0n6z8ZfhurZ1msZViMBWbhZgZ7DTP1VxNlSFEXk4ml5fkElSKkbULc14RCe2ufDhZfAalEc3bMdCzD+Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736151874; c=relaxed/simple;
	bh=oRXVX86Laixd4oEhkFgwwVzzPKdGGwAAqM1PingMaE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hmtg8IxR+uMD3NyFCLWe18ImowRNi/cqyByy19Tzx0ES744FW9feO6SzyRCEq70Xqv7hQ6S9/I2reuMaqDlvmmxy88lM3mpM4hk3191NzTU8tEtVxvBILaz1I8hNID8RRgvmvEiw9mz0Wg3PVumUC442vhV3N3wzG/jP5EBBjmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ntIW2Ucl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506108so017057;
	Mon, 6 Jan 2025 08:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TkxjHY//hO1M4mWItH9NDptf5U2R1G1JfOI9BrUXs4Y=; b=ntIW2UcleowNSe9l
	jB73CcWuMJOlKyDUlKfCC9SNzRGQTrLTVMUEND7TPjy6wBqTJ5WEotFYbxaUERyL
	jpOyg2/5p27ugzKD4DEzgebnYq3syatfzxBFAnCCMKckELFycxwZ/qmt978xWZwR
	uPWpKHervQMesK+uC4ea697M3O4+OFw1TDGU44DhgBFQ1PtJraXcApqjejr0SY/E
	aUVzEBXJP3OX1MRXaCpfqilteC0uvFIyh67Hlf94J2VWljZwIzuFmqM9J5fmuYfo
	sWmkG64hIRxjD7rFCU/reXPTtVD9Nsu85jwwWxeuxdGEH+PEisLL6hClOLIJs2dj
	StO72Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44054egu3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 08:24:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5068ORH4018642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Jan 2025 08:24:27 GMT
Received: from [10.64.68.205] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 Jan 2025
 00:24:24 -0800
Message-ID: <38c8d6b4-8c0a-4317-afaf-7aacdb2bdb31@quicinc.com>
Date: Mon, 6 Jan 2025 16:24:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: mailbox: qcom,apcs-kpss-global:
 Document the qcs615 APSS
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <quic_sudeepgo@quicinc.com>,
        <quic_taozhan@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20241018073417.2338864-1-quic_chunkaid@quicinc.com>
 <20241018073417.2338864-2-quic_chunkaid@quicinc.com>
Content-Language: en-US
From: Kyle Deng <quic_chunkaid@quicinc.com>
In-Reply-To: <20241018073417.2338864-2-quic_chunkaid@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qHKctYKS_eKio1tUYznzeepdFN4ZbJer
X-Proofpoint-ORIG-GUID: qHKctYKS_eKio1tUYznzeepdFN4ZbJer
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1011
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501060073

Gentle ping.
There are a total of three patches in this series, and the other two have been applied, but this seems to have been overlooked. Thanks!

On 2024/10/18 15:34, Kyle Deng wrote:
> Add compatible for the Qualcomm qcs615 mailbox block.
> QCS615 mailbox is compatible with SDM845 use fallback for it.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
> ---
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> index 982c741e6225..54deb5740d66 100644
> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
> @@ -44,6 +44,7 @@ properties:
>            - const: qcom,msm8994-apcs-kpss-global
>        - items:
>            - enum:
> +              - qcom,qcs615-apss-shared
>                - qcom,sc7180-apss-shared
>                - qcom,sc8180x-apss-shared
>                - qcom,sm8150-apss-shared


