Return-Path: <linux-arm-msm+bounces-10550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33EC78507B5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Feb 2024 05:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE525282550
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Feb 2024 04:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F81FBF6;
	Sun, 11 Feb 2024 04:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CbUi6eAa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0CAFBF3
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Feb 2024 04:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707624758; cv=none; b=jrYOeAWy+bB4o2GkAQZTaci/rY169Czz1zZRM6b7Zz7pyuJgHj6xXDCu+61VtzpMoEFGtwDXfwxLLXMm8CmZKyeSTzY2KJDRmRUAWurRyUFycrCK/Lu4mcFfhl5Jizi2+AEj/6Jxo6hhjStGtPBOBdGfGHf+tSIavnIevOYwxP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707624758; c=relaxed/simple;
	bh=0XxQbFm1ike2IKNFhQdTiYW9OjpEwI6CeXDoBWRtocU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FSV0l2fN2nICUhDsy01E3gTV5NSzxtPAAXTRc1OamkP6PS/jptrFtAnWLnbTr8FBbAnoxe/BLv05lpKwgH6QwPUaJpldIZJdYYzV+65XWh9UJO9N5Egn3LGGJ8ZsP7k+ZypRSiwxIvZ3G+ErJGWMP9YrjSicrSS4NkxxaDk3sXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CbUi6eAa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41B4CUW4025502;
	Sun, 11 Feb 2024 04:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=+o7o9cx07GX6KAWp/n1UqAPOKtlm7Ul5JdTrWZdKwPw=; b=Cb
	Ui6eAaQhsu00i5ycjW4eqUR9gfsvRX9V1R1s5WXC3CDZ0osd5p8j6Z0XwcnSxOmG
	Iog+oEvl6i/WmaBTvVuq3Mwd62Vf1sku2/rkri/H0N3T85KAUz3AfkFHIyyxjLs0
	Z7OChoHGPclFAZKwml2iMwcX6nKV/l4MkJ5eeaolmQS/ro/6R7pk/FGzg58fMkvv
	M8lqNIU2QlgzliMMT3deUjMKO6XANlnf8bDfwAq6qhy2eMiqAg16mjXo8ANFpR5a
	vYos4JBEBXQcLLck5gaBShH9/IYGbNFPymYVUG6pnPi0jkCU2Txfv5vCoqvmrCDv
	c7b4PEAkBMMY6MGt5F2w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w62m0hace-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 Feb 2024 04:12:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41B4CT3Z015236
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 11 Feb 2024 04:12:29 GMT
Received: from [10.110.104.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 10 Feb
 2024 20:12:28 -0800
Message-ID: <2ca5624e-1cf4-9712-f8d8-6a609d95cad2@quicinc.com>
Date: Sat, 10 Feb 2024 20:12:27 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 15/19] drm/msm/dp: enable SDP and SDE periph flush
 update
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-16-quic_parellan@quicinc.com>
 <CAA8EJpqq+H1gdy2pJo0Up=5w0mYTPRu2_1swEBNfyAMXztQanA@mail.gmail.com>
 <1664d096-d258-72fc-8352-7d088000fcc1@quicinc.com>
 <CAA8EJpqE6BEvo1wwKMuSmR4a=VkGzRAuPk_Yw_imeYtTag+Hpg@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqE6BEvo1wwKMuSmR4a=VkGzRAuPk_Yw_imeYtTag+Hpg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DKJvu5K9DH6zNegkbfyo2xlEfzT94xTw
X-Proofpoint-GUID: DKJvu5K9DH6zNegkbfyo2xlEfzT94xTw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-11_03,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 spamscore=0 mlxlogscore=406 impostorscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402110032



On 2/10/2024 2:11 PM, Dmitry Baryshkov wrote:
> On Sat, 10 Feb 2024 at 23:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 2/10/2024 2:16 AM, Dmitry Baryshkov wrote:
>>> On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>>>>
>>>> DP controller can be setup to operate in either SDP update flush mode or
>>>> peripheral flush mode based on the DP controller hardware version.
>>>>
>>>> Starting in DP v1.2, the hardware documents require the use of
>>>> peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.
>>>>
>>>> In-line with this guidance, lets program the DP controller to use
>>>> peripheral flush mode starting DP v1.2
>>>>
>>>> Changes in v2:
>>>>           - Use the original dp_catalog_hw_revision() function to
>>>>             correctly check the DP HW version
>>>>
>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
>>>>    drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
>>>>    drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
>>>>    4 files changed, 21 insertions(+)
>>>>
>>
>> <Snip>
>>
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
>>>> index 2983756c125cd..6ac66532b47a4 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>>>> @@ -102,6 +102,8 @@
>>>>    #define DP_MAINLINK_CTRL_ENABLE                        (0x00000001)
>>>>    #define DP_MAINLINK_CTRL_RESET                 (0x00000002)
>>>>    #define DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER   (0x00000010)
>>>> +#define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP      (0x00800000)
>>>> +#define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE       (0x01800000)
>>>
>>> Just one bit here, please.
>>>
>>
>> hmm .... so the periph flush bits are 24:23 and we need a value of 3 to
>> select peripheral flush which translates to 0x01800000.
>>
>> How do you suggest to break this up?
> 
> Then FIELD_PREP(something_mask, 3). Otherwise it is too easy to
> consider it to be DP_MAINLINK_FLUSH_MODE_UPDATE_SDP | BIT(24)
> 

Sure, FIELD_PREP() works. I was confused when you said one bit :)

>>
>>>>    #define DP_MAINLINK_FB_BOUNDARY_SEL            (0x02000000)
>>>>
>>>>    #define REG_DP_STATE_CTRL                      (0x00000004)
>>>> --
>>>> 2.39.2
>>>>
>>>
>>>
> 
> 
> 

