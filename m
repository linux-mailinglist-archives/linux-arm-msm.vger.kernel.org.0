Return-Path: <linux-arm-msm+bounces-81176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E8184C4B922
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 06:51:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0A1C934E0A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 05:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A6426E6F7;
	Tue, 11 Nov 2025 05:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gJAMKUAP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F8825A2BB;
	Tue, 11 Nov 2025 05:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762840276; cv=none; b=LeCIEqGsd//Z2ldifiuVNfTMeAz75ncBraSxs/QA5he6zwmXcraX99S2knTaAFvF03qZSZDYlLbz+GNfUBuj7jzAeSkE6T86NGm5NH4+aJE8lMECOWX0gve4hRqj/ed+YDAhn8tQISV2KnNm/YGC3zJhYNMHbnXuHHnJx/1gnKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762840276; c=relaxed/simple;
	bh=/SLqfswm1aBdyVMt43HObYBoVG/w5wutjuTmSL5va/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rXyAqCKYT2EZQQM/h1IlwiK5iv5e3a074Rtv0Uk4gETDZBAkF6hMc0sMJRI6Fq6kLYLR6QfGFBfWuoH+Xi2YtJi9qxTNAI1R88cfycReSEqqV9EZ4gydOAyDltYkUYK4xxT5IkoHbCVH/G1/TiP6H0e9yuH8wP4fAzlvWZg+uSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gJAMKUAP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB46BMV4167218;
	Tue, 11 Nov 2025 05:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q/zBP6T7BvWjd8aqlVDbZzBTQ4nfBaqYzBBH1DcIAKo=; b=gJAMKUAPEEDN2cJ2
	IqwnnBafP9aylzBIeHvOCqFkL9AmPYfosrJqekFiBywoiOTgHtxY7Bn21ZnNVUbP
	IWINvRtLCARSmnr/co330PgpHkAw3XEaoX10CUUIFWgAkFm/MBK5W3uArCIFg44x
	ucZ7su5y9lw/IMK7NAJcd7FoFgK7NDYKWrWTmlNlkSY/M/n1NUSLP85XfGvOtrDI
	Q0Nal7jh4zsBPVaqUaJXUeGwI17fq994FNh3YBCvLPb3yWOSsyii+1PDdirR5fd7
	VjUoza0tSUyFQKrf2S96X3MmBjSXrIEhndsKr1LPzWUHDgO84TkCZc1Cb1F0msZm
	IdHKUQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abm4a1sw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 05:51:08 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AB5p747001273
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 05:51:07 GMT
Received: from [10.151.36.184] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 10 Nov
 2025 21:50:04 -0800
Message-ID: <392ba04d-66c5-96c3-628d-8c9edf49333b@quicinc.com>
Date: Tue, 11 Nov 2025 11:19:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC
 devices
To: Adrian Hunter <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@kernel.org>
CC: <quic_varada@quicinc.com>
References: <20251104063943.3424529-1-quic_mdalam@quicinc.com>
 <ae37c98b-927e-44e4-b83c-71753d61e2cc@intel.com>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <ae37c98b-927e-44e4-b83c-71753d61e2cc@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EQT8Iv1VyiPAk4vbWTE-t7LO_WtpKUSj
X-Authority-Analysis: v=2.4 cv=G6kR0tk5 c=1 sm=1 tr=0 ts=6912cecc cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8
 a=8BPlPp1vl7OZ_UTcvjIA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22 a=HhbK4dLum7pmb74im6QT:22 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-ORIG-GUID: EQT8Iv1VyiPAk4vbWTE-t7LO_WtpKUSj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA0MyBTYWx0ZWRfX7a5FbUEglhEp
 ShyDEpce/Bv1nYnRcjN5XKn5UIqE5ovhQYHva7qbGEtWan068k/BZtJm/r05J1Bs19R1yyZL5k6
 h0Tgo/oOHj8DpSwhmuj9A8LQwROffSvmmykkEsXi09p6BWCF5/BZ7zt9fmz+5xDE5ju5NJ8Wlju
 7Atggy10d6MhKv5k5JGGWf4zoPEedr6Rrva6G87dt0rpOS+hJBPnX4td1fNRppAakgf7n1Alnbm
 Km8n43dAajgr/KF48Ww8GS1ZwQ356IYdcSsSuhS/sEqqpumPbfRWHju7cVJHY5iJpcnOeASYJSH
 kjUdaw75LAJR0rZaFDnSu/Ay3USv09IXbyFqIbotZbbfRUhBIquzpkLgJhjr8uT05rZIn0tfMgD
 UGhYtH+9B++eVkD1VffOuI1CLmPm0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110043

Hi,

On 11/10/2025 2:16 PM, Adrian Hunter wrote:
> On 04/11/2025 08:39, Md Sadre Alam wrote:
>> Enable Inline Crypto Engine (ICE) support for eMMC devices that operate
>> without Command Queue Engine (CQE).This allows hardware-accelerated
>> encryption and decryption for standard (non-CMDQ) requests.
>>
>> This patch:
>> - Adds ICE register definitions for non-CMDQ crypto configuration
>> - Implements a per-request crypto setup via sdhci_msm_ice_cfg()
>> - Hooks into the request path via mmc_host_ops.request
>> - Initializes ICE hardware during CQE setup for compatible platforms
>>
>> With this, non-CMDQ eMMC devices can benefit from inline encryption,
>> improving performance for encrypted I/O while maintaining compatibility
>> with existing CQE crypto support.
>>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
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
>>   drivers/mmc/host/sdhci-msm.c | 71 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 71 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 4e5edbf2fc9b..6ce205238720 100644
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
>> @@ -1885,6 +1897,48 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>>   
>>   #ifdef CONFIG_MMC_CRYPTO
>>   
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
>> +		crypto_enable = true;
>> +		dun = mrq->crypto_ctx->bc_dun[0];
>> +		key_index = mrq->crypto_key_slot;
>> +		crypto_params = FIELD_PREP(ICE_HCI_PARAM_CE, crypto_enable) |
>> +				FIELD_PREP(ICE_HCI_PARAM_CCI, key_index);
>> +
>> +		cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
>> +		cqhci_writel(cq_host, lower_32_bits(dun), NONCQ_CRYPTO_DUN);
>> +	} else {
>> +		crypto_enable = false;
>> +		key_index = 0;
>> +		cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
>> +	}
>> +
>> +	/* Ensure crypto configuration is written before proceeding */
>> +	wmb();
>> +
>> +	return 0;
>> +}
>> +
>> +static void sdhci_msm_request(struct mmc_host *mmc, struct mmc_request *mrq)
>> +{
>> +	struct sdhci_host *host = mmc_priv(mmc);
>> +
>> +	if (mmc->caps2 & MMC_CAP2_CRYPTO)
>> +		sdhci_msm_ice_cfg(host, mrq);
>> +
>> +	sdhci_request(mmc, mrq);
>> +}
>> +
>>   static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
>>   
>>   static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>> @@ -2131,6 +2185,8 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>>   	struct cqhci_host *cq_host;
>>   	bool dma64;
>>   	u32 cqcfg;
>> +	u32 config;
>> +	u32 ice_cap;
>>   	int ret;
>>   
>>   	/*
>> @@ -2181,6 +2237,18 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>>   	if (host->flags & SDHCI_USE_64_BIT_DMA)
>>   		host->desc_sz = 12;
>>   
>> +	/* Initialize ICE for non-CMDQ eMMC devices */
>> +	config = sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
>> +	config &= ~DISABLE_CRYPTO;
>> +	sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
>> +	ice_cap = cqhci_readl(cq_host, CQHCI_CAP);
>> +	if (ice_cap & ICE_HCI_SUPPORT) {
>> +		config = cqhci_readl(cq_host, CQHCI_CFG);
>> +		config |= CRYPTO_GENERAL_ENABLE;
>> +		cqhci_writel(cq_host, config, CQHCI_CFG);
>> +	}
>> +	sdhci_msm_ice_enable(msm_host);
> 
> Perhaps this could all be done lazily in sdhci_msm_ice_cfg() ?
> e.g.
> 
> 	if (mrq->crypto_ctx) {
> 		if (!msm_host->ice_init_done) {
> 			sdhci_msm_non_cqe_ice_init(host, ...);
> 			msm_host->ice_init_done = true;
> 		}
> 		...
>
Thanks for the suggestion! Lazily initializing ICE in 
sdhci_msm_ice_cfg() based on mrq->crypto_ctx does seem like
a clean and efficient approach. It would avoid unnecessary
setup when crypto isn't involved and keep the init path tightly
scoped.

Let me check and add in next revision.

Thanks,
Alam.



