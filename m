Return-Path: <linux-arm-msm+bounces-67249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CB8B17089
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 13:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EAF87B2F2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 11:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA83421CC5B;
	Thu, 31 Jul 2025 11:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XnEjbU/5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BFB2AF07;
	Thu, 31 Jul 2025 11:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753962392; cv=none; b=jwQYHohTzBXNNIFf22O+eyfXiFKEoBZftHewjQT0LDcY3ZANPxxykAv5zkK1KEggZYfYzR7SwvzJPLt28+/Cj9q28zRYLxqUAcfWbpYg51Sjl4eL4mxFiYfuXG8pvyZNt4GTOc1ByZmHOwfMawYrNGl4EBI6/AkKXaWlIVAORdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753962392; c=relaxed/simple;
	bh=FubkhzOHdRDM2M/ew7F86NSOZu7fC/b657TnB2zqcFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HCx87+UO+OS3a0zPg3tWEEUPsp7r84sKz+2Hc3YAvjgj30HXRzIDImLL0jLZWF9YJf1n6SikJrKz9PIlatOl5nUhPAiAWrCigN49mfV3y7COdujg2r9GK1GfmOx5ed5BhJNAZY9ZkTs6jlVkFbZb9X3Jv18XZVNEgo+BI5PTGwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XnEjbU/5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V9fPMn024217;
	Thu, 31 Jul 2025 11:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yS/XbXU5Wi2qavF9aaU076l00mh2nrP84Uf3OHJAxCI=; b=XnEjbU/5ofvijgD6
	HFlHlR8DqcD9U6RLEuSEq+Wb4qH+zMdQSes1ir6x4pq7Au65EPP8vHqeaORkVlmd
	WoJikJSNrHW3VaymMWDjlXdU9nb8APDInPCtk/CLKJuv+hoSDXKEvKepaITxecu3
	lkqqA2CP67jz+Amiklrw4A/8nMAZeEh6M5F5YhIM30l+mOQxwWcLvHFKxK5LbNJO
	GED4IM4eHYK3cOG2MtXKSOqY4LSE7ULwVG6zeor/onemWHF2BhyvR2sYW6Dt2yqF
	/R4Cn8Qq+Lir5kfg1REtF6P4xQHeSZ77GpcsxUOBBg7b0WcUURTql3yzfcBYXLPk
	Yrg0Zg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qyny6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 11:46:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56VBkQ74002095
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Jul 2025 11:46:26 GMT
Received: from [10.217.216.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 31 Jul
 2025 04:46:22 -0700
Message-ID: <82d11cf6-bfed-9b73-c697-c692d1c7e02d@quicinc.com>
Date: Thu, 31 Jul 2025 17:16:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V2 2/2] mmc: sdhci-msm: Rectify DLL programming sequence
 for SDCC
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sachin Gupta
	<quic_sachgupt@quicinc.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        "Ulf
 Hansson" <ulf.hansson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_mapa@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_sartgarg@quicinc.com>
References: <20241218091057.15625-1-quic_sachgupt@quicinc.com>
 <20241218091057.15625-3-quic_sachgupt@quicinc.com>
 <a2mnkliubpdryxdwsd33kccvnlb4fnyzik5ywxw4xhnimwdwsm@oxe34zogzfot>
 <bb60a145-1e8f-4004-b266-9f26a11440b9@quicinc.com>
 <otfof56qvqxyjaq6onor2f3egrt57h2xazncias72qnn4xjgz5@2aj2pyj5xmyl>
 <a885b32c-c59f-4fb6-b2cb-7955d2d3ae69@quicinc.com>
 <mpuyg4ndd7xvfpwd6oubn7zmzkuienyrig5pmkrd4badlpebvf@h6weyimpcfv2>
 <769268c2-9a7f-4b6e-aabd-a6cf5a744d5b@quicinc.com>
 <d5ykzwuk3wrwycol3wpeontfp5t7h7vfrfcxnmxei3qs74xsp7@ihtzne5wbytf>
 <81323b02-a7be-847a-b973-ca0cdb906558@quicinc.com>
 <p7o2ykmpghx5jqagpkhd2rfqgizcdagn366rltyn4gmbmnmpje@vcygaqcaowkn>
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <p7o2ykmpghx5jqagpkhd2rfqgizcdagn366rltyn4gmbmnmpje@vcygaqcaowkn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA4MCBTYWx0ZWRfX5ofeLYwUDCYX
 3JFazf6nmoyWRvk5EAZNk5zJszRhUZdGlpu+7p7GERqqS5go30V3rm3O0omO5Nw7T0YPAxig6AQ
 JVK0oZUcdnSO2C6hT8cO8wgomOzWG0KxMsPQ98iqsFHVNd24PdGtpybQmWEuXIdz6EtiHRt0+Zs
 yS09jbR16BQc2AgaC9lrauOH0k5mClLh9l8eCKg0PkR6TdS3CBxV9RBNl74pb08snf8Yc3XKkAe
 uHUziaFr0ROZrn4Di02ah8EYKgDJOCmCFI++3jkoYCOZqmR5r/F/QxHLsOT1nSBRK6GmJaLf11+
 6v/taSB0zc/CRz4SazwCA62mRy3j1nU/4HTVZ6pwhokmyq00x9j4PjYcdvwMQo3qDUkHDnnOFgt
 6Wz5t6u7r2JtPBWHeYX+xNPA2NyQcSwbfJdOQxRsWNNIBQNIyh7wLGB+8mDZAJyK4d6L48zF
X-Proofpoint-ORIG-GUID: HjUAUaVs2D4cYmS1AOuIpNH-2Ynvq9_4
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=688b5793 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=iQVU1UiBVeion8-tTIwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: HjUAUaVs2D4cYmS1AOuIpNH-2Ynvq9_4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_02,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507310080


On 7/30/2025 11:26 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 23, 2025 at 03:43:37PM +0530, Ram Prakash Gupta wrote:
>> On 1/22/2025 3:20 PM, Dmitry Baryshkov wrote:
>>> On Wed, Jan 22, 2025 at 02:57:59PM +0530, Sachin Gupta wrote:
>>>> On 1/7/2025 8:38 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Jan 07, 2025 at 11:13:32AM +0530, Sachin Gupta wrote:
>>>>>> On 12/27/2024 12:23 AM, Dmitry Baryshkov wrote:
>>>>>>> On Thu, Dec 26, 2024 at 11:22:40AM +0530, Sachin Gupta wrote:
>>>>>>>> On 12/19/2024 11:24 AM, Dmitry Baryshkov wrote:
>>>>>>>>> On Wed, Dec 18, 2024 at 02:40:57PM +0530, Sachin Gupta wrote:
>>>>>>>>>> +
>>>>>>>>>> +static unsigned int sdhci_msm_get_clk_rate(struct sdhci_host *host, u32 req_clk)
>>>>>>>>>> +{
>>>>>>>>>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>>>>>>>>>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>>>>>>>>>> +	struct clk *core_clk = msm_host->bulk_clks[0].clk;
>>>>>>>>>> +	unsigned int sup_clk;
>>>>>>>>>> +
>>>>>>>>>> +	if (req_clk < sdhci_msm_get_min_clock(host))
>>>>>>>>>> +		return sdhci_msm_get_min_clock(host);
>>>>>>>>>> +
>>>>>>>>>> +	sup_clk = clk_round_rate(core_clk, clk_get_rate(core_clk));
>>>>>>>>>> +
>>>>>>>>>> +	if (host->clock != msm_host->clk_rate)
>>>>>>>>>> +		sup_clk = sup_clk / 2;
>>>>>>>>>> +
>>>>>>>>>> +	return sup_clk;
>>>>>>>>> Why?
>>>>>>>> Sorry, I did not understand your question. Can you please explain in detail.
>>>>>>> Please explain the maths. You get the rate from the clock, then you
>>>>>>> round it, but it is the rate that has just been returned, so there
>>>>>>> should be no need to round it. And after that there a division by two
>>>>>>> for some reason. So I've asked for an explanation for that code.
>>>>>>>
>>>>>> clk_round_rate is used in case of over clocking issue we can round it to the
>>>>>> usable frequency.
>>>>> If it is a frequency _returned_ by the clock driver, why do you need to
>>>>> round it? It sounds like that freq should be usable anyway.
>>>>>
>>>> I agree, rounding will be taken care by clock driver. Will remove in my next
>>>> patch.
>>>>
>>>>>> Divide by 2 is used as for HS400 the tuning happens in
>>>>>> HS200 mode only so to update the frequency to 192 Mhz.
>>>>> Again, is it really 192 MHz? Or 19.2 MHz?
>>>>> Also if it is for HS400, then shouldn't /2 be limited to that mode?
>>>>>
>>>> Yes, It is 192 MHz.
>>> Good, thanks for the confirmation.
>>>
>>>> As part of eMMC Init, driver will try to init with the best mode supported
>>>> by controller and device. In this case it is HS400 mode, But as part of
>>>> HS400 mode, we perform Tuning in HS200 mode only where we need to configure
>>>> half of the clock.
>>> This isn't an answer to the question. Let me rephrase it for you: if the
>>> /2 is only used for HS400, why should it be attempted in all other
>>> modes? Please limit the /2 just to HS400.
>> Hi Dmitry,
>>
>> like updated earlier by Sachin, HS400 tuning happens in HS200 mode, so if
>> we try to use "ios->timing == MMC_TIMING_MMC_HS400" that wont help, as at
>> this stage timing can be MMC_TIMING_MMC_HS200/MMC_TIMING_MMC_HS400 for
>> hs200 tuning and hs400 selection. In this case we must divide clk by 2
>> to get 192MHz and we find this as host->clock wont be equal to 
>> msm_host->clk_rate.
> What are host->clock and msm_host->clk_rate at this point?
> What is the host->flags value? See sdhci_msm_hc_select_mode().

There are 2 paths which are traced to this function when card initializes
in HS400 mode, please consider below call stack in 2 paths

sdhci_msm_configure_dll
sdhci_msm_dll_config
sdhci_msm_execute_tuning
mmc_execute_tuning
mmc_init_card
_mmc_resume
mmc_runtime_resume

with values of host->clock as 200000000 & msm_host-clk_rate as 400000000
and host->flags as 0x90c6.

and

sdhci_msm_configure_dll
sdhci_msm_dll_config
sdhci_msm_set_uhs_signaling
sdhci_set_ios
mmc_set_clock
mmc_set_bus_speed
mmc_select_hs400
mmc_init_card
_mmc_resume
mmc_runtime_resume

with values of host->clock as 200000000 & msm_host-clk_rate as 400000000
and host->flags as 0x90c6 which are same as 1st.

Now if card is initialized in HS200 mode only below is the call stack

sdhci_msm_configure_dll
sdhci_msm_dll_config
sdhci_msm_execute_tuning
mmc_execute_tuning
mmc_init_card
_mmc_resume
mmc_runtime_resume

with values of host->clock as 200000000 & msm_host-clk_rate as 200000000
and host->flags as 0x90c6.

now if you see the host->flags value, its same across the modes, and if
I am getting it right from the pointed out function
sdhci_msm_hc_select_mode(), your suggestion seems to be using the check
host->flags & SDHCI_HS400_TUNING which is bit[13], but in above dumped
host->flags SDHCI_HS400_TUNING bit is not set where we are using the /2.

and the reason is, this bit is getting cleared in sdhci_msm_execute_tuning()
before sdhci_msm_dll_config() call.

so this /2, is eventually called only for HS400 mode.

Thanks,
Ram

>
>> Now if we go for only HS200 mode supported card, there
>> the supported clock value would be 192Mhz itself and we need to pass
>> clk freq as 192MHz itself, hence division by 2 wont be needed, that is
>> achieved there as host->clock would be equal to msm_host->clk_rate. Hence
>> no other check is needed here.
> Please think about the cause, not about the symptom. Clocks being
> unequal is a result of some other checks being performed by the driver.
> Please use those checks too.
>
>> sorry for it took time to update as I was gathering all this data.
> 6 months? Well, that's a nice time to "gather all this data".

Took it up from sachin last month but still its a long gap.
Thanks for helping revive.

>
>> since Sachin have already pushed patchset #3, and if this explanation
>> helps, let me know if we can continue on patchset #3.
>>
>> Thanks,
>> Ram
>>

