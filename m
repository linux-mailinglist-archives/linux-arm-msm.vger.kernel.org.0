Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC47026AA3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 19:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgIORLK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 13:11:10 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39321 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727749AbgIORH7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 13:07:59 -0400
Received: by mail-pf1-f194.google.com with SMTP id n14so2309571pff.6;
        Tue, 15 Sep 2020 10:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qgVvip2gid1sMQiuIbXhFpJDtDAimXj33Y+agHxQwcw=;
        b=oxLpgLLRjOq0MTW3RnT9k4qotszD5ImoHpZOwkfEoVzEeYmoMqZr65Xb+D7Ui8NPyi
         C6nX5YlNcSUIQ+/8s71JzxK4lH44mDJHBbbVfbPoAso7a4pCHEblDQHSyNKo1OVim70O
         pDi8pVoO7mLW3pWCaV4NxXr0d3zsj44ywH0/cpQ5eg5XpObY9kRIXRjznRUzmwrFswWA
         WB0YuKDvylY7KSq/L05gadjF3TB9m1nBXysoOw+45TMbWB+akfnBIwka2hfrvgLr1PyI
         JsC24Ha82MZYXGfyatGIl5mDMJI1UYOklh3bFfp9zUZgHB8pAB91QcfXAZUFSjZZIER4
         AKtg==
X-Gm-Message-State: AOAM5305pJPPmQ6fMXWppVyKam2sTo4IgxR5vY9TNS09mi8opHPo8V1K
        K9L8RueVpxEx5lMoaKojeiKVwMUp+pbh9yk=
X-Google-Smtp-Source: ABdhPJyxiIldSduc04usuk5QBvT+wnoYzzAPNrEfmL6fLJS15ymJJogCJh7Iz6y2lwVoZrM6BGoOuA==
X-Received: by 2002:a92:c702:: with SMTP id a2mr2102118ilp.235.1600189017553;
        Tue, 15 Sep 2020 09:56:57 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id d71sm9343639ill.52.2020.09.15.09.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 09:56:56 -0700 (PDT)
Received: (nullmailer pid 2118248 invoked by uid 1000);
        Tue, 15 Sep 2020 16:56:54 -0000
Date:   Tue, 15 Sep 2020 10:56:54 -0600
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, lgirdwood@gmail.com, rohitkr@codeaurora.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        plai@codeaurora.org, perex@perex.cz, alsa-devel@alsa-project.org,
        srinivas.kandagatla@linaro.org, linux-kernel@vger.kernel.org,
        tiwai@suse.com, broonie@kernel.org, bjorn.andersson@linaro.org,
        agross@kernel.org, bgoswami@codeaurora.org
Subject: Re: [PATCH v4 1/5] ASoC: Add sc7180-lpass binding header hdmi define
Message-ID: <20200915165654.GA2118198@bogus>
References: <1599587037-6742-1-git-send-email-srivasam@codeaurora.org>
 <010101746ed1bf90-d7293075-e0a7-494b-80f6-e59569e60fdb-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <010101746ed1bf90-d7293075-e0a7-494b-80f6-e59569e60fdb-000000@us-west-2.amazonses.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 08 Sep 2020 17:44:33 +0000, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Add header defining hdmi dai-id for SC7180 lpass soc
> in dt bindings.
> 
> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> ---
>  include/dt-bindings/sound/sc7180-lpass.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
