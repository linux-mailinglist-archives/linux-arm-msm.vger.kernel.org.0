Return-Path: <linux-arm-msm+bounces-63138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF224AEEF44
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 08:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE149160E7B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 06:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92941E5701;
	Tue,  1 Jul 2025 06:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fPQCEHXb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B571E1DF2;
	Tue,  1 Jul 2025 06:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751352779; cv=none; b=gOr7RPzAGOQC+JpetbvTc1nK+9r+reVF4n/0YfMeX/kDjYI3S2/JvDAGMVtwj3eluMBxqWVbtTIowZc7aXAW3iXDnr8ptq4OxPtl//8xJcJ1GylBZ6wOapTEQYjsgq2fRz2PRkmTPuU3BQqh1PQgtZ0s+Tw+3SAZLcYCena4YLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751352779; c=relaxed/simple;
	bh=9wPu8gcQVg4D3OqtnW2RSYNmwHGKYSyg+wpN0dFpD7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tL550ghakHuKtg2frKQpw1U5Wj2+Ki5ocLhoGbvtLXHLMsKKUMUb+d8KwJDz50r1WNLYytlGnxei0e0DAzZxhIP7quoLhVcm4uDXgddqVEj1qTwX5CeD9tzPhxciLTK5k8bqYQvfySmxXye+eK+8kXCf75uqz0ewVrg+uWQbWk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fPQCEHXb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5614GtJu024904;
	Tue, 1 Jul 2025 06:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q3KINF7gvWiCpkXSsByEiiOLNOENKgXXP3u4eWxr4eM=; b=fPQCEHXbMwBDb8oW
	7fA7I+6a8fWr4GZk+ZPD7acdWMw6buIpzlcqEe+a7K7KfqrEDM/X4Kl2x7fnOioS
	E6lUq/hHNGHCiRNDMpG4R7uZD6fxKO2vyJ00SKaTfUiny2X+dCzYKuSQYt9nMtd6
	Livu2G/qAVobYQxPCStme4LBuBptwLuzekjFICR9Iz5OlDcbfC4KDjBM+Eb2xzb7
	Rphj2gW+0q/Ara9MCA7wa6DcSc56R0shm0vfJBtMkjeb0N6rD/7XWuS4VpA61Jqb
	OIn+8+QObQaO8c1BZd3j9WZs0QjexFxgMiSPrKJutON/IFJ6+BXLyom1X5Rf+rZ/
	EFxVdA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801yc49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 06:52:54 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5616qr3C006918
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 06:52:53 GMT
Received: from [10.217.216.168] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Jun
 2025 23:52:49 -0700
Message-ID: <32ed84b2-41f6-4c1e-a7c6-f3cbc92ae6b5@quicinc.com>
Date: Tue, 1 Jul 2025 12:22:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] mmc: sdhci-msm: Ensure SD card power isn't ON when
 card removed
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Adrian Hunter
	<adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_pragalla@quicinc.com>, <quic_sayalil@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <kernel@oss.qualcomm.com>
References: <20250620090333.3068568-1-quic_sartgarg@quicinc.com>
 <61cffc10-3e05-4331-b967-6c01cc03d072@oss.qualcomm.com>
Content-Language: en-US
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <61cffc10-3e05-4331-b967-6c01cc03d072@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jbQbW0LEsUa3CJn6aVgm7oGAi8HIWC7z
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=686385c6 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=AetVj61-NovANKZkZ4wA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jbQbW0LEsUa3CJn6aVgm7oGAi8HIWC7z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAzNyBTYWx0ZWRfXy0wZFbgeLNoL
 7gUwMlWXm+r8ggtyXWmjAAmGIqgsxEnlDcfaSSbK3SzlVxesUld41agXbjSAdf17HtKI7vaA6Z8
 AYcjO2Nrh/NwZdixUjwQrlhMzPGVOOw9uGA66rDqg7S5RFOqUZ9wSyIzsqwLpBCOdpNf1mRY8QU
 jFRYzlS2xZrhVo4n2561e04+8X7woe1yq8NQ703z34ZaQpyPVOBSwSpSuvIzuCf5lolK5jt+m56
 mPrSRpvYigcGGW8tZo5ZEBAtsrCGkClnpqnBTxZx/CtZZRFsbDvCPLt7Ls19Ye7MQxd/dCarHH9
 SHIDQxUTRjXg0HV1yReTCtl34BEhIIZoNbs5pR2W2Mdl1sUzf3ys5bXEGBVfHli073+/tjwEhUB
 Y4yGxTNURl0+u56Z1zcC3y6PhZSKC8WlQwcVAMAOQiEi7FR3H91Wh/KJULgIa8+I26ej2qm2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010037



On 6/21/2025 4:29 PM, Konrad Dybcio wrote:
> On 6/20/25 11:03 AM, Sarthak Garg wrote:
>> Make sure SD card power is not enabled when the card is
>> being removed.
>> On multi-card tray designs, the same card-tray would be used for SD
>> card and SIM cards. If SD card is placed at the outermost location
>> in the tray, then SIM card may come in contact with SD card power-
>> supply while removing the tray. It may result in SIM damage.
>> So in sdhci_msm_handle_pwr_irq we skip the BUS_ON request when the
>> SD card is removed to be in consistent with the MGPI hardware fix to
>> prevent any damage to the SIM card in case of mult-card tray designs.
>> But we need to have a similar check in sdhci_msm_check_power_status to
>> be in consistent with the sdhci_msm_handle_pwr_irq function.
>> Also reset host->pwr and POWER_CONTROL register accordingly since we
>> are not turning ON the power actually.
> 
> This is very difficult to parse. How about:
> 
> Many mobile phones feature multi-card tray designs, where the same
> tray is used for both SD and SIM cards. If the SD card is placed
> at the outermost location in the tray, the SIM card may come in
> contact with SD card power-supply while removing the tray, possibly
> resulting in SIM damage.
> 
> To prevent that, make sure the SD card is really inserted by reading
> the Card Detect pin state. If it's not, turn off the power in
> sdhci_msm_check_power_status() and set the BUS_FAIL power state on the
> controller as part of pwr_irq handling.
> 
> 
> (Now I don't know if this is a good fix as far as logic goes, but I'm
> simply looking at the patch)
> 

Sure will update the commit text.

>>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> ---
>> Changes from v1:
>> As per Adrian Hunter's comment :
>> - Removed unrelated changes
>> - Created a separate function get_cd for cleaner code
>> - Used READ_ONCE when getting mmc->ops to handle card removal cases
>> - Reordered if check conditions
>> ---
>>   drivers/mmc/host/sdhci-msm.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index bf91cb96a0ea..97a895d839c9 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -1566,6 +1566,14 @@ static inline void sdhci_msm_complete_pwr_irq_wait(
>>   	wake_up(&msm_host->pwr_irq_wait);
>>   }
>>   
>> +static int get_cd(struct sdhci_host *host)
>> +{
>> +	struct mmc_host *mmc = host->mmc;
>> +	const struct mmc_host_ops *mmc_ops = READ_ONCE(mmc->ops);
> 
> What do you need the READ_ONCE for?> +
>> +	return mmc_ops && mmc->ops->get_cd ? mmc->ops->get_cd(mmc) : 0;
> 
> I think this op will always exist for our driver, since we call:
> 
> sdhci_msm_probe()
>   -> sdhci_pltfm_init()
>      -> sdhci_alloc_host()
> 
> which assigns:
> 
> host->mmc_host_ops = sdhci_ops;
> mmc->ops = &host->mmc_host_ops;
> 
> which contains:
> 
> .get_cd         = sdhci_get_cd,
> 
> there's some more layers to this matryoshka, so I'm not a 100% sure
> 

Yes its not needed will remove it.

>> +}
>> +
>>   /*
>>    * sdhci_msm_check_power_status API should be called when registers writes
>>    * which can toggle sdhci IO bus ON/OFF or change IO lines HIGH/LOW happens.
>> @@ -1579,6 +1587,7 @@ static void sdhci_msm_check_power_status(struct sdhci_host *host, u32 req_type)
>>   {
>>   	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>>   	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>> +	struct mmc_host *mmc = host->mmc;
>>   	bool done = false;
>>   	u32 val = SWITCHABLE_SIGNALING_VOLTAGE;
>>   	const struct sdhci_msm_offset *msm_offset =
>> @@ -1636,6 +1645,12 @@ static void sdhci_msm_check_power_status(struct sdhci_host *host, u32 req_type)
>>   				 "%s: pwr_irq for req: (%d) timed out\n",
>>   				 mmc_hostname(host->mmc), req_type);
>>   	}
>> +
>> +	if ((req_type & REQ_BUS_ON) && mmc->card && !get_cd(host)) {
>> +		sdhci_writeb(host, 0, SDHCI_POWER_CONTROL);
>> +		host->pwr = 0;
>> +	}
>> +
>>   	pr_debug("%s: %s: request %d done\n", mmc_hostname(host->mmc),
>>   			__func__, req_type);
>>   }
>> @@ -1694,6 +1709,13 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
>>   		udelay(10);
>>   	}
>>   
>> +	if ((irq_status & CORE_PWRCTL_BUS_ON) && mmc->card && !get_cd(host)) {
>> +		irq_ack = CORE_PWRCTL_BUS_FAIL;
>> +		msm_host_writel(msm_host, irq_ack, host,
>> +				msm_offset->core_pwrctl_ctl);
> 
> Since you're dropping out if this function, you can pass the parameter
> directly to msm_host_writel
> 
> Konrad

Sure will update.

~Best regards
Sarthak

