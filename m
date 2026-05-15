Return-Path: <linux-arm-msm+bounces-107757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANT+MWjqBmqCowIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:42:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C151754C9F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 11:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 40E083094766
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD6243637E;
	Fri, 15 May 2026 09:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVg+AjF4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ie5XLB07"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51E53F167C
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836957; cv=none; b=AeUIALJ2j5uXDrNiPZ1evbYIwLKFknCVKaFY6GCWPJmBFcqPZ1Krr1XwYycYLcR/+PB+mcDmI9VFAO/uV20rtFnp4XY/RYjhrRSopMBFryGoeMV6eupo/oK9qFwvsGfkJC3+tm++CrpZcUXdWOjRk70tIpk8ZttJmo70U4Y0UCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836957; c=relaxed/simple;
	bh=hF4eh7PcA0A1Lv3JKlJ8+3wozC/fVumc25/5SGMDYl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hJHA97pWhXLnk5hx3QB9x+lDU52fdepfew2CEahJF1Vd7sQgCfxz31X+dt76NXnSBzGEQ0xBBbQDftpLQk/qQx8PHDzCln32lfT+vyudCz0jw5JOyVm0Sps+vISmqzHeDbPc59vIeizSrHW/hqcYL5u+CPT7fo2OPXZmn9I52fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVg+AjF4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ie5XLB07; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F59ImI3797495
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ut9Rue+O79MhAWlyTZLlQHEgaFO1L9dTJk5rA6FaSjA=; b=VVg+AjF4uTbozmyn
	tXlHTBj14BIHKMspvS4qkRXlQyRuNBF5IhPp6UKV3dbFnJ1aNpOrVsBnd+uSyW0l
	a4NLvuhLgQWITViBg2WdL/5S3qIZFjQjWiiS4NP48v9/je+mD4w25WS84V2H+c0G
	X7OD0lMYjgQZLRjdOxJCZY1ZE8688GccFqhkMTxsBtvhntIg1TheKcOBrw6lQuMO
	Ock5RUOJtKkHaVGmEh0eaeCOncNJ3yQAAWlzHNPGnpqCUAT+CKLS+8hTu91ZOhAG
	7J3mrd25im1WpFeXg4Z6brBH6VIp4oxLJ2vUsMmDRGKOe6v9l+UZxuWQwORyKRQk
	8d8jBw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1stjhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:22:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-515224a8aa0so103594361cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 02:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778836953; x=1779441753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ut9Rue+O79MhAWlyTZLlQHEgaFO1L9dTJk5rA6FaSjA=;
        b=Ie5XLB07RCUrdOU6qPnamQp2umr0P295+EG758HFC8o6A28oPReRBKIp9Vlea+fj+W
         5JJXuOLtatlAz3B+SsimZD6F/99La0F/0zF6PX3SVN7N6oP0WsxXivD2RM0Dp9sNztaZ
         QwEc6aRt+yhyeZnt1vTC5PpIDSQYt//MMsHeKqIih08eN0Pe4u6zmZPqmRN4uUnewP0j
         AEVuY9NvzPmNAP/+Z4HG29NjGZfIEiNZXxg0pGn29pjMwlslu/EPc3AW9tud5GytkU3L
         A5+WtiK/AHa/Uy2NSrBtWg9bUccOjAEO6DaQDIlKbpEGJAI8YFpOdhYfKNRFR4opkTnP
         9ePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778836953; x=1779441753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ut9Rue+O79MhAWlyTZLlQHEgaFO1L9dTJk5rA6FaSjA=;
        b=FBk4+nbZG/pgGzaeI8UAjedQzDe/4UbEb5oaamlB+LYimfKidqmEJxFApRbuco6gu4
         OBVfoHvuPXbJnfUZt44UuhJD5OFAWZ70sXopdCspqugAv2YgzCBEIpoiUyOjVAx3+757
         V1KuFdL8jFiltTMMYl4KyrwGWUxi6hwBHbFYL4ZYatnRL3R9Em1y64gJR1TUF2AFKj/n
         VyjVtpHpEtqjxG48rMesCbeV/86158KTdGxWzcyN8FGIuI6LS/jcGYzumun5I3ZwrXSf
         +8PvuL5oQ9ATnDkgg115E83tHD5vPYHJMqGm7HGpyg11LAbCY7LO1AldTEord2PKpYJD
         ElXg==
X-Forwarded-Encrypted: i=1; AFNElJ+CWBQku4tYVTkPfI2DaAqhsjIJCmdfm/QIaNgeX+OhOZk6wjkRYTyHpXuLHzfQD+znR901tPEGjY1l++zi@vger.kernel.org
X-Gm-Message-State: AOJu0YwADTgVjWxKQ5iMo8M1Tiu/nbhjSXRlXkyVMXz5hIVdEH1cjMxE
	cgZyu+tMVnTzqca+bw1zyGZIpXX6zwRp64dDM7BKQsu9AKnFE48E4xz+V1jqZ/Y76NtL5ctQw5M
	2ahqODJnyW1FD24QaIvlSevgmhyFHN9iYOsi94YmlgoDj7HyDshPSP8spxyEee6RSUMlf
X-Gm-Gg: Acq92OF/BDRz3O1Z5cEwxTLXCiZGLSnUVDQj0O/MCdOBgA8isJSHcNMpH+yGl8EXHB+
	jIZj9AWF69RZQBrwO+JIcsGPE/N5rGQBk/JyuMwNAInv7OdSSyEqVLfzLhbGDMSGzKDoxr9pCBR
	Nd8WXZOBmKEOcHDMPlrB1uM/vEzfjlwULyvfEYDrurIpB0IL2hBRWY2hSZ9TyoLCDBjB+v3NpDF
	GntD+9lJf/+0SJuZThrtO6oMqodKn/o50+4WRu28qF+kXrcCHk8gD/+XXCepGBjtHOZNd+43JW1
	rZ6leDU9W2eOveo6FE9orbrl2B9ZIf2OMlwk3q/GQDvU5S2I5twg/fmRsWayJjyQgxYC400B9SV
	K1JFu8g3BVR0+f3oSJxv780SeWenltQjJvFMvHfleGpTJVF8B
X-Received: by 2002:a05:622a:30f:b0:50d:9f33:9a5 with SMTP id d75a77b69052e-5165a02c2b1mr43772541cf.23.1778836952858;
        Fri, 15 May 2026 02:22:32 -0700 (PDT)
X-Received: by 2002:a05:622a:30f:b0:50d:9f33:9a5 with SMTP id d75a77b69052e-5165a02c2b1mr43772231cf.23.1778836952311;
        Fri, 15 May 2026 02:22:32 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fbfsm87785005e9.6.2026.05.15.02.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:22:31 -0700 (PDT)
Message-ID: <16951a6b-0f5a-4777-ad70-8a70ac4060dd@oss.qualcomm.com>
Date: Fri, 15 May 2026 09:22:30 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC q6asm race condition when stopping and preparing the stream
To: Val Packett <val@packett.cool>, Richard Acayan <mailingradian@gmail.com>,
        Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook
 <kees@kernel.org>, Joris Verhaegen <verhaegen@google.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <afS7rTHdc9TyIeLx@rdacayan>
 <DI7G2SF71B39.22LPDZWBG87O9@linaro.org> <afU9FQnWKgRtV6mW@rdacayan>
 <553e6031-9705-48d3-8831-da49b3c67d01@packett.cool>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <553e6031-9705-48d3-8831-da49b3c67d01@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDA5NCBTYWx0ZWRfX7vODfZ54yJ0T
 0vyQzT4Jm3XhJBL5hv4nsi4r24Y49VlJ0vruTHLbnggBlmVKLGNIa81BlsEBUPzBKQLseWhjh+f
 xrnqh2sGVdjGozpzbOpA61H5IhpuP3qgFz1BgsFs2k9e8kIffyySnQC+Cxk+ZlQQFGcezcX+l+q
 rFEUZ2QhlT8DbLWYCKlP8iZYlLB8vVsj/kC/IrOqkBALCxmPTXZPvhKHkgB4D7qQhYCDnn2F5NZ
 n68/bKSfeP4HIVqlPWerAEP8yOmh2AwRsYgLdKwNImqL3Z4JyH+poiMYc30yc1XqYbdkX03HG7b
 32CraVEgxWFSZ/A2YfQ4wvB0hSKeynLFvq/61hjVW4a60ItfCFXkCvnOgQg9KhCboHbICFRVb6o
 q6/uCAlkyQ/68Tlea6dlLaIGExx0JBeddVlDl5NkaOx/wxmwTMFiRGga3iM2IbvVOMFAJb7gZt3
 8+hIKD2uiDAL0asr3Ow==
X-Authority-Analysis: v=2.4 cv=cZXiaHDM c=1 sm=1 tr=0 ts=6a06e5da cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Gbw9aFdXAAAA:8 a=xBXWW545i7Fg7s4S6_QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: sdVBvopFrWeyERVBgeCVzhdCxdlLv775
X-Proofpoint-ORIG-GUID: sdVBvopFrWeyERVBgeCVzhdCxdlLv775
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150094
X-Rspamd-Queue-Id: C151754C9F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107757-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[packett.cool,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,linuxfoundation.org,google.com,renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/15/26 5:59 AM, Val Packett wrote:
> Hi,
> 
> On 5/1/26 8:53 PM, Richard Acayan wrote:
>> On Fri, May 01, 2026 at 04:27:57PM +0100, Alexey Klimov wrote:
>>> On Fri May 1, 2026 at 3:41 PM BST, Richard Acayan wrote:
>>>> Hi,
>>>>
>>>> There seems to be a race condition in q6asm when stopping the stream
>>>> (with uncompressed PCM). When receiving SNDRV_PCM_TRIGGER_STOP, the
>>>> driver sets the state to Q6ASM_STREAM_STOPPED and sends CMD_EOS to the
>>>> ADSP. If userspace decides to prepare the stream again in
>>>> q6asm_dai_prepare before receiving ASM_CLIENT_EVENT_CMD_EOS_DONE, the
>>>> memory-mapped region appears to still be in use and fails to map again.
>>>>
>>>> I believe this race was observed since commit 81c53b52de21 ("ASoC:
>>>> qcom:
>>>> qdsp6: q6asm-dai: set 10 ms period and buffer alignment."), but would
>>>> need to verify. On sdm670, we are coping downstream by keeping the
>>>> state
>>>> as Q6ASM_STREAM_RUNNING until receiving CMD_EOS_DONE.
> Are we sure that's only a workaround and not the correct solution?
> Thank you for mentioning it, in any case!
>>> Do you have a reproducer or specific steps to test/reproduce the issue?
>> I don't really have an easy way to reproduce. On a device with a
>> Qualcomm SoC and q6asm, running postmarketOS with Phosh and without the
>> workaround, waiting a few hours usually reproduces it.
> 
> I haven't seen this happen "randomly".. at least not with PulseAudio,
> but after switching to PipeWire and properly configuring phone calls(*)
> on my phone (sm7325-motorola-dubai) I have encountered what I think is
> the exact same issue many times while doing this simple sequence:
> 
> - boot phone, playback and recording work fine
> - start a phone call, cancel when hearing dial tone (Wireplumber has
> switched UCM profile to VoiceCall and then back to HiFi)
> - try to record mic sound (using the GNOME sound recorder app or
> whatever else)
> 
> Actually just now I managed to hit this right after reboot, without any
> calls..!
> 
> So it might just be "try to record audio through PipeWire and you'll hit
> it quickly enough".
> 
> 
> (*) using the current infamous q6voice patchset, Wireplumber's script to
> switch between HiFi/VoiceCall, and a better setup for starting the dummy
> streams exposed by q6voice: https://gitlab.postmarketos.org/
> postmarketOS/q6voiced/-/work_items/3#note_553107
> 
> The log is usually something like this:
> 
> kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais:
> Buffer already allocated
> kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais: cmd
> = 0x10db4 returned error = 0x9
> kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais: DSP
> returned error[9]


this suggests that we are opening a capture stream that is already open.
Somehow the driver seems to not doing the correct check and closing it
or returning an error when try to open an existing stream.

I will run some tests and let you know if I fund anything interesting.
But in the mean time if you can find a way to reproduce this issue,
please share.


--srini

> pipewire[5347]: [E][02:30:35.781627] spa.alsa     | [ alsa-pcm.c: 2722
> do_prepare()] hw:Motoroladubai,2c: snd_pcm_prepare error: Invalid argument
> pipewire[5347]: [W][02:30:35.781714] spa.alsa     | [ alsa-pcm.c: 2885
> get_avail()] hw:Motoroladubai,2c: (0 suppressed) snd_pcm_avail after
> recover: File desc>
> pipewire[5347]: [E][02:30:35.781771] spa.alsa     | [ alsa-pcm.c: 2832
> alsa_recover()] hw:Motoroladubai,2c: recover from error state SETUP
> pipewire[5347]: [E][02:30:35.781801] spa.alsa     | [ alsa-pcm.c: 2722
> do_prepare()] hw:Motoroladubai,2c: snd_pcm_prepare error: Invalid argument
> pipewire[5347]: [E][02:30:35.781821] spa.alsa     | [ alsa-pcm.c: 2832
> alsa_recover()] hw:Motoroladubai,2c: recover from error state SETUP
> pipewire[5347]: [E][02:30:35.781837] spa.alsa     | [ alsa-pcm.c: 2722
> do_prepare()] hw:Motoroladubai,2c: snd_pcm_prepare error: Invalid argument
> pipewire[5347]: [E][02:30:35.786869] spa.alsa     | [ alsa-pcm.c: 2832
> alsa_recover()] hw:Motoroladubai,2c: recover from error state SETUP
> pipewire[5347]: [E][02:30:35.786949] spa.alsa     | [ alsa-pcm.c: 2722
> do_prepare()] hw:Motoroladubai,2c: snd_pcm_prepare error: Invalid argument
> kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais:
> q6asm_dai_prepare: q6asm_open_write failed
> kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais: ASoC
> error (-22): at snd_soc_pcm_component_prepare() on
> 3700000.remoteproc:glink-edge:apr:servi>
> kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais:
> q6asm_dai_prepare: private data null or audio client freed
> kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais: ASoC
> error (-22): at snd_soc_pcm_component_prepare() on
> 3700000.remoteproc:glink-edge:apr:servi>
> kernel: q6asm-dai 3700000.remoteproc:glink-edge:apr:service@7:dais:
> q6asm_dai_prepare: private data null or audio client freed
> …
> 
> "Buffer already allocated", error 9 which is ADSP_EALREADY, so the state
> is desynchronized.
> 
> 
> Thanks,
> ~val
> 


