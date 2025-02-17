Return-Path: <linux-arm-msm+bounces-48171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A12A37F8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F71818996E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 10:07:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9784A2260C;
	Mon, 17 Feb 2025 10:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OT8Q7ia7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E60215F75;
	Mon, 17 Feb 2025 10:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786803; cv=none; b=QVBvSI8v2v9Go1570FE0il9O4Sq1S2bZsMTl4ijCtV9GO/mdpW4n+A3u9d/M5HuzFn80QzHIEc1liVftkDnIrZlM9xpiD+ksJb3/sTMJW1YsxhagQh7NDMKftpng8cqdVx6nrKC+4lf1i7zX57/oe086KGiwkDyDDkg1d+ntiks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786803; c=relaxed/simple;
	bh=qSowhSirIJzFnnd8ccmz40UI9VlAxN9NtVa2CzZfZLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AhvW2Y0ypZvS9+EW07zSxyzbb/O5Q78gVKMv0q1JNLd75r2/H/qN0G78Twyh1zBrc25PyZAbPbz2kU0B3rO16NrTqQTeX6cMIiHxn7ztLPEeaDRyCwMbBf2CS2ZQqZ7s1yFdgYBhFsYKXW7KKjJkWjIEXOAX80vZut55bqyqcUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OT8Q7ia7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H04luP029901;
	Mon, 17 Feb 2025 10:06:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ypXQ+OHIrbRxC/SFYJwJ7ZT3RrzVM/Ac3enVoTyhaw=; b=OT8Q7ia7qAQImLwS
	zRhMF2IT9oTIk2BT+42FFpuC74+P9lAWMuXLKEETFhxo8f1Wdmg74aRX8I4keRVj
	qH0A6sc67SyHPTERYTaTd4CG1dI5GRzu949870b+pgt9qhIsT4x2y0+T7v2uSXky
	T1n2ofCcW/gDOcYtyriQIk3Yel/mKO5a5Aqi5p1XQOHLIFLslqw3dJR1N2X1tooe
	OFACXb7QrlJSp4y5G2gZuh6ryLbBp4hldNKnCfeOaJZXvDyjIi5mYL1BP7E1fsPv
	Ttnak0MQ2la/IrsDSnBY+6M1ZqJrnJjouTORSF4bVtT80K7lR0YLwJmwrOXSUZsS
	/jjlgQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7sh977-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 10:06:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51HA6UXP009915
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 10:06:30 GMT
Received: from [10.239.29.178] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Feb
 2025 02:06:26 -0800
Message-ID: <0c3b51cc-a6e7-43e4-8196-8cd2f8ea3748@quicinc.com>
Date: Mon, 17 Feb 2025 18:05:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
To: Manivannan Sadhasivam <mani@kernel.org>,
        Wenbin Yao
	<quic_wenbyao@quicinc.com>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <p.zabel@pengutronix.de>,
        <dmitry.baryshkov@linaro.org>, <abel.vesa@linaro.org>,
        <neil.armstrong@linaro.org>, <manivannan.sadhasivam@linaro.org>,
        <quic_devipriy@quicinc.com>, <konrad.dybcio@oss.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250214104539.281846-1-quic_wenbyao@quicinc.com>
 <20250214104539.281846-3-quic_wenbyao@quicinc.com>
 <20250214144623.fvjr2bytliqhektr@thinkpad>
Content-Language: en-US
From: Qiang Yu <quic_qianyu@quicinc.com>
In-Reply-To: <20250214144623.fvjr2bytliqhektr@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1H0hfRuNXWY19VRiZDCtg91bBtJ0U7lE
X-Proofpoint-ORIG-GUID: 1H0hfRuNXWY19VRiZDCtg91bBtJ0U7lE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 clxscore=1011 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502170088


On 2/14/2025 10:46 PM, Manivannan Sadhasivam wrote:
> On Fri, Feb 14, 2025 at 06:45:39PM +0800, Wenbin Yao wrote:
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
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 96 ++++++++++++++++--------
>>   1 file changed, 63 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> index 219266125cf2..b3912c1a6de8 100644
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
>> +	 * Toggle BCR reset for phy that doesn't support no_csr
> s/phy/PHY. Here and below.
>
>> +	 * reset or has not been initialized
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
>> +	if (!qmp->nocsr_reset)
>> +		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>> +	else
>> +		reset_control_assert(qmp->nocsr_reset);
> I'd flip the if condition for readability:
>
> 	if (qmp->nocsr_reset)
> 		...
> 	else
> 		...
>>   
>>   	clk_bulk_disable_unprepare(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
>>   
>> @@ -4042,16 +4059,22 @@ static int qmp_pcie_power_on(struct phy *phy)
>>   	unsigned int mask, val;
>>   	int ret;
>>   
>> -	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>> -			cfg->pwrdn_ctrl);
>> +	/*
>> +	 * Write CSR register for phy that doesn't support no_csr
>> +	 * reset or has not been initialized
>> +	 */
>> +	if (!qmp->skip_init) {
> How about:
> 	if (qmp->skip_init)
> 		goto skip_phy_init;
>
> This is my personal preference btw. If anyone feels the other way, feel free
> to drop this suggestion.
>
>> +		qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>> +				cfg->pwrdn_ctrl);
>>   
>> -	if (qmp->mode == PHY_MODE_PCIE_RC)
>> -		mode_tbls = cfg->tbls_rc;
>> -	else
>> -		mode_tbls = cfg->tbls_ep;
>> +		if (qmp->mode == PHY_MODE_PCIE_RC)
>> +			mode_tbls = cfg->tbls_rc;
>> +		else
>> +			mode_tbls = cfg->tbls_ep;
>>   
>> -	qmp_pcie_init_registers(qmp, &cfg->tbls);
>> -	qmp_pcie_init_registers(qmp, mode_tbls);
>> +		qmp_pcie_init_registers(qmp, &cfg->tbls);
>> +		qmp_pcie_init_registers(qmp, mode_tbls);
>> +	}
>>   
>>   	ret = clk_bulk_prepare_enable(qmp->num_pipe_clks, qmp->pipe_clks);
>>   	if (ret)
>> @@ -4063,15 +4086,16 @@ static int qmp_pcie_power_on(struct phy *phy)
>>   		goto err_disable_pipe_clk;
>>   	}
>>   
>> -	/* Pull PHY out of reset state */
>> -	qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>> +	if (!qmp->skip_init) {
> 	if (qmp->skip_init)
> 		goto skip_serdes_start;
>
>> +		/* Pull PHY out of reset state */
>> +		qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>>   
>> -	/* start SerDes and Phy-Coding-Sublayer */
>> -	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START);
>> -
>> -	if (!cfg->skip_start_delay)
>> -		usleep_range(1000, 1200);
>> +		/* start SerDes and Phy-Coding-Sublayer */
>> +		qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START);
>>   
>> +		if (!cfg->skip_start_delay)
>> +			usleep_range(1000, 1200);
>> +	}
>>   	status = pcs + cfg->regs[QPHY_PCS_STATUS];
>>   	mask = cfg->phy_status;
>>   	ret = readl_poll_timeout(status, val, !(val & mask), 200,
>> @@ -4096,16 +4120,22 @@ static int qmp_pcie_power_off(struct phy *phy)
>>   
>>   	clk_bulk_disable_unprepare(qmp->num_pipe_clks, qmp->pipe_clks);
>>   
>> -	/* PHY reset */
>> -	qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>> +	/* If a PHY supports no_csr reset but isn't enabled in the bootloader,
>> +	 * phy settings can be reused during the D3cold -> D0 cycle. So it is
> I cannot parse this sentence. If PHY is not initialized, how can you reuse the
> settings? Also what is the D3cold->D0 reference?
If PHY is not initialized, PHY settings will not be reused next time PHY
is powered on as !!(readl(pcs + cfg->regs[QPHY_START_CTRL])) is false.

For PHY driver, D3cold->D0 cycle means PHY power off -> power on.

The comment is not very clear, perhaps we can use this comment:
During PHY is powered off, only qmp->nocsr_reset need to be checked. In this
way, no matter whether the PHY settings were initially programmed by
bootloader or PHY driver itself, we can reuse them when PHY is powered
on next time.

Thanks,
Qiang
>
>> +	 * unnecessary to check qmp->skip_init.
>> +	 */
>> +	if (!qmp->nocsr_reset) {
> 	if (qmp->nocsr_reset)
> 		goto skip_phy_reset;
>
> - Mani
>

