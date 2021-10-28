Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABE343DB06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 08:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbhJ1GXA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 02:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbhJ1GW7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 02:22:59 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66C76C061570
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 23:20:33 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id t201-20020a4a3ed2000000b002b8c98da3edso1794088oot.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 23:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=6+eTf7nyr6M3KwEm+TOLweZAQxKtMfVD5JwzIPGapF4=;
        b=XFMvMVNKWo0K9tklL2H+PQ5pnRbAvZXkJu6OVqgEKFrzqKb/qBrXK4jeGJCuIl/2Rs
         ycXF/pYyFD7R3khkDEkpZo6R+ipPDYlxcQEIcRaMUSb/DuplmshZSHY9vfO4n/HZ8/Ir
         lxD4yIUK5obFrRuQqv5qF5INpaolMTU/WPINM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=6+eTf7nyr6M3KwEm+TOLweZAQxKtMfVD5JwzIPGapF4=;
        b=l0cnoPxgrYKHB+AB371maok17VKzog1aKrbJQIVEs8vQjbOUvrn0GPCSsfx6qvdqgb
         hkywrF8k38jiY4EO4Y7QSay4d+ai5sEZ4SnA5y8o7rkihm4M2so3zuc0FGepmY2db4+L
         UWWyV37hutSs8e2t+w1pXebwjy1y8TAR4hVLUJpDfP9kQOXptInEqQZ/vBxmXSd758B3
         U84jvfkpDdW54JzjOAsO7aE81r04f959Ax6E7eTMM/epS/sxUbuFpptLO1sdPmswTitU
         kL9KIv2NznYuJ7+CTEzuzJrbu97w7F4erzC6JokYGT8CU0Zu0zBeF46PIGVMpNRRXNAL
         K0Xg==
X-Gm-Message-State: AOAM530/OGbw731VH+n/RAuw+XnWcZMnpR7V1Uq3qQAZQFQeJ7iVOGjd
        DSgDmts64dnOS+SM68fVaHTpAuLUQnevHzn1zCHkcQ==
X-Google-Smtp-Source: ABdhPJyea8Fwx4YyKse423qLTPTFc+z3zOfjtneOqoZsNUJoAqTszW1lfetTqMDV080TNLNVBZYOcvECNsZXED/wHU4=
X-Received: by 2002:a4a:e94e:: with SMTP id v14mr1125894ood.1.1635402032695;
 Wed, 27 Oct 2021 23:20:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 Oct 2021 23:20:32 -0700
MIME-Version: 1.0
In-Reply-To: <1635386088-18089-2-git-send-email-quic_sbillaka@quicinc.com>
References: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com> <1635386088-18089-2-git-send-email-quic_sbillaka@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 27 Oct 2021 23:20:32 -0700
Message-ID: <CAE-0n51J60efae0yMvC_ZfxX53YZLOgY_K1cpA8PLPedr6hMBA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: msm/dp: Add DP compatible strings for sc7280
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sankeerth Billakanti <sbillaka@codeaurora.org>,
        robdclark@gmail.com, seanpaul@chromium.org,
        kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
        dianders@chromium.org, khsieh@codeaurora.org,
        mkrishn@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sankeerth Billakanti (2021-10-27 18:54:43)
> From: Sankeerth Billakanti <sbillaka@codeaurora.org>
>
> The Qualcomm SC7280 platform supports one eDP controller
> and a DP controller. This change will add the compatible
> string for both eDP and DP to msm dp-controller binding.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>
> changes in v3:
>     - Modify the subject (Doug Anderson)
>     - Add sc7280-dp also to the list (Stephen Boyd)
>
> changes in v2:
>     - Sort alphabetically (Stephen Boyd)
>     - Cleanup residual stale changes in the patch (Matthias Kaehlcke)
>     - Modify the subject (Doug Anderson)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
