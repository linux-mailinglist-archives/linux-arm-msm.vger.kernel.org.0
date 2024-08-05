Return-Path: <linux-arm-msm+bounces-27904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C86C5947920
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 12:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFD211C20F49
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 10:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72406153803;
	Mon,  5 Aug 2024 10:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qv9kc6qr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B332415382F
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Aug 2024 10:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722852730; cv=none; b=LPwkKpyyERpTZwXhBih3T1giDaOv4vCtlwQqLkLd6OaiOHCW5x6ZmBrQuFGw1cXU83E4HZGtt+JdzVZ/RE4PhWFAm41IoTFZXYvoHOwk/C7gvM75YBlFbJxdE9cL6zqd2clxogpYDRpFgMsfO75Ux5IVyOM3rrHu7rK3ojn9M3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722852730; c=relaxed/simple;
	bh=aBUI0cv6RKxMVVB/tkuI6YX2BH2X9rEgl2ihEJmJwVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rUCQkqbhqcMKTkaIOVMrhBRiYdlO4/29n9xOoVbn32AmjPOhZKzYRBMbWm6+9xEckdis8pkcBUsUr4++8ldcsaKcDAc4e5s4dlJUQEuQaVJJnx3A2/sZhUNQD8zWkk5AXnX6PmQUew1uXfXsNckE8rxcfiDkoH2ppwFvYGrX9lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qv9kc6qr; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52efaae7edfso9509787e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Aug 2024 03:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722852727; x=1723457527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBUI0cv6RKxMVVB/tkuI6YX2BH2X9rEgl2ihEJmJwVE=;
        b=qv9kc6qr7XCOfYvQPiNBzXUIengFj9TI4d0m0yoRBYyML1cka3P+plRhBU0D4fal3f
         LpT/QMv8W0yRCAz0Oo//qF2aCOM4LH9ovlcfMxxrgYNZZHOeV/yIlLexpHXenq4Vrstn
         4miNQZnGqt/eeDyt2miraqi1QqGNcS68ODnOcTVQYqWnY+C5f1PkmGj1bJka0+pBcbiC
         iThKB95jPeGGKa8Y9KuYs/msP/LtBlAXIUpYsCSpYdFFPTU2aBG2Js5SaYF75JoPfytE
         pqG31rrgOKeGbj8lIKZv/iPzJyzzCsrG0GZaZCz5XSbArGV8cTejHsFDTp/4+EvF811A
         qvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722852727; x=1723457527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBUI0cv6RKxMVVB/tkuI6YX2BH2X9rEgl2ihEJmJwVE=;
        b=KcqkBpd7x8enk4sjwfrc+zyiGcLwEdk0QEhAPQEkwJ9w+/izEWfw8yI3T4O51RK3M9
         c8pwSHE9drnEXGk3aG3xmt2y2bGvLIp4l8XOl5xs5Govk3uuqbh5ivtRo4Y9qFrBy7ic
         C3A1kbZyyFDy8zu6aBTjs5P/BZmWA+qzSQCUdQRpmkURSt4dSBQjseknSpmZb4RJz/i6
         gXxvtNX/jpnKRfDfvur6txVkn16XHKsF+Z+hQKQnpzr30leFxhiigYt/4DS7SliByLWp
         6V7x2ZPT0g3PEhIs5F5FZhWC87w8bEShDWU5PfWGJ8ztE+Kk+OnJ2lz8xQr/bG7P9cYv
         mPDw==
X-Forwarded-Encrypted: i=1; AJvYcCWFbiBwuASjZhyPwbzFCjy5juyz0iLlC6+rWIrzEgYVkVB6/tdzlYQMcPXmTMp+WFhJhyBIpCfKpL7TrPxPsFOUbdo3jSAGMZw+sKkgFA==
X-Gm-Message-State: AOJu0YyGNe2dwQ8qZmsAQt/z6SQq7TfznkO3nmISGumLahqK9e/lHNv9
	M3fQ/gLr0r4JvYRTC7B4oQRME8677tHEr06j8qgAwd2Qjxf2B5K/g9WbcccIeK+UZrxzK+cjsfn
	Hwqezet2zeePZ4eSb3bRisadKmSuSYQ7obJRJ9Q==
X-Google-Smtp-Source: AGHT+IGy87u/qg4BJ3TC4T8YzxT5D6K9LAVyY2+21hQh275kOvCpifr3EAKkDMIr6mSuV8VqppJGDqylPVAwqGtgTSQ=
X-Received: by 2002:a05:6512:33ce:b0:52e:9d2c:1c56 with SMTP id
 2adb3069b0e04-530bb3b73bemr7403273e87.35.1722852726656; Mon, 05 Aug 2024
 03:12:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
In-Reply-To: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 5 Aug 2024 12:11:55 +0200
Message-ID: <CAMRc=Mf2zOyQv=gw6+c=a6U-fJKOaXK9QQ=kukmXKTjXOx8TNg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 0/14] net: stmmac: convert stmmac "pcs" to phylink
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrew Halaney <ahalaney@redhat.com>, bpf@vger.kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 2, 2024 at 12:45=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Hi,
>
> This is version 3 of the series switching stmmac to use phylink PCS
> isntead of going behind phylink's back.
>

Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> #
sa8775p-ride-r3

(The board is a more recent revision of the one Andrew tested this series o=
n)

