Return-Path: <linux-arm-msm+bounces-82773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 642E8C77921
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 07:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id BCE092CC6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 06:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680773191CF;
	Fri, 21 Nov 2025 06:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NksJj0P9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2763161BA;
	Fri, 21 Nov 2025 06:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763706528; cv=none; b=dlZQTPzcYuWKfNwr67oGZpkRSEJ2keZ4uZrYii3Xu4E3jzEcNY/CAB4U/l9QqfZFerNNLDt8IkxqEJPbBZoX15VDjPM4MsXhJX99ABKwElamzngOz32orkKgtv3g2UY/CYD0ibYB+ro+xKKeg2x7mKIbjNou5sI0ytdYfkJafPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763706528; c=relaxed/simple;
	bh=HWeLwzR/gREm+FU5bdtvDC06z10LRY9cOfKIHH+AyyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=h5ntTAeHuZsQAKsyILG2dwqWw18KWnOUmJGdT+iYgdbc4rMxwuKYntnDZC6lhNwCo2/AzacHowedCOrfvy9qZXkCh+L5+ZjwrwNj4GL1RFWzGAfk1t3uDMW8RcUT+YIdFqoyqgbZiEbjiZtDAA1iyctmZ2TEykmOD5cU1lkN+Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NksJj0P9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKMKApb1843280;
	Fri, 21 Nov 2025 06:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+ltXzNK1cY6bp0QQ2wAdAGc4kfZ7jV9X0iu85MAzDo=; b=NksJj0P9WBf+FEoa
	lqsnRRyydkZPJLkr06uxKehJ5b/I9A2ztyjGWlLhimNebG433kY20YqyLPF9kXBu
	mwszGQGlglXyUgF3O39BcVUrD3ADfCzbN+ZVTpLABhby90wmqIR4WwRR8KSGn4Uv
	AXGCYhNZiWkRuYjHXc9pQlhcXG66rOLApizmMbyEk1FiomvzCKK641U3ui9wmVkm
	RrXDHnoANjTaXs0AZPgECDyqMEr6fZOIXSN5uz8V3OeNEB+4lPoUH4nFVGGTGs89
	vpul9x0XnWrGcWbTZmxz8shGgsgtyJ+NK57DatecDRIBeNDrqqaUuZPeyTfdciMF
	rT7e4Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajbpns4pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 06:28:41 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AL6Sf9T028804
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 06:28:41 GMT
Received: from [10.151.36.184] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 20 Nov
 2025 22:28:39 -0800
Message-ID: <7c8f9365-a142-9d86-eb40-7e430a13ef13@quicinc.com>
Date: Fri, 21 Nov 2025 11:58:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5] mmc: sdhci-msm: Enable ICE for CQE-capable controllers
 with non-CQE cards
To: Adrian Hunter <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <abel.vesa@linaro.org>, <ebiggers@google.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20251119114653.751992-1-quic_mdalam@quicinc.com>
 <2888130d-3910-49fe-95ef-3864b1e2ff2d@intel.com>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <2888130d-3910-49fe-95ef-3864b1e2ff2d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=69200699 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8
 a=8dEr0woXMqjU5OLqz8oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: q40CC4Ir_-17gN1-4-H2_V3hy86U2I_o
X-Proofpoint-GUID: q40CC4Ir_-17gN1-4-H2_V3hy86U2I_o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA0OCBTYWx0ZWRfX/Lb+mCce7Obu
 eN0Uv35dDYaSwZByTm3wAoBLmL/2T6tquJn7F065OpxS5DeUWmk0HSYztIClQWVIWiuwmZ3n7lM
 1q3abk/iB4Pq02exlQEf+xV41zIiZOwlZB1Q9vK/Q1GG+pvmTahWjSqaQ1WE3J2FgFpPJ2F285w
 U4UHfMo4WU7mTNkrXDvq2bWqlUHi+liK/GNncIEJveVBPWkXZQ8VKzaUFqiEdO/icBMAMXtDZ2/
 9nklWcutm7dnQlLBjwoESZQ8ZKrhS7NSxJSA05mEGrLLibuaV6/pE1kF6SmcfGBv75rsE/Od1/P
 6c9hHOHe46vQXo+h226/SV+ktDgb4YaLsha4St8335uRZwXxIRvxDBCoOG9npX/QVO42WcEyv7f
 0TsfDoYM51H3R3mFEfdhGEFxglYrWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210048

Hi,

On 11/20/2025 12:10 PM, Adrian Hunter wrote:
> On 19/11/2025 13:46, Md Sadre Alam wrote:
>> Enable Inline Crypto Engine (ICE) support for CQE-capable sdhci-msm
>> controllers when used with eMMC cards that do not support CQE.
>>
>> This addresses the scenario where:
>> - The host controller supports CQE (and has CQHCI crypto infrastructure)
>> - The eMMC card does not support CQE
>> - Standard (non-CMDQ) requests need crypto support
>>
>> This allows hardware-accelerated encryption and decryption for standard
>> requests on CQE-capable hardware by utilizing the existing CQHCI crypto
>> register space even when CQE functionality is not available due to card
>> limitations.
>>
>> The implementation:
>> - Adds ICE register definitions for non-CQE crypto configuration
>> - Implements per-request crypto setup via sdhci_msm_ice_cfg()
>> - Hooks into the request path via mmc_host_ops.request for non-CQE requests
>> - Uses CQHCI register space (NONCQ_CRYPTO_PARM/DUN) for crypto configuration
>>
>> With this, CQE-capable controllers can benefit from inline encryption
>> when paired with non-CQE cards, improving performance for encrypted I/O
>> while maintaining compatibility with existing CQE crypto support.
>>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>
>> Change in [v5]
>>
>> * Removed unused variable
>>
>> * Added proper comment for sdhci_msm_request()
>>
>> * Removed sdhci_msm_ice_enable(); it is already invoked during resume
>>
>> Change in [v4]
>>
>> * Moved ICE initialization for non cmdq into sdhci_msm_ice_cfg() and made
>>    it conditional on mrq->crypto_ctx to enable lazy setup.
>>
>> * Added msm_host->ice_init_done guard to prevent redundant initialization.
>>
>> * Updated commit message
>>
>> Change in [v3]
>>
>> * Refactored logic to use separate code paths for crypto_ctx != NULL and
>>    crypto_ctx == NULL to improve readability.
>>
>> * Renamed bypass to crypto_enable to align with bitfield semantics.
>>
>> * Removed slot variable
>>
>> * Added ICE initialization sequence for non-CMDQ eMMC devices before
>>    __sdhci_add_host()
>>
>> Change in [v2]
>>
>> * Moved NONCQ_CRYPTO_PARM and NONCQ_CRYPTO_DUN register definitions into
>>    sdhci-msm.c
>>
>> * Introduced use of GENMASK() and FIELD_PREP() macros for cleaner and more
>>    maintainable bitfield handling in ICE configuration.
>>
>> * Removed redundant if (!mrq || !cq_host) check from sdhci_msm_ice_cfg()
>>    as both are guaranteed to be valid in the current call path.
>>
>> * Added assignment of host->mmc_host_ops.request = sdhci_msm_request; to
>>    integrate ICE configuration into the standard request path for non-CMDQ
>>    eMMC devices.
>>
>> * Removed sdhci_crypto_cfg() from sdhci.c and its invocation in sdhci_request()
>>
>> Change in [v1]
>>
>> * Added initial support for Inline Crypto Engine (ICE) on non-CMDQ eMMC
>>    devices.
>>
>>   drivers/mmc/host/sdhci-msm.c | 101 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 101 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 4e5edbf2fc9b..69c67242519c 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -157,6 +157,18 @@
>>   #define CQHCI_VENDOR_CFG1	0xA00
>>   #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN	(0x3 << 13)
>>   
>> +/* non command queue crypto enable register*/
>> +#define NONCQ_CRYPTO_PARM		0x70
>> +#define NONCQ_CRYPTO_DUN		0x74
>> +
>> +#define DISABLE_CRYPTO			BIT(15)
>> +#define CRYPTO_GENERAL_ENABLE		BIT(1)
>> +#define HC_VENDOR_SPECIFIC_FUNC4	0x260
>> +#define ICE_HCI_SUPPORT			BIT(28)
>> +
>> +#define ICE_HCI_PARAM_CCI	GENMASK(7, 0)
>> +#define ICE_HCI_PARAM_CE	GENMASK(8, 8)
>> +
>>   struct sdhci_msm_offset {
>>   	u32 core_hc_mode;
>>   	u32 core_mci_data_cnt;
>> @@ -300,6 +312,7 @@ struct sdhci_msm_host {
>>   	u32 dll_config;
>>   	u32 ddr_config;
>>   	bool vqmmc_enabled;
>> +	bool ice_init_done;
>>   };
>>   
>>   static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>> @@ -2009,6 +2022,91 @@ static int sdhci_msm_ice_keyslot_evict(struct blk_crypto_profile *profile,
>>   	return qcom_ice_evict_key(msm_host->ice, slot);
>>   }
>>   
>> +static void sdhci_msm_non_cqe_ice_init(struct sdhci_host *host)
>> +{
>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +	struct mmc_host *mmc = msm_host->mmc;
>> +	struct cqhci_host *cq_host = mmc->cqe_private;
>> +	u32 config;
>> +	u32 ice_cap;
>> +
>> +	config = sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
>> +	config &= ~DISABLE_CRYPTO;
>> +	sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
>> +	ice_cap = cqhci_readl(cq_host, CQHCI_CAP);
>> +	if (ice_cap & ICE_HCI_SUPPORT) {
>> +		config = cqhci_readl(cq_host, CQHCI_CFG);
>> +		config |= CRYPTO_GENERAL_ENABLE;
>> +		cqhci_writel(cq_host, config, CQHCI_CFG);
>> +	}
>> +}
>> +
>> +static int sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq)
>> +{
>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +	struct mmc_host *mmc = msm_host->mmc;
>> +	struct cqhci_host *cq_host = mmc->cqe_private;
>> +	unsigned int crypto_params = 0;
>> +	int key_index;
>> +	bool crypto_enable;
>> +	u64 dun = 0;
>> +
>> +	if (mrq->crypto_ctx) {
>> +		if (!msm_host->ice_init_done) {
>> +			sdhci_msm_non_cqe_ice_init(host);
>> +			msm_host->ice_init_done = true;
>> +		}
>> +
>> +		crypto_enable = true;
>> +		dun = mrq->crypto_ctx->bc_dun[0];
>> +		key_index = mrq->crypto_key_slot;
>> +		crypto_params = FIELD_PREP(ICE_HCI_PARAM_CE, crypto_enable) |
>> +				FIELD_PREP(ICE_HCI_PARAM_CCI, key_index);
>> +
>> +		cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
>> +		cqhci_writel(cq_host, lower_32_bits(dun), NONCQ_CRYPTO_DUN);
>> +	} else {
>> +		cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
>> +	}
>> +
>> +	/* Ensure crypto configuration is written before proceeding */
>> +	wmb();
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * sdhci_msm_request - Handle non-CQE MMC requests with crypto support
>> + * @mmc: MMC host
>> + * @mrq: MMC request
>> + *
>> + * This function is called for non-CQE requests only. The MMC block layer
>> + * routes requests as follows:
>> + *
>> + * if (host->cqe_enabled)
>> + *     ret = mmc_blk_cqe_issue_rw_rq(mq, req);  // → cqhci_request()
>> + * else
>> + *     ret = mmc_blk_mq_issue_rw_rq(mq, req);   // → sdhci_msm_request()
>> + *
>> + * For CQE requests, crypto is handled in cqhci_request() in
>> + * drivers/mmc/host/cqhci-core.c using the existing CQE crypto infrastructure.
>> + *
>> + * For non-CQE requests, this function provides crypto support by configuring
>> + * the ICE (Inline Crypto Engine) registers before passing the request to
>> + * the standard SDHCI request handler.
>> + */
> 
> Kernel-style is not to put kernel-doc like comments on call-back
> functions, since the functionality is defined by the upper layer,
> and there is no point duplicating the information for every single
> implementation.
Thanks for pointing this out. Will drop this comment from 
sdhci_msm_request().
> 
>> +static void sdhci_msm_request(struct mmc_host *mmc, struct mmc_request *mrq)
>> +{
>> +	struct sdhci_host *host = mmc_priv(mmc);
>> +
> 
> A simple comment here would suffice, say something like:
> 
> 	/* Only need to handle non-CQE crypto requests in this path */
Ok, Will add in next revision.
> 

Thanks,
Alam.

