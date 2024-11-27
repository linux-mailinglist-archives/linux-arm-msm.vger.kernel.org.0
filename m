Return-Path: <linux-arm-msm+bounces-39274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2382A9DA3F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 09:31:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C232E160F29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 08:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915991527AC;
	Wed, 27 Nov 2024 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oB91C0S/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD24C133;
	Wed, 27 Nov 2024 08:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732696306; cv=none; b=mCdyNtEM0aaKo7lQ5GZnIay0JcVRtRlQQEu6iBoj0bpQDs1LU1bPq62CMO/5AYwdfNgh3C9AR06ewy/4aam2TftNjetLM9qxmJQ4dq7ExzhN3fcivLSjmc8cAuNys9TjnGSwUXJszk5BIoitn07+T7r+TOAY0xQyQYCXFfq7U0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732696306; c=relaxed/simple;
	bh=ajpsbfzjEK/tc5dS0pljHlmhCXF2KW2ug2gy+Xc9aLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lfiY+TtrFooWvnwMlbKSDJCWhFM8G/z9H3b7z2tQbY2kRABZFiiJs6+K6W15lTYabS2KQwEgzGRd1gKIazayQmQt7jKtCW2k59/hnph6s0oAQkNf+jhIr4yYcZDKncOt7LIkH7aCbyhGOhjKVzakA/YlnsNi6wQf+xQBZ1gnv9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oB91C0S/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQKLX80007146;
	Wed, 27 Nov 2024 08:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iev3WZdFrLdARm1wihK+wRwRDy+pVq1zEka0DtX4iB4=; b=oB91C0S/flf+a/oD
	/V/4csssAIOekJl3T2AM5RenLKWlc4FctOrjZKbqh/t2yRV+r5ozcA/h6nDgjvHS
	ApwqAcxHGwUnCRdor2C8//sIYYz9+/pkrJwa0YR+n7+AP2ztnAuVCHMY+Avg0jgI
	zM8O76wHVoiaK2/cTKt+1b7V+7v5OVX+ZHc4XMyBNXIhOnxoynGQ6hHRgFfuhsN9
	E270nwjhjkZCclKeAOdLKZloFgKWPKriDcNVm1oQyGQ49GAY8nON0YpYr0KlMZHL
	h6lCc/QpUx4dQvmK8VE6sA/N9SZ9mAuln+1gEJUUjBdePrXaHj/eX2J7ZC4++nQ0
	JRSEqA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434sw9e1cf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 08:31:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR8VdUb023552
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 08:31:40 GMT
Received: from [10.233.17.145] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 27 Nov
 2024 00:31:37 -0800
Message-ID: <2f7adf9c-d816-4281-a690-be2067587475@quicinc.com>
Date: Wed, 27 Nov 2024 16:31:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] arm64: dts: qcom: sm8450: move board clocks to
 DTS files
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20241115-fix-board-clocks-v1-0-8cb00a4f57c2@linaro.org>
 <20241115-fix-board-clocks-v1-1-8cb00a4f57c2@linaro.org>
From: Tingwei Zhang <quic_tingweiz@quicinc.com>
In-Reply-To: <20241115-fix-board-clocks-v1-1-8cb00a4f57c2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: v0AEjUCT5QjzkXmDFj_yrGU4vy5QGp-2
X-Proofpoint-ORIG-GUID: v0AEjUCT5QjzkXmDFj_yrGU4vy5QGp-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411270070

On 11/15/2024 2:59 PM, Dmitry Baryshkov wrote:
> SM8450 is one of the platforms where board-level clocks (XO, sleep) are
> fully defined in the SoC dtsi file. This is not correct and doesn't
> fully follow the DT guidelines. Move these two clocks to the board files
> completely.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450-hdk.dts                 | 14 ++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8450-qrd.dts                 | 14 ++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi | 14 ++++++++++++++
>   arch/arm64/boot/dts/qcom/sm8450.dtsi                    | 14 --------------
>   4 files changed, 42 insertions(+), 14 deletions(-)
> 
<...>
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 53147aa6f7e4acb102dd5dee51f0aec164b971c7..7dc183cc5c29374a19aabb36086e27edfffeaf37 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -33,20 +33,6 @@ / {
>   
>   	chosen { };
>   
> -	clocks {
> -		xo_board: xo-board {
> -			compatible = "fixed-clock";
> -			#clock-cells = <0>;
> -			clock-frequency = <76800000>;
> -		};
> -
> -		sleep_clk: sleep-clk {
> -			compatible = "fixed-clock";
> -			#clock-cells = <0>;
> -			clock-frequency = <32000>;
> -		};
> -	};
> -
Sleep clock is moved to board device tree while reference of this clock 
is still in soc device tree like gcc node. Is this preferrable way to 
reference the node defined in board device in soc device tree?
>   	cpus {
>   		#address-cells = <2>;
>   		#size-cells = <0>;
> 


-- 
Thanks,
Tingwei

