Return-Path: <linux-arm-msm+bounces-117912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wjYgLjVdT2r2fAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:35:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 569B572E588
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:35:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="F14SN/P2";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PikIUVBr;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117912-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117912-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CCDFA301F4A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CEA33ED10D;
	Thu,  9 Jul 2026 08:32:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8213ED11B
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:32:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783585950; cv=none; b=JHSBDOXFIBytpy4GaqMmXvTVQ+UCVJDdbU0lhzIwvAuLG3Au8GzyAdVyDEzd1Q+1jnHumFCG0zcjegkO+nAapeBwO1CrCLH5judrCHrSsSdwvBNiGDqwUc+trJQEEf/ZJHi+O78xV8+tGViYTYX6Ck5wVP2L1ALQEzqwu8zUHv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783585950; c=relaxed/simple;
	bh=V0YXLnYwbPTjAP6F5DvVbhUKyuCphnicmr/wDylbkw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKM4CRsJLVQf0yNGdEOg5ZdgL+Y0aky+IUdB0UcfHwEyl65UY3ApNgvG5oN1gE1inek14/k2jPl9zi/cDM/tHC0AX5O2RMepWyIb0ZmjHGJg6QQNzpfthY4tDOCahwpBtI3yLHSfQbL/Ls2P1cIC2dWkJSSuPhRYaGmXuH+QbT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F14SN/P2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PikIUVBr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6695xxPo793755
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:32:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3JFZSW8jxg1xUGpFotteVGsloZBdgsWdR4Ns16niIs=; b=F14SN/P2ZZEPU+vR
	MIMBndaSYEAFgqDT9PDp4xrOKND6zZizHM729CTxuoAwS/Z03uXGeB+SHQAjJ4EA
	hZ4W6cdZiB6PVOg/6LhXmp/qJHJP2kUGBmtPdqjmiYYAITj35qSQTb2ZO4ZPhWTk
	XkxMkbiU2/FGuSWfU3E1KpsNWagTb4m8g5m7i1lz2GcVMmGcDBZkw+LvRVct+dtw
	SQdACpujWhDPyXS4+cIz1GOlH5cDMnJbnzMy7tMerDeApQDfphHabzpy0h1ppsxs
	NlNtEhbf5lLQV2rHcDNX5rmOHv1f9AI8zcY9FHRTA2/7yTzhYtOEz6VvpWm+X0li
	9cmdvw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa1ydsj3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:32:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so1052778a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783585947; x=1784190747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3JFZSW8jxg1xUGpFotteVGsloZBdgsWdR4Ns16niIs=;
        b=PikIUVBrY/xEXaUuyyhjdF7hdXh0GwP0dyeUiRCf46HCWrnCvtTO/yRmBr7F2ys9bM
         Jfuwshlxx0TzmLfuhGf/gBZih1Q9rrm4nGxJsCUzcEX9VaOe7bjLl26F5RgKMgD937eg
         z2qi7iTdREIlnLu7QSochfAh5VyFnUGF85ZrMq252RXsVIsKsgourjsoE5NjiT58rpem
         SVFKOPrDg3/UctPrZcTzQvxgs5KK7ugOv1JKFWbisnPBcembkStDBeV+xQ28KTGjFo3t
         z0BFkkaag1hHjAPbRZSus3riEqocj5rZzVJnqwXszU+zPflrkJP4MvPZpmi4NsoC4Oa9
         bMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783585947; x=1784190747;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3JFZSW8jxg1xUGpFotteVGsloZBdgsWdR4Ns16niIs=;
        b=WBDNNavoA5G3233/qHxJjltEYE3PaMk1QIzorF2SQZjHcMLwtDRmQ7Or7abylnYYVS
         nHgWgvgNL6MGjfC2hjbW+1oMK6di3SxTeBFuwhCNhXXsQz61XVL5O7ZlVcCtdlQ/GiRv
         ATNlYSoV7F3qiE8UcJ/tDOloTm8T0YbzQ0p5mFFT+Y58dm1ZM1LFNkXvPHpoJOA4txe2
         K283Hs0lvbjtk+4Npnx13nxKdG134anu6fZ5VK5/LAJpcCkNkbCOTicE4Jk6+uccbU3L
         3PhKQwaLAIsoyjzimsOkEqDdYkJw93IkmuXU1YhoKh3d0nCuUVnjqlJqLyqHP+28vbAm
         VgsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2XWqSe2brM9qWzLyKk8F54UDcJa7sjLY/SSoQSWXseONWekc4dd4+vJAzHz0Nv74hnnUjP8IhvmoDdT8I@vger.kernel.org
X-Gm-Message-State: AOJu0YyAoBkv0nWEDfzkgWVxDRwwUrD760tGliEXUGK4FVeMBQ4QT16P
	21OJeqbR83O2QfL3n0eCjnbhqC+SAnZMzmRVciBgOlcdAbvcxrVQavBjLtF3txwx80LMrMYudPR
	Djguncta4ivtj46tkw+kBbc3sr0rcvQuKO96nqevfZxZa64pE8NskJoedOsYWiPnJyHiX
X-Gm-Gg: AfdE7cnLWpCH12/A5TtY6hXam0St3JWGlBMaABjUcI3ASltdRN//exB8pGvaMmqyBf6
	R92v1w8gZMcSDCMmu0duImTzvFDwCr7sVnNOpsLWwVhdpImcaUm0CRXqlgzwl0HBqsSw2XL1gxG
	xdOjyFvxjPoW42UxJQ/jt9wCiiqCmagIPnwyRSjc54/dYpohaZCYxKcKkSEQSyt5uKrQHQkv2r9
	dxvxMr3oYpYx3h3CAwPxvaq/6UItos7JIFQCZyvVX8BifWNVaPse5H0jMldR6sypiCrVa4KVhih
	mjQ3yQ07606aE18BwbLCLCU45nlVOMLm5FGq3sTTBLDSPjZVBZH8ahVFNnjGAyqkTsRbrkC/PXy
	+rVFgRY2VqDgHo+9m1L3H66ZDhxX81lBMk0g2SgM=
X-Received: by 2002:a17:90b:584f:b0:386:ca4b:16a9 with SMTP id 98e67ed59e1d1-38b7493b7c2mr1671119a91.16.1783585946851;
        Thu, 09 Jul 2026 01:32:26 -0700 (PDT)
X-Received: by 2002:a17:90b:584f:b0:386:ca4b:16a9 with SMTP id 98e67ed59e1d1-38b7493b7c2mr1671084a91.16.1783585946361;
        Thu, 09 Jul 2026 01:32:26 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a57dc5820sm765039a91.10.2026.07.09.01.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:32:25 -0700 (PDT)
Message-ID: <5344fcd3-8c2c-4b61-a21c-af11550aa8b8@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 14:02:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: qcom: sc8280xp: add Shikra EVK machine
 variants
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260611112946.954172-1-ajay.nandam@oss.qualcomm.com>
 <20260611112946.954172-3-ajay.nandam@oss.qualcomm.com>
 <qcvb4wvfsk6twtvkvkechysrihngaugnhe3po6qbqjrfmqcml5@mn453je73fm6>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <qcvb4wvfsk6twtvkvkechysrihngaugnhe3po6qbqjrfmqcml5@mn453je73fm6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MCBTYWx0ZWRfX3+hz/fXn331I
 QsJ3SLvPsHWuqEjO1jMrYMIX+DRm0HPAOgpItxAds4Z2+nj/osdokVEhCT1DTjPCxeelHdU/Dch
 t29KoDRoav8fxlkSkEmKbNziz0bVErA=
X-Proofpoint-ORIG-GUID: GCkMv1_NCWqKmzPRlgMS31GHyDabPUph
X-Authority-Analysis: v=2.4 cv=cOLQdFeN c=1 sm=1 tr=0 ts=6a4f5c9b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2RTvg86By1wPwCRoaxwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: GCkMv1_NCWqKmzPRlgMS31GHyDabPUph
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MCBTYWx0ZWRfX0dPeTYD6t3qw
 sXkT9Vxz/7KaI7VSJokPZmxaK7lSa0zr2pQTtVPI48z1AKVACssdyJRTdZJ1o6WOfb6H8yX21f/
 tdrEIymL4iVLz4lyRbLeMhCk3/k0QTcWoYAvzK8j+sgRpwFlGvdSmgMWiui8uky9Tatbh+uDgkA
 RkHPC5+pnUf4tSFbDpbVv/Ykgimey28F5WRXmkeBQ03kxaBW4yBX7bRVe/1Bu8+buFMRdtRLeKp
 2zbgjmR81Z5EZTl3ZtEApT4tXs9dHyOvh662m50gr6pwKVSMcPcQq3YYKJm6xicYmOVmrTX1p5s
 CYGMi7zVVm0VjlxsjXDAEwHpk2d/2woskhlQWRWJDmLfCwKBxOl4bfHA5OB31EvMiKnWU61dwNw
 5EELQHqDHaKFsY0n+aR7Mj32mbZmH1MEGeCQ9quSrhWLDouQTtTy06lMVoLp6eza5y5uIc8Qln8
 O3R/KRYdDhG57/GH2FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090080
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117912-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 569B572E588



On 6/12/2026 4:46 AM, Dmitry Baryshkov wrote:
> On Thu, Jun 11, 2026 at 04:59:46PM +0530, Ajay Kumar Nandam wrote:
>> Add machine-driver support for Qualcomm Shikra EVK variants by matching
>> dedicated compatible strings and applying board-specific audio behavior.
>>
>> Shikra platforms are available as CQM, CQS, and IQS variants with
>> different audio components and processing architectures:
>>
>> - CQM/CQS use an I2S-based path with WSA885x amplifiers and
>>    PM4125 + Rouleur codec components.
>> - CQM runs in DSP-bypass mode, where the complete audio pipeline runs
>>    on CPU only and no DSP is involved.
>> - CQS uses modem-DSP based audio processing.
>> - IQS uses a third-party MAX98091 codec with modem-DSP support.
>>
>> Introduce variant-specific handling so codec controls, DAPM widgets, and
>> clock programming match the board design and avoid invalid clock setup on
>> variants where it is not applicable.
> 
> To me it looks like several independent changes being squashed into one
> commit.

ACK, we will make seperate logical patches in the next version.

> 
>>
>> Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/common.c   |  2 ++
>>   sound/soc/qcom/sc8280xp.c | 58 +++++++++++++++++++++++++++++++++++++--
>>   sound/soc/qcom/sdw.c      |  3 ++
>>   3 files changed, 61 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
>> index f42c98ded..32d6c09b2 100644
>> --- a/sound/soc/qcom/common.c
>> +++ b/sound/soc/qcom/common.c
>> @@ -3,6 +3,7 @@
>>   // Copyright (c) 2018, The Linux Foundation. All rights reserved.
>>   
>>   #include <dt-bindings/sound/qcom,q6afe.h>
>> +#include <dt-bindings/sound/qcom,qaif.h>
>>   #include <linux/module.h>
>>   #include <sound/jack.h>
>>   #include <linux/input-event-codes.h>
>> @@ -430,6 +431,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
>>   	}
>>   
>>   	switch (cpu_dai->id) {
>> +	case QAIF_CDC_DMA_RX0:
>>   	case TX_CODEC_DMA_TX_0:
>>   	case TX_CODEC_DMA_TX_1:
>>   	case TX_CODEC_DMA_TX_2:
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index e5d23e244..4c985f81c 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
>> @@ -37,6 +37,25 @@ static struct snd_soc_dapm_widget sc8280xp_dapm_widgets[] = {
>>   	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
>>   };
>>   
>> +static struct snd_soc_dapm_widget shikra_cqm_dapm_widgets[] = {
>> +	SND_SOC_DAPM_HP("Headphone Jack", NULL),
>> +	SND_SOC_DAPM_MIC("Mic Jack", NULL),
>> +};
> 
> No speakers?

We are using the WSA885x external I²S speaker amplifier, separate 
machine-level SND_SOC_DAPM_SPK() widget is not required here.

> 
>> +
>> +static const struct snd_soc_dapm_widget shikra_iqs_dapm_widgets[] = {
>> +	SND_SOC_DAPM_HP("Headphone", NULL),
>> +	SND_SOC_DAPM_MIC("Headset Mic", NULL),
>> +	SND_SOC_DAPM_MIC("Int Mic", NULL),
>> +	SND_SOC_DAPM_SPK("Speaker", NULL),
>> +};
>> +
>> +static const struct snd_kcontrol_new shikra_iqs_controls[] = {
>> +	SOC_DAPM_PIN_SWITCH("Headset Mic"),
>> +	SOC_DAPM_PIN_SWITCH("Headphone"),
>> +	SOC_DAPM_PIN_SWITCH("Int Mic"),
>> +	SOC_DAPM_PIN_SWITCH("Speaker"),
>> +};
> 
> No controls for CQM/CQS variants? Why? Or rather why do we need
> kcontrols for IQS?
> 

CQM/CQS use Qualcomm WSA885x and Rouleur codecs, whose audio paths are 
already described by the codec DAPM topology, so additional 
machine-driver pin-switch controls are not required.

IQS uses the external MAX98090 codec, and therefore the machine driver 
exposes the board-level endpoints through DAPM widgets and corresponding 
kcontrols.


>> +
>>   struct snd_soc_common {
>>   	const char *driver_name;
>>   	const struct snd_soc_dapm_widget *dapm_widgets;
>> @@ -49,6 +68,7 @@ struct snd_soc_common {
>>   	bool codec_sysclk_set;
>>   	bool mi2s_mclk_enable;
>>   	bool mi2s_bclk_enable;
>> +	bool dsp_bypass;
>>   };
>>   
>>   struct sc8280xp_snd_data {
>> @@ -219,6 +239,10 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>>   	int mclk_freq = sc8280xp_get_mclk_freq(params);
>>   	int bclk_freq = sc8280xp_get_bclk_freq(params);
>>   
>> +    /* Skip DSP configuration when operating in CPU-only (bypass) mode */
>> +	if (data->snd_soc_common_priv->dsp_bypass)
>> +		return 0;
>> +
> 
> How are e.g. MI2S signals configured / routed?

In bypass mode, the MI2S links are configured and routed by the QAIF 
platform driver rather than through the DSP path.
The check here only skips the DSP-specific configuration performed by

sc8280xp_snd_hw_params(). The MI2S interface setup required for CPU-only 
operation remains handled by the corresponding QAIF/platform driver, so 
skipping this machine-driver DSP configuration does not affect MI2S 
signal routing.

Regards,
Ajay Kumar Nandam

> 
>>   	switch (cpu_dai->id) {
>>   	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>>   	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>> @@ -239,7 +263,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>>   					       SND_SOC_CLOCK_IN);
>>   
>>   		if (data->snd_soc_common_priv->codec_sysclk_set)
>> -			snd_soc_dai_set_sysclk(cpu_dai,
>> +			snd_soc_dai_set_sysclk(codec_dai,
>>   					       0, mclk_freq,
>>   					       SND_SOC_CLOCK_IN);
>>   		break;
>> @@ -284,7 +308,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>>   	int i;
>>   
>>   	for_each_card_prelinks(card, i, link) {
>> -		if (link->no_pcm == 1) {
>> +		if (link->no_pcm == 1 || link->num_codecs > 0) {
>>   			link->init = sc8280xp_snd_init;
>>   			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
>>   			link->ops = &sc8280xp_be_ops;
>> @@ -375,6 +399,33 @@ static struct snd_soc_common sc8280xp_priv_data = {
>>   	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
>>   };
>>   
>> +static const struct snd_soc_common shikra_cqm_priv_data = {
>> +	.driver_name = "shikra",
>> +	.dapm_widgets = shikra_cqm_dapm_widgets,
>> +	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
>> +	.dsp_bypass = true,
>> +};
>> +
>> +static const struct snd_soc_common shikra_cqs_priv_data = {
>> +	.driver_name = "shikra",
>> +	.dapm_widgets = shikra_cqm_dapm_widgets,
>> +	.num_dapm_widgets = ARRAY_SIZE(shikra_cqm_dapm_widgets),
>> +	.mi2s_bclk_enable = true,
>> +	.codec_sysclk_set = true,
>> +};
>> +
>> +static const struct snd_soc_common shikra_iqs_priv_data = {
>> +	.driver_name = "shikra",
>> +	.dapm_widgets = shikra_iqs_dapm_widgets,
>> +	.num_dapm_widgets = ARRAY_SIZE(shikra_iqs_dapm_widgets),
>> +	.controls = shikra_iqs_controls,
>> +	.num_controls = ARRAY_SIZE(shikra_iqs_controls),
>> +	.codec_dai_fmt = SND_SOC_DAIFMT_CBP_CFP |
>> +			 SND_SOC_DAIFMT_NB_NF |
>> +			 SND_SOC_DAIFMT_I2S,
>> +	.codec_sysclk_set = true,
>> +	.mi2s_bclk_enable = true,
>> +};
>> +
>>   static struct snd_soc_common sm8450_priv_data = {
>>   	.driver_name = "sm8450",
>>   	.dapm_widgets = sc8280xp_dapm_widgets,
>> @@ -408,6 +459,9 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>>   	{.compatible = "qcom,qcs9075-sndcard", .data = &qcs9100_priv_data},
>>   	{.compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data},
>>   	{.compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data},
>> +	{.compatible = "qcom,shikra-cqm-sndcard", .data = &shikra_cqm_priv_data},
>> +	{.compatible = "qcom,shikra-cqs-sndcard", .data = &shikra_cqs_priv_data},
>> +	{.compatible = "qcom,shikra-iqs-sndcard", .data = &shikra_iqs_priv_data},
>>   	{.compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data},
>>   	{.compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data},
>>   	{.compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data},
>> diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
>> index 6576b47a4..0be743cec 100644
>> --- a/sound/soc/qcom/sdw.c
>> +++ b/sound/soc/qcom/sdw.c
>> @@ -4,6 +4,7 @@
>>   
>>   #include <dt-bindings/sound/qcom,lpass.h>
>>   #include <dt-bindings/sound/qcom,q6afe.h>
>> +#include <dt-bindings/sound/qcom,qaif.h>
>>   #include <linux/module.h>
>>   #include <sound/soc.h>
>>   #include "sdw.h"
>> @@ -41,6 +42,8 @@ static bool qcom_snd_is_sdw_dai(int id)
>>   	switch (id) {
>>   	case LPASS_CDC_DMA_TX3:
>>   	case LPASS_CDC_DMA_RX0:
>> +	case QAIF_CDC_DMA_VA_TX0:
>> +	case QAIF_CDC_DMA_RX0:
>>   		return true;
>>   	default:
>>   		break;
>> -- 
>> 2.34.1
> 


