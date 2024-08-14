Return-Path: <linux-arm-msm+bounces-28459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8B7951626
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 10:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCC921F23508
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 08:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A2E13D52A;
	Wed, 14 Aug 2024 08:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nilz8gnG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C302A13D502
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 08:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723622837; cv=none; b=auYg9C0GsjkBP8Ae2QaDKub5poKghNrjnofmedbqkv6FMIvmsj3IizJX2O4btjDXqZo5JruC4kkhJ8RHrkGtBDytsM80m9HZ/i9/RTIhvN0CWWDn7BiuK8E8BF4/WcnYK/Owd5ls8bxrO3rK97h6t6TVQvP3u4zpiT37GWb3YIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723622837; c=relaxed/simple;
	bh=zl6oZ0yQ2AuljC/+g5tdcuw5JSm8FT8fOqYmulxxhYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MyLzfE0jpmFsC3jpTcKNHtdxwBDL3+GU5sPJaxGTl8FKtktZTXksugH5mfJdsnhB7ky2coz/1w0TjXHqsmxHTRqt4fpKm6qfCWALFxj8urwYzAMoVlXMIiIHDK6MQYTs7lUNOB8/HsJ5IWkDw1kCjaInPq5dN9T0+12QmAH8lV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nilz8gnG; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52efe4c7c16so2887376e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 01:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723622834; x=1724227634; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NZJa2A/wBP2dRUmaz/amMD5VJoMLHB0MhQTzcG7HnQo=;
        b=nilz8gnGK9yQaZv5yhlthBpGNjD/lkHTNwfqiWULtHtp1FiEXSz2nOkFUHYeBAMSbF
         l4ay+IbKwyB0Xkt51kmWlkZ3S8M0I6nczOANysdNYoq6jxwrvDDP8vhxJc4f1cIPo7w0
         Y5VGiIQqUivDFK0m6IEHiWZ74bwKdpriC8XE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723622834; x=1724227634;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZJa2A/wBP2dRUmaz/amMD5VJoMLHB0MhQTzcG7HnQo=;
        b=BHj0u59FJt9hxJEbgUOZBqA/sbwC2sVId/a5XZiIyKbFqP0L1ZyqcP1fS/N9wr5IBW
         S5pT2t4GBHTvcLbjXABs7FHYhJkqyktBvT46KEMoJsP641s/A8xEgPvVJ80DfgH5SPiH
         P4s0u3b6erK1zD3bbIOXDsPrw7lytzaCzG78mEThG4X4hlcYJuAivs8B0NksWjFdmdzT
         GbQk/BDV4XXFEfwmHSJJcRQ4YuAi4c3gWm6ZBHaknX9Mk9pJiUlp3ys/KYt+kGyEE1Wa
         RyBI/erQ015JeWay6aHIyVutcomWYwjEAofjHYHFHTDOkcPzgTAZTsb26m6e7NudEtx/
         tRhw==
X-Forwarded-Encrypted: i=1; AJvYcCUVwkrt+CTd2nkTUr5XeYqfqQ4GopoA+3WFISQAngiwyjYoFEgoPwlyHT7jWv+cGCpjuQW1L48mPgzHLVBfP2iamKC63t/TZz6wgoNE9Q==
X-Gm-Message-State: AOJu0YwRFooxF+PaAKTUHHwvb4L7lsQV8nRg8fRS22F8UyBdFVKrpQ6i
	HmyAfkuAFifD+5jz0ToFghTo5Y09fZA++kN02omhJaPChrMQrSbQpB8WIZe9Y438Z4wgErbfgrh
	OdfF7
X-Google-Smtp-Source: AGHT+IFgicmrCAB4VtHupAdxMHyIvw+Cik0mh1wqW1Kfd+x/yBmfis11rs51EyAqaI4qIyFnfxGGMg==
X-Received: by 2002:a05:6512:b07:b0:530:ab31:5683 with SMTP id 2adb3069b0e04-532eda6b677mr1257180e87.14.1723622833605;
        Wed, 14 Aug 2024 01:07:13 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200eb3cb2sm1215108e87.47.2024.08.14.01.07.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 01:07:12 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ef2fccca2cso65772031fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 01:07:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXRIROxS/fRitarGrgDLk8PLXs8HvYI29/iO+BdJkzZJYr4VAMH+NnNndX4aKbQeakKg3osyUGZXgGpTEQ2qTYwwINr2AhZ68G/7vvzlg==
X-Received: by 2002:a2e:9898:0:b0:2f2:b2f7:c8a3 with SMTP id
 38308e7fff4ca-2f3aa1fe717mr11203131fa.44.1723622831290; Wed, 14 Aug 2024
 01:07:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
 <20240813-cocci-flexarray-v6-10-de903fd8d988@chromium.org> <20240814044138.GA8686@google.com>
In-Reply-To: <20240814044138.GA8686@google.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Aug 2024 10:06:58 +0200
X-Gmail-Original-Message-ID: <CANiDSCt2qEtA8_PFtCLz9uSsY2TWSa5W2tOZVt=TrdE7A2Z8Tg@mail.gmail.com>
Message-ID: <CANiDSCt2qEtA8_PFtCLz9uSsY2TWSa5W2tOZVt=TrdE7A2Z8Tg@mail.gmail.com>
Subject: Re: [PATCH v6 10/10] media: venus: Convert one-element-arrays to flex-arrays
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Aug 2024 at 06:41, Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (24/08/13 12:31), Ricardo Ribalda wrote:
> >
> > This structures are not used
> >
>
> Why not just delete them?

Byran preferred to keep them for documentation purposes
https://lore.kernel.org/linux-media/0640d530-404d-40cf-9737-0d7468dd0177@linaro.org/T/#u

I am fine with both options.


-- 
Ricardo Ribalda

