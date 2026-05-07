Return-Path: <linux-arm-msm+bounces-106294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Bk1F3FP/GlOOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:38:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DE34E4F26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD9CF30B8972
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5394C3822A9;
	Thu,  7 May 2026 08:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BhXHcaXi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kQeS+DBd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A8B39D6CC
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 08:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142679; cv=none; b=Zz71ZGdWee/t4D/cyUEMX305RWCczi9Zl6J3scwCa7zvLCDQ8JiZqSQhZUVZzn0H+CmVh9mKoAvDjjWmSll7PNlgU8Es1cyGqAg9OSpY4hR1Qej0pb+9dXPiYZy8RIfcFXjh6zDmjXaGI33PbC71SQFi0RfTNXqA5pes0Bo89GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142679; c=relaxed/simple;
	bh=QS+xgoVpj05u0kN4fcEBZA7FdHDEHzpoDC0VDQZG2Ng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e5PiIU8JtaiYQqIutnq5wFst3b4TGIh9ylVyjnAe2/AlbVm35xPblSsPeCO3/DQjucbVCfubwXbpm0yt2zeWpc5f0264VU4mMK0oLRo11tNbnLhZRs5dQSkxA41CnG3L0zAC419CM/kUVPwDYtP+VFad8R/ehcgU7D0j/Ct3fV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BhXHcaXi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kQeS+DBd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64745oSq879574
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 08:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D2XIi6C2iZGs4L66zdNlkVPXJfVednJv4dvbXHiQwWA=; b=BhXHcaXiPBfofdoq
	lDzcH23JLjPWu2ruIVMlHF1l/fJ10xI4Bg+54JTCkn0ZX/ww/dABbaLNxWIZ0irX
	kvoLZSBKRCNi7wrzRp0PNFfaMMUgmfjEK76lXTt7oar8vCQBEakBwRl673VDAosa
	Q8/EO1/FyuEgcbMDhmjybOKy1MWbWzjq47SkaVuCeNEGEu4B0PbDsOjDwtZX5B6y
	+PzKMs1cUeZm1dbR6wlYeB5ojBSmM5yw9j5eHP7dT5OdBp43h12WTU01TBqFIYaZ
	ShmgZi9jTx5WAAOoc6qQdZ1bo+l2kmqT7wGgxwwHsburVoKs1yb5dSqdxHMAnBlL
	GAX0Fw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kdq0vft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:31:14 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95cc77982c5so3035222241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778142673; x=1778747473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D2XIi6C2iZGs4L66zdNlkVPXJfVednJv4dvbXHiQwWA=;
        b=kQeS+DBdan8AA77aWYPbUHg6xR0Kd+iTY5p2avh21D+xQV5U6RwM3QN/9sR8DjvC/i
         zKiZtMBeP6CeVjUrrRM0+gIhySuFzaH/G4DtYEq4oz/TAE82BAGvSlRProA9w9Zj6/j9
         YEhhpQloZAthK+89UY0a4hhFG8IOOdc2PY+Zku9PnRcZjattvkk1NYAL3TG6iFuzgGGa
         EdFWj36X3GBZuBQuG6bfiW35fJooZkZm4fDaT2AGq3SygYlUHSqmGHqkMPAgA5TGti7i
         6ADiahUHHYMiEY1O8HCKf5rFmN6BGmZMsuE5b0FITWnA3Do452RoUfCFTQw4KxmONCkG
         yUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142673; x=1778747473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D2XIi6C2iZGs4L66zdNlkVPXJfVednJv4dvbXHiQwWA=;
        b=EGL4iw1MRblPF0VMK9iSLvvY/eK3Ad+IJbrvAFrWIn7Wjt05CriporxPcrnXAVm/Vs
         C2FKdx/Lr7rjoz2auYYmMgQUSDADOk+Ua5ES+DwL3ZIYuuY7ImnUMhVTuR7yz8B/n6JK
         WCUvLjxHGSBqwNv9Cuj0xU/HVO3VVlqNDIQvGxCoLFKVusv+Gs6Y1FU5ALob2tIF8esr
         HGFyvvun1YzMhj8U+Ih5EtSF5N4UXcLFyZn+jwp0EAU/UH0T95cM3L/OHxSPYwiZyfaf
         kVdkmcjOdJwnoFUTOTDYjbbjjk1kwm40pXkDWXKKMh8GW77n7o1808MHoC+lCNrXeeCF
         0PkA==
X-Forwarded-Encrypted: i=1; AFNElJ+21yGxNC12+Wi4yr+EqYzXKOfI06IvX1bP1udljo9MJnxsrHEmu1aMkBqQ9B4e6uivj7DqktxIQrwzV8rt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9CKWtIrMKTXI9mh0ZypbuOiUZATJWoV4TzqsmQBid3zvCFcZu
	JtNc8K9TTcQAmVa058xq2yt5GSlCQBR/cqd8z4IlBOyRBUrFBcVIoiO9qsyhgQU84mRNISltT1w
	kPOFzVNP8+1mtyftrKgGQSTiknSFbaUPG2tTGcPYZWyuF+xfFBGD8+qaSkMwwMx7UkqG0
X-Gm-Gg: AeBDiescK1DfGpWh76Swopoq3djM7Oq9uJaFGVvONiH1nt5e4fn5iZTEaqa95mX+0Uz
	381fm20wcs236T5xCUMiw+G/UrmQCMcjh4c6tPUlPixCLtvgmnPxbO9wpdQA9HWPF39bktI+O00
	Xy9CK0RzcYGo4h+pcsQ8UST/PU5YUibeclecbh3eQ9IDMI7giNYWr2DF8PAftcy2+JVKwFqtyw5
	Qhr4QmDvZZlwdiVobDpS0E5QZ8KNxbfL/Cl/5lFuOejL3RgXXVxmkzdbW5aQmE1lZ/BlFDh4Lmq
	K7Xz2bEGxWWb5ArZ7qUEAFQPeKfwfo87yeUnY3RcFcpNzOkn+uBs67WV7lffbbWJa4yvM9zuBhy
	3DBT3LeiP/I/ICOadHOV1m5GFGwuE+aNqj2tFcIifKmjWy1K2gMfSzUL8gR8=
X-Received: by 2002:a05:6102:26c3:b0:62e:1ae1:cd6f with SMTP id ada2fe7eead31-63115d83748mr644471137.3.1778142673215;
        Thu, 07 May 2026 01:31:13 -0700 (PDT)
X-Received: by 2002:a05:6102:26c3:b0:62e:1ae1:cd6f with SMTP id ada2fe7eead31-63115d83748mr644457137.3.1778142672825;
        Thu, 07 May 2026 01:31:12 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bc833742a54sm53375366b.32.2026.05.07.01.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:31:12 -0700 (PDT)
Message-ID: <af0d5cd5-4d4d-4cf1-a347-4f40c595d07d@oss.qualcomm.com>
Date: Thu, 7 May 2026 08:31:10 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] ASoC: qcom: qdsp6: q6routing: add Senary MI2S
 ports
To: Val Packett <val@packett.cool>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Bhushan Shah <bhushan.shah@machinesoul.in>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Antoine Bernard <zalnir@proton.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260506204142.659778-1-val@packett.cool>
 <20260506204142.659778-3-val@packett.cool>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260506204142.659778-3-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P6IKQCAu c=1 sm=1 tr=0 ts=69fc4dd2 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=cc8_7rZf7ZdJLD7Cf0wA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: r1MNBk9W2kSwC3Z80iUasldgxfrLd9_l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4MiBTYWx0ZWRfXxH8yI6xpv8ui
 Hy+Qh2nNWVOp8VktRcbFWEZf1CIEL8xmpiYfRdjkjwc72PU8QpBGTHwMHHogd3mDp368YYgTvQs
 ZiDM787bZB7d51XlO5XXhfeq8cW2SrM5yX46SAoMI7YqwAAaKB5iiQc/xY75/VvKpceEsk0BD99
 hMaCQ137xwKXN4qz7Jf2aCvgx4/BR2EDsgdAV86ozUjFdxRUCzaW1OJTTd5R5e5vQcierLcfxIo
 2R4EHq4sOc4sHRWwuQu1lAbdrvHtMyRqlQeH9/9CJhIbhGxnUbKkloRxwhIbyXoclxijC6sHvTw
 FI0Qjhfw3V+UGys2EP148Qx4rEd2RG80t0+bAyOp0znGIYMXO97OU6kUhW/BrvQ3YXyA78TJF4U
 TVjMZXL6uOzY5jSOjU3GTQ5zRynoKLVXH/SEGxwcsGDedN6iLl2jS0QhuqI1+vTvGmDgmiPccpj
 TjFNP5qPjxnkOOtbd/w==
X-Proofpoint-GUID: r1MNBk9W2kSwC3Z80iUasldgxfrLd9_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070082
X-Rspamd-Queue-Id: D2DE34E4F26
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106294-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[packett.cool,kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/6/26 8:33 PM, Val Packett wrote:
> This commit adds support for senary MI2S mixers.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/qdsp6/q6routing.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
> index 7386226046fa..55119cc33d95 100644
> --- a/sound/soc/qcom/qdsp6/q6routing.c
> +++ b/sound/soc/qcom/qdsp6/q6routing.c
> @@ -68,6 +68,7 @@
>  	{ mix_name, "SEC_MI2S_TX", "SEC_MI2S_TX" },	\
>  	{ mix_name, "QUAT_MI2S_TX", "QUAT_MI2S_TX" },	\
>  	{ mix_name, "QUIN_MI2S_TX", "QUIN_MI2S_TX" },	\
> +	{ mix_name, "SEN_MI2S_TX", "SEN_MI2S_TX" },	\
>  	{ mix_name, "TERT_MI2S_TX", "TERT_MI2S_TX" },		\
>  	{ mix_name, "SLIMBUS_0_TX", "SLIMBUS_0_TX" },		\
>  	{ mix_name, "SLIMBUS_1_TX", "SLIMBUS_1_TX" },		\
> @@ -145,6 +146,9 @@
>  	SOC_SINGLE_EXT("QUIN_MI2S_TX", QUINARY_MI2S_TX,			\
>  		id, 1, 0, msm_routing_get_audio_mixer,			\
>  		msm_routing_put_audio_mixer),				\
> +	SOC_SINGLE_EXT("SEN_MI2S_TX", SENARY_MI2S_TX,			\
> +		id, 1, 0, msm_routing_get_audio_mixer,			\
> +		msm_routing_put_audio_mixer),				\
>  	SOC_SINGLE_EXT("SLIMBUS_0_TX", SLIMBUS_0_TX,			\
>  		id, 1, 0, msm_routing_get_audio_mixer,			\
>  		msm_routing_put_audio_mixer),				\
> @@ -535,6 +539,9 @@ static const struct snd_kcontrol_new quaternary_mi2s_rx_mixer_controls[] = {
>  static const struct snd_kcontrol_new quinary_mi2s_rx_mixer_controls[] = {
>  	Q6ROUTING_RX_MIXERS(QUINARY_MI2S_RX) };
>  
> +static const struct snd_kcontrol_new senary_mi2s_rx_mixer_controls[] = {
> +	Q6ROUTING_RX_MIXERS(SENARY_MI2S_RX) };
> +
>  static const struct snd_kcontrol_new tertiary_mi2s_rx_mixer_controls[] = {
>  	Q6ROUTING_RX_MIXERS(TERTIARY_MI2S_RX) };
>  
> @@ -777,6 +784,9 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
>  	SND_SOC_DAPM_MIXER("QUIN_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
>  			   quinary_mi2s_rx_mixer_controls,
>  			   ARRAY_SIZE(quinary_mi2s_rx_mixer_controls)),
> +	SND_SOC_DAPM_MIXER("SEN_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
> +			   senary_mi2s_rx_mixer_controls,
> +			   ARRAY_SIZE(senary_mi2s_rx_mixer_controls)),
>  	SND_SOC_DAPM_MIXER("TERT_MI2S_RX Audio Mixer", SND_SOC_NOPM, 0, 0,
>  			   tertiary_mi2s_rx_mixer_controls,
>  			   ARRAY_SIZE(tertiary_mi2s_rx_mixer_controls)),
> @@ -969,6 +979,7 @@ static const struct snd_soc_dapm_route intercon[] = {
>  	Q6ROUTING_RX_DAPM_ROUTE("SLIMBUS_6_RX Audio Mixer", "SLIMBUS_6_RX"),
>  	Q6ROUTING_RX_DAPM_ROUTE("QUAT_MI2S_RX Audio Mixer", "QUAT_MI2S_RX"),
>  	Q6ROUTING_RX_DAPM_ROUTE("QUIN_MI2S_RX Audio Mixer", "QUIN_MI2S_RX"),
> +	Q6ROUTING_RX_DAPM_ROUTE("SEN_MI2S_RX Audio Mixer", "SEN_MI2S_RX"),
>  	Q6ROUTING_RX_DAPM_ROUTE("TERT_MI2S_RX Audio Mixer", "TERT_MI2S_RX"),
>  	Q6ROUTING_RX_DAPM_ROUTE("SEC_MI2S_RX Audio Mixer", "SEC_MI2S_RX"),
>  	Q6ROUTING_RX_DAPM_ROUTE("PRI_MI2S_RX Audio Mixer", "PRI_MI2S_RX"),


