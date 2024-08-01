Return-Path: <linux-arm-msm+bounces-27751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 652219454BA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2024 01:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96E431C2318D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 23:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AED114C58E;
	Thu,  1 Aug 2024 23:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BAhcWjGi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A2DD2F5;
	Thu,  1 Aug 2024 23:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722553567; cv=none; b=Gg3OSrhNQMn2lcyjoEPe4+B1D88KF43LfRmglBXFY7oZznaCOh9n/9GXzmFQcp/+SzXLfbSM3Q2uR7s6Coj18pycuKvgn4VagSt/JFZB4Obwt3tsic31gKZYbLHJiwTcsSnpwFw+lsIryGcpPa8tBZC9/7dvZ+bFrEjvsFohdQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722553567; c=relaxed/simple;
	bh=ak3vhaRaPvuBak6mFSbn6Qu0JJHuvtfQD9zL5dKNUrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k7whl8E1LdLWNKyD/1Nl2dQxoZkvjC/aTJXtxzsdrdYH2QAKfyaUuE62jq4Whtta3pkGfQzbR0a9+UbLo6Lmz8xq7Wa2yUuZsZwGclcHgYI3LOZhRgemHgh71kH75sFM1AWm0RxPQk6RflckDaF+KJVL1vjw4l1m8H2IL+xxjFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BAhcWjGi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471LaQel024509;
	Thu, 1 Aug 2024 23:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wPRpa9vXnCyfHy8/0d9HG7Kx5emVZ/QEaVrufYcbUmM=; b=BAhcWjGi3Rlb2amY
	H0SAfI2AjSh4nAFyfu/eGp00/VOpWkh3uMGTpAkM+BlvvYI3qgMNfJjyxl0hOjAI
	ZUCxCy6YUi6vJ48hpusPg+Nejem32p55oc+/X48zjtG2XhrFgoFvnPMracvOWrLj
	w0BQLIrbjXWkgUg2Rn6SDJZ4nVYBwIhVU89JqcioGLgfs5Nm+LdSgti5P3ZvtWTH
	w2f7MZmi84SUarao4FL8TXOj2EYpwvxVtstDBVLyVlQE6hlH+xaCS+4btJvMvmIL
	XyfFmG8Qf4HmktcjvQXW3aPkKtsuZwOQ2VszDww8BW1d/y5d1A1ZmlIPCtBZImXW
	3RR7Eg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40rje304hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 23:04:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 471N4xD6000474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 1 Aug 2024 23:04:59 GMT
Received: from [10.71.115.74] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 16:04:58 -0700
Message-ID: <bcf2c413-cb20-41eb-9993-db21c019b70d@quicinc.com>
Date: Thu, 1 Aug 2024 16:04:57 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 16/34] ASoC: qcom: qdsp6: q6afe: Increase APR timeout
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
 <20240801011730.4797-17-quic_wcheng@quicinc.com>
 <abc9f2b9-06c6-4df7-8db8-c2c6e8aaee59@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <abc9f2b9-06c6-4df7-8db8-c2c6e8aaee59@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vsFuRu9RjaKf9EAV2Td9JiFhAZTo_ENj
X-Proofpoint-ORIG-GUID: vsFuRu9RjaKf9EAV2Td9JiFhAZTo_ENj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_21,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408010153

Hi Pierre,

On 8/1/2024 1:33 AM, Pierre-Louis Bossart wrote:
>
> On 8/1/24 03:17, Wesley Cheng wrote:
>> For USB offloading situations, the AFE port start command will result in a
>> QMI handshake between the Q6DSP and the main processor.  Depending on if
>> the USB bus is suspended, this routine would require more time to complete,
>> as resuming the USB bus has some overhead associated with it.  Increase the
>> timeout to 3s to allow for sufficient time for the USB QMI stream enable
>> handshake to complete.
>>
>> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  sound/soc/qcom/qdsp6/q6afe.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
>> index 948007955934..452d7e8b9b30 100644
>> --- a/sound/soc/qcom/qdsp6/q6afe.c
>> +++ b/sound/soc/qcom/qdsp6/q6afe.c
>> @@ -366,7 +366,7 @@
>>  #define AFE_API_VERSION_SLOT_MAPPING_CONFIG	1
>>  #define AFE_API_VERSION_CODEC_DMA_CONFIG	1
>>  
>> -#define TIMEOUT_MS 1000
>> +#define TIMEOUT_MS 3000
> Surprising that 1s is not enough to resume a bus, and conversely is 3s
> enough then if the overhead is so significant?
> It looks like either too much or too little...

To clarify, if USB bus suspend isn't enabled, then this isn't an issue.  I just picked 3s since this is a worst case timeout value.  I don't think it will take longer than that to start an audio session, otherwise there is another inherent problem.  When I initially tested this, it may have been on a platform/chipset that wasn't running with optimized CPU settings, and might have been running slower overall.

Thanks

Wesley Cheng

>>  #define AFE_CMD_RESP_AVAIL	0
>>  #define AFE_CMD_RESP_NONE	1
>>  #define AFE_CLK_TOKEN		1024

