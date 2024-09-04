Return-Path: <linux-arm-msm+bounces-30809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF84F96C9D2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 23:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64A9A289425
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 21:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E085B82863;
	Wed,  4 Sep 2024 21:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gvtomoY9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525F317B51A
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 21:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725486709; cv=none; b=TDTUBmQW9UyNfmsHOfCdmMyevrGbEGiaEwCkCJEaJgCjEGNAvEDTtE9kCvWMrBpLtN1kDveVYjdKbH0BCX8KMxIr5t3zduYfwqNTx1fU2RB0mUmRaKVHtmM5rcKzaFyyQkTLc8pes5P1Gd40t9gfCuqEilWbPA3SoU2eYVYbWiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725486709; c=relaxed/simple;
	bh=3HkNVCxJy56k3u+LITc9D7/1LsDfdZXPVJ2TlkcFnSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DpQUzHzvy9oUKM3BM/oO2ThARoVH/yGx0TuNsAqe/qm2OK6eXzYIfohV0kcF0BuIZit+fhecFWtu5sD14tCKR68qZVsQ+yZ9zBFZRwmmjqVyvNsiD5qCQZZPXOXul4CGfIOwFn1IYvyVUPoZ9XkCc/H94zGWTs+0WprYwnTNhfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gvtomoY9; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6b747f2e2b7so146347b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 14:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725486706; x=1726091506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yUwPDHkK2WMXQHvh/6LMKlWFNebPcDI2OCZ0Tor/Kg=;
        b=gvtomoY9LhotGEQJ4b9iE8DeCRjyAUaUNvtuSOG05KJnDB/AOsDmlGvqfU82LjTkYC
         sVSb/145YayejieOFSaZBs38M8CApCp8SvvHsCt+uwdDM3Ae+tzF1N6pQgKaDQaKd5DL
         UwezR+YXl4vKMdIgviSP5yRUeKEaAnlu7XJDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725486706; x=1726091506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yUwPDHkK2WMXQHvh/6LMKlWFNebPcDI2OCZ0Tor/Kg=;
        b=FKoqmbHbjgxmUrpeTu9wjMItY3AKtHUDQdJnjjDOhKgc+VRhY15SF73a74FaSIfv28
         YmIfbEMxPxhq73sh/ugeROq94h4GjmyG5H//np7J6hHj/sp2jkz9dKZRsEnvVNIqyp1O
         EZOT+3zCLY37v9QjqBokIBnC6WSS10WFw/uN9teQkftOsm+yWgC7LIv1JOnSlVjb1eq9
         35wpFditWDE8ddjQtfTiBhYOqlyZdaZ+1+Pk6c4GzjyyGpJAMShL53Ks3lemlzkFe03t
         KbYUKbH0h1cLfxh6SYzqPUO67hgm5qay1GyT+X1Wc98SsPFxVKiZB4OhbT8aJS563xnA
         SKJA==
X-Forwarded-Encrypted: i=1; AJvYcCVNmNN75GfI7r9HX9d+7lTkUcHvBAEXFW49UZ680VG5SnEyRBuLgRst851EiFgVxFVSU6cH12TixDb/GGln@vger.kernel.org
X-Gm-Message-State: AOJu0Yya9OM3SgpsxULu2IqYVXf46xnwc2UYcUbcUR440n3ZwdVy/Xn3
	s13oBImfQ3y61jPz7/Je1SFaRm/tjkYEtL9lKin1Ar8YYegthEYIyNUhCwPTemvYtERZyLcDBUU
	=
X-Google-Smtp-Source: AGHT+IFEENxJE+J2kaMdk929omTWyEswmfxmo5SDyEYKGztpP4p4XrUqMbz+Ew4Q6yfyQDV14PofEA==
X-Received: by 2002:a05:690c:f8f:b0:62f:a250:632b with SMTP id 00721157ae682-6daf484a81emr79621107b3.8.1725486706258;
        Wed, 04 Sep 2024 14:51:46 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d6d99b0b1csm13998607b3.109.2024.09.04.14.51.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 14:51:45 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e1a9f84699cso145992276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 14:51:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWS0w9b7vXwyi02BqAQ7Kyv6BwZL6qF0xRX7oPWj2J+EwIPQJmZcwp39zm3TKpc8CPdvAEW4xqbd4cQQKGh@vger.kernel.org
X-Received: by 2002:a05:6902:1886:b0:e1b:27d7:76c4 with SMTP id
 3f1490d57ef6-e1b27d77c64mr13543115276.30.1725486703973; Wed, 04 Sep 2024
 14:51:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902152451.862-1-johan+linaro@kernel.org> <20240902152451.862-9-johan+linaro@kernel.org>
In-Reply-To: <20240902152451.862-9-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Sep 2024 14:51:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WGbjWXB95Rk5Np7Fp6sN+_AySVw0WtdNXE9xURxdVU5A@mail.gmail.com>
Message-ID: <CAD=FV=WGbjWXB95Rk5Np7Fp6sN+_AySVw0WtdNXE9xURxdVU5A@mail.gmail.com>
Subject: Re: [PATCH 8/8] serial: qcom-geni: fix polled console corruption
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 2, 2024 at 8:26=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> The polled UART operations are used by the kernel debugger (KDB, KGDB),
> which can interrupt the kernel at any point in time. The current
> Qualcomm GENI implementation does not really work when there is on-going
> serial output as it inadvertently "hijacks" the current tx command,
> which can result in both the initial debugger output being corrupted as
> well as the corruption of any on-going serial output (up to 4k
> characters) when execution resumes:
>
> 0190: abcdefghijklmnopqrstuvwxyz0123456789 0190: abcdefghijklmnopqrstuvwx=
yz0123456789
> 0191: abcdefghijklmnop[   50.825552] sysrq: DEBUG
> qrstuvwxyz0123456789 0191: abcdefghijklmnopqrstuvwxyz0123456789
> Entering kdb (current=3D0xffff53510b4cd280, pid 640) on processor 2 due t=
o Keyboard Entry
> [2]kdb> go
> omlji3h3h2g2g1f1f0e0ezdzdycycxbxbwawav :t72r2rp
> o9n976k5j5j4i4i3h3h2g2g1f1f0e0ezdzdycycxbxbwawavu:t7t8s8s8r2r2q0q0p
> o9n9n8ml6k6k5j5j4i4i3h3h2g2g1f1f0e0ezdzdycycxbxbwawav v u:u:t9t0s4s4rq0p
> o9n9n8m8m7l7l6k6k5j5j40q0p                                              p=
 o
> o9n9n8m8m7l7l6k6k5j5j4i4i3h3h2g2g1f1f0e0ezdzdycycxbxbwawav :t8t9s4s4r4r4q=
0q0p
>
> Fix this by making sure that the polled output implementation waits for
> the tx fifo to drain before cancelling any on-going longer transfers. As
> the polled code cannot take any locks, leave the state variables as they
> are and instead make sure that the interrupt handler always starts a new
> tx command when there is data in the write buffer.
>
> Since the debugger can interrupt the interrupt handler when it is
> writing data to the tx fifo, it is currently not possible to fully
> prevent losing up to 64 bytes of tty output on resume.
>
> Fixes: c4f528795d1a ("tty: serial: msm_geni_serial: Add serial driver sup=
port for GENI based QUP")
> Cc: stable@vger.kernel.org      # 4.17
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

