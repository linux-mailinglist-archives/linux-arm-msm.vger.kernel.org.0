Return-Path: <linux-arm-msm+bounces-19530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 157C58C056C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 22:17:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC5B81F22D4C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 20:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF6D130AF2;
	Wed,  8 May 2024 20:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="G3CeZyZ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A969A130A63;
	Wed,  8 May 2024 20:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715199422; cv=none; b=ajGpBYv1o62XaWDvovitHCvJ08ZeT8dVioa1lH2u8qcTRMFNGfCCLK3Lr6jFdHFepPWPpI6FCMthHwDkDNBucR53I0TfnMd98lixzpEMc0nCttIPXAO7+eWwDqqc+iTQjKslZ7AkoqDkhacpKLXV5z9gkEfdMNIScmuXiQvkrIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715199422; c=relaxed/simple;
	bh=U09Rnr9ntnBO7MwvNoJCHqyP9+H/89CU40V7dG6FWYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dT+VK+sWJvRGD0GJo9mY4tL0TN2L6YPen4AICLvg7hFWcrMw8AOVqwMHkM0My3skr/qKyGCL6XThUbHkOFoucdklrO4OOmsWuIAxVR7C/etilZq5PJv4kkCCnOP3FbSW/3G2e0jEatTe2K51Tn5ZSDMuCiQpD3BAk7BmtsXffWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=G3CeZyZ4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448Ae8bk004926;
	Wed, 8 May 2024 20:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=/h/CzWxCJAWdECYePSx/kcEaFq6W4rE/eXk8NJV+0HY=; b=G3
	CeZyZ4ePRk73R5cwnSmeBM0urCxyVcmWeyXqhE8ksxx8PFJfRosXjZCP+ZyMToPN
	uNqBaQVN5NKDYn1Dfoxe6mKwRQYhcJit7YwGf0fDPpfUVCAEWutXU2pYwv7fXVo1
	GCpYVr/RvAJv72ihoMCpzkzPYc62Z9OHZMoQafRrIv/K40lutuUFCvNN5Ek8cuoW
	jbTh2fT7eTfHETpiR0Ubw7N9LetZy5ZU4w1/Lnm3GrS9UO13cuTMDMyC+h+5e6uL
	PwiYxnkOw4+sNSb2BUjPYJazkYjT1xstgNZFALufEONUoZ5sWvfiemtT0iKE8l3w
	OfadCVyIIsNml6LKrMVQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y07u999yg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 20:16:40 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448KGdbW007663
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 20:16:39 GMT
Received: from [10.110.126.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 13:16:38 -0700
Message-ID: <106711dc-0250-4d07-254d-2829f89e0a5d@quicinc.com>
Date: Wed, 8 May 2024 13:16:38 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v21 07/39] ASoC: Add SOC USB APIs for adding an USB
 backend
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
 <20240507195116.9464-8-quic_wcheng@quicinc.com>
 <507953f7-c4da-499b-bcd7-76be0e04b766@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <507953f7-c4da-499b-bcd7-76be0e04b766@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RJxVdkI85z4HvNEsdpbVz7wQbcrOhP3J
X-Proofpoint-ORIG-GUID: RJxVdkI85z4HvNEsdpbVz7wQbcrOhP3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080149

Hi Pierre,

On 5/7/2024 1:26 PM, Pierre-Louis Bossart wrote:
> 
>> +const char *snd_soc_usb_get_components_tag(bool playback)
>> +{
>> +	if (playback)
>> +		return "usbplaybackoffload: 1";
>> +	else
>> +		return "usbcaptureoffload : 1";
> 
> why are there different spaces and do we need spaces in the first place?
> 

Will remove these spaces once we clarify if this is still needed.

>> +int snd_soc_usb_add_port(struct snd_soc_usb *usb)
>> +{
>> +	mutex_lock(&ctx_mutex);
>> +	list_add_tail(&usb->list, &usb_ctx_list);
>> +	mutex_unlock(&ctx_mutex);
>> +
>> +	return 0;
> 
> make the function return void?
> 

Ack.

>> +int snd_soc_usb_remove_port(struct snd_soc_usb *usb)
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
>> +
>> +	return 0;
> 
> make this return void?
> 
> 

Ack.

Thanks
Wesley Cheng

