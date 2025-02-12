Return-Path: <linux-arm-msm+bounces-47718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E8FA3212D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 09:33:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05A643A20B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 08:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302351FAC56;
	Wed, 12 Feb 2025 08:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F0IZKocM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3C92045B9;
	Wed, 12 Feb 2025 08:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739349191; cv=none; b=BqcH7EaQcszmc9FkSgb+gnkZSHZk1a+Aj3qq3hHmAHGZTVevMufC/K/L8OQrUn5jeHxB6zKonBZKSCp9tD3BCAV7IRrYyuCcAm3j1QSpOfJ80m1DygwzVh9c7jkReZx75/K3hiUnc2TtReribpgR8HxDVoB1ZhnDK7oZ2GZnubA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739349191; c=relaxed/simple;
	bh=9yHVMBx4ojj15Wfc9oceaYbFv0gVgYgP+47h1bfxz/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jdvSMMa4CpeNFMot+8tUDqmGeobF4H/8G10402yZEnf2bj09U7pd03R6v5+yu5e/4EFTd7GShtKk75OnKScGzsA/4P/zw9zOKyeI/fP1Je0N82IAcgltzG+IkjAXaei/Z39wDtCGWXEt7sPeZJyuVntar9DU6CBo1CxsQHRQ/HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F0IZKocM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BM3TmD026076;
	Wed, 12 Feb 2025 08:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sp3ettQufyz8fmNnrUB/Q6sDRcYWIb4zuygNYHdX4zs=; b=F0IZKocMv9XQQNvF
	LIy5XE+eXIzzOmIHK9Yzaqb/qj3X6oKhy+QsAVu0Lj1HDhStzzvU/mX5/N00X5GC
	sngDxlEGzyElY1q7JGWHrBF3hKnHE+pHijFdQ0WOcmkgsaE7oeUZRdRW0Wc75cmp
	RAi3JwH1GC+rCweVMqqSQohpHhtuURBuZyndjniltChvEOw0ly0t0LKwfWHgyYqF
	lgy21qVvDFtLbQ/XN1TylPuqvb2BpCIpIDMcds1hddKmZ9OzRBGsMsE67PJhstcX
	L7LbNiTFWeDmjinAWkyjzes+W8Pgj7+PySPJo6BBlCunwjbnV1JPAapNFAdQ0/Xx
	vuE4Jg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r5j5b3k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 08:32:58 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51C8WvCQ016286
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 08:32:57 GMT
Received: from [10.239.28.138] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Feb
 2025 00:32:54 -0800
Message-ID: <791fa29e-a2b5-d5f6-3cbc-0f499b463262@quicinc.com>
Date: Wed, 12 Feb 2025 16:31:21 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 2/2] phy: qcom: qmp-pcie: Add PHY register retention
 support
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <p.zabel@pengutronix.de>,
        <abel.vesa@linaro.org>, <quic_qianyu@quicinc.com>,
        <neil.armstrong@linaro.org>, <manivannan.sadhasivam@linaro.org>,
        <quic_devipriy@quicinc.com>, <konrad.dybcio@oss.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20250211094231.1813558-1-quic_wenbyao@quicinc.com>
 <20250211094231.1813558-3-quic_wenbyao@quicinc.com>
 <7deghiadmomrz7w7vq3v7nkzq2kabq4xbhkouswjrexif7pip3@tvjlpvuulxvp>
From: "Wenbin Yao (Consultant)" <quic_wenbyao@quicinc.com>
In-Reply-To: <7deghiadmomrz7w7vq3v7nkzq2kabq4xbhkouswjrexif7pip3@tvjlpvuulxvp>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Oz9zYtD84MGX6M3gK30-79RuA1LwV36M
X-Proofpoint-GUID: Oz9zYtD84MGX6M3gK30-79RuA1LwV36M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_02,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120065

On 2/12/2025 8:13 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 11, 2025 at 05:42:31PM +0800, Wenbin Yao wrote:
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
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 91 +++++++++++++++---------
>>   1 file changed, 58 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> index ac42e4b01065..7f0802d09812 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> @@ -2805,6 +2805,7 @@ struct qmp_pcie {
>>   
>>   	const struct qmp_phy_cfg *cfg;
>>   	bool tcsr_4ln_config;
>> +	bool phy_initialized;
>>   
>>   	void __iomem *serdes;
>>   	void __iomem *pcs;
>> @@ -3976,6 +3977,7 @@ static int qmp_pcie_init(struct phy *phy)
>>   {
>>   	struct qmp_pcie *qmp = phy_get_drvdata(phy);
>>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> +	void __iomem *pcs = qmp->pcs;
>>   	int ret;
>>   
>>   	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>> @@ -3984,10 +3986,17 @@ static int qmp_pcie_init(struct phy *phy)
>>   		return ret;
>>   	}
>>   
>> -	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>> -	if (ret) {
>> -		dev_err(qmp->dev, "reset assert failed\n");
>> -		goto err_disable_regulators;
>> +	qmp->phy_initialized = !!(readl(pcs + cfg->regs[QPHY_START_CTRL]));
>> +	/*
>> +	 * Toggle BCR reset for phy that doesn't support no_csr
>> +	 * reset or has not been initialized
>> +	 */
>> +	if (!qmp->nocsr_reset || !qmp->phy_initialized) {
> Instead of having phy_initialized please add another boolean field,
> qmp->skip_init = !!qmp->nocsr_reset && !!phy_initialized;
> Use qmp->skip_init through the code.

In qmp_pcie_power_off and qmp_pcie_exit, we only check qmp->nocsr_reset. It

seems unnecessary to combine qmp->nocsr_reset with phy_initialized.

>
>> +		ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>> +		if (ret) {
>> +			dev_err(qmp->dev, "reset assert failed\n");
>> +			goto err_disable_regulators;
>> +		}
>>   	}
>>   
>>   	ret = reset_control_assert(qmp->nocsr_reset);
>> @@ -3998,10 +4007,12 @@ static int qmp_pcie_init(struct phy *phy)
>>   
>>   	usleep_range(200, 300);
>>   
>> -	ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
>> -	if (ret) {
>> -		dev_err(qmp->dev, "reset deassert failed\n");
>> -		goto err_assert_reset;
>> +	if (!qmp->nocsr_reset || !qmp->phy_initialized) {
>> +		ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
>> +		if (ret) {
>> +			dev_err(qmp->dev, "reset deassert failed\n");
>> +			goto err_assert_reset;
>> +		}
>>   	}
>>   
>>   	ret = clk_bulk_prepare_enable(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
>> @@ -4011,7 +4022,8 @@ static int qmp_pcie_init(struct phy *phy)
>>   	return 0;
>>   
>>   err_assert_reset:
>> -	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>> +	if (!qmp->nocsr_reset || !qmp->phy_initialized)
>> +		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>>   err_disable_regulators:
>>   	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>>   
>> @@ -4023,7 +4035,10 @@ static int qmp_pcie_exit(struct phy *phy)
>>   	struct qmp_pcie *qmp = phy_get_drvdata(phy);
>>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
>>   
>> -	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>> +	if (!qmp->nocsr_reset)
>> +		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>> +	else
>> +		reset_control_assert(qmp->nocsr_reset);
>>   
>>   	clk_bulk_disable_unprepare(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
>>   
>> @@ -4042,16 +4057,22 @@ static int qmp_pcie_power_on(struct phy *phy)
>>   	unsigned int mask, val;
>>   	int ret;
>>   
>> -	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>> -			cfg->pwrdn_ctrl);
>> +	/*
>> +	 * Write CSR register for phy that doesn't support no_csr
> what is CSR register?
The registers of PHY.
>
>> +	 * reset or has not been initialized
>> +	 */
>> +	if (!qmp->nocsr_reset || !qmp->phy_initialized) {
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
>> @@ -4063,15 +4084,16 @@ static int qmp_pcie_power_on(struct phy *phy)
>>   		goto err_disable_pipe_clk;
>>   	}
>>   
>> -	/* Pull PHY out of reset state */
>> -	qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>> +	if (!qmp->nocsr_reset || !qmp->phy_initialized) {
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
>> @@ -4096,16 +4118,19 @@ static int qmp_pcie_power_off(struct phy *phy)
>>   
>>   	clk_bulk_disable_unprepare(qmp->num_pipe_clks, qmp->pipe_clks);
>>   
>> -	/* PHY reset */
>> -	qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>>   
>> -	/* stop SerDes and Phy-Coding-Sublayer */
>> -	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_START_CTRL],
>> -			SERDES_START | PCS_START);
>> +	if (!qmp->nocsr_reset) {
> Why this one doesn't check for the qmp->phy_initialized?

If a PHY supports no_csr reset but isn't enabled in the bootloader, we

still need to program the phy settings only once so that we can reuse them

during the D3cold -> D0 cycle. Therefore, we don't check

qmp->phy_initialized here.

>
>> +		/* PHY reset */
>> +		qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>>   
>> -	/* Put PHY into POWER DOWN state: active low */
>> -	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>> -			cfg->pwrdn_ctrl);
>> +		/* stop SerDes and Phy-Coding-Sublayer */
>> +		qphy_clrbits(qmp->pcs, cfg->regs[QPHY_START_CTRL],
>> +				SERDES_START | PCS_START);
>> +
>> +		/* Put PHY into POWER DOWN state: active low */
>> +		qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
>> +				cfg->pwrdn_ctrl);
>> +	}
>>   
>>   	return 0;
>>   }
>> -- 
>> 2.34.1
>>
-- 
With best wishes
Wenbin

