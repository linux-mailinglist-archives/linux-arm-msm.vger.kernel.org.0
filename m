Return-Path: <linux-arm-msm+bounces-33931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97943999543
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 00:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31869284AF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 22:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7171C172A;
	Thu, 10 Oct 2024 22:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wa9j1rSx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33BA1A2645
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 22:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728599801; cv=none; b=s+Tzq02gUCQCNQlUv1rzyynLIJsHZQ3/n/Hu0m/HbPdN0rBfu1r+bVpEgUz4mIqbyl+UEc1HeXny/lICGC6VPHVdoVLiLKDF+QoK0DLcVug4KSA383UyGhA+Rad2pj9xVqyFKfZnCR1LAVPrnINJ8onJHuO4CQGhtLkUa4LpeMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728599801; c=relaxed/simple;
	bh=ndGUOdbmf0XLXi5qOt0/OM43ZwpMxj5j0YR7mZtrb0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L7x5jMTIduKTFx60oNWy6YYVbuXkVWdgUolTQG2WhOpCTYBtSXOQkpoGr9Ju+tX1A6kPcuMala3+oV6fQxpfTa5dt+fR0k/IicYrmFhWM88+u75BFuKVe757PA0zEuFn6ZboK+UqlhKdseNt2KnkIHrZD8x7U7sDQ4nD0pRLErE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wa9j1rSx; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fad784e304so16223911fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 15:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728599796; x=1729204596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyyxlBvtxdIx44gC6sdEnPAxTnLbnwRQOcfiWPcHmqE=;
        b=Wa9j1rSxtkPuaG2PLhc1lMwrXA3NrJHkqCdfv4ccIwGm28b7A1+vXWde6ATyk9H8VM
         3ggLieKpgCmnkMzSEiC4mkpRH+n+Yqc9+YRskfJ4ygFPzs5jy2kDPypDteNjw7g9XvK2
         tn9N+00xm58W35PV6dmdV3k8h8co4c3kY8tno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728599796; x=1729204596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyyxlBvtxdIx44gC6sdEnPAxTnLbnwRQOcfiWPcHmqE=;
        b=BjJKugw1wVPeO6q6UiBEyTa0j/tPxfDZyYU32xNdR1NBiwlDdFmgq4zEEgyRP/ZcYw
         93/hmKPlBT51UOeVcYQ7K0qXEquXg8z/TnyYiyz0d6SHBuXJ7NpYNc0I6G0OVIZwMNq+
         CB1OtaVbJd3YGvmBcSw3SMB23W1HjJK8WTn1Yt5xNrZ4EURluHEwIM405GPaPja8KsXc
         olR3djZPRAonBJ30lh0bDN4ppY/47h6o1Sd1yCtHZ0voRg0vbEdd2R9p4jZ6Bewerfmq
         KQaFwJ2eFclpKUmVjZfk+REjF8fVUTc4/P6CR1VKiVYPi7bBSJj+Ezf9jQEdSW8tsSnK
         bHUg==
X-Forwarded-Encrypted: i=1; AJvYcCXwCohVNbvfNZGv61GyzUF765nQYsawAD8zXQUMmhyF82yZgKGyjUrnU9XRc8iy037hOWuUohZvccXyjW/c@vger.kernel.org
X-Gm-Message-State: AOJu0YwCUGgsadVOi5axBl8j7zo07w78VZZu9Y4jOlraQkl0+C7+qrFJ
	SHfTk6HNETtnq4sAog5sFXLHAuu6ZmRBHACVj2QL6ufXLs6lPRx+uobdXSeD3uHmQdUTSnzLS5b
	Lk9nG
X-Google-Smtp-Source: AGHT+IHCvTR9hl0mHfy7lfReDu9kaC8UzU/NA6BSg9aqjEA31BxQYeehkIteDlhj1uEpF+dOBhB2eQ==
X-Received: by 2002:a05:651c:2223:b0:2ef:2b38:879c with SMTP id 38308e7fff4ca-2fb326f5564mr1616421fa.3.1728599795748;
        Thu, 10 Oct 2024 15:36:35 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb247064absm3313791fa.93.2024.10.10.15.36.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 15:36:34 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5389917ef34so1708902e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 15:36:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVoMyIc5FpxYwZgrerCfGZqww53Ro3RxSlDX3MUTysnI+XNCid/3gfTpvTUknCrnH5wdkLQm1bl1QMk2Dcv@vger.kernel.org
X-Received: by 2002:a05:6512:3189:b0:535:6cbf:51a3 with SMTP id
 2adb3069b0e04-539da3d5293mr199479e87.25.1728599794291; Thu, 10 Oct 2024
 15:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009145110.16847-1-johan+linaro@kernel.org> <20241009145110.16847-2-johan+linaro@kernel.org>
In-Reply-To: <20241009145110.16847-2-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 10 Oct 2024 15:36:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WvpOx1RHFdo7NSss3m922VqRSdsV6G+NnxyCjcp2XMVA@mail.gmail.com>
Message-ID: <CAD=FV=WvpOx1RHFdo7NSss3m922VqRSdsV6G+NnxyCjcp2XMVA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] serial: qcom-geni: fix polled console initialisation
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 9, 2024 at 7:51=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> The polled console (KGDB/KDB) implementation must not call port setup
> unconditionally as the port may already be in use by the console or a
> getty.
>
> Only make sure that the receiver is enabled, but do not enable any
> device interrupts.
>
> Fixes: d8851a96ba25 ("tty: serial: qcom-geni-serial: Add a poll_init() fu=
nction")
> Cc: stable@vger.kernel.org      # 6.4
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

