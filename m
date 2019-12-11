Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0FF611BAA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 18:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730534AbfLKRw0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 12:52:26 -0500
Received: from mail-ed1-f51.google.com ([209.85.208.51]:43074 "EHLO
        mail-ed1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730522AbfLKRw0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 12:52:26 -0500
Received: by mail-ed1-f51.google.com with SMTP id dc19so20126411edb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 09:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EOLH9xGCIq9oFG6bGYcwxtab5R0yLdxQF2RKFwaOSEY=;
        b=QtS2DDWmg7esT/nYCWb3rscHFH/clJDFIgWAx22w2ai3YrtC8ZQhIe9JZZOUB138PE
         cqZMcOAuxS1zSq2Unve1xSUAHXyPunSq4s33+3vHBf4EEeogwhOqb6YUljDudVa07Ij6
         rhkqY9PQbXwVl7L+o3Ij6ET49Eyoe7RsSO6+1sLes0Aiegxs1jijTWc0rEqhT9B8R6fD
         jWEuQvqgWaC9QkEWb9wzB0+ngV7hNdllDBVt3LA/S9BSjxntOvBUyvyBEj/n4apirpCZ
         qY2ihyY4kpVNTXOoVq2j3ITU+GpJgRV7Vk8+Qjc9m+g3NDB9BjWrgmLH5Yu3VUM1inZ4
         VlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EOLH9xGCIq9oFG6bGYcwxtab5R0yLdxQF2RKFwaOSEY=;
        b=sw5LNOT4+g4r23WSm0ZVsfTTLm6VyXfgVXFKcKncjnhXwj9DX7L6m2lH1i6O7oYqkg
         /And8z/4AYiOCiZ4ZYByoLaV713FDnic8WKKVMTthXc/3xUdKt4MY/wsFuMwmu/RCewl
         88YzZAo11pXRh7udjKb5lCsft7KAE6vZeeF9VfF4FA9WlbDDJuSxxXiUPNVFH7PVXuan
         UR8bM9NUYGOuXslcYxea9LStya73S7j+4Wt+NgVGoUBV1nTKoYpCZ3ur0sPc3q2juRY7
         qIzAcpKJx31ws29nsHJt3e1pWVjsJpgGxbxeOstEDKWq2IaoomFr+O46bWAXpoKmL9LS
         k88g==
X-Gm-Message-State: APjAAAWUCbT+kP0Yn0QJFx1xX6qta5r4621jfW8tYraX1ag4O6dDCd8/
        fkuQn39e+jfqZW8nlqGavygnvxM62CTx2yKLXlM=
X-Google-Smtp-Source: APXvYqwacMwAWOGpTQKdLSDOz3XzoW/Cj4bB+7U0MWOvr3excbWCD/NOs+alqBf1oo3wDDLgUaeVQCEDNYwqJAO1vZA=
X-Received: by 2002:a17:906:2296:: with SMTP id p22mr4757180eja.269.1576086745026;
 Wed, 11 Dec 2019 09:52:25 -0800 (PST)
MIME-Version: 1.0
References: <CAAaE5fP+Znp1O4t=M7bwor8FH=f-z9CL0wQ9NTjtLSwjFb0LoQ@mail.gmail.com>
In-Reply-To: <CAAaE5fP+Znp1O4t=M7bwor8FH=f-z9CL0wQ9NTjtLSwjFb0LoQ@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 11 Dec 2019 09:52:15 -0800
Message-ID: <CAF6AEGtpPoZK4FCSLN=285hRQihhEjaLZTO82eFdKmwYWQMSHg@mail.gmail.com>
Subject: Re: Question about MSM Driver
To:     ggermanres <ggermanres@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 11, 2019 at 6:22 AM ggermanres <ggermanres@gmail.com> wrote:
>
> Hello.
>
> I have question about MSM Driver.
>
> I using Dragonboard 410 with ili9881 display. This is hobby project. This=
 display from xiaomi redmi 3x/4x. I made PCB board for connect them. I chan=
ged dts, created panel driver (this all on buildroot with my config). All o=
k. Run platform. I saw linux console. Freedreno (opengl test app) is workin=
g fine. But I saw flickering like on old monitor I saw from phone. I tried =
changing timings, but this helped a little bit (I used it from dtsi from xi=
aomi repository).
>
> I think this is with vsync problem. Your driver support DSI_VSYNC input? =
In panel driver I sent command for vblank, on oscilloscope I saw pulse on t=
his pin 60Hz. I tried find path in your driver code, added some debug outpu=
t in code with sync. I saw MDSS_DSI_0_TRIG_CTRL configured with support TE.=
 But Its not helped for me.
>
> If you know something, tell me. Or how change driver to support DSI_VSYNC=
 input.
>

I guess this is a command mode panel?  So you'd be caring about the TE
signal?  As far as I understand (from, iirc, jhugo) this was handled
by the hardware and not exposed to the driver on older devices.

If it is a video mode panel, the problem could be different (userspace
not waiting for pageflip event?)

BR,
-R
