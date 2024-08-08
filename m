Return-Path: <linux-arm-msm+bounces-28129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC8394B45F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 03:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBA471C21620
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 01:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4284720ED;
	Thu,  8 Aug 2024 01:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U5Im2512"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4415420E6;
	Thu,  8 Aug 2024 01:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723079036; cv=none; b=b3Kjez8RuCvPtzP+rl4LJ9yWO8Gk84xKOnJwJ/uEevHkQXcCMjvky1cd6EQzPHo/5retAfLxmvysVQ8440VQRoBuHniqZU/BtItmBUGGkzZ1xVs2PgcTOPkiVHtsD97PvcBU4lQNYixvoBEkqexl+1aSSVqqIMv78Z8By0XyHws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723079036; c=relaxed/simple;
	bh=E4NjcBtFoKMULPq+m54nVSONliuUrMPReoZj/ltGKeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pXXgTP+OofoAOXuHmkgAniEOz6v184LS2uVw+7be+nAfFSCc3WIimH405bMrOPzeo5SsHFcvxdWQuOeBUd7gID0Q7zoWYe1mXZQS9amu83U1t8v5HwFg3jhO6baWgKnlulLciDlWGcPVfK8/Z9pSdPGt/a2kEWc67tvhHlz2ySU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U5Im2512; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 477ID6VU012239;
	Thu, 8 Aug 2024 01:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BiWDQGebIC+nZsacslE5RFhdstOKp1m7YUU31Ktsm98=; b=U5Im2512oxh0t/mX
	m8ehDNj6pUvuH8BFFmSwYVf1M0ANJ2YAHuq98irB1tU4X944g5TH3AQsMWnAz/lo
	jm09QErp62sCd27weApFMAxFd3k5ZNU8J9ldXcL1NKjGTECu0aV3mTUX7hQ4VBmq
	LjhdozDpq/+Gmet5huIkKHPuimDLrsLqBQW9hKtjTflIp6EzJiW6dcJ6bejFXUAm
	oq1YIeJIAZn+5VVhDPSMdOBJ8zXecL037To7o/mDRx4Iqa13yZnInVXN/WiJrOkP
	FidwPtb9eV5Qnym3FxO948gAQmUUeo+ukSh6fdR9+6NwC5qZU5UL1Ibqou4CcBH/
	0hbdug==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sbj6v9wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 01:03:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 47813Sgp025454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 01:03:28 GMT
Received: from [10.71.113.127] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 7 Aug 2024
 18:03:27 -0700
Message-ID: <e5fa1a3f-3fe2-40c5-9366-4d21221f9557@quicinc.com>
Date: Wed, 7 Aug 2024 18:03:27 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 26/34] ALSA: usb-audio: qcom: Don't allow USB offload
 path if PCM device is in use
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
 <20240801011730.4797-27-quic_wcheng@quicinc.com>
 <c2ab91ed-a2e5-437e-bbdb-84988a052778@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <c2ab91ed-a2e5-437e-bbdb-84988a052778@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4CidAKI3zPEyUNyBFmQX_dZ-DRpw6yXZ
X-Proofpoint-GUID: 4CidAKI3zPEyUNyBFmQX_dZ-DRpw6yXZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_15,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408080005


On 8/1/2024 1:57 AM, Pierre-Louis Bossart wrote:
>
> On 8/1/24 03:17, Wesley Cheng wrote:
>> Add proper checks and updates to the USB substream once receiving a USB QMI
>> stream enable request.  If the substream is already in use from the non
>> offload path, reject the stream enable request.  In addition, update the
>> USB substream opened parameter when enabling the offload path, so the
>> non offload path can be blocked.
> It's a bit weird that the mutual exclusion between the standard path and
> the offloaded path is handled at the vendor level. I would think this
> needs to be handled in the soc_usb framework, no?
>
Hmm...I guess that make sense.  In the end, the mutual exclusion check would need to either be handled by the vendor USB offload driver, or the USB backend DAI link.  I could consider adding another SOC USB API to query for the USB PCM status.  If it is open/active, then just return with an error, or maybe just rename the snd_soc_usb_find_format() API to something more generic which checks for parameters and current status before allowing offloading to start (ie snd_soc_check_offload_available())

Thanks

Wesley Cheng

>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  sound/usb/qcom/qc_audio_offload.c | 15 ++++++++++++++-
>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
>> index 8b0913b7256b..3b46d05f1421 100644
>> --- a/sound/usb/qcom/qc_audio_offload.c
>> +++ b/sound/usb/qcom/qc_audio_offload.c
>> @@ -1460,12 +1460,17 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>>  		goto response;
>>  	}
>>  
>> +	mutex_lock(&chip->mutex);
>>  	if (req_msg->enable) {
>> -		if (info_idx < 0 || chip->system_suspend) {
>> +		if (info_idx < 0 || chip->system_suspend || subs->opened) {
>>  			ret = -EBUSY;
>> +			mutex_unlock(&chip->mutex);
>> +
>>  			goto response;
>>  		}
>> +		subs->opened = 1;
>>  	}
>> +	mutex_unlock(&chip->mutex);
>>  
>>  	if (req_msg->service_interval_valid) {
>>  		ret = get_data_interval_from_si(subs,
>> @@ -1487,6 +1492,11 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>>  		if (!ret)
>>  			ret = prepare_qmi_response(subs, req_msg, &resp,
>>  					info_idx);
>> +		if (ret < 0) {
>> +			mutex_lock(&chip->mutex);
>> +			subs->opened = 0;
>> +			mutex_unlock(&chip->mutex);
>> +		}
>>  	} else {
>>  		info = &uadev[pcm_card_num].info[info_idx];
>>  		if (info->data_ep_pipe) {
>> @@ -1510,6 +1520,9 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>>  		}
>>  
>>  		disable_audio_stream(subs);
>> +		mutex_lock(&chip->mutex);
>> +		subs->opened = 0;
>> +		mutex_unlock(&chip->mutex);
>>  	}
>>  
>>  response:

