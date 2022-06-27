Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3133A55DCC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236667AbiF0Xfl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 19:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240918AbiF0Xfl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 19:35:41 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C7E5E025
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 16:35:40 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id u12so22218351eja.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 16:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G4JUc3v4HQm863ZQSGCIjzj/xZC/uwmhPBskGvufwR8=;
        b=coFgLHRTH3mt3KuL21phdf35IlaYa+zTeDnnpiw9K7CsIZiNqfeMGzuiU1ebteiDvT
         TGpgbPOxX+3j92MRFmqescfYo4JXBfo5CDeARrf7/HbqdaktWEhPfvVsMzQtNXtW8KU3
         w/OVnoXeBpMK/nh61ievKHUGKLu8uQfYZDUBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G4JUc3v4HQm863ZQSGCIjzj/xZC/uwmhPBskGvufwR8=;
        b=phh/EKCCj++EVnkfB4uRYB9rIZglvNpr/Ufw/Vo7tGlPk8/n4qv050qg+ytQq2mtsL
         tlAWBykPAJTbjOt1BTjfjTwWokPsc4+L65zrNs386wRqNFxGX3S1gPCxKm+fY7/UMrTK
         NnTawX+pWYxItS6v1a9KP8nWA2FpliUDb2LoAyL62gYo+M3THIEF+stwudbBOXjZp365
         ThLfHd+oAStpqtJuxgDXBYQxVlJW0fYMUWrqdEHI1w35XPgV9NS8k5grmnLrGVaBuBIU
         lR5GC+0PRQu8HZMxNLVgRKqaNtNrMr2ij+tUEyVsJsifB0rFrHHmj3QfY3119G9E2iCS
         rbrA==
X-Gm-Message-State: AJIora8W9jnxF6ppWQbtHos60o4k/WdhO40V+viqENLGpuLBb9My4kSf
        skgKJ3JtS+UzhHBE3TPu3oivhU6PlYiXryNq
X-Google-Smtp-Source: AGRyM1veAAr7a1adVDqcvvPmIAOOyjMLNAbw584KvreyW8Tc2jdok7/vHS8qDMYumQuWNsvSlqbPBQ==
X-Received: by 2002:a17:906:7a56:b0:722:df69:3bd5 with SMTP id i22-20020a1709067a5600b00722df693bd5mr14487091ejo.581.1656372938528;
        Mon, 27 Jun 2022 16:35:38 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id q2-20020a170906a08200b006fed93bf71fsm5678097ejy.18.2022.06.27.16.35.37
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 16:35:37 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id w17so15147652wrg.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 16:35:37 -0700 (PDT)
X-Received: by 2002:a5d:4046:0:b0:21a:3a12:239e with SMTP id
 w6-20020a5d4046000000b0021a3a12239emr14666951wrp.138.1656372937188; Mon, 27
 Jun 2022 16:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220627212802.3593012-1-swboyd@chromium.org>
In-Reply-To: <20220627212802.3593012-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 27 Jun 2022 16:35:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X93M=jHU_pfBLB=EnSLgYuv3kHBvZgo9RFRtaOfeRLzA@mail.gmail.com>
Message-ID: <CAD=FV=X93M=jHU_pfBLB=EnSLgYuv3kHBvZgo9RFRtaOfeRLzA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180-trogdor: Split out keyboard
 node and describe detachables
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>, patches@lists.linux.dev,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jun 27, 2022 at 2:28 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Trogdor devices that have a detachable keyboard still have a
> non-detachable keyboard input device present because we include the
> cros-ec-keyboard.dtsi snippet in the top-level sc7180-trogdor.dtsi file
> that every variant board includes. We do this because the
> keyboard-controller node also provides some buttons like the power
> button and volume buttons. Unfortunately, this means we register a
> keyboard input device that doesn't do anything on boards with a
> detachable keyboard.
>
> Change the node's compatible on detachables to the newly introduced
> "google,cros-ec-keyb-switches" compatible to indicate that there are
> only switches and no keyboard to register. Similarly, move the keyboard
> include that defines the keyboard-controller node out of
> sc7180-trogdor.dtsi to boards that actually have a keyboard so that the
> matrix properties are not defined on boards with the switches
> compatible. Future boards can either use the include approach or the
> node definition approach to describe a keyboard with possible switches
> or just some switches.
>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Hsin-Yi Wang <hsinyi@chromium.org>
> Cc: "Joseph S. Barrera III" <joebar@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Changes from v1 (https://lore.kernel.org/r/20220518172525.3319993-1-swboyd@chromium.org):
>  * Rebased onto Joe's series applied on top of qcom's arm64-fixes-for-4.19
>  * Updated more dtsi files
>
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi        | 4 ++++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi      | 6 ++++++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-kingoftown.dtsi    | 2 +-
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi         | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-mrbland.dtsi       | 6 ++++++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi       | 1 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi        | 2 ++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi | 6 ++++++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dts             | 2 ++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi   | 4 ++++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi               | 1 -
>  11 files changed, 33 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
