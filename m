Return-Path: <linux-arm-msm+bounces-46278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB75A1D959
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 16:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADE8B3A00A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 15:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706D2EAD0;
	Mon, 27 Jan 2025 15:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YHtxTZGV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7193527468;
	Mon, 27 Jan 2025 15:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737991160; cv=none; b=a7n5S3/aEPzuuhxKhVs7NrHapQsnrpxKW3xSlNLpTaDaAWXgX+seGaGehD802rL5RHhsKIjd9sdQRaiUCrbksXAamrxYTh+FipLt8Zic5HeJ+PqT3Y1PftdMPr7J95bR5JZepy6+WFZYe5Bug35+m4TbSECwbcfVZLBlnghmW2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737991160; c=relaxed/simple;
	bh=ij1anOFE+eE7na5ynO28+DL3r2Xi60tJYOti+UmJOjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=m0NVAyfe6HXt+puVcCXXyVMKSJfYCkmrPizn9Jd5ra59aoLv1QId1huoyAixPOQYcCFFN1i7vYp1Vlwd/dhmwBlqoa7nMIPMCCzw5VyJGWgfYf0e2dzYHMPKysjR2MmAEuTlcn4tZzzBrkcVnL5VKZ9l362xgSGQ5e4X0iit6hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YHtxTZGV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RDSXVo024818;
	Mon, 27 Jan 2025 15:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FHPcaRykKa2ZjBuodSdhXCcRAYTZ9namuKFkfbBbMZ4=; b=YHtxTZGV5KVpAQ2o
	+qt3sTgWsHPn1UTVvJeCB31cWX05IneMzn+7wfeSwbC8ZO8awl6pFLydk7JvoTNF
	l6h2d+Xa9nuiM52bESnDFydRjF7WbIs5OehMtw4TYPsA0SXS41aJHFi4Ks0u++1q
	y3iLQsAc76LP/CW7Lhu1dPlTHRWzZCu/uhf1cftqU4YJbi5K8Q2i77nRpeuwGjbP
	7HOwJijimCCAalOVXS5IG2y2GLQjr49xqC1dd23IrVLSys/+VOFUWnOyOP1cRjUU
	S+6YEFKYHs3busPRSX5mn7O2YSHOnPCNM9ae40ebrhJJIYlneTLlmQLFvppc1IRq
	6Vasow==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44eb2cr749-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 15:18:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50RFI8n9023759
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 15:18:08 GMT
Received: from [10.218.43.20] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 27 Jan
 2025 07:18:05 -0800
Message-ID: <85769d2e-c1cc-42e3-bbc7-ec878118d2c7@quicinc.com>
Date: Mon, 27 Jan 2025 20:48:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10] scsi: ufs: qcom: Enable UFS Shared ICE Feature
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <andersson@kernel.org>, <bvanassche@acm.org>, <ebiggers@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Naveen Kumar Goud Arepalli
	<quic_narepall@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
References: <20250109070352.8801-1-quic_rdwivedi@quicinc.com>
 <20250117165157.euq56jnbizhgfjtf@thinkpad>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <20250117165157.euq56jnbizhgfjtf@thinkpad>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TWj_fDslwgwUmvuLqM5viSc_8TYmVvQ1
X-Proofpoint-GUID: TWj_fDslwgwUmvuLqM5viSc_8TYmVvQ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_07,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270122



On 17-Jan-25 10:22 PM, Manivannan Sadhasivam wrote:
> On Thu, Jan 09, 2025 at 12:33:52PM +0530, Ram Kumar Dwivedi wrote:
> 
> [...]
> 
>>  static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
>> @@ -439,6 +465,7 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
>>  		err = ufs_qcom_check_hibern8(hba);
>>  		ufs_qcom_enable_hw_clk_gating(hba);
>>  		ufs_qcom_ice_enable(host);
>> +		ufs_qcom_config_ice_allocator(host);
> 
> This should be moved before ufs_qcom_ice_enable(), no?

Hi Mani,

This sequence is as per HPG guidelines.

Thanks,
Ram.

> 
>>  		break;
>>  	default:
>>  		dev_err(hba->dev, "%s: invalid status %d\n", __func__, status);
>> @@ -932,6 +959,14 @@ static void ufs_qcom_set_host_params(struct ufs_hba *hba)
>>  	host_params->hs_tx_gear = host_params->hs_rx_gear = ufs_qcom_get_hs_gear(hba);
>>  }
>>  
>> +static void ufs_qcom_set_host_caps(struct ufs_hba *hba)
>> +{
>> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>> +
>> +	if (host->hw_ver.major >= 0x5)
>> +		host->caps |= UFS_QCOM_CAP_ICE_CONFIG;
>> +}
>> +
>>  static void ufs_qcom_set_caps(struct ufs_hba *hba)
>>  {
>>  	hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
>> @@ -940,6 +975,8 @@ static void ufs_qcom_set_caps(struct ufs_hba *hba)
>>  	hba->caps |= UFSHCD_CAP_WB_EN;
>>  	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
>>  	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
>> +
>> +	ufs_qcom_set_host_caps(hba);
>>  }
>>  
>>  /**
>> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
>> index b9de170983c9..2975a9e545fa 100644
>> --- a/drivers/ufs/host/ufs-qcom.h
>> +++ b/drivers/ufs/host/ufs-qcom.h
>> @@ -76,6 +76,12 @@ enum {
>>  	UFS_MEM_CQIS_VS		= 0x8,
>>  };
>>  
>> +/* QCOM UFS host controller Shared ICE registers */
>> +enum {
>> +	REG_UFS_MEM_ICE_CONFIG			= 0x260C,
>> +	REG_UFS_MEM_ICE_NUM_CORE		= 0x2664,
>> +};
>> +
> 
> No, I asked for this change:
> 
> ```
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index b9de170983c9..9d1c9da51688 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -50,6 +50,9 @@ enum {
>          */
>         UFS_AH8_CFG                             = 0xFC,
>  
> +       REG_UFS_MEM_ICE_CONFIG                  = 0x260C,
> +       REG_UFS_MEM_ICE_NUM_CORE                = 0x2664,
> +
>         REG_UFS_CFG3                            = 0x271C,
>  
>         REG_UFS_DEBUG_SPARE_CFG                 = 0x284C,
> ```
> 
>>  #define UFS_CNTLR_2_x_x_VEN_REGS_OFFSET(x)	(0x000 + x)
>>  #define UFS_CNTLR_3_x_x_VEN_REGS_OFFSET(x)	(0x400 + x)
>>  
>> @@ -110,6 +116,9 @@ enum {
>>  /* bit definition for UFS_UFS_TEST_BUS_CTRL_n */
>>  #define TEST_BUS_SUB_SEL_MASK	GENMASK(4, 0)  /* All XXX_SEL fields are 5 bits wide */
>>  
>> +/* bit definition for UFS Shared ICE config */
> 
> 'bit definition for REG_UFS_MEM_ICE_CONFIG register'

Hi Mani,

I have addressed this in the latest patchset.

Thanks,
Ram.

> 
> - Mani
> 


