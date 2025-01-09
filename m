Return-Path: <linux-arm-msm+bounces-44517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6D2A06EA4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 08:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAC5A1670DE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 07:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658DB21480E;
	Thu,  9 Jan 2025 07:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JQc9ObXw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CE52147FA;
	Thu,  9 Jan 2025 07:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736406446; cv=none; b=SnX76PaPtwsLJqIARD8zEoUw6LDrUuC9NexRDO8g+jHbXmluE8KnqOCeMKaCz6QGO4NynpMRYAgGwZrk3VH8LlGQbkJZEAXU8PSriB6sD8iASV40HzNe+He3NIXdbQyMxof/Ts96k1rGZXknaY9JGDg2YAR1/Vpmy/NbgWPZ034=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736406446; c=relaxed/simple;
	bh=O/g9zH4XLVY2zBXMMPZuny9790n32C1Lw0TUH4wd7Hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EGg63a07+2IPwQgnh5OAfEPX6j/cnLI3JjvHkVgRsmUjWMvhsqcHwQEYuRlSCRhSPctdMKrEDB5glkhVH5XBhrQAY8fcxyP4g30CUFSve+8zGwiyCQhnYTfKXnq7mwZMFPGNxRRDoiBvFmpMnG6qZGXHCihgMdKxm6M/qS09ASk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JQc9ObXw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508Ih1MJ008541;
	Thu, 9 Jan 2025 07:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gu5uCdB8oECgi8CiDEk7dhmOiUZe77fmMzpSP5uht00=; b=JQc9ObXwtF2K/cYH
	767WVH+mVLjnUBBnBMMUpj+YHzOaqiT9qmGWWS+7VUkWExxAMl5BVPS+w1dVzpwP
	JV19LdC/3Qrhff9t44IsnSUwUKQpyuHL9AzZtnr5QmtNvHXC6ev9Q0Kc7786hchE
	K2QW5hZh/kfz56hmt4VvkKsp1SRylpVJat0hHzyXKmgPUCccXPFE2bl2XGH221/M
	UAG7wmCAPpsQnaqZPOyv/der/Y9ZZ2Ny0Urjssleb4dmeFH+MktaMhPy4pdT8WDR
	E/S4XJhV2N3TIxF/sqS9+ZzmOM1hHjgCvc/DQN/d8kfBm8t0E1BBP308ycE8JPC1
	WkYmXg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441xvnseqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 07:07:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509772Ca015614
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 07:07:02 GMT
Received: from [10.218.43.20] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 23:06:58 -0800
Message-ID: <0faa9c12-8678-4744-af49-b75c45e674f5@quicinc.com>
Date: Thu, 9 Jan 2025 12:36:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V9] scsi: ufs: qcom: Enable UFS Shared ICE Feature
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <andersson@kernel.org>, <bvanassche@acm.org>, <ebiggers@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Naveen Kumar Goud Arepalli
	<quic_narepall@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
References: <20250107135624.7628-1-quic_rdwivedi@quicinc.com>
 <20250108130032.37lz3ee6gcmfc36j@thinkpad>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <20250108130032.37lz3ee6gcmfc36j@thinkpad>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xgY-sIV5_ZJinVVLeFBpX4_3Z07Wp2Jl
X-Proofpoint-ORIG-GUID: xgY-sIV5_ZJinVVLeFBpX4_3Z07Wp2Jl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090057



On 08-Jan-25 6:30 PM, Manivannan Sadhasivam wrote:
> On Tue, Jan 07, 2025 at 07:26:24PM +0530, Ram Kumar Dwivedi wrote:
>> By default, the UFS controller allocates a fixed number of RX
>> and TX engines statically. Consequently, when UFS reads are in
>> progress, the TX ICE engines remain idle, and vice versa.
>> This leads to inefficient utilization of RX and TX engines.
>>
>> To address this limitation, enable the UFS shared ICE feature for
>> Qualcomm UFS V5.0 and above. This feature utilizes a pool of crypto
>> cores for both TX streams (UFS Write – Encryption) and RX streams
>> (UFS Read – Decryption). With this approach, crypto cores are
>> dynamically allocated to either the RX or TX stream as needed.
>>
>> Co-developed-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
>> Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
>> Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
>> ---
>> Changes from v8:
>> 1. Addressed Manivannan's comment to call ufs_qcom_config_ice_allocator()
>>    from ufs_qcom_ice_enable().
> 
> No I did not. More below.
> 
>> 2. Addressed Manivannan's comment to place UFS_QCOM_CAP_ICE_CONFIG
>>    definition outside of the ufs_qcom_host struct.
>> 3. Addressed Manivannan's comment to align ICE definitions with
>>    other definitions.
>>
>> Changes from v7:
>> 1. Addressed Eric's comment to perform ice configuration only if
>>    UFSHCD_CAP_CRYPTO is enabled.
>>  
>> Changes from v6: 
>> 1. Addressed Eric's comment to replace is_ice_config_supported() helper
>>    function with a conditional check for UFS_QCOM_CAP_ICE_CONFIG.
>>
>> Changes from v5: 
>> 1. Addressed Bart's comment to declare the "val" variable with
>>    the "static" keyword.
>>
>> Changes from v4:
>> 1. Addressed Bart's comment to use get_unaligned_le32() instead of
>>    bit shifting and to declare val with the const keyword.
>>
>> Changes from v3:
>> 1. Addressed Bart's comment to change the data type of "config" to u32
>>    and "val" to uint8_t.
>>
>> Changes from v2:
>> 1. Refactored the code to have a single algorithm in the code and
>> enabled by default.
>> 2. Revised the commit message to incorporate the refactored change.
>> 3. Qcom host capabilities are now enabled in a separate function.
>>
>> Changes from v1:
>> 1. Addressed Rob's and Krzysztof's comment to fix dt binding compilation
>>    issue.
>> 2. Addressed Rob's comment to enable the nodes in example.
>> 3. Addressed Eric's comment to rephrase patch commit description.
>>    Used terminology as ICE allocator instead of ICE algorithm.
>> 4. Addressed Christophe's comment to align the comment as per kernel doc.
>> ---
>>  drivers/ufs/host/ufs-qcom.c | 38 +++++++++++++++++++++++++++++++++
>>  drivers/ufs/host/ufs-qcom.h | 42 ++++++++++++++++++++++++++++++++++++-
>>  2 files changed, 79 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 68040b2ab5f8..f4b9fb0740b4 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -15,6 +15,7 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/reset-controller.h>
>>  #include <linux/time.h>
>> +#include <linux/unaligned.h>
>>  
>>  #include <soc/qcom/ice.h>
>>  
>> @@ -105,11 +106,33 @@ static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_dev *rcd)
>>  }
>>  
>>  #ifdef CONFIG_SCSI_UFS_CRYPTO
>> +/**
>> + * ufs_qcom_config_ice_allocator() - ICE core allocator configuration
>> + *
>> + * @host: pointer to qcom specific variant structure.
>> + */
>> +static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
>> +{
>> +	struct ufs_hba *hba = host->hba;
>> +	static const uint8_t val[4] = { NUM_RX_R1W0, NUM_TX_R0W1, NUM_RX_R1W1, NUM_TX_R1W1 };
>> +	u32 config;
>> +
>> +	if (!(host->caps & UFS_QCOM_CAP_ICE_CONFIG) ||
>> +			!(host->hba->caps & UFSHCD_CAP_CRYPTO))
>> +		return;
>> +
>> +	config = get_unaligned_le32(val);
>> +
>> +	ufshcd_writel(hba, ICE_ALLOCATOR_TYPE, REG_UFS_MEM_ICE_CONFIG);
>> +	ufshcd_writel(hba, config, REG_UFS_MEM_ICE_NUM_CORE);
>> +}
>>  
>>  static inline void ufs_qcom_ice_enable(struct ufs_qcom_host *host)
>>  {
>>  	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
>>  		qcom_ice_enable(host->ice);
>> +
>> +	ufs_qcom_config_ice_allocator(host);
> 
> I did not ask you to move ufs_qcom_config_ice_allocator() inside
> ufs_qcom_ice_enable(). Rather do below in ufs_qcom_hce_enable_notify():
Hi Mani,

I have addressed this in the latest patchset.

Thanks,
Ram.


> 
> 	ufs_qcom_config_ice_allocator(host);
> 	ufs_qcom_ice_enable(host);
> 
>>  }
>>  
>>  static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
>> @@ -196,6 +219,11 @@ static inline int ufs_qcom_ice_suspend(struct ufs_qcom_host *host)
>>  {
>>  	return 0;
>>  }
>> +
>> +static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
>> +{
>> +}
>> +
>>  #endif
>>  
>>  static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
>> @@ -932,6 +960,14 @@ static void ufs_qcom_set_host_params(struct ufs_hba *hba)
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
>> @@ -940,6 +976,8 @@ static void ufs_qcom_set_caps(struct ufs_hba *hba)
>>  	hba->caps |= UFSHCD_CAP_WB_EN;
>>  	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
>>  	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
>> +
>> +	ufs_qcom_set_host_caps(hba);
>>  }
>>  
>>  /**
>> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
>> index b9de170983c9..de41028ecee0 100644
>> --- a/drivers/ufs/host/ufs-qcom.h
>> +++ b/drivers/ufs/host/ufs-qcom.h
>> @@ -135,6 +135,46 @@ enum {
>>  #define UNIPRO_CORE_CLK_FREQ_201_5_MHZ         202
>>  #define UNIPRO_CORE_CLK_FREQ_403_MHZ           403
>>  
>> +
> 
> Extra newline
Hi Mani,

I have addressed this in the latest patchset.

Thanks,
Ram.

> 
>> +#ifdef CONFIG_SCSI_UFS_CRYPTO
> 
> As I said in previous iteration, you do not need the guard for definitions.
Hi Mani,

I have addressed this in the latest patchset.

Thanks,
Ram.

> 
>> +
>> +/* ICE configuration to share AES engines among TX stream and RX stream */
>> +#define UFS_QCOM_CAP_ICE_CONFIG BIT(0)
> 
> This is a bit definition. So define this as like other bit definitions in this
> header.
Hi Mani,

I have addressed this in the latest patchset.

Thanks,
Ram.


> 
>> +#define ICE_ALLOCATOR_TYPE 2
>> +#define REG_UFS_MEM_ICE_CONFIG 0x260C
>> +#define REG_UFS_MEM_ICE_NUM_CORE  0x2664
> 
> I asked you to move these two register definitions to register enum but still
> not addressed.
Hi Mani,

I have addressed this in the latest patchset.

Thanks,
Ram.


> 
>> +
>> +/*
>> + * Number of cores allocated for RX stream when Read data block received and
>> + * Write data block is not in progress
>> + */
>> +#define NUM_RX_R1W0 28
>> +
>> +/*
>> + * Number of cores allocated for TX stream when Device asked to send write
>> + * data block and Read data block is not in progress
>> + */
>> +#define NUM_TX_R0W1 28
>> +
>> +/*
>> + * Number of cores allocated for RX stream when Read data block received and
>> + * Write data block is in progress
>> + * OR
>> + * Device asked to send write data block and Read data block is in progress
>> + */
>> +#define NUM_RX_R1W1 15
>> +
>> +/*
>> + * Number of cores allocated for TX stream (UFS write) when Read data block
>> + * received and Write data block is in progress
>> + * OR
>> + * Device asked to send write data block and Read data block is in progress
>> + */
>> +#define NUM_TX_R1W1 13
>> +
>> +#endif /* UFS_CRYPTO */
>> +
> 
> Extra newline.
Hi Mani,

I have addressed this in the latest patchset.

Thanks,
Ram.

> 
> - Mani
> 


