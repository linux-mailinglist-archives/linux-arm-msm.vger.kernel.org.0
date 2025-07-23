Return-Path: <linux-arm-msm+bounces-66222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6B2B0EF7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 12:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 029DD5606D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 10:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA6C28A73F;
	Wed, 23 Jul 2025 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W5wqTa13"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D992276036;
	Wed, 23 Jul 2025 10:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753265630; cv=none; b=OkeQoSnaiScfOovhY9qGYb11ccpEUdumBA9CknMslERI0cXslUu6IZmNFfjKFz/1QHXoeU+Z7YmvkfWuFeB5n0A2M+60bdzlmRk6BM/hKMDoTY817KV1J7LN/UHRmz656OzXmRvlhF8DHuF12I7RdOgaxTvoe8tNXO9LUCwmiUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753265630; c=relaxed/simple;
	bh=vlinewbTNbfkk240A2zL78ASZrM5TmbTLMoygsrkTXo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=ZmdTvP55F/qYKIYKExkRdxUjiuh+IUsk4FaZJisLJbPIjzkDNPLYwKUPS8TMNtVcmRiw/WU+wbKHmd+tMIo2/uTkdotzRhg6eZWaLuM5FyMzDJFSfTVxJuqfEiPtL2ttIfO4jit2e7d0+B26p0ZWCmpDpamdKRojTq5TLqdfndw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W5wqTa13; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9XAeX003404;
	Wed, 23 Jul 2025 10:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Aj6y5X4qZo6/XbuHyLczNHKePwsmLTjF3cwbnaI/aU=; b=W5wqTa131iGf4HlB
	YpEaIn6/1p/YxeauJVGHR8/rkoYSFlzyvXWSzUhb4LBoRK5YgAW7veLyoxelwLFA
	Z89Khlf+bB92YDIwSw1JCVyNkm07Z5xkBVciltbC2J5r8z6Jamqq8BMLWuHOrjBd
	+CxtWj5/Eksfu4ks8K5cmfAJbkTYuQkXnZxeYJRHtktpzozKpw84MxcDODJjoeW0
	8/wxFDJoBLYhp/OzKdgqHSLslXQqd5DniPz2Y6F7XFn484yUzqzT8oHq07n/O2w4
	RP4B9x5XYPKf+F4cf1Hkh44yKzGTIzkZJru04fPEKBld+gRkrd+ic04FO9ZxzbHn
	SUFA+g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1c30u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 10:13:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56NADhGB017021
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 10:13:43 GMT
Received: from [10.217.216.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 23 Jul
 2025 03:13:39 -0700
Message-ID: <81323b02-a7be-847a-b973-ca0cdb906558@quicinc.com>
Date: Wed, 23 Jul 2025 15:43:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Subject: Re: [PATCH V2 2/2] mmc: sdhci-msm: Rectify DLL programming sequence
 for SDCC
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sachin Gupta
	<quic_sachgupt@quicinc.com>
CC: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-mmc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_sartgarg@quicinc.com>
References: <20241218091057.15625-1-quic_sachgupt@quicinc.com>
 <20241218091057.15625-3-quic_sachgupt@quicinc.com>
 <a2mnkliubpdryxdwsd33kccvnlb4fnyzik5ywxw4xhnimwdwsm@oxe34zogzfot>
 <bb60a145-1e8f-4004-b266-9f26a11440b9@quicinc.com>
 <otfof56qvqxyjaq6onor2f3egrt57h2xazncias72qnn4xjgz5@2aj2pyj5xmyl>
 <a885b32c-c59f-4fb6-b2cb-7955d2d3ae69@quicinc.com>
 <mpuyg4ndd7xvfpwd6oubn7zmzkuienyrig5pmkrd4badlpebvf@h6weyimpcfv2>
 <769268c2-9a7f-4b6e-aabd-a6cf5a744d5b@quicinc.com>
 <d5ykzwuk3wrwycol3wpeontfp5t7h7vfrfcxnmxei3qs74xsp7@ihtzne5wbytf>
Content-Language: en-US
In-Reply-To: <d5ykzwuk3wrwycol3wpeontfp5t7h7vfrfcxnmxei3qs74xsp7@ihtzne5wbytf>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HJewn-Ng6Qty8U4VPDWmL8Cba11irok4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NSBTYWx0ZWRfX7REgwiMqJKDr
 bV7RwTTl4RkWx5t3ZfTddkYOciZpPt80qfmi+PZkzhxxULBr8RG/hNWqyOvN6E0nLfNvp1ZTp9p
 Wym54fv75Bl0mkgr4L8grei8pNRNI2iGdc34/DsGY2L0LNqpPdsu1RDV3+T21xBDLrSaaLhRajZ
 3cP0UmunMMyS+YaWMS9TxibpSiROKJzOpH69CdOJZHRppAkflw3p/Q00v/ANpgbotdKOWT75LOI
 4/nx0kCevIm0D7M4BFn09woUKX+aUSNxLy14Qp2dMo7Xvy1vjyHCLe1dJfZgmcqdVJji3Q10aTv
 gR9YUe18glV2ItIu0M62eSedZXjKCYyC8UVtjDM8vgOrDsri6tP1Z7zUV8UUwgfjYkCF8JQtTwN
 B7x8uYaunl/fWoWMrfXJAiHiEpplD8hxRL3xq9nDn91sgdgDz/u61jlTQrdCjzHTg0dxbx5l
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=6880b5d8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=6eBFd3pQ3UIc1D0efi4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: HJewn-Ng6Qty8U4VPDWmL8Cba11irok4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230085


On 1/22/2025 3:20 PM, Dmitry Baryshkov wrote:
> On Wed, Jan 22, 2025 at 02:57:59PM +0530, Sachin Gupta wrote:
>> On 1/7/2025 8:38 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jan 07, 2025 at 11:13:32AM +0530, Sachin Gupta wrote:
>>>> On 12/27/2024 12:23 AM, Dmitry Baryshkov wrote:
>>>>> On Thu, Dec 26, 2024 at 11:22:40AM +0530, Sachin Gupta wrote:
>>>>>> On 12/19/2024 11:24 AM, Dmitry Baryshkov wrote:
>>>>>>> On Wed, Dec 18, 2024 at 02:40:57PM +0530, Sachin Gupta wrote:
>>>>>>>> +
>>>>>>>> +static unsigned int sdhci_msm_get_clk_rate(struct sdhci_host *host, u32 req_clk)
>>>>>>>> +{
>>>>>>>> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>>>>>>>> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
>>>>>>>> +	struct clk *core_clk = msm_host->bulk_clks[0].clk;
>>>>>>>> +	unsigned int sup_clk;
>>>>>>>> +
>>>>>>>> +	if (req_clk < sdhci_msm_get_min_clock(host))
>>>>>>>> +		return sdhci_msm_get_min_clock(host);
>>>>>>>> +
>>>>>>>> +	sup_clk = clk_round_rate(core_clk, clk_get_rate(core_clk));
>>>>>>>> +
>>>>>>>> +	if (host->clock != msm_host->clk_rate)
>>>>>>>> +		sup_clk = sup_clk / 2;
>>>>>>>> +
>>>>>>>> +	return sup_clk;
>>>>>>> Why?
>>>>>> Sorry, I did not understand your question. Can you please explain in detail.
>>>>> Please explain the maths. You get the rate from the clock, then you
>>>>> round it, but it is the rate that has just been returned, so there
>>>>> should be no need to round it. And after that there a division by two
>>>>> for some reason. So I've asked for an explanation for that code.
>>>>>
>>>> clk_round_rate is used in case of over clocking issue we can round it to the
>>>> usable frequency.
>>> If it is a frequency _returned_ by the clock driver, why do you need to
>>> round it? It sounds like that freq should be usable anyway.
>>>
>> I agree, rounding will be taken care by clock driver. Will remove in my next
>> patch.
>>
>>>> Divide by 2 is used as for HS400 the tuning happens in
>>>> HS200 mode only so to update the frequency to 192 Mhz.
>>> Again, is it really 192 MHz? Or 19.2 MHz?
>>> Also if it is for HS400, then shouldn't /2 be limited to that mode?
>>>
>> Yes, It is 192 MHz.
> Good, thanks for the confirmation.
>
>> As part of eMMC Init, driver will try to init with the best mode supported
>> by controller and device. In this case it is HS400 mode, But as part of
>> HS400 mode, we perform Tuning in HS200 mode only where we need to configure
>> half of the clock.
> This isn't an answer to the question. Let me rephrase it for you: if the
> /2 is only used for HS400, why should it be attempted in all other
> modes? Please limit the /2 just to HS400.

Hi Dmitry,

like updated earlier by Sachin, HS400 tuning happens in HS200 mode, so if
we try to use "ios->timing == MMC_TIMING_MMC_HS400" that wont help, as at
this stage timing can be MMC_TIMING_MMC_HS200/MMC_TIMING_MMC_HS400 for
hs200 tuning and hs400 selection. In this case we must divide clk by 2
to get 192MHz and we find this as host->clock wont be equal to 
msm_host->clk_rate. Now if we go for only HS200 mode supported card, there
the supported clock value would be 192Mhz itself and we need to pass
clk freq as 192MHz itself, hence division by 2 wont be needed, that is
achieved there as host->clock would be equal to msm_host->clk_rate. Hence
no other check is needed here.

sorry for it took time to update as I was gathering all this data.
since Sachin have already pushed patchset #3, and if this explanation
helps, let me know if we can continue on patchset #3.

Thanks,
Ram


