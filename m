Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C143F427357
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 23:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243505AbhJHWAL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 18:00:11 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:35368 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbhJHWAL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 18:00:11 -0400
Received: by mail-oi1-f170.google.com with SMTP id n64so15562778oih.2;
        Fri, 08 Oct 2021 14:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J+PB1GhDEx5QjCPzMUbl+MUlC9KDbTpIS4i7gs7AJxk=;
        b=WEpqOwVb6ngRBTjKo40dkiEIb1Ft3DuWUy8tVBfXpKr2uevMR/QhaS48xEkmhFvPvP
         10H7KEV3+WHJjYbqOH9TAnc9LQj0PRg/dncQbOCPlSv47K1a8DCFzZPTQUPdHV6gpaej
         kyeF1fnrE4QnZm3EdX7GMm/zBg9+gdfj4ASyXgFMjhUkGiDpQ8dJO1pa4FpzZv0EhQK+
         4MqTPIGuS5jHi8Xw4KG+qa0oJvHHu7o7vf49RlwTmwBNuZaSRfNld89LomKe5rn+NFzb
         d7xh8kE7FavD/UdeqrPnwIeTxZjMIa8Q3ri3qlxgsD0M0LYvfn/WGiZOZClRA1yH0QtU
         LKpw==
X-Gm-Message-State: AOAM531gaLiTyukCoRe6B2kpPAw8BVWAsDCFKL/kEKjxtPP8yvIU/iTe
        Jr+DSHd2anUkbmYw2OXUXg==
X-Google-Smtp-Source: ABdhPJwJXLGgMO3pWGsrCW8mdAxa0PsY9A5IlolFsjx2OCeIr+FJ1Tl1xWw/2AZ+gYpjjrSfvCRY2w==
X-Received: by 2002:aca:4303:: with SMTP id q3mr11391664oia.9.1633730295280;
        Fri, 08 Oct 2021 14:58:15 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id i24sm134566oie.42.2021.10.08.14.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 14:58:14 -0700 (PDT)
Received: (nullmailer pid 3389719 invoked by uid 1000);
        Fri, 08 Oct 2021 21:58:13 -0000
Date:   Fri, 8 Oct 2021 16:58:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     srinivas.kandagatla@linaro.org, plai@codeaurora.org,
        robh+dt@kernel.org, lgirdwood@gmail.com, judyhsiao@chromium.org,
        broonie@kernel.org, tiwai@suse.com, rohitkr@codeaurora.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bgoswami@codeaurora.org, perex@perex.cz,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org,
        swboyd@chromium.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: Re: [PATCH v3 2/5] ASoC: qcom: dt-bindings: Add compatible names for
 lpass sc7280 digital codecs
Message-ID: <YWC+9TjkadLfJcV0@robh.at.kernel.org>
References: <1633702144-19017-1-git-send-email-srivasam@codeaurora.org>
 <1633702144-19017-3-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1633702144-19017-3-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 08 Oct 2021 19:39:01 +0530, Srinivasa Rao Mandadapu wrote:
> Update compatible names in va, wsa, rx and tx macro codes for lpass sc7280
> 
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml  | 4 +++-
>  Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml  | 4 +++-
>  Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml  | 4 +++-
>  Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml | 4 +++-
>  4 files changed, 12 insertions(+), 4 deletions(-)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

