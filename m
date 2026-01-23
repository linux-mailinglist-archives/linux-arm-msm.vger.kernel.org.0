Return-Path: <linux-arm-msm+bounces-90280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGAnMDERc2klsAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:12:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E904570CA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 07:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C1BA301FF91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 06:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 648CB39F8BF;
	Fri, 23 Jan 2026 06:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SHJxauZ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D7539DB1D;
	Fri, 23 Jan 2026 06:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769148623; cv=none; b=iDSWmXfi303yfVxsOi1ZvxxMW7ODNJnn0ivEm7GlXQWjC431bZ/YUoAxFUmJ9OyuV6l6bWYiEuKGkjGoSo0eHZk7zgUjgIrKy++dJzqJTRn8vlyKg718j/klqH0txlfk6pAfcY14KMDojWpTu+ghFUQ5ba9WAU2fTqYmK452Qx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769148623; c=relaxed/simple;
	bh=dfpWKxpIfuxVovqrNknmYppEYvMNoabwozeJP6tGAxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VmFhThyE40xNB1/jnIuXgWJ0CG32+LYRQHLgWDcyKcZNv3rH6Z8rFgui3Zatc59K5BDCj0g6OHwg/6G9gl+gnOzJr1HyX+5sxmItDCwS07n9iC84kE3hksmRX0jX1+wChDJGLRjaT+kTrXQBkVk47WYZeqqIssvN7v/zB8QCtyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SHJxauZ9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N5m0S53504255;
	Fri, 23 Jan 2026 06:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yhhc+9jljv1DLMMKeNn6k6bItM8clsa4abB8yMtaIJY=; b=SHJxauZ9SopCrhyx
	oAMa1eOnKlw+EP7tPs7oEgsOgwLL4xa2O+htT2uZ9/EkNidrj2cbRfrUNNHfXUpR
	RekzMV6E2QjABohaMv17/I5xDIT/A/bu6i4zkMUiD4LXmFTWpyU0X/ym/7xGx40z
	U/AiMAhoXjL6Z5aU9AVA7EkLOupekGqNLjNlabBhW9S5rSwo5zeZzRx026ln9hTb
	PjHDE42BIlpR8pOzLkmk+sfjsITyqQfX4Kgo4h4Pu7icEfUBoY9FjIwuQZf0qXih
	aSMXqpBA4dZ7vmN3DxDFQP80Vw6FnZO6FyNjydz+KeqeXcPgf4caTDbOSHrBsMna
	Q29vSw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bus981x1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 06:10:09 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 60N6A95u016585
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 06:10:09 GMT
Received: from [10.151.36.184] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 22:10:06 -0800
Message-ID: <3df0ad20-61c0-73c4-be8f-aea43f70cb69@quicinc.com>
Date: Fri, 23 Jan 2026 11:39:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6] mmc: sdhci-msm: Enable ICE for CQE-capable controllers
 with non-CQE cards
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: <adrian.hunter@intel.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <abel.vesa@linaro.org>, <ebiggers@kernel.org>
References: <20251126064251.1928529-1-quic_mdalam@quicinc.com>
 <CAPDyKFppNgYvHJDqfvyQ0DTYCwgcSR12D+-=04NGEDtbM8FmTA@mail.gmail.com>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <CAPDyKFppNgYvHJDqfvyQ0DTYCwgcSR12D+-=04NGEDtbM8FmTA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA0NCBTYWx0ZWRfXyGbOkZShMDxr
 D6sgbajJWy24htHb8PE7mHfAQpWPoio91dcKvl/W5PXaeFjQ+mzb+GV+IoAInstrKZaTetyKFsE
 boehyCgZp+WuEltm8n07R0p9xA38rtiw1HYu9TW/4l1BrMd1VDSBxxP6mDnkyHu868luQApKnb1
 df7o/hn60gfA7pbHz4EFel9cE0sOdMmyvhRsHuoAtBAcXXFxM/wNpeKS7g29vLq1531U3K6AXFk
 2qfYygRoZaVNYjUMmdiZ/qAHO3Ebs0U7TRkj1+9J/iU8AnHL1vNs90T72gpO9ZBtzHShSLVe2KQ
 /u9kxTHQpjJfWwj1FXpSx3ae171Rva1kAI80t6ynKOMRFr64c5GvPfgGMyQIVDSxrTPACFvIH1k
 aVJvIxAVU5HMohU1O7jZB7s1lDc8aQvwddR1PK0KfsQVkAuS/1foq8pOQHVYi2MTXyRl2+eoyVm
 wK57X8lo+7yXfKvEldg==
X-Authority-Analysis: v=2.4 cv=JuX8bc4C c=1 sm=1 tr=0 ts=697310c1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8
 a=xIS0LuMThQ_u9C2hoikA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -0vaCrYYhC7-mesM5c_gB1yBuzzVFR2Z
X-Proofpoint-ORIG-GUID: -0vaCrYYhC7-mesM5c_gB1yBuzzVFR2Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230044
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90280-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,quicinc.com:dkim,quicinc.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[quic_mdalam@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E904570CA6
X-Rspamd-Action: no action

Hi,

On 1/21/2026 6:14 PM, Ulf Hansson wrote:
> On Wed, 26 Nov 2025 at 07:43, Md Sadre Alam <quic_mdalam@quicinc.com> wrote:
>>
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
> 
> This has been applied for next since a few weeks, but I have a
> question. See more below.
> 
> [...]
> 
>>
>>   drivers/mmc/host/sdhci-msm.c | 77 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 77 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 3b85233131b3..da356627d9de 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -157,6 +157,17 @@
>>   #define CQHCI_VENDOR_CFG1      0xA00
>>   #define CQHCI_VENDOR_DIS_RST_ON_CQ_EN  (0x3 << 13)
>>
>> +/* non command queue crypto enable register*/
>> +#define NONCQ_CRYPTO_PARM              0x70
>> +#define NONCQ_CRYPTO_DUN               0x74
>> +
>> +#define DISABLE_CRYPTO                 BIT(15)
>> +#define CRYPTO_GENERAL_ENABLE          BIT(1)
>> +#define HC_VENDOR_SPECIFIC_FUNC4       0x260
>> +
>> +#define ICE_HCI_PARAM_CCI      GENMASK(7, 0)
>> +#define ICE_HCI_PARAM_CE       GENMASK(8, 8)
>> +
>>   struct sdhci_msm_offset {
>>          u32 core_hc_mode;
>>          u32 core_mci_data_cnt;
>> @@ -300,6 +311,7 @@ struct sdhci_msm_host {
>>          u32 dll_config;
>>          u32 ddr_config;
>>          bool vqmmc_enabled;
>> +       bool non_cqe_ice_init_done;
>>   };
>>
>>   static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>> @@ -2012,6 +2024,68 @@ static int sdhci_msm_ice_keyslot_evict(struct blk_crypto_profile *profile,
>>          return qcom_ice_evict_key(msm_host->ice, slot);
>>   }
>>
>> +static void sdhci_msm_non_cqe_ice_init(struct sdhci_host *host)
>> +{
>> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +       struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +       struct mmc_host *mmc = msm_host->mmc;
>> +       struct cqhci_host *cq_host = mmc->cqe_private;
>> +       u32 config;
>> +
>> +       config = sdhci_readl(host, HC_VENDOR_SPECIFIC_FUNC4);
>> +       config &= ~DISABLE_CRYPTO;
>> +       sdhci_writel(host, config, HC_VENDOR_SPECIFIC_FUNC4);
>> +       config = cqhci_readl(cq_host, CQHCI_CFG);
>> +       config |= CRYPTO_GENERAL_ENABLE;
>> +       cqhci_writel(cq_host, config, CQHCI_CFG);
>> +}
>> +
>> +static void sdhci_msm_ice_cfg(struct sdhci_host *host, struct mmc_request *mrq)
>> +{
>> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +       struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +       struct mmc_host *mmc = msm_host->mmc;
>> +       struct cqhci_host *cq_host = mmc->cqe_private;
>> +       unsigned int crypto_params = 0;
>> +       int key_index;
>> +
>> +       if (mrq->crypto_ctx) {
>> +               if (!msm_host->non_cqe_ice_init_done) {
>> +                       sdhci_msm_non_cqe_ice_init(host);
>> +                       msm_host->non_cqe_ice_init_done = true;
>> +               }
>> +
>> +               key_index = mrq->crypto_key_slot;
>> +               crypto_params = FIELD_PREP(ICE_HCI_PARAM_CE, 1) |
>> +                               FIELD_PREP(ICE_HCI_PARAM_CCI, key_index);
>> +
>> +               cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
>> +               cqhci_writel(cq_host, lower_32_bits(mrq->crypto_ctx->bc_dun[0]),
>> +                            NONCQ_CRYPTO_DUN);
>> +       } else {
>> +               cqhci_writel(cq_host, crypto_params, NONCQ_CRYPTO_PARM);
> 
> Should we really call cqhci_writel() here, even if
> sdhci_msm_non_cqe_ice_init() has not been called yet?
> 
Thanks for the pointing this. The else branch is intentional.
for plain requests we must clear the crypto registers, otherwise
the ICE hardware would continue using the previous encryption context.
ICE initialization is only required when programming an encryption 
context, so we don’t call sdhci_msm_non_cqe_ice_init() in the plain 
path. Writing 0 to NONCQ_CRYPTO_PARM is safe without ICE init and 
ensures that subsequent plain requests are handled correctly

Thanks,
Alam.

