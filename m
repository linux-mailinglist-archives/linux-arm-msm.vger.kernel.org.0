Return-Path: <linux-arm-msm+bounces-49130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AED2A417B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 09:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4FBB7A275A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 08:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA8F22170C;
	Mon, 24 Feb 2025 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HeT76m94"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02470221571;
	Mon, 24 Feb 2025 08:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740386781; cv=none; b=SxpMa24OTgJmtJaDlk3BWTVurDkFq4/jBDCuQdST+sSSlD3gXzgCEDZkI2S3zYHvN9KBWDiVL6iwWzv+Jb7aJvVrqIkMlVdcZmengh/6u7+3Dsy/Bko22MnVOGzL7p8GDtL75MdyLgj+ucedA4iscCmp+Ip01EWHDCP5a1jfcI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740386781; c=relaxed/simple;
	bh=4U73g4/gOmTnFzPkNcAHhoAxJXYvObnD0dNRTxp53F4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SOs9oLQyz4VqtE1I6zn9e00XyxUUejdbuTSiP4Q5BaAJYe5ZZk1WmlW2F0xcpFzuQpZGKe3psNovadUs+mIVQV730XYDk3Q6DnOdkbvzoPm452bFwPb+zm+7ooS+Q/riZUARLWNM8x23F2ZjSIZD+kS16BNPOG6LwhhYSu8HvVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HeT76m94; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51NNfi3k025322;
	Mon, 24 Feb 2025 08:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sC4H/bRUgZfWPwQMJ+HGbd2v8BHEROc0Xl9s+cEjNBI=; b=HeT76m94BfLAQ9nE
	QC5NrJPtPk6i4j5vnkPGYj5R8fSLMh9IpxWEMcG+T98zkAHfmIyGi7RKA0nx07MI
	M0u4f+RfwapedJcI2MvytPWhWQpKFutNa+lajq2qwpe770UhfMW6bjT3bjbaZmCH
	ofsSid3rdR5Wu56wCg69GWMyOyZC0TaVv9kwP1gNiFTvgOWqT55zmOuYmadNf86b
	GlEF4rg4qQOzgeg9DO0ZRk8AbECyX4A9rVYqiwyJjC5gUXmdKwctXDXKIhMOC0pH
	u7VXZj8hHgnGYJn7U0V4Mbr3gk+Zb/BVZikzNOz26y9HdTxTOjs8CV24wbXYKggK
	nCfWgw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6ntv74c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 08:46:07 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O8k6u8012866
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 08:46:06 GMT
Received: from [10.233.19.224] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 24 Feb
 2025 00:46:03 -0800
Message-ID: <7ffb09cd-9c77-4407-9087-3e789cd8bf44@quicinc.com>
Date: Mon, 24 Feb 2025 16:46:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <p.zabel@pengutronix.de>,
        <dmitry.baryshkov@linaro.org>, <abel.vesa@linaro.org>,
        <quic_qianyu@quicinc.com>, <neil.armstrong@linaro.org>,
        <quic_devipriy@quicinc.com>, <konrad.dybcio@oss.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250220102253.755116-1-quic_wenbyao@quicinc.com>
 <20250220102253.755116-3-quic_wenbyao@quicinc.com>
 <20250224073301.aqbw3gxjnupbejfy@thinkpad>
Content-Language: en-US
From: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
In-Reply-To: <20250224073301.aqbw3gxjnupbejfy@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vyCJcSmPiXHHDsTk6hVMthtBLTlNYqcs
X-Proofpoint-GUID: vyCJcSmPiXHHDsTk6hVMthtBLTlNYqcs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_03,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502240063

On 2/24/2025 3:33 PM, Manivannan Sadhasivam wrote:
> On Thu, Feb 20, 2025 at 06:22:53PM +0800, Wenbin Yao wrote:
>> From: Qiang Yu <quic_qianyu@quicinc.com>
>>
>> Some QCOM PCIe PHYs support no_csr reset. Unlike BCR reset which resets the
>> whole PHY (hardware and register), no_csr reset only resets PHY hardware
>> but retains register values, which means PHY setting can be skipped during
>> PHY init if PCIe link is enabled in booltloader and only no_csr is toggled
>> after that.
>>
>> Hence, determine whether the PHY has been enabled in bootloader by
>> verifying QPHY_START_CTRL register. If it's programmed and no_csr reset is
>> available, skip BCR reset and PHY register setting to establish the PCIe
>> link with bootloader - programmed PHY settings.
>>
>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> Some nitpicks below.
>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 60 +++++++++++++++++++-----
>>   1 file changed, 49 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> index 219266125cf2..6938b72df7fa 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> @@ -2805,6 +2805,7 @@ struct qmp_pcie {
>>   
>>   	const struct qmp_phy_cfg *cfg;
>>   	bool tcsr_4ln_config;
>> +	bool skip_init;
>>   
>>   	void __iomem *serdes;
>>   	void __iomem *pcs;
>> @@ -3976,7 +3977,9 @@ static int qmp_pcie_init(struct phy *phy)
>>   {
>>   	struct qmp_pcie *qmp = phy_get_drvdata(phy);
>>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> +	void __iomem *pcs = qmp->pcs;
>>   	int ret;
>> +	bool phy_initialized;
>>   
>>   	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>>   	if (ret) {
>> @@ -3984,10 +3987,18 @@ static int qmp_pcie_init(struct phy *phy)
>>   		return ret;
>>   	}
>>   
>> -	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>> -	if (ret) {
>> -		dev_err(qmp->dev, "reset assert failed\n");
>> -		goto err_disable_regulators;
>> +	phy_initialized = !!(readl(pcs + cfg->regs[QPHY_START_CTRL]));
>> +	qmp->skip_init = qmp->nocsr_reset && phy_initialized;
>> +	/*
>> +	 * Toggle BCR reset for PHY that doesn't support no_csr
>> +	 * reset or has not been initialized
> Please make use of 80 column width.

Will fix it.

>
>> +	 */
>> +	if (!qmp->skip_init) {
>> +		ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>> +		if (ret) {
>> +			dev_err(qmp->dev, "reset assert failed\n");
>> +			goto err_disable_regulators;
>> +		}
>>   	}
>>   
>>   	ret = reset_control_assert(qmp->nocsr_reset);
>> @@ -3998,10 +4009,12 @@ static int qmp_pcie_init(struct phy *phy)
>>   
>>   	usleep_range(200, 300);
>>   
>> -	ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
>> -	if (ret) {
>> -		dev_err(qmp->dev, "reset deassert failed\n");
>> -		goto err_assert_reset;
>> +	if (!qmp->skip_init) {
>> +		ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
>> +		if (ret) {
>> +			dev_err(qmp->dev, "reset deassert failed\n");
>> +			goto err_assert_reset;
>> +		}
>>   	}
>>   
>>   	ret = clk_bulk_prepare_enable(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
>> @@ -4011,7 +4024,8 @@ static int qmp_pcie_init(struct phy *phy)
>>   	return 0;
>>   
>>   err_assert_reset:
>> -	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>> +	if (!qmp->skip_init)
>> +		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>>   err_disable_regulators:
>>   	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>>   
>> @@ -4023,7 +4037,10 @@ static int qmp_pcie_exit(struct phy *phy)
>>   	struct qmp_pcie *qmp = phy_get_drvdata(phy);
>>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
>>   
>> -	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>> +	if (qmp->nocsr_reset)
>> +		reset_control_assert(qmp->nocsr_reset);
>> +	else
>> +		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>>   
>>   	clk_bulk_disable_unprepare(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
>>   
>> @@ -4042,6 +4059,13 @@ static int qmp_pcie_power_on(struct phy *phy)
>>   	unsigned int mask, val;
>>   	int ret;
>>   
>> +	/*
>> +	 * Write CSR register for PHY that doesn't support no_csr
>> +	 * reset or has not been initialized
> Same here.

Will fix it.

>
>> +	 */
>> +	if (qmp->skip_init)
>> +		goto skip_tbls_init;
>> +
>>   	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>>   			cfg->pwrdn_ctrl);
>>   
>> @@ -4053,6 +4077,7 @@ static int qmp_pcie_power_on(struct phy *phy)
>>   	qmp_pcie_init_registers(qmp, &cfg->tbls);
>>   	qmp_pcie_init_registers(qmp, mode_tbls);
>>   
>> +skip_tbls_init:
>>   	ret = clk_bulk_prepare_enable(qmp->num_pipe_clks, qmp->pipe_clks);
>>   	if (ret)
>>   		return ret;
>> @@ -4063,6 +4088,9 @@ static int qmp_pcie_power_on(struct phy *phy)
>>   		goto err_disable_pipe_clk;
>>   	}
>>   
>> +	if (qmp->skip_init)
>> +		goto skip_serdes_start;
>> +
>>   	/* Pull PHY out of reset state */
>>   	qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>>   
>> @@ -4072,6 +4100,7 @@ static int qmp_pcie_power_on(struct phy *phy)
>>   	if (!cfg->skip_start_delay)
>>   		usleep_range(1000, 1200);
>>   
>> +skip_serdes_start:
>>   	status = pcs + cfg->regs[QPHY_PCS_STATUS];
>>   	mask = cfg->phy_status;
>>   	ret = readl_poll_timeout(status, val, !(val & mask), 200,
>> @@ -4096,7 +4125,15 @@ static int qmp_pcie_power_off(struct phy *phy)
>>   
>>   	clk_bulk_disable_unprepare(qmp->num_pipe_clks, qmp->pipe_clks);
>>   
>> -	/* PHY reset */
>> +	/* When PHY is powered off, only qmp->nocsr_reset needs to be checked.
> s/'When PHY is powered off,'/'While powering off the PHY,'

Will fix it.

>
>> +	 * In this way, no matter whether the PHY settings were initially
>> +	 * programmed by bootloader or PHY driver itself, we can reuse them
> It is really possible to have bootloader not programming the init sequence for
> no_csr reset platforms? The comment sounds like it is possible. But I heard the
> opposite.

PCIe3 on X1E80100 QCP is disabled by default in UEFI. We need to enable it
manually in UEFI shell if we want.

>
>> +	 * when PHY is powered on next time.
>> +	 */
>> +	if (qmp->nocsr_reset)
>> +		goto skip_phy_deinit;
>> +
>> +		/* PHY reset */
> Spurious tab before the start of the comment.

Will fix it.

>
> - Mani
>
-- 
With best wishes
Wenbin


