Return-Path: <linux-arm-msm+bounces-53602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D05A9A81C60
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 07:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF68988352F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 05:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D271DB124;
	Wed,  9 Apr 2025 05:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LfCvLzdN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447D51D5CC2;
	Wed,  9 Apr 2025 05:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744177756; cv=none; b=FIPdfRzs7hpYtNFYbqq4EbHu0h8tN1pwLN2EvOq3feY4BtNzctW+cIZexmCFT93NLGcbHhQdJ7fliBDbrDRb/koUEnGtWz3fQwHFWjxDeY7ZUxGRcUDUmHVNnRD7/gOGB3fCs/4PptlRUOgiJxaDqkbeq3MCNueAzQa6Pv1bGGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744177756; c=relaxed/simple;
	bh=k4HcGRw78ZPemeVLUPmNyPpjYHYVgeBQ3IfXfKFaiqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Q4fAB+sP4axKjg9D4/Uyc7SIF/NSxRd8sMk8Frk3FIcc5Raxi//DNGe3mu3Z+rHovCMmVmc2IycJGcMMya7xgQLy93w3SNzVrMRxDhgjEclhFoksSExoQghuDOKgmVKfBGy/rOKXzXcXq+4Utfock/M84tCtAcPWPAXdFr1Fl2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LfCvLzdN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JZem7011629;
	Wed, 9 Apr 2025 05:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovsg1QF8xQXaSQIpASLIOR/7BlVQMkeqc0GKLgadWWw=; b=LfCvLzdN/zncPJ5k
	eDJl+aEnQrr4nwizG4NdbVf9Y/bg+xoAxATEL2+5tC7CQQLLlM1WTnLd31WDIHaa
	6/QXZsYoT7OnxZeae7MbdoWWu7olejUx/dsE6tMwpaw5J1y4Hr1ACGznYHcWPfNu
	Lcdrh/TiFFhc1JaNZlDJOAMEP02/Y9U1Qs9HDA4DFRai8F0GXK0rh1dblK/MkubZ
	GuqyG8VqLjMhUcDcI/K1P7IYd1X4hOmHjvQH+TmzloT1/ietjvD9n5wJEzb9usby
	kInspd1x+1/laWneEJbMpeY5IbJs0rukJm5oQw98j9a2fcsWbVE0z3pyOIH2mZEb
	EclwfQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftj2g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 05:49:05 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5395n56L001254
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 05:49:05 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 22:49:01 -0700
Message-ID: <6ab62bb9-2758-4a12-aec3-6de9efc3075a@quicinc.com>
Date: Wed, 9 Apr 2025 11:18:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <alexandre.belloni@bootlin.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jarkko.nikula@linux.intel.com>,
        <linux-i3c@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
References: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
 <20250403134644.3935983-3-quic_msavaliy@quicinc.com>
 <20250404-provocative-mayfly-of-drama-eeddc1@shite>
 <4fe9f898-63bf-4815-a493-23bdee93481e@quicinc.com>
 <e93c50ce-30dd-45ef-b945-019e703bd7c3@kernel.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <e93c50ce-30dd-45ef-b945-019e703bd7c3@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f60a51 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=9noXzk69sv193lEOhfoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: R7jrNI3Zn3z8QFV1UoGmI9KPfZ17VsXq
X-Proofpoint-ORIG-GUID: R7jrNI3Zn3z8QFV1UoGmI9KPfZ17VsXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090020

Hi Krzysztof,

On 4/9/2025 12:11 AM, Krzysztof Kozlowski wrote:
> On 08/04/2025 15:23, Mukesh Kumar Savaliya wrote:
>>>> +
>>>> +static int i3c_geni_runtime_get_mutex_lock(struct geni_i3c_dev *gi3c)
>>>> +{
>>>
>>> You miss sparse/lockdep annotations.
>>>
>> This is called in pair only, but to avoid repeated code in caller
>> functions, we have designed this wrapper.
>> i3c_geni_runtime_get_mutex_lock()
>> i3c_geni_runtime_put_mutex_unlock().
>>
>> caller function maintains the parity. e.g. geni_i3c_master_priv_xfers().
>>
>> Does a comment help here ? Then i can write up to add.
> 
> I do not see how this is relevant to my comment at all.
> 
What i understood is you suspect about lock/unlock imbalance right ?
I know that Lockdep annotations will be used to check if locks are 
acquired and released in a proper order.

You want me to add below code in both the functions mentioned ?
     lockdep_assert_held(&gi3c->lock);

What exact sparse/attribute can be added ? I am not sure about that.
>>
>>>> +	int ret;
>>>> +
>>>> +	mutex_lock(&gi3c->lock);
>>>> +	reinit_completion(&gi3c->done);
>>>> +	ret = pm_runtime_get_sync(gi3c->se.dev);
>>>> +	if (ret < 0) {
>>>> +		dev_err(gi3c->se.dev, "error turning on SE resources:%d\n", ret);
>>>> +		pm_runtime_put_noidle(gi3c->se.dev);
>>>> +		/* Set device in suspended since resume failed */
>>>> +		pm_runtime_set_suspended(gi3c->se.dev);
>>>> +		mutex_unlock(&gi3c->lock);
>>>
>>> Either you lock or don't lock, don't mix these up.
>>>
>> Caller is taking care of not calling i3c_geni_runtime_put_mutex_unlock()
>> if this failed.
> 
> 
> I do not see how this is relevant to my comment at all.
> 
same as above
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void i3c_geni_runtime_put_mutex_unlock(struct geni_i3c_dev *gi3c)
>>>> +{
>>>
>>> Missing annotations.
>>>
>> Shall i add a comment here ?
> 
> Do you understand what is sparse? And lockdep?
> 
Little but not clear on exact sparse attribute to be added. please help 
me. if you can help with some clear comment and sample, will be easier 
if you can.

Lockdep : Helps with runtime check if lock, unlock are proper.
sparse: attributes /special comments to add which helps with static 
analysis which is not done by the compiler.
>>>> +	pm_runtime_mark_last_busy(gi3c->se.dev);
>>>> +	pm_runtime_put_autosuspend(gi3c->se.dev);
>>>> +	mutex_unlock(&gi3c->lock);
>>>> +}
>>>> +
>>>> +static void geni_i3c_abort_xfer(struct geni_i3c_dev *gi3c)
>>>> +{
>>>> +	unsigned long time_remaining;
>>>> +	unsigned long flags;
>>>> +
>>>> +	reinit_completion(&gi3c->done);
>>>> +	spin_lock_irqsave(&gi3c->irq_lock, flags);
>>>> +	geni_i3c_handle_err(gi3c, GENI_TIMEOUT);
>>>> +	geni_se_abort_m_cmd(&gi3c->se);
>>>> +	spin_unlock_irqrestore(&gi3c->irq_lock, flags);
>>>> +	time_remaining = wait_for_completion_timeout(&gi3c->done, XFER_TIMEOUT);
>>>> +	if (!time_remaining)
>>>> +		dev_err(gi3c->se.dev, "Timeout abort_m_cmd\n");
>>>> +}
>>>
>>> ...
>>>
>>>> +
>>>> +static int i3c_geni_resources_init(struct geni_i3c_dev *gi3c, struct platform_device *pdev)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	gi3c->se.base = devm_platform_ioremap_resource(pdev, 0);
>>>> +	if (IS_ERR(gi3c->se.base))
>>>> +		return PTR_ERR(gi3c->se.base);
>>>> +
>>>> +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se");
>>>> +	if (IS_ERR(gi3c->se.clk))
>>>> +		return dev_err_probe(&pdev->dev, PTR_ERR(gi3c->se.clk),
>>>> +							"Unable to get serial engine core clock: %pe\n",
>>>> +							gi3c->se.clk);
>>>
>>> Totally messed indentation.
>>>
>> yes, corrected.
>>>> +	ret = geni_icc_get(&gi3c->se, NULL);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/* Set the bus quota to a reasonable value for register access */
>>>> +	gi3c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
>>>> +	gi3c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
>>>> +	ret = geni_icc_set_bw(&gi3c->se);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/* Default source clock (se-clock-frequency) freq is 100Mhz */
>>>> +	gi3c->clk_src_freq = KHZ(100000);
>>>
>>> And why can't you use clk_get_rate()?
>>>
>> During probe(), we need one time initialization of source clock
>> frequencey. HW has no clock set before this.
> 
> How is it possible that there is no clock or clock was not configured
> but you need to know it? Anyway, it's tiring to keep discussing this.
> 
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int geni_i3c_probe(struct platform_device *pdev)
>>>> +{
>>>> +	u32 proto, tx_depth, fifo_disable;
>>>> +	struct geni_i3c_dev *gi3c;
>>>
>>> Just store pdev->dev in local dev variable, to simplify everything here.
>> yes, thats right. But i see other drivers are using same pdev->dev. Is
>> it fine ? if really required, will change it.
> 
> Are you going to discuss every little comment? And come with arguments
> like "I found poor code, so I am allowed to do the same"?
> 
> Best regards,
> Krzysztof


