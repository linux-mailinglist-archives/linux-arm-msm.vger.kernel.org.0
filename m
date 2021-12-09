Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58CB446E0A6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 03:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbhLICFh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 21:05:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbhLICFg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 21:05:36 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48FF2C061353
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 18:02:04 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id d1-20020a4a3c01000000b002c2612c8e1eso1364708ooa.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 18:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6jF6qRe5SRMSQZX8Z8oZJBZNxo3XePJj0xDc5654/qk=;
        b=wCoIOYuGPwfhnh5mM8AFZxRvgEPnUsc5SsVISnljiYoCtEFEY5OwxVjc2qHSvDoVHl
         5rUPE3/+8tOvWbZXMrYYgorbcYEd6PUoM/KOi8ic4/04344sX2XQlY4rHOGCB0mievKi
         inqa6tXO3P2+P/g4H1Uh4RLYO/DioOGyKOPgxXPGRjlfoxpqMGNxWBY3oQkA6IO1sArM
         6T1q2W4a6EmzJ6yZgOmHkbV7bx3hcM5cDvkM5NnnnZ0GvwwpIjNv+P40xLsrzveaj4Ej
         cE7fWuY+j7j5wtbh6IAtAONqSvAz+mWIIHBfSTnoqdu58vD5zkJWZ2oSXv8KVKkHsbcY
         xJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6jF6qRe5SRMSQZX8Z8oZJBZNxo3XePJj0xDc5654/qk=;
        b=Fh7Lz+P2+SQVatFmYTKs4h9Ii039zx/hGC7gNzU9Z2g6qIu06YmPQFbF2vvVZueqD1
         k3Z+YuDL3blnniB0Bb4nj8Tc+1+YRpgkaaean4F/DTG9C4f9SewL0ymXKKoY5iWv07Lc
         vYJC/VeRjwcdUVSJ4WanHd0LLsjthluP93vYEp4LR7RyulGvPix+UaWKYdCc5MDn1BR5
         P0iW2ELD57kVfQvFSTUZ655Io9Ej0iwqSVvxK/ctjIVZOHVjF58u6tgqbuJlInk8n08u
         M3HOv/OBQXfaaRRLzvAYc9n084gYK4GTtNNwiHYhLfDCAWifdPkor6Wrd6p2MT/oaBIB
         La0w==
X-Gm-Message-State: AOAM531kXPWWu7FDwtI0UJuUTVXzR6FJlQxTcuhKnMpGRcRWftKmN7WO
        uuU/+iAGVPHysIonI3Nb7c4kZFFhxlF1+G+Fza2Nfg==
X-Google-Smtp-Source: ABdhPJwwJMv8SYHU3EkSbYrgYngnVgHQ4AO8cwD1tYGgWSvzZ9StW1TExuN282563HLeY7phJa9zhbYnSnz/V5tFY1k=
X-Received: by 2002:a4a:aa8f:: with SMTP id d15mr2221617oon.86.1639015323501;
 Wed, 08 Dec 2021 18:02:03 -0800 (PST)
MIME-Version: 1.0
References: <20211201072434.3968768-1-vkoul@kernel.org> <20211201072434.3968768-2-vkoul@kernel.org>
In-Reply-To: <20211201072434.3968768-2-vkoul@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Dec 2021 03:01:51 +0100
Message-ID: <CACRpkdZP7Po9JaozB7s7--qoM90a1YBdu0bwTHYPuDi-Cr0sXw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add SM8450 pinctrl bindings
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 1, 2021 at 8:24 AM Vinod Koul <vkoul@kernel.org> wrote:

> Add device tree binding Documentation details for Qualcomm SM8450
> TLMM device
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Patch applied!

Yours,
Linus Walleij
