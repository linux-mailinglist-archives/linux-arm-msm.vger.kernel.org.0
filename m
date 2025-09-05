Return-Path: <linux-arm-msm+bounces-72232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1A5B45303
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 11:22:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AEB65C120E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 09:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F4A3054DD;
	Fri,  5 Sep 2025 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ElP1XsUJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1213F3043D1
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 09:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757063874; cv=none; b=g7X9xRZPIjYRTuuEy6bVJHMqEzsSxE28yhjlmcTvsTOZlZibqQkq8tLLnGo4uQI63ysTNl2pFhfTdCUMvLe0dzSkiEZf0oBqEEbPR0A1buMwpqwcagZ4pNYwy/a2UT0oH9150Jkh4tzX8ivHHF85Vni1x1tGaqFLM4+rKT5fObg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757063874; c=relaxed/simple;
	bh=HtCixh7So8A8SMkZfbaqBqooWI8/h+PC2ysjtTjTdHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pRcygzfX1VOLEHv170rdRwudqyOk3t4hClRFXJLTcQx+0YwY/Q4s4fYGsYYa06XXyt10CcWNAWrqMc15dn3+Mf5VjYcAtxJjqBe21CWrLTxsHhXXjAhmLQ/NcpL0Bosx52awxsgt4mwf4xCkCGelFhGKOx+ZhkZots6Iycqs/jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ElP1XsUJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-249406d5878so19176075ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 02:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757063871; x=1757668671; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hImylEF8kRxc0pZCmefapOdNIdI9K4EzdImQ0P7qUyc=;
        b=ElP1XsUJF91WNBUDleqgVI+uuR7WzOBEIVoKx0IP/+mbpQrrgCF+2bfTkkea7HBBzB
         DddQ8GQwvdkTJVAj9pIEEVcWzo15/h/UksavVYJc9JnHrRaz0bxE9Mw0lMUzWPJP43P1
         z7gVnMnVB1k0cS6fLUl04vIdF3v6ppMzLQHlDKzqIEQ0Oj+BpHQvyjTajI91P6eBHKHx
         U6tZDXOGq0rNMzeYqNpFNiRgKoDeIFgsyciiGYt+0v6xAlJSzKrf2+A3PyxNRRwOstlJ
         C5N/sQePaiHBvSmLxJxFNvNOo7NeMWhg2Lx40tve0R5z58i9F0s7yh66mD8byEaSfxLd
         u/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757063871; x=1757668671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hImylEF8kRxc0pZCmefapOdNIdI9K4EzdImQ0P7qUyc=;
        b=sZrcgJiRU3FNuBuhdFj9OgnsKRyxqlADDqm4fu1xs9uZzGPiGeoR1EoR8wSHiEr3aw
         e77zEocI4G7WMquvNkTZBEYJ2BeZ+wIbt8828yyOg1ukQwSw4QjGqkF5Xdedsup1jz6j
         lyw8npI1BaBMowafFTHnA+x13j2Rl1kMY8t87Aevce1mz7p2umPHRAFoPQjgEG0R090I
         Uce54tlI8Z1GaFlBccly4532IMX/uKoI1kIemrOwq+pWBbQaUnyY8ETtXa1LGqkT/bCk
         CWoVgHqdFHe3wNjfHhfC3MUjLcFOZKR8N58KTLTAeW39T07H7nqpQ0yUwKbKRZHI3bg2
         BcNw==
X-Forwarded-Encrypted: i=1; AJvYcCWJkRprVCaOsI5kn4S9z0fgzeaqqzUidjry+TXZA28cz5Nb3Xjz1kbTj6/vaLayE519lBxAVQuT93xaL4P1@vger.kernel.org
X-Gm-Message-State: AOJu0YwM/rsiE3I9UjHc/2igAU6ZCc4vd/y0amCgYJ9AWMK761YfLB2G
	3LCMlIRM6eNFQgSpcW0K9GRVY/AXnnkXeLxreLtSBpRgBhIorwHIsVSYPZsGTFdaS6e4kp38nCq
	tzi1WqmQK0JQrmxh2vinNXTxJ//97xDtxmYSQwtqg
X-Gm-Gg: ASbGncu29Qu1vHjPkDZjXiAnxSwSPehyp1I2J0nQRTAaHv6LdxSC1Imon9QmfF4oY2J
	B2ZbpsWEscZtZ8hcTYjRu62WPctng/pohT6oswontYZVqSnmuC2SiFEtNYtkUjphBRO1P0w2VdA
	9wN2VaaLLiBePJYf1nXv3UBIDORViPPnAUrLDnZejgB+vgt2pglkZsFVxnkzI2mICdN/qEmuMoF
	YIp04Lw0WOnkO8NMBzxre4eBbLoceu6am+3Ks9iuiJ0SQf89y36QyMtYA==
X-Google-Smtp-Source: AGHT+IF9S6iUUusneiZYRAF8ubXHonr/3eNJ3dxl0xbw7JyDRWMcPsctZ7caRsOI3KB+wShmBqhQXJYDFiofBVvADxw=
X-Received: by 2002:a17:903:3d0f:b0:24c:c8d1:2bec with SMTP id
 d9443c01a7336-24cc8d12d26mr73181375ad.40.1757063871035; Fri, 05 Sep 2025
 02:17:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801092720.1845282-1-verhaegen@google.com>
 <20250801092720.1845282-3-verhaegen@google.com> <aJGM2zXS6hOLDFm1@vaman>
 <87h5ym1f75.wl-tiwai@suse.de> <aKMzGRzeRqkOwTNS@opensource.cirrus.com>
 <aKQGuPgwXE-Unzeq@vaman> <87bjo96t2k.wl-tiwai@suse.de>
In-Reply-To: <87bjo96t2k.wl-tiwai@suse.de>
From: George Verhaegen <verhaegen@google.com>
Date: Fri, 5 Sep 2025 10:17:24 +0100
X-Gm-Features: Ac12FXyMMz2kHiEopHVWkiVekeij32ZuBn5pZ91dcPOnuZoD_YGrtaq5a00yJT4
Message-ID: <CAAntYmLGiqfZDKi2ndB7vk1GGZ7=FdozFvUFtMsKhVf0AxdsCw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] ALSA: compress_offload: Add SNDRV_COMPRESS_TSTAMP64
 ioctl
To: Takashi Iwai <tiwai@suse.de>
Cc: Vinod Koul <vkoul@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
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

On Thu, 21 Aug 2025 at 08:18, Takashi Iwai <tiwai@suse.de> wrote:
> OK, Joris, could you submit v5 with correction of what Vinod
> suggested in reviews?

Submitted v5 with revert of the alignment change. I think that was the
only remaining open item.

Thanks,
  George (Joris)

