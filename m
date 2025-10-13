Return-Path: <linux-arm-msm+bounces-76956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA24BD235A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 11:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8AF734E7D58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 09:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998ED2FBDE8;
	Mon, 13 Oct 2025 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TuaZQXaq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C819220F2A;
	Mon, 13 Oct 2025 09:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760346563; cv=none; b=uDDLN4wka6tX80sfI8brjusyuiqVOXoQb1eWZ/2cxsH705Mv19a37QCmjYF99olZ9BCwby4o4SWlS3KL/MvwIpEjCjrjfSldmVz7gFJWQbGpuswD6x6NOaqVM8qDzlJP+vdpJeaHQlBKnXhR72h3iz+B+fMv830m+nyVhYvzk8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760346563; c=relaxed/simple;
	bh=CEGyUCOX6ZS+T7FGMZnMIzPFYMbK7M/w/q09G8pHSyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MhWFeJkYk6vEX4aPf3LMUyP7nkXlh0k4ptzdBM9sWkgWUFnqsuGmIPKRkhwGRn/R0S4qsO1tik9Jw/7uuj2FNHW5k/lCd2QfbdRxBcuyJlVtm1p4o/EhJuQRpBoPiOtvFJbaa0DxWK2Zlmiyicof/sHXcPOHf1FOC0VTf8XQFdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TuaZQXaq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nTaA016994;
	Mon, 13 Oct 2025 09:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/QsF8cCoTrdE5JkRIq3DdpcjT6X1kiGNDmY0JMmq3Es=; b=TuaZQXaqoktwRqrt
	XduEe0BkAfx3bhpGsk1BlWiR8LTUQu8HqzmzedGioYtVRNdchzbxhCopnSu2/jXM
	gbw37U6hUL7cqgE65THG3Z9/0zpeVa+nwe/U+tvzbwBEg2I2qcUkGIAHBm7R/d0b
	YBDSWDXwAKPdDy+2Hi3VsjMnVDNbaoTXU7tSwsPq4NDLszm5MRxWc29zUmHlneCQ
	t6EP2b5faLSCtNJXdhbo7s/jWDHCJof44ZOnrRA0h2sRCGyYVv9XouLxT2LNN12h
	zxcsh3NER7TpPmqbUkAZtrr8bXswuo3I+SrquR49FCb3LaKmQng43d4mC6l48ayh
	pvkT2g==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbhv0wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 09:09:17 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59D99GAA006696
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 09:09:17 GMT
Received: from [10.151.36.184] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Mon, 13 Oct
 2025 02:09:14 -0700
Message-ID: <9567ae91-c15c-8677-de78-af7ecd792970@quicinc.com>
Date: Mon, 13 Oct 2025 14:39:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] mmc: sdhci-msm: Enable ICE support for non-cmdq eMMC
 devices
Content-Language: en-US
To: Adrian Hunter <adrian.hunter@intel.com>, <quic_asutoshd@quicinc.com>,
        <ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_varada@quicinc.com>
References: <20251008110758.718944-1-quic_mdalam@quicinc.com>
 <f4363815-a5bc-4f5a-80a1-7d4a17ad539b@intel.com>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <f4363815-a5bc-4f5a-80a1-7d4a17ad539b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXxT8WXAQbOjWB
 uUn13S+Kle/vfxlWjjKC9vM8GakYVpsfgP5yohs9u7RnvzffEFUtigYNymW0cEqUPJnLSa2IIzl
 IRMaBbZVC7xaG5sHEkKM4PAZyvdTer9zX8Zdmnvx1/N8yRiPZgYnyutrTiUiBy16uKirYV9eIlU
 5GvcLQAP5DZpP1dksdmzTBsBDwrfIdlM7BBMCCBGvZKynQNqFsTb0LQV7rwigkxSDLQymIo7gq0
 DSQXF7+o5CVZVI2F1aDtwTaezOIbLiEHiIO8UVQtI+mfuzjG8mBqnIG2nwU/jIVU5/jO+ira0Kk
 ovw/e7ZypThtj9khpxX6rfnZiIHuPkZi/aPhaVUnAqZEG/o54kip08K3MYFd5zSKeEqpqZJXiyr
 XO7hpykreV5A75GnHRJYEPRrdcOXlA==
X-Proofpoint-ORIG-GUID: DDmsexYeRQyWh7CfLQyG9hoQQk56C3xn
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ecc1be cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8
 a=x3r_CPxvIv0_Sjq9o70A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22 a=HhbK4dLum7pmb74im6QT:22 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
X-Proofpoint-GUID: DDmsexYeRQyWh7CfLQyG9hoQQk56C3xn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

Hi,

On 10/9/2025 5:59 PM, Adrian Hunter wrote:
> On 08/10/2025 14:07, Md Sadre Alam wrote:
>> Enable Inline Crypto Engine (ICE) support for eMMC devices that don't
>> use command queuing (CQE). This allows hardware-accelerated encryption
>> and decryption for standard eMMC operations without command queuing.
>>
>> The changes include:
>> - Add non-cmdq crypto register definitions
>> - Implement crypto configuration callback for non-cmdq operations
>> - Initialize ICE hardware during host setup for non-cmdq devices
>> - Integrate crypto configuration into the main request path
>>
>> This enables non-cmdq eMMC devices to benefit from hardware crypto
>> acceleration, improving performance for encrypted storage operations
>> while maintaining compatibility with existing cmdq crypto support.
>>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> ---
>>   drivers/mmc/host/cqhci.h     |  4 ++
>>   drivers/mmc/host/sdhci-msm.c | 74 +++++++++++++++++++++++++++++++++++-
>>   drivers/mmc/host/sdhci.c     | 20 ++++++++++
>>   drivers/mmc/host/sdhci.h     |  2 +
>>   4 files changed, 99 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
>> index ce189a1866b9..9bf236e27675 100644
>> --- a/drivers/mmc/host/cqhci.h
>> +++ b/drivers/mmc/host/cqhci.h
>> @@ -119,6 +119,10 @@
>>   /* command response argument */
>>   #define CQHCI_CRA			0x5C
>>   
>> +/* non command queue crypto enable register*/
>> +#define NONCQ_CRYPTO_PARM		0x70
>> +#define NONCQ_CRYPTO_DUN		0x74
> 
> Since cqhci is not using these, they might be better in sdhci-msm.c
Ok
> 
>> +
>>   /* crypto capabilities */
>>   #define CQHCI_CCAP			0x100
>>   #define CQHCI_CRYPTOCAP			0x104
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 4e5edbf2fc9b..2204c6abb3fe 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -157,6 +157,23 @@
>>   #define CQHCI_VENDOR_CFG1	0xA00
>>   #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN	(0x3 << 13)
>>   
>> +#define DISABLE_CRYPTO			BIT(15)
>> +#define CRYPTO_GENERAL_ENABLE		BIT(1)
>> +#define HC_VENDOR_SPECIFIC_FUNC4	0x260
>> +#define ICE_HCI_SUPPORT			BIT(28)
>> +
>> +/* SDHCI MSM ICE CTRL Info register offset */
>> +enum {
>> +	OFFSET_SDHCI_MSM_ICE_HCI_PARAM_CCI	= 0,
>> +	OFFSET_SDHCI_MSM_ICE_HCI_PARAM_CE	= 8,
>> +};
>> +
>> +/* SDHCI MSM ICE CTRL Info register masks */
>> +enum {
>> +	MASK_SDHCI_MSM_ICE_HCI_PARAM_CE		= 0x1,
>> +	MASK_SDHCI_MSM_ICE_HCI_PARAM_CCI	= 0xff
>> +};
> 
> Preferably use GENMASK() and FIELD_PREP()
Ok
> 
>> +
>>   struct sdhci_msm_offset {
>>   	u32 core_hc_mode;
>>   	u32 core_mci_data_cnt;
>> @@ -1882,9 +1899,47 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
>>    * Inline Crypto Engine (ICE) support                                        *
>>    *                                                                           *
>>   \*****************************************************************************/
>> -
> 
> Unnecessary to delete this line
Ok
> 
>>   #ifdef CONFIG_MMC_CRYPTO
>>   
>> +static int sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq,
>> +			     u32 slot)
>> +{
>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +	struct mmc_host *mmc = msm_host->mmc;
>> +	struct cqhci_host *cq_host = mmc->cqe_private;
>> +	unsigned int crypto_params = 0;
>> +	int key_index = 0;
>> +	bool bypass = true;
>> +	u64 dun = 0;
>> +
>> +	if (!mrq || !cq_host)
>> +		return -EINVAL;
> 
> It should not be possible to get here if (!mrq || !cq_host)
Ok, will remove it in next revision.
> 
>> +
>> +	if (mrq->crypto_ctx) {
>> +		dun = mrq->crypto_ctx->bc_dun[0];
>> +		bypass = false;
>> +		key_index = mrq->crypto_key_slot;
>> +	}
>> +
>> +	/* Configure ICE bypass mode */
>> +	crypto_params |= ((!bypass) & MASK_SDHCI_MSM_ICE_HCI_PARAM_CE)
>> +			 << OFFSET_SDHCI_MSM_ICE_HCI_PARAM_CE;
>> +	/* Configure Crypto Configure Index (CCI) */
>> +	crypto_params |= (key_index & MASK_SDHCI_MSM_ICE_HCI_PARAM_CCI)
>> +			 << OFFSET_SDHCI_MSM_ICE_HCI_PARAM_CCI;
>> +
>> +	cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
>> +
>> +	if (mrq->crypto_ctx)
>> +		cqhci_writel(cq_host, lower_32_bits(dun), NONCQ_CRYPTO_DUN);
>> +
>> +	/* Ensure crypto configuration is written before proceeding */
>> +	wmb();
>> +
>> +	return 0;
>> +}
>> +
>>   static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward decl */
>>   
>>   static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>> @@ -2131,6 +2186,8 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>>   	struct cqhci_host *cq_host;
>>   	bool dma64;
>>   	u32 cqcfg;
>> +	u32 config;
>> +	u32 ice_cap;
>>   	int ret;
>>   
>>   	/*
>> @@ -2185,6 +2242,18 @@ static int sdhci_msm_cqe_add_host(struct sdhci_host *host,
>>   	if (ret)
>>   		goto cleanup;
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
>> +
>>   	dev_info(&pdev->dev, "%s: CQE init: success\n",
>>   			mmc_hostname(host->mmc));
>>   	return ret;
>> @@ -2450,6 +2519,9 @@ static const struct of_device_id sdhci_msm_dt_match[] = {
>>   MODULE_DEVICE_TABLE(of, sdhci_msm_dt_match);
>>   
>>   static const struct sdhci_ops sdhci_msm_ops = {
>> +#ifdef CONFIG_MMC_CRYPTO
>> +	.crypto_engine_cfg = sdhci_msm_ice_cfg,
>> +#endif
>>   	.reset = sdhci_and_cqhci_reset,
>>   	.set_clock = sdhci_msm_set_clock,
>>   	.get_min_clock = sdhci_msm_get_min_clock,
>> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
>> index ac7e11f37af7..2d636a8ee452 100644
>> --- a/drivers/mmc/host/sdhci.c
>> +++ b/drivers/mmc/host/sdhci.c
>> @@ -2202,6 +2202,21 @@ void sdhci_set_power_and_bus_voltage(struct sdhci_host *host,
>>   }
>>   EXPORT_SYMBOL_GPL(sdhci_set_power_and_bus_voltage);
>>   
>> +static int sdhci_crypto_cfg(struct sdhci_host *host, struct mmc_request *mrq,
>> +			    u32 slot)
>> +{
>> +	int err = 0;
>> +
>> +	if (host->ops->crypto_engine_cfg) {
>> +		err = host->ops->crypto_engine_cfg(host, mrq, slot);
>> +		if (err)
>> +			pr_err("%s: failed to configure crypto: %d\n",
>> +			       mmc_hostname(host->mmc), err);
>> +	}
>> +
>> +	return err;
>> +}
>> +
>>   /*****************************************************************************\
>>    *                                                                           *
>>    * MMC callbacks                                                             *
>> @@ -2227,6 +2242,11 @@ void sdhci_request(struct mmc_host *mmc, struct mmc_request *mrq)
>>   
>>   	cmd = sdhci_manual_cmd23(host, mrq) ? mrq->sbc : mrq->cmd;
>>   
>> +	if (mmc->caps2 & MMC_CAP2_CRYPTO) {
>> +		if (sdhci_crypto_cfg(host, mrq, 0))
>> +			goto out_finish;
>> +	}
> 
> It would be preferable to hook the >request() callback e.g.
> 
> 	host->mmc_host_ops.request = sdhci_msm_request;
> 
> void sdhci_msm_request(struct mmc_host *mmc, struct mmc_request *mrq)
> {
> 	if (mmc->caps2 & MMC_CAP2_CRYPTO) {
> 		etc
> 	}
> 
> 	sdhci_request(mmc, mrq);
> }
Thanks for the suggestion. I Will update the patch to override the 
mmc_host_ops.request callback in sdhci-msm.c via a platform-specific 
wrapper (sdhci_msm_request). Since mmc->ops is a const pointer, I Will 
clone the existing ops into a local copy (msm_mmc_ops) and replaced only 
the request field. This preserves all platform-specific callbacks like 
enable_sdio_irq and avoids probe failures. The change in probe function.

#ifdef CONFIG_MMC_CRYPTO
	memcpy(&msm_host->msm_mmc_ops, msm_host->mmc->ops, sizeof(struct
         mmc_host_ops));
         msm_host->msm_mmc_ops.request = sdhci_msm_request;
         msm_host->mmc->ops = &msm_host->msm_mmc_ops;
#endif


Thanks,
Alam.

