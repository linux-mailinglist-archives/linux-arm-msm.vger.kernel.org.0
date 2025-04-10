Return-Path: <linux-arm-msm+bounces-53796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3EBA83E5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 11:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E236B1B83ED5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB25520DD54;
	Thu, 10 Apr 2025 09:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oQethw0o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CD620C488;
	Thu, 10 Apr 2025 09:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276452; cv=none; b=M7yXvi9RhR81RTBBf7uxO1iYmrbVywlrL5iEPAvQBPTUWAleN7G/bMbOxUJYv+m46knMdMOHs0n/+NRbQc11JIJwOdY6CIMGZAFFqTeeA0ArqzusM1yTpt4EOHtcs0OfKf6gqsz69jpZzM+8mmHUiJhrqtMAXzN41zY00Prk4Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276452; c=relaxed/simple;
	bh=f1bSP3V/wnUtvwthyPhUPn8aQ70wSX7njYSzkv5yYCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lPCBuA6iTp6DzVWrlkeai2rOj5i/cBBjGojLQWdJnD5LPFIyYl+KqIiZt/AIXAQu58avn4hIiiwtPrmJLBF0PgsZxQJHekH+9tjzs+sv1QuQsSYpCOrszahOr0WZw6QZsQdE4xTHRf1/NrKAwwYyIRqvnFzNk4wq/S6yC/pbBX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oQethw0o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75ev1000699;
	Thu, 10 Apr 2025 09:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hGY4uTpYXd/tDtQK+UKGjzRPs1W7kXS1Z0P2dmPWfy0=; b=oQethw0oeF7fFMd2
	9KqbCsVJ+sMNhuBQE2ol3DcJYx+kNyWDlGhRgrF+enEVX1/BP9OlQ2R/EA4ZqZ/r
	Zg2uvwbIGB8gP9U247WyRfNYawqZbGwNmlJGo4WHNylhJATarsox0NvX5AIBdwao
	5Saigm1U4g/6QwilmQGtWtabP2qBRXOzZAYQumhRduP9PCrhk4EJMvPbZPucvxrQ
	veDTgm2WDrXVkmMji4u0XLyvUOoTpHPXQu3JvsQ5mgDFNUjkxRq+ed0zT+Q45LTS
	o9L8qYb72Y0PnYpViR/d7CvUt06GfKSx8fTx91+4aKj/hBNWeJNvCqhATuwJdKVT
	WKJLcA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2xa9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 09:14:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53A9E0sA024266
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 09:14:00 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Apr
 2025 02:13:55 -0700
Message-ID: <c35c37c9-ff5b-43cc-afdd-fff509415ca6@quicinc.com>
Date: Thu, 10 Apr 2025 14:43:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/6] phy: qcom-qmp-ufs: Refactor phy_power_on and
 phy_calibrate callbacks
To: <neil.armstrong@linaro.org>, <vkoul@kernel.org>, <kishon@kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <konrad.dybcio@oss.qualcomm.com>
CC: <quic_rdwivedi@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-scsi@vger.kernel.org>, Can Guo <quic_cang@quicinc.com>
References: <20250318144944.19749-1-quic_nitirawa@quicinc.com>
 <20250318144944.19749-3-quic_nitirawa@quicinc.com>
 <ab3639e0-61bb-46f0-9e54-f1bbd034b939@linaro.org>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <ab3639e0-61bb-46f0-9e54-f1bbd034b939@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ia17VMEn0O_RUNO79BLfP3RTUNvzsWg4
X-Proofpoint-GUID: Ia17VMEn0O_RUNO79BLfP3RTUNvzsWg4
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f78bd8 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=RY7zYqXbgaIDV70ltDMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100068



On 3/18/2025 8:39 PM, neil.armstrong@linaro.org wrote:
> On 18/03/2025 15:49, Nitin Rawat wrote:
>> Commit 052553af6a31 ("ufs/phy: qcom: Refactor to use phy_init call")
>> puts enabling regulators & clks, calibrating UFS PHY, starting serdes
>> and polling PCS ready status into phy_power_on.
>>
>> In Current code regulators enable, clks enable, calibrating UFS PHY,
>> start_serdes and polling PCS_ready_status are part of phy_power_on.
>>
>> UFS PHY registers are retained after power collapse, meaning calibrating
>> UFS PHY, start_serdes and polling PCS_ready_status can be done only when
>> hba is powered_on, and not needed every time when phy_power_on is called
>> during resume. Hence keep the code which enables PHY's regulators & clks
>> in phy_power_on and move the rest steps into phy_calibrate function.
>>
>> Refactor the code to retain PHY regulators & clks in phy_power_on and
>> move out rest of the code to new phy_calibrate function.
>>
>> Co-developed-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 18 ++----------------
>>   1 file changed, 2 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/ 
>> qualcomm/phy-qcom-qmp-ufs.c
>> index bb836bc0f736..0089ee80f852 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
>> @@ -1796,7 +1796,7 @@ static int qmp_ufs_com_exit(struct qmp_ufs *qmp)
>>       return 0;
>>   }
>>
>> -static int qmp_ufs_init(struct phy *phy)
>> +static int qmp_ufs_power_on(struct phy *phy)
>>   {
>>       struct qmp_ufs *qmp = phy_get_drvdata(phy);
>>       const struct qmp_phy_cfg *cfg = qmp->cfg;
>> @@ -1898,21 +1898,6 @@ static int qmp_ufs_exit(struct phy *phy)
>>       return 0;
>>   }
>>
>> -static int qmp_ufs_power_on(struct phy *phy)
>> -{
>> -    int ret;
>> -
>> -    ret = qmp_ufs_init(phy);
>> -    if (ret)
>> -        return ret;
>> -
>> -    ret = qmp_ufs_phy_calibrate(phy);
>> -    if (ret)
>> -        qmp_ufs_exit(phy);
>> -
>> -    return ret;
>> -}
>> -
>>   static int qmp_ufs_disable(struct phy *phy)
>>   {
>>       int ret;
>> @@ -1942,6 +1927,7 @@ static int qmp_ufs_set_mode(struct phy *phy, 
>> enum phy_mode mode, int submode)
>>   static const struct phy_ops qcom_qmp_ufs_phy_ops = {
>>       .power_on    = qmp_ufs_power_on,
>>       .power_off    = qmp_ufs_disable,
>> +    .calibrate    = qmp_ufs_phy_calibrate,
> 
> Ok so this will break the UFS until patch 5 is applied,
> breaking bisectability.
> 
> Make sure UFS host driver calls calibrate first, and then
> do the refactor in the PHY driver.

Hi Neil.

Thanks for the review. I have taken care of bisecatablity
compliance by making UFS host driver calls calibrate first
in latest patch set.

Regards,
Nitin



> 
> And either all would go in a single tree or either PHY
> or SCSI maintainer would need to provide an immutable
> branch for the final merge.
> 
>>       .set_mode    = qmp_ufs_set_mode,
>>       .owner        = THIS_MODULE,
>>   };
>> -- 
>> 2.48.1
>>
>>
> 


