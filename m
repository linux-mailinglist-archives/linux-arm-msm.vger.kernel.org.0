Return-Path: <linux-arm-msm+bounces-67900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA4EB1C4F9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 13:35:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE80A189B348
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 11:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF39270548;
	Wed,  6 Aug 2025 11:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FsyrbbPn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E7119AD70
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 11:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754480115; cv=none; b=ZLQz34BiJjfmSVRc9xttQLgf/BQAb1GFCRz7O5w5BIMHDHqlcCNrqWVG42NMUWY9s7wRpC9vQgl8woReqU9zlp9DguM3lmo0Lt/sUn39DzLvFu018gH7e2DPD4Y4mFSUJV6BdwZYP/+5JNdvdLgJReeg0Q2IVMkpm2+ObfFL90s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754480115; c=relaxed/simple;
	bh=OAEJQJFlxySSV2AVq32vuflGdzBiXmboQK9Lpss4XF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=akfnpLiKxcK1UKwU659df24L2vgWt9MMiIPJ1xZtMvxDwcoGXc6igHRsqhDywsdNisdut1C6c9pl6IDy/FBvg/B4+84h+CGgQwScEoAJ6scRmBw8sioLyPPvec8jBxJoWGABnHN+b1sweyfLFk6kfd5aEbXcfKkRl1JPAgWSSaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FsyrbbPn; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76bc68cc9e4so5795312b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 04:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754480113; x=1755084913; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bWQWyYoXiLLkZAoiIB5sdcKmoITnPW5rVyw8e/6D4rw=;
        b=FsyrbbPn+cJS/9JPJDxsAiTWazEuvEZAQn7M78K+izxC1PDqpR7WerOlLa/aNO3gyu
         qeqO5CDE0d5231WVZd3Ndz8Ppn+xLL5uHgOTN1n3JplmXTN9xxy/Vq1KRBiL4dLLfZdH
         AVxNbFH/i1FPkFqrKQNV2fzlXctHjXpo5s3xPclGt6olu1HvN2xjsMc73Ggqnu30LnvQ
         YUKGrKrf8ABDWCi7kvhzM5u6fT3rglJuaUwFoUZxVfIF992CsTz/5nTxUCO5iKEjXTTB
         naoQPZwfaFfp9zkj/CJnP8CKUj8heSuDxSaxqNVtUpeZJglprvwPWoULShXiIV0pHL8b
         6A+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754480113; x=1755084913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWQWyYoXiLLkZAoiIB5sdcKmoITnPW5rVyw8e/6D4rw=;
        b=PnzJUSaZgSqsWlsasMDoukr/nN0RVo4kE43r1xYoaYnRgTvY18BMUh272u8YJk5gjj
         9VgHVv987fM78E0dBn+5cxzHnt5Q/hSwbX6uEQcE/Nbij/1Nxj9ywqrrJj8Kv1vbj4WQ
         NBN98YKtdZS+pwVqGGLC4/4JVzzenqpfruSTkU2CbfEEE9Ps3bw5ulnojBVDK5jrV2rv
         Uxp3p2m0PXcwMZKkYBmKCe83jDhB0fgAS0wFt9jadTJcgLaaPjRJqrx/y8lh4dnzPrzS
         SdfJrukWH7M8ENpYMyU7Nc0zDqS6JwBVNUDMznPEmdFY/7FurJyk33rc+HJ1BX9E9aqM
         QDfg==
X-Forwarded-Encrypted: i=1; AJvYcCW9WDEkgVcYDs4zrxcioVJK+7tTZhzqKMtj2CHu8TIMeLid28HJiiznONvhJviMWWvMRhV4LT5EBb6Jq2o9@vger.kernel.org
X-Gm-Message-State: AOJu0YwHNhSu12sU+l4fkR5BxSXfNPopgW3ThYn3mss9tazlMNg3dl7o
	48Pdrm4bLlo7eQI2mFOs2w9wFeRmBxI6vZcElp/g3mzlBBg4qDE8O/Q7yI8jOiB/rpk2YcLokSh
	U450slHrCQPK9XLw2qdPNdh35/+ATnRIPojGw3OlW
X-Gm-Gg: ASbGnct9VKifUFHlC1t3KsIYUSxg3tqDUWoWKrLFQDbidQ4WXXOobwowx08PkCrPIj3
	F4WpF+8QmiwidyHUQl2qmHV/9iH85h3RaE03e39Cup4L+iFZwAETT9baRfaE0eR3uOy/bQi/Nrl
	tf4/ddvE3Wkdf4Kk1KzAVgaw9Lki+dxoMwsC6mL1bV6VTfLUqvfymiE8CixOdVSp3fHFdmGqXMO
	CQ1PPPjRdiNpa0n2vA+TCBhJhZoOsKbHXmYTJhiug20dFHd5BE=
X-Google-Smtp-Source: AGHT+IHC937rfNHLj2Ketv7dG7aNMCiksImoAukkEKJ9dvpFLVmtwt42vPOJP0hdb3k7rsxJhY51EU50UuhO23sAjZg=
X-Received: by 2002:a17:902:f543:b0:23f:f96d:7581 with SMTP id
 d9443c01a7336-2429f57624bmr34189925ad.20.1754480112491; Wed, 06 Aug 2025
 04:35:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801092720.1845282-1-verhaegen@google.com>
 <20250801092720.1845282-3-verhaegen@google.com> <aJGM2zXS6hOLDFm1@vaman>
In-Reply-To: <aJGM2zXS6hOLDFm1@vaman>
From: George Verhaegen <verhaegen@google.com>
Date: Wed, 6 Aug 2025 12:34:46 +0100
X-Gm-Features: Ac12FXxWf93J7w4DWWOw2n4oH9fFRZLDWbJIwgwctng7o16PPG-OqeOwbdPfDf8
Message-ID: <CAAntYmLYVeMEpEtzhhMZ_kyAuwqv5suQK=rjF4ixgu1QH3yk=w@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64
 ioctl
To: Vinod Koul <vkoul@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Srinivas Kandagatla <srini@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	kernel-team@android.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-arm-msm@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-arm-kernel@lists.infradead.org, Miller Liang <millerliang@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 05 Aug 2025 06:47:59 +0200,
Vinod Koul wrote:
>
> On 01-08-25, 10:27, Joris Verhaegen wrote:
> > The previous patch introduced the internal infrastructure for handling
> > 64-bit timestamps. This patch exposes this capability to user-space.
> >
> > Define the new ioctl command SNDRV_COMPRESS_TSTAMP64, which allows
> > applications to fetch the overflow-safe struct snd_compr_tstamp64.
> >
> > The ioctl dispatch table is updated to handle the new command by
> > calling a new snd_compr_tstamp64 handler, while the legacy path is
> > renamed to snd_compr_tstamp32 for clarity.
> >
> > This patch bumps the SNDRV_COMPRESS_VERSION to 0.4.0.
> >
> > Reviewed-by: Miller Liang <millerliang@google.com>
> > Tested-by: Joris Verhaegen <verhaegen@google.com>
> > Signed-off-by: Joris Verhaegen <verhaegen@google.com>
> > ---
> >  include/uapi/sound/compress_offload.h |  5 +++--
> >  sound/core/compress_offload.c         | 19 +++++++++++++------
> >  2 files changed, 16 insertions(+), 8 deletions(-)
> >
> > diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
> > index abd0ea3f86ee..70b8921601f9 100644
> > --- a/include/uapi/sound/compress_offload.h
> > +++ b/include/uapi/sound/compress_offload.h
> > @@ -13,8 +13,7 @@
> >  #include <sound/asound.h>
> >  #include <sound/compress_params.h>
> >
> > -
> > -#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 3, 0)
> > +#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 4, 0)
> >  /**
> >   * struct snd_compressed_buffer - compressed buffer
> >   * @fragment_size: size of buffer fragment in bytes
> > @@ -208,6 +207,7 @@ struct snd_compr_task_status {
> >   * Note: only codec params can be changed runtime and stream params cant be
> >   * SNDRV_COMPRESS_GET_PARAMS: Query codec params
> >   * SNDRV_COMPRESS_TSTAMP: get the current timestamp value
> > + * SNDRV_COMPRESS_TSTAMP64: get the current timestamp value in 64 bit format
> >   * SNDRV_COMPRESS_AVAIL: get the current buffer avail value.
> >   * This also queries the tstamp properties
> >   * SNDRV_COMPRESS_PAUSE: Pause the running stream
> > @@ -230,6 +230,7 @@ struct snd_compr_task_status {
> >                                              struct snd_compr_metadata)
> >  #define SNDRV_COMPRESS_TSTAMP              _IOR('C', 0x20, struct snd_compr_tstamp)
> >  #define SNDRV_COMPRESS_AVAIL               _IOR('C', 0x21, struct snd_compr_avail)
> > +#define SNDRV_COMPRESS_TSTAMP64            _IOR('C', 0x22, struct snd_compr_tstamp64)
> >  #define SNDRV_COMPRESS_PAUSE               _IO('C', 0x30)
> >  #define SNDRV_COMPRESS_RESUME              _IO('C', 0x31)
> >  #define SNDRV_COMPRESS_START               _IO('C', 0x32)
> > diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> > index d3164aa07158..445220fdb6a0 100644
> > --- a/sound/core/compress_offload.c
> > +++ b/sound/core/compress_offload.c
> > @@ -736,18 +736,23 @@ snd_compr_set_metadata(struct snd_compr_stream *stream, unsigned long arg)
> >     return retval;
> >  }
> >
> > -static inline int
> > -snd_compr_tstamp(struct snd_compr_stream *stream, unsigned long arg)
> > +static inline int snd_compr_tstamp(struct snd_compr_stream *stream,
> > +                              unsigned long arg, bool is_32bit)
> >  {
> >     struct snd_compr_tstamp64 tstamp64 = { 0 };
> >     struct snd_compr_tstamp tstamp32 = { 0 };
> > +   const void *copy_from = &tstamp64;
> > +   size_t copy_size = sizeof(tstamp64);
> >     int ret;
> >
> >     ret = snd_compr_update_tstamp(stream, &tstamp64);
> >     if (ret == 0) {
> > -           snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
> > -           ret = copy_to_user((struct snd_compr_tstamp __user *)arg,
> > -                              &tstamp32, sizeof(tstamp32)) ?
> > +           if (is_32bit) {
> > +                   snd_compr_tstamp32_from_64(&tstamp32, &tstamp64);
> > +                   copy_from = &tstamp32;
> > +                   copy_size = sizeof(tstamp32);
> > +           }
>
> Most of the applications and people would be 32bit right now and we
> expect this to progressively change, but then this imposes a penalty as
> default path is 64 bit, since we expect this ioctl to be called very
> frequently, should we do this optimization for 64bit here?

Valid point about optimizing the common path. But since the underlying
.pointer op was changed in the patch V3 to always return a 64-bit
snd_compr_tstamp64, there is no longer a "native" 32-bit path to fetch.

Any call to the legacy SNDRV_COMPRESS_TSTAMP ioctl must fetch the 64-bit
value and then truncate it down. The current patch reflects this by sharing the
common 64-bit fetch and then conditionally performing the truncation to 32-bit.
Splitting the function would result in two functions that both call
snd_compr_update_tstamp() to get the 64-bit data, so there would be code
duplication with no performance gain.

Thanks,
George

