Return-Path: <linux-arm-msm+bounces-117109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ysalBv+BTGoWlgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 06:35:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC57717419
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 06:35:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kEUHYdCl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Foa3/5TT";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117109-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117109-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80D0A301AABA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 04:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE72324B06;
	Tue,  7 Jul 2026 04:35:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34CF2566D3
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 04:35:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783398906; cv=none; b=WvkzDMkL9nLUu/faJyKF3s6HUOt4ZonGv5hSCPYcIq2dTBOKz2wHcHfG3OFrox1d3kQ0/j7TSu130tCBM9IxtsqzAZK4Qry7ZSf/7npvnsmkwIG6tyOv76Pb4AYfGi20ZNzID6pv74qI37/QXpwnnnEeaZVph2nSM+zHex8Os0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783398906; c=relaxed/simple;
	bh=0ZDXcfZh/a8ozHKkJratTsK93XDJ1Omu/IMErKmyXOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VDXiAWO26l8MVsY6OSiSQBhBNLUJkCMrn5c+kZujV5fNOLOwQa/5EtPOoI4n/BLNwk63+KGbj2fWhXNivvi7/UNVn0KAjB3W0r976qL7ex9yQ55V1uGfIJkpLrU7Ar3wsHpLVYun8BAfuzO5WsxJzXAPnvz2xZhzLmqEEwGXBS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEUHYdCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Foa3/5TT; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748dAG2585196
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 04:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kyYq8sBYzFKE3ux1MlmqCOVytU/P+geB4TI6ffQ2Iu8=; b=kEUHYdClJ6JjwNI0
	L3tpe27LIP3BusL1/hwEMnHLchU+QzLwjmeNryYtxVOTQgNmThgUaW0Rch1MU6Iv
	xgWP3QaKoz1JgOPJXKLd6yCtDpQbiiduduRotxQqCLQa93cObXcVJ7PAOX0xL4xz
	1fxIJxfXb9c+QC/SwXo0vScd/tIN3tkjRUx3a1iWXw8+3ZLvHYvAG2Q9XVMw3crK
	SXG6kwcTZlFjw7htlACrFnr57Su50XC7M7iVCCMUjRXFKj9vwFf7IqoV86HmNdSB
	0mWUmDca54VEb9XPWbUEvx0sd8lcnOY6aig1cg7tvenc+LLIFeSupo6s8hacQfh4
	NPIl3A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t15839s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 04:35:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so387842a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 21:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783398903; x=1784003703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kyYq8sBYzFKE3ux1MlmqCOVytU/P+geB4TI6ffQ2Iu8=;
        b=Foa3/5TTIUMtkVOb1gdfp7DRex7NG5Zgdw30M319CQaDClRinAbsJDNB2dCdb22zWR
         d2vOXOTIe3UHQRrz4cOHT1u4EW83BwgTQ9nx6KUEo4c5MjNgR42qlxFxQKQt/bpUtzP0
         wpmqAcgCwMhbWSQkcMtK9EqRxKhetmT4FEdKq4iAga1S4riAoKCwPpDBIrScrer+QVEM
         To+HRBjV60K/Oyg0Hq0dB0U9D0evWnBrZSLVQjIdAP/Qn2QvNZBSvgWhiCWvMo20CBKk
         8VYXFLxIgEauhaeDzHUBNpOOCWsfrWo448fo2Bd9qyPJZeB88taK8aspUul1yWyFYZPp
         OciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783398903; x=1784003703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyYq8sBYzFKE3ux1MlmqCOVytU/P+geB4TI6ffQ2Iu8=;
        b=HNxA0qLnTrV4GKdq3JKbgi36Eh/dG+/+pRSC3HReu5lurrNbZxocMW3jSlOCvbUJDx
         PN4WprwSjILuFX/c90zK0YJEjLqy4ovqDlFVsgD9xY0CgEWam+t1c224hB9t107A3ne5
         xSoK0pin0x7Hcf0bY72Tm7IFdvrJp+tc081cQe512cLgZ+P0uSM7q07BqZZA9dfsK7rT
         CV3vrFdVX665iFfZe4/WX0kaUxf4NsA9IgmcZccSw4IWmdUzTgXrfWGqcJBOxFpJceDE
         hQH+ZF9EnudkDH6Zv/AqqRzPT+tq1hp/rgtlcPkJxkkTEqnc1ye3Oyqo6bJ4dAbR/Lm2
         q2WQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKx6QpFbPYgivNqljo3zJNjPCMFHAuasSckz3NlgiJvN2HlG5s/jZovNqgm58Kei5OaXVtmZgvSzvuXXoq@vger.kernel.org
X-Gm-Message-State: AOJu0YxUBIfUJnCYD0XD+o8JYsFtdJWbUXAHCbz1ISY6dHc0duCDIKPM
	tWbF1vqramgniL3H7rHhJQTqDN0RQzT5vmPBzj/JzOjfwqNllLir40Tv5NSI2UWGxKP/2iuK0vK
	lytnb1bP9WHAxZhbbQku//dxA4DFPBRE+tf+GpEx2pJW3lfn8l1UaCirGldzefUPBk1rU
X-Gm-Gg: AfdE7cmOC+XEzJq+iCyX187k0TT0oMiO0HmL+nbJkZpljwd6lgSo3pmJfEts1NG6vfJ
	mSCQG7zrcQl4o5tuWIzqY/Ez6hQWzzCpnjkYhQrgkre4nqRS9mXRCaNzKWyMCq/G7g0F9XRt/4u
	jn0/FZE1fRxG0HIIm5IrDuCbisVd880QYFE5ffQRX4QWK5ndnKU3ASsG7+AeDhFOSH8kRaCsnM5
	iUnzKWA+t3lP6obUhEO/CnN3V8y234NDgBG8BKcaIbUoNCkrHm+b5044jECP+syfxdN5SayiP2i
	Cz96BG2RyRn9e9J38QhHybXGUg8MNYJ08gz3eFu1WvNTkRZMx5iTmIXb0N0f6as93xZaivaWBVD
	scSfhMps8RqeNYQ9vH5ZuyLpKQJJ5VEQhTpt1huU4d+kXUJo0SA==
X-Received: by 2002:a17:90b:3e46:b0:37c:8df2:9f58 with SMTP id 98e67ed59e1d1-387d7750f36mr1478174a91.7.1783398902884;
        Mon, 06 Jul 2026 21:35:02 -0700 (PDT)
X-Received: by 2002:a17:90b:3e46:b0:37c:8df2:9f58 with SMTP id 98e67ed59e1d1-387d7750f36mr1478123a91.7.1783398902332;
        Mon, 06 Jul 2026 21:35:02 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm4147256eec.0.2026.07.06.21.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 21:35:01 -0700 (PDT)
Message-ID: <966a4aa9-ba4e-4f09-b151-29a77db4201a@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 10:04:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] ASoC: qcom: sdm845: skip set_channel_map for SDW
 stream DAIs
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629141633.86657-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260629141633.86657-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <6cc41123-6d6e-4a93-91c2-5a2035dfccba@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <6cc41123-6d6e-4a93-91c2-5a2035dfccba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bqBj7Dsb-c1zjFZOCtWfRtEVCh9VlxNc
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4c81f7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=r7bdlasGZOuuhPoSvjYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: bqBj7Dsb-c1zjFZOCtWfRtEVCh9VlxNc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA0MCBTYWx0ZWRfX/Wn4y/BBBJBX
 cpKQXaCEHmPB+bb09Es3KTS5oXLhYtmpVdLe63AzFEckCva1nsWAQHt0jc+E4HEqJ8yTW1qoQv3
 t/P0kEXs1d94VofPY1XVq1J9mQimePo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA0MCBTYWx0ZWRfX2xNxSmflWfGA
 lSeRrckoNgFryshneGw/3M0SWvEic10KOazTntnuzPR80BplcC5MZyEogRvtIXdiJmxERD4EQfP
 /esw7jIo/jt0CefKu4eju7sjL0hVRiwuLvYfZvFiuAYrAx/7dryZyh+vLFDHuXrUtSDLMj0F771
 a4EOvHxFsbsuTOVPhquwxFbNIM5o0xjibNiKgfUOetWv4UAeYVeolIIOUywaVAtLp76ZbUzypLw
 lA4vfDQuRZueReUu+d4UmQOV6mEihDaVUhB0ofj+DTW8Mjv7gA3Ccn/N8bqVPBf9HUGPCS2U7zQ
 nkp+d/vABiZVHt2ogUk/3LzjukmDuAUwGQUoZ5/UhWOLVR2Kz5/AVbDvDP3a6hBGw8lJRezi/BW
 LjV1nBcbH3CQ3DnPXsfFz3+qiVOaaviy7/HpWSZiPf2OXmoInmGjfgBkZ1oL0A0d0MXoEdSLGdk
 HUcBhvxmi+QjAZfWeJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070040
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117109-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@oss.qualcomm.com,m:srini@kernel.org,m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:quic_mohs@quicinc.com,m:pierre-louis.bossart@linux.dev,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.intel.com,gmail.com,perex.cz,suse.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7FC57717419



On 6/29/2026 7:59 PM, Srinivas Kandagatla wrote:
> 
> 
> On 6/29/26 3:16 PM, Mohammad Rafi Shaik wrote:
>> On sdm845 the SLIM Playback backend lists wcd934x alongside the qcom
>> SoundWire master and its SWR slave speaker codecs as codec DAIs on the
>> same link. sdm845_dai_init() was calling set_channel_map with hardcoded
>> wcd934x SLIM channel numbers for every codec DAI on that link, including
>> the SoundWire ones, corrupting their channel configuration.
>>
>> Skip set_channel_map for any DAI that implements .set_stream, as that op
>> is the distinguishing marker of DAIs that own an SDW stream path — both
>> the qcom SWR master and SWR slave codecs register it, while wcd934x does
>> not. This confines the SLIM channel map to wcd934x where it belongs.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/sdm845.c | 27 ++++++++++++++++++++-------
>>   1 file changed, 20 insertions(+), 7 deletions(-)
>>
>> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
>> index 0ce9dff4dc52..509d7a551397 100644
>> --- a/sound/soc/qcom/sdm845.c
>> +++ b/sound/soc/qcom/sdm845.c
>> @@ -294,13 +294,26 @@ static int sdm845_dai_init(struct snd_soc_pcm_runtime *rtd)
>>   			return 0;
>>   
>>   		for_each_rtd_codec_dais(rtd, i, codec_dai) {
>> -			rval = snd_soc_dai_set_channel_map(codec_dai,
>> -							  ARRAY_SIZE(tx_ch),
>> -							  tx_ch,
>> -							  ARRAY_SIZE(rx_ch),
>> -							  rx_ch);
>> -			if (rval != 0 && rval != -ENOTSUPP)
>> -				return rval;
>> +			component = codec_dai->component;
>> +
>> +			if (!component || !component->dev)
>> +				continue;
>> +
>> +			/*
>> +			 * Only wcd934x (SLIM codec) needs these static channel maps.
>> +			 * DAIs that own an SDW stream — the qcom SWR master and SWR
>> +			 * slave speaker codecs — implement .set_stream; skip them.
>> +			 */
>> +			if (!codec_dai->driver || !codec_dai->driver->ops ||
>> +			    !codec_dai->driver->ops->set_stream) {
> 
> This is totally a hack.
> 
> --srini

ACK,

The intention was to apply the static channel mapping only for the 
WCD934x (SLIM codec) DAIs.

The existing machine driver logic uses hardcoded channel maps which are 
only applicable to WCD934x, and this path was unintentionally applying 
them to the SoundWire master DAIs as well, which is not correct.

I agree that the current approach is not ideal. I'll rework this and 
address it properly in the next version.

Thanks & regards,
Rafi

>> +				rval = snd_soc_dai_set_channel_map(codec_dai,
>> +								   ARRAY_SIZE(tx_ch),
>> +								   tx_ch,
>> +								   ARRAY_SIZE(rx_ch),
>> +								   rx_ch);
>> +				if (rval != 0 && rval != -ENOTSUPP)
>> +					return rval;
>> +			}
>>   
>>   			snd_soc_dai_set_sysclk(codec_dai, 0,
>>   					       WCD934X_DEFAULT_MCLK_RATE,
> 


