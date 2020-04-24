Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE731B6B6C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 04:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgDXChn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 22:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgDXChm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 22:37:42 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B00BC09B045
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 19:37:41 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id o15so3925873pgi.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 19:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=fEKcHPMVpq7w5QdP3SvOJT0wRkjikmlCTW2T7tBcG4c=;
        b=RyTjRiKqz43EwGmHmvWzKxVzC2fgISK1yibeOGx4dXinZb9g7m3m6BsnClMA2sy8xx
         UVdneOUncjAH9bZtu73dLPDIDy6rJ4qI3EiaNtoN9fZ8+aZNsH4CFhrVQc48q4ru1iuK
         vbRmdmXDKFWXYMEYw2mX+R9UfIAFC09dIZPH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=fEKcHPMVpq7w5QdP3SvOJT0wRkjikmlCTW2T7tBcG4c=;
        b=CsuVtqrPIczEbeLr/Ap0NTKJbbsKyEfJPU2fMckH2mihhtQLkr0xbkU9QbRaW8q97L
         I5JU9QwoWtRYboUFMTfrB8BBWKIYDnGm866R5/LD2+9ITroTWxlR0wJuAFF7Ugi9axUn
         f0Gq3RkxJE0BUNRznqYEKb5+H8ylixfWEeCv/91fDZ30XJnvl6I9GZKsGrKOUHmYrg4c
         3XrFflwgwRuxMX1cAT7hReqYyU7UsyWX03ObcectMTJFlmP33Z294KxaToY+V2Y2xsCp
         hxeRZwvD0liAy4QHLPDqxaT3bqRoWGqwOSk5BC7CYTDw1srjLmCGjUkCVDWM1IUUmj9a
         qy4Q==
X-Gm-Message-State: AGi0PuZOpczzJVMMCq5OotD8xjOnNzso/PPzfXwFJjfA9HjzLbJTcMhc
        b4T+beRcqKkYiXbmlHjB+8C/Yw==
X-Google-Smtp-Source: APiQypKF0UGXhTWB19TllAfo2hJ2+KhgL9Z9Q2/DmvmBaj6+cpxwTikdmKurZwoua/eSb0RYIInMCw==
X-Received: by 2002:a62:1789:: with SMTP id 131mr4003804pfx.287.1587695860466;
        Thu, 23 Apr 2020 19:37:40 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id l185sm3932639pfl.104.2020.04.23.19.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 19:37:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7cb97940-18d6-75b1-f4d2-7a80a6fe68c8@codeaurora.org>
References: <1585586460-3272-1-git-send-email-mkshah@codeaurora.org> <1585586460-3272-2-git-send-email-mkshah@codeaurora.org> <158682455899.84447.8337952928773625866@swboyd.mtv.corp.google.com> <1f1322be-c93a-f2f2-c2fe-541f26d8682c@codeaurora.org> <158693796555.105027.4658047860202135403@swboyd.mtv.corp.google.com> <bddc11e0-8d9a-dd55-3aab-42aeb18204f4@codeaurora.org> <158755213744.163502.17257131401798918469@swboyd.mtv.corp.google.com> <7cb97940-18d6-75b1-f4d2-7a80a6fe68c8@codeaurora.org>
Subject: Re: [RFC v3] irqchip: qcom: pdc: Introduce irq_set_wake call
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, linus.walleij@linaro.org, tglx@linutronix.de,
        maz@kernel.org, jason@lakedaemon.net, dianders@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org
To:     Maulik Shah <mkshah@codeaurora.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Date:   Thu, 23 Apr 2020 19:37:38 -0700
Message-ID: <158769585826.135303.15159589318457908652@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Maulik Shah (2020-04-22 05:14:21)
>=20
> We discussed this in RFC v2, pasting your reply from same.
>=20
>> That looks like a bug. It appears that gpiolib is only hooking the irq
>> disable path here so that it can keep track of what irqs are not in use
>> by gpiolib and allow them to be used for GPIO purposes when the irqs are
>> disabled. See commit 461c1a7d4733 ("gpiolib: override
>> irq_enable/disable"). That code in gpiolib should probably see if lazy
>> mode has been disabled on the irq and do similar things to what genirq
>> does and then let genirq mask the gpios if they trigger during the time
>> when the irq is disabled. Regardless of this design though, I don't
>> understand why this matters.

Yeah. I'm saying that the gpiolib code that forces all gpio irqs to be
non-lazy is broken. Please send a patch to fix gpiolib so that irqs can
be lazy again. I thought it didn't matter before but now that I've
learned more it sounds like we have to use lazy irqs here so that irqs
stay enabled on the path to suspend while they're disabled but marked
for wakeup. Otherwise I don't know how to make this work.
