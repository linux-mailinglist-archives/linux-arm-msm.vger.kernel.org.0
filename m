Return-Path: <linux-arm-msm+bounces-90206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Ea/HlIwcmmadwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:12:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F3167BCC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 15:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 44146962199
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 13:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C8133C53D;
	Thu, 22 Jan 2026 13:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iCaTcWZL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E4E325729;
	Thu, 22 Jan 2026 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769089044; cv=none; b=i1vRcnrDDHs7patXP+XrMoF94wQ+keSFRrNVc7JeBWXYwRi2M7g3zcDCYtVEBHH4pMFLvEMOAF/Cguvrq6ROzNvXrj7wNoZjwWinoj6g+Zk/r1mEE+Oh8Ugj7M/tAmYTgnSE48RcQlcOf/avkrAIKAVB6GfDt88ccsmeKhz3/mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769089044; c=relaxed/simple;
	bh=17Rsxmm48XcSNDgj1/89nZeo14vQUwjienKlcXNwShc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=R1mU5j8x+GvlpefPDJOiU30ZiPi/asgIk3djV0m/zwGlDDaNKKZHJ2gsd8rz+FC7nJVHBTjTGyfVaks9m9r95gqrMm7ZICbDY8/MqtU5pImfnFa5fw8gzQaUZiIWRiel+Q6ctbFHN9TkmVn4naTXncw2H8tns9SC35gYqH3p7ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iCaTcWZL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60M7te572276572;
	Thu, 22 Jan 2026 13:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bjvEcP0zllrlhGgMUTlfiHuGnzsjT7hoHTLw8PrG76U=; b=iCaTcWZLPAtvvsr7
	lUIqvxlN8yIyzY8PjAUrt7cBngDEQzJSm4OTwjwdnMrQLGZVH71gwA/AINieNQM4
	LNDkiKViM8FS8uenGClSFNnWy/w3CSR2NrBRdrYZ3SwI5+NFRZ59nthsGpM+TIq0
	ujvWV6+y9TasQFKf2ASpH+G5n9kycc347j0vudgdX4xKtH2VvGZySurisftsHFov
	xZAvaNJzzj15ziayEGyTjt9nPGCVLRKg3ZpMp/chSaTsTMFOIpTLcybTDsFrKK8Y
	8yTbzQ9nW24JbpDe+abBXughXiHP0+yyW9T45wRZvzdUdOtOSyGaLEYLAE+wSAlo
	CFhERw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7fatffk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 13:37:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 60MDbGNU018373
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Jan 2026 13:37:16 GMT
Received: from [10.217.216.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 05:37:12 -0800
Message-ID: <1f32c439-77e0-42e3-aa7d-e482daa4707d@quicinc.com>
Date: Thu, 22 Jan 2026 19:07:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] mmc: sdhci-msm: Add Device tree parsing logic for
 DLL settings
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
 <20251215120009.3877889-5-quic_rampraka@quicinc.com>
 <fkb4iietzzmhvatmvjn6s6dpdibmnhj5g4xjcsrvzfwkipgwwz@wde3bcrqxrhw>
Content-Language: en-US
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <fkb4iietzzmhvatmvjn6s6dpdibmnhj5g4xjcsrvzfwkipgwwz@wde3bcrqxrhw>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Hrx72kTS c=1 sm=1 tr=0 ts=6972280d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=9ARYc1Rnt4muMi-1TfQA:9 a=QEXdDO2ut3YA:10 a=-_B0kFfA75AA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEwMiBTYWx0ZWRfX3GZxRFdheu5P
 ylm3FlvjwiHlHmW/ktH8UiAPouDASoRyy/kQlid4BHxJYHOQ297n8oP+e5yV2WFu7iT2iRFw10m
 6AVCDPxgWtaYMRdBmZjAZAbVah2rGI37Gns2v5R7+mbpzwJ0moT5S76qb0Na2Y1TnhpxybfIMZR
 jM6+ocVJX2OUYpdSCchUfzERwshzgIApwT1QOl93lBYPEdGA+RKGJk5sx6vzIwSH/nKJjcLS4Z7
 +pJwrfeGJvnEpzP2f/6epWrqsqoBKdmxWzvKmfbzwbym4bsNFjnfTROXcoA4itXx7r/7TxH2xfc
 XNQlhM0mIrgeFe+SPYN4Qpr2caK85NP6pF0LkbC8cKFNuFuPwU6NwNPeM3a8JR6I62IWxF0GWPw
 DI156HlLXaZX7NUEtewXfCLIcqSl3A/PZPLuSdafdAkGM5wQDDYGKW3zO6VTZJDaXg5N1gg0TRq
 Wvhh6YRBsZ4+FNm3MvQ==
X-Proofpoint-ORIG-GUID: RwX1YrpZxoHUSFFYtyUYtrTV8NX5lH-g
X-Proofpoint-GUID: RwX1YrpZxoHUSFFYtyUYtrTV8NX5lH-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220102
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90206-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: E7F3167BCC
X-Rspamd-Action: no action


On 12/18/2025 7:02 PM, Bjorn Andersson wrote:
> On Mon, Dec 15, 2025 at 05:30:08PM +0530, Ram Prakash Gupta wrote:
>> From: Sachin Gupta <quic_sachgupt@quicinc.com>
>>
>> This update introduces the capability to configure HS200
>> and HS400 DLL settings via the device tree and parsing it.
> No it doesn't, it merely reads a bunch of integers from DeviceTree and
> does nothing with them.
>
> Please write your commit message in imperative mood (avoid "This
> update") and please include a reasoning for why this commit exists, or
> as
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> says "Describe your problem.".

Will update this commit with only parsing explanation. and would remove "This update"

>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 41 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 41 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index dc79f828522b..1fcd92158bee 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -266,6 +266,19 @@ struct sdhci_msm_variant_info {
>>  	const struct sdhci_msm_offset *offset;
>>  };
>>  
>> +/*
>> + * DLL registers which needs be programmed with HSR settings.
>> + * Add any new register only at the end and don't change the
>> + * sequence.
> /* You have to only add entries at the end, but I'm not going to tell you why... */

Its for future proofing for any new register addition so that it does not break
existing targets. I ll update this comment.

>
>> + */
>> +struct sdhci_msm_dll {
>> +	u32 dll_config;
>> +	u32 dll_config_2;
>> +	u32 dll_config_3;
>> +	u32 dll_usr_ctl;
>> +	u32 ddr_config;
>> +};
>> +
>>  struct sdhci_msm_host {
>>  	struct platform_device *pdev;
>>  	void __iomem *core_mem;	/* MSM SDCC mapped address */
>> @@ -274,6 +287,7 @@ struct sdhci_msm_host {
>>  	struct clk *xo_clk;	/* TCXO clk needed for FLL feature of cm_dll*/
>>  	/* core, iface, cal and sleep clocks */
>>  	struct clk_bulk_data bulk_clks[4];
>> +	struct sdhci_msm_dll dll[2];
>>  #ifdef CONFIG_MMC_CRYPTO
>>  	struct qcom_ice *ice;
>>  #endif
>> @@ -302,6 +316,7 @@ struct sdhci_msm_host {
>>  	u32 dll_config;
>>  	u32 ddr_config;
> So this dll_config/ddr_config pair is no longer supposed to be used? Or
> are there now two sets of dll and ddr configurations to be provided?
>
> Regards,
> Bjorn

These are kept to continue support for the older targets, with newer targets
which are all with artanis dll, these wont be used.

Thanks,
Ram

>
>>  	bool vqmmc_enabled;
>> +	bool artanis_dll;
>>  };
>>  
>>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>> @@ -2534,6 +2549,23 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
>>  	return ret;
>>  }
>>  
>> +#define DLL_SIZE 10
>> +static int sdhci_msm_dt_parse_dll_info(struct device *dev, struct sdhci_msm_host *msm_host)
>> +{
>> +	u32 *dll_table = &msm_host->dll[0].dll_config;
>> +	int ret;
>> +
>> +	msm_host->artanis_dll = false;
>> +
>> +	ret = of_property_read_variable_u32_array(dev->of_node,
>> +						  "qcom,dll-presets",
>> +						  dll_table, DLL_SIZE, DLL_SIZE);
>> +	if (ret == DLL_SIZE)
>> +		msm_host->artanis_dll = true;
>> +
>> +	return ret;
>> +}
>> +
>>  static int sdhci_msm_probe(struct platform_device *pdev)
>>  {
>>  	struct sdhci_host *host;
>> @@ -2580,6 +2612,15 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>  
>>  	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
>>  
>> +	/*
>> +	 * Parse HSR dll only when property is present in DT.
>> +	 */
>> +	ret = sdhci_msm_dt_parse_dll_info(&pdev->dev, msm_host);
>> +	if (ret == -ENODATA || ret == -EOVERFLOW) {
>> +		dev_err(&pdev->dev, "Bad DLL in dt (%d)\n", ret);
>> +		return ret;
>> +	}
>> +
>>  	ret = sdhci_msm_gcc_reset(&pdev->dev, host);
>>  	if (ret)
>>  		return ret;
>> -- 
>> 2.34.1
>>

