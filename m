Return-Path: <linux-arm-msm+bounces-35346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A08BC9A9A8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 09:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C0FC2823BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 07:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434FD1487DC;
	Tue, 22 Oct 2024 07:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MYDx15WK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A6813AD0;
	Tue, 22 Oct 2024 07:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729581072; cv=none; b=WCmQOhlY2ArxZjyk0jy0mIww4/02ZAkpqNkXruAzCfxDgpxp4nxBl96KNTXCXDa7EqVq8DACt/g14g+ywmO0KqRpEqzBGdPX+QgmJwk13dhch7uVK5A+iEDWBdKowOohaVoowL149sV0AuyNQd9FxZ4jXM4aqlUVx8hC3TE3Wus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729581072; c=relaxed/simple;
	bh=sPEuwBSR3z9y3MTbe3FDoGxkTkpW0+fBxiQSKk03EzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JIrU5bGa3pmswjlem+xJjx/ftx8RZq1rwODhW0prEUV9WDKQSPm0NIRJhWS5An61AbW/UUUifToO2IrfCV9+uwp+azF7Gm6WC2B/iBAsWp6vf/4UsObZa5hWRuiuYCtoV2scRwPE69OlmzRAEoNpz+Udt1oDW/vHgLA9jTndJzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MYDx15WK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LK9ROB016636;
	Tue, 22 Oct 2024 07:10:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f0IQoKdBA/MRiSCfEKMiX51wDhemHJ0XLpoojL22auE=; b=MYDx15WKF/XqGUal
	djfUY4kqzj+flN4lrqv05YuQV24D9uymttQIS1wuJaLlYvpV6ByAg10xwzTB1TZN
	8ulaYraPnI/R0whHMbeDJYdj0I0719u+Or6kcaW5joc7PsPSB4SL8QgV+voYxppP
	9jENBv4X6TGQbvQOK/GML38c5AQZ3qjFY9V1Bkn5zqoGB22M9R58JA+rK9SAxDAN
	RirgTKDb8sFH6asuZKrk7/jfHBbM3fjMVy7WLDQspF3okGn/GShpXFIJQVRzRqA5
	JbtaMUDQ5YgFTfvAybOwItbuyUQko/ssflKnVUJbooRkAXQvdOaYReupka+2ol7c
	eY17SA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmdqb7k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 07:10:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M7AvfS002562
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 07:10:57 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 00:10:53 -0700
Message-ID: <ec0f2cb4-1461-4eef-a441-d61cbe02804d@quicinc.com>
Date: Tue, 22 Oct 2024 12:40:50 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] clk: qcom: add support for GCC on SAR2130P
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Kalpak Kawadkar
	<quic_kkawadka@quicinc.com>
References: <20241021-sar2130p-clocks-v2-0-383e5eb123a2@linaro.org>
 <20241021-sar2130p-clocks-v2-8-383e5eb123a2@linaro.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <20241021-sar2130p-clocks-v2-8-383e5eb123a2@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ne6XEp-d1zFEcTtnSyCMasdCf3VIvZeF
X-Proofpoint-GUID: Ne6XEp-d1zFEcTtnSyCMasdCf3VIvZeF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 adultscore=0 mlxlogscore=796 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410220045



On 10/21/2024 4:00 PM, Dmitry Baryshkov wrote:
> Add driver for the Global Clock Controller as present on the Qualcomm
> SAR2130P platform. This is based on the msm-5.10 tree, tag
> KERNEL.PLATFORM.1.0.r4-00400-NEO.0.
> 
> Co-developed-by: Kalpak Kawadkar <quic_kkawadka@quicinc.com>
> Signed-off-by: Kalpak Kawadkar <quic_kkawadka@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/Kconfig        |    9 +
>   drivers/clk/qcom/Makefile       |    1 +
>   drivers/clk/qcom/gcc-sar2130p.c | 2326 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 2336 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e5d7c89b0dab6b4fc7133d8e348ae61d38f91770..5f7bf9db76cfcef1ab18a6ba09fb4dc506695f9d 100644
> --- a/drivers/clk/qcom/Kconfig

> +
> +static struct gdsc pcie_0_gdsc = {
> +	.gdscr = 0x7b004,
> +	.collapse_ctrl = 0x62200,
> +	.collapse_mask = BIT(0),
> +	.pd = {
> +		.name = "pcie_0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = VOTABLE | RETAIN_FF_ENABLE,
> +};
> +
> +static struct gdsc pcie_0_phy_gdsc = {
> +	.gdscr = 0x7c000,
> +	.collapse_ctrl = 0x62200,
> +	.collapse_mask = BIT(3),
> +	.pd = {
> +		.name = "pcie_0_phy_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = VOTABLE | RETAIN_FF_ENABLE,
> +};
> +
> +static struct gdsc pcie_1_gdsc = {
> +	.gdscr = 0x9d004,
> +	.collapse_ctrl = 0x62200,
> +	.collapse_mask = BIT(1),
> +	.pd = {
> +		.name = "pcie_1_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = VOTABLE | RETAIN_FF_ENABLE,
> +};
> +
> +static struct gdsc pcie_1_phy_gdsc = {
> +	.gdscr = 0x9e000,
> +	.collapse_ctrl = 0x62200,
> +	.collapse_mask = BIT(4),
> +	.pd = {
> +		.name = "pcie_1_phy_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = VOTABLE | RETAIN_FF_ENABLE,
> +};
> +
> +static struct gdsc usb30_prim_gdsc = {
> +	.gdscr = 0x49004,
> +	.pd = {
> +		.name = "usb30_prim_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = RETAIN_FF_ENABLE,
> +};
> +
> +static struct gdsc usb3_phy_gdsc = {
> +	.gdscr = 0x60018,
> +	.pd = {
> +		.name = "usb3_phy_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = RETAIN_FF_ENABLE,
> +};
> +
Dimtry, could you also add,
"hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc"
static struct gdsc hlos1_vote_mm_snoc_mmu_tbu_hf0_gdsc = {
         .gdscr = 0x8d204,
         .pd = {
                 .name = "hlos1_vote_mm_snoc_mmu_tbu_hf0_gdsc",
         },
         .pwrsts = PWRSTS_OFF_ON,
         .flags = VOTABLE,
};

"hlos1_vote_mmnoc_mmu_tbu_sf0_gdsc"   --> 0x8d054
"hlos1_vote_turing_mmu_tbu0_gdsc"   --> 0x8d05c	
"hlos1_vote_turing_mmu_tbu1_gdsc"   --> 0x8d060	



-- 
Thanks & Regards,
Taniya Das.

