Return-Path: <linux-arm-msm+bounces-28118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C85D94B0E0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 22:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D43BC1F238EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 20:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B43E1448E7;
	Wed,  7 Aug 2024 20:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gl8WZrpf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6072E82499;
	Wed,  7 Aug 2024 20:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723061167; cv=none; b=NV7EWT9RmnrDL7T3rhUI99mmEM3Nyc/9pzlU3zXSfgwZPKrgbQAGZZeqWQr04Bl27bb0C7yNU94McgxlssWF98+t8YWOKXpDXrUJ53nFRrByhATLxKXIQbDEG89HWb5f7WKMQU0k9S2IhGD2/Ds83xYFNlzOfgVIzBDA5dzs4mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723061167; c=relaxed/simple;
	bh=tP5PZPiSOfnHtE2NF+/nff/1qVnyTM8U4pN2u4dY22w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=a7ClPsAsJ9oGRm6mS1kW2SzmhgS8rJiJPz3NhSy9Ow15ETrJcFOvhURTvwmSPN64fzFvEFBkWglDz/bEOuNU/vu16Q0ZXhXstXEOIGoQCnncP5MXj5EnnndQfhNgw4HKUrIbRmWe3Msjl8Dy4qIcSYEr0qTj+o8Xy7waawHZOdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gl8WZrpf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 477I2CCO016435;
	Wed, 7 Aug 2024 20:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BBQkqFMaehnNVf00RomtVqmkJg9WcgOkBeKwzL5TMP8=; b=Gl8WZrpfsq2WndmI
	vq8ltohYyFRNsQAOOipCQh8AY3CKAU9orOFIjFKQy0/IwVK7qM++/1CFtBXWhRkI
	+v8nzim8SsXu4MoDcH9kmgQ54yZ5v3ZrEibnkVVkI/+dehSKb/M98CvR18kk/0c5
	HAj4B3v//ASNN1SES+XeGFR8sCMlhTu/fnsA2f5gHf5rAlgyl7cicSCOuqwA7sT9
	oQ6yhVzdNyuAvwwlkLhqIQQC30k3WTXxL7nDr1OGyLaRs2Gxf3uqCx74qk3bqV6E
	WbRtyPWvTvpZVUiBLhiBpS7XlswmpzGCJYPeVPdb9SKtenkhVelHRA6OpbxJ55bQ
	DmgG7g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vdupg851-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 20:05:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 477K5akV014973
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 20:05:36 GMT
Received: from [10.71.113.127] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 13:05:35 -0700
Message-ID: <09aa3611-42bb-413a-b5a6-6d08045e5c00@quicinc.com>
Date: Wed, 7 Aug 2024 13:05:35 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 17/34] ASoC: qcom: qdsp6: Add USB backend ASoC driver
 for Q6
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <bgoswami@quicinc.com>, <tiwai@suse.com>,
        <gregkh@linuxfoundation.org>, <robh@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <alsa-devel@alsa-project.org>
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-18-quic_wcheng@quicinc.com>
 <5f37c04d-f564-40b9-a9f3-d071ea0a6f19@linux.intel.com>
 <1a284449-204a-4d01-90c9-ec6b1ed56e30@quicinc.com>
 <1a2d0962-405d-4ccf-a0da-00a624c0f3e8@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <1a2d0962-405d-4ccf-a0da-00a624c0f3e8@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mjrcji4RzpWV_B4Ua1x-VexTrXY01KX0
X-Proofpoint-GUID: mjrcji4RzpWV_B4Ua1x-VexTrXY01KX0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_11,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408070141

Hi Pierre,

On 8/1/2024 11:32 PM, Pierre-Louis Bossart wrote:
>
> On 8/2/24 01:10, Wesley Cheng wrote:
>> Hi Pierre,
>>
>> On 8/1/2024 1:40 AM, Pierre-Louis Bossart wrote:
>>>
>>>> +static int q6usb_hw_params(struct snd_pcm_substream *substream,
>>>> +			   struct snd_pcm_hw_params *params,
>>>> +			   struct snd_soc_dai *dai)
>>>> +{
>>>> +	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
>>>> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>>>> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>>>> +	struct q6afe_port *q6usb_afe;
>>>> +	struct snd_soc_usb_device *sdev;
>>>> +	int ret;
>>>> +
>>>> +	/* No active chip index */
>>>> +	if (list_empty(&data->devices))
>>>> +		return -EINVAL;
>>>> +
>>>> +	mutex_lock(&data->mutex);
>>>> +	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
>>>> +
>>>> +	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
>>>> +	if (IS_ERR(q6usb_afe))
>>>> +		goto out;
>>>> +
>>>> +	/* Notify audio DSP about the devices being offloaded */
>>>> +	ret = afe_port_send_usb_dev_param(q6usb_afe, sdev->card_idx,
>>>> +						sdev->pcm_idx);
>>>> +
>>>> +out:
>>>> +	mutex_unlock(&data->mutex);
>>>> +
>>>> +	return ret;
>>>> +}
>>> Humm, multiple questions here
>>>
>>> a) is this intentional that the params are not used in a hw_params routine?
>> Think this was answered in patch#34.
> yes, but that really begs the question if the format check shouldn't be
> added here.

Sure, I'm not against squashing the format check to this patch.

Thanks

Wesley Cheng

>>> b) if yes, could this be replaced by a .prepare callback
>>>
>>> c) along the same lines as b), is suspend-resume during playback
>>> supported? Usually this is handled with a .prepare callback to restore
>>> connections.
>> I don't see us supporting that throughout any of the QC based DAI drivers, so this probably isn't implemented yet.  In terms of supporting system PM suspend for this USB offload path, we're going to explicitly stop the audio stream from the USB offload driver (qc_audio_offload) before we suspend the usb device. (refer to qc_usb_audio_offload_suspend()
> The system suspend-resume during playback is not enabled in all
> platforms indeed, it mostly depends on what userspace does. IIRC this is
> required for Chrome/CRAS and it's supported by aplay.

