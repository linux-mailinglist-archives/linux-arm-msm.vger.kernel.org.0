Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10BEC3C19AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 21:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhGHTTZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 15:19:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhGHTTY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 15:19:24 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330A5C061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 12:16:42 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id i2-20020a4a2b020000b0290259a8e94329so1645368ooa.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 12:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=D5KN5KCtM6Y6+Lvcam1ZdlE3TuTqT7D2J9oLO6I8aQo=;
        b=I8k13DUrzjT49dELyQh4omr/mUGhHbTp2tAk8+SVxvCWudwrvoJqjMKGAn5dvQhXXl
         uvdigZU6c2RXZRiCHqYkFWfekc7JJyiO4HBlkuS454j065uVlWBu29d2rl+vvEtYhvT4
         1LfH2I+148d0VTXzmB/Pu/Ah8G7vrP+Px4rmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=D5KN5KCtM6Y6+Lvcam1ZdlE3TuTqT7D2J9oLO6I8aQo=;
        b=m6O0j2dJIwOn8axg2Dm4UW5PIhguzsbYVGHHvNGcIE4vy02PZGRM730wIHtUVBNPZ6
         IwlcUGKPF2htWVPkQeSoTszWV5T1+NoOxlclP05ygk+mG53+Du0IWRcEMVQTqw3UQjW4
         AOROlPUqPbgI0KDupSOxzLXsoOVZAZ6j+At6XcfFkKk/ruEEmWmZMtLv2DpHV4713g2N
         LmVZdedGQlJovjZLp7WxWORZGD6zZo6V06sRka/2FIJ0lGaKyvhR7s5LyCJS+pGSWajm
         O9nzF9fakU3FU/oVRKnNk3QOIvOqa5oD5WCfWzRZu/QizcC7Ay+S/kt3M6BcOhSjiksV
         x2vg==
X-Gm-Message-State: AOAM533TCWnrk+tGBMt5O7rliWqKONng8bVJpaJc5rL1ECFNDukEL8tT
        uyo+oRqyRbxAK3ZfLk06wS02MuSIFS3Kla0F94kcjg==
X-Google-Smtp-Source: ABdhPJzxANdUDNLft5OEBDh87ByS325dcaYfTfU0y4ofQVZISa1NhZqAXecwZWg91NXoj2+oyys5WzUhiSBrUjFaM68=
X-Received: by 2002:a4a:e206:: with SMTP id b6mr21343518oot.16.1625771801521;
 Thu, 08 Jul 2021 12:16:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Jul 2021 19:16:41 +0000
MIME-Version: 1.0
In-Reply-To: <20210708090810.174767-1-judyhsiao@chromium.org>
References: <20210708090810.174767-1-judyhsiao@chromium.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 8 Jul 2021 19:16:41 +0000
Message-ID: <CAE-0n53Jo4LuCeV6s6nubPKgJ+ShPsLOnaHoHTSZOCoULKF05Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Set adau wakeup delay to 80 ms
To:     Andy Gross <agross@kernel.org>, Judy Hsiao <judyhsiao@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        dianders@chromium.org, dgreid@chromium.org, cychiang@google.com,
        judyhsiao@google.com, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Judy Hsiao (2021-07-08 02:08:10)
> Set audu wakeup delay to 80 ms for fixing pop noise during capture begin.
>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---

Presumably also

Fixes: ba5f9b5d7ff3 ("arm64: dts: qcom: sc7180: Add wakeup delay for
adau codec")

>  arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> index 6f9c07147551..a758e4d22612 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> @@ -23,7 +23,7 @@ / {
>         adau7002: audio-codec-1 {
>                 compatible = "adi,adau7002";
>                 IOVDD-supply = <&pp1800_l15a>;
> -               wakeup-delay-ms = <15>;
> +               wakeup-delay-ms = <80>;
>                 #sound-dai-cells = <0>;
>         };
>
> --
> 2.31.0
>
