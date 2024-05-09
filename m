Return-Path: <linux-arm-msm+bounces-19552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D20A8C084F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 02:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D3EB1C21089
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 00:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A1410E9;
	Thu,  9 May 2024 00:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kWjqrcdd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC6436C;
	Thu,  9 May 2024 00:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715213639; cv=none; b=UEtE6brLHOztMh26n1CQipU0Wo5Rk9VQ6fYNCaXg6E0jeLQKPdnYBRGKf7fYDo+d8yvmE3FgyydYym6O0P81Ik56iRvFQnBnKBC8QRAu4UXWPx61d2v8mXujjxv3W4bP4ox6TMqlcctqaA3pYGGL7btw60ctidsEd6FMJzOwHYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715213639; c=relaxed/simple;
	bh=XEzh2rn2ODsLiWKQlzOInwm/aVuCxyWNxiDwhdI+Uzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ly203Fc4O0wShNIvcFsj1zY1RNlYXnYbsu2fVCYNBDd6T1kNItZ84OCodVRWgbRfEtUitv4B6IRjzij+pUxjxTsGOMeJKmoiSH9D1KgaplY4++q7JlqL8RcbMpApgevLsVfDvu1VYA2gtBWdaf1bKJZw9ZuR2yJsdMDHja5f5RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kWjqrcdd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448CVglG014162;
	Thu, 9 May 2024 00:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=AAXVD9XaJFUX5Wr81xhDQdaAYb5w7UDfisvH2/cYKY0=; b=kW
	jqrcdd9fuSjzWWHADFuJjfa3vwZ+V7UvEBsvScJi7Cz/s50h3OFpDyfTll7vl8Pu
	k39ALUUdVVNBzN7nwoJxZL64/PyiSc2zbzXag81dwTZ0iymoQcHR6GtDwBFLY1Ps
	vXP4nfqT19XZxLnJZBBKxC66yvNOIkuCOpxPSOYSqHjrlf3ZgmWOPtyXWVQV6j3t
	x+lpCsvVD2dwBHcvTw2ZvIHAVJhEIN1d/9z9QcZlokFdapuLk28m0RLMnZ0BbpGI
	/yZCspiHFnsI1ibupf6/eQ8C+FKTlJV5FvHsendivRwxuzxHL9MDhmA/ZfvEbWhx
	nPiFSGfoTkPLg2s9x3+A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y09fr9c80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 May 2024 00:13:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4490Dcbh020525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 May 2024 00:13:38 GMT
Received: from [10.110.126.205] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 May 2024
 17:13:37 -0700
Message-ID: <9d0ba8c8-9c8f-a45a-cf14-5d1829273cfa@quicinc.com>
Date: Wed, 8 May 2024 17:13:37 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v21 33/39] ASoC: usb: Fetch ASoC sound card information
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
 <20240507195116.9464-34-quic_wcheng@quicinc.com>
 <6fe8f489-d8a2-4951-96fa-875ac9b29d23@linux.intel.com>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <6fe8f489-d8a2-4951-96fa-875ac9b29d23@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kzMAdMNLzg3mhcRwkaYPQe_uL9MqPl7G
X-Proofpoint-GUID: kzMAdMNLzg3mhcRwkaYPQe_uL9MqPl7G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=643 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405090000

Hi Pierre,

On 5/7/2024 2:33 PM, Pierre-Louis Bossart wrote:
> 
>> +/**
>> + * snd_soc_usb_device_offload_available() - Fetch BE DAI link sound card
>> + * @dev: the device to find in SOC USB
>> + *
>> + * Finds the component linked to a specific SOC USB instance, and returns
>> + * the sound card number for the platform card supporting offloading.
>> + *
>> + */
>> +int snd_soc_usb_device_offload_available(struct device *dev)
>> +{
>> +	struct snd_soc_usb *ctx;
>> +
>> +	ctx = snd_soc_find_usb_ctx(dev);
>> +	if (!ctx)
>> +		return -ENODEV;
>> +
>> +	return ctx->component->card->snd_card->number;
>> +}
> 
> Presumably there's a notification to help applications discard this
> information on removal?

If the platform/ASoC sound card is removed then the USB BE DAI is going 
to be unregistered from SOC USB.  This would lead to the 
snd_soc_find_usb_ctx() to return with -ENODEV to the USB SND offload 
kcontrol call.

Thanks
Wesley Cheng

