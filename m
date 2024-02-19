Return-Path: <linux-arm-msm+bounces-11656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 812FA85A1A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 12:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1ED11C213F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 11:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CE32C1AF;
	Mon, 19 Feb 2024 11:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="INjnkdW+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1535F286AE;
	Mon, 19 Feb 2024 11:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708341110; cv=none; b=NV9or2QlLQSQFdbB2sqxdV9fXFYxtpLYQKFseJ/uZunjw6zX+0BkgBlaVMLrFG5dP/KydAcqx1gnZU4bMrKzHVzGKr63C4EJZrxlE82m3z011FmFchUJPRkjzKRqkISTWP67hHjKbFJkSt9Gwbn2k10zLaiXB4CumYDvFaKgUAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708341110; c=relaxed/simple;
	bh=N8Wc2A2x+AX9v1UAgOeCUhZTl7ybMLR1KIV2BQcvplM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CuzbbzmoS5Pnc2IZiPjF6AJfUmano9SDcpDbEFiumQ2A0ZDyKYfQht/QrwaDGFUgN/eCxmtbEmWrK5j9s9gS4URhjYT26JvT/8ZU+uceZfB4oIRpSAV5iDXo5wq/peUXZcqZK/ZmUtlZopD6f6BGL21iSa1cLCyB6JN5x03phhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=INjnkdW+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41J4t1bg018240;
	Mon, 19 Feb 2024 11:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=fQBAGAQO/zpQNFrPNgleWNacPKiVYs/bLQjyJqo0rHE=; b=IN
	jnkdW+JW31DoYXVExuHwYxg2aKLV8Rbb84u9vU5zhdbcko9q/CCQ66YWs4fkfKW8
	jsRk3BCdcHUfb+faC1u51qp+jpxEfYOaaWl4mExrFWVwH07Wg4GDo5fy8aaO+sDw
	J6KGgIaLDM77o0m2UYedkmI403tigVP8orF7CoqdeIL+UjqsZYcYlVvCI3wpmghZ
	KlfdVwPfyRwF6NxsvrcRSSKEgxOxR/GCf6RSTTEATsr7+cqqBLKFZH/xigjemOnj
	MV+WcMNucffDRuGxI8GxruVKCH3LbkJNjd9B/HOkrnLR8wh2BXSPa8VlaNO/vgVH
	+iORCowLF/V4qUzFfkNg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3waqmdueaj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Feb 2024 11:11:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41JBBh0V014869
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Feb 2024 11:11:43 GMT
Received: from [10.131.33.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 19 Feb
 2024 03:11:40 -0800
Message-ID: <7a91085e-197b-7a05-577e-e3aae36d209c@quicinc.com>
Date: Mon, 19 Feb 2024 16:41:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] dt-bindings: clk: qcom: drop the SC7180 Modem
 subsystem clock controller
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael
 Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240216-drop-sc7180-mss-v1-0-0a8dc8d71c0c@linaro.org>
 <20240216-drop-sc7180-mss-v1-2-0a8dc8d71c0c@linaro.org>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <20240216-drop-sc7180-mss-v1-2-0a8dc8d71c0c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HCZ5DcAYMdTPtF7M3BCOedwaPrJiK2rC
X-Proofpoint-ORIG-GUID: HCZ5DcAYMdTPtF7M3BCOedwaPrJiK2rC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-19_08,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 mlxlogscore=926
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402190084



On 2/16/24 16:44, Dmitry Baryshkov wrote:
> This clock controller has never been used in the DT files merged to the
> kernel. According to Sibi, it only worked on the pre-production devices.
> For the production devices this functionality has been moved to the
> firmware.
> 
> Drop the bindings now after dropping the driver itself.
> 
> Cc: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Sibi Sankar <quic_sibis@quicinc.com>

> ---
>   .../devicetree/bindings/clock/qcom,sc7180-mss.yaml | 61 ----------------------
>   1 file changed, 61 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml
> deleted file mode 100644
> index 873a2f918bac..000000000000
> --- a/Documentation/devicetree/bindings/clock/qcom,sc7180-mss.yaml
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

[...]

> -...
> 

