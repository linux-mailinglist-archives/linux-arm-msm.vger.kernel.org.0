Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE823E9BA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 02:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232949AbhHLAbh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 20:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232932AbhHLAbg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 20:31:36 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095F8C0613D3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 17:31:12 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id c2-20020a0568303482b029048bcf4c6bd9so5605185otu.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 17:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=PLCgWUlIwJKxfCShn29qzVeYMAxb9Jy6/zN3VIhO6gc=;
        b=F+OYirtrBGe89AnSkLHY5okk962mMXPAjiVYp3bwDE3Y0e6yJEGiSoJa1Amx7Jm/zz
         fSUSKYN5T+ZdYRgOOq1FEn2NxKXPC+HEYR9HYicAEF4RmfkFpX5U9cbrlwF+eUFD03FY
         Tq0DAX9aAxh4iU/4ulEK/J7zMULXUXeWovJbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=PLCgWUlIwJKxfCShn29qzVeYMAxb9Jy6/zN3VIhO6gc=;
        b=sFPg8gE9Uy2cdxtgY5kYJMgjdBhcOABf6U3ISyF2SNA8lP9WnRQnbuYPFwSQ1SdUW9
         oUUxdJS6I9MbEXK1M6cDFxxQNTTcyh+8i1VsAIuliZJjT5aZCJ4r3r+90iYBKA9OVtDq
         kRE6ofPzhhAQGbaUgSsPXgrGCiH3BmoLIcB02N6+e9x/6swaEr/QLA6n7hc6bI+2jJ4F
         3GaOZnKq8taYKyC2n+/EGmq74ixMX9IzfBsKJtuYvjx8fy+AMeljJScMGMioNAHESLtC
         WOBDLlAQmwXzDQj3EfYV1uQ4QT7mPdzH4bRve2Ne8J4J0I5yZ7uN7nm1vXmev7roUHja
         4OvA==
X-Gm-Message-State: AOAM5324xZuPATb8sVxjRGE5fzpupq8n83Txk/ZXzNestmXCDGMzAVdm
        mKzCQbz14Qvo9ZOYSO74KmYVk8nHnDYmL03lI/BhrA==
X-Google-Smtp-Source: ABdhPJyG97deqUVD5kKCSHP4TSJP+P7NfrbuOt/mh2i4whlYEQ588RKKNWLWiM2kuB+OHQvyR9jjX5MbyQcTVdydZn8=
X-Received: by 2002:a9d:5542:: with SMTP id h2mr1286181oti.25.1628728271301;
 Wed, 11 Aug 2021 17:31:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Aug 2021 17:31:10 -0700
MIME-Version: 1.0
In-Reply-To: <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
References: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org> <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 11 Aug 2021 17:31:10 -0700
Message-ID: <CAE-0n50RF7fCC+Vic9DpT6gjcYrmTzd+7M6Y9SAhgLoD=_Sq7Q@mail.gmail.com>
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

Please sort this alphabetically.

         - qcom,sc7180-dp
         - qcom,sc7280-edp
         - qcom,sc8180x-dp
         - qcom,sc8180x-edp

>
>    reg:
>      maxItems: 1
