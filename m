Return-Path: <linux-arm-msm+bounces-15064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B0088B00C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 20:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE9ABC60647
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 17:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8C04AEE1;
	Mon, 25 Mar 2024 16:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H6Zc+YEf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAC74D5B5
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 16:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711383553; cv=none; b=Qp/qGTlBauucq+myiNlB1QU9ORHTupY1rzF4Tlh+e5wdLxUg35YcTHmN06RuL52SYOPXOG2Fs6yeebnJVevm518BtEOGqnoqSU3KzjeJEItnA+UxYtXywwfxDh4kzzpYg3erMOfgxrkt26vsYo467EchrbEieG4na1ir64eHKsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711383553; c=relaxed/simple;
	bh=C0yANzAlSzgND8qqihTlSMXwQ/R0JMuPRLxdKZ8jvZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMw1wsXicJS5yg+VE0N6M43HdVgLE91cd1iYkdvq7Y2YDBaLO0i/F4zc+FCN6aM3ZjqrYhPyxW/jDg3iXSsTPktIfG17e3bqN5V97jEOb9gqQG+Nj0tmMUR/1+zEs4NER+n/TPyLl9U1GK2attlsOGQg7xJcMbQv9z7HZYmStNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H6Zc+YEf; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-69670267e87so17938586d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 09:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711383549; x=1711988349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EKP+i5jnsTv1b1X+grUsnmPFecRRLS4nYrDFL9hNpXg=;
        b=H6Zc+YEfSE887I9zBlpYIAVMbz4o6bFKXm6bahwV26LdhTjssH/7+ZbJ9xN6NqPVZ/
         OEtHG0vMqeOhQTfONJu5d5/vd52+QW38dvYK0OL9eA9WzwZsIXO67l5/4/Pf4/vLTaE9
         zT995A2KdeBbEGowqA5a3QdA38NzLJbaztQAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711383549; x=1711988349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EKP+i5jnsTv1b1X+grUsnmPFecRRLS4nYrDFL9hNpXg=;
        b=R/33ubSi3L8HEkXzDKiEbtYzp+pf0+zG6YDyfMAyIea7TX9tNIUK9UahGkTXnGpScM
         O82+6RyUNlaAWKgSiE0qmKqLsYHEnvCqvjwwpGOW3Bg++O3lWYR3ho92pAPriRTx8DJr
         YI1p16wFDk1BmW9yM7twE61bj3D0rHKRw6Z7TPTNn8oeHmJqtPwBiTq2XhRWphUSf1EK
         pA4Ok9VhrvmeIXb96ezXAkZ52YXlpyXf5B3scE3r4R/t7zqTdwIzoSBVXzKuQJQQs+cI
         JRpnMY5jf4d6UcVVNF5L8zaSAXGYMsYadh8lNImAkgRlNlqn2dLKAcI7LF8lBQAdLHtH
         hH5w==
X-Forwarded-Encrypted: i=1; AJvYcCU5cXM4pAyY/jCTzQIVWJXazqPusOYiQOn2wJXwoEG5EQHaoTpro0yxg8lpxUnQf0Mk1zRAPNFp1RVyA/6NDe8din/ZgXog/UwJRRNDOA==
X-Gm-Message-State: AOJu0YzRGhn8sfKt4NPpxLBNtiEfnIwWlmR87rYgBsUlI/RbSvoLPGfV
	n4S8IuujFtjXK1/XTGp8h8uK7brjFqKG5bM8px2XC+iTafe2abnv0miq7fdqY9ALr1nnagz5CAI
	=
X-Google-Smtp-Source: AGHT+IHGDO+qs8r7JYyJM5MaMhPJpdDWSKbVveJjwoCxxdk6zVJQYm4njm+2KNGRcFtb5FbmJIv16g==
X-Received: by 2002:a05:6214:d4a:b0:696:9756:fc44 with SMTP id 10-20020a0562140d4a00b006969756fc44mr1320475qvr.26.1711383549690;
        Mon, 25 Mar 2024 09:19:09 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id dv2-20020ad44ee2000000b006968f13a7c4sm1166469qvb.89.2024.03.25.09.19.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 09:19:08 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-431347c6c99so487251cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 09:19:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMLqUgfvst4Dvcet1UtWdOv6J2DTOAl3NbhWsE6TjF/tZPq2XBkF99JFf0rVzNhdM5cmD+Fx0xNYGjRGkdtX7NgbS3uLLNd5bLcFkwNw==
X-Received: by 2002:a05:622a:5447:b0:431:4eea:ef20 with SMTP id
 eo7-20020a05622a544700b004314eeaef20mr283279qtb.16.1711383548431; Mon, 25 Mar
 2024 09:19:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325054403.592298-1-sboyd@kernel.org> <20240325054403.592298-2-sboyd@kernel.org>
In-Reply-To: <20240325054403.592298-2-sboyd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Mar 2024 09:18:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vo2vpemyH1ChdHtUdaeKnGckBUeqKfL11xn3WsN5+BUw@mail.gmail.com>
Message-ID: <CAD=FV=Vo2vpemyH1ChdHtUdaeKnGckBUeqKfL11xn3WsN5+BUw@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: Remove prepare_lock hold assertion in __clk_release()
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Mar 24, 2024 at 10:44=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wr=
ote:
>
> Removing this assertion lets us move the kref_put() call outside the
> prepare_lock section. We don't need to hold the prepare_lock here to
> free memory and destroy the clk_core structure. We've already unlinked
> the clk from the clk tree and by the time the release function runs
> nothing holds a reference to the clk_core anymore so anything with the
> pointer can't access the memory that's being freed anyway. Way back in
> commit 496eadf821c2 ("clk: Use lockdep asserts to find missing hold of
> prepare_lock") we didn't need to have this assertion either.
>
> Fixes: 496eadf821c2 ("clk: Use lockdep asserts to find missing hold of pr=
epare_lock")
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  drivers/clk/clk.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

