Return-Path: <linux-arm-msm+bounces-103389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4J8eJQDP4GkkmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:58:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3A340DB6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7B143301023C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 11:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FAD2224B15;
	Thu, 16 Apr 2026 11:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P042HYFU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hLFfJt5i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1C139E6CD
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 11:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340717; cv=none; b=ojEIrN+Ky3PNh11AnvMSuJPg7z4+6YJJYECmiHJVIU6y0FD55cuhBb4YPbk3axUV3ZSJuoTJGKQs+4Ksz7CH1vAjt167ZSZetDZmFUXoJST3Os5Nys6SHqG64yCIqLxzzawOEUxXt76tcjn/MrDlRnD2Vfe6huwPk05J8DqGEM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340717; c=relaxed/simple;
	bh=77Ja5JfEWVlEtGOIIKJ5V6Bh+vocMCKYJem6FucbPq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HkwAFiLeEuFBXHDJzVubtGl6yc2UQf1z5ZB1NbjMSCmtV3nbsTvCpLqJOW35FRtjJurLPBR8wxemVs70kA/KiOIMhUy5BPXj38PaPvbCqZBuSnteOiFpwWaj6O9DZDwU7UVbMGHqj6UWTaEWGxB5B69toNyeQQ37ZlVnCPNyxWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P042HYFU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hLFfJt5i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G7uc9X3733611
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 11:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oOlU9oBUGY7JXAsrTXkxg15NJhG+ysmVPbfw96frUYk=; b=P042HYFUgSGZ4pGS
	TDvSia9TOxbsTGyQ9k94R5YBL3ofeF/6w/AbX4r2C8ozidXvczmJeh9FAQijDdC9
	S1YZWicPUdE4+b3Hdvb+ravHQfg6PCFjKDfd2XDM4hG+GluDjcIWry532/Cm/4mC
	nEcvJRTmZkNFOsTzt96bVLyohoygc7WKrj88rLI2naEHCI6mRZ7lINQy29PcT//R
	M4PlqspSi4p6K25lfQrpeVi1fcflVY+jM/WniFU/W9mL1MSWHfKY6lucdzVFLSCU
	f4Yjc56M4DAhqQBhLg4knbX/JbFAHEY0l+lqH1UWn/aaEQmk1Zgf4oqdEn4n/HZi
	6AfqHw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4djcqwkvhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 11:58:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354490889b6so11408513a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 04:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776340715; x=1776945515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oOlU9oBUGY7JXAsrTXkxg15NJhG+ysmVPbfw96frUYk=;
        b=hLFfJt5i7kq9ArckBhuJvR9FumbwJc38X9ivNcVXssEkdg0Ofn8x8TRhjBdd3e86xJ
         D92GXJstyZmN8tiK9i60Y66f4ZCfc1amViKjcOR/zb2Bl3/nkL1Lih3W+k/do62hLJYB
         4xref+Y2tiKIWHnnqRKaIS2AbmFXLI9TwdU6j3ulww+UlWS6PaXsC2IXhFNoeAr80AWl
         BHQf1Qemgad/tmhB6mhj7UCCKEy/6jr2jt7WLIqIUIaJX8D1lIiscaoF7bDPBeUHJJ1Z
         cz/rjDRdsudnhMpu+DsHKAZ04mtEFmAquBLl8Kcc/989qZAj1f6npnYOmuAelg5IGHsr
         J5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340715; x=1776945515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOlU9oBUGY7JXAsrTXkxg15NJhG+ysmVPbfw96frUYk=;
        b=EYlxFbESYMTgyVzbg8u2xgJypY2zrW7FXGR7yGempx39l88G3i7/5fg109gKySi9x8
         F9WXU7XAaw4oudLJaBQbcG4OxEvZq0j6q6lXda+HFvgDjKsnoMPZaOAgppqkJpwpVGu3
         4KD0AXmc3T5rzstYxS/+TIYNadp8RiZIDcCFb1iQHnlwNll4IuwPQUF5Z7MKZMC7dlLN
         3/TgblLVS+uh71VBD3pLk+YmN1M/zHIVfbbDyDMryrTrsJYqOU5lm2VMLCE+Q5iBg3VT
         N+8yqDO4FkMZaFxVeOU8z9/Q2nzbKmBgxwW8bhmJ+XfeiX9S7Mn+JaberfIqgS7VCiMw
         FZZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9jzfD2+Mu3Tgozq/rxdL/w4OdWBGH9aMuxEvX0xN98ZrBPpNtkVHxTOewOKtKoWS5tnHkR1MB39/dGl43T@vger.kernel.org
X-Gm-Message-State: AOJu0YzeQsBRG2gsI+B5bJXeXoGBKQTZkFQ81BonZC4Eyx5mwGRnW7cD
	Wnri/jaxj49nIz2rVne6pU91JfHXTcjyCqo30rVamLQ3vco2wA999CQOcTJz1Iy5Q6UbmTu6JnY
	QCWEzQF3/KpH+01Ftc5Iyzj7TVeAoMXpVXe3Jj+Cn6s1e/jFMkbwadYV6tr+7NmUQ9b9a
X-Gm-Gg: AeBDieuDHTA7Lw57LOqI+C2ovXpelJTnT+/2WpdMIBN4U5AirYKGFySy2ILO63HyLh9
	FbExijL3woVIHB6G7J2q+JoINYXNiGYEe9L0AZq+S2eX8+HeyTIdB+23X1PMgFotcLLfvnN3D2g
	86XPu0T12OAb68/BepE6sLUOIbXYIQynZcQwRLR1109jMS0AuRVPJQRA0EmVUMTf1Tc0oobPydP
	I7Tx29qSMfmEJAireRKkji/Gdev/9WvCjoHTzS8afepjyvTHtQVfgAtAHxQRTp3wZCYsP+45K4t
	krw7m68z3K21lmQpaLEfTLNXk3XQuOcNTRlxNkU1gqNmjBd0P6cktKrtGmHUdKur5dyEWpxdpgs
	EWKnlBScjuCaDwZXVFy22fAQMwKbJzpil9YrnuYeEaiI3j9TnfQ==
X-Received: by 2002:a05:6a21:338d:b0:39f:5f19:7de6 with SMTP id adf61e73a8af0-39fe3c79311mr29135056637.3.1776340714715;
        Thu, 16 Apr 2026 04:58:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:338d:b0:39f:5f19:7de6 with SMTP id adf61e73a8af0-39fe3c79311mr29135022637.3.1776340714227;
        Thu, 16 Apr 2026 04:58:34 -0700 (PDT)
Received: from [10.219.49.106] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79581c3f7fsm4738041a12.26.2026.04.16.04.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 04:58:33 -0700 (PDT)
Message-ID: <4fbd6b3f-9aa1-4727-96b0-26a3a4c12c0a@oss.qualcomm.com>
Date: Thu, 16 Apr 2026 17:28:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock
 framework for runtime PM
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        srinivas.kandagatla@oss.qualcomm.com
References: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
 <20260413121824.375473-3-ajay.nandam@oss.qualcomm.com>
 <c71d2ce2-e6e7-43a7-bfdd-e1cc1008b3b2@sirena.org.uk>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <c71d2ce2-e6e7-43a7-bfdd-e1cc1008b3b2@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WcnQR33GafIRYsEF6dSNupyx0JdYULzr
X-Proofpoint-GUID: WcnQR33GafIRYsEF6dSNupyx0JdYULzr
X-Authority-Analysis: v=2.4 cv=XOIAjwhE c=1 sm=1 tr=0 ts=69e0ceeb cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=sZWIKnCK8wuD0WYQ-OsA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDExMyBTYWx0ZWRfX7pkfPZhZTaNZ
 4UBFYTIhPVThu+BwCZ43DWvjHjwQxLQZN25aAntZQhoPV0Q0nHG3LeOeKy1rA524oX/7HHpaB63
 nMVnYuIUbvqHYTDmO2YLOhc4yz6LNy9lZJ0bjUnybTanszAGB2rF7a2qMjrzGvoTSG93Wp/ZK5i
 2LSddwU157mmc5e3P/lP5eEndrzgpsuVb1EY+UMtsggEzYeqy9rAuwKL6K30hK5cPO7+c3RCdoY
 VI3BZU5EEVoh4yAuxaIZc2XgnbxSRVnD0TE8sFs3JfonitCdm27fg+ILOjP5R4xvL4IWyGL5ZHv
 kGIwdSYwlG6PJ8Qv93sj6EpJRlrGoqricptbvmyDYE3ZzGqgzHqUzNl80jn5G/4NbmkF+BqRDNx
 tjLMgC9GD5xhJxYSF3j2Gv0WcbGJYnp3YWiBcpXS1Cygg9OmLO5Rk+OqNFouX2Z3XXySZD89Xwq
 mxipTtc+qIFZY0IKsew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604160113
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103389-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C3A340DB6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/14/2026 5:34 PM, Mark Brown wrote:
> On Mon, Apr 13, 2026 at 05:48:23PM +0530, Ajay Kumar Nandam wrote:
> 
>>   	struct va_macro *va = dev_get_drvdata(dev);
>>   	int ret;
>>   
>> -	ret = clk_prepare_enable(va->mclk);
>> -	if (ret) {
>> -		dev_err(va->dev, "unable to prepare mclk\n");
>> +	ret = pm_clk_resume(dev);
>> +	if (ret)
>>   		return ret;
>> -	}
>> -
>>   
>>   	regcache_cache_only(va->regmap, false);
>> -	regcache_sync(va->regmap);
>>   
>> -	return 0;
>> +	return regcache_sync(va->regmap);
> 
> Same issue here (and the cache only mode needs to be reenabled), and
> likely also in the third patch thouh I didn't check that yet.

ACK, will correct in the next version

Thanks
Ajay Kumar Nandam


