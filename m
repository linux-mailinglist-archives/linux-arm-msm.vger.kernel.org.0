Return-Path: <linux-arm-msm+bounces-19620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2D08C18A3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 23:49:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B81B6B21032
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 21:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53EDB128835;
	Thu,  9 May 2024 21:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Wec7jvMq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0D91A2C03;
	Thu,  9 May 2024 21:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715291388; cv=none; b=eirX81JWszhck1GFVkCLuvvv0b5QTTU7FGmc6ZZWFzEas6YxLiQ2jaXpYWejl3mp66n+rNmTAZo3ThNAvEpZ2VzoVxtpC/1YpXElN7YqGgefndJsQLVxbvjlLgm2QKru3trT+7XAA+HxwpIDNWIWxgYUaVDntCD7rTwDbMRzpY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715291388; c=relaxed/simple;
	bh=YCmpm9M7rg8bBTlTTi1uizIbI7KtF4vkiyWgevlyEds=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l2xIKeEhl8IWNYJqFS3xs1G1JSBdFDZ8NHs5RuDeU3CjGsU0Hrwr6khmC0xmUkxJpsDOiTQx1WV4YkS38cwkvvivUCUA4Vzmbc6zDxxABTeM3mFe//+ffLMDG5qg0Uym1M3ubxUYfu36UivGE2ldBFaIBRd43XIocJXxq4TRksM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Wec7jvMq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 449LeJ75002135;
	Thu, 9 May 2024 21:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=vsHhs1cefp7jBsXfNMjMddfKHMvYPmG767OdbGYguio=; b=We
	c7jvMqaesiri1Q+2hFG3qFpCtMJXuUwvOlGGiIV55AquBd4b4NMIjxvRgSRDAA2H
	Qc83nV+Lnut39c/jpF8qLaz1zfrcYly+9a3fHDqAtSNBKJ3s/2bmupPzjF+noPx7
	028F/a/AWN9r/RpZAu48vljrXKG0Qv5BxWIeV1Io1mHOoHMCCkb/UWAIZYM2WuVm
	yWgv9lUAWpavCqA/vrB+bFVeRS8bf1zLQeTsurosT8m5JuKlRx3a4+WHLtsCUDS2
	ygVDiNObE4hRSVDdUds2jJr2Q3P7K3RgLAX3TG0lP2O4EbZuJSkeSfgHj2tImZoM
	cbc7eNZOhCDXbEgHKuUw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16kp80bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 21:49:28 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 449LnLKn030148
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 21:49:21 GMT
Received: from [10.71.112.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 14:49:20 -0700
Message-ID: <072960e7-c8db-b25c-46f8-019534d325d4@quicinc.com>
Date: Thu, 9 May 2024 14:49:20 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v21 26/39] ASoC: qcom: qdsp6: Add support to track
 available USB PCM devices
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <lgirdwood@gmail.com>, <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <Thinh.Nguyen@synopsys.com>,
        <broonie@kernel.org>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <bagasdotme@gmail.com>, <robh@kernel.org>, <konrad.dybcio@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240507195116.9464-1-quic_wcheng@quicinc.com>
 <20240507195116.9464-27-quic_wcheng@quicinc.com>
 <875b643f-af2c-4a1b-87e8-80cd6f236dea@linux.intel.com>
 <b1f8b531-6041-ec11-5932-13bf17b69d0b@quicinc.com>
 <76a943f7-d839-4378-aa12-7fb32e3077e6@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <76a943f7-d839-4378-aa12-7fb32e3077e6@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZQ3i_RvxmNE7-LOMZcLE_vjCphChvZ9_
X-Proofpoint-ORIG-GUID: ZQ3i_RvxmNE7-LOMZcLE_vjCphChvZ9_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_12,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=827 impostorscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 clxscore=1015 mlxscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405090155

Hi Pierre,

On 5/9/2024 6:02 AM, Pierre-Louis Bossart wrote:
> 
> 
> On 5/8/24 18:57, Wesley Cheng wrote:
>> Hi Pierre,
>>
>> On 5/7/2024 2:23 PM, Pierre-Louis Bossart wrote:
>>>
>>>> @@ -113,6 +120,12 @@ static int q6usb_alsa_connection_cb(struct
>>>> snd_soc_usb *usb,
>>>>        if (connected) {
>>>>            /* We only track the latest USB headset plugged in */
>>>>            data->active_usb_chip_idx = sdev->card_idx;
>>>> +
>>>> +        set_bit(sdev->card_idx, &data->available_card_slot);
>>>> +        data->status[sdev->card_idx].sdev = sdev;
>>>
>>> Not following the 'only track the latest USB headset plugged in', I
>>> don't see anything that discard the previously latest headset...
>>>
>>> If you plug headset1, then headset2, how is headset1 marked as not
>>> available for USB offload?
>>>
>>
>> It won't mark headset1 as not available for offload, because offload
>> could happen on either depending on what is selected (from the kcontrol
>> as well).
> 
> Right, so the wording 'only track the latest USB headset plugged in' is
> incorrect or obsolete, isn't it?

Sure, I can reword it.  Will specify that it
"selects the latest USB headset plugged in for offloading"

Thanks
Wesley Cheng

