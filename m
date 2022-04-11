Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC4194FC68E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 23:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350157AbiDKVSH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 17:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237359AbiDKVSG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 17:18:06 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1721B7B8
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 14:15:51 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id g18so8500691ejc.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 14:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u3IPKba47VHgKeeSAVtwOFmES8+Ru1c827vSgPVijTU=;
        b=EOnIBkqU4gAnFTiOCLuuFJuYrgMFSYtiBJzSaGkZhWnqDoH7SY2EVy1Wolr2JY+s1/
         GyAySIrorqGQ2K1QrPWNJOesbKQvhPoaTxKwZNEl5RzrcglL3fjjESgXCExNPX/fI2Ue
         qiSGZ4q5xIUeoA3H9DI8cr5VuAKNL1LKU4xDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u3IPKba47VHgKeeSAVtwOFmES8+Ru1c827vSgPVijTU=;
        b=WdRDzYKSntQ0QrTBIvUcWHbwQ6vbtoXC7eQtV0Pt2D1udnr16pVNa1de9IO8SFNowZ
         fisCykLKzfjn8C4Onxn0SfJtAGgZoMFwTbHvD1qsmBm8sjkrMFnAkAOJ1zYNpxoNVt1i
         dCQTgnwFyCYxjk6UAvVLi4nKLPkZkk1Vravo1De72z6zW7cR3GTZUuLhyEkyFkAtSqZ4
         rNpRm5sP6kCh9TN8edc/nOvzY5JWZ/Nv6xt+FmmXJKbm/cZw57GE5elZ0igStd7j1gf3
         BqxoCwoRoRj5wEoihvYC9sHEjErYNnh83967YrVMElQ7R6zA8dbDhrPNubPQIpVZ+bPa
         3AoA==
X-Gm-Message-State: AOAM530nUEoWdoAnhygqJXTaa+9po6JnVXbQytqvH8fCbl7GpHgCuSkB
        Nb1opRz5oYRl5HwFFVRJksw/L//bpYJZZsAa
X-Google-Smtp-Source: ABdhPJxFK3LJC324BGC3wjcVVZLbarbRPnT0xDL6dT10iYjMrB/0jfLy3/tohZpG500RNOxsuz21Ig==
X-Received: by 2002:a17:907:1623:b0:6df:c9da:a6a8 with SMTP id hb35-20020a170907162300b006dfc9daa6a8mr31003033ejc.303.1649711750143;
        Mon, 11 Apr 2022 14:15:50 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id x1-20020a1709060ee100b006e8a49f215dsm696771eji.73.2022.04.11.14.15.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 14:15:49 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id ay36-20020a05600c1e2400b0038ebc885115so364948wmb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 14:15:48 -0700 (PDT)
X-Received: by 2002:a05:600c:3ca4:b0:38e:54d0:406d with SMTP id
 bg36-20020a05600c3ca400b0038e54d0406dmr922556wmb.199.1649711748286; Mon, 11
 Apr 2022 14:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220411141332.v2.1.I9f06fec63b978699fe62591fec9e5ac31bb3a69d@changeid>
In-Reply-To: <20220411141332.v2.1.I9f06fec63b978699fe62591fec9e5ac31bb3a69d@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 11 Apr 2022 14:15:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X8sWD0ktzFLou1m4RSoutj7N22hjCjFVS2xqB_Lnb8KQ@mail.gmail.com>
Message-ID: <CAD=FV=X8sWD0ktzFLou1m4RSoutj7N22hjCjFVS2xqB_Lnb8KQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280-herobrine: Audio codec wants
 1.8V, not 1.62V
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Apr 11, 2022 at 2:14 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The L2C rail on herobrine boards is intended to go to the audio
> codec. Let's override the 1.62V specified in the qcard.dtsi file to be
> 1.8V.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v2:
> - Adjust Qcard regulator override section heading
>
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)

...and I somehow forgot to add in from v1:

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
