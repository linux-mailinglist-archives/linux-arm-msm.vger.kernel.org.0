Return-Path: <linux-arm-msm+bounces-43812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF5AA00369
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 05:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDE1A162ADB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 04:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD05B200A0;
	Fri,  3 Jan 2025 04:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dRc857Z9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104A12F22;
	Fri,  3 Jan 2025 04:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735878114; cv=none; b=QEj3jFfm63A8xnr/T3S4h2j7PqIOBZn5bZWBJVPH3l5WLiwLIZZwZTeT7KKP1G+EOeb+n07odHD3+DuLTLOTkKCnprJRgc0wMcmg5J7h4tmvGPufUN38sPBKgN4xRbkxj2j+cDq0bXX0qx8rSMZ+mUMULPwPUMGz2E59W6us4l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735878114; c=relaxed/simple;
	bh=rUh+Jms2/cvZlBuLCtwSku5gU2f6s93rcjhzOGf1Nvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cdqltCnNhlTKT53YBvv0U+4aqWfnDaJgn7Zbrg0O/F80QrFRA+xWsCVvFm3bDV/pX031+IUmpObCLhAEj5pcJ9XpPBQCbIe0X4mnEPIxWMfFjdvOoDSc+bexplVhOPbts2z6hU35YiPo5E2H7KYmKSxvJONBA5HDrXc8m3uq8hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dRc857Z9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5030t2Gj008637;
	Fri, 3 Jan 2025 04:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	84y03jD3GZcQ7y+IdGpRQBmYmLIJsFO/lG++Ku79PMc=; b=dRc857Z90bSO/YR6
	Qw7epzEyKm0ZG5zkOSd1DsVflGDFoXyp+Y3/qoII2zdD7ZfdtWeNpd22hH5fZciC
	LNOsRzeJoLm8xhopnNWiRVCo7bn5hdQhdyoY9NICzHjGIqgpi3yYlQI3U7SykjdE
	6icn7D45xZp1r7bsZEH1IzXIGVB/F7rXLcwNg0D4TUOTIWtvRjCV2Ywo8PwReOaK
	VrNo5YXRSNJF1hhuKfD/vmDweYhZblqnYUX/QgxMc3WpcvalzhK1s+Y69RkPKvqe
	AEmPA1p9o8vtX8jQZQfiy2Tl2jLdZkGLCoPPolZ3XoB+6w67RxncHDihdiiOdkSR
	ztwZtQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43x5s0rbn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 04:21:35 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5034LZfH029417
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 04:21:35 GMT
Received: from [10.218.33.29] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 2 Jan 2025
 20:21:30 -0800
Message-ID: <acdf1267-ce56-4ec1-8407-a5f3212a8bfe@quicinc.com>
Date: Fri, 3 Jan 2025 09:51:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] clk: qcom: Add support for GPU Clock Controller on
 QCS8300
To: Bjorn Andersson <andersson@kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
References: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
 <20241106-qcs8300-mm-patches-v3-2-f611a8f87f15@quicinc.com>
 <xc7iiuwlbihb7dguq77el5ipt2w5324klyvojkyf2eh3lit6eh@zgj567elzljm>
Content-Language: en-US
From: Imran Shaik <quic_imrashai@quicinc.com>
In-Reply-To: <xc7iiuwlbihb7dguq77el5ipt2w5324klyvojkyf2eh3lit6eh@zgj567elzljm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Zh-LRNeAYkheVge3yxWIrwpXVZrFIbgL
X-Proofpoint-GUID: Zh-LRNeAYkheVge3yxWIrwpXVZrFIbgL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030035



On 12/27/2024 9:54 AM, Bjorn Andersson wrote:
> On Wed, Nov 06, 2024 at 03:21:57PM +0530, Imran Shaik wrote:
>> Add support to the QCS8300 GPU clock controller by extending
>> the SA8775P GPU clock controller, which is mostly identical
>> but QCS8300 has few additional clocks and minor differences.
>>
> 
> What does "mostly identical" mean?
> 
> Is QCS8300 a derivative of SA8775P? Or is it just by accident that these
> two SoCs happens to have almost the same set of clocks?
> 

Yes, QCS8300 is a derivative of SA8775P.

> 
> Also, commit messages should follow the flow described in
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes.
> 

Sure, I will update the commit text with above details and post next series.

Thanks,
Imran

> Regards,
> Bjorn
> 
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
>> ---
>>  drivers/clk/qcom/gpucc-sa8775p.c | 49 +++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 48 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/gpucc-sa8775p.c b/drivers/clk/qcom/gpucc-sa8775p.c
>> index f8a8ac343d70..78cad622cb5a 100644
>> --- a/drivers/clk/qcom/gpucc-sa8775p.c
>> +++ b/drivers/clk/qcom/gpucc-sa8775p.c
>> @@ -12,7 +12,7 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/regmap.h>
>>  
>> -#include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
>> +#include <dt-bindings/clock/qcom,qcs8300-gpucc.h>
>>  
>>  #include "clk-alpha-pll.h"
>>  #include "clk-branch.h"
>> @@ -317,6 +317,24 @@ static struct clk_branch gpu_cc_crc_ahb_clk = {
>>  	},
>>  };
>>  
>> +static struct clk_branch gpu_cc_cx_accu_shift_clk = {
>> +	.halt_reg = 0x95e8,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x95e8,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data){
>> +			.name = "gpu_cc_cx_accu_shift_clk",
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&gpu_cc_xo_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>>  static struct clk_branch gpu_cc_cx_ff_clk = {
>>  	.halt_reg = 0x914c,
>>  	.halt_check = BRANCH_HALT,
>> @@ -420,6 +438,24 @@ static struct clk_branch gpu_cc_demet_clk = {
>>  	},
>>  };
>>  
>> +static struct clk_branch gpu_cc_gx_accu_shift_clk = {
>> +	.halt_reg = 0x95e4,
>> +	.halt_check = BRANCH_HALT,
>> +	.clkr = {
>> +		.enable_reg = 0x95e4,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data){
>> +			.name = "gpu_cc_gx_accu_shift_clk",
>> +			.parent_hws = (const struct clk_hw*[]){
>> +				&gpu_cc_xo_clk_src.clkr.hw,
>> +			},
>> +			.num_parents = 1,
>> +			.flags = CLK_SET_RATE_PARENT,
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
>>  static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
>>  	.halt_reg = 0x7000,
>>  	.halt_check = BRANCH_HALT_VOTED,
>> @@ -499,6 +535,7 @@ static struct clk_regmap *gpu_cc_sa8775p_clocks[] = {
>>  	[GPU_CC_AHB_CLK] = &gpu_cc_ahb_clk.clkr,
>>  	[GPU_CC_CB_CLK] = &gpu_cc_cb_clk.clkr,
>>  	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
>> +	[GPU_CC_CX_ACCU_SHIFT_CLK] = NULL,
>>  	[GPU_CC_CX_FF_CLK] = &gpu_cc_cx_ff_clk.clkr,
>>  	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
>>  	[GPU_CC_CX_SNOC_DVM_CLK] = &gpu_cc_cx_snoc_dvm_clk.clkr,
>> @@ -508,6 +545,7 @@ static struct clk_regmap *gpu_cc_sa8775p_clocks[] = {
>>  	[GPU_CC_DEMET_DIV_CLK_SRC] = &gpu_cc_demet_div_clk_src.clkr,
>>  	[GPU_CC_FF_CLK_SRC] = &gpu_cc_ff_clk_src.clkr,
>>  	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
>> +	[GPU_CC_GX_ACCU_SHIFT_CLK] = NULL,
>>  	[GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK] = &gpu_cc_hlos1_vote_gpu_smmu_clk.clkr,
>>  	[GPU_CC_HUB_AHB_DIV_CLK_SRC] = &gpu_cc_hub_ahb_div_clk_src.clkr,
>>  	[GPU_CC_HUB_AON_CLK] = &gpu_cc_hub_aon_clk.clkr,
>> @@ -583,6 +621,7 @@ static const struct qcom_cc_desc gpu_cc_sa8775p_desc = {
>>  };
>>  
>>  static const struct of_device_id gpu_cc_sa8775p_match_table[] = {
>> +	{ .compatible = "qcom,qcs8300-gpucc" },
>>  	{ .compatible = "qcom,sa8775p-gpucc" },
>>  	{ }
>>  };
>> @@ -596,6 +635,14 @@ static int gpu_cc_sa8775p_probe(struct platform_device *pdev)
>>  	if (IS_ERR(regmap))
>>  		return PTR_ERR(regmap);
>>  
>> +	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcs8300-gpucc")) {
>> +		gpu_cc_pll0_config.l = 0x31;
>> +		gpu_cc_pll0_config.alpha = 0xe555;
>> +
>> +		gpu_cc_sa8775p_clocks[GPU_CC_CX_ACCU_SHIFT_CLK] = &gpu_cc_cx_accu_shift_clk.clkr;
>> +		gpu_cc_sa8775p_clocks[GPU_CC_GX_ACCU_SHIFT_CLK] = &gpu_cc_gx_accu_shift_clk.clkr;
>> +	}
>> +
>>  	clk_lucid_evo_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
>>  	clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
>>  
>>
>> -- 
>> 2.25.1
>>


