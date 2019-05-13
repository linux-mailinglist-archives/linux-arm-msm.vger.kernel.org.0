Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF231BFA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2019 00:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfEMWsg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 18:48:36 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:36239 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfEMWsg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 18:48:36 -0400
Received: by mail-ua1-f65.google.com with SMTP id z17so5482428uar.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2019 15:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ZsjBt83vZW6+pdPdwVwbAfNO1Tv5TbEk4rycrbIYbM=;
        b=Tnz5OKHnLPR6l118hvL+HTgPPNlqas3wlnC3peejx+OqWX4dLD+cDrKseKtykoAH9e
         GLcRZfSqtv9xi3Ko60lAn/PLCJOfMAWSxymkyBglt2shWGuRu6sroABxXS9otN9gsBD4
         7yvl0lsv06bq8HtkrCD8e7D0l3meHeTy2Grn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ZsjBt83vZW6+pdPdwVwbAfNO1Tv5TbEk4rycrbIYbM=;
        b=ZZgrpd3DObtZ/D7yHhl/zn55JJvkafy0wfQrbSFflvmDDd0ejt8jNiYoa8tU3lLQW/
         tObFH6WIwlMxl4RZeeXdanfsGQBFkMahpQRMdCkpspTCrAU43ORQ7H2rwzFQrntZMuHH
         24yY8/7oy1UJShVfWW4J3bHKla0yXXf8vviZBIhWzOH4GwMTx8KNvztg1AgvdoMZ1wsz
         9Hxuqj6Vg4+twEhsjnMsZwZQP+Mx8QkepPyXJPfpxwZ275QpP7FBRCWlWb0UawFNHI7l
         rslwQ3fS+P6IrKFYGFKiaNx11LNWZROm4eNmYgYEMs+rW/M9oFVSLZXsgabZSzcxdckn
         s8GQ==
X-Gm-Message-State: APjAAAVtr9idvqM6OjSkqTXBVNo44E/ta+LWx2NxGvn6VOtmggg5PGVk
        QBdlSK2RguPUzYy9gALA3XldM97yEns=
X-Google-Smtp-Source: APXvYqyN0thJbbHRT7PO6SjMxh6IPe3w9RWwuwpAHsqSmX2SRNT6VJ9TI12WL50mRxzGzLzHRIIniA==
X-Received: by 2002:a9f:21ee:: with SMTP id 101mr2523491uac.50.1557787714806;
        Mon, 13 May 2019 15:48:34 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 2sm19498510vke.27.2019.05.13.15.48.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 15:48:34 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id o5so2822698vsq.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2019 15:48:33 -0700 (PDT)
X-Received: by 2002:a67:b348:: with SMTP id b8mr7122321vsm.144.1557787713606;
 Mon, 13 May 2019 15:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190509184415.11592-1-robdclark@gmail.com> <20190509184415.11592-3-robdclark@gmail.com>
In-Reply-To: <20190509184415.11592-3-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 13 May 2019 15:48:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WXW3aApS=c7baxhtfr1Nf-UnBN2s=rEBBkjj4=TCdT+g@mail.gmail.com>
Message-ID: <CAD=FV=WXW3aApS=c7baxhtfr1Nf-UnBN2s=rEBBkjj4=TCdT+g@mail.gmail.com>
Subject: Re: [RFC 2/3] arm64: dts: qcom: sdm845-cheza: Re-add reserved memory
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, May 9, 2019 at 11:44 AM Rob Clark <robdclark@gmail.com> wrote:

> From: Douglas Anderson <dianders@chromium.org>
>
> Let's fixup the reserved memory to re-add the things we deleted in
> ("CHROMIUM: arm64: dts: qcom: sdm845-cheza: Temporarily delete
> reserved-mem changes") in a way that plays nicely with the new
> upstream definitions.

The message above makes no sense since that commit you reference isn't
in upstream.

...but in any case, why not squash this in with the previous commit?


> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Remove Stephen's Reviewed-by.  In general reviews that happen in the
Chrome OS gerrit shouldn't be carried over when things are posted
upstream.


> +/* Increase the size from 2MB to 8MB */
> +&rmtfs_mem {
> +       reg = <0 0x88f00000 0 0x800000>;
> +};
> +
> +/ {
> +       reserved-memory {
> +               venus_mem: memory@96000000 {
> +                       reg = <0 0x96000000 0 0x500000>;
> +                       no-map;
> +               };
> +       };
> +};

nit: blank line?

-Doug
