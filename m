Return-Path: <linux-arm-msm+bounces-63542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F692AF77A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 16:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DE1A188EE96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 14:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09CFA2ED841;
	Thu,  3 Jul 2025 14:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VKMgwNzh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A152ED159
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 14:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751553242; cv=none; b=IAmP+w+k/3uTqHAn284ESOCTfcQ9BFiZrrp8YtEdQo3CZDAiq48ESNKyqdTATmyrfaPultODmLfEiR9jz8NQ3evbbC+xldXw518XZhJveiNw2H6rS7DNO4PHrnu5knFSLmNjE4cizPMqrv6UyssDlfsriuoNXv9RzOEBC9RFsPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751553242; c=relaxed/simple;
	bh=03kyA0pVb6l52SRNG9MBMJOKQPrJGBz6gkjmYtj8OjE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VBVRLw/hWG8ZnZjvcxLPvDGAWKl49wnF7e7hS4aY9aJgx+Wl1l6e6ZFEhqMXp7MjahTILZ2unX2fVUE89RYY7d7KNYYu3RF8OX80nB+UKLUM9z2lXpI+5ALwVXQ5rIS/+6sozfEuWiLmTIkunYwBiU8VaAhfo200n0Jfxh98D+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VKMgwNzh; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso8679660f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 07:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751553238; x=1752158038; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GjXQySvNbQPDNTo3lF28HF3pubSLkhOBNLbNwgZuqGk=;
        b=VKMgwNzhDRPBNnmqoH24w9mTSsrWnr3tR4hW9KEk+A2a6L+PKMGIDXsVcSUS8KyqH8
         7iBwsBxB9yINkjW1V6WwcC7KvZBP3Yd0BgRGQdMfrwnxo5L9KCnsmEdaH27I+ceDyWQd
         GfmE2PwyWcIuDWsm/3DdpAZ+NgK451pEK6JRutbiStbUHL3OBdQfY9ujiAPRMfw4vMOU
         8BqXAydD/Ve+HT6HDHRy7VD7W/1/+oDw4RSn4pXrfMp7HO7lqQRoVQEMtcTMS7MDE6fZ
         G2OLxAEDh8DD445HxOAkOM4RDo5oxZrwC5hWKJ/lC27KxkhYvCAAJ9Yx7pNZNc1isfno
         dUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751553238; x=1752158038;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GjXQySvNbQPDNTo3lF28HF3pubSLkhOBNLbNwgZuqGk=;
        b=UKYgsw5B/Ujo9BD3UAwrW6NW2jbrfaQFG4vky+CBHhQ66BglJc4qdDry4l3uV1tE5Y
         SSGFIHVLvy4d+qd0+nWCBvVYuJBOdRiYedB89BrG9CButWpuRcddmaY+L28dGfiAVxHG
         COuSTN0YMG5Sl/fNc5h7rlZbz/gBI+HOwMSSDCXS6L4O+Le/Vr7gdv3lr6CnEra5QHQY
         ECn89GlfcC8etEaMkhGDAIQ2t+XBkqUsL7/QuvsJvrZpU/e8hnUxolOdBHZxvdbzgaCr
         DTdj6jaDacD+5H5ckIFkM3PSCxuuriuJpZqsyZVFCD9/5gargujoN42CBluLlzpR5uC0
         WqFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR3BrtNeRy419YQ7OlbAnGQoFmvE0jKCQfhw87zkcaeyMbjVDOEs6v7RVfdeYDeOJxGslPIZ/3MU/Fdolh@vger.kernel.org
X-Gm-Message-State: AOJu0YxNdevc+jQmcN5k/SdaJ2NfqQk0hhNu8eM+O7uzC2t+g5oZI+Id
	KS3tUtN8ypDB9IvT8XQruNmp94TKFOcsE1txP8KuP1+uQQTIFGSfcxi4uYaAcFaIGjQ=
X-Gm-Gg: ASbGncs7xS0zkUmtgVEAuS+T3b0EKj8JnF1IRSWw8bPObfhG39xsJ5GZmVvGcFnwGAG
	94wMA3SDBDLyv7itS751hEmtE9dUJHiaVo2ERXOnO5KEEUcJkhIE+IJOspKggSJlOuCHyOQjcBB
	bnrxMd6gNmbsSM942npzEDODjLUixoHFrk7xGe6yXW7OfLuQKd3kGuB7ACjobVf9e7ZZCxgDv/I
	TVyxve/bzEkZZPsvfCxEQEWAjPk+qXnSy3lzWSWs9a7JCnvFNRb/qyU0bald49v5kdSV0fbixn2
	RN4aqkqtsnzO6sE3zD2fSmGulG12oce8s/eZpuSbLJwDETOnxknl45s2hPnPDs2xdD/U+0dNied
	+gpQ=
X-Google-Smtp-Source: AGHT+IEkKmPmraOjVA+Ipj4FdiIRIhAgsdjmHzAubQC1QTQXyyuQ9VSuovzCK3xLPt4hDBF2X9Urnw==
X-Received: by 2002:a05:6000:2887:b0:3a5:52cc:5e29 with SMTP id ffacd0b85a97d-3b1fd74c457mr6177782f8f.7.1751553238375;
        Thu, 03 Jul 2025 07:33:58 -0700 (PDT)
Received: from localhost ([2a02:c7c:7213:c700:1b28:72bc:31d9:dffd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fab6esm19167508f8f.31.2025.07.03.07.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 07:33:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Jul 2025 15:33:57 +0100
Message-Id: <DB2HSWQRGFZM.JVPTBYXCOTKS@linaro.org>
Cc: "Patrick Lai" <plai@qti.qualcomm.com>, "Annemarie Porter"
 <annemari@quicinc.com>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>, <kernel@oss.qualcomm.com>,
 "Ekansh Gupta" <ekansh.gupta@oss.qualcomm.com>, "Pierre-Louis Bossart"
 <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH RFC 2/2] ASoC: qcom: qdsp6/audioreach: add support for
 offloading raw opus playback
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>, "Vinod
 Koul" <vkoul@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, "Srinivas Kandagatla" <srini@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250616-opus_codec_rfc_v1-v1-0-1f70b0a41a70@linaro.org>
 <20250616-opus_codec_rfc_v1-v1-2-1f70b0a41a70@linaro.org>
 <c4d934c1-0218-4147-882f-279795bcd1f4@oss.qualcomm.com>
In-Reply-To: <c4d934c1-0218-4147-882f-279795bcd1f4@oss.qualcomm.com>

On Wed Jun 18, 2025 at 1:34 PM BST, Srinivas Kandagatla wrote:
>
>
> On 6/16/25 4:26 PM, Alexey Klimov wrote:
>> Add support for OPUS module, OPUS format ID, media format payload struct
>> and make it all recognizable by audioreach compress playback path.
>>=20
>> At this moment this only supports raw or plain OPUS packets not
>> encapsulated in container (for instance OGG container). For this usecase
>> each OPUS packet needs to be prepended with 4-bytes long length field
>> which is expected to be done by userspace applications. This is
>> Qualcomm DSP specific requirement.
>> > This patch is based on earlier work done by
>> Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>
> Thanks for picking this up Alexey,
>
> Same, co-dev by should be good attribute for such things.

I need your Signed-off-by then and/or permission to use your Sign off.

>> Cc: Annemarie Porter <annemari@quicinc.com>
>> Cc: Srinivas Kandagatla <srini@kernel.org>
>> Cc: Vinod Koul <vkoul@kernel.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  sound/soc/qcom/qdsp6/audioreach.c | 33 ++++++++++++++++++++++++++++++++=
+
>>  sound/soc/qcom/qdsp6/audioreach.h | 17 +++++++++++++++++
>>  sound/soc/qcom/qdsp6/q6apm-dai.c  |  3 ++-
>>  sound/soc/qcom/qdsp6/q6apm.c      |  3 +++
>>  4 files changed, 55 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/au=
dioreach.c
>> index 4ebaaf736fb98a5a8a58d06416b3ace2504856e1..09e3a4da945d61b6915bf8b6=
f382c25ae94c5888 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.c
>> +++ b/sound/soc/qcom/qdsp6/audioreach.c
>> @@ -859,6 +859,7 @@ static int audioreach_set_compr_media_format(struct =
media_format *media_fmt_hdr,
>>  	struct payload_media_fmt_aac_t *aac_cfg;
>>  	struct payload_media_fmt_pcm *mp3_cfg;
>>  	struct payload_media_fmt_flac_t *flac_cfg;
>> +	struct payload_media_fmt_opus_t *opus_cfg;
>> =20
>>  	switch (mcfg->fmt) {
>>  	case SND_AUDIOCODEC_MP3:
>> @@ -901,6 +902,38 @@ static int audioreach_set_compr_media_format(struct=
 media_format *media_fmt_hdr,
>>  		flac_cfg->min_frame_size =3D mcfg->codec.options.flac_d.min_frame_siz=
e;
>>  		flac_cfg->max_frame_size =3D mcfg->codec.options.flac_d.max_frame_siz=
e;
>>  		break;
>> +	case SND_AUDIOCODEC_OPUS_RAW:
>> +		media_fmt_hdr->data_format =3D DATA_FORMAT_RAW_COMPRESSED;
>> +		media_fmt_hdr->fmt_id =3D MEDIA_FMT_ID_OPUS;
>> +		media_fmt_hdr->payload_size =3D sizeof(struct payload_media_fmt_opus_=
t);
>
> maybe sizeof(*opus_cfg)?

Yes, I can update that.

>> +		p =3D p + sizeof(*media_fmt_hdr);
>> +		opus_cfg =3D p;
>> +		/* raw opus packets prepended with 4 bytes of length */
>> +		opus_cfg->bitstream_format =3D 1;
>> +		/*
>> +		 * payload_type:
>> +		 * 0 -- read metadata from opus stream;
>> +		 * 1 -- metadata is provided by filling in the struct here.
>> +		 */
>> +		opus_cfg->payload_type =3D 1;
>> +		opus_cfg->version =3D mcfg->codec.options.opus_d.version;
>> +		opus_cfg->num_channels =3D mcfg->codec.options.opus_d.num_channels;
>> +		opus_cfg->pre_skip =3D mcfg->codec.options.opus_d.pre_skip;
>> +		opus_cfg->sample_rate =3D mcfg->codec.options.opus_d.sample_rate;
>> +		opus_cfg->output_gain =3D mcfg->codec.options.opus_d.output_gain;
>> +		opus_cfg->mapping_family =3D mcfg->codec.options.opus_d.mapping_famil=
y;
>> +		opus_cfg->stream_count =3D mcfg->codec.options.opus_d.stream_count;
>> +		opus_cfg->coupled_count =3D mcfg->codec.options.opus_d.coupled_count;
>> +
>> +		if (mcfg->codec.options.opus_d.num_channels =3D=3D 1) {
>> +			opus_cfg->channel_mapping[0] =3D PCM_CHANNEL_FL;
>> +		} else if (mcfg->codec.options.opus_d.num_channels =3D=3D 2) {
>> +			opus_cfg->channel_mapping[0] =3D PCM_CHANNEL_FL;
>> +			opus_cfg->channel_mapping[1] =3D PCM_CHANNEL_FR;
>> +		}
>
> Pl use audioreach_set_default_channel_mapping() to fill in the channel
> mapping data.
>
> Why are we not using channel mapping info from the snd_dec_opus struct he=
re?

Okay, I was re-reading RFC and can't really get my head around this.

So first I came up with something like this:

	switch (opus_cfg->mapping_family) {
	case 0:
		if (num_chan =3D=3D 1 || num_chan =3D=3D 2)
			audioreach_set_default_channel_mapping(ch_map, num_chan);
		else
			/* mapping family 0 allows only 1 or 2 channels */
			return -EINVAL;
			break;
		case 1:
			if (num_chan > 8)
				return -EINVAL;
			if (mcfg->codec.options.opus_d.coupled_count > mcfg->codec.options.opus_=
d.stream_count)
				return -EINVAL;

			memcpy(ch_map, mcfg->codec.options.opus_d.channel_map, sizeof(mcfg->code=
c.options.opus_d.channel_map));
			break;
		default:
			/* mapping family 2..255 shouldn't be allowed to playback */
			return -EOPNOTSUPP;
		}

but I don't think above is correct at all.

After re-reading the RFC few more times. It looks that channel_mapping in
opus struct has nothing to do with channel mapping that we need to provide
to DSP here. The channel mapping maps "decoded" channels to output channels
and seems to be needed by opus decoder logic and in some sense is internal
thingy to correctly construct sound for output channel from opus stream(s).
In other words if output channel is present and valid then channel_mapping
describes how and which decoded stream or streams (coupled or uncoupled)
to use for producing sound output for that output channel.
This is described in https://www.rfc-editor.org/rfc/rfc7845#section-5.1.1

The number of output channels here actually matters for us. We can construc=
t
mapping for channels that we pass to DSP based just only on the number of
output channels here and let DSP to figure out how to scatter or downmix or
upmix them to its own output channels.

Conclusion from my understanding:
-- we shouldn't mess with opus_cfg->channel_mapping here, it is needed for
the correct operation of decoder, we shouldn't call
audioreach_set_default_channel_mapping() on it;
-- mapping output channels to provide the mapping to DSP might require some
rework or I need to look into this.

Or something else that didn't came up in my mind yet.

Also, I don't have any test files to test mapping_family 1 and some tricky
cases here. As far as I understand, it works just fine right now with
mapping_family 0.

Best regards,
Alexey


