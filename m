Return-Path: <linux-arm-msm+bounces-27746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE30945431
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 23:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 850601F2393D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 21:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B59814AD3B;
	Thu,  1 Aug 2024 21:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iScD1N2T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C5519478;
	Thu,  1 Aug 2024 21:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722548650; cv=none; b=HRZLOIuEd0xd6S8L3nRt/hQK2+siyGTrFNjrBnr16Sm9C8tS3CrkxkbYmoqjVlaKBts9QwQRMHsP1neq74YgRBJh9B9ABxVuskHUeKSA/ddLZRnafcPgrBp2ljbRGH5l26Ke86eTZN0lUI2kaJ+zxaGMgLNaclC/SRlIbbb+7ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722548650; c=relaxed/simple;
	bh=rT3d2Z/qIlmnt+W7HtPuU/e8Cq65jWz1fSQ42lBAXjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OFtRXj+eFi4GWw7Nq9p26ZcvDC0KpPrEq8gyR4YPLhy3VYD73Kz/1z7EWpRmgGPbFE9G49+xP/9xxvDWYxG8BPuVMjRIv4nDqYprvoHEhTb5CDZCEOMgXxpZiVXnLm1h2v9HwicWk/nbikRrHWkfcLJQUPQujtcsXe0M2K5XmDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iScD1N2T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471LdMGq013149;
	Thu, 1 Aug 2024 21:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BX82SsFcwSGZlTYIkpFjHO9Gx5qKaee7nFQyUrj5jng=; b=iScD1N2T8zX3odgX
	Vqeo4RDlBnEkPT2hra6KMoHgT2W03XmNoWV18i9cMgNogYy8y6S4g2uEl1p7zeX4
	GPQ1pq4R+ev7+UrISNpVowrAYvs92hSOM/7X+qWiygGKKl87HqAwbhle6U9pDEV0
	xCDVNKzOyemrEpEpR4IUgI10SPY8BlGgazkmG5Gsow/2e3WFnM9FD9tMazi3ZqyS
	yT8ghpbjifVjgn7dSucXx1/zOKNvg2gtxuyNV16g0xH5Or0fv8ooqLz3HWqnP/lZ
	AESOz6oOB4Vkgv7z7KwrrKav56K826CQUIaHtgyM0tljCfkkPoEuU8lsq5tU/VS4
	iqXuiQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40rje6g0b7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 21:43:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 471Lh215031028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 21:43:02 GMT
Received: from [10.71.115.74] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 14:43:01 -0700
Message-ID: <f761530c-a49b-4dd5-b01c-97d08931e0ab@quicinc.com>
Date: Thu, 1 Aug 2024 14:43:00 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 09/34] ASoC: Add SOC USB APIs for adding an USB
 backend
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
 <20240801011730.4797-10-quic_wcheng@quicinc.com>
 <09fde4e6-c3be-484d-a7a5-bd653dc42094@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <09fde4e6-c3be-484d-a7a5-bd653dc42094@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CfWY8kppifJfoJ291RGWUqr5ddtbrbnw
X-Proofpoint-ORIG-GUID: CfWY8kppifJfoJ291RGWUqr5ddtbrbnw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_20,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010144

Hi Pierre,

On 8/1/2024 1:02 AM, Pierre-Louis Bossart wrote:
>
>
>> +/**
>> + * struct snd_soc_usb_device
>> + * @card_idx - sound card index associated with USB device
>> + * @pcm_idx - PCM device index associated with USB device
>> + * @chip_idx - USB sound chip array index
>> + * @num_playback - number of playback streams
>> + * @num_capture - number of capture streams
> so here we have a clear separation between playback and capture...

Thanks for the quick review of the series, I know that its a lot of work, so its much appreciated.

I guess in the past revisions there was some discussions that highlighted on the fact that, currently, in our QC USB offload implementation we're supporting playback only, and maybe it should be considered to also expand on the capture path.  I went ahead and added some sprinkles of that throughout the SOC USB layer, since its vendor agnostic, and some vendors may potentially have that type of support.  Is it safe to assume that this is the right thinking?  If so, I will go and review some of the spots that may need to consider both playback and capture paths ONLY for soc-usb. (as you highlighted one below)  Else, I can note an assumption somewhere that soc-usb supports playback only and add the capture path when implemented.

>> + * @list - list head for SoC USB devices
>> + **/
>> +struct snd_soc_usb_device {
>> +	int card_idx;
>> +	int pcm_idx;
>> +	int chip_idx;
>> +	int num_playback;
>> +	int num_capture;
>> +	struct list_head list;
>> +};
>> +
>> +/**
>> + * struct snd_soc_usb
>> + * @list - list head for SND SOC struct list
>> + * @component - reference to ASoC component
>> + * @num_supported_streams - number of supported concurrent sessions
> ... but here we don't. And it's not clear what the working 'sessions'
> means in the comment.
>
>> + * @connection_status_cb - callback to notify connection events
>> + * @priv_data - driver data
>> + **/
>> +struct snd_soc_usb {
>> +	struct list_head list;
>> +	struct snd_soc_component *component;
>> +	unsigned int num_supported_streams;
>> +	int (*connection_status_cb)(struct snd_soc_usb *usb,
>> +			struct snd_soc_usb_device *sdev, bool connected);
>> +	void *priv_data;
>> +};
>> +/**
>> + * snd_soc_usb_allocate_port() - allocate a SOC USB device
> USB port?
Noted, refer to the last comment.
>> + * @component: USB DPCM backend DAI component
>> + * @num_streams: number of offloading sessions supported
> same comment, is this direction-specific or not?
Depending on what you think about my first comment above, I'll also fix or remove the concept of direction entirely.
>> + * @data: private data
>> + *
>> + * Allocate and initialize a SOC USB device.  This will populate parameters that
>> + * are used in subsequent sequences.
>> + *
>> + */
>> +struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
>> +					      int num_streams, void *data)
>> +{
>> +	struct snd_soc_usb *usb;
>> +
>> +	usb = kzalloc(sizeof(*usb), GFP_KERNEL);
>> +	if (!usb)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	usb->component = component;
>> +	usb->priv_data = data;
>> +	usb->num_supported_streams = num_streams;
>> +
>> +	return usb;
>> +}
>> +EXPORT_SYMBOL_GPL(snd_soc_usb_allocate_port);
>> +
>> +/**
>> + * snd_soc_usb_free_port() - free a SOC USB device
>> + * @usb: allocated SOC USB device
>> +
>> + * Free and remove the SOC USB device from the available list of devices.
> Now I am lost again on the device:port relationship. I am sure you've
> explained this before but I forget things and the code isn't
> self-explanatory.
>
Ok, I think the problem is that I'm interchanging the port and device terminology, because from the USB perspective its one device connected to a USB port, so its a one-to-one relation.  Removing that mindset, I think the proper term here would still be "port," because in the end SOC USB is always only servicing a port.  If this is the case, do you have any objections using this terminology in the Q6AFE as well as ASoC?  I will use consistent wording throughout SOC USB if so.

Thanks

Wesley Cheng

>> + *
>> + */
>> +void snd_soc_usb_free_port(struct snd_soc_usb *usb)
>> +{
>> +	snd_soc_usb_remove_port(usb);
>> +	kfree(usb);
>> +}
>> +EXPORT_SYMBOL_GPL(snd_soc_usb_free_port);
>> +
>> +/**
>> + * snd_soc_usb_add_port() - Add a USB backend port
>> + * @usb: soc usb device to add
>> + *
>> + * Register a USB backend device to the SND USB SOC framework.  Memory is
>> + * allocated as part of the USB backend device.
>> + *
>> + */
>> +void snd_soc_usb_add_port(struct snd_soc_usb *usb)
>> +{
>> +	mutex_lock(&ctx_mutex);
>> +	list_add_tail(&usb->list, &usb_ctx_list);
>> +	mutex_unlock(&ctx_mutex);
>> +}
>> +EXPORT_SYMBOL_GPL(snd_soc_usb_add_port);
>> +
>> +/**
>> + * snd_soc_usb_remove_port() - Remove a USB backend port
>> + * @usb: soc usb device to remove
>> + *
>> + * Remove a USB backend device from USB SND SOC.  Memory is freed when USB
>> + * backend is removed.
>> + *
>> + */
>> +void snd_soc_usb_remove_port(struct snd_soc_usb *usb)
>> +{
>> +	struct snd_soc_usb *ctx, *tmp;
>> +
>> +	mutex_lock(&ctx_mutex);
>> +	list_for_each_entry_safe(ctx, tmp, &usb_ctx_list, list) {
>> +		if (ctx == usb) {
>> +			list_del(&ctx->list);
>> +			break;
>> +		}
>> +	}
>> +	mutex_unlock(&ctx_mutex);
>> +}
>> +EXPORT_SYMBOL_GPL(snd_soc_usb_remove_port);

