Return-Path: <linux-arm-msm+bounces-118656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nK2hLyCVVGpinwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:34:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF8774833A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 09:34:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=k3BCZdCm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=CyhWVq44;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118656-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118656-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCF2330578FC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5F1037204A;
	Mon, 13 Jul 2026 07:28:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1137F382397
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:28:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927733; cv=none; b=m3zs71r5p3cG1galY75s+5DwwnS1boEAi6TBV1p8C6DIqmtGRuDXNQpziozNObKszO1uP6bhefxqgtfaKH+0n+UKuTvsJ8phVBQeqFYCDTjx9AimrSN0BLxQf80oCR6GXXVI24wdPrMMAk8701UBVp4AY6DqS3SupRR68t9ICdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927733; c=relaxed/simple;
	bh=rGDsrjx6/tEefZaGByxTg7MZGD+3gZaunHci4Ij2f20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dE/mFFb8i8+DXYLOcj8syBWtaNLLiNqpDNZSFjf5Jh8/WySKXt29MHrheb6uxjA1jKqtuMGs60o+yaiyx6ByORp+SyLuz1KV5arLOl5weJUdF/spP+iEtUdLO6XAnuWv0jvDdCeVmpaOJHaL7Zyw76ZhNqFcvjg95cOnA1NO7cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k3BCZdCm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CyhWVq44; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NiHI648383
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOCzC1B5qGhA0DDlrlvVv19f/QDxmZmVqlO5kCPP8do=; b=k3BCZdCmCzGgeTAI
	bEUoMtrGCwWJGfuUqy946ZPHK/PmRpxmbJsjcpySR+SyFYCGRiXBBdoRZP/q5FzA
	yEiL+ecuNVCDOHmtY+mS9QnL77qT3C1ycou5tPUPhmw8wp9/tYDQK9FHJculwhh1
	TWu3Hzw1QER5CDwBrGlv8IHs4vGBUGliOCmzLmqlY2CfttsYg7Nu6cyf59X0IvTw
	dLI8M5Q/Xp3ijTwEWGhrCGVo6/IKJdqWmT85/wUluOgCnbYvia+hkwL8rBtgOgUH
	DmARoohC3Hut6PYyyVM2GGYAbYIkQVlpJ6Si6gvXRP3vjIkXhf9mwQnXyaFSpwiv
	QTPIpw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr4uu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:28:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a97644aso46302831cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783927728; x=1784532528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOCzC1B5qGhA0DDlrlvVv19f/QDxmZmVqlO5kCPP8do=;
        b=CyhWVq44BfHtuvEFjHLqzDCNPjJoKCXAF4K/oroApBKdLo71/lyOT3XFjbm5yqRMNJ
         f/LQQcA1xg9DPKKMRXf8/NZK0smQcToV7cHcVFbkg1FPvGcT1agWCmi6JolHwpHIruSk
         Z+ThML2NZRqPWVJVQXViU/CRuqyYHAC+OtTJSk8VztZjPOR4bekIbdHDnzb4Y8us25ig
         VC/+1vYCpMgVm4s85lIeZEwAp3mP8DSnVm2yqiBqFpoHO2x26c4XrqK6Nx2WHrKhP5X5
         lPz1w3XmZxyLIYtHdAwOVBIvlidrww/UNGnLociaJoRBG9XNFHayhe/Z96g1CHV3P7jY
         N6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927728; x=1784532528;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOCzC1B5qGhA0DDlrlvVv19f/QDxmZmVqlO5kCPP8do=;
        b=DJigwCforpOl6HM5uwUUAJqWaE//cMkZgUYMZm+Ulh4vYysL1qsaoqMgdwFHOmicke
         qrXxGH92hc6rBtYWrhoD3bW7u0D4W1rV6N68nooZcpl9MJHudQJYqviKK77Zp6sSAgUN
         UzamfTlRYZ6CIxvmEcGtVx4K4D9GLFEpVUJtlHx3POxZ/TT9Xwy2vQMwV86ECXiaVvwu
         Kpxpzvnewx12C/qrqUXtVmg3l214lmOumrp9WZVqwL3n9tjbcbaBFiDc+TSmU9jqC2pJ
         WZ2tZw1z2F3eU+J08nxn+S0SL3mY112bg/MS2vjlucPEiXwQLl3iXIpRYL7wzBdj8WP6
         LMzw==
X-Forwarded-Encrypted: i=1; AHgh+Rrb1I9Iyow5csCES5mGXvyEfiCaO6NzegPxWZXipgaMfwJ4Iu6cWcY2Ehl+Y9E/ZFFOjfV1xJLyx97Kr3PH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/VA2sx4wqo/1k7trT1dAkc4qToadVD10uHWmaGUoIf+myPYA/
	G11rTN7YajShv68pmpUCRQGD/vctbQMHEAm8+b0dV8xcersscEoYYgfsWRuCuciqcwouao54/x7
	QDO5G/HvKPC+bKCGf6qpIpaKo9nQhhGOEUk60ffCDvSdl7P15p5Sd3B32Kw/dvZfHgfKP
X-Gm-Gg: AfdE7clpIrbKAOUJLHtq84fCxy/BtvCgat6us8vJfXoGyl3dSThbvz/tdpNXS3QHY4k
	bpUFfzP0LhZ5zyFMw4N/gI9rOo/EuHWFpay1ZNP4VgtpE1bJKEpfhV+mXyIUDisaV3lWe1pFfnI
	IvE6LN3lfrrD1sf49e8NMeFm6qM+lWT1aPsrtnjs1zcGUS/N6ctDEBY3+QXQB1rNt0paK4QcI93
	B4nIxpidnukU1gGu625pvkW4RybG610KZO9+NDQGcFPJddBWpbInvvD8HgOy2ugBjDEqlu9l56F
	Bs/WalFTTpDDfYbV09YJI0NKop0RwrjCewg2m5pfoJuwMWyxrf9e5YlB2kOE9sKcqMDmxyq0KdO
	F8UGgr4x5G8RV4sSmnRKVXs/MIkb1+VdRzxUvnQ==
X-Received: by 2002:a05:622a:1207:b0:51b:fdbc:86ce with SMTP id d75a77b69052e-51cbf1fb365mr80402141cf.52.1783927728166;
        Mon, 13 Jul 2026 00:28:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1207:b0:51b:fdbc:86ce with SMTP id d75a77b69052e-51cbf1fb365mr80401841cf.52.1783927727629;
        Mon, 13 Jul 2026 00:28:47 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d79906sm15112119a12.14.2026.07.13.00.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:28:45 -0700 (PDT)
Message-ID: <f484f295-f454-4a19-bd3a-cd0db5d5f970@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 08:28:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: codecs: wcd9378: add TX/capture codec driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706192229.144137-1-jorijnvdgraaf@catcrafts.net>
 <20260706192229.144137-4-jorijnvdgraaf@catcrafts.net>
 <d643de20-50db-4f5c-a803-f1737da253fe@linux.dev>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <d643de20-50db-4f5c-a803-f1737da253fe@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX9QlF6D4Ai9wn
 1uAYG0aiX4owQktaWF6t87I+VEmexvekpM/Y2t3ex/cROGwIK7I/wiQoMDlkbfPHjGRCzzJEb+F
 vkGvZh5UPdtF+GvxVyoUBx2Agio36lc=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a5493b1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=et_PxPiEQ3Igji31-sgA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: BIhhb2yl2kWoLr0IEsQM1WgiGBzDmeLw
X-Proofpoint-ORIG-GUID: BIhhb2yl2kWoLr0IEsQM1WgiGBzDmeLw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3NiBTYWx0ZWRfX1/qA3zWCbWbQ
 Gbgdvr3F9UPaO8wpvW6gEoO3hURqgQ1UB4+nMvJMO4pazi8EwcfmAzB4j59hg8kl/jnBoQE3X+5
 v7GLS+T+BXSu+/6AMCmcDvnGNQdWF/cXUg0tLsJXGVDmRt7B4d1RTZpTpVVbG1NDe1/YBb3SaxS
 z4+W3vEMZctxmAh4alCIoe1TO24NUtBMHVJW2rxXPs7pzxYD00Za+nhb3Ry9nAzf2qj61i9P0sj
 7ysYcMpaxQVmsXvvhIqSanTNURa3ZVErcEK19k7Y4s8lbNgjyLppLCKtWNBGM7LMbRH0He5WUzz
 FW76Bm6MY/05gLQPbh9YOGmW8RK6cAYCq2nd056g69mAsYnOdbLO8EO/+gERylMInMconeAV1pd
 vRGpubECIb/rY0VmIyZvxYhWkGY6MhyHrt2XZ7WxHqbRBLLKFlVPL9Sbonzh4FVzv++uyrhgOxf
 d7vYsZB9vEruDcD6EQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-118656-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pierre-louis.bossart@linux.dev,m:jorijnvdgraaf@catcrafts.net,m:broonie@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:luca.weiss@fairphone.com,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,fairphone.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EF8774833A


On 7/7/26 12:42 PM, Pierre-Louis Bossart wrote:
>> + *
>> + * Qualcomm WCD9378 audio codec driver.
>> + *
>> + * The WCD9378 pairs a WCD937x-compatible analog core with SDCA-style
> SDCA-style or SDCA-compliant?

This codec is SDCA compliant and used on X2 Elite Windows laptops.

This Codec can be configured in two modes, Mobile and Compute, and this
configuration is fused out.

The codec IP is the same in both modes; what changes is how the
host-side SoundWire master setup.

The codec itself has two modes of working.
1. mobile mode
	in this mode the codec is enumerated as two slaves(tx and rx) on two
different soundwire masters (tx and rx), like any other wcd codecs.

2. compute mode
	In this mode, where the codec is enumerated as single slave on primary
soundwire master. Two Soundwire controllers(primary and dependent i.e tx
and rx) are aggregated and they act as one logical SoundWire bus with
four data lanes. The primary alone runs the SCP control channel,
enumerates the slave, drives the bus clock, the secondary follows. The
secondary drives some of the data lanes. There is a hardware sync
between these two. This is a new configuration on Qualcomm Soundwire
controllers called multi-master.


From Codec pov, its exactly same IP, I have now SDCA drivers working for
both playback and capture, so Am hoping that we could use the same SDCA
driver for both of these modes. I still have to give it a try on a
mobile platform to verify this.

Am hoping to send a version of this driver sometime this week.

--srini


> 
>> + * function blocks (SmartMIC0/1/2, SmartJACK, SmartAMP) whose built-in
>> + * sequencers perform the analog power-up/down autonomously: capture is
>> + * started by programming the ADC usage mode (ITxx_USAGE), requesting
>> + * power state 0 on the function's PDE, and letting the sequencer ramp
>> + * the micbias selected through SMx_MB_SEL.
>> + *
>> + * TX/capture paths only for now; RX (earpiece/headphone), MBHC and the
>> + * SmartAMP function are not implemented.
>> + */


