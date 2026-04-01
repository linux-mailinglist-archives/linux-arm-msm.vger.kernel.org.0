Return-Path: <linux-arm-msm+bounces-101379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJQ4M0BQzWkWbwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 19:05:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E2F37E602
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 19:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3935130CA6D5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 16:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DCEC477E4E;
	Wed,  1 Apr 2026 16:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DqNeMY2H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JGYCPhDu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEB83264CB
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 16:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062447; cv=none; b=L9MBdHyJ7W2Rqk0jqruKUE/ttwkvzOpaaAJGpbjeNiXu6MTOqvDJ4eXKuqIO286oUElT7WtAtsV4RPdLDPtWX+Ik8374vM3S4u2uPNxfgu6ijGmI/BNHivJf/TPwXpUrut+OKxWMprb+U9YGdXUvS3WJa0or441wr16EfIuzaw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062447; c=relaxed/simple;
	bh=nCrMZGuEmiO8DntA1wydj9M4MdVS8jMj/QsSsUqzP6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=swLXpiefQ1oGBDtOB864VS8N0Um1Fibrv7b2wAlloq47daEdophcNEOzrnLfGFBgTV9p9fvzpz7ZEkrJ/IT60gUag+R0t7rgryWdGr8Oz+yAvNDr5dXFEe/wfLb670RgK9YNRIxevrrabqiCPKUpQxq1q0n6R0oKbEsbpo3Rm8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DqNeMY2H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JGYCPhDu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631DPe831893840
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 16:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+uyp+dYf9ZUf2TcuRQ8zQQWBhSiyCO9WMkrxwM++H0M=; b=DqNeMY2Hy0g0SzVd
	q0RhJyJ8IsatX7Y1YooTAdf3SejcstYVyN0nj3rzSrtA1ZtkC5y25hRo5uSw44Ef
	K75LWW+k1rgBelUfS1pOJXlgWSFH6BKuPtQokmL1m5obzo9LI0YezcsZUnbp/S9/
	vLZ7YPtquiTNTcPZgOPlLaFq1FlTgjV+v5UAuK2aPxSEV6Dfvyec4VHWTY++112Y
	HHhDfRlGQpM1qdYN/iUAcXB16xQDVFXrc9B/tRsprJlGLjNqBsJcVAJFJulGrUqr
	LMZYQ/ZG/SaDwdZ89aMzhCEzBpWor9DWEtDCnsvIbwbeJwWaabg6JR+RJhQyDizW
	lP16MA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9483rxfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 16:54:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b802961ecso91422661cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 09:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775062444; x=1775667244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+uyp+dYf9ZUf2TcuRQ8zQQWBhSiyCO9WMkrxwM++H0M=;
        b=JGYCPhDukcYXERZhAv6O0epLzLMVRHeZxMi/lRmoecVVw1uv9nNqVRvGuEYkXg88Sg
         QXqH5GJL7WOsx+2qW8f9NjRRsQBwg+p77GjuCxxLvUWe6T+OPKy6Bzha+5FgtLNqLQYF
         ZagdmvZezrO8aOYXCSMNaGJHtjo5cYIpBeXc92RGhG7CkqAFZZZOAfw8l15YuoXpSDqG
         2nceC7FIhkqCO6DYGVjfZC16+i8MhCLFzX3lyBFw2rAzU9oKZWx99AEZWNM1po/xcFAa
         0ZxyPcQX5P3NXzGUzh/NoKXdwD++ABt48vn87o2lS7381FLZxDewOHWo6DQCiXfShJXc
         WTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775062444; x=1775667244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+uyp+dYf9ZUf2TcuRQ8zQQWBhSiyCO9WMkrxwM++H0M=;
        b=OhvEWdQsqlqcSZIMf/8bIeE5G1oteOOfHGm6bYb774XK3DS5bzEarC7BHrJvTMnD1n
         13W9ussTUOw5CA/IATECP0WhYFTzH/UZt/wLrbA0mGCIqlpt1LeWRomPYEZPYfhBLcDb
         HqjHiSa/9sAkoKuMqJ0i6kEcWq1MDc2mPTFIHguIHYDOvLZv7yHzx5R5NJh1z9QgOrFi
         KvNjHeWEPLhsVNTCHHIYZI50BHm20Npo5S4gPyjigp7/6bQnajMbhIxrqap/TcbYkajx
         9tOmZi5y+0qu0r2I0EtXD+8biDGOdcXzitRrvUlxZsiQpBWT/m09DVr3uZ8x2J41uXE5
         2x6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBflRW4RbmMzBysgOFbwOwXEDq0yHQb2+iXqlkBicGGAIciohxxL2zCB7nVprzMOYJ0vH+6imwjTbR9k9K@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl5oXwva8ITFePut2ZQD7W8+zZonHwttTpOaCbQF4ujEqDw9F2
	fpQkdtjLOZjyux7pyRRnWBw9WwuHiNFsWtnBxbkkEQE87Wb/d6eoKRm9Pi/pUFBjbYxoJy8uGsQ
	DrG+WbUja7VA2v9YrrMlU6F5PozDbxWMEJBnWSYmcQeeOyfkSxsIPwO8fH1GyoCKUStmH
X-Gm-Gg: ATEYQzwQa5hLHLHSgElyst8/GTHiQRB/U8tz4ZNd6/ainOCE0oEeeg69nc90jh0bkdz
	jKrymiRm8ApOiLNb5XccLTO/il3NwREQg7cfnbIR64cXJnWR5sPKxbbkIbg7C+OERnNX+Fq/Cpa
	4eVn1bkffp+Y4vY6yLSjehSnEzCR87LQ+jGaVS25ve8UJFb+iLGZsoHrAh4SBttWGXD4ddzDcy0
	SBGts4vpt2pRahEwD7RXe4bO0wIy/uPzftucAjKmFKegbqemUHYHhJICPAOy1lUHb1fZap6r201
	SbSNE+QzVpglAtxlOsD+h3Rvl48/hGPRU8zV+sANXgliNYSjPKNq73bcCzKj9i5wgvQf1qboD3H
	KUpOUlf/bESOWqd3DeoNWvHfh5ub72vp6dzMqqvzeDu0dbj3n
X-Received: by 2002:a05:622a:7290:b0:509:aa4:49f0 with SMTP id d75a77b69052e-50d3bd3b45dmr39681331cf.50.1775062444063;
        Wed, 01 Apr 2026 09:54:04 -0700 (PDT)
X-Received: by 2002:a05:622a:7290:b0:509:aa4:49f0 with SMTP id d75a77b69052e-50d3bd3b45dmr39681091cf.50.1775062443589;
        Wed, 01 Apr 2026 09:54:03 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c31sm6168766b.37.2026.04.01.09.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 09:54:02 -0700 (PDT)
Message-ID: <6be87f21-1da0-412a-8662-ef05ca32f3c4@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 16:54:00 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/13] ASoC: qcom: q6dsp: Add Senary MI2S audio
 interface support
To: Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260330082105.278055-9-srinivas.kandagatla@oss.qualcomm.com>
 <38eb807e-8467-4d7b-9094-3007d0ba9c89@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <38eb807e-8467-4d7b-9094-3007d0ba9c89@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RYydyltv c=1 sm=1 tr=0 ts=69cd4dad cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OW1hUYqCZhJZeNE_EJMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDE1OCBTYWx0ZWRfXw3LHYHvGieZX
 fo/RNalzCsRhD9s8Vx0a7CWWKOt0tCh5MIvVrbHYUuaA12TiLty0qws2coGrlT3tdhb3PBYIz8b
 m16NSTdj0LhdBdTtx2KwUORYqTTJ53yvZ/pawxwpBdJzXPv8+xLIrObbPkQxq2jTbAdOfyr5iX+
 jO/fc/nRN/KfpLLjygPLL8mQtYm4LA2jnthFzTTvVxqTzOc2rFe1t0+j5LT7U4fySVnlRR4DVEe
 Prn13Mh0pORjFrqCKoNWrjhLqSIFbX9vRA1epfEQjW1VwoSvjqoS3ze8K7OT37QseYOznQcofSE
 mpWskEAycT3DQcCInr6UaN9uMr4ST0zCbbaU47EsZ+KvHdTxXMuXZ0450GBTEtDAaKEv4NDr6o/
 UZ8s7kJbThX6R8sdF85NcqG15Ot/U9vxDYVboWf24QR7tULmKpF7XOPT72bkBZOu6Kh2d8hO+Un
 yg4VIKvhoyGHuQOoCfA==
X-Proofpoint-ORIG-GUID: TYWUtifsQSurIT-09nOwDB-kyfzyUUdF
X-Proofpoint-GUID: TYWUtifsQSurIT-09nOwDB-kyfzyUUdF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010158
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
	TAGGED_FROM(0.00)[bounces-101379-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 27E2F37E602
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/26 11:25 AM, Mark Brown wrote:
> On Mon, Mar 30, 2026 at 08:21:00AM +0000, Srinivas Kandagatla wrote:
>> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>
>> Introduces support for the Senary MI2S audio interface in the Qualcomm
>> q6dsp. Add new AFE port IDs for Senary MI2S RX and TX and include the
>> necessary mappings in the port configuration  to allow audio routing
>> over the Senary MI2S interface.
> 
> This breaks the build:
Yep,
[PATCH v8 09/13] ASoC: qcom: common: validate cpu dai id during parsing

re-ordering these two patches, should fix the issue.

Sorry about this, Is it fine if I send this reorder in v9?

--srini


> 
> In file included from /build/stage/linux/include/dt-bindings/sound/qcom,q6afe.h:7,
>                  from /build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:5:
> /build/stage/linux/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h:153:33: error: array index in initializer exceeds array bounds
>   153 | #define SENARY_MI2S_RX          147
>       |                                 ^~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:723:10: note: in expansion of macro ‘SENARY_MI2S_RX’
>   723 |         [SENARY_MI2S_RX]  =  { AFE_PORT_ID_SENARY_MI2S_RX,
>       |          ^~~~~~~~~~~~~~
> /build/stage/linux/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h:153:33: note: (near initialization for ‘port_maps’)
>   153 | #define SENARY_MI2S_RX          147
>       |                                 ^~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:723:10: note: in expansion of macro ‘SENARY_MI2S_RX’
>   723 |         [SENARY_MI2S_RX]  =  { AFE_PORT_ID_SENARY_MI2S_RX,
>       |          ^~~~~~~~~~~~~~
> /build/stage/linux/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h:154:33: error: array index in initializer exceeds array bounds
>   154 | #define SENARY_MI2S_TX          148
>       |                                 ^~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:725:10: note: in expansion of macro ‘SENARY_MI2S_TX’
>   725 |         [SENARY_MI2S_TX] =   { AFE_PORT_ID_SENARY_MI2S_TX,
>       |          ^~~~~~~~~~~~~~
> /build/stage/linux/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h:154:33: note: (near initialization for ‘port_maps’)
>   154 | #define SENARY_MI2S_TX          148
>       |                                 ^~~
> /build/stage/linux/sound/soc/qcom/qdsp6/q6afe.c:725:10: note: in expansion of macro ‘SENARY_MI2S_TX’
>   725 |         [SENARY_MI2S_TX] =   { AFE_PORT_ID_SENARY_MI2S_TX,
>       |          ^~~~~~~~~~~~~~
> 


