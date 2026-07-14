Return-Path: <linux-arm-msm+bounces-119067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aqpwMOhiVmo+4gAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 18:25:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2450F756E74
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 18:25:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Jus4AScL;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RvMfUGrI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119067-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119067-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C49F3028828
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 16:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC1C34B8DE2;
	Tue, 14 Jul 2026 16:22:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58697494A09
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 16:22:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046176; cv=none; b=d+7i0q/vBOSmRAGsxuoHag3UEngoT5T0T+PGJCl3MwcwNQLneCkgqK+h/GgDdgt7tzI/zaoDOQXboSbruqOZU88zG/HDlXPDSOHZf6rkVXWyMpjs+hBMyJVn8skXQyY/po322GgvoaC9Cl9oA3mHyqNgYjvYkLSREH/3M6LE+AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046176; c=relaxed/simple;
	bh=orJEvHBeXvNZ7hZR15f/uGaIEoW0Eezb+ckb2meJw3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ED8E6vLRqtisTo7xFfuceaVKlsc6JlHw4n6wHfF07xIiv4qhurTo7e9vE94Z4cK9p0AVFyAzKht4INwU0Cdpd5YHLrhyCKwzAaQXIQrjnuNbgqAAGOnJBzFfEOYzJUZaHlZhLdTs5dHwu/xWubsEIs1YUyPcAJFyElAbAnba8cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jus4AScL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RvMfUGrI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG79U5751568
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 16:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A4og9nh2/RMYqtFHRu4SpcNmhnMb8Uyr2PR8ftMNBpY=; b=Jus4AScL6EhMELjV
	YPz07fe3KE9LbkVmXYfP6DQpWJsRHWUV84rqLzMiYemEF2cXVI89YgpJUQeGagsz
	UrZNPiXUR0CKkwM0hIpn42kx4aTFHBPeJ2njIq0P/p0OPPyDdfTI1hHiIIr1Vq/Z
	0jDc4DkaHr4tE4Ot1A66UoBHLdHjasklhRrrAgHCjIipdcQ0BkWLJPSwduQzDevY
	MGk44+hYikzjtBclcYNemvXMu1GeAo8WdbODgmXZmcXhS0oK28GyPFKHm5ou8cGV
	06bQrxPKAHsFBIi9LFy+5DZ4nCYA6MVDcoiEr6WiH7SFQGnnS+HEVRnQSDKtryS8
	Q/ADwA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdesaaked-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 16:22:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so65385801cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 09:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784046173; x=1784650973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A4og9nh2/RMYqtFHRu4SpcNmhnMb8Uyr2PR8ftMNBpY=;
        b=RvMfUGrIAQOynfgQ3gbq3XnMoBCtLm+gJ7OSPy9w9bEQARxT4bOUUnHoJOIPQymD9h
         EKfyH+hbV27twwY9OaNlBfZRQmUA/2Lm4oHwt0nkNenMKTILCTwfwFob3r6QymfR9U+X
         uk9kRA1VLCwc9wxLytPakqlcFL6nmNUIrPFBI8Dkti4s5GJE+mE0mXRcvhF/OiIbg/xF
         HeKsDzxNt4ZQ/Fxk3gnWJPOK3PT/kKnJbhDn7CzCAIeEvDadu2cbTDpS+IzGENdHN1e1
         XX1+7tUZRpshpLGz3acaDojxo/xD3IUUdV2Nr5wJJgF57pUxmoQdDISibkwjkK3gVt4a
         OAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784046173; x=1784650973;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4og9nh2/RMYqtFHRu4SpcNmhnMb8Uyr2PR8ftMNBpY=;
        b=I9psugn5z4BppHqxF7fpOhUR2WJWOAIVNyHlI5JTZTCz5xjwpNeESbfhhs6giES6eV
         Fa4YXAj1rkJ3uo2N9i8oIk+5LfNhelxPgDvb+EpPZFfq7yh9FG1NWgdQrZDGV/EaYiVq
         nK1DbMH5zGLkJyoxoi7GyP3Zbp9cnSJPyojtU8j4rjWY1wgsP3C34dWRa2MW4CEbbIq1
         jlKfEdeefk9jbxCCb95fc0FYrj108MtsteLKf1tM8KIWSKfRYaY47gy/hEN7SWRJCTjQ
         Z8ydkMv1VRFnOTho0FBkgS0sriMw2WQE6KZTm+y3hPh/CTlMoNsxbjZ8ORr8/MTi+26X
         m+/A==
X-Forwarded-Encrypted: i=1; AHgh+Rp977xco1dVpqs4oLtUNXIIusJPJrMHfloR6+t/5O/zWz6plPUIVKK9oI9mwgGI7VnIKmHhCGfi3kuQRXFO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0h7msL+Xg4J3Zie9fL/fcYhMGZG96vkmqW6KyKKf+5NtC4IXl
	bgIDv6w+iDWwWltWYL+UIGIyNka0WddwAc5E8YQcrw/oCoSHiqSM8Mf43hNCow0nX04/k4P0JpY
	hP2wHw0thcsujwR5nCEC3bEvyu+Jw4JvJc/FvyWyXjQdli/kxRKtC37mYGI/oELRrR7kk
X-Gm-Gg: AfdE7clmC9QNYpUDK7A3V58RrBwGXpsn7LKWLTz/OYGhk6y6LupD2A3zW0E0ujfIsjV
	R4mC9v0IcC8s9N1K+HKznEamsTFXz6QyViDDpJ+y3oNgJcJr6jBYGSc7/AtBzGpo2vLminJy926
	IfzxEjkxaSrxcLyLLS6EYPBUv7jWZsv5ZzUO/K2DrZOPMq+FjPQQ69SOKhGR23gw477JLLuPTAL
	Aak6k+v+juhVviBUpg05QfHyKYY9eyN6AG06x+JLs1r74BGiewRzYyAlGUNNqM6ReAdBO7OPeHX
	L54bOH5za2tRPTz8CM/elrNwB8AZgS5s/sEKNrUQN/v6AiOaoTOi1zgVo7OCa+utLH9STKDbND+
	4i2vJPc5+4NMUmGo1WDrGimY0pT61ExGZiTzxiA==
X-Received: by 2002:a05:622a:4d97:b0:516:d781:589a with SMTP id d75a77b69052e-51cbf0c467fmr136395721cf.22.1784046173453;
        Tue, 14 Jul 2026 09:22:53 -0700 (PDT)
X-Received: by 2002:a05:622a:4d97:b0:516:d781:589a with SMTP id d75a77b69052e-51cbf0c467fmr136395341cf.22.1784046172973;
        Tue, 14 Jul 2026 09:22:52 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4950a32b9f3sm98136555e9.13.2026.07.14.09.22.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 09:22:52 -0700 (PDT)
Message-ID: <b099f316-0e30-40f6-8e6d-5717d96fce5c@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 17:22:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] ASoC: qcom: q6apm-lpass-dais: start the graph at
 prepare
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Val Packett <val@packett.cool>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jianfeng Liu <liujianfeng1994@gmail.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260705033830.305907-1-jorijnvdgraaf@catcrafts.net>
 <dee62f9f-1df3-4f57-a072-12b0b4b8a1a3@sirena.org.uk>
 <20260708215539.150590-1-jorijnvdgraaf@catcrafts.net>
 <137a9c85-67ab-434b-880b-d9d4efa5bccf@kernel.org>
 <20260710143214.142017-1-jorijnvdgraaf@catcrafts.net>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260710143214.142017-1-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE2OSBTYWx0ZWRfX5uuGwCW2PT0S
 d1T5dLn3ivpeM0p+Wv3g40ESmohG/HQMOH7tjU2EGDM9Ap9a2h8YRFv7O0eacMQBBm+IKMttfIU
 fxCEdt0ZybfjiDzi2a0gnvmGAoJkPpk=
X-Proofpoint-GUID: O3OEEbLaDJb9otvD-mB5FvxEsLfxUhzl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE2OSBTYWx0ZWRfX8vEygx4FyGwu
 7FHERjxhIikDbQMKusME7LCtE0g8ghTa+ZQsvGReDUFeBjZVbPno/BRCM9BM9SLhxesOULVuN7i
 HTZI5ueJOkp88OVS8GcKk/0aS10OyUvOBgPCs+GWr/TGq/oeXYihvrJ3WKRzxJyqFMrthsv0i9O
 bwN/MlG6EPLq7oLN5FVRCTiWUAz2ES66o8GyiyPlTQ+WtBKqFU1SEDzykm8vgbQ27qW8lORDqD3
 2xlVUlvc0cgECrRHrbn2+svwl69a2ka5vonHmCZSx5iuzbiDLbS7i6/KsnG9VslGE9MJiVxeaDN
 BDy2PhZ2elvxtFDCF6x9MUZVy8wPUDaWi6rpIpg+6AZujmNjqwd1q5cUIwJOxKWUI9eW4xoM9Xt
 1M8o8OrhhUIi3XF2V8ij+hGCggHzuqTC/Ki16KfaG39E788nFRizds02Qrl+u4viLde0CPLKd+O
 ajJAkRFFSj1mRpPH7qw==
X-Authority-Analysis: v=2.4 cv=PZLPQChd c=1 sm=1 tr=0 ts=6a56625e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dKMprGr_ybx22OnWk7YA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: O3OEEbLaDJb9otvD-mB5FvxEsLfxUhzl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140169
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119067-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,packett.cool,fairphone.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:jorijnvdgraaf@catcrafts.net,m:srini@kernel.org,m:broonie@kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:val@packett.cool,m:luca.weiss@fairphone.com,m:dmitry.baryshkov@oss.qualcomm.com,m:liujianfeng1994@gmail.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 2450F756E74



On 7/10/26 3:32 PM, Jorijn van der Graaf wrote:
> On Wed, Jul 08, 2026 at 11:13:18PM +0100, Srinivas Kandagatla wrote:
>> I guess you are referring to the IBIT clk that dsp provides, not the mclk.
>>
>> Could you not enable this from the machine driver?
> 
> Yes - SEN_MI2S_IBIT, provided by the DSP, not the mclk. And enabling
> it from the machine driver is what I tested with the series you
> point at below:
> 
> On Wed, Jul 08, 2026 at 11:18:50PM +0100, Srinivas Kandagatla wrote:
>>> So for v2 I would keep the two behaviours apart per interface type:
>> This is not going to scale, please try to enable the required clocks
>> from machine driver. Pl take a look at this series
>>
>> https://lore.kernel.org/linux-sound/20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> I tested that series (v3) before sending my previous mail -
> the report was buried in a long mail though, so here is the setup
> and result again in a bit more detail. I carried the series onto
> the tree my board runs, described SEN_MI2S_IBIT as the "bclk" of a
> dai@147 subnode per the new binding, and set mi2s_bclk_enable in
> the board data, so the machine driver votes the clock at hw_params.
> The vote itself succeeds - the DSP acks it and clk_summary shows
> the clock prepared and enabled at 1536000 during the stream - but
> the amplifiers' synchronous power-up check at prepare still reports
> "no clocks", and with the graph started at prepare the same codec
> powers up with no bit-clock vote at all. So on this board the bit
> clock only reaches the codec once the graph is started; the PRM
> vote alone does not drive it.
> 
> The question that decides where the fix belongs: is the DSP expected
> to drive IBIT on the pads from the PRM clock request alone, with the
> endpoint's graph not (yet) started?
> 

IBIT clocks should start clocking once we vote for it using prm.
Do you see any errors while enabling this clock?

This week, I will try to pull some wires out and check that on my
hardware too.

--srini
> - If yes, milos firmware behaves differently here and I am happy to
>   debug - any pointer on what to check would help.
> - If no, the machine-driver clock route cannot cover a codec that
>   needs the bit clock during the DAPM power-up sequence, on any
>   AudioReach platform, and some form of start-before-power-up is
>   still needed for such links.

