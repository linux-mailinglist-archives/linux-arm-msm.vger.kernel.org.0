Return-Path: <linux-arm-msm+bounces-19622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFB28C193A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 00:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF556B21B37
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 22:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D570A129A72;
	Thu,  9 May 2024 22:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eSOPKI0x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25829129A6F;
	Thu,  9 May 2024 22:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715292563; cv=none; b=Ia2tZQJZJ5bOL0JUqAZOC8TMCzFUJy9cR7hNRjEKwkEIdnJe13aS/tmqUh0KmfhAjW/856uNDurVWmU+6Iu6ap8VybRgIDK4E7A8tZ7cNB+aa5e1GQaz/9lCfbugJ7W0MdOZHGQskA1ZG7Z+KRkq1GWUM5BeDRAxzWO9GyW5nVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715292563; c=relaxed/simple;
	bh=dSr0oxLlibKNvuTG5gujhJneI5aqNdgz3TUp6moOfds=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TLEsi/aayRdAaQj0qWeiS8+LODNenOoJ/chJDrlhgaiFuBM5NI7eYi7fE10jQK19Mr7XoDL6+hCugduwIRR8VAx23ve8cvNs/M7k9ieC4sBUuonJfLp0hZWd/JL42McUWlD3z8fuHJNpXVGuQAHig0CnuL/hUQDxUF/srxRQoI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eSOPKI0x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 449M04T1014634;
	Thu, 9 May 2024 22:09:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=duuW4RPEH3OftDT3NUAKs6T19v0gBVzrmpREhIv0D1Y=; b=eS
	OPKI0xJbEG2v45oQ7va5DfqzXPveE9N9ZokpdZuY1122uprUGZW4xg9S5ceLPlow
	SiuoZMgogOnQ0ONj2+2SfLT99jtvC47/rOJqJ9UzMI8Cim98A+jXoj6nHOGUXE5F
	nZu5AGHDpNDDzZDNP6oSMYBPUpDcbJMoN6513791QcxDQFkV3vEcySAp8BRkQPk8
	WuWVNie1kc5DnH+g8RUOKeAzky1q0IAor8a4qzuxn+Y3FIRlp6lmJMj83/1E3gz8
	1LdyyRtKzTvteBSNvqvBlYGJCxC0uY/kDmCJDIuoUhjNh9l3E5bCGeO29zZ1+Qrd
	9MUSR2popFDzLbK/KUUQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w180gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 22:09:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 449M9235023015
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 22:09:02 GMT
Received: from [10.71.112.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 15:09:01 -0700
Message-ID: <96fe827b-e65f-570c-30de-1e51793f61a2@quicinc.com>
Date: Thu, 9 May 2024 15:09:01 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v21 38/39] ASoC: qcom: Populate SoC components string
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
 <20240507195116.9464-39-quic_wcheng@quicinc.com>
 <cb864ea4-95e3-4e99-920d-341188006291@linux.intel.com>
 <cdee0eb7-7fb7-f267-8203-7dfb0ea2d31d@quicinc.com>
 <92abca40-5eda-49d0-bc9d-eeb1a76e3461@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <92abca40-5eda-49d0-bc9d-eeb1a76e3461@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FIieVROshBWYeBTCKPjUthilHzKh18GX
X-Proofpoint-ORIG-GUID: FIieVROshBWYeBTCKPjUthilHzKh18GX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_12,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 mlxlogscore=712
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405090157

Hi Pierre,

On 5/9/2024 6:17 AM, Pierre-Louis Bossart wrote:
> 
> 
> On 5/8/24 15:06, Wesley Cheng wrote:
>> Hi Pierre,
>>
>> On 5/7/2024 2:40 PM, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 5/7/24 14:51, Wesley Cheng wrote:
>>>> For userspace to know about certain capabilities of the current platform
>>>> card, add tags to the components string that it can use to enable
>>>> support
>>>> for that audio path.  In case of USB offloading, the "usboffldplybk:
>>>> 1" tag
>>>
>>> usboffloadplayback?
>>>
>>> same question as before, do we need spaces?
>>>
>>
>> I think spaces are currently used as a delimiter, so I'll remove the
>> spaces.
>>
>>> And if we have controls, why do we need component strings? The component
>>> string is not dynamic to the best of my knowledge, this could be
>>> problematic if the card is no longer capable of supporting this stream,
>>> while a control can be updated at will.
>>>
>>
>> Maybe I misunderstood your comment here:
>>
>> https://lore.kernel.org/linux-usb/925d7c03-c288-49a4-8bcd-395b32810d75@linux.intel.com/
>>
>> At the time, I didn't include the kcontrols on the USB SND portion of
>> it, which was added after this series.  My interpretation was that there
>> were userspace entities that could query for general information about
>> what the card supports based on the components string, or sound card
>> name.  I treated this as an independent identifier, since the change to
>> add the offload capable jack was present.
> 
> My comment at the time stands: it's very hard to figure out that a
> random card supports USB and is connected to a given endpoint.
> 
> It'd be much easier as you wrote in the comments on patch 34 to have a
> control in the "regular" USB card to point to the 'better' offloaded
> path exposed by another card. Applications wouldn't need to know what
> this other card is, they would then use the card:device information
> directly.

OK, then it might be fine to remove the components tag if patch#34 is 
there.  That kcontrol is exposed as part of the sound card created for 
the USB device, so if applications queried, it would signify that there 
is an offload path available.

For this kcontrol, it will return the ASoC platform card index, would 
that be sufficient?

Thanks
Wesley Cheng

