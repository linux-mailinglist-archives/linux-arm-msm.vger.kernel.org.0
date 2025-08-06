Return-Path: <linux-arm-msm+bounces-67951-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A574B1CD18
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 22:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0BF047AC00D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 20:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779B82E1726;
	Wed,  6 Aug 2025 19:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BEExOR+B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D0C2BE7BA;
	Wed,  6 Aug 2025 19:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754510324; cv=none; b=e3AWbIwlZiSMrjIYZE/5yxZv/7k8OEp3zRzbFxO283JEb8KVoDnFP8HJk9OGb+Z5ctQSnI/SJN5xIlkuQa959kol7DF6+IHIZhk3dxkuBDNn47XgmTe9zw8M06S/+ZX3W/zGMRjcWY4t/Omw9a7hid2YEFv2WgvaKjKhsc4LwoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754510324; c=relaxed/simple;
	bh=7FM5giAlBO3Dzd/4NYVw7LeLsXIdc/OScnS6HCNgP3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UEP3EGdPLn1WrS+VAiZwun0xo9bbu4J+pDyp2cDgpRitOUMbnFHZmOw52SqrHbrYAx13o2ANlkLNhGebTMzrhvLKyMKiS9g+/LMGN+m1/gkfPB6VA0OoSAZzGjA1vQFFZpq32gZZjyYAeUfx76o/i/EOzkl9UPt/OD9A28YF83A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BEExOR+B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576ES47Q004895;
	Wed, 6 Aug 2025 19:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7FM5giAlBO3Dzd/4NYVw7LeLsXIdc/OScnS6HCNgP3U=; b=BEExOR+BGz4cuaG5
	ADdRzQ7Jx4wQHFkt5r5sW+sXOrYDI7lsqzww3AtrbYNH8RhqlDekloCn0DLN/ycD
	uhek3XtxC2pp8m19ANqdo3IfxjVQwSq6gmhKgp3YBi0EtM5GVw4up1AboCQxPVqB
	ZDr1+9YSxx1Y7iEyB1aUx71bCH2QrQZq1XZcOjBBUMi8Vwgf+kPrlTsazOcjw9IM
	Zsq7VqAFFVi2Rtx/WhGEKNreq8FWkf1XBvctYkWxB13a5SOI1yfn47nOAQW6FTgg
	tTHY1d23vUNhiDW/OGU5JFDiN6vgjzuWVbWsh8psDn7hpXWyLafjzQl+FCU9ADZN
	q0wZzQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u20wkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 19:58:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 576JwaLM013847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Aug 2025 19:58:36 GMT
Received: from [10.216.16.113] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 6 Aug
 2025 12:58:31 -0700
Message-ID: <bb85f33a-17e4-3c7f-57ce-c4d67b7d655b@quicinc.com>
Date: Thu, 7 Aug 2025 01:28:28 +0530
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
 <82d11cf6-bfed-9b73-c697-c692d1c7e02d@quicinc.com>
 <1f910d65-de34-424d-adf9-7669c22afeaa@oss.qualcomm.com>
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <1f910d65-de34-424d-adf9-7669c22afeaa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: t7sd5ocOhhkMXayuHQs8nflrE-7l6__3
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=6893b3ec cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=lKBkn0vafKNPFBMhTOwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: t7sd5ocOhhkMXayuHQs8nflrE-7l6__3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfX9S/cdKpqB6jz
 W1OoS8YArZm+YEIKFY7/UPXygcjcF1NDEnuF8FEs0d6YjsEM9Frm8p5eweNOFp5EOa+V5dlO8Tb
 Jf2EdaECbIgXh/y9n1S8EmDTT6tTO4VGPE9LzPoYWZmbfeWyInB4UEv8Obwt8GlROEsmS0RF2la
 t5eshHlu2E3elne4Hsm0BuExYtUrOCep9ouDUr6OwPca3xDUXHytrzq6Nt63CTgI9oiBWetvWhP
 e1Saae/4vYTt+4nGjSynu3oJlkOFkHxnqIiXNuBT660fch4hnvDLPHp2PHAcuy6uop6L9Qozbug
 hDCL1UFPX2E4TWW9uoh+SazqA8stGAVO4JjRFArRxdylWHbNytVVi8QmbaZI9g07GZ3CK1ZzNCe
 fTsEiwPH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060090


On 7/31/2025 7:49 PM, Dmitry Baryshkov wrote:
> On 31/07/2025 14:46, Ram Prakash Gupta wrote:
>>
>> On 7/30/2025 11:26 PM, Dmitry Baryshkov wrote:
>>> On Wed, Jul 23, 2025 at 03:43:37PM +0530, Ram Prakash Gupta wrote:
>>>> On 1/22/2025 3:20 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Jan 22, 2025 at 02:57:59PM +0530, Sachin Gupta wrote:
>>>>>> On 1/7/2025 8:38 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Jan 07, 2025 at 11:13:32AM +0530, Sachin Gupta wrote:
>>>>>>>> On 12/27/2024 12:23 AM, Dmitry Baryshkov wrote:
>>>>>>>>> On Thu, Dec 26, 2024 at 11:22:40AM +0530, Sachin Gupta wrote:
>>>>>>>>>> On 12/19/2024 11:24 AM, Dmitry Baryshkov wrote:
>>>>>>>>>>> On Wed, Dec 18, 2024 at 02:40:57PM +0530, Sachin Gupta wrote:
>>>>>>>>>>>> +
>>>>>>>>>>>> +static unsigned int sdhci_msm_get_clk_rate(struct sdhci_host *host, u32 req_clk)
>>>>>>>>>>>> +{
>>>>>>>>>>>> +    struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>>>>>>>>>>>> +    struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>>>>>>>>>>>> +    struct clk *core_clk = msm_host->bulk_clks[0].clk;
>>>>>>>>>>>> +    unsigned int sup_clk;
>>>>>>>>>>>> +
>>>>>>>>>>>> +    if (req_clk < sdhci_msm_get_min_clock(host))
>>>>>>>>>>>> +        return sdhci_msm_get_min_clock(host);
>>>>>>>>>>>> +
>>>>>>>>>>>> +    sup_clk = clk_round_rate(core_clk, clk_get_rate(core_clk));
>>>>>>>>>>>> +
>>>>>>>>>>>> +    if (host->clock != msm_host->clk_rate)
>>>>>>>>>>>> +        sup_clk = sup_clk / 2;
>>>>>>>>>>>> +
>>>>>>>>>>>> +    return sup_clk;
>>>>>>>>>>> Why?
>>>>>>>>>> Sorry, I did not understand your question. Can you please explain in detail.
>>>>>>>>> Please explain the maths. You get the rate from the clock, then you
>>>>>>>>> round it, but it is the rate that has just been returned, so there
>>>>>>>>> should be no need to round it. And after that there a division by two
>>>>>>>>> for some reason. So I've asked for an explanation for that code.
>>>>>>>>>
>>>>>>>> clk_round_rate is used in case of over clocking issue we can round it to the
>>>>>>>> usable frequency.
>>>>>>> If it is a frequency _returned_ by the clock driver, why do you need to
>>>>>>> round it? It sounds like that freq should be usable anyway.
>>>>>>>
>>>>>> I agree, rounding will be taken care by clock driver. Will remove in my next
>>>>>> patch.
>>>>>>
>>>>>>>> Divide by 2 is used as for HS400 the tuning happens in
>>>>>>>> HS200 mode only so to update the frequency to 192 Mhz.
>>>>>>> Again, is it really 192 MHz? Or 19.2 MHz?
>>>>>>> Also if it is for HS400, then shouldn't /2 be limited to that mode?
>>>>>>>
>>>>>> Yes, It is 192 MHz.
>>>>> Good, thanks for the confirmation.
>>>>>
>>>>>> As part of eMMC Init, driver will try to init with the best mode supported
>>>>>> by controller and device. In this case it is HS400 mode, But as part of
>>>>>> HS400 mode, we perform Tuning in HS200 mode only where we need to configure
>>>>>> half of the clock.
>>>>> This isn't an answer to the question. Let me rephrase it for you: if the
>>>>> /2 is only used for HS400, why should it be attempted in all other
>>>>> modes? Please limit the /2 just to HS400.
>>>> Hi Dmitry,
>>>>
>>>> like updated earlier by Sachin, HS400 tuning happens in HS200 mode, so if
>>>> we try to use "ios->timing == MMC_TIMING_MMC_HS400" that wont help, as at
>>>> this stage timing can be MMC_TIMING_MMC_HS200/MMC_TIMING_MMC_HS400 for
>>>> hs200 tuning and hs400 selection. In this case we must divide clk by 2
>>>> to get 192MHz and we find this as host->clock wont be equal to
>>>> msm_host->clk_rate.
>>> What are host->clock and msm_host->clk_rate at this point?
>>> What is the host->flags value? See sdhci_msm_hc_select_mode().
>>
>> There are 2 paths which are traced to this function when card initializes
>> in HS400 mode, please consider below call stack in 2 paths
>>
>> sdhci_msm_configure_dll
>> sdhci_msm_dll_config
>> sdhci_msm_execute_tuning
>> mmc_execute_tuning
>> mmc_init_card
>> _mmc_resume
>> mmc_runtime_resume
>>
>> with values of host->clock as 200000000 & msm_host-clk_rate as 400000000
>
> Please check the rates explicitly in the code rather than just checking that they are not equal.

in function msm_get_clock_mult_for_bus_mode(), clk multiplier returns 2, with HS400
DDR52 and DDR50 modes which is called from sdhci_msm_set_clock() and
sdhci_msm_execute_tuning. And in sdhci_msm_execute_tuning(), we are calling
sdhci_msm_dll_config() when SDHCI_HS400_TUNING is set and this flag is cleared
immediately after return. And sdhci_msm_dll_config() is called after that.

Now when the card is supporting HS400 mode, then from mmc_hs200_tuning(),
sdhci_prepare_hs400_tuning is getting called, and there SDHCI_HS400_TUNING
flag is set, and clock set is multiplying the clk rate by 2 in below call stack

msm_set_clock_rate_for_bus_mode
sdhci_msm_execute_tuning
mmc_execute_tuning
mmc_init_card

so this clk rate is doubling only with HS400 mode selection and while setting up
dll in HS400 dll configuration path sup_clk need to divide by 2 as msm_host->clk_rate
is twice the host->clock as mentioned above.


>
>> and host->flags as 0x90c6.
>>
>> and
>>
>> sdhci_msm_configure_dll
>> sdhci_msm_dll_config
>> sdhci_msm_set_uhs_signaling
>> sdhci_set_ios
>> mmc_set_clock
>> mmc_set_bus_speed
>> mmc_select_hs400
>> mmc_init_card
>> _mmc_resume
>> mmc_runtime_resume
>>
>> with values of host->clock as 200000000 & msm_host-clk_rate as 400000000
>> and host->flags as 0x90c6 which are same as 1st.
>>
>> Now if card is initialized in HS200 mode only below is the call stack
>>
>> sdhci_msm_configure_dll
>> sdhci_msm_dll_config
>> sdhci_msm_execute_tuning
>> mmc_execute_tuning
>> mmc_init_card
>> _mmc_resume
>> mmc_runtime_resume
>>
>> with values of host->clock as 200000000 & msm_host-clk_rate as 200000000
>> and host->flags as 0x90c6.
>>
>> now if you see the host->flags value, its same across the modes, and if
>> I am getting it right from the pointed out function
>> sdhci_msm_hc_select_mode(), your suggestion seems to be using the check
>> host->flags & SDHCI_HS400_TUNING which is bit[13], but in above dumped
>> host->flags SDHCI_HS400_TUNING bit is not set where we are using the /2.
>>
>> and the reason is, this bit is getting cleared in sdhci_msm_execute_tuning()
>> before sdhci_msm_dll_config() call.
>>
>> so this /2, is eventually called only for HS400 mode.
>>
>> Thanks,
>> Ram
>>
>>>
>>>> Now if we go for only HS200 mode supported card, there
>>>> the supported clock value would be 192Mhz itself and we need to pass
>>>> clk freq as 192MHz itself, hence division by 2 wont be needed, that is
>>>> achieved there as host->clock would be equal to msm_host->clk_rate. Hence
>>>> no other check is needed here.
>>> Please think about the cause, not about the symptom. Clocks being
>>> unequal is a result of some other checks being performed by the driver.
>>> Please use those checks too.
>>>
>>>> sorry for it took time to update as I was gathering all this data.
>>> 6 months? Well, that's a nice time to "gather all this data".
>>
>> Took it up from sachin last month but still its a long gap.
>> Thanks for helping revive.
>>
>>>
>>>> since Sachin have already pushed patchset #3, and if this explanation
>>>> helps, let me know if we can continue on patchset #3.
>>>>
>>>> Thanks,
>>>> Ram
>>>>
>
>

