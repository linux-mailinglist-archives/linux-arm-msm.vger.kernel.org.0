Return-Path: <linux-arm-msm+bounces-53788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C18D9A83E3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 11:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A8028C16AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4121D20C027;
	Thu, 10 Apr 2025 09:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IgM3YHiw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5338C1D5143;
	Thu, 10 Apr 2025 09:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276173; cv=none; b=VL6hwT4AGAnLSGMLm4oTsqDBG9NcRrdpazHkwbVUNBBhJ2vPFAN4o0b42fw9P6O/4VpTGER0G0+JqLGYxSMB54hiN9TodcY6NvFQryNBKpCZ47Ry0uH9WH9tiSZEaSn5JzU9RcBpaRwqu79t4ujdFMSQENKloZWUEDIQXdeSTSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276173; c=relaxed/simple;
	bh=QMHDGk8JHM/c9cUMZ+iN5yTzUEkn2lnbW5kQ986wbq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Xp6m+ODgI1G3SmPbc8NXPuqT8yfyRyAoTpn7/+rIyBAhL+MnzOOWYVZQDfGFtgBrZ1n4QyNPIQuPNFb81E585kijgx0aNy7WR39plewPnaCnA2qwNPUz0gm+9TZ6VPJDuL3fPeL9xl38MzHYfznWlbrIsf5J07nX/WhibErVGl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IgM3YHiw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75NZT016340;
	Thu, 10 Apr 2025 09:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8fxVd34HCVlbqhp+YxoQnEBVeBKAahRy/Oc+q7zRfq8=; b=IgM3YHiwnu0t0s9j
	PoTA84LNP4I0Rh26mb6BJh7z9og7Gt//3MxcEk78xn8IYHm+qsijCnv4otW5aqTf
	4b5TxAzypKZklsjqGhcpqL+Iup0x+d8XRgPDdzjis9nFJKYxcAoF5dzr6l2vgCMI
	C42xxDyw4E7/X9ovwwJwj2/0G3yttHTz2TkMsdkG5txu8j7E9DPsUAcXkpAq5OvM
	2nHmvYvqUX5+HDZvc7DAs6IQKHEiNBo6KcRhIQb79rpWpFqpb6wq/CbJ4KLEmHPm
	/DzCLEkEx8+hmqBZnuNMP4o8yifb3IVNstru5gPFCUzKmjk01NAwEb5x9OSbxXeU
	33OnlQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1p5au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 09:09:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53A99KKV009799
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 09:09:20 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Apr
 2025 02:09:15 -0700
Message-ID: <6bcd4f78-b0d5-45d0-b023-452ce11dad17@quicinc.com>
Date: Thu, 10 Apr 2025 14:39:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/6] phy: qcom-qmp-ufs: Refactor UFS PHY reset
To: <neil.armstrong@linaro.org>, <vkoul@kernel.org>, <kishon@kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <konrad.dybcio@oss.qualcomm.com>
CC: <quic_rdwivedi@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>
References: <20250318144944.19749-1-quic_nitirawa@quicinc.com>
 <20250318144944.19749-4-quic_nitirawa@quicinc.com>
 <c2d692a4-826e-4186-955a-41286c99de3f@linaro.org>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <c2d692a4-826e-4186-955a-41286c99de3f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ULsN_riN_epKF4ocxuNrvxU32fhP9cYs
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f78ac1 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=obqVeH_2SAdrduneaCUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ULsN_riN_epKF4ocxuNrvxU32fhP9cYs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100068



On 3/18/2025 8:43 PM, neil.armstrong@linaro.org wrote:
> On 18/03/2025 15:49, Nitin Rawat wrote:
>> Refactor the UFS PHY reset handling to parse the reset logic only once
>> during probe, instead of every resume.
>>
>> Move the UFS PHY reset parsing logic from qmp_phy_power_on to
>> qmp_ufs_probe to avoid unnecessary parsing during resume.
>>
>> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 104 ++++++++++++------------
>>   1 file changed, 50 insertions(+), 54 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/ 
>> qualcomm/phy-qcom-qmp-ufs.c
>> index 0089ee80f852..3a80c2c110d2 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> @@ -1757,32 +1757,6 @@ static void qmp_ufs_init_registers(struct 
>> qmp_ufs *qmp, const struct qmp_phy_cfg
>>       qmp_ufs_init_all(qmp, &cfg->tbls_hs_b);
>>   }
>>
>> -static int qmp_ufs_com_init(struct qmp_ufs *qmp)
>> -{
>> -    const struct qmp_phy_cfg *cfg = qmp->cfg;
>> -    void __iomem *pcs = qmp->pcs;
>> -    int ret;
>> -
>> -    ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>> -    if (ret) {
>> -        dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
>> -        return ret;
>> -    }
>> -
>> -    ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
>> -    if (ret)
>> -        goto err_disable_regulators;
>> -
>> -    qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
>> -
>> -    return 0;
>> -
>> -err_disable_regulators:
>> -    regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>> -
>> -    return ret;
>> -}
>> -
>>   static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>>   {
>>       const struct qmp_phy_cfg *cfg = qmp->cfg;
>> @@ -1800,41 +1774,27 @@ static int qmp_ufs_power_on(struct phy *phy)
>>   {
>>       struct qmp_ufs *qmp = phy_get_drvdata(phy);
>>       const struct qmp_phy_cfg *cfg = qmp->cfg;
>> +    void __iomem *pcs = qmp->pcs;
>>       int ret;
>> -    dev_vdbg(qmp->dev, "Initializing QMP phy\n");
>> -
>> -    if (cfg->no_pcs_sw_reset) {
>> -        /*
>> -         * Get UFS reset, which is delayed until now to avoid a
>> -         * circular dependency where UFS needs its PHY, but the PHY
>> -         * needs this UFS reset.
>> -         */
>> -        if (!qmp->ufs_reset) {
>> -            qmp->ufs_reset =
>> -                devm_reset_control_get_exclusive(qmp->dev,
>> -                                 "ufsphy");
>> -
>> -            if (IS_ERR(qmp->ufs_reset)) {
>> -                ret = PTR_ERR(qmp->ufs_reset);
>> -                dev_err(qmp->dev,
>> -                    "failed to get UFS reset: %d\n",
>> -                    ret);
>> -
>> -                qmp->ufs_reset = NULL;
>> -                return ret;
>> -            }
>> -        }
>>
>> -        ret = reset_control_assert(qmp->ufs_reset);
>> -        if (ret)
>> -            return ret;
>> +    ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
>> +    if (ret) {
>> +        dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
>> +        return ret;
>>       }
>>
>> -    ret = qmp_ufs_com_init(qmp);
>> +    ret = clk_bulk_prepare_enable(qmp->num_clks, qmp->clks);
>>       if (ret)
>> -        return ret;
>> +        goto err_disable_regulators;
>> +
>> +    qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
>>
>>       return 0;
>> +
>> +err_disable_regulators:
>> +    regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>> +
>> +    return ret;
>>   }
> 
> This change is too fuzzy, please introduce qmp_ufs_get_phy_reset()
> in a patch, move qmp_ufs_com_init() inline in qmp_ufs_power_on()
> in a second time, and finally move reset_control_assert() to
> calibrate in a third patch (and explain why).

Thanks for the comment. I have taken care of this by separating 
qmp_ufs_get_phy_reset and inlining qmp_ufs_com_init in 2 separate patches.

Thanks,
Nitin

> 
> Thanks,
> Neil
> 
>>
>>   static int qmp_ufs_phy_calibrate(struct phy *phy)
>> @@ -1846,6 +1806,10 @@ static int qmp_ufs_phy_calibrate(struct phy *phy)
>>       unsigned int val;
>>       int ret;
>>
>> +    ret = reset_control_assert(qmp->ufs_reset);
>> +    if (ret)
>> +        return ret;
>> +
>>       qmp_ufs_init_registers(qmp, cfg);
>>
>>       ret = reset_control_deassert(qmp->ufs_reset);
>> @@ -2088,6 +2052,34 @@ static int qmp_ufs_parse_dt(struct qmp_ufs *qmp)
>>       return 0;
>>   }
>>
>> +static int qmp_ufs_get_phy_reset(struct qmp_ufs *qmp)
>> +{
>> +    const struct qmp_phy_cfg *cfg = qmp->cfg;
>> +    int ret;
>> +
>> +    if (!cfg->no_pcs_sw_reset)
>> +        return 0;
>> +
>> +    /*
>> +     * Get UFS reset, which is delayed until now to avoid a
>> +     * circular dependency where UFS needs its PHY, but the PHY
>> +     * needs this UFS reset.
>> +     */
>> +    if (!qmp->ufs_reset) {
>> +        qmp->ufs_reset =
>> +        devm_reset_control_get_exclusive(qmp->dev, "ufsphy");
>> +
>> +        if (IS_ERR(qmp->ufs_reset)) {
>> +            ret = PTR_ERR(qmp->ufs_reset);
>> +            dev_err(qmp->dev, "failed to get PHY reset: %d\n", ret);
>> +            qmp->ufs_reset = NULL;
>> +            return ret;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int qmp_ufs_probe(struct platform_device *pdev)
>>   {
>>       struct device *dev = &pdev->dev;
>> @@ -2114,6 +2106,10 @@ static int qmp_ufs_probe(struct platform_device 
>> *pdev)
>>       if (ret)
>>           return ret;
>>
>> +    ret = qmp_ufs_get_phy_reset(qmp);
>> +    if (ret)
>> +        return ret;
>> +
>>       /* Check for legacy binding with child node. */
>>       np = of_get_next_available_child(dev->of_node, NULL);
>>       if (np) {
>> -- 
>> 2.48.1
>>
>>
> 


