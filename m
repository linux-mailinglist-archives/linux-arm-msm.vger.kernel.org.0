Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2175695BE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 01:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbiGFXTO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 19:19:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231197AbiGFXTN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 19:19:13 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED31023160
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 16:19:12 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id q6so29513961eji.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 16:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q/Ysdr5RliGVgXwVXSg+b/L5hF2oyr6zGQqCB2KMY/0=;
        b=gUDNXgh8oYKcJZw0fUdo4BytcCdgQxI55O9Z8eNCVrgBjjaoaN+pidJLGzKrW3fAqI
         hsvgccN+NLv3W4Qd5dsHD4E/vPub65TAG6ylvI/+TfIpXY4YS8UOm1l61MtOvueWxmzh
         TU02Ugf9JLdShW2ETtxvEPvMRHEZhot0uKREE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q/Ysdr5RliGVgXwVXSg+b/L5hF2oyr6zGQqCB2KMY/0=;
        b=wVHxMWDkruZAhushrK4mqEcUM4fGIrwaWguKb0lGsaoka+Df+XDSCqID+WizednpfX
         Lvt/cP0VBpudvZi6lmKZuySYfkuqylAzqcmiulD7jsNIpDAPDSBFFJcqbaEMi81jJfqn
         RHvKSWumGXWxP1lY9cqMbhOghAKj0dUGh4MumjNw9fnJf/QZLGPFAHgx1jWPhCRkXV51
         dqAT+oMNlVqQjMpe3qyf+pskfuPHkb/xqh8aZB8LC5io2JMIUmZ5I0il3EVemPHcZumn
         9muMZ+yMn5YKUF7+VSo3RuVbc5ZQCqmy2NKJF+zbJoDshKfYoDVY6O69Fs0YZ0ZSDXEQ
         FYJQ==
X-Gm-Message-State: AJIora8MR3XCS3AKO+o4M9+Ff1cAiCjhVTPrpPM4kMjlXp5g7O2v7IiQ
        j/ZOS3q5ABXw0k1eLdWEMTPUmCO5vxuYuOUE
X-Google-Smtp-Source: AGRyM1sYezRQ6VFOdMfAslcnhgAAOrSv301BC/Jp+au6BBSInez1z8ooJCOw/BrbMvMdIkC7VfLqIg==
X-Received: by 2002:a17:906:5d0d:b0:726:be8c:804c with SMTP id g13-20020a1709065d0d00b00726be8c804cmr42726315ejt.712.1657149551608;
        Wed, 06 Jul 2022 16:19:11 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id q16-20020a056402041000b0043a9ad43b4dsm17819edv.9.2022.07.06.16.19.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 16:19:11 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id v14so24018288wra.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 16:19:11 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr38633425wrr.583.1657149550898; Wed, 06
 Jul 2022 16:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <1657135928-31195-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1657135928-31195-1-git-send-email-quic_khsieh@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 6 Jul 2022 16:18:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vx7LAXuUZjvgZZejPh7DvBinVbjNpOddFrL1xtHJMnjw@mail.gmail.com>
Message-ID: <CAD=FV=Vx7LAXuUZjvgZZejPh7DvBinVbjNpOddFrL1xtHJMnjw@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dp: make eDP panel as the first connected connector
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jul 6, 2022 at 12:32 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Some userspace presumes that the first connected connector is the main
> display, where it's supposed to display e.g. the login screen. For
> laptops, this should be the main panel.
>
> This patch call drm_helper_move_panel_connectors_to_head() after
> drm_bridge_connector_init() to make sure eDP stay at head of
> connected connector list. This fixes unexpected corruption happen
> at eDP panel if eDP is not placed at head of connected connector
> list.
>
> Changes in v2:
> -- move drm_helper_move_panel_connectors_to_head() to
>                 dpu_kms_drm_obj_init()
>
> Changes in v4:
> -- move drm_helper_move_panel_connectors_to_head() to msm_drm_init()
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>

NOTE: I tested this upstream with these two trees merged together:

msm-next: 1ff1da40d6fc Merge branches 'msm-next-lumag-core'...
qcom/for-next: d014f9463260 Merge branches 'arm64-for-5.20'...

...plus a revert to make things boot again [1]. I booted this on a
sc7280-herobrine running Chrome OS. When I do this, the original
reported glitching is fixed (yay) and I think we should land it.

...but I'm not convinced that all glitching is fixed by this. In
particular I've occasionally seen an underrun at bootup (blue color)
followed by a temporary glitch. With the above plus ${SUBJECT} patch I
also reliably see a glitch on my external (DP) display every time I
plug in. I don't see either on the downstream Chrome OS kernel,
though...

[1] https://lore.kernel.org/r/20220706144706.1.I48f35820bf3670d54940110462555c2d0a6d5eb2@changeid
