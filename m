Return-Path: <linux-arm-msm+bounces-70005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF6AB2E484
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 19:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E063FA049C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 17:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 479222749FE;
	Wed, 20 Aug 2025 17:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B/v0STli"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2E926D4FB
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 17:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755712596; cv=none; b=GGZWrUYv8ZGK8kQis3QHshIFQxSlSrs7UYpgbgPwHjlZMfZPMsDD/Po8Gh6LDGTMLEztdbk8bl3YW3YAnDUa0QXc6L3lkZaRFUa1x2H8J3nyHtkRbBuRfY83hCrGJkZ5gSy4l7/NwPRpnsZe0tfiEQ7RkHspCL20qOEHlcLdd8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755712596; c=relaxed/simple;
	bh=QOcH2g5W2VgD9rWQLuw9eVTUp02n6Q21h3gU4HYGuQY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=i2fObdp+XG4kwNcJgtAerJy05VMjTND2pFvOo6qxIoxnQwGdIZ4ex5dIxIkPTOC13bK/nn/Lh6Az+M/XyWHQwVUn+MIgQ9kZDgn9dQDZOdnkoaUdjd5gLv5grJA0iLGgIm9laecNpUNmM6ZcROBvqlHORZ7qmGpsaftLGqtcstY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B/v0STli; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3bea24519c0so600599f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 10:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755712592; x=1756317392; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRaTNaGpOa5Z+hRu1yAnzsNeyy2LG4LK/xZpmXNSsoc=;
        b=B/v0STliWwFwkeILjSqJBTwi1Nz89yvFPHBm4eS+eRnaokpNhOJJ1ZxBwA9BfDw1CM
         GAPq4J6ls+UzCV1yCFIpvSsubXk5XMGBW8hle5Nudp3hH58dbilLkoJGAeQ4hYbrIgK5
         GpN+2/atjzqAUdWGbf7YMFpMgnRObYnXyLfHzU98YC6YeLg9l8DIpLGTsejkmyss/ZOY
         xzWlRwlwQ35AJMDUl1kZ9CsqjSn+YmVTWXDO8wzsmC3c2J1dcY3knCjmg15c489w4Muf
         lxwTeugOzTi2JqVf8ecK2x4ddnNsTYlak82eLlYP+FHgp2kh+n1pMj5z5rnhdjQYV9iO
         SJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755712592; x=1756317392;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gRaTNaGpOa5Z+hRu1yAnzsNeyy2LG4LK/xZpmXNSsoc=;
        b=foUO/BPYSEWB36wbo+Vw1zv59ZlUO0HgNEKud9XtLo3WK/H5YY1Tu5Su3nnz3GIabF
         dbo9uuP9tp6gbWzxFF1UKEO30sBDCUKzuhfqBPHZWrltk/p38E5B3GzRJlZWwuYxFH8+
         gkmGbOIE2OssLswLjFHhxeWWBAzL8eGUQ1xZMeuHc9hu1jJJ3zdJG0cy6snOn6v2U/wt
         Wh0qphUkPBM0FZbFhXf+yoCPqM6JFx3O3bGeWuQhdTxOwN7IWrkOR9RL7ePexyxns6QO
         2kyzoEla6I7v/jZQUUJUrIc8O/wqu5sRYWwJdu68i9RKEp74pc910TjISuxbA10zca7x
         i65w==
X-Forwarded-Encrypted: i=1; AJvYcCV0Jt69a6LUYjFkzAXHgbBGOAH6udGyN9xv5JNOa31feiSUx3AsADvSSlpLK+UWijABVqBk9sFcMA1N0Tmn@vger.kernel.org
X-Gm-Message-State: AOJu0YyavPJDyEuN4QJma9Be2itgi5OLzpD1E/gdCfj8xzDzeKTuO9fG
	Qu4pLaecj8op43MphQc4BrCe0nIlwHWzRBd4e8um2PuKydkuaWJJvOaFFHbVOJLn3ZM=
X-Gm-Gg: ASbGncs1msH1LWBm/usg8fwCjFpQMKnEilCLaqbr6k1G+3yDQYOSHJXIjXf4DEe+M9n
	rMPqdJOL4kz8npTAYh1DPBFSrAYB4Wm3R4cfNPjJhbJ3V4/4NjQMFHc6d7RCZwjMeSaT0VCDgQ5
	antfShNdIkTt3a/+wrVyXQqiF/d3ywXmE7Ebpu6tWawDCZJT6Ud5QxObTQ7aQgXZ50skmGbwP9s
	OfXE4/w03vsRPkeX4lxDgg5bYpvy5F4hZ2ONZOqzIHpSRQUX1CpY8aXABEeK+rxf/WmipW/CmS3
	Xp31Ogdq23OeORxBa8FzUtVP+MSFH1xJXNSb+PhugBltwV3tOWpmmnBhdTc2tmqaQ+hru1SZKU8
	qcFLAXwWvwe4VxTgwdrOZ4iSwy9Q=
X-Google-Smtp-Source: AGHT+IEnJcBD8HXQkToDE4iC/mSJ7mzWcSv6cC9qg3LBD8IqH8NeDDcwZslRIYizdVu0Cq/R4HhLFA==
X-Received: by 2002:a05:6000:25c2:b0:3c2:e033:3994 with SMTP id ffacd0b85a97d-3c45fe7ccd1mr371009f8f.26.1755712591851;
        Wed, 20 Aug 2025 10:56:31 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:3a9b:1de2:5440:9326])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c07496f432sm8454409f8f.6.2025.08.20.10.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 10:56:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 18:56:30 +0100
Message-Id: <DC7G65CXCQRB.3NGHI539I09CP@linaro.org>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, "Srinivas Kandagatla" <srini@kernel.org>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Patrick Lai" <plai@qti.qualcomm.com>, "Annemarie Porter"
 <annemari@quicinc.com>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>, <kernel@oss.qualcomm.com>,
 "Ekansh Gupta" <ekansh.gupta@oss.qualcomm.com>, "Pierre-Louis Bossart"
 <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH RFC 2/2] ASoC: qcom: qdsp6/audioreach: add support for
 offloading raw opus playback
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
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

Thanks. I'll update it for the next version.

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

Ack.

Best regards,
Alexey

