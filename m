Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E30632F328
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 19:51:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhCESuk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 13:50:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbhCESu0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 13:50:26 -0500
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BBFC061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 10:50:25 -0800 (PST)
Received: by mail-qv1-xf2b.google.com with SMTP id 15so1476322qvp.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 10:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yI8iOjteMFKoGk4zeandGRXPKmEeCoKU9NReC9R1TlA=;
        b=jdju3sRLxCIuGglN0bDwsdRLQdMI4wUI/YgyLBKCoHdX8rOcCNBbvbJ0KpYRlazEOS
         N8wzuqpxZw4XfkZ3K5SyaQAjQE7iuNrvt0rMFrrv8kLjDxbdETjbAvUm7Gnc4FEp3hQf
         B5eOseLz2ziLyCmSG5lckZi2t+qaMMTyCzF4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yI8iOjteMFKoGk4zeandGRXPKmEeCoKU9NReC9R1TlA=;
        b=U/EFxWPKumaISWOB4SKvNn0h8OyJ1eCuoYDaqZKKSi78neQteMjuv6EsLNK3/kBpaC
         3OZR5Y6hdp6OVVsf8RQWmiC3/LfhO/E4SHAcJ4f92BLwsEx0QX9y5KCHYSn2tpIhlb5H
         joAHDW8komWFrQEu63cqLQgLVzsglvP4ceYzSDEFLCfmabphRDzsn/g51q2MJxbkVA25
         Wq9PAeN/hIES+gAmvdyckypBPP/J1lSxmKWVMYqZ7DfCiAWDKPc8h17pQddafv3rc8rI
         kN+TWYTuvW9lOv3ZnqK39TzBDTKYJTG7899bMowhF1HWvsVFxYM1IJvw1BcWbzsxES/j
         GacA==
X-Gm-Message-State: AOAM530N2Rt1lr7x+I1g0zgVx5+15UaOQZPw/ygTYZ6Azw35bIoLWeFS
        gTUJ8cDDiARzuizrUyXIPeAlydiUQa7YtA==
X-Google-Smtp-Source: ABdhPJzCt8wtI1NnBR5G03kQUQ0C5q+p0RGO4zGVQGt412/+V0aoTDZYbinS9tvnu16Tp4tAX5CPPw==
X-Received: by 2002:a0c:8b12:: with SMTP id q18mr10470178qva.51.1614970224989;
        Fri, 05 Mar 2021 10:50:24 -0800 (PST)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id g11sm2431001qkk.5.2021.03.05.10.50.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 10:50:24 -0800 (PST)
Received: by mail-yb1-f177.google.com with SMTP id p186so3016849ybg.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 10:50:24 -0800 (PST)
X-Received: by 2002:a25:cf88:: with SMTP id f130mr15532432ybg.476.1614970224174;
 Fri, 05 Mar 2021 10:50:24 -0800 (PST)
MIME-Version: 1.0
References: <20210304180415.1531430-1-mka@chromium.org> <20210304100341.4.I95b8a63103b77cab6a7cf9c150f0541db57fda98@changeid>
In-Reply-To: <20210304100341.4.I95b8a63103b77cab6a7cf9c150f0541db57fda98@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 5 Mar 2021 10:50:12 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UQoXsPYqv8a25Kn+=z1pZu4YUKK7VZSm4rq_i9KpD3rQ@mail.gmail.com>
Message-ID: <CAD=FV=UQoXsPYqv8a25Kn+=z1pZu4YUKK7VZSm4rq_i9KpD3rQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc7180: Disable charger thermal
 zone for coachz rev1 and rev2
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Mar 4, 2021 at 10:04 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> CoachZ rev1 and rev2 are stuffed with a 47k NTC as thermistor for the
> charger temperature which currently isn't supported by the PM6150 ADC
> driver. Disable the charger thermal zone to avoid the use of bogus
> temperature values.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts | 9 +++++++++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts | 9 +++++++++
>  2 files changed, 18 insertions(+)

I guess this patch is written with the assumption that eventually
we'll create a "-r3" or "-r4" that has a proper thermistor stuffed but
maybe we're not sure which one?  Right now you're disabling it for
both -r1 and -r2+ which is all revisions, so this could go in the
coachz.dtsi file...

-Doug
