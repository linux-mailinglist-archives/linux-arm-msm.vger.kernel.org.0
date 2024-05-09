Return-Path: <linux-arm-msm+bounces-19623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E73F48C1964
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 00:33:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14F691C2193A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 22:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE19D811E6;
	Thu,  9 May 2024 22:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XNMlLlmi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1ED10A0D;
	Thu,  9 May 2024 22:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715293988; cv=none; b=RlvA+hrTtgvAZnHjt26N4cna1WEuIV42ZmnUJXGl1JtgcBfYA0wgOtl51b6Qn0BduuTpf8Wr3bJ+JMzAXFBCZgrqv8Ftfi3rkbq2ItXZ0DWwcymoecW0fxpo7TH09XRUg68SubWh0i/lBb7T0GnmGJG/oLrf62U5Z0l9irWWbqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715293988; c=relaxed/simple;
	bh=VF+AfiIJHoS/yHmfkDQfIFqvpwDp+YeyZaff7Z1NEIY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Kq3yh35izSafdgHZuE3yI4qy/uuV3wTRBj/zNZK8sADSlcWtQOY9TF0Rek1MXGiuHjOwF5Elf2KJzCkYSfK4GQSHaA/jx1cjkbIf3GkizfYvhtqsG2q7N8T4YoXhQCJQOqvT/FUsV/rYzDLEqLJkhWh+S5kBwNzUAL0c76MCk3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XNMlLlmi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 449MQLTH002289;
	Thu, 9 May 2024 22:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=lvV/C277I4DddRmj7GYxGQ4oTHE9NNGzDWC/trZCNVE=; b=XN
	MlLlmiZicXeidDDFFy1jBMrXn45Bfn2BQL2qK5xDlGW+xyQG+0EnH6sjVF/7mcjC
	UbyHlGx1jmlYgEsFlJN+MU6jUQPZwB5v34UOwPosCxNFPIZE+O05Fs9uvJBvmea/
	litW61f5g558hZgqAC1YOP2sH4WHmF+ee0oETkWIiTP791/FEmb725gRJb9rEdeB
	gTvszVtOplJS2dVDOoZExbFF7RZJGzqj4rvBikalcZqLMBLbitrpn/vb3TPvDKy8
	D6wxMlvFGsKA3fGuVb9F3FiiIsm8h8LMTpO3v/02K+8JL8kodexBAFqBCKcWhWX3
	mFsoh07K1TaIRJDeon0g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w0r1k3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 22:32:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 449MWhph004589
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 22:32:43 GMT
Received: from [10.71.112.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 15:32:43 -0700
Message-ID: <e98f0e53-b6b7-5ad6-fe09-2f2487929f61@quicinc.com>
Date: Thu, 9 May 2024 15:32:42 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v21 27/39] ASoC: Introduce SND kcontrols to select sound
 card and PCM device
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
 <20240507195116.9464-28-quic_wcheng@quicinc.com>
 <54b79b7b-49e6-418e-9a6b-11bcbada8398@linux.intel.com>
 <3390ef12-67dd-9474-21fb-b8df35fff546@quicinc.com>
 <f1368be7-fea5-450c-a61c-f289ba61f150@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <f1368be7-fea5-450c-a61c-f289ba61f150@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VDvEEdoZl6xGIFhQdqSSzOZACpjh-pEN
X-Proofpoint-ORIG-GUID: VDvEEdoZl6xGIFhQdqSSzOZACpjh-pEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_12,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405090159

Hi Pierre,

On 5/9/2024 6:07 AM, Pierre-Louis Bossart wrote:
> 
> 
> On 5/8/24 19:10, Wesley Cheng wrote:
>> Hi Pierre,
>>
>> On 5/7/2024 2:26 PM, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 5/7/24 14:51, Wesley Cheng wrote:
>>>> Add SND kcontrol to SOC USB, which will allow for userpsace to determine
>>>> which USB card number and PCM device to offload.  This allows for
>>>> userspace
>>>> to potentially tag an alternate path for a specific USB SND card and PCM
>>>> device.  Previously, control was absent, and the offload path would be
>>>> enabled on the last USB SND device which was connected.  This logic will
>>>> continue to be applicable if no mixer input is received for specific
>>>> device
>>>> selection.
>>>>
>>>> An example to configure the offload device using tinymix:
>>>> tinymix -D 0 set 'USB Offload Playback Route Select' 1 0
>>>>
>>>> The above command will configure the offload path to utilize card#1
>>>> and PCM
>>>> stream#0.
>>>
>>> I don't know how this is usable in practice. Using card indices is
>>> really hard to do, it depends on the order in which devices are
>>> plugged-in...
>>
>> How are the existing mechanisms handling USB audio devices, or what is
>> the identifier being used?
> 
> Well it's a mess, that's why I asked.
> 
> There are configuration work-arounds to make sure that 'local'
> accessories are handled first and get repeatable card indices.
> 

So is the intention of the configuration aspect you're thinking of to 
have an entry that maps a USB device based on some identifier, which 
will take the offload path by default?

IMO, the concept of this selection of card and PCM device should happen 
after the application discovers a USB device that is offload capable. 
For example, maybe the application will use the USB VID/PID to lookup an 
entry within the configuration.  If some offload tag is present, it can 
further determine which card and PCM devices are associated w/ the USB 
device?  Although this is under the assumption the application has 
insight to the USB sysfs.

> But between USB devices I guess the rule is 'anything goes'. Even if
> there are two devices connected at boot, the index allocation will
> depend on probe order. The card names are not necessarily super-useful
> either, i.e. yesterday I was confused by an USB card named "CODEC"
> without any details.

That device is very informative :D

Thanks
Wesley Cheng

