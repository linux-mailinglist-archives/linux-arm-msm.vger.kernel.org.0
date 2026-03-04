Return-Path: <linux-arm-msm+bounces-95288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AV/GWcTqGnUngAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:11:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 062C61FEBFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 12:11:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB4223052DAF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 11:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F73D3A873C;
	Wed,  4 Mar 2026 11:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PWDaLL3h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZrV67rsL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DAE3A8734
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 11:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622651; cv=none; b=JgbpPW+tvtEP5Ue6wLE3u6Ibn8z0ScOleiMawYip1cUum8FKpNKlmpQRtxB6e7o3uWPrYl0WnHXrtg2GHrTakrDO0uEkGxFN+PBD21mh5DZbo07p/Oo47ZESH9W5KSBPfAKplj8RB4pVHx3Dq99fry/ej0YuyHznd2SUzqRLXEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622651; c=relaxed/simple;
	bh=8q4I0+K3Qd+pKpBHKEg0QmrqNR8wj9CrheJKZvAvxoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B3ZYO0Oy5qOYqwCthG/CmdYLuV9j/QbE5dRURpV0boYY4WgrkRCeEHvqZ5i9kFTka7gt+nAnH4VxpUil5SOYWgHJyP/wLYR8Xe+YQX9Jb2twRfnC/fN1DZKQNz1PmHYivh8ccP/0XvBS30B7PytlpCLxLcSC/86wfIX7xZT3hdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PWDaLL3h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZrV67rsL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SULQ2861184
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 11:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MCCLwpZefcWyGX97YnB9vElnqX71UTAgAeEXx3DfaRQ=; b=PWDaLL3hXJ8B+B3K
	9BbHZWwPBW6Z86Zthjxd3PjGFDOXiE0Zf2cwHaRhIJ++rZpYaZwOcNUEkzsBPUl9
	BosBeVr4+RZa0QEMEbcFuWlnEF9dImhBz86+8iws1Zg2fMoaaoWC/QBL5PsKzMzE
	x/9ECkbkya3GvPuIFGj0pRVyRBnrpqFbRq0eEfk48E/hHtwe9eo+x/xK9Q8nWVas
	UJJvNGbTkBycDYOpxWMGlPKNGWqj26mBwTnTh9svxquaLyfYRaHT2UB+aj7TPnRN
	dBCiThI8kdAMDMSVOqFV2LcmBZqnL/eUrBqzVs46h3Y6yLdsAz3QQK2o8kxAOMfe
	qKHv9g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9knvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 11:10:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cff1da5so3954778585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 03:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772622648; x=1773227448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MCCLwpZefcWyGX97YnB9vElnqX71UTAgAeEXx3DfaRQ=;
        b=ZrV67rsLlsPYb1KROEKB26zUT2RXppjaV89Qjp1Y8DOO9OK/nN2seoiG1A7VcfHtuU
         bDOEWzFfU6km/4kEQOp9fzdLuwPY1ZAX5PWDfzGaKQYiiJH+R4HQpPYDfpyRP0rnCLoG
         HTwseTJRq4zUncnYxnWGecPCkasCidMBHCa63g/EZ9d27NbEaYHpFhjlJAyeYBuaGjVL
         IWoLwlCstCXWILryow+acBjHKgICjF1PB1lYFNAFEjbvjW2mlktzdQn3kvzgG66ln6lH
         vgTOxXZKeVu1l3MfB9xC4EoVIb44uIkDq1ssgfaxAVJCAVtIDeB2o+64ppPzWUuUVS6/
         0J0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772622648; x=1773227448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCCLwpZefcWyGX97YnB9vElnqX71UTAgAeEXx3DfaRQ=;
        b=FoklrLIO/4Griy7645yS3NeZ6T0J5erkTV3aaS7uf9i+wXc/4j4UqitCOufguKFCuc
         I2aLkUtju+8ihLVewI7GHRkiJeK5/c64sbxXjFXp6Hd1wc9nC5tvfBEPDumEI8y5N/Kg
         w27X2KgDoHKptmx3/GAUdfBhKzv5bpcYxvQbxony+Obf850KftjZDdJOAR+U4XMo4d/9
         2BJU3LstOjEH7y8Bz4OnNkvnHjBwXmM4JjDULNFQ7aIw+ovUwkCNK3L3N6Ev5sEDeT+C
         23eubz06oJ1nrPKA1N2Bxiq4LqKN0pr+wyrTrknUrpjl2HkeJHXw/A9zAmKjch1yaAiM
         UrAg==
X-Forwarded-Encrypted: i=1; AJvYcCUcFLuvozGXbDpWF5GzVhKSyNsDkc8U4qmMSfgMtEJR3BVfS1iVCftz6yIRkivmLy1eqgsXwH6YzZ2jWIvt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7R7C64rtJVnmxPPrXwLPYw4TaT4oEth8VEIaewdELB2KSuJI3
	Auzt8PF4CEB6rZceEAhqeBSCMAXb6ZLWxOx1fOsFPfFavtfwQH5hteBjdHD9qqlBKNEM76MCwKg
	D2RIo9viBodHbA18DP1LEMCQEL1QCUbjVZ2T4CLwqojO1tXhBNhozQtI1jTBBdD0BMVFR045yZ9
	du
X-Gm-Gg: ATEYQzzbIFJWBQmFHSIvr9D5zKvKL6IiyAa5zEO5IoL/R3cC+9ERkvuItdh6m+Rz+P/
	4FH4S7LRx75ZcZ9rHnwkjqP7O1rniGNK4wyxgJRLiISv7kPxgfi+IqElT3sZ39xbGjz2wd+I6gx
	f1033yLGtnoPoF3AG119E7aOyWDF2ZQz/yBqTYdw30gR6NZHACWDo/Ktjm4/98vOROOSEehS31Y
	In0JSlAv26ikKiYdPyDcQcIPcDnWlvH4sWeeiXwS5gnsoETmwOAmA13qvtvTX6nUof2NEdHjdo1
	Aaf93T3Dli2YZVlEM6iBygiHsPZ/PduecbF40uShO+oc3qC8MTs5KznlOv3cXDpAhS+EDdgDNB7
	lGL3XhdG4ehQVAYkJ90YWOEKVCvVVAtZkw0nuOfspiEMScf3A
X-Received: by 2002:a05:620a:1a08:b0:8c7:6f8:ae4c with SMTP id af79cd13be357-8cd5af774f7mr178536485a.43.1772622648407;
        Wed, 04 Mar 2026 03:10:48 -0800 (PST)
X-Received: by 2002:a05:620a:1a08:b0:8c7:6f8:ae4c with SMTP id af79cd13be357-8cd5af774f7mr178532685a.43.1772622647870;
        Wed, 04 Mar 2026 03:10:47 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b935aee56c2sm744482466b.65.2026.03.04.03.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 03:10:47 -0800 (PST)
Message-ID: <47123dd6-d17f-4d82-b8a1-e04a50e73a27@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 11:10:46 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223180740.444311-15-srinivas.kandagatla@oss.qualcomm.com>
 <3b4dfe95-9043-4682-8fee-7588fa1fde37@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <3b4dfe95-9043-4682-8fee-7588fa1fde37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA4NyBTYWx0ZWRfX5OXPsbIPw3b+
 JOauMJ6dLCx5aAX4cgqQ/4M9qU6bLGh8dj1zpSCoYmotMGpaqjvYUEdTTWf+EeO5jS0kmnReZae
 im6QUyfYbdSbC/cX2VIhUOxo1bKLBHeGxpWqArnZWjeVBrHyJ3JX9iRgxtBEqwZUp8QuWFVn+5g
 6QyL9Tgv2CZHaF/NluKrenvgU3UBbXbuN219siSosAYNWYzjKD4UUZHxcUwyR2xZeNUBbYF62mw
 b2kC3kYjkbGvSotRI4m9WkfMum5noMnYVA7ncxKYQ9/Jmc6IxFWbU7hJXsfi/4eRP6ESZ4nCQML
 kV8VGk9rSQvBk0NoCtmfOU8tkZiR5cQoQ2aSyTKr5kPx2jmNhkbRnusz7hMXSb/HFXgTXxLOda1
 us2mENTA7IWYbB3RGwzuI5x0mFx0QEKKlWnoOLQrFXPyLHsikiAY8ulQfXTS8zbTLmXeWsCdWVA
 dAFK6PXzFLBO1/IcEuA==
X-Proofpoint-ORIG-GUID: eEvpZ8pQlb4OvNyXmngcKNvxCWflGqRc
X-Proofpoint-GUID: eEvpZ8pQlb4OvNyXmngcKNvxCWflGqRc
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a81339 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=29lxGkwPwxXT-BnxCXIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040087
X-Rspamd-Queue-Id: 062C61FEBFE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-95288-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Action: no action

On 2/24/26 10:16 AM, Konrad Dybcio wrote:
> On 2/23/26 7:07 PM, Srinivas Kandagatla wrote:
>> Buffers are allocated on pcm_new and mapped in the dsp on every prepare call,
>> which is inefficient and unnecessary.
>>
>> Add new functions q6apm_[un]map_memory_fixed_region to map it on
>> to dsp only once after allocation.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> -int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_addr_t phys,
>> -			     size_t period_sz, unsigned int periods)
>> +int q6apm_set_memory_map_handle(struct q6apm_graph *graph, unsigned int dir)
>> +{
>> +	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
>> +		graph->rx_data.mem_map_handle = graph->info->mem_map_handle;
>> +	else
>> +		graph->tx_data.mem_map_handle = graph->info->mem_map_handle;
>> +
>> +	return 0;
>> +}
> 
> This doesn't return a useful value today, will it ever?
return type should be  void.
> 
> [...]
> 
> 
>> +		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
>> +			apm->result.opcode = hdr->opcode;
>> +			apm->result.status = 0;
>> +			rsp = data->payload;
>> +
>> +			info = idr_find(&apm->graph_info_idr, hdr->token);
>> +			if (info)
>> +				info->mem_map_handle = 0;
>> +			else
>> +				dev_err(dev, "Error (%d) Processing 0x%08x cmd\n", result->status,
>> +					result->opcode);
>> +
>> +			dev_err(dev, "Memory Map region %x\n", rsp->mem_map_handle);
> 
> Looks like a debug leftover (also in the below 'case')

Right, will fix that in next spin.

--srini
> 
> Konrad


