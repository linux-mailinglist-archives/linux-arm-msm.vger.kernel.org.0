Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5ACA3F7BBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 19:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241043AbhHYRvp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 13:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231602AbhHYRvo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 13:51:44 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B46ACC0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 10:50:58 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id c19-20020a9d6153000000b0051829acbfc7so9245otk.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 10:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=joeEMSfwbKFOWf42c6X25rE4u+SwXoFheY/55rlm6LU=;
        b=KQ/HOnYdFw+ZF7qnp9jzF+z2MCLSv7IKlKnFCKpkaTpBdl0IV/CWYsbPjRASTs3VWj
         C8D+/SNYVY9IGiA27L3o8j3qjmjjMV97Yu49ksmzJ38yL5BetbwX6MhIAwcJao+hAYSH
         jTyNQJKSx3VVVhDdnWLkrTjoCNTbzOFv6mOCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=joeEMSfwbKFOWf42c6X25rE4u+SwXoFheY/55rlm6LU=;
        b=DhMMVjW3nDlhJAk+CYnsTEUO2srEqUaqNrA/uk+jVsvpiCtjLR75KWtracc9FXLfwZ
         ivkH4qT7HGf6vv2I9zjaZEnR9020Ckzn2fj/tomJalp6KS2cx4RoFU8e/RyXSncM2yBM
         e572m+tVmHBqt0RD72xWDzMsevo0OiijhSqZMhgk1a9P0c1Tgd7jgEAb45jOuRAssh94
         YGSYdVs1X7/DIhnmcQHJFDQDOk+xxUuWYhxCYQgC6hHAeMO/OoaymYgoCIMelqIVp+/m
         T7GSPBRVs3H7zBatWJ/E7JxYMtRnYuPe/8t4zyJklyQAUOMpmahU7Qm76jIYQ1CkjXuD
         f34w==
X-Gm-Message-State: AOAM532n7AcIhWjrZuJsBr/LuJsbZ9eRbo8ozcNMGyTfRW65rfsM8qvd
        XXApsnu1bH9kQYehUGYuROhnpqcfJ/sE+G4rpprZ1A==
X-Google-Smtp-Source: ABdhPJymKW+Q9r5NjGs3NkVet38E9V3EJHm+kKtdiXNkSMyDOfTN6qr7Dk5rQ6mPq/5GfCmqKJ5umNsFLQNCvxojzg8=
X-Received: by 2002:a05:6830:2b24:: with SMTP id l36mr21464418otv.25.1629913858077;
 Wed, 25 Aug 2021 10:50:58 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Aug 2021 17:50:57 +0000
MIME-Version: 1.0
In-Reply-To: <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
References: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org> <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 25 Aug 2021 17:50:57 +0000
Message-ID: <CAE-0n536PraSR4oqGNtxcDnR0+H-N3eQTpsgTt84oU3NAXEjeA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] dt-bindings: Add SC7280 compatible string
To:     Sankeerth Billakanti <sbillaka@codeaurora.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     robdclark@gmail.com, seanpaul@chromium.org,
        kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
        dianders@chromium.org, khsieh@codeaurora.org,
        mkrishn@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sankeerth Billakanti (2021-08-11 17:08:02)
> The Qualcomm SC7280 platform supports an eDP controller, add
> compatible string for it to msm/binding.
>
> Signed-off-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 64d8d9e..23b78ac 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -17,6 +17,9 @@ properties:
>    compatible:
>      enum:
>        - qcom,sc7180-dp
> +      - qcom,sc8180x-dp
> +      - qcom,sc8180x-edp
> +      - qcom,sc7280-edp

Also add qcom,sc7280-dp here?
