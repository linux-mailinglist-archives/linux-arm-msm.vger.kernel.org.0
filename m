Return-Path: <linux-arm-msm+bounces-19550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 793248C082A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 01:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7E34B21265
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 23:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476B9134430;
	Wed,  8 May 2024 23:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nX+4tGye"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DC2134400;
	Wed,  8 May 2024 23:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715212707; cv=none; b=fjvPvIBpIoZ+jU767bBC17I7Dje9YBzasaLtJJkmYCyvYkvUeGpBxVocokUyMopbkhXq13oYyPkk0aQphRz70Rch3XrGHkS4KDBFbvUUPA8mtvh/UIZhRrOKuE78xjHw5DKBodHpcuphw21UaJcFHzojH/vX36GVgstxxjL7Uq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715212707; c=relaxed/simple;
	bh=4Wjxj61Jp2LBSuj8M1KVtj73VLCOyTwRD+dyeKgp+3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WNuCV5wVzXgNKzA1atrGLBUjuOQkmi9NxXQNP434sxmBaJry4ZqqvCPubNDka7R0qNJ5OroyCn+CxUMirJSTnH0YZ3gFtbdOlOsK3mGHwhS+BDk7ZBJw1Iuiw4m+iaw70ltQ4wi6c+5c5L6sC7FgrIkL1swrrc+WENKc6bV1oyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nX+4tGye; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448NXjeq006689;
	Wed, 8 May 2024 23:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=0xmfbdvtMH9kyFWsvN05oirZzF4tHdtu/rYfP3YurB0=; b=nX
	+4tGye2HSa5bsGyJ0lXvL+Fr1AzeAfVahWCq/u17HbLyGkNXTQ2usjoHlltE9lX+
	rLqsadiA3wFwl3qlcdba7FJqazBKjL6D914UkHYIuDPEj6UdpVpp/EXPGJu6XFqj
	Y6ypiJnb4hYpxLeH4y3btalLjdVLF6IZyaACGIhwALLMxZxw9uTECWFBYB+tP1vO
	3MHS09nCIbKPjW+aPbujU7/JEQWBVKIIXWgmwP+0KsjSCCHPVi8hekjQJ+yjKACv
	7lPPGJ5dMUeFZF02i1NNkZOkq19NSp3+OUC/g5O70RsYitFjyG/JpgqOsGQGsZOe
	6vun3TeB8jN+EQEgUDgQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y07wfsk2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 23:58:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448Nw0VL012920
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 23:58:00 GMT
Received: from [10.110.126.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 16:57:59 -0700
Message-ID: <b1f8b531-6041-ec11-5932-13bf17b69d0b@quicinc.com>
Date: Wed, 8 May 2024 16:57:59 -0700
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
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <875b643f-af2c-4a1b-87e8-80cd6f236dea@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xPJCVTmBpuP3jrr2Pp7u4kqcVH9sEP4W
X-Proofpoint-ORIG-GUID: xPJCVTmBpuP3jrr2Pp7u4kqcVH9sEP4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 malwarescore=0 mlxlogscore=877
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080179

Hi Pierre,

On 5/7/2024 2:23 PM, Pierre-Louis Bossart wrote:
> 
>> @@ -113,6 +120,12 @@ static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb,
>>   	if (connected) {
>>   		/* We only track the latest USB headset plugged in */
>>   		data->active_usb_chip_idx = sdev->card_idx;
>> +
>> +		set_bit(sdev->card_idx, &data->available_card_slot);
>> +		data->status[sdev->card_idx].sdev = sdev;
> 
> Not following the 'only track the latest USB headset plugged in', I
> don't see anything that discard the previously latest headset...
> 
> If you plug headset1, then headset2, how is headset1 marked as not
> available for USB offload?
> 

It won't mark headset1 as not available for offload, because offload 
could happen on either depending on what is selected (from the kcontrol 
as well).

Thanks
Wesley Cheng

