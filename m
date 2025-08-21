Return-Path: <linux-arm-msm+bounces-70110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 248ACB2F306
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 10:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF9B4173A1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 08:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F181B2D7809;
	Thu, 21 Aug 2025 08:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KxD9TlRC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391F82EE5F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 08:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755766453; cv=none; b=sWfLRfIjsR5GjPZoSv3c5WYRA/3aTD9GLXs/fk/cypriyTsctwiWN3MPL9+o2TsR+nyOveWdIcB/Wax9Dkeed+Ocu9e41eArMsxnjHNCp7ZGra/Biv36oEs0x9pzatJdku9isliOgp1EVF+lnYVELpM6I6Gg3w/0nG5YKxdJcoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755766453; c=relaxed/simple;
	bh=GIrYS0OmlFt9LKTpoCymctnhQ+44IqZBFk1EpEs09Uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NUCMr/Y0AbCNjbHsOlVdasc2CRbb36/EDjQF5EoKXw+bmZsuqs8bs6BNnPVWTwCxX7N7ZfOlA+FZPDQBEQ/o/JxXCICguQVC1sT7YAHSA3wsTeQjl81f2qZSMBmT2aj+2dDvXlWOE1DjjP9O7SnZ5aLJw7TgFD8A2AmVAojJV+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KxD9TlRC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-244581c3b43so6597115ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 01:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755766451; x=1756371251; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PDwM7xFUlPs+9+76w2+0oYaXgXFtT0j/TV/VcSqIHPw=;
        b=KxD9TlRCA0A4ZXAR8Okitj5EU4UFjLrjRCn6OrHRKyS9gOqo0shoSjvaOvmu2w12iH
         alzvpbSmmNpzxL8VQsTXcPD7nPK1qXolRgAJyPLiglhlueISHLEo8ItCM6QjfzzrkOe0
         85El6+zUOtsfmbdVSIzqOT1vx0vS9a9N/snvIjQ7mVhEmmb8uyRefVPjjOQSUy+ttTSo
         n0hVUgS1gkSt2xZZsxCs6orUuYe8jj+e1BA/OuiKF+v3FwS9pL6DEW4rTUbCxYEJYvnA
         5cNnqDZ1AIIwIqNbF9avj2IIOp6N1ilwkb0wG/KD6RBlPG0pQ8Jn4b49kRutvR4rh9Yi
         HO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755766451; x=1756371251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDwM7xFUlPs+9+76w2+0oYaXgXFtT0j/TV/VcSqIHPw=;
        b=gJximLJvZaLDbhlU7rO7hXgzDRFHLaiaG3OOhMgq/COwxK/zxNGm6W1dtYECFiLMn2
         +wniEF2SJevnlLuTTRF2oECtZM9aPFbyNwZNAVagFypIfT744RO77eRgu7AqYSAOMo7C
         P6QwOJRlwzwEN4r8e2oH/bd4SSq1MoL5Gny2qyB1ZjwdiPEPxvCe4wKe1127OBn9Yt2H
         kPk2lF5b7xluk6QhLqNo9MYDoG+N33Lz/rhmnUWq+1le2qTl0nhCUVKNjIxJn78YRzIU
         Dlbc3Ys51StNCh43AWT/VCeX+DzGeYNRE3ZPQUAGNFg67zv4yMCsylvB/b5C+hVzr4De
         oxlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpWTe0kw4SWXz4qGh+r5126baS0qw7lfde1esMhUFxzBrejRpN1xj5eh2llLxFJoRmBTxJ7ydaGnp2uZvU@vger.kernel.org
X-Gm-Message-State: AOJu0YzWYjL3nW5o8hcHmuMXHyx9XPABXMjRDsTP53TM3T4p4cAcV09c
	0G0mQckiqZL5vgPnnCCOilOIQ5kaBGDAPkL5LfnTZv/ddoCV1i3mufDn/OtuFFew6kalikNS1hp
	DwE248E5ePCQUvb19I1Z2UTPIr4TIIZdonIoMUsZJ
X-Gm-Gg: ASbGnctZWaX+NJhJx/Sc13W7EXJcF4LFRtv8KQ04+Ckag8G0/QaF+hjhfJ4qLAlWdTT
	/piy/vX9D4h0bFH2Gz+WsG6c87N0Y32wtAGDklwsvHOPiF383NTXNQrcNZjWewQ24thtObqwHm8
	xhdY6/1RF92tB2qps/2Lc4HripON83Pja/6QaYAG1gjfGav/38qetqrJG033d+oGOJITlje9bov
	XrnRvESu2VqUEtrKQxs+CLg
X-Google-Smtp-Source: AGHT+IEOJ+GiHnoM0xXwePeIaKaKu+bZ/GYxKzuA6yTE5qBa74SEtPQ+etUTrmOlcSdW9xiNKjgOpyr6oyET1zwx1W4=
X-Received: by 2002:a17:903:46c3:b0:246:570:2d93 with SMTP id
 d9443c01a7336-24605703276mr19916595ad.59.1755766451273; Thu, 21 Aug 2025
 01:54:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801092720.1845282-1-verhaegen@google.com>
 <20250801092720.1845282-4-verhaegen@google.com> <aJGNgphPCTuE7FFD@vaman>
In-Reply-To: <aJGNgphPCTuE7FFD@vaman>
From: George Verhaegen <verhaegen@google.com>
Date: Thu, 21 Aug 2025 10:53:44 +0200
X-Gm-Features: Ac12FXzXjgkmnFwjD3_zb-Ps1Osi-BQvLWpKMG84-DK22RezOWC3UFnJT0qOukE
Message-ID: <CAAntYmKu_tsm1D9koxCZmHpBMQYhrt-HxNBYFeWz6rCqdMZqPg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] ALSA: compress_offload: Add SNDRV_COMPRESS_AVAIL64 ioctl
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

On Tue, 5 Aug 2025 at 06:50, Vinod Koul <vkoul@kernel.org> wrote:
> >  static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
> > -             struct snd_compr_avail *avail)
> > +                                struct snd_compr_avail64 *avail)
> >  {
> > -     struct snd_compr_tstamp64 tstamp64 = { 0 };
> > -
> >       memset(avail, 0, sizeof(*avail));
> > -     snd_compr_update_tstamp(stream, &tstamp64);
> > -     snd_compr_tstamp32_from_64(&avail->tstamp, &tstamp64);
> > +     snd_compr_update_tstamp(stream, &avail->tstamp);
> >       /* Still need to return avail even if tstamp can't be filled in */
> >
> >       if (stream->runtime->total_bytes_available == 0 &&
> > @@ -233,32 +230,47 @@ static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
> >       }
> >
> >       avail->avail = stream->runtime->total_bytes_available -
> > -                     stream->runtime->total_bytes_transferred;
> > +                    stream->runtime->total_bytes_transferred;
>
> Lets not do formatting changes in current patch please

I'm happy to revert the formatting changes. Are you only referring to
the alignment of the subtraction operation (avail->avail), or
something else too? Note that the second line of the function
signature of snd_compr_calc_avail got re-aligned by clang-format due
to an actual change (type change to struct snd_compr_avail64) so I
assume the re-alignment here is OK, but please confirm.

> >       if (stream->direction == SND_COMPRESS_PLAYBACK)
> >               avail->avail = stream->runtime->buffer_size - avail->avail;
> >
> > -     pr_debug("ret avail as %llu\n", avail->avail);
> > +     pr_debug("ret avail as %zu\n", (size_t)avail->avail);
> >       return avail->avail;
> >  }
> >
> >  static inline size_t snd_compr_get_avail(struct snd_compr_stream *stream)
> >  {
> > -     struct snd_compr_avail avail;
> > +     struct snd_compr_avail64 avail;
> >
> >       return snd_compr_calc_avail(stream, &avail);
> >  }
> >
> > -static int
> > -snd_compr_ioctl_avail(struct snd_compr_stream *stream, unsigned long arg)
> > +static void snd_compr_avail32_from_64(struct snd_compr_avail *avail32,
> > +                                   const struct snd_compr_avail64 *avail64)
> >  {
> > -     struct snd_compr_avail ioctl_avail;
> > +     avail32->avail = avail64->avail;
> > +     snd_compr_tstamp32_from_64(&avail32->tstamp, &avail64->tstamp);
> > +}
> > +
> > +static int snd_compr_ioctl_avail(struct snd_compr_stream *stream,
> > +                              unsigned long arg, bool is_32bit)
> > +{
> > +     struct snd_compr_avail64 ioctl_avail64;
> > +     struct snd_compr_avail ioctl_avail32;
> >       size_t avail;
> > +     const void *copy_from = &ioctl_avail64;
> > +     size_t copy_size = sizeof(ioctl_avail64);
> >
> >       if (stream->direction == SND_COMPRESS_ACCEL)
> >               return -EBADFD;
> >
> > -     avail = snd_compr_calc_avail(stream, &ioctl_avail);
> > -     ioctl_avail.avail = avail;
> > +     avail = snd_compr_calc_avail(stream, &ioctl_avail64);
> > +     ioctl_avail64.avail = avail;
> > +     if (is_32bit) {
> > +             snd_compr_avail32_from_64(&ioctl_avail32, &ioctl_avail64);
> > +             copy_from = &ioctl_avail32;
> > +             copy_size = sizeof(ioctl_avail32);
> > +     }
>
> Same comment as previous patch

As agreed in the previous patch, will leave as is.

Thanks,
George

