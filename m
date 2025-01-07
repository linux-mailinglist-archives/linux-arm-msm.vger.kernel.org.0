Return-Path: <linux-arm-msm+bounces-44146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC506A0414C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 14:57:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2CE01656E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 13:57:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7201F130B;
	Tue,  7 Jan 2025 13:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jEjf4ch9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB481F12F8;
	Tue,  7 Jan 2025 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736258242; cv=none; b=jBZHUh+Jp5fvoW7+x0/8TrD0I+w9TKN1uCTUfsjJnUFIHigYNXYcCIvNFnkXVPGNVXgqQVVniv1u65xTU/q4Iz6yYqcQ3Bw59hhPL5Y+pJw0zHVg6ZEZQadCrTo/GZGqaNBDrkbOL0L9PHmP4poh4vEfVcROUXk1tjPPVfPXX/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736258242; c=relaxed/simple;
	bh=9sFDOBQur3f5tBNr0wmawF+I1m57JmBRamz+mNTH6oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GlYG13jxlCbiLyuMp/t6Vuau/0p/fNJpASnDvl0UvoF/XIWrTx4nkfR02Fa2gCDFUFTgq84aKbWwygYKR0Qdaici7Vz/kP53Dc7AikZl5AcXsAJjhpC/cqKCp01MOcL0Ld0YBtacupOrIHIApDgOu8e2WitB/qjegUvK1h6PwXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jEjf4ch9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507Afflo025761;
	Tue, 7 Jan 2025 13:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSdzEm08lsBGc08NAggX/tt0VgwWKdoXo57PETNi5LY=; b=jEjf4ch9pBBXHabY
	y5th0Dtoq052pJ2e1L4tEEx74KL8mziOgYljqIqVEgx/cq08eKxnxZ8eV7v8yy/5
	ZyLwJ+N/4rspvjHnMPN2VKn3N3BCSz/M37PyfvhFN0SmA6Z4IN4F34Y7VgDkF0/L
	H6tpftn1kEUTPvmW4vzV/xkVhLv4/MLnT8x3X7+QaRWC6/Hw9zncUmGXeBLCpnJz
	Nm+j/KPo7T29xB5kywX3LMYgCygEwdrv+Fy2TaNoft95R8oDSo4F44xW6blEw4kt
	cAgoqogWMA0vayegBSp0KoV+WtKV0p18QcrWa0trBEzRKR70yKbBWcBuER5mVlBn
	3blJ9g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4412r78eqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 13:56:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 507DuxvC027495
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 13:56:59 GMT
Received: from [10.218.43.20] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 05:56:55 -0800
Message-ID: <c0ae7ca0-6855-45ff-b466-7c1c312c760b@quicinc.com>
Date: Tue, 7 Jan 2025 19:26:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8] scsi: ufs: qcom: Enable UFS Shared ICE Feature
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <andersson@kernel.org>, <bvanassche@acm.org>, <ebiggers@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Naveen Kumar Goud Arepalli
	<quic_narepall@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
References: <20241224154725.8127-1-quic_rdwivedi@quicinc.com>
 <20250106140203.2euwwch4hnjtfbzl@thinkpad>
Content-Language: en-US
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
In-Reply-To: <20250106140203.2euwwch4hnjtfbzl@thinkpad>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nG8GL77hXMsimDfac5S41yTGF6VNaSuq
X-Proofpoint-ORIG-GUID: nG8GL77hXMsimDfac5S41yTGF6VNaSuq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 clxscore=1015 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501070117



On 06-Jan-25 7:32 PM, Manivannan Sadhasivam wrote:
> On Tue, Dec 24, 2024 at 09:17:25PM +0530, Ram Kumar Dwivedi wrote:
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
>>  drivers/ufs/host/ufs-qcom.c | 38 ++++++++++++++++++++++++++++++++++
>>  drivers/ufs/host/ufs-qcom.h | 41 ++++++++++++++++++++++++++++++++++++-
>>  2 files changed, 78 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index 68040b2ab5f8..ffc67b5d5c3e 100644
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
>> @@ -105,6 +106,26 @@ static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_dev *rcd)
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
>> @@ -196,6 +217,11 @@ static inline int ufs_qcom_ice_suspend(struct ufs_qcom_host *host)
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
>> @@ -435,6 +461,8 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
>>  		err = ufs_qcom_enable_lane_clks(host);
>>  		break;
>>  	case POST_CHANGE:
>> +		ufs_qcom_config_ice_allocator(host);
>> +
> 
> Any reason why this is not paired with ufs_qcom_ice_enable() below?
Hi Mani,

I have addressed this in the latest patchset.

Thanks,
Ram.
> 
>>  		/* check if UFS PHY moved from DISABLED to HIBERN8 */
>>  		err = ufs_qcom_check_hibern8(hba);
>>  		ufs_qcom_enable_hw_clk_gating(hba);
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
>> index b9de170983c9..92e2278b6a54 100644
>> --- a/drivers/ufs/host/ufs-qcom.h
>> +++ b/drivers/ufs/host/ufs-qcom.h
>> @@ -196,7 +196,8 @@ struct ufs_qcom_host {
>>  #ifdef CONFIG_SCSI_UFS_CRYPTO
>>  	struct qcom_ice *ice;
>>  #endif
>> -
>> +	#define UFS_QCOM_CAP_ICE_CONFIG BIT(0)
> 
> Do not place definition inside struct.
Hi Mani,

I have addressed this in the latest patchset.

Thanks,
Ram.

> 
>> +	u32 caps;
>>  	void __iomem *dev_ref_clk_ctrl_mmio;
>>  	bool is_dev_ref_clk_enabled;
>>  	struct ufs_hw_version hw_ver;
>> @@ -226,6 +227,44 @@ ufs_qcom_get_debug_reg_offset(struct ufs_qcom_host *host, u32 reg)
>>  	return UFS_CNTLR_3_x_x_VEN_REGS_OFFSET(reg);
>>  };
>>  
>> +#ifdef CONFIG_SCSI_UFS_CRYPTO
> 
> This guard is strictly not needed.

Hi Mani,

The ufs shared ice functionality needs to be enabled only when crypto is enabled. 
Hence we are guarding it.

Thanks,
Ram.



> 
>> +
>> +/* ICE configuration to share AES engines among TX stream and RX stream */
>> +#define ICE_ALLOCATOR_TYPE 2
>> +#define REG_UFS_MEM_ICE_CONFIG 0x260C
>> +#define REG_UFS_MEM_ICE_NUM_CORE  0x2664
> 
> These register definitions should go inside the enum at the top of this file.
> 
> Also move other ICE definitions above REG_UFS_CFG2_CGC_EN_ALL to align with
> other register definitions.

Hi Mani,

I have addressed this in the latest patchset.

Thanks,
Ram.
> 
> - Mani
> 


