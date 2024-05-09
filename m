Return-Path: <linux-arm-msm+bounces-19551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 734D58C0842
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 02:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 115851F21C7A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 00:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCAB36C;
	Thu,  9 May 2024 00:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P+wH3b3X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103BD161;
	Thu,  9 May 2024 00:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715213448; cv=none; b=D5NdQ6lZW+ut7pzI//csfAh5BDUWNaVTMouQ/+Hji1CQ0C9vytqD3lKv/tSmNutONkwawIhxz4ICjBuOecWYIz4DnESBY0VVki8YiYhebkom2iC6DhIybPvpNlOFy26BGMZHQH0/NJXTgC0IxlK8oq86X4DWI+KcyZbCr9iZ2TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715213448; c=relaxed/simple;
	bh=BdWZkVRFBwd5j7dvagqwUn9G8yFkaTmkpBF77B9I/5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rtmSDScImheJBmVQ4KAo/rh3FVd13hvxkaNnKt9CINVRV5I433dimYF8lmu6GWHuKX7j9T1oQZzJ05CiMO8uVeE+djMqWNPkZqGbIUJjIi4k1mCTGcUrpUt1omwOGESZM7VW49bBWxfjU5yOYJ0GZiQPXQWf/FCZe6MObJbyKmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P+wH3b3X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448AiMH6006648;
	Thu, 9 May 2024 00:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=htshQXf3BliWLR5L8SE0WGh0HqbVq2MlJwUSH8LeGNI=; b=P+
	wH3b3Xz915z04eBscjYYQwEI+L0syogWqlf/y7+1Ehl5DTUaP82g2X/IbVqqNCs3
	ILqlAEr3j34LHWVcC7t0X0yUSLVLp4msxkzZYp4XKWNw3CQDXyV4dlCeyVmAhO5Q
	R7hq7OjDZ4fN7IObJJQIWWFdUzd7LqAJTwz2aCYIyOmObr7+6D76KFMdFsmPS/Ew
	Sl4glbIKnu4WzlbzAFIxVJZRUKJiXB5FEcuwyt1kvaxWxT2sVabErr21tDm9Ddyw
	76RxKjYY5lmvHI9RgFnrnHZeXDAWkwxklM6T/8bkRC0jNolz8HyJvdu7+KBts1c9
	MhpqDr3GBvicJVscNngA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y07wfskmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 00:10:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4490ATSL013890
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 00:10:29 GMT
Received: from [10.110.126.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 17:10:28 -0700
Message-ID: <3390ef12-67dd-9474-21fb-b8df35fff546@quicinc.com>
Date: Wed, 8 May 2024 17:10:27 -0700
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
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <54b79b7b-49e6-418e-9a6b-11bcbada8398@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xdE5J8-zgxy1rkT7StC50OZu7jDuPNDP
X-Proofpoint-ORIG-GUID: xdE5J8-zgxy1rkT7StC50OZu7jDuPNDP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405090000

Hi Pierre,

On 5/7/2024 2:26 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 5/7/24 14:51, Wesley Cheng wrote:
>> Add SND kcontrol to SOC USB, which will allow for userpsace to determine
>> which USB card number and PCM device to offload.  This allows for userspace
>> to potentially tag an alternate path for a specific USB SND card and PCM
>> device.  Previously, control was absent, and the offload path would be
>> enabled on the last USB SND device which was connected.  This logic will
>> continue to be applicable if no mixer input is received for specific device
>> selection.
>>
>> An example to configure the offload device using tinymix:
>> tinymix -D 0 set 'USB Offload Playback Route Select' 1 0
>>
>> The above command will configure the offload path to utilize card#1 and PCM
>> stream#0.
> 
> I don't know how this is usable in practice. Using card indices is
> really hard to do, it depends on the order in which devices are
> plugged-in...

How are the existing mechanisms handling USB audio devices, or what is 
the identifier being used?

Thanks
Wesley Cheng

