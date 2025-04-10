Return-Path: <linux-arm-msm+bounces-53842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C68AA84843
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 17:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57F323B2221
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 15:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF8D1EE7A5;
	Thu, 10 Apr 2025 15:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DVeu9Uq5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663C21EB1AF;
	Thu, 10 Apr 2025 15:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299697; cv=none; b=NoCEDSwecmtuNuvZTBLaEAyX61SIPjLwn0O1sQPShR51WhpeZ1kJ8Qt044acgpWhHPjbXnE8Exz+4t/w5rPX2pIcU5072mJq4aVlVtNjxcETmId8mjeIWWxAIGE+dM5O16NI3zXZtTcdcsfpjdDTXJc4DHwQI24DhFf6kHXtNHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299697; c=relaxed/simple;
	bh=g/7mpHNJyHljtccH0/sDOcAIeoaFh43PC9htSE53bco=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aaOWIZqg0yUOHrCkJQL6J74PmPJdQO99sekUJG4UlVhvqWHi9LfyWpRd9hJ4LWtcF773nE0PJf2foQLn7OFCxnAhugbalhuXjb8XXHOouuKdj/VblGIxxBVA2EXzjS9UpkBKfw0yqqv2Wa6QB9ewUIt+Vps1moi1IQDyKR4bwBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DVeu9Uq5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75J5Q028839;
	Thu, 10 Apr 2025 15:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fjf7yYm0yDfKXxtHHeZp2F3zNuJYcYsV1Ye6MuBrR24=; b=DVeu9Uq5QRiZs6FA
	B3vRtW1jwgz8feJFkBlpAgbsfCHGNh9p3dw4S8zLDf7YWw3cgwpAu7rXM1O1KmRL
	Llodmx2OIWkrdKDsCIZVYi5zb+0DSxFH3oQJhZFnecneQJFrRuDOXWN1nE2Msxsm
	J8+0SIwKO7JU0+msGXotVEcQORId6bGaLMQLaeTahBvjN7YI4jqKFYsL+sQO6YQw
	5Sa6iHg9GQdUBX5aIFkr2jPtJVbF6HN27FIf683jmzwaK0Q96HJefACbNwlwzjDR
	45gCAFkZOVdYSIv0A9XvMMNDagKnHWOP5zA7Ff1eQN+9ZdZv+fpV+JSoH02mBiAU
	UDDMFw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbuqex7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 15:41:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53AFfNvM009731
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 15:41:23 GMT
Received: from [10.218.7.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Apr
 2025 08:41:19 -0700
Message-ID: <f93dc302-f10d-40c6-a852-cd76ad5e74da@quicinc.com>
Date: Thu, 10 Apr 2025 21:11:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 6/6] scsi: ufs: host : Introduce phy_power_on/off
 wrapper function
To: Bjorn Andersson <andersson@kernel.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>,
        <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <konrad.dybcio@oss.qualcomm.com>, <quic_rdwivedi@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        Can Guo <quic_cang@quicinc.com>
References: <20250318144944.19749-1-quic_nitirawa@quicinc.com>
 <20250318144944.19749-7-quic_nitirawa@quicinc.com>
 <jx6t2745x3swbfiqwsii5xdumhpanc435ooucrg2nlyl22llho@epleg24suedr>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <jx6t2745x3swbfiqwsii5xdumhpanc435ooucrg2nlyl22llho@epleg24suedr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZDW9Uu1bdIriZQZQeGwQURy7teSDYaQl
X-Proofpoint-ORIG-GUID: ZDW9Uu1bdIriZQZQeGwQURy7teSDYaQl
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f7e6a4 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=n_emG9rYDKyKq8pEu_gA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504100114



On 3/19/2025 1:20 AM, Bjorn Andersson wrote:
> On Tue, Mar 18, 2025 at 08:19:44PM +0530, Nitin Rawat wrote:
>> Introduce ufs_qcom_phy_power_on and ufs_qcom_phy_power_off wrapper
>> functions with mutex protection to ensure safe usage of is_phy_pwr_on
>> and prevent possible race conditions.
>>
> 
> Please describe the problem properly here. Are you introducing the mutex
> because there is a problem, or because you want to be "safe"?
> 
> Why is it "refcounted", is the calling code paths no longer in sync? How
> long has the current implementation been broken?
> 
> Regards,
> Bjorn
> 

Hi Bjorn,

Thanks for the review. There are scenarios where ufshcd_link_startup() 
can call ufshcd_vops_link_startup_notify() multiple times during 
retries. This leads to the PHY reference count increasing continuously, 
preventing proper re-initialization of the PHY.

Recently, this issue was addressed with patch 7bac65687510 ("scsi: ufs: 
qcom: Power off the PHY if it was already powered on in 
ufs_qcom_power_up_sequence()"). However, I still want to maintain a 
reference count (ref_cnt) to safeguard against similar conditions in the 
code. Additionally, this approach helps avoid unnecessary phy_power_on 
and phy_power_off calls. Please let me know your thoughts.

Regrads,
Nitin




>> Co-developed-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Can Guo <quic_cang@quicinc.com>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 44 +++++++++++++++++++++++++++++++------
>>   drivers/ufs/host/ufs-qcom.h |  4 ++++
>>   2 files changed, 41 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 5c7b6c75d669..8f80724e64b9 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -421,6 +421,38 @@ static u32 ufs_qcom_get_hs_gear(struct ufs_hba *hba)
>>   	return UFS_HS_G3;
>>   }
>>
>> +static int ufs_qcom_phy_power_on(struct ufs_hba *hba)
>> +{
>> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> +	struct phy *phy = host->generic_phy;
>> +	int ret = 0;
>> +
>> +	guard(mutex)(&host->phy_mutex);
>> +	if (!host->is_phy_pwr_on) {
>> +		ret = phy_power_on(phy);
>> +		if (!ret)
>> +			host->is_phy_pwr_on = true;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int ufs_qcom_phy_power_off(struct ufs_hba *hba)
>> +{
>> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> +	struct phy *phy = host->generic_phy;
>> +	int ret = 0;
>> +
>> +	guard(mutex)(&host->phy_mutex);
>> +	if (host->is_phy_pwr_on) {
>> +		ret = phy_power_off(phy);
>> +		if (!ret)
>> +			host->is_phy_pwr_on = false;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>>   {
>>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> @@ -449,7 +481,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>>   		return ret;
>>
>>   	if (phy->power_count) {
>> -		phy_power_off(phy);
>> +		ufs_qcom_phy_power_off(hba);
>>   		phy_exit(phy);
>>   	}
>>
>> @@ -466,7 +498,7 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
>>   		goto out_disable_phy;
>>
>>   	/* power on phy - start serdes and phy's power and clocks */
>> -	ret = phy_power_on(phy);
>> +	ret = ufs_qcom_phy_power_on(hba);
>>   	if (ret) {
>>   		dev_err(hba->dev, "%s: phy power on failed, ret = %d\n",
>>   			__func__, ret);
>> @@ -1017,7 +1049,6 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>>   				 enum ufs_notify_change_status status)
>>   {
>>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> -	struct phy *phy = host->generic_phy;
>>   	int err;
>>
>>   	/*
>> @@ -1037,7 +1068,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>>   				/* disable device ref_clk */
>>   				ufs_qcom_dev_ref_clk_ctrl(host, false);
>>   			}
>> -			err = phy_power_off(phy);
>> +			err = ufs_qcom_phy_power_off(hba);
>>   			if (err) {
>>   				dev_err(hba->dev, "phy power off failed, ret=%d\n", err);
>>   					return err;
>> @@ -1046,7 +1077,7 @@ static int ufs_qcom_setup_clocks(struct ufs_hba *hba, bool on,
>>   		break;
>>   	case POST_CHANGE:
>>   		if (on) {
>> -			err = phy_power_on(phy);
>> +			err = ufs_qcom_phy_power_on(hba);
>>   			if (err) {
>>   				dev_err(hba->dev, "phy power on failed, ret = %d\n", err);
>>   				return err;
>> @@ -1233,10 +1264,9 @@ static int ufs_qcom_init(struct ufs_hba *hba)
>>   static void ufs_qcom_exit(struct ufs_hba *hba)
>>   {
>>   	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> -	struct phy *phy = host->generic_phy;
>>
>>   	ufs_qcom_disable_lane_clks(host);
>> -	phy_power_off(phy);
>> +	ufs_qcom_phy_power_off(hba);
>>   	phy_exit(host->generic_phy);
>>   }
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
>> index d0e6ec9128e7..3db29fbcd40b 100644
>> --- a/drivers/ufs/host/ufs-qcom.h
>> +++ b/drivers/ufs/host/ufs-qcom.h
>> @@ -252,6 +252,10 @@ struct ufs_qcom_host {
>>   	u32 phy_gear;
>>
>>   	bool esi_enabled;
>> +	/* flag to check if phy is powered on */
>> +	bool is_phy_pwr_on;
>> +	/* Protect the usage of is_phy_pwr_on against racing */
>> +	struct mutex phy_mutex;
>>   };
>>
>>   struct ufs_qcom_drvdata {
>> --
>> 2.48.1
>>
>>


