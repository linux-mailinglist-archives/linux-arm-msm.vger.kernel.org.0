Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECC86477B3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 19:02:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238614AbhLPSC4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Dec 2021 13:02:56 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:34717 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbhLPSC4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Dec 2021 13:02:56 -0500
Received: by mail-ot1-f47.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso29928004otj.1;
        Thu, 16 Dec 2021 10:02:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QQ381WmSY1ABB0mZ35OvJqIYgZKiMipXpNULkZCKiDs=;
        b=xxHrOeBEKVTCy315SGf93kJwfGj7cK29hrMMK+QyzKL56VU8nQOf6SNPZEicVEiZrj
         JDD8/fV9TVkmf79vNsjEXEvqbV0EgWxtAbY8RohQ5vkwMYdt0sej1sgYYE7DKGV3OQkx
         kfd0X50g/bn1E+UyQYNqWnptrKMSaOkibAKfTDzFNbIn8fRQSHaRRrXQTVjxl4o3Ym7L
         3MTBtbaJxR9UzMiINQ0dk0H1lWDtdIKOowQCrT38h0D3pDgaQCNUxxGQbmOtcnNhDrx6
         eKSLOWUe2tEbE5R8rsZEvPOmTCtMuPwgz1+cI3oT+r1pRnAMJh1KX47XS5l4RVHpBIfM
         yguQ==
X-Gm-Message-State: AOAM531ESCmlCcFOWF3xJlSn/R4p6+PRmh9/jkwoYuDXTLHuN2h5Kr7x
        KeTD1dLXiRrtgYsj3UeCDA==
X-Google-Smtp-Source: ABdhPJzn4BW0cemeZqsl+FNsr2G5s9GTvWt8pmx801Wgc8bSgOFAmgz/5Jg2e2++4y9spe8ck1jRZQ==
X-Received: by 2002:a9d:3af:: with SMTP id f44mr13345289otf.271.1639677775334;
        Thu, 16 Dec 2021 10:02:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id h1sm1146543otq.45.2021.12.16.10.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 10:02:54 -0800 (PST)
Received: (nullmailer pid 485016 invoked by uid 1000);
        Thu, 16 Dec 2021 18:02:53 -0000
Date:   Thu, 16 Dec 2021 12:02:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Paul Cercueil <paul@crapouillou.net>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: qcom: sm8250: Document
 "pin-switches" and "widgets"
Message-ID: <Ybt/TagtH9iDv4mu@robh.at.kernel.org>
References: <20211214142049.20422-1-stephan@gerhold.net>
 <20211214142049.20422-3-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211214142049.20422-3-stephan@gerhold.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 14, 2021 at 03:20:47PM +0100, Stephan Gerhold wrote:
> Some sound card setups might require extra pin switches to allow
> turning off certain audio components. There are two real examples for
> this in smartphones/tablets based on MSM8916:
> 
>   1. Analog speaker amplifiers connected to headphone outputs.
> 
>      The MSM8916 analog codec does not have a separate "Line Out" port
>      so some devices have an analog speaker amplifier connected to one
>      of the headphone outputs. A pin switch is necessary to allow
>      playback on headphones without also activating the speaker.
> 
>   2. External speaker codec also used as earpiece.
> 
>      Some smartphones have two front-facing (stereo) speakers that can
>      be also configured to act as an earpiece during voice calls. A pin
>      switch is needed to allow disabling the second speaker during
>      voice calls.

This all makes sense, but how that translates to the DT properties I 
don't have a clue.

> There are existing bindings that allow setting up such pin switches in
> simple-card.yaml. Document the same for Qcom sound cards.

And that description is equally as bad.

> One variant of example 1 above is added to the examples in the DT
> schema: There is an analog speaker amplifier connected to the HPH_R
> (right headphone channel) output. Adding a "Speaker" pin switch and
> widget allows turning off the speaker when audio should be only played
> via the connected headphones.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  .../devicetree/bindings/sound/qcom,sm8250.yaml   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

But nothing new here really, so

Acked-by: Rob Herring <robh@kernel.org>
