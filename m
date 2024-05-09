Return-Path: <linux-arm-msm+bounces-19618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DC68C186E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 23:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A80DD1C218D9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 21:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41C2126F2F;
	Thu,  9 May 2024 21:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LI9r2ZDo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D7385C5E;
	Thu,  9 May 2024 21:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715290473; cv=none; b=SZ6Mb/ttoZ/zOvt4iralrrWEYq5+KgJKph0cDRcVKwGUziD1tSmeFTVuJKCWbZ8QIoI7cz/ucnk4xnWJarPaOycyTTeUl43/hoHpOpFvIlcwAnYlH7pxUQKs6vFi8G8+C5WhaWKdLQl9shsLzg+RLYv7RvzABymzBN7c6M7/DrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715290473; c=relaxed/simple;
	bh=DMClA2EG4om7tUuZOout4+5pUV7yCTXmqNhHE4600xM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=csa6fCgUv9fF8ZEjNxY/qcefXwrQnJ4KZlrBrqDh5GI6doF+u+ULFrEPDoexDfaX/K4lbBSMairkAwBvtYJAO9CyCiBeivwzsja4YvWRGKl6N9hFxE39I3Pk1QRexoPpMYmc2rIL7NoCrxgdaJ/vRwNBPzCnYaepsPFgMMMJDOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LI9r2ZDo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 449KtB8X012405;
	Thu, 9 May 2024 21:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=cIukUmTAz21I3U9U4WGeVwO7Ge0VeW/gUAEvuX3Cztc=; b=LI
	9r2ZDod4f1CfRw0lzzeck32b+xIyPiWNzUzL70jaE0GWi79OrRqe7hiTMCQnshjR
	M+YlIEWTxolltwsRLJ54IH3eQAVAfx6gcOgoYnTbqddSIGXfr4qbfsg6nT68hFqO
	QD+/f7xVKlSdtjj19rpQSd71bm2wPqoPodM2bvcyFL0IrobV0qXFffIAnj3Ryx4J
	JkuENjg/HdYm0UBiz4/P7WlHIMudK0ofQWhMMPONf+EumzP5KCSW7HoT6VWYJtZN
	zWuTKpTSAZ6kshg6Mmp5jHEUYmxIwgY55lQPpGltrPb6wjXOMB58KgHKcBKe7MS2
	WRXOLrTOkp1Gwm7T7XUw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y09f5unjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 21:34:07 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 449LY6PO000667
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 21:34:06 GMT
Received: from [10.71.112.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 14:34:05 -0700
Message-ID: <d0c1e6a8-3caa-3530-d49a-a8b820d19cf1@quicinc.com>
Date: Thu, 9 May 2024 14:34:01 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v21 09/39] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
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
 <20240507195116.9464-10-quic_wcheng@quicinc.com>
 <9bd1ec72-71ea-4a1c-b795-af6e7687ca07@linux.intel.com>
 <0a4d7c2b-ac7d-7bd4-f97e-db60944a1d39@quicinc.com>
 <726e7006-30b4-4525-84c8-4fb2ef380994@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <726e7006-30b4-4525-84c8-4fb2ef380994@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ElA1DleWGwoZYGAQNwZNxyKuF9wVF_HB
X-Proofpoint-ORIG-GUID: ElA1DleWGwoZYGAQNwZNxyKuF9wVF_HB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-09_12,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=576 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405090152

Hi Pierre,

On 5/9/2024 5:54 AM, Pierre-Louis Bossart wrote:
> 
> 
> 
>>> Wait, is this saying you will have exactly one PCM device/FE DAI
>>> connected to the USB BE DAI exposed in patch 11?
>>>
>>>> +    SND_SOC_DAPM_MIXER("USB Mixer", SND_SOC_NOPM, 0, 0,
>>>> +               usb_mixer_controls,
>>>> +               ARRAY_SIZE(usb_mixer_controls)),
>>>> +
>>>
>>> And then what is the role of the USB mixer if you only have one input?
>>>
>>> I must be missing something.
>>>
>>
>> Not sure if this is a QCOM specific implementation, but the way the DT
>> is defined for the USB offload path is as follows:
>>
>>      usb-dai-link {
>>          link-name = "USB Playback";
>>
>>          cpu {
>>              sound-dai = <&q6afedai USB_RX>;
>>          };
>>
>>          codec {
>>              sound-dai = <&usbdai USB_RX>;
>>          };
>>
>>          platform {
>>              sound-dai = <&q6routing>;
>>          };
>>      };
>>
>> Based on our DT parser helper API (qcom_snd_parse_of()) this isn't going
>> to create a PCM device.  The PCM devices are created for nodes that
>> don't have a codec and platform defined:
>>
>>      mm1-dai-link {
>>          link-name = "MultiMedia1";
>>          cpu {
>>              sound-dai = <&q6asmdai      MSM_FRONTEND_DAI_MULTIMEDIA1>;
>>          };
>>      };
>>
>> The ASM path is the entity that defines the number of PCM devices that
>> is created for the QC ASoC platform card, and is where the actual PCM
>> data is sent over to the DSP.  So there could be several PCM devices
>> that can use the USB BE DAI.
> 
> ok, but then how would this work with the ALSA controls reporting which
> PCM device can be used? I didn't see a mechanism allowing for more than
> one offloaded device, IIRC the control reported just ONE PCM device number.

With respects to the PCM devices exposed by the ASoC card, the USB Mixer 
controls which "Multimedia" (ASM) path can be routed to the USB BE DAI.

The kcontrols you are mentioning are controlling which USB card and USB 
PCM device to execute the offloading on.  As of now, at least for the 
QCOM implementation, we support only offloading on one path/USB 
interface.  I can't comment on how other offloading solutions look like, 
but we pass the USB PCM and card index as part of our AFE port open 
command (done from USB BE DAI).  This will result in a USB QMI message 
back (from ADSP) to our USB SND offload driver, which carries all the 
information about the selected card and PCM index to execute offloading on.

One thing I can do is to actually make the kcontrols for selecting the 
PCM and card devices to look at the num_supported_streams.  This would 
at least allow for vendors that have support for more potential 
offloading streams to select more than one.

Thanks
Wesley Cheng

