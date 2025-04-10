Return-Path: <linux-arm-msm+bounces-53840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27845A84825
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 17:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76E701B8876F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 15:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFCE1E9B38;
	Thu, 10 Apr 2025 15:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jVlypefq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860501E990B;
	Thu, 10 Apr 2025 15:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299477; cv=none; b=ugMuYpO6v/ZOiBKF3SGWu0t4zfZCGMR+uErBeGgs6re7EF22wpLE4HJ//gCWrmDg8t4WrYvuHK8qyagY5YNvgcY1hoUZmB/M5Lauc0C0lcUB5+QWuKa4mkfrLK3osItTSewwEoB/lanL+X1XyMAp7ILZ4ICccHHLbKAADxpjiMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299477; c=relaxed/simple;
	bh=EMYuLPJWM6t/QbvZf7ywpIWpg26tA/P0uWIEh8ao1Cg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mje5N2Z/eLhG3P/3dESZ8KuBLpirHEHMtd9QBG6GY821OKIQljNHF1DLo3fGlPM3u+EkHadHO5NkJ9ZGno6U189sSCW+cSnp79x7hU6eLoiWIFYakTJoVReaFvZF5huZ4ST6vMjmL/x34W11DzZvw3Y4oEOTHd0379z92waR5Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jVlypefq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75cjs018370;
	Thu, 10 Apr 2025 15:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F1tK8A5KiVjnbhi2rhR7y0Y7Tn8k6euzMRCiQt761SM=; b=jVlypefqgYPtx6II
	034IxYHAeRxNa0PI0ZzPGVkY+Z5GMBC6uX9dCSp9+JUjNLXyMkwsyVXJatAhdL4H
	6Ul5vy+esWyw58+pjsSppb8h+YcGuV6jj3ZekjC9KB69gr/1LM/h/VhORECqf9/9
	tIWVeUMP3eDmYSSUfTK0MYhF/DjLUqZlrv9JBvVZzIx1kqCuFebSGkp64+5+QCWU
	XuWsW4DRUkUeIonJUFyQ/PbTqL8F1747UtiTx2rGu4jywxCCERAmRXBI/epzlT4O
	xW+a7Oj1K5bSADR835Al1Sc3puogwhwvqAId8AOe+hJabY25SYMTxzStX/dtspW+
	9wLWug==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb7h4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 15:37:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53AFbh3q017023
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 15:37:43 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Apr
 2025 08:37:40 -0700
Message-ID: <124fb13c-c41a-42b0-a521-158876b1b00c@quicinc.com>
Date: Thu, 10 Apr 2025 21:07:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/6] phy: qcom-qmp-ufs: Refactor UFS PHY reset
To: Bjorn Andersson <andersson@kernel.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <konrad.dybcio@oss.qualcomm.com>, <quic_rdwivedi@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>
References: <20250318144944.19749-1-quic_nitirawa@quicinc.com>
 <20250318144944.19749-4-quic_nitirawa@quicinc.com>
 <w3si5lpps5nzpyxjulxynl3fxwobtbnfsqwau6et5s2pkgehub@vcmkdaevbf5w>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <w3si5lpps5nzpyxjulxynl3fxwobtbnfsqwau6et5s2pkgehub@vcmkdaevbf5w>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cwJEHaUvcl9U1x2AlFUUBburphREsOXj
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f7e5c8 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=WIYHiBWYbOpNOST8Gw0A:9
 a=QEXdDO2ut3YA:10 a=-_B0kFfA75AA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cwJEHaUvcl9U1x2AlFUUBburphREsOXj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100113



On 3/19/2025 1:16 AM, Bjorn Andersson wrote:
> On Tue, Mar 18, 2025 at 08:19:41PM +0530, Nitin Rawat wrote:
>> Refactor the UFS PHY reset handling to parse the reset logic only once
>> during probe, instead of every resume.
>>
> 
> This looks very reasonable! But it would be preferred to see the commit
> messages following the what format outlines in
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> with a clear problem description followed by a description of the
> technical solution.
> 
>> Move the UFS PHY reset parsing logic from qmp_phy_power_on to
>> qmp_ufs_probe to avoid unnecessary parsing during resume.
> 
> Please add ()-suffix to function names in your commit messages.
> 
> Also, this series moves things around a lot, can you confirm that UFS is
> working inbetween each one of this patches, so that the branch is
> bisectable when this is being picked up?

Hi Bjorn,

Thanks for the review. I've addressed the bisectability compliance in my 
latest patch set (patchset #3) that I posted today. I just realized I 
missed your other comments about adding the ()-suffix to function names 
in commit messages. Sorry about that. I'll make sure to include this in 
my next patch set.

Thanks,
Nitin


> 
>>
>> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 104 ++++++++++++------------
>>   1 file changed, 50 insertions(+), 54 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> index 0089ee80f852..3a80c2c110d2 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> @@ -1757,32 +1757,6 @@ static void qmp_ufs_init_registers(struct qmp_ufs *qmp, const struct qmp_phy_cfg
>>   	qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
>>   }
>>
>> -static int qmp_ufs_com_init(struct qmp_ufs *qmp)
>> -{
>> -	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> -	void __iomem *pcs = qmp->pcs;
>> -	int ret;
>> -
>> -	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>> -	if (ret) {
>> -		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
>> -		return ret;
>> -	}
>> -
>> -	ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
>> -	if (ret)
>> -		goto err_disable_regulators;
>> -
>> -	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
>> -
>> -	return 0;
>> -
>> -err_disable_regulators:
>> -	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>> -
>> -	return ret;
>> -}
>> -
>>   static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>>   {
>>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> @@ -1800,41 +1774,27 @@ static int qmp_ufs_power_on(struct phy *phy)
>>   {
>>   	struct qmp_ufs *qmp = phy_get_drvdata(phy);
>>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> +	void __iomem *pcs = qmp->pcs;
> 
> This is only used once, perhaps not worth a local variable to save 5
> characters on that line?
> 
>>   	int ret;
>> -	dev_vdbg(qmp->dev, "Initializing QMP phy\n");
>> -
>> -	if (cfg->no_pcs_sw_reset) {
>> -		/*
>> -		 * Get UFS reset, which is delayed until now to avoid a
>> -		 * circular dependency where UFS needs its PHY, but the PHY
>> -		 * needs this UFS reset.
>> -		 */
>> -		if (!qmp->ufs_reset) {
>> -			qmp->ufs_reset =
>> -				devm_reset_control_get_exclusive(qmp->dev,
>> -								 "ufsphy");
>> -
>> -			if (IS_ERR(qmp->ufs_reset)) {
>> -				ret = PTR_ERR(qmp->ufs_reset);
>> -				dev_err(qmp->dev,
>> -					"failed to get UFS reset: %d\n",
>> -					ret);
>> -
>> -				qmp->ufs_reset = NULL;
>> -				return ret;
>> -			}
>> -		}
>>
>> -		ret = reset_control_assert(qmp->ufs_reset);
>> -		if (ret)
>> -			return ret;
>> +	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>> +	if (ret) {
>> +		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
> 
> regulator_bulk_enable() will already have printed a more useful error
> message, letting you know which of the vregs[] it was that failed to
> enable.
> 
>> +		return ret;
>>   	}
>>
>> -	ret = qmp_ufs_com_init(qmp);
>> +	ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
>>   	if (ret)
>> -		return ret;
>> +		goto err_disable_regulators;
>> +
>> +	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
>>
>>   	return 0;
>> +
>> +err_disable_regulators:
>> +	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>> +
>> +	return ret;
>>   }
>>
>>   static int qmp_ufs_phy_calibrate(struct phy *phy)
>> @@ -1846,6 +1806,10 @@ static int qmp_ufs_phy_calibrate(struct phy *phy)
>>   	unsigned int val;
>>   	int ret;
>>
>> +	ret = reset_control_assert(qmp->ufs_reset);
>> +	if (ret)
>> +		return ret;
>> +
>>   	qmp_ufs_init_registers(qmp, cfg);
>>
>>   	ret = reset_control_deassert(qmp->ufs_reset);
>> @@ -2088,6 +2052,34 @@ static int qmp_ufs_parse_dt(struct qmp_ufs *qmp)
>>   	return 0;
>>   }
>>
>> +static int qmp_ufs_get_phy_reset(struct qmp_ufs *qmp)
>> +{
>> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> +	int ret;
>> +
>> +	if (!cfg->no_pcs_sw_reset)
>> +		return 0;
>> +
>> +	/*
>> +	 * Get UFS reset, which is delayed until now to avoid a
>> +	 * circular dependency where UFS needs its PHY, but the PHY
>> +	 * needs this UFS reset.
> 
> This is invoked only once, from qcom_ufs_probe(), so it doesn't seem
> accurate anymore. How come this is no longer needed? Please describe
> what changed int he commit message.
> 
>> +	 */
>> +	if (!qmp->ufs_reset) {
>> +		qmp->ufs_reset =
>> +		devm_reset_control_get_exclusive(qmp->dev, "ufsphy");
> 
> The line break here is really weird, are you sure checkpatch --strict
> didn't complain about this one?
> 
>> +
>> +		if (IS_ERR(qmp->ufs_reset)) {
>> +			ret = PTR_ERR(qmp->ufs_reset);
>> +			dev_err(qmp->dev, "failed to get PHY reset: %d\n", ret);
> 
> return dev_err_probe(qmp->dev, PTR_ERR(qmp->ufs_reset), "failed to...: %pe\n", qmp->ufs_reset);
> 
> While being more succinct, it also stores the reason for failing the
> probe so that you can find it in /sys/kernel/debug/devices_deferred
> 
>> +			qmp->ufs_reset = NULL;
> 
> Use a local variable if you're worried about someone accessing the stale
> error code after returning here.
> 
> Regards,
> Bjorn
> 
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int qmp_ufs_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>> @@ -2114,6 +2106,10 @@ static int qmp_ufs_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>
>> +	ret = qmp_ufs_get_phy_reset(qmp);
>> +	if (ret)
>> +		return ret;
>> +
>>   	/* Check for legacy binding with child node. */
>>   	np = of_get_next_available_child(dev->of_node, NULL);
>>   	if (np) {
>> --
>> 2.48.1
>>
>>


