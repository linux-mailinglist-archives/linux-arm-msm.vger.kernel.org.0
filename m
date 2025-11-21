Return-Path: <linux-arm-msm+bounces-82774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0250C77973
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 07:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id B08342B175
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 06:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8A832FA21;
	Fri, 21 Nov 2025 06:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Iiq1Ratm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7942732FA13;
	Fri, 21 Nov 2025 06:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763706854; cv=none; b=Bg0+vCJ7PRQDRdPj6zDQie5j01f5ZREDEDQcQ35q4iGcQcsxs09dgmUB5wt5aGgOA8rZBiro9lyKSbV8FF9ULW3K7VLxikP/GTon6o+U+kPxFxa1T3pUcvMyevHoOIGcF6nHK9bzNHM5lhxVZzzX9Rnp2gPSuBL/94h2ATrUIyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763706854; c=relaxed/simple;
	bh=wM4h9zETsjDhlCy92AY4YtY1TsWx0Kmiel7MN8Ltj7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XlBzHFkKB27uurYjFG/YAkQa8ECfaMMVBZEszDi8Z4i8b5owzfF6sO2NEm5KfqIVc/Gz0nMc5WCc5TJTJQGI7Pf1TGQFYwB78dd7vpC1fHao4ze2Gn5wmwoJvsTT+z1evw4m/33p9Ln1lJ6K6YKR6RliwUYFHUE133TpVGNAEKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Iiq1Ratm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL53APT3007810;
	Fri, 21 Nov 2025 06:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85FzKKrAaxuhvTQryLqbmntSSBcMRGyWDzOaUeZwxGM=; b=Iiq1RatmfkiP/tn7
	Jqb8L1IGQsuYlqwdptsKa8TLahulx9yl9WE0EuSQjf8g/hwnPb7OBtbg4tzYI/OI
	RSY86qNzZjQbCZhLSMzMgqqzgwhXXtbDOLnRoyoRk7ge0o4B/ev8XNAdxnowv82T
	1Jh53wvtgFOeaVmEwkYoeJSpC+nWCJEDn5f7g/v0xlEr84mYU574wOGW0wu2wG7a
	r1Wb2FfN46I4I5zgyr/T5w9t11FjIYMMWkM3Fn47uDp373zp6/t+ul3VwHbJYwNu
	KnSBz90Oo/+04/31zWtFDq/9J2FD3rG/qHig65JJ7jJOmjFhfGQdpuOJn25ZOi7M
	QQAgmg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkf0714-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 06:34:00 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AL6Xxtk013477
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 06:33:59 GMT
Received: from [10.151.36.184] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 20 Nov
 2025 22:33:57 -0800
Message-ID: <4b65983a-4450-5d00-b52b-0bd5b1f7221b@quicinc.com>
Date: Fri, 21 Nov 2025 12:03:54 +0530
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
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>
CC: <adrian.hunter@intel.com>, <ulf.hansson@linaro.org>,
        <abel.vesa@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20251119114653.751992-1-quic_mdalam@quicinc.com>
 <20251121021232.GD3078357@google.com>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20251121021232.GD3078357@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QCEsaOUTustvpOZeVeRLWN5I1hRhi40-
X-Authority-Analysis: v=2.4 cv=ApPjHe9P c=1 sm=1 tr=0 ts=692007d8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=U4AJboV-CIkSIaYJ-h8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: QCEsaOUTustvpOZeVeRLWN5I1hRhi40-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA0OSBTYWx0ZWRfXw41l50JG9uyS
 kdaYESy+qXL5H7n1Qm00EoiUa9+U82DJ9qgVRm4MPFKCGHkN0abHhRyvgiEyKfMIDZzBOvOATgV
 +wsNETv8KVVaUFrzrBr4Rtb2HboPgRDPt43bGcj3pwcG25FsgVTA/G92vHuXm65wZ1fPlOFOyes
 qhdRX7sa/MsZPLTLlXYNqGl6Au5GpM47l7R/EIamWt5IkzJMysnnwf+8TgeUbXqOjK3VTHpx/R1
 WceMJdX4ZXEuP5EJfaDaKxFvLjzs4w8jN8kg3g4/1p5uODLrrM/WbbhOXRriTx5SZPTw2eNdE40
 qIoHIGP68ai87UMniFjpV9S4wB6pPPTw7LaZFvNFslEpfROPlDNAoh2mIAGmimmR7MwmVttCEvi
 pHuxxvevpPia96y4sqlmj+4UWLcefg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210049

Hi,

On 11/21/2025 7:42 AM, Eric Biggers wrote:
> On Wed, Nov 19, 2025 at 05:16:53PM +0530, Md Sadre Alam wrote:
>>   struct sdhci_msm_offset {
>>   	u32 core_hc_mode;
>>   	u32 core_mci_data_cnt;
>> @@ -300,6 +312,7 @@ struct sdhci_msm_host {
>>   	u32 dll_config;
>>   	u32 ddr_config;
>>   	bool vqmmc_enabled;
>> +	bool ice_init_done;
> 
> Rename to non_cqe_ice_init_done
Ok
> 
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
> 
> Why would ICE_HCI_SUPPORT not be set here?  When this is called, the
> driver is already in the middle of processing an mmc_request with an
> encryption context, due to the driver advertising that it supports
> inline crypto earlier.  If the hardware doesn't actually support inline
> crypto, that has to be detected earlier.  But I thought it already does.
> So it's unclear what checking ICE_HCI_SUPPORT here is meant to achieve.
You're right — by the time we reach sdhci_msm_request(), the driver has 
already advertised inline crypto support and is processing a request 
with an encryption context.The check for ICE_HCI_SUPPORT here seems
redundant given the existing capability detection.
I’ll drop this check in next revision.

> 
>> +static int sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq)
> 
> This should return void.
> 
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
> 
> No need for the crypto_enable variable.  Just use:
> 
> 	FIELD_PREP(ICE_HCI_PARAM_CE, 1).
ok
> 
> Also no need for the dun variable.  Just use:
> 
> 	cqhci_writel(cq_host, lower_32_bits(mrq->crypto_ctx->bc_dun[0]),
> 		     NONCQ_CRYPTO_DUN);
ok
> 
>> + * For CQE requests, crypto is handled in cqhci_request() in
>> + * drivers/mmc/host/cqhci-core.c using the existing CQE crypto infrastructure.
> 
> It's recommended to not reference file paths like this in kernel code,
> since files are sometimes moved around.
Sure, Will rewrite the comment in next revision.

Thanks,
Alam.



