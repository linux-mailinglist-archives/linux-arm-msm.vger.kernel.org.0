Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE41341E069
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 19:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352920AbhI3SAM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 14:00:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352917AbhI3SAK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 14:00:10 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D27FBC06176A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 10:58:27 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id x124so8323766oix.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 10:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=ODaJrzhlII7IaX+qlNLhzszeBmnqReAaw8HMQDA91KQ=;
        b=bTQg8VLL960aI4MFPT4bL+ziwayamEyzDehDR1iOJFMPkxj/2Nk4rKVj9YVCEdzD6b
         UrAEhn7yK+oZWFVFV9a2Vsk+1xTPbIH4KRcCLTJq6nYecBRghntzlrD0p0OATanZSj0t
         St0+87W3xKmk6mTdbO+IC0+LpfWha2ZwUXZQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=ODaJrzhlII7IaX+qlNLhzszeBmnqReAaw8HMQDA91KQ=;
        b=7NAioao6UUvWIwY2E9dfwTqaIbVq410PByyDy1bMOZwntGytb8LeAC8//nUBK93U/1
         mgfySbIVF4fZ3KLTPRgtuxcYrzvXqtbUEH1fnSfAK8N+jwVy2UnDp2+h9/IMVr5ViWEY
         pMl8D41jQg29hUIjI+DW1abCt3dr8tqYm/qmwDux4C7yDhlJLFvfYM/QZyN+R9yHUqxp
         KXXQr6HyT/YBlOqh6sQIU8m3h6oE00kS1na5n304rRzNBBpnrwScnoND08i75RKaz/nB
         qzkUH7yqFPLcLYdzA9gTzeWPMPf8bzpBDflpetL977DnVadFKlf4Zwigia2K0+uaYVqp
         xc6g==
X-Gm-Message-State: AOAM532+70tYYE6iJcF/jbZnGLGj79I3D36TwL5cCNV9x0x60meAblCx
        FHo/Hg+jCsTOiwaj5+Hc6dSXXzILfU1CJVCiwHQBew==
X-Google-Smtp-Source: ABdhPJx0TbzSitN4I1kanbYg8IkdrXr3mPw09WhLirZ71+GW8AkE5QIIHBvLl1NRDRFk/IIUhiDGGlyQIyMalzrBWvE=
X-Received: by 2002:aca:42d7:: with SMTP id p206mr501591oia.32.1633024707214;
 Thu, 30 Sep 2021 10:58:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Sep 2021 10:58:26 -0700
MIME-Version: 1.0
In-Reply-To: <5adf2ab2c2a162272509d253bd797721@codeaurora.org>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
 <1629282424-4070-2-git-send-email-mkrishn@codeaurora.org> <CAE-0n50b=pX=1MFwGPDvDR=O03tUAkAgyMonGm2+SXBft=16KQ@mail.gmail.com>
 <5adf2ab2c2a162272509d253bd797721@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 30 Sep 2021 10:58:26 -0700
Message-ID: <CAE-0n53kQU=8pdcWR0OZap1wDgxxwed0qvfaGruc71YT5Cj1iA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sc7280: add display dt nodes
To:     mkrishn@codeaurora.org
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org,
        sbillaka@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, bjorn.andersson@linaro.org,
        khsieh@codeaurora.org, rajeevny@codeaurora.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting mkrishn@codeaurora.org (2021-09-30 04:56:59)
> On 2021-08-19 01:27, Stephen Boyd wrote:
> > Quoting Krishna Manikandan (2021-08-18 03:27:02)
> >> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> index 53a21d0..fd7ff1c 100644
> >> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> +
> >> +                       status = "disabled";
> >> +
> >> +                       mdp: mdp@ae01000 {
> >
> > display-controller@ae01000
>
> Stephen,
>     In the current driver code, there is a substring comparison for "mdp"
> in device node name as part of probe sequence. If "mdp" is not present
> in the node name, it will
>     return an error resulting in probe failure. Can we continue using mdp
> as nodename instead of display controller?
>

Can we fix the driver to not look for node names and look for compatible
strings instead? It took me a minute to find compare_name_mdp() in
drivers/gpu/drm/msm/msm_drv.c to understand what you're talking about.
Perhaps looking for qcom,mdp5 in there will be sufficient instead of
looking at the node name.
