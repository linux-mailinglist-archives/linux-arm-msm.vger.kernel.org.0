Return-Path: <linux-arm-msm+bounces-239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D907E66E6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 10:37:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B78EB20C3F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 09:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2FB12B98;
	Thu,  9 Nov 2023 09:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="co7Eb3E8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE0A134A2;
	Thu,  9 Nov 2023 09:36:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142762702;
	Thu,  9 Nov 2023 01:36:58 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A96inKv031062;
	Thu, 9 Nov 2023 09:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GcJK9lbzyXibo8zNkgD9SGW2SuPKTMTtlGyu6iZHRgo=;
 b=co7Eb3E8sI3u+7bM/hMH6LeM117fZO7qwsSiaBhnqgnbcXgXqZxCX0lG1DNGSGO8If1f
 G8XLwvmVssy6YWoFUvxD01uvz/tmanNHUJjcKi8K9HzNHiVjHL0cMHyyTUApVRthLLPe
 ma4RQuiPjoL187qk4QoAUvubLwDYoVtnCVQsKuhOVhcG8u/6+GTuzr3z1+diqLOrl04p
 uc7rfFApwEgmKAPDDrKHwbbOkmC8+pqPBmtM2ZRkMUiYlq9a9Yy+rN6dpiVo/RngIz71
 jDfbEV+gesqiX4MZc9YHV6QKPaJh2PRDHEohCTEaYgL5lQyHoFftJSn4QXiBpEpUuccO Pg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u8tcrrmgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Nov 2023 09:36:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A99ap7Z018643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Nov 2023 09:36:51 GMT
Received: from [10.217.219.216] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 9 Nov
 2023 01:36:44 -0800
Message-ID: <d2556aad-24cc-c0d1-d71d-bf43bc832036@quicinc.com>
Date: Thu, 9 Nov 2023 15:06:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v2 2/3] phy: qcom-qmp-pcie: Add endpoint refclk control
 register offset
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_vbadigan@quicinc.com>,
        <quic_ramkri@quicinc.com>, <quic_nitegupt@quicinc.com>,
        <quic_skananth@quicinc.com>, <quic_vpernami@quicinc.com>,
        <quic_parass@quicinc.com>
References: <20231107-refclk_always_on-v2-0-de23962fc4b3@quicinc.com>
 <20231107-refclk_always_on-v2-2-de23962fc4b3@quicinc.com>
 <CAA8EJpr8Y+k2FJqFfZVagWxfgsUEnZ1010-xaaUg=c6tqu8Hsw@mail.gmail.com>
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <CAA8EJpr8Y+k2FJqFfZVagWxfgsUEnZ1010-xaaUg=c6tqu8Hsw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PGBEJB1BBUJIrD9anw0X-I4LZqZyZmL4
X-Proofpoint-ORIG-GUID: PGBEJB1BBUJIrD9anw0X-I4LZqZyZmL4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_08,2023-11-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311090076


On 11/7/2023 6:36 PM, Dmitry Baryshkov wrote:
> On Tue, 7 Nov 2023 at 14:26, Krishna chaitanya chundru
> <quic_krichai@quicinc.com> wrote:
>> Some platforms needs to keep endpoint refclk always on, for this
>> purpose add this offset for all the applicable phy versions.
>>
>> And also add reg layout for few controllers as we are adding
>> endpoint refclk control register which changes based upon phy version.
>>
>> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 26 +++++++++++++++++++---
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h    |  1 +
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |  1 +
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6_20.h |  1 +
>>   4 files changed, 26 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> index a63ca7424974..74d03d217ff2 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> @@ -77,6 +77,7 @@ enum qphy_reg_layout {
>>          QPHY_START_CTRL,
>>          QPHY_PCS_STATUS,
>>          QPHY_PCS_POWER_DOWN_CONTROL,
>> +       QPHY_PCS_ENDPOINT_REFCLK_CNTRL,
>>          /* Keep last to ensure regs_layout arrays are properly initialized */
>>          QPHY_LAYOUT_SIZE
>>   };
>> @@ -93,6 +94,7 @@ static const unsigned int pciephy_v3_regs_layout[QPHY_LAYOUT_SIZE] = {
>>          [QPHY_START_CTRL]               = QPHY_V3_PCS_START_CONTROL,
>>          [QPHY_PCS_STATUS]               = QPHY_V3_PCS_PCS_STATUS,
>>          [QPHY_PCS_POWER_DOWN_CONTROL]   = QPHY_V3_PCS_POWER_DOWN_CONTROL,
>> +       [QPHY_PCS_ENDPOINT_REFCLK_CNTRL]        = QPHY_V3_PCS_ENDPOINT_REFCLK_CNTRL,
>>   };
>>
>>   static const unsigned int sdm845_qhp_pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
>> @@ -107,6 +109,7 @@ static const unsigned int pciephy_v4_regs_layout[QPHY_LAYOUT_SIZE] = {
>>          [QPHY_START_CTRL]               = QPHY_V4_PCS_START_CONTROL,
>>          [QPHY_PCS_STATUS]               = QPHY_V4_PCS_PCS_STATUS1,
>>          [QPHY_PCS_POWER_DOWN_CONTROL]   = QPHY_V4_PCS_POWER_DOWN_CONTROL,
>> +       [QPHY_PCS_ENDPOINT_REFCLK_CNTRL]        = QPHY_V4_PCS_PCIE_ENDPOINT_REFCLK_CNTRL,
>>   };
>>
>>   static const unsigned int pciephy_v5_regs_layout[QPHY_LAYOUT_SIZE] = {
>> @@ -114,6 +117,23 @@ static const unsigned int pciephy_v5_regs_layout[QPHY_LAYOUT_SIZE] = {
>>          [QPHY_START_CTRL]               = QPHY_V5_PCS_START_CONTROL,
>>          [QPHY_PCS_STATUS]               = QPHY_V5_PCS_PCS_STATUS1,
>>          [QPHY_PCS_POWER_DOWN_CONTROL]   = QPHY_V5_PCS_POWER_DOWN_CONTROL,
>> +       [QPHY_PCS_ENDPOINT_REFCLK_CNTRL]        = QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_CNTRL,
>> +};
>> +
>> +static const unsigned int pciephy_v5_20_regs_layout[QPHY_LAYOUT_SIZE] = {
>> +       [QPHY_SW_RESET]                 = QPHY_V5_PCS_SW_RESET,
>> +       [QPHY_START_CTRL]               = QPHY_V5_PCS_START_CONTROL,
>> +       [QPHY_PCS_STATUS]               = QPHY_V5_PCS_PCS_STATUS1,
>> +       [QPHY_PCS_POWER_DOWN_CONTROL]   = QPHY_V5_PCS_POWER_DOWN_CONTROL,
> Nit: we should probably define V5_20 and v6_20 versions of these registers

We don't have separate defines for v5_20 and v6_20 for these registers, 
that is why we are using these.

And the offsets are same for those version. That is why I tried to use 
macros.

- Krishna Chaitanya.

> If you were to send v3 for any reason, could you please add them?
>
>> +       [QPHY_PCS_ENDPOINT_REFCLK_CNTRL]        = QPHY_V5_20_PCS_PCIE_ENDPOINT_REFCLK_CNTRL,
>> +};
>> +
>> +static const unsigned int pciephy_v6_20_regs_layout[QPHY_LAYOUT_SIZE] = {
>> +       [QPHY_SW_RESET]                 = QPHY_V5_PCS_SW_RESET,
>> +       [QPHY_START_CTRL]               = QPHY_V5_PCS_START_CONTROL,
>> +       [QPHY_PCS_STATUS]               = QPHY_V5_PCS_PCS_STATUS1,
>> +       [QPHY_PCS_POWER_DOWN_CONTROL]   = QPHY_V5_PCS_POWER_DOWN_CONTROL,
>> +       [QPHY_PCS_ENDPOINT_REFCLK_CNTRL]        = QPHY_PCIE_V6_20_PCS_ENDPOINT_REFCLK_CNTRL,
>>   };
>>
>>   static const struct qmp_phy_init_tbl msm8998_pcie_serdes_tbl[] = {
>> @@ -2956,7 +2976,7 @@ static const struct qmp_phy_cfg sm8450_qmp_gen4x2_pciephy_cfg = {
>>          .num_resets             = ARRAY_SIZE(sdm845_pciephy_reset_l),
>>          .vreg_list              = qmp_phy_vreg_l,
>>          .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
>> -       .regs                   = pciephy_v5_regs_layout,
>> +       .regs                   = pciephy_v5_20_regs_layout,
>>
>>          .pwrdn_ctrl             = SW_PWRDN | REFCLK_DRV_DSBL,
>>          .phy_status             = PHYSTATUS_4_20,
>> @@ -3012,7 +3032,7 @@ static const struct qmp_phy_cfg sm8550_qmp_gen4x2_pciephy_cfg = {
>>          .num_resets             = ARRAY_SIZE(sdm845_pciephy_reset_l),
>>          .vreg_list              = sm8550_qmp_phy_vreg_l,
>>          .num_vregs              = ARRAY_SIZE(sm8550_qmp_phy_vreg_l),
>> -       .regs                   = pciephy_v5_regs_layout,
>> +       .regs                   = pciephy_v6_20_regs_layout,
>>
>>          .pwrdn_ctrl             = SW_PWRDN | REFCLK_DRV_DSBL,
>>          .phy_status             = PHYSTATUS_4_20,
>> @@ -3047,7 +3067,7 @@ static const struct qmp_phy_cfg sa8775p_qmp_gen4x2_pciephy_cfg = {
>>          .num_resets             = ARRAY_SIZE(sdm845_pciephy_reset_l),
>>          .vreg_list              = qmp_phy_vreg_l,
>>          .num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
>> -       .regs                   = pciephy_v5_regs_layout,
>> +       .regs                   = pciephy_v5_20_regs_layout,
>>
>>          .pwrdn_ctrl             = SW_PWRDN | REFCLK_DRV_DSBL,
>>          .phy_status             = PHYSTATUS_4_20,
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h
>> index a469ae2a10a1..9b166286afda 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5.h
>> @@ -11,6 +11,7 @@
>>   #define QPHY_V5_PCS_PCIE_POWER_STATE_CONFIG2           0x0c
>>   #define QPHY_V5_PCS_PCIE_POWER_STATE_CONFIG4           0x14
>>   #define QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_DRIVE         0x20
>> +#define QPHY_V5_PCS_PCIE_ENDPOINT_REFCLK_CNTRL         0x24
>>   #define QPHY_V5_PCS_PCIE_INT_AUX_CLK_CONFIG1           0x54
>>   #define QPHY_V5_PCS_PCIE_OSC_DTCT_ACTIONS              0x94
>>   #define QPHY_V5_PCS_PCIE_EQ_CONFIG2                    0xa8
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
>> index cdf8c04ea078..8b114e538a07 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h
>> @@ -9,6 +9,7 @@
>>   /* Only for QMP V5_20 PHY - PCIe PCS registers */
>>   #define QPHY_V5_20_PCS_PCIE_POWER_STATE_CONFIG2                0x00c
>>   #define QPHY_V5_20_PCS_PCIE_ENDPOINT_REFCLK_DRIVE      0x01c
>> +#define QPHY_V5_20_PCS_PCIE_ENDPOINT_REFCLK_CNTRL      0x020
>>   #define QPHY_V5_20_PCS_PCIE_OSC_DTCT_MODE2_CONFIG5     0x084
>>   #define QPHY_V5_20_PCS_PCIE_OSC_DTCT_ACTIONS           0x090
>>   #define QPHY_V5_20_PCS_PCIE_EQ_CONFIG1                 0x0a0
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6_20.h b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6_20.h
>> index e3eb08776339..f7abe95c49ad 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6_20.h
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v6_20.h
>> @@ -10,6 +10,7 @@
>>   #define QPHY_PCIE_V6_20_PCS_POWER_STATE_CONFIG2                0x00c
>>   #define QPHY_PCIE_V6_20_PCS_TX_RX_CONFIG               0x018
>>   #define QPHY_PCIE_V6_20_PCS_ENDPOINT_REFCLK_DRIVE      0x01c
>> +#define QPHY_PCIE_V6_20_PCS_ENDPOINT_REFCLK_CNTRL      0x020
>>   #define QPHY_PCIE_V6_20_PCS_OSC_DTCT_ATCIONS           0x090
>>   #define QPHY_PCIE_V6_20_PCS_EQ_CONFIG1                 0x0a0
>>   #define QPHY_PCIE_V6_20_PCS_EQ_CONFIG5                 0x108
>>
>> --
>> 2.42.0
>>
>>
>

