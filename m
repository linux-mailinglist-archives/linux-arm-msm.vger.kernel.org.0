Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC5B64404B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 23:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231315AbhJ2VRl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 17:17:41 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:36550 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbhJ2VRl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 17:17:41 -0400
Received: by mail-oi1-f174.google.com with SMTP id q124so15174623oig.3;
        Fri, 29 Oct 2021 14:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Lrv4HMu3pJ4ELKYQ4yExPi3yFrqg0rLji7k8MjNUXdo=;
        b=WjohNrmTT6XhS6vBnTWDuTAIPidTdAELil8pe12LDAlPZtQnMe82L0iqKslnDu4z+G
         4wxuYWYT3/1Z74odxp+amTGGOSZkMekfaVlUITU1uN79Xv5xpxoULBTxiG5u74V2mHP9
         2SjkP7bYZH0SJZ3hVqQNAnzvlhQOkqbE1adABHthfcT66CsFYvcHHX3DKD3VyisbkJKo
         w5SPwph7vIIo83TjkA0rMNMxz5Wr3c6JQrHJblRHnB+cLmSmsYzd0HS2QhrTdDxtDT2/
         H4+T7EGmgFCwdHYOPUdlYf6vsxaTHhiwrxYWepg4wtUYcXgcdLiXrHoo7eUsykzzWXwC
         hRdg==
X-Gm-Message-State: AOAM533BaDl2HKbpvfAERM+gmm7cEggFbT6ADTGUwwSbqOl8E0XM+6gJ
        yD44pAKDDo3UPPbDPT2ZTw==
X-Google-Smtp-Source: ABdhPJwjB0Kh6gEJISuzMDCDeL6VRh6W0N6NspeRpaWZ/L4c9zigIOszctikcivP1FbgRMi2+kWcQA==
X-Received: by 2002:a05:6808:2127:: with SMTP id r39mr4600232oiw.116.1635542111994;
        Fri, 29 Oct 2021 14:15:11 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q15sm2163138otk.81.2021.10.29.14.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 14:15:11 -0700 (PDT)
Received: (nullmailer pid 3221282 invoked by uid 1000);
        Fri, 29 Oct 2021 21:15:10 -0000
From:   Rob Herring <robh@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, rohitkr@codeaurora.org,
        alsa-devel@alsa-project.org, tiwai@suse.com,
        devicetree@vger.kernel.org, broonie@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        plai@codeaurora.org, swboyd@chromium.org, judyhsiao@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        perex@perex.cz, bgoswami@codeaurora.org,
        srinivas.kandagatla@linaro.org
In-Reply-To: <1635519876-7112-2-git-send-email-srivasam@codeaurora.org>
References: <1635519876-7112-1-git-send-email-srivasam@codeaurora.org> <1635519876-7112-2-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v4 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine machine bindings
Date:   Fri, 29 Oct 2021 16:15:10 -0500
Message-Id: <1635542110.100441.3221281.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 29 Oct 2021 20:34:35 +0530, Srinivasa Rao Mandadapu wrote:
> Add devicetree bindings documentation file for sc7280 sound card
> registration.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  .../bindings/sound/google,sc7280-herobrine.yaml    | 170 +++++++++++++++++++++
>  1 file changed, 170 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dts:46.24-25 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:385: Documentation/devicetree/bindings/sound/google,sc7280-herobrine.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1441: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1548069

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

