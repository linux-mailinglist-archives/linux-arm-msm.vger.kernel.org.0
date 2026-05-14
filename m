Return-Path: <linux-arm-msm+bounces-107573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Y17iLYWqBWp9ZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:57:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD84540AE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 12:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B9E2307EAC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 10:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6A183B5837;
	Thu, 14 May 2026 10:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aA9HlGX0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7ZIIk1+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4313B2FFC
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756120; cv=none; b=FSzZrzOanm0UnGgV6ZdvmHbN2XeupaJP0s/ncQJIcC+gtoDlmT0vA7jEkvcsUGUXZNxlu7TrdpSdpCpdcFypBJiAulJqg1ZfHWcRYqpaVsbM/QA4WpHMe7FjYJq3z/zeFYNFAf+VqnzC9CYEAQpVsw1vj2HEt9zZc6F31XzOQDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756120; c=relaxed/simple;
	bh=kMx/J9r7WnLfGWxPaoBGcSxdF3FD+RiowqHAxhNB8XY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oWPMX4Ea8UGzrDhz7iY6jpw/yh3S+nu91TuK5B3B23kVfRStbUA6V0qvGZypd2M4o/jhBPnK5vP0wB+xQznBhcFGY19uPZ3Ush/cYiNHkOY0X9YrFn9ZeEczg8kfSO3FpV0WNu+uTzGkGEFJxn7u60yp6api5/H9pPyGncSAc44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aA9HlGX0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7ZIIk1+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9k62N2796452
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/VaAgEDcKuwipa1EtcRKH0tyrwq9hyUOCh/ncQOk15A=; b=aA9HlGX0+x/vmO1M
	0/bwdFXvoVQkh1AdtGj8ArfJH2/Dd/695f4ekzQflgxe9psVIm9mAQDs9z0JRA/j
	iYqnO/3QjTtsnpPducprCpG+PJytux3dhPyYsi6FDNEqKtnSAinksDy/TNEOH0/U
	zCmycVRdy64DbXNf1pBJf0eZjhfYQVoagalF4IvP3Cf6tiHMs76ifgRecuE3hnJL
	HIIbKK62Rl6hv9KMIsYF0hfmyTGSMgcUu4B4Ed97FwOF1wyNxZhanUq6Selsu5Le
	N/VwXjn5C+haGU8sCQuwVOW22/B1ekaZ09rWSvjbq639Wfbh4LqL069wsJ4Z9CM1
	nmJYGA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5492st97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 10:55:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514ae0e3ad6so127775261cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 03:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778756117; x=1779360917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/VaAgEDcKuwipa1EtcRKH0tyrwq9hyUOCh/ncQOk15A=;
        b=j7ZIIk1+7whHq/49ZBPW5rR5UXqqzYLqRRSA/o8VBmqFeLSImt73Se+xmdP2JFHFx6
         Vxn3EPXqindPcOHLZgQDcTlVc0wDJoDSXhws7iPSRvgH+LO2AIfzKmnnPI6BAf18DFJZ
         A8hVSDmqmjG1IC/fcJ8qxmfiZraj7rNXxdcHSptMiVSn0vujZhonj5FDhHBwF9ULgDpz
         L8azYwri2A6DtY6/ycoVGeBMxzGqQ7QfRMTgDmPoDOdfhjPruDuHKx8ria6Xc68EAcyD
         n5dAwEo+pDSbjUxBd6+IpHPOSj+NpDs4iwYm04WCc4KfYzJQzBtkKvjkqf/1ebZi6NE4
         yDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778756117; x=1779360917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/VaAgEDcKuwipa1EtcRKH0tyrwq9hyUOCh/ncQOk15A=;
        b=YAR5F8Q80fBKBuGHzCb+v6m3x6zbDBWR03X8kLXLpF6PxkDGMIMLZODa0rjqSCY8qw
         LympJ6MiNutym+Mx8vsZDNoo3Jd+n2d0zuaLwxIQW+V7mpPgcFCR30SnSy+RiTl5xbw0
         iympHwmdhYEso9cB0EvubqPqAQVUwQI80fH6Rh08a/OgnCcBZRi1N6Ux+UyYs8pOOwrt
         8/w7BcBN/90nKh0JVivEuMjDDEznNRXD5UL2xbO9+1EhWS8qeOcWXKghMTyvJO1jjBZ2
         OJb8xxPUobMvvpzqHh2+t7hLN9nFXgGNMpv6Yqv2+gRdbs3nOaLfijeO7pQ0p+3j3eko
         gT5g==
X-Forwarded-Encrypted: i=1; AFNElJ/sWgrWP6fm0lpiOSCSv2hkWPCmkY+1REQaKmI7IjZUEnZIuq9/8cjHAwR14bgzxaAnF0Yr3QiBJZHWsSpN@vger.kernel.org
X-Gm-Message-State: AOJu0YytqEQvVr8L+H0pvjjshifqPBYnAc9vGubLzZqwTMotydITjIex
	0ek7p0WivpMXjXrH0nIMGdrjCI0dQ4ZM0yPG+JFiI0QD6z/idF/P+ini7uKOD5EBLFpI4pEXKF8
	h2PQ+LzCqYwNYAEGK+caY92cGWDZW4RaLFKx5yzSpBGxuffqAZpzVa+V30KLZytVfx0w6
X-Gm-Gg: Acq92OH6KGL6Ny0tCd4YiKMjwm0oAjOx3AQIkA4bWkKLCQ/5o7xlLlKsGZF44F8iR3d
	02eGYR4jyHyMkis/8Wor5V72gAjIhWTmobMQIuUxmWpdqn7rN9XWMndLlLqe92W245AIwsnFJJ4
	sboxIpoSzSgibbxb/PCK3pNEZ6zQLq20I1ZTj8J8paAyzOOSKGenAnB0vrRP8nVyFidbcqtaq22
	xH8NHrUF02aWCSL2iR36mkTQGihCVclD+vOJi2XqWFxWUdBD/ukm4WpNfJCBxoOHJ8V2SGwRdMu
	EpBjzAIFQInMssOq0LvzQ5olG3rsgBImQUhE/zpUxGWGZXIYoTNTX+t75ElSpO4P6AIguH5711H
	JsydZZM20+Vn+OGeV3GHSDKc6vOjqoSk7h7Yq5LUyTmjbq0a9
X-Received: by 2002:ac8:1089:0:b0:516:4781:39e7 with SMTP id d75a77b69052e-51647813c38mr14418711cf.21.1778756117403;
        Thu, 14 May 2026 03:55:17 -0700 (PDT)
X-Received: by 2002:ac8:1089:0:b0:516:4781:39e7 with SMTP id d75a77b69052e-51647813c38mr14418271cf.21.1778756116899;
        Thu, 14 May 2026 03:55:16 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45da0a178adsm6433563f8f.18.2026.05.14.03.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 03:55:16 -0700 (PDT)
Message-ID: <c6be57b9-ce26-4e96-b029-b18798904e2f@oss.qualcomm.com>
Date: Thu, 14 May 2026 10:55:15 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qcom: q6apm-dai: Allocate an extra page for PCM
 buffers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: broonie@kernel.org, jens.glathe@oldschoolsolutions.biz,
        linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, johan@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        val@packett.cool, mailingradian@gmail.com, Stable@vger.kernel.org
References: <20260514090607.2435484-1-srinivas.kandagatla@oss.qualcomm.com>
 <2pe7rk7jhc36osc6i4rxeyw342mvza2m7i4ztsmm6pjgwtlemc@k4gkw5b4jg7g>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <2pe7rk7jhc36osc6i4rxeyw342mvza2m7i4ztsmm6pjgwtlemc@k4gkw5b4jg7g>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lW0flxGadcxSFMK1cOZvsi_q7R1CAjPH
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a05aa16 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=_21zWEb1aClpJhlDeeEA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: lW0flxGadcxSFMK1cOZvsi_q7R1CAjPH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwOCBTYWx0ZWRfX6y9da5f+O2hg
 FAIpq3GjJne8YgRYS3M/Am57ICCXQRBobrtDV/erep5giZH4I1goi0wJYKIAPyyL9+7H4a1yRxy
 n3W/ktJDaDHO19uPFGp23sCCYIsKeIO8Mlz1fgyer8tRMsMDm2motN+YLER54mKHt6aZQ05yM3L
 txAV0t4u1m613xgvpRaa85vyWNnjcDIto3qLZ6g3hLOt04X3cD6ia3hCYkpSAtv6IuVRCeJwyrJ
 rC9zb8KV6OUjxq1qC4nPUQzTb2NDTj3DmH11kf4rzvv9QY73uxfqlDwHP7S7m1W6aPFlWoL2Wx+
 47wzx04wO8Qa+xgxfnYz/ZIuvmHfVy1WWobqftyiNm0ROaVFa2fuMfq6vDNG/aTAk5IRYY1xsHZ
 Bz60m3HeAf9Ig+qMDzkoD5Ax4aR8rimTiq4de+IYXIdXAsKVGohfkZ+DHlF94QoY56EBnomh0s5
 OZ0BdHK3HkvjYUFDAnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140108
X-Rspamd-Queue-Id: 0CD84540AE6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,oldschoolsolutions.biz,vger.kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,packett.cool];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107573-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oldschoolsolutions.biz:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/14/26 9:22 AM, Dmitry Baryshkov wrote:
> On Thu, May 14, 2026 at 09:06:07AM +0000, Srinivas Kandagatla wrote:
>> Some Old DSP firmware versions use 32-bit address arithmetic and size for
>> validating the PCM buffer address range. If a buffer is allocated near
>> the top of the 32-bit address space, arithmetic calculations involving
>> the end address can overflow and fail checks.
> 
> Should we limit the workaround to those platforms only?
I would love to do that, but I have no idea which platforms or firmware
versions have this bug.


--srini
> 
>>
>> Work around this by increasing the preallocated PCM buffer size by one
>> page. The DSP is still passed the usable buffer size, excluding the extra
>> page, which prevents the firmware from seeing an end address that crosses
>> the 32-bit boundary.
>>
>> This was not hit before because PCM buffer allocation and DSP-side
>> mapping happened at different points, and the size mapped on the DSP was
>> usually nperiods * period_size. Therefore the mapped size was unlikely to
>> match the full preallocated buffer size exactly, although the issue was
>> still possible. With early buffer mapping on the DSP, the full
>> preallocated buffer is mapped during PCM creation, making the failure
>> reproducible at boot.
>>
>> Fixes: 8ea6e25c8536 ("ASoC: qcom: q6apm: Add support for early buffer mapping on DSP")
>> Cc: Stable@vger.kernel.org
>> Reported-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>> Closes: https://lore.kernel.org/all/7f10abbd-fb78-4c3a-ab90-7ca78239891a@oldschoolsolutions.biz/
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  sound/soc/qcom/qdsp6/q6apm-dai.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
>> index ede19fdea6e9..3a1be41df096 100644
>> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
>> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
>> @@ -497,7 +497,12 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
>>  {
>>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>>  	struct snd_pcm *pcm = rtd->pcm;
>> -	int size = BUFFER_BYTES_MAX;
>> +	/*
>> +	 * Allocate one extra page as a workaround for a DSP bug where 32-bit
>> +	 * address arithmetic can overflow when the buffer is placed near the
>> +	 * end of the addressable range.
>> +	 */
>> +	int size = BUFFER_BYTES_MAX + PAGE_SIZE;
>>  	int graph_id, ret;
>>  	struct snd_pcm_substream *substream;
>>  
>> -- 
>> 2.47.3
>>
> 


