Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26456315F39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 07:03:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhBJGCc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 01:02:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbhBJGC2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 01:02:28 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05654C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 22:02:30 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id b8so599102plh.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 22:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=AnDOjvy0RsO3VSERzENqMVwGgzEwGMYoc3QahP6tzEQ=;
        b=FpIwkJD6dgOjciyeoieXTiODfSV7RZMzfM0GYGzDJLCoYgYLBKI8rxpx3O5fpGbEj9
         yRtQVfK6MMxBwfPBu0mWoUUeOXmQRQd9ck03xGeCxSUCyu/IMMsFXixqg4VHR9abCNFY
         TbJ3sCHiK1l2QlV5eU8BsK+t5Ik9FunYlTCzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=AnDOjvy0RsO3VSERzENqMVwGgzEwGMYoc3QahP6tzEQ=;
        b=ZFikXB0wqKkylM+mgZrixInLSANm8iUBOdlstI8LDw4TsMcG0zW4lK59IBHmHPPZTD
         iuKZc/5ErQkpNmJckCPSM95pldrPPlWLKeleLII0B7Pf6tBDvP8OsNlUsSQlKUAX3GwI
         CO2ls4zPxUe6cIRLWSYVDJcSGCo2tsDcVWfhi1uTpil/v/53kxRQCkLrWgUZAcAt0Jej
         yGq62eQS/bxN6oXNDxvacI49HEyH1gPnlkFHVNvk1/25OebVkIz+yuULbWyVaJDUJfzY
         J37s9pF2tRQAm1hfY7KJyHgCF8eRJfP2EFpYtEeLohrY5eZr3s8VIIY5K9Me8qCC0V8a
         0MJg==
X-Gm-Message-State: AOAM531Mb3mUBNB1pWWKjA8G2Gn3U/qz03sZ7iCPuE3JePtyGltOYCdi
        7hSin7YoHU8PwJ0n4EXVYmthpOvpG90mOw==
X-Google-Smtp-Source: ABdhPJw4dkmxdnBP52Ty7cl7JYwcWE53glRxPOoKukldNB0nIX95bIklw3kr08nC7mNrXMKCGWbJBA==
X-Received: by 2002:a17:902:f1c2:b029:e2:fb7d:7e58 with SMTP id e2-20020a170902f1c2b02900e2fb7d7e58mr1570870plc.54.1612936950197;
        Tue, 09 Feb 2021 22:02:30 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:58e2:748e:a316:9823])
        by smtp.gmail.com with ESMTPSA id f28sm778256pfq.88.2021.02.09.22.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 22:02:29 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2411ac0b2de4b4324b41f08761af1dff@codeaurora.org>
References: <1612420939-15502-1-git-send-email-mkrishn@codeaurora.org> <1612420939-15502-2-git-send-email-mkrishn@codeaurora.org> <161256448377.76967.104870400778698831@swboyd.mtv.corp.google.com> <2411ac0b2de4b4324b41f08761af1dff@codeaurora.org>
Subject: Re: [PATCH v10 2/4] dt-bindings: msm: dsi: add yaml schemas for DSI bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, bjorn.andersson@linaro.org,
        vinod.koul@linaro.org, rnayak@codeaurora.org,
        dianders@chromium.org, sibis@codeaurora.org
To:     mkrishn@codeaurora.org
Date:   Tue, 09 Feb 2021 22:02:27 -0800
Message-ID: <161293694727.418021.3278297564567882319@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting mkrishn@codeaurora.org (2021-02-09 02:53:41)
> On 2021-02-06 04:04, Stephen Boyd wrote:
> >> +  - interrupts
> >> +  - clocks
> >> +  - clock-names
> >> +  - phys
> >> +  - phy-names
> >> +  - ports
> >> +
> >> +unevaluatedProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +     #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> >> +     #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> >> +
> >> +     soc {
> >> +       #address-cells =3D <2>;
> >> +       #size-cells =3D <2>;
> >=20
> > The soc node can be left out.
> Should I follow the same approach that you suggested in DP yaml patch=20
> here also ?
> ie. soc {
>          #address-cells =3D <2>;
>          #size-cells =3D <2>;
>=20
>          dsi@ae9400000{
>            ...
>          }
>      }

Yes.

> Link :=20
> https://patchwork.kernel.org/project/linux-arm-msm/patch/1612420939-15502=
-4-git-send-email-mkrishn@codeaurora.org/
> Comment:
>             Please look at section "2.2.2 Generic Names Recommendation"=20
> of the DT
>             spec[1] to find a proper name. I don't see 'subsystem' there =

> but that
>             may be because it shouldn't really exist as a node. Instead=20
> we should
>             have the child nodes sit directly under the SoC node.
