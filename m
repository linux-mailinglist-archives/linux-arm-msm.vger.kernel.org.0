Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31F0116EC4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2020 18:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730932AbgBYRQF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Feb 2020 12:16:05 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35464 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730460AbgBYRQE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Feb 2020 12:16:04 -0500
Received: by mail-pg1-f193.google.com with SMTP id 7so5109400pgr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2020 09:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=nA6XtHfCbnQ+UrxP5iH37BANlB2snp9+FgCCs6LFMHc=;
        b=MASHOfjqGNYT1tp6DvmruXzocvsetadvExcpfODmmFENiPMhWeeGCkLkwK5CrSPHYu
         xS0lIIYIC9oJ2y3y7AB5I4+/sYx9Jar/0wKwBcM1V1KB88ETjoj2O0jYgcw6SiX6afr8
         KdyVnvRqEpAhmxEj6V6AY6f3w0FecY9EkYR68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=nA6XtHfCbnQ+UrxP5iH37BANlB2snp9+FgCCs6LFMHc=;
        b=dPXblkrbtBvmqRsduw6jcsVG7V3jSM/3y2sNAIXCF4mO+QP3O3Aaq4d37iPFqp3o80
         AvMdGSH9u9kF4mI2MKFoWqrn+sjntOb2c0rEaFRuwQJ0h0xTa5eGwFfI2NVsGKqV6Ov3
         dPpk55CN/31gd4dKhW20Gp7qTiT/+o0f/B2PXiP4+BdrwoPxFK9X/rJVV+BPNOo94FH5
         F0Ttd9veT0PFkBtMY+xAyebuSXqdGy+w55/31ANYeHkYKg7K8z3ZfhRbfmomshpivm+i
         99++zfu2TNsxC8NL2mhijj5gBSoOkS9LRQexrDmIuC8LD5JukFdlDWGTOLPErnoSEl9w
         IZFQ==
X-Gm-Message-State: APjAAAVzyFx3iRIm4myZ0wb6Fe4uW6GmwXs/JNwvLuxIo8TJjP/ziZvJ
        alraVkV82kJlo7emy9FiGXcEcQ==
X-Google-Smtp-Source: APXvYqz+jv0qTKXQ6FaD+VS8Rw4zthTocRAiqn9uBFJunwpJ3inVjQ7HkA/RT9pN2Kq7aXC8OPj0uA==
X-Received: by 2002:a63:18d:: with SMTP id 135mr33641250pgb.32.1582650962218;
        Tue, 25 Feb 2020 09:16:02 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id y5sm18329689pfr.169.2020.02.25.09.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 09:16:01 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4c80783d-8ad0-9bd8-c42e-01659fa81afe@codeaurora.org>
References: <1581944408-7656-1-git-send-email-mkshah@codeaurora.org> <1581944408-7656-2-git-send-email-mkshah@codeaurora.org> <158216527227.184098.17500969657143611632@swboyd.mtv.corp.google.com> <4c80783d-8ad0-9bd8-c42e-01659fa81afe@codeaurora.org>
Subject: Re: [RFC 1/2] irqchip: qcom: pdc: Introduce irq_set_wake call
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de,
        dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Date:   Tue, 25 Feb 2020 09:16:00 -0800
Message-ID: <158265096050.177367.409185999509868538@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-02-21 03:20:59)
>=20
> On 2/20/2020 7:51 AM, Stephen Boyd wrote:
>=20
>     How are wakeups supposed to work when the CPU cluster power is disabl=
ed
>     in low power CPU idle modes? Presumably the parent irq controller is
>     powered off (in this case it's an ARM GIC) and we would need to have =
the
>     interrupt be "enabled" or "unmasked" at the PDC for the irq to wakeup
>     the cluster.
>=20
> Correct. Interrupt needs to be "enabled" or "unmasked" at wakeup capable =
PDC
> for irqchip to wakeup from "deep" low power modes where parent GIC may no=
t be
> monitoring interrupt and only PDC is monitoring.
> these "deep" low power modes can either be triggered by kernel "suspend" =
or
> "cpuidle" path for which drivers may or may not have registered for suspe=
nd or
> cpu/cluster pm notifications to make a decision of enabling wakeup capabi=
lity.
>=20
>=20
>     We shouldn't need to enable irq wake on any irq for the CPU
>     to get that interrupt in deep CPU idle states.
>=20
> + *
> + *     Note: irq enable/disable state is completely orthogonal
> + *     to the enable/disable state of irq wake.
>=20
> i think that's what above documentation said to have wakeup capability is
> orthogonal to enable/disable state of irq, no?
>=20
> A deep cpuidle entry is also orthogonal to drivers unless they register f=
or cpu
> pm notifications.
>=20
> so with this change,
> if the drivers want their interrupt to be wakeup capable during both "sus=
pend"
> and "cpuidle" they can call "enable_irq_wake" and leave it there to be wa=
ke up
> capable.

Where is there a mention about drivers registering for cpu PM
notifications? I'm not aware of this being mentioned as a requirement.
Instead, my understanding is that deep idle states shouldn't affect irqs
from being raised to the CPU. If such an irq is enabled and can't wake
the system from deep idle and it's expected to interrupt during this
idle time then perhaps the PDC driver needs to block deep idle states
until that irq is disabled.

Does this scenario exist? It sounds like broken system design to have an
irq that can't wake from deep idle, but I see that PDC has a selective
set of pins so maybe some irqs just aren't expected to wake the system
up during idle.

>=20
> This way they don't need to worry about cpu entering to deep low power mo=
de and
> enabling wakeup capability "only when" deep low power mode get triggered.
>
