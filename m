Return-Path: <linux-arm-msm+bounces-27752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C36119454CA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 01:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6F4DB214A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 23:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D3F14D42C;
	Thu,  1 Aug 2024 23:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IE8pL9G/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AEE1482E2;
	Thu,  1 Aug 2024 23:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722553886; cv=none; b=RMHFk0kun6fFCG8UTQ8xILSzaIal7PHTAasVDpT7JNAEZnM4Ei04RTc9QwnzYK/nkzSIWZwcQEJEFSvc3AmZMGAjFRCXijLwHrJV6OxBtMpb+IBAPCxm9rX52sIlTlYXoz+f3QhBelKK5Ssb0+ZHB1JmFDp9oIX3e8yvWh5W4Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722553886; c=relaxed/simple;
	bh=yi8KpVxNcIf5YHxoeXQGLtFB31e6KiwZl0CwWBdzZqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fX8Acj/PORniCTxO0j3w3kbwNL1kt7oy/+O0Q3XWg5d+DxJz5CZ8l31LNPhRAacHSIJnMpTgq6rCeN+1XBmLvfUcYf2RfSzgAb8yVM3f0DqfhH8cs3J+p6bB4SfTcdtsfWMTeu0hnqWamDTZP8ZwD0e/h+ffZY2HeTBDC2w2CO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IE8pL9G/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471LaAgY009955;
	Thu, 1 Aug 2024 23:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7sFS96b9Nrhzms9CFZDvZZzdzQm/xXxadPg2syXGPk=; b=IE8pL9G/F8tc8k68
	hsBudRVPhDpBI44vQhO5LH1vM8leRlpxiHLbpAIeTxPJBrD+1lTWE0ZSPGjPhOLg
	SWRBX5sTwIrd7EpARqfxFqdDDREOdxv0fiCjghL7D8PUa7CWqUdCK9h0+htn5cug
	K3y//UhRxy1XFLw55fgwQ4MwhHiPcAZKlj4XLuDxf8eLUWs9/AoxfuV35zndmOjN
	KxMGF6zB5Q7I+74+rbgcgt0Wn62ykr+m85vvTUQ2VfxAOVJlExQJ45np9lQtvPI4
	rDEczFDvPPqmdBexy7I2SmI+bU1cR1yYMB4ZaPcWvjJUSr/roqujFxWCo8zUS7wA
	pgdXJw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40rje204ra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 23:11:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 471NB0uA029525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 23:11:00 GMT
Received: from [10.71.115.74] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 16:11:00 -0700
Message-ID: <1a284449-204a-4d01-90c9-ec6b1ed56e30@quicinc.com>
Date: Thu, 1 Aug 2024 16:10:59 -0700
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
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <5f37c04d-f564-40b9-a9f3-d071ea0a6f19@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hQDGrD7cDUhEfYLSjo0qNE7E1pifnf-y
X-Proofpoint-ORIG-GUID: hQDGrD7cDUhEfYLSjo0qNE7E1pifnf-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_21,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010155

Hi Pierre,

On 8/1/2024 1:40 AM, Pierre-Louis Bossart wrote:
>
>
>> +static int q6usb_hw_params(struct snd_pcm_substream *substream,
>> +			   struct snd_pcm_hw_params *params,
>> +			   struct snd_soc_dai *dai)
>> +{
>> +	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
>> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>> +	struct q6afe_port *q6usb_afe;
>> +	struct snd_soc_usb_device *sdev;
>> +	int ret;
>> +
>> +	/* No active chip index */
>> +	if (list_empty(&data->devices))
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&data->mutex);
>> +	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
>> +
>> +	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
>> +	if (IS_ERR(q6usb_afe))
>> +		goto out;
>> +
>> +	/* Notify audio DSP about the devices being offloaded */
>> +	ret = afe_port_send_usb_dev_param(q6usb_afe, sdev->card_idx,
>> +						sdev->pcm_idx);
>> +
>> +out:
>> +	mutex_unlock(&data->mutex);
>> +
>> +	return ret;
>> +}
> Humm, multiple questions here
>
> a) is this intentional that the params are not used in a hw_params routine?
Think this was answered in patch#34.
> b) if yes, could this be replaced by a .prepare callback
>
> c) along the same lines as b), is suspend-resume during playback
> supported? Usually this is handled with a .prepare callback to restore
> connections.

I don't see us supporting that throughout any of the QC based DAI drivers, so this probably isn't implemented yet.  In terms of supporting system PM suspend for this USB offload path, we're going to explicitly stop the audio stream from the USB offload driver (qc_audio_offload) before we suspend the usb device. (refer to qc_usb_audio_offload_suspend())

Thanks

Wesley Cheng

>> +
>> +static const struct snd_soc_dai_ops q6usb_ops = {
>> +	.hw_params = q6usb_hw_params,
>> +};
>

