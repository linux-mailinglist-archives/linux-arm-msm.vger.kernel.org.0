Return-Path: <linux-arm-msm+bounces-70006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D9EB2E493
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 20:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29C1317E164
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 18:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14DA26CE3A;
	Wed, 20 Aug 2025 17:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dPOjhJxj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3165724DCF9
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755712797; cv=none; b=drVB1MdKnuG8heFLol2HCcpDDc+q9GihqIS12neNVL3uLOjKsJvVgVL0/rF6MOVg1xnwylWcybP9jbPC/CeiNIyjDpDwufDOHW3hLpGa7ARDCmVlOXkgNMVaWZrGaVNVgPzJVg0tGnXimXJyeKAwHH81z401oDp6vOtd7UOW4lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755712797; c=relaxed/simple;
	bh=Oka69nYqhgw4mUHzY+3xl7uUA2VvGgIzb2JO2VYF0RI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lSjz3h/Tq9hGDr0F6EpT/KJ27MPJqL2xxlJnrwdKrThDLXNTa7VZc+pmoS31VCAuMkayDt4qc6/KodU+yrhsswslqo+G2c9G0a3a5P9voiHzbYRqD9mN9gUaAqWT64fF8sJKAYgAbJlE2biQ+XfZoK61UifoGTruw1D9SoSWmQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dPOjhJxj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b0990b2so1022685e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 10:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755712794; x=1756317594; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psd7GX0dj7+39+JGOVBzQw4uHGDJswb4ASw50pIR/xE=;
        b=dPOjhJxj8AANK/OhHAwAPe1ERnEpMzeTLVmI02SRmN4uwOcxkaDFwMpXXdW51dm9TI
         q5dZ1H9Hs5wkDEd5bFC2OAkLYy6UwYxR0nIVeFli2EZzUuaVWo+FQV/UvXe0aJJjDSCP
         uSsO2hFvjRGNHJDRxt606M0wFovv5U9kZDTNr2RbuQMN681CYChAgKYoO4RQfIEg0lhW
         ycLbxOtZ4AYbK7OzQb53unTMz2fldejrvKZWMC7NrQDXALDXXsKd7u9I5GuWXGM32SlQ
         JRzZFvtsB+qxkF97twYwIL36+fpDQYxnD86TRT259hm0BWmrwa7hhA/gUFDS2GnJ6Oiy
         3+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755712794; x=1756317594;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=psd7GX0dj7+39+JGOVBzQw4uHGDJswb4ASw50pIR/xE=;
        b=NbeaAVehmvhyHSLCkeBZUji03/zGblWb/acW57C4xJ2U4No36TteHqxSmaWO5pgCl2
         cyJvJxd2JbCa+Kq35b9DIQuXeA8ooSX4eEUvh0VhWOxAcYcckAwNyTaU67H6rXs13Vmq
         5Ox4l1y7HxzlOsPe63ddqG5E4ZmL6KCP+TosAZrMG8KIUTQdZ6v3wbu58PTmqaYGMhd+
         n2PN/O/fNAs1y/01wIhmv4zedLyYhmgG79hUAQP60TGC2o4a/er/WU1r5Ak3AonyjBgj
         UUPQf6+NC5gAxBVu6GmzdLqcVHy+CDUFpO6Myk5HlVO1FDQa5ao1C2IUZd+TbsN9xLxo
         7sPw==
X-Forwarded-Encrypted: i=1; AJvYcCVBSR2LL4Cu+q1iFAPfjGnQINfpFaPFTl2RJq8AAJt1lVSgrVqZFjp5XbberyKtvrZTNhf6Ij0qNEKhTF+S@vger.kernel.org
X-Gm-Message-State: AOJu0YwHYXIKahBaYzSjqnB5GKR94VRbFADSYkF4h2jwvZkmGSqPHrox
	jsqaOe0G4MPqEaMucf7UvDlV/euVXDjqHIKaxqgWqNOtdTW8OkM5qBSrNp4LQ2Mg2A4=
X-Gm-Gg: ASbGncvzs7KB2RmD70kW75m3oJSBOS0FeHV03EPqFO12FZTfdnW6QfFoonSDHJin42L
	fijy4s47CSiuEmqKXO2jWJwIGXeKu6t7izGN7LV+tWl6LmiR5Tr9aTpVKYM/BD/asrAspZJq+5F
	Ta40b5U+nrt/Da5KhLrIKVu4jBqYcNBlrEBzBVFdIQDJU9RETJtuvX429m16t70kMT5hRZIbp7O
	ATYbv3JxE+6v6uB951bkRmwu6sD0XZ7J1AsIRbrxM9jzHGOMeGnYssjdRkSd8vGXQqdOafgoEGO
	LnbfKQYOvI4Zk2oMsphgYw0a1u1K9zY+3uFUuBuD11uOqrMrUZPT5D1+XqumaRZJbepQ50WVtEi
	t4a2vquMTUiVdNwSM5evFzXUlBD9/y/O7jlnWhg==
X-Google-Smtp-Source: AGHT+IG0HixLdWbK9CluBnPq2eg82Ql5cTYrFzVyRwWIRunFXARzLchOek5V0A927f6ndOI8kHBWcA==
X-Received: by 2002:a05:600c:3b20:b0:458:bf9c:274f with SMTP id 5b1f17b1804b1-45b479f34a4mr31709205e9.29.1755712794543;
        Wed, 20 Aug 2025 10:59:54 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:3a9b:1de2:5440:9326])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c8e379sm47740645e9.13.2025.08.20.10.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 10:59:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 18:59:53 +0100
Message-Id: <DC7G8QJ0XVJX.BBZHVVZO6OEN@linaro.org>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, "Srinivas Kandagatla" <srini@kernel.org>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Patrick Lai" <plai@qti.qualcomm.com>, "Annemarie Porter"
 <annemari@quicinc.com>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>, <kernel@oss.qualcomm.com>,
 "Ekansh Gupta" <ekansh.gupta@oss.qualcomm.com>, "Pierre-Louis Bossart"
 <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH RFC 1/2] ALSA: compress: add raw opus codec define and
 struct snd_dec_opus
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: aerc 0.20.0
References: <20250616-opus_codec_rfc_v1-v1-0-1f70b0a41a70@linaro.org>
 <20250616-opus_codec_rfc_v1-v1-1-1f70b0a41a70@linaro.org>
 <1317c3c5-967d-4013-9c0b-f68844c63908@oss.qualcomm.com>
In-Reply-To: <1317c3c5-967d-4013-9c0b-f68844c63908@oss.qualcomm.com>

On Wed Jun 18, 2025 at 1:33 PM BST, Srinivas Kandagatla wrote:
>
>
> On 6/16/25 4:26 PM, Alexey Klimov wrote:
>> Adds a raw opus codec define and raw opus decoder struct.
>> This is for raw OPUS packets not packed in any type of container
>> (for instance OGG container). The decoder struct fields
>> are taken from corresponding RFC document.
>>=20
>> This is based on earlier work done by
>> Annemarie Porter <annemari@quicinc.com>
>>=20
> May be co-dev by would be good option.

Ack.

>> Cc: Annemarie Porter <annemari@quicinc.com>
>> Cc: Srinivas Kandagatla <srini@kernel.org>
>> Cc: Vinod Koul <vkoul@kernel.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  include/uapi/sound/compress_params.h | 21 ++++++++++++++++++++-
>>  1 file changed, 20 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/c=
ompress_params.h
>> index bc7648a30746f4632ecf6695868e79550a431dfa..f80989f7bdd2f1bfad843b1d=
c30fa263e083d17a 100644
>> --- a/include/uapi/sound/compress_params.h
>> +++ b/include/uapi/sound/compress_params.h
>> @@ -43,7 +43,8 @@
>>  #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
>>  #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
>>  #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
>> -#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
>> +#define SND_AUDIOCODEC_OPUS_RAW              ((__u32) 0x00000011)
>> +#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_OPUS_RAW
>> =20
>>  /*
>>   * Profile and modes are listed with bit masks. This allows for a
>> @@ -324,6 +325,23 @@ struct snd_dec_ape {
>>  	__u32 seek_table_present;
>>  } __attribute__((packed, aligned(4)));
>> =20
>> +/*
>> + * RFC with info on below OPUS decoder fields:
>> + * https://www.rfc-editor.org/rfc/rfc7845#section-5
>> + */
>> +struct snd_dec_opus {
>> +	__u8 version;		/* must be 1 */
>> +	__u8 num_channels;
>> +	__u16 pre_skip;
>> +	__u32 sample_rate;
>> +	__u16 output_gain;	/* in Q7.8 format */
>> +	__u8 mapping_family;
>
> This is where optional Channel Mapping Table starts in the structure.
>
> Should this all these channel mapping memnbers go into a dedicated
> struct snd_dec_opus_ch_map?

Ok.

>> +	__u8 stream_count;	/* part of channel mapping */
>> +	__u8 coupled_count;	/* part of channel mapping */
> Comments are bit misleading. Either we document them in detail or point t=
o
> the rfc which has this documented in more detail.

Ok.

>> +	__u8 channel_map;
>
> Channel Mapping is (8*C bits), one octet per output channel.
>
> The way this is represented/split in this struct is confusing should it
> be just channel_map[8]
>
>
>> +	__u8 reserved[7];	/* space for channel mapping */
> Any reason only 7?

It was 7 because 1+7=3D8. For RFC 7845 the mappin family 0 and 1 only
actually make sense for playback hence max number of channels seems to
be 8.
I'll update it in the next version.

Thank you,
Alexey Klimov

