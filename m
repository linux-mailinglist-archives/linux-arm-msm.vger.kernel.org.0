Return-Path: <linux-arm-msm+bounces-111400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V+kgHkS2ImokcgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:43:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 15420647D1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 13:43:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fLRWRQnb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eU5ymAlK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111400-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111400-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 84DB5300F77D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 11:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571E7419318;
	Fri,  5 Jun 2026 11:42:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDC31DFF0
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 11:42:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659776; cv=none; b=utG2hnNn+dZqPKz96J6k7PD/Bs9KH43oDwDKDh50nvGjYCZCkYUT047+ne0z7cF9ATENtXO1l1Sw2J1sDtHfHTfEzBa9lfDElmIQd983ndc8LzpBfbiSh3UC88RwGkMFhWd66eiJIvtG902SWy7GmgRYbjyMlEfLgLGtUsyPgeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659776; c=relaxed/simple;
	bh=ZOxNwcAxgJuwesTTu4Buf77BKR829ICvZ5T7AoOiC/4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Qf3tZS/Njlqy8K2xkV8azlCdFdU4ndTJOoMyMsFvbwYlLMwP0VkMsLdAhwFKffPXXkDfOsKTkF8TtaqVNdy19CQ2GkUzYzlmD5FbkQbMTc12BEpsn/wtDDCcgTrjxzW8S40HR4TRweayPCxxk1V16vYrdKGVRjBJWgU0Ar0mezU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fLRWRQnb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eU5ymAlK; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65575VFf1501897
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 11:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uPBjwVOd2SfO6t7DyDLUX6jVgyApWKoQB7ymLnNgC9g=; b=fLRWRQnb9uIqRpAG
	ukdjTNqg1UK7czTwaZSftrfDWsVB4gOyOdssKev1BBTfCexObDS8sotAf8pye4ux
	osNO1Mqnkuf6NsdLDpMiVdcxm4iXidfVr5H5gWaAYgqZdGpPnyA6FP0XhTeNiXm1
	7HO9UCVVKSkhxD2dhg2CIv3v81wcftZqrU3SwYf2cScfUdBQ4qyw71ambXkltgtB
	EygTpxaq343wGgFyAR4V/fHPgacc4AMsbfFQ0d/M68T83X1PzC1+N/WZqNlQs2x7
	lidThsVtAjAPTGU48miKRyrI/tyksrVkbSQRPcrC1i757E960PJv6At4Uqh0ItDF
	Fyzfxg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eksrws1c7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 11:42:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51772325a64so25350541cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 04:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780659773; x=1781264573; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uPBjwVOd2SfO6t7DyDLUX6jVgyApWKoQB7ymLnNgC9g=;
        b=eU5ymAlKQQZnsFZi5MxwOnslMd79bhBIE7fWpSD0emoNO16BewOg6h1fczzzxp8D+p
         5f5kEn4X9D6xuyUqu06iTiQeOjGLoO4/Ym00b0Ypqb+mOMiN2b83wLpczXClOFrhIfe5
         w1XiX9kA92wDpWB0nBqkf2VBVcbhVPMM926qnmruxxtrgjvYwL8nIT5aNH7EQT/gME2x
         ALHx8vH1egl8r0P9WN/g/efjVMRP7uZc56JNehnqyaDC4dxFCrRamXCWqqkrNiatDl1f
         EkD28ZCTCbT0NRZc/G0k0MP009Mn48Amw/u0EtGq7ym3IUbaU0uZUYOsrGyRaQtdGX4i
         0OQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659773; x=1781264573;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uPBjwVOd2SfO6t7DyDLUX6jVgyApWKoQB7ymLnNgC9g=;
        b=gZjWL1A7xJnbu7ZO/6fJT/JMCVyOUQtz3J3MncQE/hV4AMbUoqOSp88is9vLLKPKDc
         SkPavwtpIdpOAfUcs+wgBFgQIW+4IWbIceBBZZZqJeK2olN/gpf5xapyEqfDI86cVp40
         xBWv74Z7G38CwpR3gORIYzfzxu8XSqS6q7GEIYuBTep/U8jUUaphznvxOATryh90JCPn
         0CtTrSzFlxkQf4P2uyGj/xWh9LwzENW4yri0plL/MARTtGs5RLpVvpVddNInJe/6kuiP
         b7jMNjjo7nNBlW6/7T18tzQRHKt3BcbCCSj3LlHkp78xK6wu2quSgohX9GXrtb9Ex+9M
         TcpQ==
X-Forwarded-Encrypted: i=1; AFNElJ8lQKjG6yOnYhe4b2aGHZZy1i7ERmUcHNDyHfVViOi54pV0lXhWAHHbUShy4MroY5UTIEAUUWpdWMb8Q9sM@vger.kernel.org
X-Gm-Message-State: AOJu0Yym86lHCyN/A3UYWjDfbixzWymgeb7T4byOtHuja7X6vVQ4rlYS
	uLsfcq6FbfeR812C5jMAjqmER1BTHwCqn0KaBAmwjAXzsNapb9q0RWXbpf7KzYHW3lDgFrin+wD
	b0ZI71rObYDGQvmVNVpDVwaiIzBWut+7SESmshCDruj0r4LfXVNUCV+8F/CMgY1Y1WgNu
X-Gm-Gg: Acq92OEAS+UtTrGAWXbDC+2IyOtHAweEqopoMRP7BPu8NHHAJayYyTyzqErCdfGwHUY
	bPvfJzX3hViaT249REBtCCGkxpyYtqXyo0BvvRk5mraIBGnWPEHGO9zmoHin4xY359nwTSWbONA
	6WhFe0Vw/TvcWixMDefvi2LNJFWyewWA+KXA1gdWDafFiBXNsxRdIUSJVYaBqpxfkvMiOarS6pD
	OTi42d30EndUnioERK0XSZ6+1b25ReN6Qjv9EuqBhYgQlzO8jxUBIdPmIyNHhOwJaDTAStPPTKO
	8yoI1+NDPChFVISSvTKLoumz9oDpPq7aWN6zDHIgWIuewaVf4b7oVdEtmzsn3b04u/ojynHYwcI
	CoMoybU9Eg2VPw+f3Kr29FTsfal6GysevTtW6BgrsUtDSPYRNjJyMmHaYOE8=
X-Received: by 2002:a05:622a:155:b0:516:cee1:4727 with SMTP id d75a77b69052e-51795aeb96bmr46253121cf.14.1780659773109;
        Fri, 05 Jun 2026 04:42:53 -0700 (PDT)
X-Received: by 2002:a05:622a:155:b0:516:cee1:4727 with SMTP id d75a77b69052e-51795aeb96bmr46252631cf.14.1780659772606;
        Fri, 05 Jun 2026 04:42:52 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm41760570f8f.27.2026.06.05.04.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 04:42:51 -0700 (PDT)
Message-ID: <dda555ad-71e1-4420-beee-eaf6a1ce2c8a@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 12:42:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 00/10] Expand SoundWire enumeration helper coverage
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org,
        vkoul@kernel.org, lee@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        srini@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260605084810.1575539-1-ckeepax@opensource.cirrus.com>
Content-Language: en-US
In-Reply-To: <20260605084810.1575539-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=L5ktheT8 c=1 sm=1 tr=0 ts=6a22b63e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=EUspDBNiAAAA:8 a=EjvMs8CsDyu3LpJ9lXEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDExMiBTYWx0ZWRfXx27QOzUeeWaz
 a8PZi0j0dnXGLMZayOFptbAi95VXqWPeDwSluykMo1LiKJow7LXf+dGRplzwsAiV3lKpIrRwBJq
 9aYtvb3qvr/MgzwMgidgevqzUcskhWK/QsFNUvRjb4PTj19LneKyEv0Mek6rD4KG91BdL9Nf7gd
 ns58o0oPN9lN4YppbZsvyiB+GcfgaLhUxfJg/CCW7kQUwQ02WnJJUtyX3vtK4KLkRGpDP/Nbz0o
 URaBNJB5WsyByeCRD5XstxfSFZj1+fj1sOzm+GnQvxgyhBkkVN4qiDlGROtaGq6jB2t2vm0Lf3K
 dv7aCtPkGNma6L8iyNycuDdhryBtU5YQV+UbyPR86bx0eSZksK/iJvMfnx6HmL8iAw8UEE7CJs7
 1t5Xtz21NHO80udpV6qg30bAVKRClQvMsH0Gk9EexugnTDsO3LAlVNqbo7oztPxqE1FtKnSWZIJ
 3qSK1bnx7u/c7glb/vg==
X-Proofpoint-ORIG-GUID: 2dDBuBL784EhydjboeEc6VOMHLHi8GDf
X-Proofpoint-GUID: 2dDBuBL784EhydjboeEc6VOMHLHi8GDf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111400-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux.intel.com,realtek.com,kernel.org,vger.kernel.org,opensource.cirrus.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:ckeepax@opensource.cirrus.com,m:broonie@kernel.org,m:vkoul@kernel.org,m:lee@kernel.org,m:lgirdwood@gmail.com,m:pierre-louis.bossart@linux.dev,m:yung-chuan.liao@linux.intel.com,m:peter.ujfalusi@linux.intel.com,m:oder_chiou@realtek.com,m:jack.yu@realtek.com,m:shumingf@realtek.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15420647D1C



On 6/5/26 9:48 AM, Charles Keepax wrote:
> The patch series in [1] added a new helper to remove common boiler plate
> waiting for a device to enumerate on SoundWire, however, many devices
> also wait for enumeration during probe. This series updates things to be
> suitable such that we can call the same helper at probe time when the
> unattach_request is not valid.
> 
> There is one final step outstanding which is to add a core helper
> that waits for a device to drop off the bus. This is not include
> in this series and should be the last step of this process.
> 
> Thanks,
> Charles
> 
> [1] https://lore.kernel.org/linux-sound/20260512103022.1154645-1-ckeepax@opensource.cirrus.com/
> 
> Changes since v1:
>  - Completely remove the attached flag from cs42l43
> 
> Charles Keepax (10):
>   soundwire: Always wait for initialisation of unattached devices
>   ASoC: wsa881x: Use new SoundWire enumeration helper
>   mfd: cs42l43: Use new SoundWire enumeration helper
>   ASoC: rt5682: Use new SoundWire enumeration helper
>   ASoC: pm4125: Use new SoundWire enumeration helper
>   ASoC: wcd937x: Use new SoundWire enumeration helper
>   ASoC: wcd938x: Use new SoundWire enumeration helper
>   ASoC: wcd939x: Use new SoundWire enumeration helper
>   ASoC: SDCA: Use new SoundWire enumeration helper
>   ASoC: cs35l56: Remove unnecessary conditionals waiting for enumeration
> 
>  drivers/mfd/cs42l43-i2c.c      |  2 --
>  drivers/mfd/cs42l43-sdw.c      |  7 -----
>  drivers/mfd/cs42l43.c          | 15 ++++------
>  drivers/soundwire/bus.c        |  3 --
>  include/linux/mfd/cs42l43.h    |  2 --
>  sound/soc/codecs/cs35l56-sdw.c | 47 +++++++-----------------------
>  sound/soc/codecs/cs35l56.h     |  1 -

Thanks for the cleanup,

For all below Qualcomm codecs:
tested on Lenovo T14s.

>  sound/soc/codecs/pm4125.c      | 11 ++-----
>  sound/soc/codecs/wcd937x.c     | 11 ++-----
>  sound/soc/codecs/wcd938x.c     | 11 ++-----
>  sound/soc/codecs/wcd939x.c     | 11 ++-----
>  sound/soc/codecs/wsa881x.c     | 10 +++----

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


--srini

>  sound/soc/sdca/sdca_class.c    | 53 ++++------------------------------
>  sound/soc/sdca/sdca_class.h    |  3 --
>  15 files changed, 41 insertions(+), 160 deletions(-)
> 


