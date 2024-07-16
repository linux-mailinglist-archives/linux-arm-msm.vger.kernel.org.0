Return-Path: <linux-arm-msm+bounces-26258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C86931EBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 04:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 371321C20F11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 02:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1017482;
	Tue, 16 Jul 2024 02:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YVnqDJCD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCD01078B
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 02:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721096253; cv=none; b=QQuq0zJpEKv37nXK7bNNryh7CtlyKbnSnEP/q7O2kpWiVURvVrMxGIfnjRs9VOeUpYWu26oWzb+nvfR3Ui9I9y7b4rwuA/l07wdf1sBezIHyhzJQ9pVwTT1S3l/y66XT5i9oRepJyDr9Zcj8N2bARaCUsgNydn4gpFN2vhHbU00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721096253; c=relaxed/simple;
	bh=BBaTfLOz45gv5TSiEZbKjsh54MGUgFRkzmECknTKYSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=npiWjNqoTTBzRXcofxbiDrCtny78lbfw0hNhC7Le+ZhsEZXuzN7gDNonmmb49Kbobi8uPe7dUVsTdKEzMErxbRv9UmJg1lOHkaF91sg6rqO6GXVH/nE6R8BmC5KspCbv3hT8xkMkjgrm5cpjTYSBHRL5gPq1wad/SnqmU6NjS6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YVnqDJCD; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ed741fe46so1748881e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 19:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721096250; x=1721701050; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OxmhwjjpGd8zVAlRCw8Rz5PC00uRnZ4KkvDhpfV+dDA=;
        b=YVnqDJCD44kOXZXBTBGc9EuBsfn8Qw7UHx15ihLUr41gkBovehWIeUtE+vp/ht7/FR
         8f2vNAys/tI71b5Zn0nyHaRaCn/VEJTXB0CHVaL91jFNAc5ggQOI6nWv7mhQj305cnMS
         HjAUtTfYPeMJWrzCTeRyQwaJOG1hFbzGd0VE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721096250; x=1721701050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OxmhwjjpGd8zVAlRCw8Rz5PC00uRnZ4KkvDhpfV+dDA=;
        b=t0yefH0dA7E8kZP3mSv5JqYXbi8gb4Latxb5H9sxjGtfSTR7Y2nt8Uhs6XyCm4+GOI
         7T/1n7mSAblKDSWWtINdkyvfYrDhQuCl+Pw7aeBNlwAAYbdiMOq3gpoAulcUmQE6ZFDD
         c9aWeGy3Sjcq1gVb6BLrVwEOyn0xUFyXIWxjfrGlD6KneQ7ST9S2RDkGQDZX9u4fC5Yf
         5UmBf3tCOojljTFU2AqucmPFBr8MA4eIzHAbxE7c7aZ8nN2ajPX2sPCLehXFFQZcGjcS
         uVTZszo0OkiP5DlEiAbp/1SMmBUeq+rm1xDfFDvfMlNxxPy3RibuHAxb3BQ9qzMdSWEN
         VJnA==
X-Forwarded-Encrypted: i=1; AJvYcCW+wm5/nM2NMbe1LdUJQSdgTbnv7s+n/Xsv/Xl/DUiV+OeGNF6No6i7vM3fVYoEWqbfDyedVqPBW8H3xsQol4kuc9hpJx+5JTAFfVFZpg==
X-Gm-Message-State: AOJu0YyHPMBbwHr/fFhqVNWf+pf5J3E2EG8sOX11uZgRsAJwe8UM4+1+
	hIld5UBVtdJ8xcku4xA9OiLkVXqhciqUTl0HWMEj51O7tQTPm+qriSo0WAWaJWwMK2eAFu+Hxr8
	sd0EBKg==
X-Google-Smtp-Source: AGHT+IHsCPRJ2Hl2FNc7uIh5IM/Cmd/fIFAn3ttzBJBep/UgUiXu1Hvy1yhigXraxjU7Qe+F9cjXbA==
X-Received: by 2002:a05:6512:68e:b0:52c:df51:20bc with SMTP id 2adb3069b0e04-52edef21748mr308069e87.16.1721096250099;
        Mon, 15 Jul 2024 19:17:30 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed2532772sm1014668e87.222.2024.07.15.19.17.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 19:17:28 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ebe40673d8so65496731fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 19:17:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdzPgyVkgY/ZxpnhPRN/vcD4bvFwMHEampGeCh7lmWTtvlPC8YEgvMH52xlcqoCF2n1NMWMCketNSd0ih2PjLZbK9XqK7Q22SdItxZZQ==
X-Received: by 2002:a2e:9d86:0:b0:2ee:699b:466 with SMTP id
 38308e7fff4ca-2eef41dab4amr4022321fa.36.1721096248037; Mon, 15 Jul 2024
 19:17:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240712091008.14815-1-brgl@bgdev.pl>
In-Reply-To: <20240712091008.14815-1-brgl@bgdev.pl>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 15 Jul 2024 19:17:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjWc5dzcj2O1tEgNHY1rnQW63JwtuZi_vAZPqy6wqpoUQ@mail.gmail.com>
Message-ID: <CAHk-=wjWc5dzcj2O1tEgNHY1rnQW63JwtuZi_vAZPqy6wqpoUQ@mail.gmail.com>
Subject: Re: [GIT PULL] power sequencing updates for v6.11-rc1
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jul 2024 at 02:13, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> This PR contains the core power sequencing framework, the first driver, PCI
> changes using the pwrseq library (blessed by Bjorn Helgaas) and some fixes
> that came later.

Hmm. Let's see how this all works out, but I already found an annoyance.

It first asks me about the new PCI power sequencing driver.

And then it asks me separately if I want the power sequencing support.

Now, either this should

 (a) not ask about the generic power sequencing support at all, and
just select if if a driver that is enabled needs it

OR

 (b) it should ask about power sequencing support and then if you say
"N", it should not ask about the drivers.

But asking *twice* is definitely not kosher.

            Linus

