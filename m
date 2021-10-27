Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96BD743D36E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 23:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240807AbhJ0VEa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 17:04:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238879AbhJ0VEa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 17:04:30 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CEE7C061570
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 14:02:04 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id y207so5235743oia.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 14:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=R/5mqaAD7u8YJi+R3Jae+PBQwDj790p4urFkBQ9hMFo=;
        b=S+UqJ+m8jTaSYhorC+Syd7X4CBX+ACkq0K53U150PJZr9KjKvCHPTNCgzhr2HXclZq
         L2h2Ls+caGi3aAV8Avz6WL4SMICh5WwVpLP96WAJSvzIl326jysPNqo4YR2HLn7O4B/O
         3+wAqkoyuqzdBmCRaWutqsf+NZkmadJiyYAKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=R/5mqaAD7u8YJi+R3Jae+PBQwDj790p4urFkBQ9hMFo=;
        b=RrIEJxzT7t0EqPVudGR8PZuWWq0xjOAi0bWupxGy5MQV0dSEXS1NAnWGrDJLrvy9Fv
         bwAyDrMl2Ii4YGj8rQaFDwzbgPRCxhpB2ePIRGClmQLBEGP3HQn4kppzgtdroQ7J7ycd
         w7QpVaXiZqHbWSE0/EY7aldyWEi+Phj2CrD4IjCytOdIsriD3t5lKOBNHCqCs+GHhWeV
         fWhDW22KVsJQDv0fMkbHytpoAQQAHgQqfmgUXejBoYqNI6IaWygTpp5+vdjdwsbz0jLp
         xXy44MnDBubmh5YQxiEwE1mb65cq2f7YPVIeT+h3Oqpy62u6uYnFvL9g6U+5ddmN+EFa
         IMlQ==
X-Gm-Message-State: AOAM533jvjbRc+Xeh96ZBNxfjMTNk/R7pLZkvWTTa1XTcrvnvIQcFrSE
        pZtrpko/w94xD/4raryAEy+eEPJLcHXCxRadv40gZg==
X-Google-Smtp-Source: ABdhPJzHgjm2QUB1Kb2T5goQlClqfwdgymvtu7rf5vHGAkVJ+BI2qr3BG5waUuMOpv+n1SBt2k7GstXBcM56lBVH6xk=
X-Received: by 2002:a05:6808:a1d:: with SMTP id n29mr5417189oij.164.1635368524003;
 Wed, 27 Oct 2021 14:02:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Oct 2021 14:02:03 -0700
MIME-Version: 1.0
In-Reply-To: <1635250764-13994-3-git-send-email-srivasam@codeaurora.org>
References: <1635250764-13994-1-git-send-email-srivasam@codeaurora.org> <1635250764-13994-3-git-send-email-srivasam@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 27 Oct 2021 14:02:03 -0700
Message-ID: <CAE-0n521XmdKMcsf+jhjjoJuTo0C4JvZZ7dRqU3ZxkTU9hu+kg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: soundwire: qcom: Add bindings for RX
 and TX cgcr register control
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, plai@codeaurora.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
        tiwai@suse.com
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2021-10-26 05:19:23)
> Update description for RX and TX cgcr register control property required for
> soundwire version 1.6.0 and above.
>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/soundwire/qcom,sdw.txt | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> index b93a2b3..91b9086 100644
> --- a/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> +++ b/Documentation/devicetree/bindings/soundwire/qcom,sdw.txt
> @@ -150,6 +150,15 @@ board specific bus parameters.
>                     or applicable for the respective data port.
>                     More info in MIPI Alliance SoundWire 1.0 Specifications.
>
> +- qcom,swrm-hctl-reg:
> +       Usage: optional
> +       Value type: <prop-encoded-array>
> +       Definition: The base address of SoundWire RX and TX cgcr register
> +                   address space.

cgcr is "clock gate control register"?

> +                   This is to update soundwire master rxtx cgcr register field to
> +                   make clock gating control as software controllable for RX path and
> +                   TX path which is required for SoundWire version 1.6.0 and above.

Nak. Use clk APIs to control clks, not direct MMIO writes into a
different device.
