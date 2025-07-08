Return-Path: <linux-arm-msm+bounces-63962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9518EAFC212
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 07:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73F281AA59AA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 05:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 612D921767A;
	Tue,  8 Jul 2025 05:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jxHt0D21"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961E1215766;
	Tue,  8 Jul 2025 05:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751952907; cv=none; b=VH1KWMt9YmB3loh9JT1jbyQcalgaguDutvRcwgb/cStxgJt30Y7KKJuxwSH6oPr64nHyROa7GKC+7F1FvitYkLY6phJ0hUmmR+wdM14JoYC3eDo8wMKytiofIstbZJBHxd2UoS2Tm1AJKc71WKX6C87IqsxRHCg22L5Od1WhYoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751952907; c=relaxed/simple;
	bh=lcKmR8z1bwwHYuaXERzEnvv+kx5ST+1SMKtrtEjJSFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VX/irxdj5Nra0jbDnEOhTGlFmISQ4DObPT9mPFOku6HuwwL/FrUJlgl8GQ4yEJCSfLXhbEkLCp11TC1eejHx63xgZJnE4hvJPAUiDfhvDYbcgMhgJI2Kc+Ex4t/6ZNVVVSqOOrFCnXi2L+XPptez3oSuL119Xcy9fOSOFW0ShUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jxHt0D21; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567JWFhd013480;
	Tue, 8 Jul 2025 05:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XtuHaS2Jy0WZwH886iYibgw3OhQQrZROgwm063n+NXU=; b=jxHt0D217di6eQEd
	cma6cOR9FaSdfHTCgngaE2Gp4Nb4BSJF0mqVjDV1w3Mv5YpPzLBh3s3PDyNHxgmi
	SDLoIoZ65gDHJe+fByq6sSsmmCXUaYos8iwECtqGKMjNGdicwI6Z6KjGWnk2T5H8
	jt5YMcxetxz2ol5F9hu3p9wczI/xEUSywQ34VBR+8NnjppIHJIXX/Q3KZQRsya2Y
	mM1kf0hkD0zf0dBsVUvFAgCOFAlXu8RKM1pdXy+mdXXWueSnLeOHQ4uH48ODiQoG
	3WGDtx+p+A5UQIm9R3gIwY7OiAdrULojcIQzAuCcc82kARxWm6pvSb2YKV8tdYhF
	plMRQQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucmu7e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 05:34:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5685YvOi023571
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Jul 2025 05:34:57 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 7 Jul
 2025 22:34:52 -0700
Message-ID: <64e27035-d124-470a-bc5b-66d254b6ff4f@quicinc.com>
Date: Tue, 8 Jul 2025 11:04:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] clk: qcom: common: Add support to register rcg
 dfs in qcom_cc_really_probe
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-1-9e47a7c0d47f@fairphone.com>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <20250704-sm7635-clocks-v2-1-9e47a7c0d47f@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686cae02 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8
 a=swBEb3uj_lsU-R2XRLEA:9 a=QEXdDO2ut3YA:10 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: RsgZlGII8_YBqFYUaCg9nb2PTHZOM0OZ
X-Proofpoint-ORIG-GUID: RsgZlGII8_YBqFYUaCg9nb2PTHZOM0OZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA0MiBTYWx0ZWRfX1iredXkGUtyG
 6/gxBZ5AmOh7EbeSGu9WMjidjMHO39W/grqJFQgbuWkghyrgrhpfnRQD5qpMVdts10dJr25k9S3
 c6NJ+5iMmVysNWVyj2xtSa0vE9KKkuoqfkVBoay/bCFO2aEI7FJwWBXruTGaFoK+n3g21vt7NNy
 wSISqhzPgTUmfji0nCt+1zMXvm7ypkK3u0U3qfeqk2/iJNOp+rQogtxX0g0ObcgI0YQOxCgOFzB
 SOyGcRTCDJrxLEXP3JiIRDfrPHuMjxYnmGtaXVVCup3sLu0fPMKwRkkDCFK0VA+0fGsHlTUZOdw
 2Vd24DIWLlRSPXZKpZaMBdvwuXYuDIrQkpr4lnck4fohOKNd/rv+bJ0z5tm7V5txnqqvyJF3jI0
 wQgnYKJkXARMk4yhdj5LB719gcqnoHMwbXRVBfXh/3WrgSMEC/GlFRcjI9/CTCBjcbGB0aQ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080042



On 7/4/2025 12:46 PM, Luca Weiss wrote:
> Add support to register the rcg dfs in qcom_cc_really_probe(). This
> allows users to move the call from the probe function to static
> properties.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/clk/qcom/common.c | 8 ++++++++
>  drivers/clk/qcom/common.h | 2 ++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index b3838d885db25f183979576e5c685c07dc6a7049..d53f290c6121f31d06cf244f72603b694966e216 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -390,6 +390,14 @@ int qcom_cc_really_probe(struct device *dev,
>  			goto put_rpm;
>  	}
>  
> +	if (desc->dfs_rcgs && desc->num_dfs_rcgs) {
> +		ret = qcom_cc_register_rcg_dfs(regmap,
> +					       desc->dfs_rcgs,
> +					       desc->num_dfs_rcgs);
> +		if (ret)
> +			goto put_rpm;
> +	}
> +
>  	cc->rclks = rclks;
>  	cc->num_rclks = num_clks;
>  
> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> index 0f4b2d40c65cf94de694226f63ca30f4181d0ce5..dbe7ebe5b8710fb03c1671ac9022e608a6aad35f 100644
> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -43,6 +43,8 @@ struct qcom_cc_desc {
>  	size_t num_gdscs;
>  	struct clk_hw **clk_hws;
>  	size_t num_clk_hws;
> +	const struct clk_rcg_dfs_data *dfs_rcgs;
> +	size_t num_dfs_rcgs;

Since all other probe configurations are added in qcom_cc_driver_data struct, it is better to
add rcg dfs data also to qcom_cc_driver_data struct instead of qcom_cc_desc.

Thanks,
Jagadeesh

>  	const struct qcom_icc_hws_data *icc_hws;
>  	size_t num_icc_hws;
>  	unsigned int icc_first_node_id;
> 

