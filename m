Return-Path: <linux-arm-msm+bounces-48496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A1BA3BD1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 12:39:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A98161887AE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 11:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EAA61DDA3B;
	Wed, 19 Feb 2025 11:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hfw54a2d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E361DED5E;
	Wed, 19 Feb 2025 11:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739965147; cv=none; b=K2V3bBnBGhNoV2Yn85wOhE4XpFwxuDe77e++ZuiZuTU4QZhSSaW+2Sdth89d19RbpZNouPdMbrDNWZUkv6yQCo84/LrgcUV7Z9u4Xe05pMMCixzdF+7O6WFbTeEXo0yMfThrfPo3Ya934Mh3PnAOdTcO/Bu7OdYonZtbMajhDU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739965147; c=relaxed/simple;
	bh=kVjG+LoOvzKSybq/uXObFDAfsOKdr1OdI9hjeJTRd24=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EHk97o6dDpAxBqc/gQmeAmHVlpm0O0nGgbnolhxO+Cp7FUyfOuBwqfl6/yj8h1pNlbKiACqOQJMvUgxlfnwvt5WQezEI60m8xWRWlayPR115u8HaQ9ZH1wQCg9+kul0HDa8tmDb+FHjiEzAhUTv7t8ea8BOmXIGRrh8r3ObVOfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hfw54a2d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J8NNZE011711;
	Wed, 19 Feb 2025 11:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/SO6Pd+Fmkr5dE7SqAMSVjcZpHTgtWNBhTIdgpRQd8=; b=Hfw54a2dCnCFzyDe
	7TbJ8yTWX9MDa5s+xpcRthtP24X79AaCQX7U4XzOfiHxdIp/7fen9t2AE39Hev9r
	7lteWGIvoTUEoM2x0fg/sETvxPhFbNDoROuUlsvS1F9MpXzv0lkOqbtMWAkndm+N
	NZqovP5k1dsXFThDHvqkgbaUg9eUA0pcNhqkV5BUAtmQaQfaoEZ/CPnkvz+gX0PA
	9fvzZ7VF+K2SKz+rie05U1pWERN3xg+Gks2nRvLaXCu3xXsb+umsWqTK+G+cQzwj
	On3970eTKaO2CSE7mzuIGmVtbD5YVbaDLNriw7D87JQRdi7ehOIAZtV/YkME3QD1
	Unc/DA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1jdgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 11:39:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JBd0iE018921
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 11:39:00 GMT
Received: from [10.217.216.47] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 03:38:55 -0800
Message-ID: <a8350d0f-2a63-46de-86f3-c156809cca0e@quicinc.com>
Date: Wed, 19 Feb 2025 17:08:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: videocc: Add support to attach multiple
 power domains
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey
	<quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        "Taniya
 Das" <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-4-cfe6289ea29b@quicinc.com>
 <eec2869a-fa8f-4aaf-9fc5-e7a8baf0f864@linaro.org>
 <huluiiaqmunvmffoqadrhssd3kl2toutqtcw7rzamv3sqdglsf@7lz66x4sj3gv>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <huluiiaqmunvmffoqadrhssd3kl2toutqtcw7rzamv3sqdglsf@7lz66x4sj3gv>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oOeGINHUzLiYcTEsChkgG-PCW0m10dR9
X-Proofpoint-ORIG-GUID: oOeGINHUzLiYcTEsChkgG-PCW0m10dR9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_05,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190094



On 2/18/2025 10:49 PM, Dmitry Baryshkov wrote:
> On Tue, Feb 18, 2025 at 03:46:15PM +0000, Bryan O'Donoghue wrote:
>> On 18/02/2025 14:26, Jagadeesh Kona wrote:
>>> During boot-up, the PLL configuration might be missed even after
>>> calling pll_configure() from the clock controller probe. This can
>>> happen because the PLL is connected to one or more rails that are
>>> turned off, and the current clock controller code cannot enable
>>> multiple rails during probe. Consequently, the PLL may be activated
>>> with suboptimal settings, causing functional issues.
>>>
>>> To properly configure the video PLLs in the probe on SM8450, SM8475,
>>> SM8550, and SM8650 platforms, the MXC rail must be ON along with MMCX.
>>> Therefore, add support to attach multiple power domains to videocc on
>>> these platforms.
>>>
>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>> ---
>>>   drivers/clk/qcom/videocc-sm8450.c | 4 ++++
>>>   drivers/clk/qcom/videocc-sm8550.c | 4 ++++
>>>   2 files changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
>>> index f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..b50a14547336580de88a741f1d33b126e9daa848 100644
>>> --- a/drivers/clk/qcom/videocc-sm8450.c
>>> +++ b/drivers/clk/qcom/videocc-sm8450.c
>>> @@ -437,6 +437,10 @@ static int video_cc_sm8450_probe(struct platform_device *pdev)
>>>   	struct regmap *regmap;
>>>   	int ret;
>>> +	ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8450_desc);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>>   	ret = devm_pm_runtime_enable(&pdev->dev);
>>>   	if (ret)
>>>   		return ret;
>>> diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
>>> index 7c25a50cfa970dff55d701cb24bc3aa5924ca12d..d4b223d1392f0721afd1b582ed35d5061294079e 100644
>>> --- a/drivers/clk/qcom/videocc-sm8550.c
>>> +++ b/drivers/clk/qcom/videocc-sm8550.c
>>> @@ -542,6 +542,10 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
>>>   	int ret;
>>>   	u32 sleep_clk_offset = 0x8140;
>>> +	ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8550_desc);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>>   	ret = devm_pm_runtime_enable(&pdev->dev);
>>>   	if (ret)
>>>   		return ret;
>>>
>>
>> What's the difference between doing the attach here or doing it in
>> really_probe() ?
> 
> I'd second this. If the domains are to be attached before calling any
> other functions, move the call to the qcom_cc_map(), so that all drivers
> get all domains attached before configuring PLLs instead of manually
> calling the function.
> 

I earlier tried moving the attach PDs call to qcom_cc_map(), but I faced the below issues
1. desc passed to qcom_cc_map() has const qualifier, so updating desc->pd_list
   inside qcom_cc_map() is leading to a warning.
2. If we attach the PDs after calling get_sync() on device, I observed
   that PDS are not getting enabled during probe. Currently qcom_cc_map()
   is called after get_sync() is already called on device.

Probably, we can add a new function qcom_cc_attach_pds_map() where we can
attach PDs and call qcom_cc_map() inside it. We can then invoke this new
function at the start of probe before get_sync(). I will post this change
in next version if this aligns with your thoughts.

Thanks,
Jagadeesh

