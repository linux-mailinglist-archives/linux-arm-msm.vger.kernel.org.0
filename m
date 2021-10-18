Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A8D431986
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 14:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbhJRMon (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 08:44:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbhJRMom (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 08:44:42 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3883AC06161C;
        Mon, 18 Oct 2021 05:42:31 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id r18so70777877edv.12;
        Mon, 18 Oct 2021 05:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0iYdyokYod4LZcTae4ruCEjJ8TW63KspCJvOc18aEGY=;
        b=DJ+DZZJWvqJ+4q6RDg1mfZwz48wraW0kyXocBAP5Nx8CsQ6SvSlzie5M0ATmxYMYSr
         5ddXvb9oQ7nJ+07DAT9qVQYyvaO7dgKLdAVx4fy7ppmamL1CgoVOaOZc0ti4yMouxrAJ
         JQGs3E/mH8IcXzjdPUDpLhBvHkhfC176YCvJC1m8rzQ4RBGQZ4iFPZOt+51iqBw92O3s
         JUmlIijDEXLVS0HeA7vwNO/OW0QbFfJFYcRra9wpNb/3TcCNeHd8NCYn6gW1VlsG9OQ+
         AmdYOWtDf9F7R5SV1V1BDTPXZ7Ftl3T195Gi5x4aCm+mz/4TDMThJ5D7xB++j582xUoy
         KHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0iYdyokYod4LZcTae4ruCEjJ8TW63KspCJvOc18aEGY=;
        b=A/60TjxoqbB4tMedphHrVJkEXXYhgP0CxEb5Kyk2aP1pEmY7kNUqNRthW2pgzQ1Jce
         bo4FlZeKVDOWxmCNMmmuCaUC6K/6Hv9DiWERohY040ek+cyBQr+Rd/dxPPURx981RMdY
         x668YVyUPcgaLvvusW7xEh3BawbzrexZ7cDBGMpIJT9esSHB4gzDzLim9t4c20hBtyYB
         RGOm4fTW63743hw6MOcy9+26GwbUNDgx0oM8Tx+leGmYjGdsu4Lny/uxyLOTAtTEeQrO
         aCFxQyDtZKFUhYGhHhPYWHkf9kWBMa8n7Lq5cAFDcNL7LI9YS4NcG9hyk/6b9TIU4Z3A
         14Ug==
X-Gm-Message-State: AOAM533nQiuM+dnujrP+Ytdpx3qEBH7yuShjuEwv8Oel+PYGp0ec/c1D
        2Z08NnluWkCiLQY1HIKqp9lYIpU5J0zgWGbKf6I=
X-Google-Smtp-Source: ABdhPJx1Yr8Ty0BkPpsKqK9TDNUWSEsCZ86NgCSskCbZwziCccTqEDcX8aJvx4og7kLumF6keMezyg1srwlsiXGmd8U=
X-Received: by 2002:a17:906:9888:: with SMTP id zc8mr30340887ejb.504.1634560946664;
 Mon, 18 Oct 2021 05:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <75e8ba40076ad707d47e3a3670e6b23c1b8b11bc.1633874223.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <75e8ba40076ad707d47e3a3670e6b23c1b8b11bc.1633874223.git.christophe.jaillet@wanadoo.fr>
From:   Christian Gmeiner <christian.gmeiner@gmail.com>
Date:   Mon, 18 Oct 2021 14:42:15 +0200
Message-ID: <CAH9NwWdC1pV6Uwe_2NkBZGeUb_ejFH-YVYdhx0wpmZbL8CnRoA@mail.gmail.com>
Subject: Re: [PATCH] drm: Remove redundant 'flush_workqueue()' calls
To:     christophe.jaillet@wanadoo.fr
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        jyri.sarha@iki.fi, tomba@kernel.org,
        linux-graphics-maintainer@vmware.com, zackr@vmware.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        The etnaviv authors <etnaviv@lists.freedesktop.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Am So., 10. Okt. 2021 um 16:08 Uhr schrieb Christophe JAILLET
<christophe.jaillet@wanadoo.fr>:
>
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
>
> Remove the redundant 'flush_workqueue()' calls.
>
> This was generated with coccinelle:
>
> @@
> expression E;
> @@
> -       flush_workqueue(E);
>         destroy_workqueue(E);
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

For drm/etnaviv:
Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
