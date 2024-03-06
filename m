Return-Path: <linux-arm-msm+bounces-13410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F01872F16
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 07:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 436301F27532
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 06:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D335C022;
	Wed,  6 Mar 2024 06:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IMjf5h+X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53025BAE3;
	Wed,  6 Mar 2024 06:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709708071; cv=none; b=XD9csXkR1MrTBzYTg+XMvkK3oqnDudPICnvZBIBdEggeKsGqW3DKrOvhMGBpYLilgraRS+5Xhy9OJ5uLRFpiTGbQHbjHUVHB1xnvo3qA8sS59HVtcO5JaUOdKB+OAZRyfvL+rpevRGNc7kXENftHgzSbSNn2IV3Vxa7hyHfpSZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709708071; c=relaxed/simple;
	bh=1qOQKAvtCcJsCaaHkuSKtoPNz2L4Fkp99UoD/Zm9yLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kxr6e50mPkoDZIO+uLktnDhGagTEH2FKnXGM8akJIYsecS5f0Od5RYlNoktty/hkFvsB2Ui1g/9zzZAYEZRT4I58flMakusqNNBl5m+ZNMBM56END3sL1+T5qp22HvOnlsTEUPpnAESQeA96KHElQeAa7ewwlEmGcs+2VGtPKPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IMjf5h+X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4266nOqd002518;
	Wed, 6 Mar 2024 06:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=GZoPrU/aBoJp7mFkb4ZVSLyBPiyrfEwQQRuH2k+moas=; b=IM
	jf5h+XB9KoIqD0tXrhYKvUWWjrbkGAxtkMkr7lgg4UDyP4ejOf8eDva4dQ5ZM9id
	ln6eNnJxoS/hZQtVcvjZoMaDq9pd5nxARZabEBMQCVyZmLl+HJ/lkKyfhuRaT69m
	nZPzcSGg3VMheiT20/JL3gTpCTTILXWU0MgV2X7q0NViGFih0HiGWOlowELXE5b+
	VXbwXTfEHRpjviQ+Wjm2UyUgTLA61Htx0pwWy3MiJih4FxbnBnju6LLL94LseUi6
	fM/pe6Xg8w7Zgq6MO1MCLNzRvsdqYxTJZmnm37A6Ph00vsVuXw7QBd0bMz8LVME/
	9kbo6sJXCk1sNa6yhtiQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wpepc8jtu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 06:54:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4266sOPN001388
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Mar 2024 06:54:24 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 5 Mar
 2024 22:54:20 -0800
Message-ID: <09ef8087-83ee-4dc3-b6a3-6c22d88c637d@quicinc.com>
Date: Wed, 6 Mar 2024 12:24:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: qcom: sc7280: Update the transition delay for
 GDSC
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad
 Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20240208062836.19767-1-quic_tdas@quicinc.com>
 <20240208062836.19767-4-quic_tdas@quicinc.com>
 <CAA8EJpoN5Q66Svq8fkCUDHbsGoYT0COOSH4vueyL1-Jk0AhkVw@mail.gmail.com>
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <CAA8EJpoN5Q66Svq8fkCUDHbsGoYT0COOSH4vueyL1-Jk0AhkVw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jpcDdzTHVYITwsgdGHFZP9-BuNfn_kBI
X-Proofpoint-ORIG-GUID: jpcDdzTHVYITwsgdGHFZP9-BuNfn_kBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_04,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403060054

Thanks for your review.

On 2/8/2024 12:33 PM, Dmitry Baryshkov wrote:
> On Thu, 8 Feb 2024 at 08:29, Taniya Das <quic_tdas@quicinc.com> wrote:
>>
>> The GDSC default values are being updated and they can cause issues
>> in the GDSC FSM state.
> 
> It reads as if new values can cause issues with the FSM.

Ah, sure, will update. The new values will resolve the FSM stability issues.

> 
>> While at it also update the force mem core
>> for UFS ICE clock.
> 
> Separate patch, please.
> 

Sure, will post in the next series.

>>
>> Fixes: fae7617bb142 ("clk: qcom: Add video clock controller driver for SC7280")
>> Fixes: 1daec8cfebc2 ("clk: qcom: camcc: Add camera clock controller driver for SC7280")
>> Fixes: a3cc092196ef ("clk: qcom: Add Global Clock controller (GCC) driver for SC7280")
>> Fixes: 3e0f01d6c7e7 ("clk: qcom: Add graphics clock controller driver for SC7280")
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   drivers/clk/qcom/camcc-sc7280.c   | 19 +++++++++++++++++++
>>   drivers/clk/qcom/gcc-sc7280.c     | 13 +++++++++++++
>>   drivers/clk/qcom/gpucc-sc7280.c   |  7 +++++++
>>   drivers/clk/qcom/videocc-sc7280.c |  7 +++++++
>>   4 files changed, 46 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/camcc-sc7280.c b/drivers/clk/qcom/camcc-sc7280.c
>> index 49f046ea857c..4849b0e8c846 100644
>> --- a/drivers/clk/qcom/camcc-sc7280.c
>> +++ b/drivers/clk/qcom/camcc-sc7280.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>>    * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>
>>   #include <linux/clk-provider.h>
>> @@ -2247,6 +2248,9 @@ static struct clk_branch cam_cc_sleep_clk = {
>>
>>   static struct gdsc cam_cc_titan_top_gdsc = {
>>          .gdscr = 0xc194,
>> +       .en_rest_wait_val = 0x2,
>> +       .en_few_wait_val = 0x2,
>> +       .clk_dis_wait_val = 0xf,
>>          .pd = {
>>                  .name = "cam_cc_titan_top_gdsc",
>>          },
>> @@ -2256,6 +2260,9 @@ static struct gdsc cam_cc_titan_top_gdsc = {
>>
>>   static struct gdsc cam_cc_bps_gdsc = {
>>          .gdscr = 0x7004,
>> +       .en_rest_wait_val = 0x2,
>> +       .en_few_wait_val = 0x2,
>> +       .clk_dis_wait_val = 0xf,
>>          .pd = {
>>                  .name = "cam_cc_bps_gdsc",
>>          },
>> @@ -2265,6 +2272,9 @@ static struct gdsc cam_cc_bps_gdsc = {
>>
>>   static struct gdsc cam_cc_ife_0_gdsc = {
>>          .gdscr = 0xa004,
>> +       .en_rest_wait_val = 0x2,
>> +       .en_few_wait_val = 0x2,
>> +       .clk_dis_wait_val = 0xf,
>>          .pd = {
>>                  .name = "cam_cc_ife_0_gdsc",
>>          },
>> @@ -2274,6 +2284,9 @@ static struct gdsc cam_cc_ife_0_gdsc = {
>>
>>   static struct gdsc cam_cc_ife_1_gdsc = {
>>          .gdscr = 0xb004,
>> +       .en_rest_wait_val = 0x2,
>> +       .en_few_wait_val = 0x2,
>> +       .clk_dis_wait_val = 0xf,
>>          .pd = {
>>                  .name = "cam_cc_ife_1_gdsc",
>>          },
>> @@ -2283,6 +2296,9 @@ static struct gdsc cam_cc_ife_1_gdsc = {
>>
>>   static struct gdsc cam_cc_ife_2_gdsc = {
>>          .gdscr = 0xb070,
>> +       .en_rest_wait_val = 0x2,
>> +       .en_few_wait_val = 0x2,
>> +       .clk_dis_wait_val = 0xf,
>>          .pd = {
>>                  .name = "cam_cc_ife_2_gdsc",
>>          },
>> @@ -2292,6 +2308,9 @@ static struct gdsc cam_cc_ife_2_gdsc = {
>>
>>   static struct gdsc cam_cc_ipe_0_gdsc = {
>>          .gdscr = 0x8004,
>> +       .en_rest_wait_val = 0x2,
>> +       .en_few_wait_val = 0x2,
>> +       .clk_dis_wait_val = 0xf,
>>          .pd = {
>>                  .name = "cam_cc_ipe_0_gdsc",
>>          },
>> diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
>> index 2b661df5de26..5f3bfb6f4fbb 100644
>> --- a/drivers/clk/qcom/gcc-sc7280.c
>> +++ b/drivers/clk/qcom/gcc-sc7280.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>>    * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>
>>   #include <linux/clk-provider.h>
>> @@ -3094,6 +3095,9 @@ static struct clk_branch gcc_wpss_rscp_clk = {
>>
>>   static struct gdsc gcc_pcie_0_gdsc = {
>>          .gdscr = 0x6b004,
>> +       .en_rest_wait_val = 0x2,
>> +       .en_few_wait_val = 0x2,
>> +       .clk_dis_wait_val = 0xf,
>>          .pd = {
>>                  .name = "gcc_pcie_0_gdsc",
>>          },
>> @@ -3112,6 +3116,9 @@ static struct gdsc gcc_pcie_1_gdsc = {
>>
>>   static struct gdsc gcc_ufs_phy_gdsc = {
>>          .gdscr = 0x77004,
>> +       .en_rest_wait_val = 0x2,
>> +       .en_few_wait_val = 0x2,
>> +       .clk_dis_wait_val = 0xf,
>>          .pd = {
>>                  .name = "gcc_ufs_phy_gdsc",
>>          },
>> @@ -3121,6 +3128,9 @@ static struct gdsc gcc_ufs_phy_gdsc = {
>>
>>   static struct gdsc gcc_usb30_prim_gdsc = {
>>          .gdscr = 0xf004,
>> +       .en_rest_wait_val = 0x2,
>> +       .en_few_wait_val = 0x2,
>> +       .clk_dis_wait_val = 0xf,
>>          .pd = {
>>                  .name = "gcc_usb30_prim_gdsc",
>>          },
>> @@ -3467,6 +3477,9 @@ static int gcc_sc7280_probe(struct platform_device *pdev)
>>          regmap_update_bits(regmap, 0x71004, BIT(0), BIT(0));
>>          regmap_update_bits(regmap, 0x7100C, BIT(13), BIT(13));
>>
>> +       /* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
>> +       qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
>> +
>>          ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
>>                          ARRAY_SIZE(gcc_dfs_clocks));
>>          if (ret)
>> diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
>> index 1490cd45a654..0eea4cf7954d 100644
>> --- a/drivers/clk/qcom/gpucc-sc7280.c
>> +++ b/drivers/clk/qcom/gpucc-sc7280.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>>    * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>
>>   #include <linux/clk-provider.h>
>> @@ -379,6 +380,9 @@ static struct clk_branch gpu_cc_sleep_clk = {
>>
>>   static struct gdsc cx_gdsc = {
>>          .gdscr = 0x106c,
>> +       .en_rest_wait_val = 0x2,
>> +       .en_few_wait_val = 0x2,
>> +       .clk_dis_wait_val = 0x2,
>>          .gds_hw_ctrl = 0x1540,
>>          .pd = {
>>                  .name = "cx_gdsc",
>> @@ -389,6 +393,9 @@ static struct gdsc cx_gdsc = {
>>
>>   static struct gdsc gx_gdsc = {
>>          .gdscr = 0x100c,
>> +       .en_rest_wait_val = 0x2,
>> +       .en_few_wait_val = 0x2,
>> +       .clk_dis_wait_val = 0x2,
>>          .clamp_io_ctrl = 0x1508,
>>          .pd = {
>>                  .name = "gx_gdsc",
>> diff --git a/drivers/clk/qcom/videocc-sc7280.c b/drivers/clk/qcom/videocc-sc7280.c
>> index 615695d82319..b07895c459e8 100644
>> --- a/drivers/clk/qcom/videocc-sc7280.c
>> +++ b/drivers/clk/qcom/videocc-sc7280.c
>> @@ -1,6 +1,7 @@
>>   // SPDX-License-Identifier: GPL-2.0-only
>>   /*
>>    * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>>    */
>>
>>   #include <linux/clk-provider.h>
>> @@ -232,6 +233,9 @@ static struct clk_branch video_cc_venus_ahb_clk = {
>>
>>   static struct gdsc mvs0_gdsc = {
>>          .gdscr = 0x3004,
>> +       .en_rest_wait_val = 0x2,
>> +       .en_few_wait_val = 0x2,
>> +       .clk_dis_wait_val = 0x6,
>>          .pd = {
>>                  .name = "mvs0_gdsc",
>>          },
>> @@ -241,6 +245,9 @@ static struct gdsc mvs0_gdsc = {
>>
>>   static struct gdsc mvsc_gdsc = {
>>          .gdscr = 0x2004,
>> +       .en_rest_wait_val = 0x2,
>> +       .en_few_wait_val = 0x2,
>> +       .clk_dis_wait_val = 0x6,
>>          .pd = {
>>                  .name = "mvsc_gdsc",
>>          },
>> --
>> 2.17.1
>>
>>
> 
> 

-- 
Thanks & Regards,
Taniya Das.

