Return-Path: <linux-arm-msm+bounces-112658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9mTrIBN6KmqoqQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:04:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA8A670281
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:04:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RAgszpid;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ew4Wtjju;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112658-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112658-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 201F6330979D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 08:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4859C3BE627;
	Thu, 11 Jun 2026 08:58:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F46F3BE63F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:58:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168312; cv=none; b=QAHRrffmBeOwGkEmXSpHXC/1RjCQoPT/c/ZdYQ4zWmSwujl+lZgRjCDzt+aJlNmQUIXkxzwOfK4RMyssGV+90V9ASMYBIhoPhDq5ny75Ujd9n+aT3ac2Rt2L1D2EYLKhOzGFRr0ftWN37T8uJreb+fICeVJE8isPU/ergYVYnZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168312; c=relaxed/simple;
	bh=mI/8ZphOjVkx5i+g3xIRJFD8OQDPZ0GYhaoqzYYBrtk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Olqz5nYQYPP6t/RmAJoDD8bX7PtWlbWBBuX+UKX2E7PjRw5PpPAWv8+t8/htQhVL6kBfaxDKgHl/1oasnZcx/nYGzXLnXbSgWT4aTQmnEsBgsefE8HgwAoXk4u2i1S/f4J4zI9D9Sh2f0htX1YFbwRXgcnAf29h+Tn6eEjCRodo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAgszpid; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ew4Wtjju; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B5GMl72248055
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J89jt7hEBTdccCcfXrl7mjZxNk80DvIU8NItUEa80vw=; b=RAgszpidLCjzuAgv
	BtjWdwi+p0hkphBCiuTRBV8HsbCv3916ztSSl9npftnBNIeChn+Hxy9c3DwS+A4A
	oZIty10E/e6DgeXaNuCxBHUiEzub00YJ3D69+CXmCFTjzpJTrJec8xz2Mn0MfzQm
	nAgYDKZE21rGeJ9/obLA8veiyXapSCQf29wOSMPaNUn26YIsRGPgaqCalprT/iCx
	KOZnPtOgGAqEMYct95zj+9a8jF1MXQXwwZXF8ByKruHdaRpvvwxDII0k4EXbMoxL
	QOE0h0K4cyd96jldJMXFZIs/NW9fatr1jl8yn1tJodGX5Em7ykbF4O7WKXy5BGuT
	Sr+oVA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79jhd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:58:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5175aa1a54bso170216801cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 01:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781168307; x=1781773107; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J89jt7hEBTdccCcfXrl7mjZxNk80DvIU8NItUEa80vw=;
        b=ew4WtjjuO02pSotVs55VqYuJUqyPk5MhHw3UZrwmIIsPBSk5xvLZa90jzOxR0ErEzn
         VtNi52WpZPKTwRe4Nv6jO//N1lKomaUc7sDihyNVqnM88SPgL3anU2FTG0eaz2wEYNCv
         lMUzgYQfJNYjudURJuoN8cRwfHSBI6VB43bM+J67pLLFf4XozD/BGx0OawywW/o8dCws
         9BcflidnB9lTIKZ/zW/rZjspxKMbolr+xvGcB8tqMFs+BnYeycBL5u0bqfYJNaiKuKyk
         8moGmN4oQGdusWIWwUlTVwe85qczbp5q4wo/bMikLc7ioRe50e5fHZ0Vjly8B3maK/py
         I+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781168307; x=1781773107;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J89jt7hEBTdccCcfXrl7mjZxNk80DvIU8NItUEa80vw=;
        b=SnHmwxo6rD5NCHtDkCNsZXbuM3gsTnQP9X0grKtOvjVH++gmtONJA/mip8k3w2MMoG
         7G1WDcuWX4jH9EXZ5kuq8tfCJH9KbK4PtpAU1DbRS7hD5PL6K3XyzABfGgxUZVnYV5rh
         ikJEHBsYdOHppE8lzl5JRi33snbQXfk+E9RKqmnlFxHu10dJ1AUqcBEwkiFzLjyVFrDr
         fRLGKreFTtKMEojl4NuO7kTwYyjKIZLghoSMKuD5Tasw0TJ8EpjQ7a6tgaS63xG/zOXo
         bNbvmh8bLjlJ9kyWLE8AhgC0cQk9ykfvW2ts2425QTBWljwU1lWu+aMlYQk4ay+BeaJ+
         mHHg==
X-Forwarded-Encrypted: i=1; AFNElJ8D7KJrwL1BuQxZ/wMFnbE5E7545hVUycqfPSWlWJRnzbddKJ85gsxyWbLan+JRwMi6rNSlVX9b49eB3KBR@vger.kernel.org
X-Gm-Message-State: AOJu0YwEtjCtgj4M5EhZILyomIl5yGhPxZ80BL4SGqkfilA7duom8W4G
	SIn8A+yma6iCCFjSdq2slun0Xc3PAhGKY185pbZnnOrw9jgDF+hdMwOVmONVoGCgd98uuP4WxoT
	vurRNcCI3rXJD8Hxx8FRwRBQQBSX5vIJofYdBYnyWXLw31/CGgp7h77TMh8EiKAGDYwa1
X-Gm-Gg: Acq92OHjuknIPw7toiOBui315B/+aYxaokRD/58f4N4Iailz1wiQJjQdzylp0wt0JBS
	kvkrKTwIm4lieeYtubWAuTk2e8+N3vN3qi4bZSIguEUGJGp2SYPJbTd54GuRZN7xGkwnUe2OPco
	WIlcQ0lAdgYjLCYF9oWVWEOPqTrUj1CRrsHtQh8vbKWoQpECHeywwP5x/F62IG7WlHWQ9cjiTdd
	U/fS+V8+bR7gzdhgZllkAgzIw1ZItE7seEqTlq53GLFkxtms+W0EOqU5UXd5GkCIHeOneOtBbLA
	9zDbNOjoScfdaWWtZ14MotSnNjULtlZtaS1XbJB9cra/l6aQJzZEk6NA8IcPc3JlZh1lVOK8A8v
	1MvNpTo34Y9e+X4KrbF220h6XkorK+ttlS+dzP+eywaXKddwpNgVefLA4OPI=
X-Received: by 2002:a05:622a:1ba9:b0:517:96f0:5663 with SMTP id d75a77b69052e-517ee1c3dfamr25616151cf.36.1781168307158;
        Thu, 11 Jun 2026 01:58:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba9:b0:517:96f0:5663 with SMTP id d75a77b69052e-517ee1c3dfamr25615721cf.36.1781168306602;
        Thu, 11 Jun 2026 01:58:26 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-68e6595c72esm10314541a12.23.2026.06.11.01.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 01:58:25 -0700 (PDT)
Message-ID: <94afd853-d203-49e4-8faf-7b47c906d1c5@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 09:58:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: qcom: x1e80100: Allow userspace WSA RX channel map
 override
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610-sound-qcom-x1e80100-allow-ucm-channel-map-v1-1-9339724994f5@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260610-sound-qcom-x1e80100-allow-ucm-channel-map-v1-1-9339724994f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: moPawPUkS7vg9z68F1vtA4PuVkQ4SkvI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA4OCBTYWx0ZWRfX5/5PG5WnOzoK
 vodvwjKMS84rZWD40vhtACK2o/YZ3TULajHBGykm/bwCYq/LfZvYaNlPmu9Md2dUk4PseuRJmd1
 jCH+KUcIOBltHSZ6KO+7yNzutPPliGG2QKNUX+KcwaVRX8tOWJhEcdDPdumTW1AzkWTbvAaLyBn
 DmGifuKA3+Wxswf9bpQysdAkN0MqnjpX3Oae1B1+0pggvdBEAh5KAzCB/uxMbDLgIzb1AThjxDa
 yRYYHChrPusKR+ZIN30SsQg6CrUiwgaqGXOl6xypvOHoEYwZXMfMUEUP2Q8cgve36lHHVeloY4A
 B9ujcI99kJS0ftBKnszAbGgxvlkSbEuyNvC00qXasn+0q4MRsZH3/wH76kU7oRNNVJ/Ye9R/Cbx
 dScNQYDjK4JX9wFxfDD7RMS6QfxIzZ9pYTgBTI4/rQTnEI1TcDkukLmVfphyCN2Z8MCECLbBIOX
 Pc5fK6Lq0w5O3EL8rqA==
X-Proofpoint-GUID: moPawPUkS7vg9z68F1vtA4PuVkQ4SkvI
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a78b4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=t7-jdfXkhZF3nOVpTTAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA4OCBTYWx0ZWRfX9OMaL78NSurC
 pZqu8vBr+ANRAo5oTwAxK48ByFaXwBZ4hX9rHqPrqk5Us14C54aho040kf0mPGQwWwdcu7P/kGP
 l9pLiP2XPbcvolR6xvFWhdExDsJbRN0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112658-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:abel.vesa@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:neil.armstrong@linaro.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,knew.name:url];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCA8A670281

Thanks Abel, for the patch.

On 6/10/26 12:16 PM, Abel Vesa wrote:
> The WSA RX slot mapping is currently computed entirely from the channel
> count in .prepare() and pushed unconditionally via
> snd_soc_dai_set_channel_map(). Userspace has no way to express a different
> channel map, so any map defined in UCM is ignored.
> 
> Add a writable "Playback Channel Map" control on the WSA RX PCM via
> snd_pcm_add_chmap_ctls() and make it writable. The map selected by
> userspace (SNDRV_CHMAP_*) is stored per AFE port and, at .prepare()
> time, translated into the q6 PCM_CHANNEL_* slots and programmed into the
> DSP.
> 
> When userspace has not provided a full map, the previous default
> mapping is used, so existing behaviour is preserved.
> 
> Assisted-by: Codex:GPT-5.5
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  sound/soc/qcom/x1e80100.c | 152 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 150 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
> index c81df41ace88..63cd00620ade 100644
> --- a/sound/soc/qcom/x1e80100.c
> +++ b/sound/soc/qcom/x1e80100.c
> @@ -15,14 +15,105 @@
>  #include "qdsp6/q6dsp-common.h"
>  #include "sdw.h"
>  
> +#define X1E80100_WSA_MAX_CHANNELS	4

this is not the case anymore, we have 6 channels on Glymur.

> +
>  struct x1e80100_snd_data {
>  	bool stream_prepared[AFE_PORT_MAX];
>  	struct snd_soc_card *card;
>  	struct snd_soc_jack jack;
>  	struct snd_soc_jack dp_jack[8];
>  	bool jack_setup;
> +	unsigned int user_chmap[AFE_PORT_MAX][4];
> +	bool chmap_added[AFE_PORT_MAX];
>  };
>  
> +static const struct snd_pcm_chmap_elem x1e80100_wsa_chmaps[] = {

can you not use snd_pcm_std_chmaps instead ?

> +	{ .channels = 1, .map = { SNDRV_CHMAP_FC } },
> +	{ .channels = 2, .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR } },
> +	{ .channels = 3, .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
> +				  SNDRV_CHMAP_FC } },
> +	{ .channels = 4, .map = { SNDRV_CHMAP_FL, SNDRV_CHMAP_FR,
> +				  SNDRV_CHMAP_RL, SNDRV_CHMAP_RR } },
> +	{ }
> +};
> +
> +static int x1e80100_chmap_to_q6(unsigned int pos)
> +{> +	switch (pos) {
> +	case SNDRV_CHMAP_FL:	return PCM_CHANNEL_FL;
> +	case SNDRV_CHMAP_FR:	return PCM_CHANNEL_FR;
> +	case SNDRV_CHMAP_MONO:
> +	case SNDRV_CHMAP_FC:	return PCM_CHANNEL_FC;
> +	case SNDRV_CHMAP_RL:	return PCM_CHANNEL_LB;
> +	case SNDRV_CHMAP_RR:	return PCM_CHANNEL_RB;
> +	case SNDRV_CHMAP_SL:	return PCM_CHANNEL_LS;
> +	case SNDRV_CHMAP_SR:	return PCM_CHANNEL_RS;
> +	case SNDRV_CHMAP_LFE:	return PCM_CHANNEL_LFE;
> +	case SNDRV_CHMAP_RC:	return PCM_CHANNEL_CS;
> +	default:		return -EINVAL;
> +	}
> +}
> +
> +static int x1e80100_chmap_ctl_get(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
> +	struct snd_soc_pcm_runtime *rtd = info->pcm->private_data;
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +	unsigned int *map = data->user_chmap[cpu_dai->id];
> +	int i;
> +
> +	for (i = 0; i < info->max_channels; i++)
> +		ucontrol->value.integer.value[i] = map[i];
> +
> +	return 0;
> +}
> +
> +static int x1e80100_chmap_ctl_put(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
> +	struct snd_soc_pcm_runtime *rtd = info->pcm->private_data;
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +	unsigned int *map = data->user_chmap[cpu_dai->id];
> +	int i;
> +
> +	for (i = 0; i < info->max_channels; i++) {
> +		unsigned int pos = ucontrol->value.integer.value[i];
> +
> +		/* Validate every requested non-unset position up front. */
> +		if (pos && x1e80100_chmap_to_q6(pos) < 0)
> +			return -EINVAL;
> +
> +		map[i] = pos;
> +	}
> +
> +	return 0;
> +}
> +
> +static int x1e80100_add_wsa_chmap_ctls(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_pcm_chmap *info;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = snd_pcm_add_chmap_ctls(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
> +				     x1e80100_wsa_chmaps,
> +				     X1E80100_WSA_MAX_CHANNELS, 0, &info);

This will give mixer control as "Playback Channel Map", can we prefix
this with WSA, as this can be cryptic for user side to interpret
Playback Channel Map as a WSA Channel map and also if we add more
channel maps for example from hdmi codec we will endup with something
like on my t14s:
numid=136,iface=PCM,name='Playback Channel Map',device=16
numid=141,iface=PCM,name='Playback Channel Map',device=17
numid=146,iface=PCM,name='Playback Channel Map',device=18
numid=152,iface=PCM,name='Playback Channel Map',device=19

This is really confusing, with below patch
you should get:
numid=136,iface=PCM,name='Playback Channel Map',device=16
numid=141,iface=PCM,name='Playback Channel Map',device=17
numid=146,iface=PCM,name='Playback Channel Map',device=18
numid=152,iface=PCM,name='WSA Playback Channel Map',device=21

Clearly giving users more clear picture.
Please use this patch and let me know I have tested this on t14s along
with your patch and making some modifications to it.


-------------------------------------->cut<----------------------------
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Date:   Thu Jun 11 08:12:17 2026 +0100

    ALSA: pcm: Add snd_pcm_add_named_chmap_ctls() for custom control names

    Add snd_pcm_add_named_chmap_ctls() to allowing allowing drivers to
    register channel map controls with names other than the default
    "Playback/Capture Channel Map".

    Signed-off-by: Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com>

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 76fc33dce537..2a51f7c02dc6 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1501,6 +1501,12 @@ extern const struct snd_pcm_chmap_elem
snd_pcm_alt_chmaps[];
 #define SND_PCM_CHMAP_MASK_246 (SND_PCM_CHMAP_MASK_24 | (1U << 6))
 #define SND_PCM_CHMAP_MASK_2468        (SND_PCM_CHMAP_MASK_246 | (1U << 8))

+int snd_pcm_add_named_chmap_ctls(struct snd_pcm *pcm, int stream,
+                                const char *name,
+                                const struct snd_pcm_chmap_elem *chmap,
+                                int max_channels,
+                                unsigned long private_value,
+                                struct snd_pcm_chmap **info_ret);
 int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
                           const struct snd_pcm_chmap_elem *chmap,
                           int max_channels,
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index fe597f7d522d..7dae270eaedc 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2572,9 +2572,10 @@ static void pcm_chmap_ctl_private_free(struct
snd_kcontrol *kcontrol)
 }

 /**
- * snd_pcm_add_chmap_ctls - create channel-mapping control elements
+ * snd_pcm_add_named_chmap_ctls - create channel-mapping control
elements with a custom name
  * @pcm: the assigned PCM instance
  * @stream: stream direction
+ * @name: the control element name
  * @chmap: channel map elements (for query)
  * @max_channels: the max number of channels for the stream
  * @private_value: the value passed to each kcontrol's private_value field
@@ -2583,11 +2584,12 @@ static void pcm_chmap_ctl_private_free(struct
snd_kcontrol *kcontrol)
  * Create channel-mapping control elements assigned to the given PCM
stream(s).
  * Return: Zero if successful, or a negative error value.
  */
-int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
-                          const struct snd_pcm_chmap_elem *chmap,
-                          int max_channels,
-                          unsigned long private_value,
-                          struct snd_pcm_chmap **info_ret)
+int snd_pcm_add_named_chmap_ctls(struct snd_pcm *pcm, int stream,
+                       const char *name,
+                       const struct snd_pcm_chmap_elem *chmap,
+                       int max_channels,
+                       unsigned long private_value,
+                       struct snd_pcm_chmap **info_ret)
 {
        struct snd_pcm_chmap *info;
        struct snd_kcontrol_new knew = {
@@ -2611,10 +2613,7 @@ int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm,
int stream,
        info->stream = stream;
        info->chmap = chmap;
        info->max_channels = max_channels;
-       if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-               knew.name = "Playback Channel Map";
-       else
-               knew.name = "Capture Channel Map";
+       knew.name = name;
        knew.device = pcm->device;
        knew.count = pcm->streams[stream].substream_count;
        knew.private_value = private_value;
@@ -2632,4 +2631,29 @@ int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm,
int stream,
                *info_ret = info;
        return 0;
 }
+EXPORT_SYMBOL_GPL(snd_pcm_add_named_chmap_ctls);
+
+/**
+ * snd_pcm_add_chmap_ctls - create channel-mapping control elements
+ * @pcm: the assigned PCM instance
+ * @stream: stream direction
+ * @chmap: channel map elements (for query)
+ * @max_channels: the max number of channels for the stream
+ * @private_value: the value passed to each kcontrol's private_value field
+ * @info_ret: store struct snd_pcm_chmap instance if non-NULL
+ *
+ * Create channel-mapping control elements assigned to the given PCM
stream(s).
+ * Return: Zero if successful, or a negative error value.
+ */
+int snd_pcm_add_chmap_ctls(struct snd_pcm *pcm, int stream,
+                          const struct snd_pcm_chmap_elem *chmap,
+                          int max_channels,
+                          unsigned long private_value,
+                          struct snd_pcm_chmap **info_ret)
+{
+       return snd_pcm_add_named_chmap_ctls(pcm, stream,
+                       stream == SNDRV_PCM_STREAM_PLAYBACK ? "Playback
Channel Map" :
+                                  "Capture Channel Map", chmap,
max_channels,
+                                  private_value, info_ret);
+}
 EXPORT_SYMBOL_GPL(snd_pcm_add_chmap_ctls);

-------------------------------------->cut<----------------------------

changes to your patch:


> +	if (ret < 0)
> +		return ret;
> +
> +	/* Make the query-only chmap control writable from userspace. */
> +	for (i = 0; i < info->kctl->count; i++)
> +		info->kctl->vd[i].access |= SNDRV_CTL_ELEM_ACCESS_WRITE;
> +	info->kctl->get = x1e80100_chmap_ctl_get;
> +	info->kctl->put = x1e80100_chmap_ctl_put;
> +
> +	return 0;
> +}
> +
>  static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> @@ -34,6 +125,9 @@ static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
>  	switch (cpu_dai->id) {
>  	case WSA_CODEC_DMA_RX_0:
>  	case WSA_CODEC_DMA_RX_1:
> +		if (!rtd->pcm)
> +			return 0;
> +
>  		/*
>  		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
>  		 * to reduce the risk of speaker damage until we have active
> @@ -92,6 +186,7 @@ static int x1e80100_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>  	return 0;
>  }
>  
> +/* Default WSA RX slot mapping when userspace has not provided a channel map. */
>  static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
>  {
>  	switch (num) {
> @@ -120,6 +215,58 @@ static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
>  	return 0;
>  }
>  
> +static int x1e80100_snd_build_rx_slot(struct x1e80100_snd_data *data,
> +				      unsigned int dai_id, unsigned int channels,
> +				      unsigned int *rx_slot)
> +{
> +	unsigned int *user = data->user_chmap[dai_id];
> +	unsigned int i, set = 0;
> +
> +	for (i = 0; i < channels && i < ARRAY_SIZE(data->user_chmap[0]); i++)
> +		if (user[i])
> +			set++;
> +
> +	if (set != channels)
> +		return x1e80100_snd_hw_map_channels(rx_slot, channels);
> +
> +	for (i = 0; i < channels; i++) {
> +		int q6 = x1e80100_chmap_to_q6(user[i]);
> +
> +		if (q6 < 0)
> +			return q6;
> +		rx_slot[i] = q6;
> +	}
> +
> +	return 0;
> +}
> +
> +static int x1e80100_snd_startup(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +	int ret;
> +
> +	ret = qcom_snd_sdw_startup(substream);
> +	if (ret)
> +		return ret;
> +
> +	switch (cpu_dai->id) {
> +	case WSA_CODEC_DMA_RX_0:
> +	case WSA_CODEC_DMA_RX_1:
> +		if (!data->chmap_added[cpu_dai->id]) {
> +			ret = x1e80100_add_wsa_chmap_ctls(rtd);

This is will lockup, because startup is called under a dapm_mutex and
function calls to snd_ctl_add(), which acquires card->controls_rwsem
(write).

This creates an AB-BA deadlock with DAPM:

  Thread A -- PCM open:
    pcm->open_mutex -> dpcm_mutex -> controls_rwsem (write, via snd_ctl_add)

  Thread B -- DAPM mixer write:
    controls_rwsem (write, via snd_ctl_elem_write) -> dpcm_mutex (via
dapm_power_widgets)


So better move this to to late_probe:

Here is what i changed in your patch:

-------------------->cut<----------------------------

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index 63cd00620ade..8c066f1fd2b7 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -24,7 +24,6 @@ struct x1e80100_snd_data {
        struct snd_soc_jack dp_jack[8];
        bool jack_setup;
        unsigned int user_chmap[AFE_PORT_MAX][4];
-       bool chmap_added[AFE_PORT_MAX];
 };

 static const struct snd_pcm_chmap_elem x1e80100_wsa_chmaps[] = {
@@ -93,14 +92,14 @@ static int x1e80100_chmap_ctl_put(struct
snd_kcontrol *kcontrol,
        return 0;
 }

-static int x1e80100_add_wsa_chmap_ctls(struct snd_soc_pcm_runtime *rtd)
+static int x1e80100_add_wsa_chmap_ctls(struct snd_soc_pcm_runtime *rtd,
const char *name)
 {
        struct snd_pcm_chmap *info;
        unsigned int i;
        int ret;

-       ret = snd_pcm_add_chmap_ctls(rtd->pcm, SNDRV_PCM_STREAM_PLAYBACK,
-                                    x1e80100_wsa_chmaps,
+       ret = snd_pcm_add_named_chmap_ctls(rtd->pcm,
SNDRV_PCM_STREAM_PLAYBACK,
+                                    name, x1e80100_wsa_chmaps,
                                     X1E80100_WSA_MAX_CHANNELS, 0, &info);
        if (ret < 0)
                return ret;
@@ -242,29 +241,7 @@ static int x1e80100_snd_build_rx_slot(struct
x1e80100_snd_data *data,

 static int x1e80100_snd_startup(struct snd_pcm_substream *substream)
 {
-       struct snd_soc_pcm_runtime *rtd =
snd_soc_substream_to_rtd(substream);
-       struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-       struct x1e80100_snd_data *data =
snd_soc_card_get_drvdata(rtd->card);
-       int ret;
-
-       ret = qcom_snd_sdw_startup(substream);
-       if (ret)
-               return ret;
-
-       switch (cpu_dai->id) {
-       case WSA_CODEC_DMA_RX_0:
-       case WSA_CODEC_DMA_RX_1:
-               if (!data->chmap_added[cpu_dai->id]) {
-                       ret = x1e80100_add_wsa_chmap_ctls(rtd);
-                       if (ret)
-                               return ret;
-
-                       data->chmap_added[cpu_dai->id] = true;
-               }
-               break;
-       }
-
-       return 0;
+       return qcom_snd_sdw_startup(substream);
 }

 static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
@@ -312,6 +289,29 @@ static const struct snd_soc_ops x1e80100_be_ops = {
        .prepare = x1e80100_snd_prepare,
 };

+static int x1e80100_late_probe(struct snd_soc_card *card)
+{
+       struct snd_soc_pcm_runtime *rtd;
+       int ret;
+
+       for_each_card_rtds(card, rtd) {
+               struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+
+               switch (cpu_dai->id) {
+               case WSA_CODEC_DMA_RX_0:
+               case WSA_CODEC_DMA_RX_1:
+                       if (!rtd->pcm)
+                               break;
+                       ret = x1e80100_add_wsa_chmap_ctls(rtd, "WSA
Playback Channel Map");
+                       if (ret)
+                               return ret;
+                       break;
+               }
+       }
+
+       return 0;
+}
+
 static void x1e80100_add_be_ops(struct snd_soc_card *card)
 {
        struct snd_soc_dai_link *link;
@@ -351,6 +351,7 @@ static int x1e80100_platform_probe(struct
platform_device *pdev)
                return ret;

        card->driver_name = of_device_get_match_data(dev);
+       card->late_probe = x1e80100_late_probe;
        x1e80100_add_be_ops(card);

        return devm_snd_soc_register_card(dev, card);

-------------------->cut<----------------------------	


> +			if (ret)
> +				return ret;
> +
> +			data->chmap_added[cpu_dai->id] = true;
> +		}
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
>  static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
>  {
>  	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> @@ -132,7 +279,8 @@ static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
>  	switch (cpu_dai->id) {
>  	case WSA_CODEC_DMA_RX_0:
>  	case WSA_CODEC_DMA_RX_1:
> -		ret = x1e80100_snd_hw_map_channels(rx_slot, channels);
> +		ret = x1e80100_snd_build_rx_slot(data, cpu_dai->id, channels,
> +						 rx_slot);
>  		if (ret)
>  			return ret;
>  
> @@ -158,7 +306,7 @@ static int x1e80100_snd_hw_free(struct snd_pcm_substream *substream)
>  }
>  
>  static const struct snd_soc_ops x1e80100_be_ops = {
> -	.startup = qcom_snd_sdw_startup,
> +	.startup = x1e80100_snd_startup,
>  	.shutdown = qcom_snd_sdw_shutdown,
>  	.hw_free = x1e80100_snd_hw_free,
>  	.prepare = x1e80100_snd_prepare,
> 
> ---
> base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
> change-id: 20260609-sound-qcom-x1e80100-allow-ucm-channel-map-2302f2d552d5
> 
> Best regards,
> --  
> Abel Vesa <abel.vesa@oss.qualcomm.com>
> 


