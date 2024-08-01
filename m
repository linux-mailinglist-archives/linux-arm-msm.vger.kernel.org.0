Return-Path: <linux-arm-msm+bounces-27750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D19119454A4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 00:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63DE61F22FFA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 22:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF7D14C583;
	Thu,  1 Aug 2024 22:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FikCMHh8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1CA1D696;
	Thu,  1 Aug 2024 22:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722552424; cv=none; b=dbY0eBEypx6RbsREdtEBcbhCf/HvDfLAOGnrYu9yaeCmeEWncaD/sVVdEfFQ7ECBzaSmP+vd1xpF66XF7H5clubNXZilTAi5MUMO/Yd+rG6phk1YiFlhAti2eCRpF0UR7HqY5/1V13FL5BHuhK8TA4h0FzDeBf8SjqH0oeqm/n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722552424; c=relaxed/simple;
	bh=P5RJ17VgQD0rdb4AfmznFgpea6IRvLK99WnRa6bhJ2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XuYcUVTFzJK3lB3qMTg501mK2GzY4iA8Dw2qUnngU3TJmaJJ2wL88nV7gCbJSal4/rGmsfjfNuv8De5fUSQknQ6tRtVLTt/2pQHYITCQAkcLk3yEzOISFKgVIv0ggyEpdD2kOflu0+pqziN7VKBhse3UtBxiAcXG1la089ovQos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FikCMHh8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471LaX94010680;
	Thu, 1 Aug 2024 22:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U/RaJSkJnNgRqrgFrn1075hon6xNaTxYlhP/ArQi0uw=; b=FikCMHh87P5CNiGK
	RdRMcXoJFyLWlMt1Gv/enQ01wG0VYbDyTKFRRA67Okx5Z8jm/rpoJJhiYskBiafS
	ldu77Juh+ExaIa5GgAAc0txH608vUNNNZ4q7LGSms2FJbK3u/V6xjYUNbSoOkzok
	P7j/03bz7tdMQ9EFBJ3X9+8J/9R6bQRd+TvF48fCWkd/RLWXrnUggjU+hZE3BmDG
	Uwq7DiHCJje8MJjsFshOZ8BM3l0Uq/2bMQMbabuggs1RM5MtCH+NF9v8BTUfE+Hj
	m93UPP7yY08oKvrzn9HgTTwImYcXKuXr3QdEVB3Rj8k9mL5d+Joo3XPLwnwdqS0k
	0aYHpQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40rje203mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 22:46:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 471MkZfG010067
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 22:46:35 GMT
Received: from [10.71.115.74] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 15:46:34 -0700
Message-ID: <8c9eb02d-3669-4e29-b83a-db2c3b15497a@quicinc.com>
Date: Thu, 1 Aug 2024 15:46:33 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 11/34] ASoC: usb: Fetch ASoC card and pcm device
 information
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
 <20240801011730.4797-12-quic_wcheng@quicinc.com>
 <63c20e7a-f62a-4b6c-8ea1-1608e06e5b58@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <63c20e7a-f62a-4b6c-8ea1-1608e06e5b58@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jBBediAo-Fr_q5pP4S3n5Jai6JCZJ4rO
X-Proofpoint-ORIG-GUID: jBBediAo-Fr_q5pP4S3n5Jai6JCZJ4rO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_21,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=950 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010152

Hi Pierre,

On 8/1/2024 1:11 AM, Pierre-Louis Bossart wrote:
>
> On 8/1/24 03:17, Wesley Cheng wrote:
>> USB SND needs to know how the USB offload path is being routed.  This would
>> allow for applications to open the corresponding sound card and pcm device
>> when it wants to take the audio offload path.  This callback should return
>> the mapped indexes based on the USB SND device information.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  include/sound/soc-usb.h | 16 ++++++++++++++++
>>  sound/soc/soc-usb.c     | 28 ++++++++++++++++++++++++++++
>>  2 files changed, 44 insertions(+)
>>
>> diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
>> index d6b576f971ae..a167e3de0a78 100644
>> --- a/include/sound/soc-usb.h
>> +++ b/include/sound/soc-usb.h
>> @@ -8,6 +8,11 @@
>>  
>>  #include <sound/soc.h>
>>  
>> +enum snd_soc_usb_kctl {
>> +	SND_SOC_USB_KCTL_CARD_ROUTE,
>> +	SND_SOC_USB_KCTL_PCM_ROUTE,
>> +};
>> +
>>  /**
>>   * struct snd_soc_usb_device
>>   * @card_idx - sound card index associated with USB device
>> @@ -32,6 +37,7 @@ struct snd_soc_usb_device {
>>   * @component - reference to ASoC component
>>   * @num_supported_streams - number of supported concurrent sessions
>>   * @connection_status_cb - callback to notify connection events
>> + * @get_offload_dev - callback to fetch mapped ASoC device
>>   * @priv_data - driver data
>>   **/
>>  struct snd_soc_usb {
>> @@ -40,6 +46,8 @@ struct snd_soc_usb {
>>  	unsigned int num_supported_streams;
>>  	int (*connection_status_cb)(struct snd_soc_usb *usb,
>>  			struct snd_soc_usb_device *sdev, bool connected);
>> +	int (*get_offload_dev)(struct snd_soc_component *component,
>> +				int card, int pcm, enum snd_soc_usb_kctl route);
>>  	void *priv_data;
>>  };
>>  
>> @@ -51,6 +59,8 @@ void *snd_soc_usb_find_priv_data(struct device *dev);
>>  int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>>  					struct snd_soc_jack *jack);
>>  int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component);
>> +int soc_usb_get_offload_device(struct device *dev, int card, int pcm,
>> +				enum snd_soc_usb_kctl route);
>>  
>>  struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
>>  					      int num_streams, void *data);
>> @@ -86,6 +96,12 @@ static inline int snd_soc_usb_disable_offload_jack(struct snd_soc_component *com
>>  	return -ENODEV;
>>  }
>>  
>> +static int soc_usb_get_offload_device(struct device *dev, int card, int pcm,
>> +					enum snd_soc_usb_kctl route)
>> +{
>> +	return -ENODEV;
>> +}
>> +
>>  static inline struct snd_soc_usb *snd_soc_usb_allocate_port(
>>  					      struct snd_soc_component *component,
>>  					      int num_streams, void *data)
>> diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
>> index fe2a75a28af4..3c217ac67c57 100644
>> --- a/sound/soc/soc-usb.c
>> +++ b/sound/soc/soc-usb.c
>> @@ -117,6 +117,34 @@ int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
>>  }
>>  EXPORT_SYMBOL_GPL(snd_soc_usb_disable_offload_jack);
>>  
>> +/**
>> + * soc_usb_get_offload_device - Set active USB offload path
> get or set?
Sorry, get.
>
>> + * @dev - USB device to get offload status
>> + * @card - USB card index
>> + * @pcm - USB PCM device index
>> + *> + * Fetch the current status for the USB SND card and PCM device
> indexes
Done.
>> + * specified.
> the function returns an integer, how does this return the 'mapped indices"?
Will assume that based on your comments on patch#19, you were able to see what this does.  Will respond accordingly on patch#19, so we don't lose track of things.
>> + */
>> +int soc_usb_get_offload_device(struct device *dev, int card, int pcm,
>> +				enum snd_soc_usb_kctl route)
> missing route in kernel doc.

Will add.

Thanks

Wesley Cheng

>> +{
>> +	struct snd_soc_usb *ctx;
>> +	int ret;
>> +
>> +	ctx = snd_soc_find_usb_ctx(dev);
>> +	if (!ctx)
>> +		return -ENODEV;
>> +
>> +	mutex_lock(&ctx_mutex);
>> +	if (ctx && ctx->get_offload_dev)
>> +		ret = ctx->get_offload_dev(ctx->component, card, pcm, route);
>> +	mutex_unlock(&ctx_mutex);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(soc_usb_get_offload_device);
>> +
>>  /**
>>   * snd_soc_usb_find_priv_data() - Retrieve private data stored
>>   * @dev: device reference

