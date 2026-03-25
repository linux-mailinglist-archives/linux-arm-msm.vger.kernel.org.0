Return-Path: <linux-arm-msm+bounces-99859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCjQLzfNw2lKuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:55:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2321932446B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E3DE31E49C5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181123CF693;
	Wed, 25 Mar 2026 11:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pI2fGdgj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JgHwqd5H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD0D3CF677
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438993; cv=none; b=bEzGz6uMYWCs54qwfJ+n8lQUtYnfCXyhEWCSgRMiSJT6NhoOEeWYC35ZYYA6QuwuXQy+bZiBxgLosHEa2mu6RvMe3CuGltLUICIkCL4JOuQmONPNSjRmReFiPdn/6FbL2yZeT8n8gWtodtsOdEeeFa2JNw64ababM8FUTqoxL6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438993; c=relaxed/simple;
	bh=5fH48zH09IkfDjS47szybgjqzM3O4lcUiMANwdM083A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UxcEP9gjVHFrMf2l7FtgqiRz8kEEdA0IOqQTYue8kqBaaRbiOu/iBsYtKawL7anXoom6QyrTxcDTwREUkJVQeccgDmIwjvTNwlUih9lNxGLbzg2n/2EvNUk2p6LEKK02rvobUNOPOtrJD3i/BjKsLYj+ovGHpi4nPGUWRW0lshA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pI2fGdgj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JgHwqd5H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGBPl721274
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8eI1EOuO8NMniEgloRwv0lRXK9ldn1Em1VDfN/l6TIQ=; b=pI2fGdgj7P1Qhgcw
	XXn12Ljn8C1+/tDQ7HXSKM+3mqlG1jNvOpmuM/w5LgGjuRCStTlwmcyEszIu4B5E
	NOtyjAgC/cvIvcZmglREVeMnau68EDYhN+l+XChrNg4XaYByjc4Zgqv/XtFda2wJ
	BfTNIzXhmcm1UVG8HWy+LjYuCS6Jxuf/AK1Y+yVqdYgAbqaXmgDpeV97ZhcxK7kh
	9G923Z+TumVLMcYSa2Re4148jtx9eOKwA7FgQ8qm1UchqL2QheV0hY3u1vVbrvXa
	hHTgdd+U8FIDmDVApnhfUadOZ25z0ZIYniWSkFUqqOJ0gX3hVQ8S403EcKjDROGe
	azcW2w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dm2rbg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:43:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4b81c632so87913601cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 04:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438990; x=1775043790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8eI1EOuO8NMniEgloRwv0lRXK9ldn1Em1VDfN/l6TIQ=;
        b=JgHwqd5H1Y8KOnEeeTTXv906j8ZjNicvT9M9sdiTJs8JSFnwo1lC0qeLnSKd8wfqwM
         JQu4H76g/UoocAv22a4XtU8Jku22xkjPYH+I9m1fXXj/hKG4qaiKOd7VInn0SC4bvRrQ
         agjoEO2ZCMcDeQCV0BzF/BVhyZjjlJm2XsNXJsEh+p1U0UcNtUe7i3gLoz3mQfbxC+0W
         YkcmrBzphaRhpAZSyEoJAtGVJUQQxaDOiGlkwVHSzpAkXYGtjokm+NSjRbij7hv4I7hs
         S4/gtNH6B9fGDJTJ5w9Pz0a0yOtd3ZxaN/Dwi/nTtT8U09TqaGKyJyg+MjT/mkRxZ6Gg
         eVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438990; x=1775043790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8eI1EOuO8NMniEgloRwv0lRXK9ldn1Em1VDfN/l6TIQ=;
        b=UqofgvsXdggv32v5b73P40VO6WTbUVUI0bIDm6Ar3sxqFmBe+yTDrifa9I1ecvfAqG
         PHILWsZpdmYVKh/cw6nj9W0UPIjKuV9TLO8XtDExiS86Q6Y1wLx0ZxF/Scir77wTFJ4x
         8o1k4qujBMUDdNVXmpte200DHHjHIqOVe3eIqikiZwsS+H48qlnrsKhhwZUZXb+qyBK1
         phQ4XjyQ8lWaU9oforJbWi6lLOeSia7kIW9rKzPVG8y8Tv8IVlk1fJvau8/wu6cMAmAm
         KmKlmK+0AfPqqW1hX/Z2rrW5PKJ5v7qoU9RdnmE6xs+Nunfv84rmzMQ78y+8lu2xaqE3
         m0HQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2JFHX1W/UZAUf4FjKkPSC83AicCI8C9JTKtblBMGg0IBN4Ewwg0uh2eXaR/VD9zEayS9w0m4N5eHcrPJZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzpUtoRLuw7XOeTzhD6vBBmw1+Lcdy7o9i2Lx8x7aZ0ARP6Lx/q
	gE5LvSTi93zzN+AwjG0hFAfddEj4n7n79br1tJfHROyIslUzS+sv5ERKzZ6uvEppoDJ/I4cIMUN
	3zO3qptMzhGi8HKhxNLwukBkXZmvXczBikxiQ2gDDCQx76jd2wSycgklM/4NP9EXo5afq
X-Gm-Gg: ATEYQzxN2nfSiei5Ad/ulQtzwh8OSyhWTAhoNTDqKmr1g0OrMnB4N2DxjzZCg/YftfF
	d7G6h1tleQDyVNynpQjcnmPCi1lu8pxBWWelEGWs+ap+ng6HoroDwRgwzgVvnXSCHstwo0YcvW6
	0v6WbB3DIqGd0NdadxFM0EpivvNsQ7ldFSn5UTvf04aCu+APH0wy9arrNFuctJnrewi8cKXOBOT
	MtDGlZIlqVG3GGrQ5AvKdbR8sE1kyNR8snkLbIWJrLWl6t94W7cwIc12TTEiPvYI9kUNv4X0Vjb
	QTV92aEHh4aSSxzHMt4Lv2koRTRFw09WirWGa7qDLdBZV1nT0joNRecaaJLhw+NrcnFY72VEA5w
	AhvhB5LYVu+ckOnYFoPb2Shyzs93OlhcXHP3ITBZGeDhNirvd
X-Received: by 2002:ac8:4055:0:b0:509:2677:68fc with SMTP id d75a77b69052e-50b80cabfc8mr34124551cf.10.1774438990171;
        Wed, 25 Mar 2026 04:43:10 -0700 (PDT)
X-Received: by 2002:ac8:4055:0:b0:509:2677:68fc with SMTP id d75a77b69052e-50b80cabfc8mr34124121cf.10.1774438989701;
        Wed, 25 Mar 2026 04:43:09 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43b64717e97sm48911817f8f.35.2026.03.25.04.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 04:43:08 -0700 (PDT)
Message-ID: <4d5c4953-94c9-441b-852d-62c03fde6554@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:43:07 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
To: Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260323223845.2126142-14-srinivas.kandagatla@oss.qualcomm.com>
 <9a9ea82d-e299-4a9c-bb68-f430761387f7@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <9a9ea82d-e299-4a9c-bb68-f430761387f7@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MyBTYWx0ZWRfX4Kv+pjvpUosu
 B0cc1pA1mLxx9FGNw4tpaRZfn8vfFB+CZM9PKHxgxK29YG1k8emRnKt3/TzaoL4CBaDQkttnYCs
 fTPd7Yg6IRkRSsG7mN03jg4xsuNFaiPglAWrPwfbpQe6Tv9Egi1pQWuRSc6FOLvZwAt6RlV3Jz1
 0wZ3/DTASJm8BxGB/N4Gs7COBv0dNkGiVEGGaXFNslyv5YSutbA1A6NFyNWqPDWaY+eI98hIz+J
 rY4ZSPGFIoGgKqD+9m2LUFTGlxFqusq6lVLEmiXJUajr+uYp/N8ZtxYhE7cR2cezPDTNmJdZ40a
 /+LDhagHmjFcicaJMBspkjut9UL8AH5oovT7J5OZIqtOxwd91yjmnZFo+tV1KTEsZ4h+4TsLIDM
 o3Qi1vTUBjOKEeVVrDPGgzRlVe+HuZmuyoE/g/4Jk9nJH2hNc40fesctRoroZXbiQ85b4Rkouvd
 O+/mPQHPgvud/5rgP8g==
X-Proofpoint-GUID: S35nbKee0hhHAqwhLbFMYZ9kMSAj_Ujj
X-Authority-Analysis: v=2.4 cv=Fo0IPmrq c=1 sm=1 tr=0 ts=69c3ca4f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Ty_003Nu86zhfu2WEF4A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: S35nbKee0hhHAqwhLbFMYZ9kMSAj_Ujj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,packett.cool];
	TAGGED_FROM(0.00)[bounces-99859-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2321932446B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/24/26 7:09 PM, Mark Brown wrote:
> On Mon, Mar 23, 2026 at 10:38:45PM +0000, Srinivas Kandagatla wrote:
>> Buffers are allocated on pcm_new and mapped in the dsp on every
>> prepare call, which is inefficient and unnecessary.
>>
>> Add new functions q6apm_[un]map_memory_fixed_region to map it on
>> to dsp only once after allocation.
> 
>>  static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc_pcm_runtime *rtd)
> 
>> +       if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
>> +               substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
>> +               ret = q6apm_dai_memory_map(component, substream, graph_id);
>> +               if (ret) {
>> +                       if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
>> +                               q6apm_unmap_memory_fixed_region(component->dev, graph_id);
> 
> This looks like it's handling bidirectional DAIs but...

TBH, we only have one dai and one direction per graph, this check was
added for completeness.

We can not have bi-directional dais, as all the be-dais are uni-directional.

> 
>> +int q6apm_map_memory_fixed_region(struct device *dev, unsigned int graph_id, phys_addr_t phys,
>> +				  size_t sz)
>> +{
> 
>> +	info = idr_find(&apm->graph_info_idr, graph_id);
>> +	if (!info)
>> +		return -ENODEV;
>> +
>> +	if (info->mem_map_handle)
>> +		return 0;
> 
> ...we have one memory map handle per graph ID, silently ignoring
> attempts to add a second one?
there is no second one.

--srini


