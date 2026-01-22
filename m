Return-Path: <linux-arm-msm+bounces-90204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMIQGt4rcmmadwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:53:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DA46793A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 14:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DBFF5980E02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6124F33A9C4;
	Thu, 22 Jan 2026 13:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g3nsizjm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2982868A9;
	Thu, 22 Jan 2026 13:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769088612; cv=none; b=YrGpsTfYjdSD9PlCyo83uNmtYbRrV9T4Z7TywBWoCKgAsZjTa1Kel2WZgwpidGYv/x69aeZ1Eo0QEvbUN/mE6O6k7/625RGTNuo0BMymD5TBML4yLxxbw6miFiTQ6Zy4wOPdMJH41x1pfzaYq978MElSuyEIlA9sLdJqwWt9wLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769088612; c=relaxed/simple;
	bh=abhpFTNTYWOIEv6PHoTIk6PWoHgwpm6or9oH4TqKy68=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Yon6Fq3T2Izu6fpZsFEfsQl4TxaenrGNyROl6s6rd3N0Pqp+gpplKvKuZCPmjgqFd84d3q+SBl/8vwroAq19/J9UH9qGq/d2/u78n8U/YfRkwEXbiC13S7qpw5XxEsJB6POndeTkF9LH3sn+OA0xf/5tZcFj0KILz6DltNUoAs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g3nsizjm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7dmRK107391;
	Thu, 22 Jan 2026 13:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QhQr5y4qjuOh3Wxc85PTJV+QFtr+sgRL9EFxFX7UV4I=; b=g3nsizjmrvLcMgj3
	zZHwUUWfz4Y6zCpw4g42og9uORMwldaPgW6Vi9zqiEqlTjuAgBizIBaZXgN9DGNK
	zzVkkM8WLQfK1Em3OPB87oLsbrgEtXgHioRyrc2/Y+Q6oQ0xB6HZMUXEtNjNosPu
	QiayChTOEqv6hOLaIx1CYxhRyPdBxdIfr1EPPjLs7tXcdXvL7n0k7jA6B6ODEwJ3
	KJevHq2CaxT2vPf3bMhMHnF8nf9LYdxPEm9NLzgD4/qLd24LJrqqf3Ymxi/XSIUD
	W2c2BE9RC7ToLkVv/4lrAZFVVxJTHyI3bNAr96ZXMdyxBdVXKOwwVuW3813jAvL9
	pLnrwg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pgtjab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 13:30:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 60MDU0VQ004918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 13:30:00 GMT
Received: from [10.217.216.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 05:29:56 -0800
Message-ID: <7317bfd0-8d81-42f4-a22e-d6e1be6b5e5b@quicinc.com>
Date: Thu, 22 Jan 2026 18:59:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] mmc: sdhci-msm: Rectify DLL programming sequence
 for SDCC
To: Bjorn Andersson <andersson@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>, <linux-mmc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmitry.baryshkov@oss.qualcomm.com>
References: <20251215120009.3877889-1-quic_rampraka@quicinc.com>
 <20251215120009.3877889-6-quic_rampraka@quicinc.com>
 <vlikwopeugo43v72tu7u6rdf2ervm3gcvvwe66dycyfqf22572@wgcretfpawme>
Content-Language: en-US
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <vlikwopeugo43v72tu7u6rdf2ervm3gcvvwe66dycyfqf22572@wgcretfpawme>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEwMSBTYWx0ZWRfXxThJmgGKSwy4
 Iegq+LVxWurBCn4xPxcmocasgNGURsxhI6u3tdYYYnOypZjZ257vAFTGOXblSkPZJOpT0VUw68l
 iNgxw9Jkj6axx8iT3zx1m0xxM4cSpsc2IfIyIuRp2NfJ1KmdJym7rMk7pICSOgUWY4B7Xv5WWdX
 2Hd4eg7mhdcUu8ofImqmJKpvh+ZgsMoqd+HRDBjFNA4OZVAMNslk0AB10t/XM2hauCrNp+H3bxs
 zTFaJ3SgDYlMPR9WsQVRu1pJodf8NqM5B5zaH1yipPHRv1tktZcG0xWMNN2lemo7bztirmgd/NH
 PdirND5kXubeVFd94qMiqRvKlEbUb2tFQcU+WprQxoKSa2vtMERBBwTR43C7IZzUPLjiyRhBf6d
 Y4i7CXVh1xcHpM4pU4yXqzFOEIy2SzmD1NdLf1O5/PwYyVv2Hni6kNVinLrB0afoeb+hGcJcmv6
 k9rWLVU57eWot8r2q5A==
X-Authority-Analysis: v=2.4 cv=OZGVzxTY c=1 sm=1 tr=0 ts=69722659 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=8iq2cssvTpq8CIre4ToA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: fuXITFhgLegO5NKu03ZPYssmviROJ-pp
X-Proofpoint-GUID: fuXITFhgLegO5NKu03ZPYssmviROJ-pp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90204-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[quicinc.com,none];
	DKIM_TRACE(0.00)[quicinc.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_rampraka@quicinc.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7DA46793A
X-Rspamd-Action: no action


On 12/18/2025 7:48 PM, Bjorn Andersson wrote:
> On Mon, Dec 15, 2025 at 05:30:09PM +0530, Ram Prakash Gupta wrote:
>> From: Sachin Gupta <quic_sachgupt@quicinc.com>
>>
>> With the current DLL sequence stability issues for data
>> transfer seen in HS400 and HS200 modes.
>>
>> "mmc0: cqhci: error IRQ status: 0x00000000 cmd error -84
>> data error 0"
>>
>> Rectify the DLL programming sequence as per latest hardware
>> programming guide
> You're talking about how things are unstable, but what the commit
> message completely fails to mention is that all this new spaghetti is
> conditional on msm_host->artanis_dll, so I believe this statement
> only applies to a single supported SoC?
>
> No where in this series do you mention that this only (?) applies to
> QDU1000. 

This DLL change is required to work with SoCs having artanis DLL.
This applies to multiple targets but QDU1000 is what is picked up to
start with, and gradually after testing this with other artanis DLL
supported target, dt change will be updated for other targets.

And this doesn't apply only to QDU1000, this would go for SM8650, SM8750
and upcoming SoCs for SDC2 instance (SDCard) and other targets for SDC1
instance if supported.

I will further update the commit message in to show, artanis dll
support addition with this work.

>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 277 ++++++++++++++++++++++++++++++++---
>>  1 file changed, 260 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index 1fcd92158bee..f459b40db41c 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -28,6 +28,7 @@
>>  #define CORE_VERSION_MAJOR_SHIFT	28
>>  #define CORE_VERSION_MAJOR_MASK		(0xf << CORE_VERSION_MAJOR_SHIFT)
>>  #define CORE_VERSION_MINOR_MASK		0xff
>> +#define SDHCI_MSM_MIN_V_7FF		0x6e
>>  
>>  #define CORE_MCI_GENERICS		0x70
>>  #define SWITCHABLE_SIGNALING_VOLTAGE	BIT(29)
>> @@ -119,7 +120,8 @@
>>  #define CORE_PWRSAVE_DLL	BIT(3)
>>  
>>  #define DDR_CONFIG_POR_VAL	0x80040873
>> -
>> +#define DLL_CONFIG_3_POR_VAL	0x10
>> +#define TCXO_FREQ               19200000
> If you read the current implementation of msm_init_cm_dll() you'll see
> that we don't hard code the XO clock...

Thanks for point out.I will remove this and use xo_clock.

>
>>  
>>  #define INVALID_TUNING_PHASE	-1
>>  #define SDHCI_MSM_MIN_CLOCK	400000
>> @@ -319,6 +321,15 @@ struct sdhci_msm_host {
>>  	bool artanis_dll;
>>  };
>>  
>> +enum dll_init_context {
>> +	DLL_INIT_NORMAL,
> What is the purpose of a single-entry enum to capture the value 0?

I will remove this and make the further changes in code accordingly.

>
>> +};
>> +
>> +enum mode {
>> +	HS400, // equivalent to SDR104 mode for DLL.
>> +	HS200, // equivalent to SDR50 mode for DLL.
> This is effectively a bool, with a terribly generic name.

ok, will update to HS400_DLL_CONFIG_VAL and HS200_DLL_CONFIG_VAL if this
is ok.

>
>> +};
>> +
>>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>>  {
>>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> @@ -805,6 +816,207 @@ static int msm_init_cm_dll(struct sdhci_host *host)
>>  	return 0;
>>  }
>>  
>> +static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
>> +{
>> +	return SDHCI_MSM_MIN_CLOCK;
>> +}
>> +
>> +static unsigned int sdhci_msm_get_clk_rate(struct sdhci_host *host, u32 req_clk)
>> +{
>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +	struct clk *core_clk = msm_host->bulk_clks[0].clk;
>> +	struct mmc_ios ios = host->mmc->ios;
>> +	unsigned int sup_clk;
>> +
>> +	if (req_clk < sdhci_msm_get_min_clock(host))
>> +		return sdhci_msm_get_min_clock(host);
>> +
>> +	sup_clk = clk_get_rate(core_clk);
>> +
>> +	if (ios.timing == MMC_TIMING_MMC_HS400 ||
>> +	    host->flags & SDHCI_HS400_TUNING)
>> +		sup_clk = sup_clk / 2;
>> +
>> +	return sup_clk;
> Isn't sup_clk the same as host->mmc->actual_clock? Isn't this already
> calculated for you?

Thanks for pointing out, I will use this. And remove this code, will update
this in next patchset.

>
>> +}
>> +
>> +/* Initialize the DLL (Programmable Delay Line) */
> So now we're going to have two functions that are named pretty much the
> same and look pretty similar?
>
> With the main difference that the slightly more generically named
> sdhci_msm_configure_dll() is only called if we have a artanis_dll,
> otherwise msm_init_cm_dll() is used?

They appear similar as artanis_dll have multiple common sequence
with the previous one. The new addition in the existing function
was adding multiple if/else checks making the function cluttered.
This approach keeps the implementation cleaner.

>> +static int sdhci_msm_configure_dll(struct sdhci_host *host, enum dll_init_context
>> +				 init_context, enum mode index)
>> +{
> Large parts of this function is duplicated from msm_init_cm_dll(). This
> isn't okay.

Right it may look like a duplicate but the new required sequence shares many
steps with the existing sequence but the new addition in the existing function
was adding multiple if/else checks making the function cluttered and hard to
read. To keep the code clean, a separate function was created instead.

>
>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
>> +	struct mmc_host *mmc = host->mmc;
>> +	u32 ddr_cfg_offset, core_vendor_spec, config;
>> +	void __iomem *ioaddr = host->ioaddr;
>> +	unsigned long flags, dll_clock;
>> +	int rc = 0;
>> +	u32 dll_lock;
>> +
>> +	dll_clock = sdhci_msm_get_clk_rate(host, host->clock);
>> +	spin_lock_irqsave(&host->lock, flags);
>> +
>> +	core_vendor_spec = readl_relaxed(ioaddr + msm_offset->core_vendor_spec);
>> +
>> +	/*
>> +	 * Always disable PWRSAVE during the DLL power
>> +	 * up regardless of its current setting.
>> +	 */
>> +	core_vendor_spec &= ~CORE_CLK_PWRSAVE;
>> +	writel_relaxed(core_vendor_spec, ioaddr + msm_offset->core_vendor_spec);
>> +
>> +	if (msm_host->use_14lpp_dll_reset) {
>> +		/* Disable CK_OUT */
>> +		config = readl_relaxed(ioaddr + msm_offset->core_dll_config);
>> +		config &= ~CORE_CK_OUT_EN;
>> +		writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
>> +
>> +		/* Disable the DLL clock */
>> +		config = readl_relaxed(ioaddr + msm_offset->core_dll_config_2);
>> +		config |= CORE_DLL_CLOCK_DISABLE;
>> +		writel_relaxed(config, ioaddr + msm_offset->core_dll_config_2);
>> +	}
>> +
>> +	/*
>> +	 * Write 1 to DLL_RST bit of DLL_CONFIG register
>> +	 * and Write 1 to DLL_PDN bit of DLL_CONFIG register.
>> +	 */
>> +	config = readl_relaxed(ioaddr + msm_offset->core_dll_config);
>> +	config |= (CORE_DLL_RST | CORE_DLL_PDN);
>> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
>> +
>> +	/*
>> +	 * Configure DLL_CONFIG_3 and USER_CTRL
>> +	 * (Only applicable for 7FF projects).
> What is a 7FF project?

This refers to 7nm technode.

>
>> +	 */
>> +	if (msm_host->core_minor >= SDHCI_MSM_MIN_V_7FF) {
>> +		writel_relaxed(msm_host->dll[index].dll_config_3,
>> +			       ioaddr + msm_offset->core_dll_config_3);
>> +		writel_relaxed(msm_host->dll[index].dll_usr_ctl,
>> +			       ioaddr + msm_offset->core_dll_usr_ctl);
>> +	}
>> +
>> +	/*
>> +	 * Set DDR_CONFIG since step 7 is setting TEST_CTRL that can be skipped.
>> +	 */
>> +	ddr_cfg_offset = msm_host->updated_ddr_cfg ? msm_offset->core_ddr_config
>> +					: msm_offset->core_ddr_config_old;
>> +
>> +	config = msm_host->dll[index].ddr_config;
>> +	writel_relaxed(config, ioaddr + ddr_cfg_offset);
>> +
>> +	/* Set DLL_CONFIG_2 */
>> +	if (msm_host->use_14lpp_dll_reset) {
>> +		u32 mclk_freq;
>> +		int cycle_cnt;
>> +
>> +		/*
>> +		 * Only configure the mclk_freq in normal DLL init
>> +		 * context. If the DLL init is coming from
>> +		 * CX Collapse Exit context, the host->clock may be zero.
>> +		 * The DLL_CONFIG_2 register has already been restored to
>> +		 * proper value prior to getting here.
>> +		 */
>> +		if (init_context == DLL_INIT_NORMAL) {
> Guess what...enum mode only has a single possible value, so init_context
> is DLL_INIT_NORMAL...

I will remove this completely and update the code.

>> +			cycle_cnt = readl_relaxed(ioaddr +
>> +					msm_offset->core_dll_config_2)
>> +					& CORE_FLL_CYCLE_CNT ? 8 : 4;
>> +
>> +			mclk_freq = DIV_ROUND_CLOSEST_ULL(dll_clock * cycle_cnt, TCXO_FREQ);
>> +
>> +			if (dll_clock < 100000000) {
>> +				pr_err("%s: %s: Non standard clk freq =%u\n",
>> +				       mmc_hostname(mmc), __func__, dll_clock);
>> +				rc = -EINVAL;
>> +				goto out;
>> +			}
>> +
>> +			config = readl_relaxed(ioaddr + msm_offset->core_dll_config_2);
>> +			config = (config & ~GENMASK(17, 10)) |
>> +					FIELD_PREP(GENMASK(17, 10), mclk_freq);
>> +			writel_relaxed(config, ioaddr + msm_offset->core_dll_config_2);
>> +		}
>> +		/* wait for 5us before enabling DLL clock */
>> +		udelay(5);
>> +	}
>> +
>> +	config = msm_host->dll[index].dll_config;
>> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
>> +
>> +	/* Wait for 52us */
>> +	spin_unlock_irqrestore(&host->lock, flags);
> How come this isn't racy? What is the purpose of holding this spinlock
> throughout this method and are you certain that whatever concurrent
> execution might happen doesn't happen here?

Since the delay needed is 60u, usleep_range was added, and to avoid sleep
holding lock, unlock and lock were used. And I got your point. But is it ok
to use udelay here for 60u second? I don't see any other way.

>
>> +	usleep_range(60, 70);
>> +	spin_lock_irqsave(&host->lock, flags);
>> +
>> +	/*
>> +	 * Write 0 to DLL_RST bit of DLL_CONFIG register
>> +	 * and Write 0 to DLL_PDN bit of DLL_CONFIG register.
>> +	 */
>> +	config &= ~CORE_DLL_RST;
>> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
>> +
>> +	config &= ~CORE_DLL_PDN;
>> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
>> +	/* Write 1 to DLL_RST bit of DLL_CONFIG register */
>> +	config |= CORE_DLL_RST;
>> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
>> +
>> +	/* Write 0 to DLL_RST bit of DLL_CONFIG register */
>> +	config &= ~CORE_DLL_RST;
>> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
>> +
>> +	/* Set CORE_DLL_CLOCK_DISABLE to 0 */
>> +	if (msm_host->use_14lpp_dll_reset) {
>> +		config = readl_relaxed(ioaddr + msm_offset->core_dll_config_2);
>> +		config &= ~CORE_DLL_CLOCK_DISABLE;
>> +		writel_relaxed(config, ioaddr + msm_offset->core_dll_config_2);
>> +	}
>> +
>> +	/* Set DLL_EN bit to 1. */
>> +	config = readl_relaxed(ioaddr + msm_offset->core_dll_config);
>> +	config |= CORE_DLL_EN;
>> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
>> +
>> +	/*
>> +	 * Wait for 8000 input clock. Here we calculate the
>> +	 * delay from fixed clock freq 192MHz, which turns out 42us.
>> +	 */
>> +	spin_unlock_irqrestore(&host->lock, flags);
> As above, how do we know that this isn't racy?

Will update as per other review comment about race.

>
>> +	usleep_range(50, 60);
>> +	spin_lock_irqsave(&host->lock, flags);
>> +
>> +	/* Set CK_OUT_EN bit to 1. */
>> +	config |= CORE_CK_OUT_EN;
>> +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
>> +
>> +	/*
>> +	 * Wait until DLL_LOCK bit of DLL_STATUS register
>> +	 * becomes '1'.
>> +	 */
>> +	rc = readl_relaxed_poll_timeout(ioaddr +
>> +					msm_offset->core_dll_status,
>> +					dll_lock,
>> +					dll_lock & CORE_DLL_LOCK,
>> +					10,
>> +					100);
>> +	if (rc == -ETIMEDOUT)
>> +		pr_err("%s: Unable to get DLL_LOCK, dll_status: 0x%08x\n",
> Don't pr_err() when you have a struct device.

ok, will update to dev_err.

>
>> +		       mmc_hostname(host->mmc), dll_lock);
>> +
>> +out:
>> +	if (core_vendor_spec & CORE_CLK_PWRSAVE) {
>> +		/* Reenable PWRSAVE as needed */
>> +		config = readl_relaxed(ioaddr + msm_offset->core_vendor_spec);
>> +		config |= CORE_CLK_PWRSAVE;
>> +		writel_relaxed(config, ioaddr + msm_offset->core_vendor_spec);
>> +	}
>> +
>> +	spin_unlock_irqrestore(&host->lock, flags);
>> +	return rc;
>> +}
>> +
>>  static void msm_hc_select_default(struct sdhci_host *host)
>>  {
>>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> @@ -927,6 +1139,24 @@ static void sdhci_msm_hc_select_mode(struct sdhci_host *host)
>>  		msm_hc_select_default(host);
>>  }
>>  
>> +static int sdhci_msm_init_dll(struct sdhci_host *host, enum dll_init_context init_context)
>> +{
>> +	if (host->mmc->ios.timing == MMC_TIMING_UHS_SDR104 ||
>> +	    host->mmc->ios.timing == MMC_TIMING_MMC_HS400)
>> +		return sdhci_msm_configure_dll(host, init_context, HS400);
>> +
>> +	return sdhci_msm_configure_dll(host, init_context, HS200);
>> +}
>> +
>> +static int sdhci_msm_dll_config(struct sdhci_host *host, enum dll_init_context init_context)
>> +{
>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +
>> +	return msm_host->artanis_dll ? sdhci_msm_init_dll(host, init_context) :
>> +		msm_init_cm_dll(host);
> So dll_config() calls init_dll() or init_cm_dll() which then might call
> configure_dll(). Is it init or config?!

init is what is needed, but I see this can be improved.
I will use dll_config -> init_dll, will remove the other function calls.

>
>> +}
>> +
>>  static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
>>  {
>>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> @@ -942,7 +1172,7 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
>>  	 * Retuning in HS400 (DDR mode) will fail, just reset the
>>  	 * tuning block and restore the saved tuning phase.
>>  	 */
>> -	ret = msm_init_cm_dll(host);
>> +	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
>>  	if (ret)
>>  		goto out;
>>  
>> @@ -1030,7 +1260,7 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
>>  	return ret;
>>  }
>>  
>> -static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
>> +static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host, enum mode index)
>>  {
>>  	struct mmc_host *mmc = host->mmc;
>>  	u32 dll_status, config, ddr_cfg_offset;
>> @@ -1053,7 +1283,11 @@ static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
>>  		ddr_cfg_offset = msm_offset->core_ddr_config;
>>  	else
>>  		ddr_cfg_offset = msm_offset->core_ddr_config_old;
>> -	writel_relaxed(msm_host->ddr_config, host->ioaddr + ddr_cfg_offset);
>> +
>> +	if (msm_host->artanis_dll)
>> +		writel_relaxed(msm_host->dll[index].ddr_config, host->ioaddr + ddr_cfg_offset);
>> +	else
>> +		writel_relaxed(msm_host->ddr_config, host->ioaddr + ddr_cfg_offset);
>>  
>>  	if (mmc->ios.enhanced_strobe) {
>>  		config = readl_relaxed(host->ioaddr +
>> @@ -1122,7 +1356,8 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
>>  	 * Retuning in HS400 (DDR mode) will fail, just reset the
>>  	 * tuning block and restore the saved tuning phase.
>>  	 */
>> -	ret = msm_init_cm_dll(host);
>> +	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
>> +
>>  	if (ret)
>>  		goto out;
>>  
>> @@ -1142,7 +1377,7 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
>>  	if (msm_host->use_cdclp533)
>>  		ret = sdhci_msm_cdclp533_calibration(host);
>>  	else
>> -		ret = sdhci_msm_cm_dll_sdc4_calibration(host);
>> +		ret = sdhci_msm_cm_dll_sdc4_calibration(host, HS400);
>>  out:
>>  	pr_debug("%s: %s: Exit, ret %d\n", mmc_hostname(host->mmc),
>>  		 __func__, ret);
>> @@ -1185,7 +1420,8 @@ static int sdhci_msm_restore_sdr_dll_config(struct sdhci_host *host)
>>  		return 0;
>>  
>>  	/* Reset the tuning block */
>> -	ret = msm_init_cm_dll(host);
>> +	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
>> +
>>  	if (ret)
>>  		return ret;
>>  
>> @@ -1227,6 +1463,7 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>>  	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
>>  	u32 config;
>> +	bool hs400_tuning;
>>  
>>  	if (!sdhci_msm_is_tuning_needed(host)) {
>>  		msm_host->use_cdr = false;
>> @@ -1256,17 +1493,23 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>>  	 * - select MCLK/2 in VENDOR_SPEC
>>  	 * - program MCLK to 400MHz (or nearest supported) in GCC
>>  	 */
>> -	if (host->flags & SDHCI_HS400_TUNING) {
>> +	hs400_tuning = !!(host->flags & SDHCI_HS400_TUNING);
> I don't see the reason for this change. If it actually impact the
> behavior of the init/config dll, did you ensure that it doesn't impact
> all currently supported targets?
>
> Regards,
> Bjorn

I had changed this to get right sup_clk value by retaining the tuning flag,
but will use actual_clk as suggested in top review comment and this change won't
be required anymore.

Thanks,
Ram

>
>> +	if (hs400_tuning) {
>>  		sdhci_msm_hc_select_mode(host);
>>  		msm_set_clock_rate_for_bus_mode(host, ios.clock, ios.timing);
>> -		host->flags &= ~SDHCI_HS400_TUNING;
>>  	}
>>  
>>  retry:
>>  	/* First of all reset the tuning block */
>> -	rc = msm_init_cm_dll(host);
>> -	if (rc)
>> +	rc = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
>> +	if (rc) {
>> +		if (hs400_tuning)
>> +			host->flags &= ~SDHCI_HS400_TUNING;
>>  		return rc;
>> +	}
>> +
>> +	if (hs400_tuning)
>> +		host->flags &= ~SDHCI_HS400_TUNING;
>>  
>>  	phase = 0;
>>  	do {
>> @@ -1297,6 +1540,8 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>>  				mmc_hostname(mmc));
>>  			if (--tuning_seq_cnt) {
>>  				tuned_phase_cnt = 0;
>> +				if (hs400_tuning)
>> +					host->flags |= SDHCI_HS400_TUNING;
>>  				goto retry;
>>  			}
>>  		}
>> @@ -1319,8 +1564,11 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
>>  		dev_dbg(mmc_dev(mmc), "%s: Setting the tuning phase to %d\n",
>>  			 mmc_hostname(mmc), phase);
>>  	} else {
>> -		if (--tuning_seq_cnt)
>> +		if (--tuning_seq_cnt) {
>> +			if (hs400_tuning)
>> +				host->flags |= SDHCI_HS400_TUNING;
>>  			goto retry;
>> +		}
>>  		/* Tuning failed */
>>  		dev_dbg(mmc_dev(mmc), "%s: No tuning point found\n",
>>  		       mmc_hostname(mmc));
>> @@ -1847,11 +2095,6 @@ static unsigned int sdhci_msm_get_max_clock(struct sdhci_host *host)
>>  	return clk_round_rate(core_clk, ULONG_MAX);
>>  }
>>  
>> -static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
>> -{
>> -	return SDHCI_MSM_MIN_CLOCK;
>> -}
>> -
>>  /*
>>   * __sdhci_msm_set_clock - sdhci_msm clock control.
>>   *
>> -- 
>> 2.34.1
>>

