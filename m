Return-Path: <linux-arm-msm+bounces-66708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FD0B11DF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 13:52:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D163561EB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 11:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E052E6103;
	Fri, 25 Jul 2025 11:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wAc1RrR3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FE72E4266
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 11:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753444352; cv=none; b=nkc8cX3V4Z0jgVCRMqIsvKGMaBQwy58q75UkhuYSo7sQ2jT73v0TTQfCN5kgitE0P4rmrzpCw2m1m4Os242FpRDfSTUCJJLDMOMzD83SGmg3pXzDGIgBHCQrX/phhkRN4glZyGJdOj8ZE1QExMkUHHAuRNbZE+O5rwDwboCtkGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753444352; c=relaxed/simple;
	bh=QHfUzApUEKGymgCU0ibV0RvNyL8ndz/ADx0x3sfKtKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A7YbBvMnjLb3uGMCCp4kxwZm1YNxAQ+QLWMIG/YPi5uZ2UL8uRDgEskxrEFJQ54BwPmhAz5oL4seIdeSzwpqdf03Ttml/eYPfAXYnzaUrarU4YK84t74OZD5ZppJ7JIbPjhdjoCmTOVl+gFAzU5+Pw3k9aBYp+fv+Z0iOOixAeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wAc1RrR3; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b271f3ae786so1651334a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 04:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753444350; x=1754049150; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QHfUzApUEKGymgCU0ibV0RvNyL8ndz/ADx0x3sfKtKE=;
        b=wAc1RrR3V65K7EmNOT7Cidhoa1sYsOdSfR9dXTBTrzD/6iQfKFfi9rTj0gKDJh7UzF
         ZAguFrSZXIl7j39OZxnVML77w3uCBLbA7v/CCrMtQCr1ijN1Ammvd/Y0FTJvTEVxAGuL
         qXH4mfDbKBIlTEwTg0FNrOyX2tR1jTmXHQya4wX19fZ+SQCAoiZJR3Lzx0dspemgdh4D
         gyhq/OzY2Mdonlb/aX7NRziRF6SyfmrOv902hpSA9BGhYNLboQm4Qd7WNde4wWZ7Vqxx
         BZ2v5fKZFh4FmKceD5T4ZmGwyzNADi5unOUXXDBPQKfpGwLJdCCVC16XuursvRSJf7mU
         CrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753444350; x=1754049150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QHfUzApUEKGymgCU0ibV0RvNyL8ndz/ADx0x3sfKtKE=;
        b=n6E/DiZTL9gMlafip+DJgvKtK5uBgK43uNZuQqFJIV2LA6ciHVVCFYUoaHXfl0BxmW
         f9H6HrlSyxpKiy8sATg4MdMyNdLaQdC2+2MMVhkjOrzTEN5lVCl8ZRCA63VP0QMv0d7b
         X7OjOw4gLRO96b8IdgH9SskkzKVqylESQUcNewa8Yzuw+VtLsuKRVXWgWg7iMZlw0zAS
         VIrUFYA8EqfzBHdNB7Acscm+WEifzQ7zMXSnhPjebORBsV6FT6UE5iFpk/fmZlVUtHT+
         1m56eAsLRcGD2BDD3HFug6s6sB4s/v81lmJb+YpxZeUk+2oyE6gSuTiPRFc1IQ8ajQEB
         JSxg==
X-Forwarded-Encrypted: i=1; AJvYcCUB+wxyWL1iCLq3CK7LMnHsfg9si7UmxX6kqj3osXTXcnnnH53EPOpeo2oc7ywsV1sZhSJwYP6O/k4KJZVh@vger.kernel.org
X-Gm-Message-State: AOJu0YwnibW4viZgETKcxP/DoAGJm08yQMB7MvjwDw/4+1vR8neNuF71
	g5H9WHziZIl9F9+d2rPrUDgbz1ZaySGDtGKTSQkoNve37Cf663Bbc3ivJWpAwMv3hLdWqhDnc5Z
	XJx9Uv1W1Ui5qtyYBzlZaoziXM2J6fraEkO3DYOy6
X-Gm-Gg: ASbGncvppLkFpwJIdtcYDreSiTzu0MPfGk7AyHUdQVnRnd5mVU8vaG2ta4ur+bP7VxK
	xO9RpoB/N1jjmQS0mac4iQ9lHTxlBpy1/3o/Ul2gE57YHGaHQnhfD8qKxtJF17jQwm3/m3tmaHw
	kvuZnoMIheYi3UokCj80j2n26EJstOJ5Z0syyZoQ2KEoRKguZa9KCJuo8VUMCQmC7CWkQcj/JfL
	3EGUDjsQPjeUogU5ZZmPrY9XP24+990CiT/cN6LN7GOvfjkdM8=
X-Google-Smtp-Source: AGHT+IG5GfmK3MrOBGZHbuRXhEHK6RPABvTMzdf8n43yLckQ5vo4Q8NkC5md2ykU1zeemIwnNM0VGxJVKLMifYpsCx8=
X-Received: by 2002:a17:902:ea0e:b0:234:c8f6:1b11 with SMTP id
 d9443c01a7336-23fb3167767mr23036425ad.44.1753444349904; Fri, 25 Jul 2025
 04:52:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711082441.4193295-1-verhaegen@google.com>
 <aHEEu1eSSGRhITmW@vaman> <CAAntYmKea1p=ao3OOWb=1Q+BXdyo1SCm9qGb_JMC5ry5DQVt-Q@mail.gmail.com>
 <aHZLvVnNiBcqXdXG@vaman>
In-Reply-To: <aHZLvVnNiBcqXdXG@vaman>
From: George Verhaegen <verhaegen@google.com>
Date: Fri, 25 Jul 2025 12:52:01 +0100
X-Gm-Features: Ac12FXyZSuRHRd-IFK6__wpasUMXKZCQVkzaxu6X84fGcQfro1hcT6PjZAqbpBc
Message-ID: <CAAntYmLn28XD=Zc2ZeCnhEiUuoa9iq-W9EiK2QXY5YfYcsi0cw@mail.gmail.com>
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

On Tue, 15 Jul 2025 at 13:38, Vinod Koul <vkoul@kernel.org> wrote:
> You need to add support for new ioctl in tinycompress too

Thanks, created pull request at
https://github.com/alsa-project/tinycompress/pull/29

