Return-Path: <linux-arm-msm+bounces-64612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58771B01E70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 15:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1153178468
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 13:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1C62DCF49;
	Fri, 11 Jul 2025 13:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DOwjTDiV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F8D2D949C
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752242312; cv=none; b=PEBZLDU6kgTQ4mOqRT96DJeLRzFY6h8Lzt09yIUsQ1dTRXK8nbhv6mhaeh4oJYgy8NtG9FyUypLJHTYrcUkieC3lzBD1GtR6OxmpKcIVK4g2d7cGiS6iudHzXtwBH+2OkGcjYQl6N0USJWX0bTZCG9AqSvX4c6uCOtSWmrtqDbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752242312; c=relaxed/simple;
	bh=pNqonM4UVtrsALbVQxE7BjqrmBap83H9yb8p9qwz7o4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QHu3P5nYaHzlNELY+bJxe9hIkMltmfe02gIXpuDHeH46YhIx+X5K6adLz0y381vvIxCycA+xyl05C1OhYbko2aPnaGRBvcKEh38LqFok5p0eOoEoB/gjthOhTvqDL+7tZy8WfKmLQVK7pzIUVXMX+XrmDYvjoEbLdRpSSZuJEl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DOwjTDiV; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b34a78bb6e7so1746971a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 06:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752242310; x=1752847110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNqonM4UVtrsALbVQxE7BjqrmBap83H9yb8p9qwz7o4=;
        b=DOwjTDiV/nNBIE5obEmvtiPRS955V0t1VfTftQX9So+5sPYBiTaYcaSq+zj3bLy6bE
         sFYvscgXurxNNTkDDf332Mr2nk2KHg7XsMGgGKlw4MtHLYMyhJSc77b4ac0+2cuVQuB+
         RkPTB78ukfB1BtwxUtUK1ckCsZeMKm8FLGYX/PSO1aK+/PPnbMZJg0ClQ6qy5qr+8rej
         gvvhs/3dE2YdVRLb4aSssWk2ax6uHd12V4p0pp3PWJOjHvPbBzt78q0TTzazeBlfufyR
         pp2oPCBQWkBgwDDiVVcgimBWrhEM/Yx6LRDddFOZkt6Olj9MaPCcJSeREn499F4wV/KX
         cXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752242310; x=1752847110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNqonM4UVtrsALbVQxE7BjqrmBap83H9yb8p9qwz7o4=;
        b=goAuyxI+8eA2dXMVJFVFxWxrq34qvEoiSpr9miPvLjGtIxbSwdhwyNVvtsTSOHpV9q
         C1T2AMBE0q/3RE9lvF4fE6MkAkxYVP51tuF0iChj9lvGnMFmNFi9fItA5jz7KBbtGdhB
         IMQhl7WFH6bDdb56E/3zR8ZmJKuvuzq70BXrH4m5Oe3t3hNC1nU+KfkPVX7q3u1DO7Ex
         sfzoJgRx24deNRhunIV0LD4m53weFJJctlHzUm2vk0+MVq202jWON90W042NncsS3JQa
         Xje+gEjgwmu0f4KSk+EahMmtvPW8w9YcASl4/OcFROjfMDiETkpke3YJjXq7BS6XeH+5
         PuSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3zdm64hJrB9aNe2X/wt5OKB3vuISRT7oEjj5XorlQhOLuoq/gADhXss4IwzhkMmHIf059OUrOSQ6e/sJB@vger.kernel.org
X-Gm-Message-State: AOJu0YwQCTIJZi07qTwj8nv88NRg37xwof9sa0TLiBxrVu5I/gTmyBAN
	gE0tu9Gt5PuPBCQhB0uBCqx0HYHoHCAlfex3JFVibffmCAbexczsWxuW34S4/vatz4nanM2cqSc
	ozJv/XE4YkAJvGDVXbIaQ2rL/ipu3ED/Eq7kpcM5U
X-Gm-Gg: ASbGncv1nf+mySFZnA8cVc8DbM6SxBi0vdJCKgnCN1gMHm7IgS9Fh6K2BS3eQ0asH2X
	ek6GzxXb8VlmjcvfLoeIkGbbXXixrx9MEAODWN0b9Xx1niLhiArR3b5NiQeyQPbmENQt86hEESq
	FImNKNxSJUibvUFmbTzP5VXACqwSPof6mww5EcV3g1d/QTmW22zVA0j3wuHy21/+Ul3CINzkhuV
	kagJl7ftUTTK3NBv4hOOb511ReueV4BCV8Czv8K
X-Google-Smtp-Source: AGHT+IF9vpsS88cqwJvceZ3AVWYOHULHoLV6jnQ0fxFPUTnJrLpeVWrilV12HX6w7fKkYy/KsZQkRWej43wmqe/0mho=
X-Received: by 2002:a17:90b:33c2:b0:313:2754:5910 with SMTP id
 98e67ed59e1d1-31c4cb8aa2dmr5577396a91.15.1752242308018; Fri, 11 Jul 2025
 06:58:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711082441.4193295-1-verhaegen@google.com> <aHEEu1eSSGRhITmW@vaman>
In-Reply-To: <aHEEu1eSSGRhITmW@vaman>
From: George Verhaegen <verhaegen@google.com>
Date: Fri, 11 Jul 2025 14:58:01 +0100
X-Gm-Features: Ac12FXwkr5vfJuzXyUzX28ecPpQ4ARo3qP5rhcHUhMh4j4kcitfjBXfbRa88hKs
Message-ID: <CAAntYmKea1p=ao3OOWb=1Q+BXdyo1SCm9qGb_JMC5ry5DQVt-Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] ALSA: compress_offload: Add 64-bit safe timestamp API
To: Vinod Koul <vkoul@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
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
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Jul 2025 at 13:34, Vinod Koul <vkoul@kernel.org> wrote:
> In your testing when did you observe the overflow condition?

I observed an overflow after ~3.1 hours.
I used a stream with bitrate =3D 3072 kbps.
So the field copied_total in struct snd_compr_tstamp
overflows after 4294967295=C3=B7(3072000/8)=C3=B760=C3=B760=3D ~3.10689 hou=
rs.

> Please share patches for tinycompress support too, we need those to test
> this

I didn't make changes to tinycompress. The overflow happens in the
kernel file compress_offload.c. As a test, I let it run for more than
3.1 hours and observed that the overflow no longer occurs.
The overflow is in
stream->runtime->total_bytes_transferred =3D tstamp->copied_total

