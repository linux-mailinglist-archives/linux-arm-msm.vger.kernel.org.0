Return-Path: <linux-arm-msm+bounces-33934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E47E199954F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 00:37:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1B17284D95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 22:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1251E572F;
	Thu, 10 Oct 2024 22:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l5v+C3bF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5273A1E885F
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 22:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728599823; cv=none; b=Q8kOnfWWl9T8qFrAOOk/8nBmihjJLHhwGQG0JGrrVK/j8mzcDfogjes9Biar/lL28CsY/CpdPulgGI+Sl/XlOH3rf47eq/iEh6EcD6HT7OvQ4F0cKnkHBF4Q8PFZ955VdKOpEd83RiYsd6wx6A3uanHXVcDn1EZu2GHWQhIg74Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728599823; c=relaxed/simple;
	bh=ELTIZpa/nLA7FG1SYG2wR8cL7xe3VKiueavOjWMz2Jc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZL8Iy7ZiPox9y+maHwIgi7vjzHTsz1eA67Hf/nq4SMNKTXD410+66WCKB+JIbmcnJO+LbUKCkKH7/WOPEyuagiEi5JAQNGh+UbJixySTzuOo4IGvYIPaZnHwERodVzsmJVU/XRy619iumHq7Yd4gjct9XuLKr5hQ9UFN0mGDnMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l5v+C3bF; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so13932081fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 15:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728599819; x=1729204619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otakXsanXUr8ItyEhwzCKI/sGAGwRsLWsuVYvQjRYBk=;
        b=l5v+C3bFFbbTIfTum+xLlonRWPHEWLB+De1cGtkdEak5P4Y2+S3bkUzik1Lglrwtvg
         48/sAq3s/I7aLZcd4kSBrEVTQv5Iph0D/8E/+H8NVNjsNjLjExrl+7iLeUnKjCABCVA+
         dKmISEKLSr1GZQIqZMGx/Dw34T/uUOYogELjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728599819; x=1729204619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=otakXsanXUr8ItyEhwzCKI/sGAGwRsLWsuVYvQjRYBk=;
        b=UYwaoR4P8I9kyjNvGT/IfpeiCxQb/p9RLQTeFXo6PpPNiPNY3oQGBinDd1eFQ5RRLV
         vLXCAnCBfKnxZfYrpfEDTcvPEhiWBuVCiBuXKOStqCls3p2oeemou9uWrDmDaBbumx9O
         tpcCWM0P882rs/4BqrGJ6A0SrQTWdwHrsUmXMHEP/C+i9mm0eFi1EC5ns7ZO6pLRdnxT
         6uSbrpm1M/qzQ3PqYZTZpvJegXHN7XV7z6s0NoRuPqydt/g0ag7LkT9D1pWng1CRmPGw
         9s3znLdnXrVVpcLkZcoJ9GrckreHfcveijpayTm9h6dKoD2DihQs6Yq10ZOXedHcUjPe
         aGYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWftF4tttpaCbjhm/5BmjpS/4DZe+1qXaXerIF0BlPw1FS9N4f50ayn+TWJDUYKR+oJtMRCiKKkVY9Rr3RE@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4uc2AZtDLhBOZA4YkG77XLiDvnaXkGtyxq4cP2+A4UHcJfzVy
	XqbwIJgq6zhCkfbMs0JA8kDxmdIiJ3ff2CCtZt7ThA0C3s93HBQROXAV8GgDXMUaPaQHb73/AHf
	5kLbj
X-Google-Smtp-Source: AGHT+IFmcDOrfhUqXZYjMVdH8vS/8q55cmjdcGIrtFBeraKTjzaZzW8hyUmvIXhhnN+Xt/8NTngBTQ==
X-Received: by 2002:a05:651c:1543:b0:2f6:57b1:98b0 with SMTP id 38308e7fff4ca-2fb329b4245mr1345621fa.42.1728599819086;
        Thu, 10 Oct 2024 15:36:59 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb2b3e3b55sm1422551fa.22.2024.10.10.15.36.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 15:36:56 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fac787f39fso15977241fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 15:36:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJ5mlXLLMEIbV0jGiDO9qxdYCSdIZwLndAXWgXB9wk17Sgc+DAagemeMZ9uUwJ5nGxVgHhxsGY7PNWkHbM@vger.kernel.org
X-Received: by 2002:a05:651c:221b:b0:2f7:663c:48d7 with SMTP id
 38308e7fff4ca-2fb329b2a84mr1316951fa.39.1728599816013; Thu, 10 Oct 2024
 15:36:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009145110.16847-1-johan+linaro@kernel.org> <20241009145110.16847-10-johan+linaro@kernel.org>
In-Reply-To: <20241009145110.16847-10-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 10 Oct 2024 15:36:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VDjZWLDt=1rJWvwt=QWNWhJeNYAfhgDmLBiH0xiq+FjA@mail.gmail.com>
Message-ID: <CAD=FV=VDjZWLDt=1rJWvwt=QWNWhJeNYAfhgDmLBiH0xiq+FjA@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] serial: qcom-geni: rename suspend functions
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 9, 2024 at 7:51=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> Drop the unnecessary "_sys" infix from the suspend PM ops.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

