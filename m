Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68FE85175A1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 19:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386618AbiEBRVW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 13:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386609AbiEBRVQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 13:21:16 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F793B1CC
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 10:17:46 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id z19so17323025edx.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 10:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gMqBgTrhfUKKEl/G5V1eWPOJxywdk0FK8Tb1dsdlXpM=;
        b=Fc3vRfuW5NtMW7EI2ZBMV+YnIKqAMpApdt4JOF20Q5AAQ6HDr4LiYSVM0xZoUyNqn+
         OgeNUG46t2hjmY46svxZFz3QtaSSArm1HTAVYQil+AjrxmYeEUh7vEQwXgLEnVl5aq6t
         ZtoZ8IKY/USy5HQHZcyaOmwqGjHrFecdY3cNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gMqBgTrhfUKKEl/G5V1eWPOJxywdk0FK8Tb1dsdlXpM=;
        b=FBweENzPobE9O657gBqUs+VcL8LVFFs/Nz9KJv1V6Y9feF+N4wB+YfeCeVzR/ZQ6BE
         NryWtQAbHY1AHMlavuwrAgLUbGowprc61JriDF9IpA2Y2EEd4ADVkQob0LrI4MYxnPcg
         gGRtGTMHuuxfN1Li+epF8lGac5TR7VMekg63gtHhi60S0BI10/EEIWDk9UBy4M+2WnMK
         /hRTszR13MWQvJbSx/wLTMxE5oUujpAO9+tIgPnDaF8udxpMvG3J5iIwIr9OyBtZE3/z
         v2SQRw1qB8B+hXcNyOznYCauwOdT0Zv65tSXYYwI6xORXGE3BhVJQwK8LH+yGmebj5Tt
         d+wg==
X-Gm-Message-State: AOAM530Tp4Nda5AW7AEuGGasQzvoeiPI+iiIiPoTmAm+8gwUD1T1fQwo
        vyc/lrpIyxQUHG20/M0Qf5XpF4XIur5RVrBM
X-Google-Smtp-Source: ABdhPJzasxt23MZeobVE0QppuO6Q8JcsZeMzA+zzmBVDPEvqM86gf8TIqoW5EExb45TtwPnR4qn18A==
X-Received: by 2002:aa7:cd7c:0:b0:425:e59d:7353 with SMTP id ca28-20020aa7cd7c000000b00425e59d7353mr14087232edb.365.1651511864708;
        Mon, 02 May 2022 10:17:44 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id el8-20020a170907284800b006f3ef214e12sm3794097ejc.120.2022.05.02.10.17.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 10:17:44 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id t6so20394594wra.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 10:17:43 -0700 (PDT)
X-Received: by 2002:a5d:42c8:0:b0:20a:d91f:87b5 with SMTP id
 t8-20020a5d42c8000000b0020ad91f87b5mr10141812wrr.301.1651511863286; Mon, 02
 May 2022 10:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220430011402.1.If7c3471db53bea55213f7bcf17e9043084d3ac0c@changeid>
 <20220430011402.3.Ic20d0c002ac5406b880cbdf9824739f38740926c@changeid>
In-Reply-To: <20220430011402.3.Ic20d0c002ac5406b880cbdf9824739f38740926c@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 2 May 2022 10:17:31 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UKSsOoer-9sUMP4AYF=A0L2Wg+cZ40Q_22m=GZjoUzuw@mail.gmail.com>
Message-ID: <CAD=FV=UKSsOoer-9sUMP4AYF=A0L2Wg+cZ40Q_22m=GZjoUzuw@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sc7180: Add quackingstick dts files
To:     "Joseph S. Barrera III" <joebar@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Apr 30, 2022 at 1:18 AM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> Quackingstick is a trogdor-based board. These dts files are copies from
> the downstream Chrome OS 5.4 kernel, but with downstream bits removed.
>
> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  .../sc7180-trogdor-quackingstick-r0-lte.dts   |  38 ++
>  .../qcom/sc7180-trogdor-quackingstick-r0.dts  |  26 ++
>  .../qcom/sc7180-trogdor-quackingstick.dtsi    | 324 ++++++++++++++++++
>  4 files changed, 390 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
