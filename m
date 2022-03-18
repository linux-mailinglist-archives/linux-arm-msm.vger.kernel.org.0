Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC6714DDFBE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Mar 2022 18:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239570AbiCRRW1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Mar 2022 13:22:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239567AbiCRRW1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Mar 2022 13:22:27 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7134A2DF3F2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 10:21:08 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id b15so11045622edn.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 10:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PCoJVU7mrdRYYKIeNxpHu40jIUtYCc2ytq8sJtJQeGU=;
        b=G/3LRJiL3DqJDP4WBNy8s7yyrZw6nESOCNsC2Nwpxwkyj67SgiTW1sew1I9mDZ9rmq
         5LXuoS1QxtJ748Oyjmt7XCguWrg/XLVqNtIkCzWgSXsqWI6/amBXVbX/UMrghLTYUU7X
         trR4fIkpdHtHmSusLVFyY7k9PVKpBF1ayFw4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PCoJVU7mrdRYYKIeNxpHu40jIUtYCc2ytq8sJtJQeGU=;
        b=k5UiYyymcyCq1ltlmw1BjTlDo0gz6HC9GKXR4v/g1TMZN6G6/SzB3Nlo4vUdWteXDp
         JVwQVlETJqH2TYlzPRwSjxh7zukKVk6/RF9Hjfv/Y0sDmGE4UZH/QdTxyzvR2x8Tp24W
         l03sM4Y0vX71nST27REGogWsFyxucdMwSwiV9ByWImbsdwnQCcyAd5pnKKki0OT6oKVw
         SMoDLh+vVTd+OPEgC6bb9wghmEht5nwSpvRpfyNkNaewzUUuRztBzPxWDeomY9u9dX7+
         mo9vrSQwnQG6Cd6H1JiFJac/59ENA7luls8/OgtA+QKuYsWW67IlR08dZCDa1tsJc5fg
         FcQw==
X-Gm-Message-State: AOAM530atnaUCxJZAizwVIBYZBJMFAhMH5KPsLCbLzsMSESVPboiShxS
        /PZkJRIJtzZ2hwK8ziJFgrfrnrgGzDy5mmmjqIU=
X-Google-Smtp-Source: ABdhPJyKH33RlESh+sjB3BOLLc9ZCr0Qg2KtVpxw1FBU54ICkyF3xqZAfMGWDYU57zMBpymCKM3ITA==
X-Received: by 2002:a50:ec0c:0:b0:418:f415:6bfe with SMTP id g12-20020a50ec0c000000b00418f4156bfemr10468736edr.15.1647624066695;
        Fri, 18 Mar 2022 10:21:06 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id hq15-20020a1709073f0f00b006dfc0fe42b1sm761746ejc.177.2022.03.18.10.21.05
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 10:21:05 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id q8so1243350wrc.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 10:21:05 -0700 (PDT)
X-Received: by 2002:adf:fc47:0:b0:203:dda1:4311 with SMTP id
 e7-20020adffc47000000b00203dda14311mr9062480wrs.301.1647624064675; Fri, 18
 Mar 2022 10:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com> <1647452154-16361-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1647452154-16361-3-git-send-email-quic_sbillaka@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 18 Mar 2022 10:20:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XM1njMY63SCC3yNoA9Uvu+_3xLGkC5OWoLjR-0KnmhWg@mail.gmail.com>
Message-ID: <CAD=FV=XM1njMY63SCC3yNoA9Uvu+_3xLGkC5OWoLjR-0KnmhWg@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, krzk+dt@kernel.org,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Mar 16, 2022 at 10:36 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Enable support for eDP interface via aux_bus on CRD platform.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>
> Changes in v5:
>   - Change the order of patches
>   - Remove the backlight nodes
>   - Remove the bias setting
>   - Fix compilation issue
>   - Model VREG_EDP_BP for backlight power
>
> Changes in v4:
>   - Create new patch for name changes
>   - Remove output-low
>
> Changes in v3:
>   - Sort the nodes alphabetically
>   - Use - instead of _ as node names
>   - Place the backlight and panel nodes under root
>   - Change the name of edp_out to mdss_edp_out
>   - Change the names of regulator nodes
>   - Delete unused properties in the board file
>
>
> Changes in v2:
>   - Sort node references alphabetically
>   - Improve readability
>   - Move the pwm pinctrl to pwm node
>   - Move the regulators to root
>   - Define backlight power
>   - Remove dummy regulator node
>   - Cleanup pinctrl definitions
>
>  arch/arm64/boot/dts/qcom/sc7280-crd.dts | 93 +++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)

At a high level, I'd expect your patch to be based upon Matthias's
series, AKA the 4 patches from:

https://lore.kernel.org/r/20220316172814.v1.1.I2deda8f2cd6adfbb525a97d8fee008a8477b7b0e@changeid/

I'll leave it up to you about whether you care to support eDP on the
old CRD1/2 or just on CRD3. Personally I'd think CRD3 would be enough.

Then, I'd expect your patch to mostly incorporate
<https://crrev.com/c/3379844>, though that patch was written before
aux-bus support so the panel would need to go in a different place.

Stephen already gave some comments and basing on Matthias's patches
will be a pretty big change, so I probably won't comment lots more.


> +&mdss_edp {
> +       status = "okay";
> +
> +       data-lanes = <0 1 2 3>;
> +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> +       vdda-0p9-supply = <&vreg_l10c_0p8>;
> +
> +       aux-bus {
> +               edp_panel: edp-panel {

As Stephen pointed out, it should be called "panel".
