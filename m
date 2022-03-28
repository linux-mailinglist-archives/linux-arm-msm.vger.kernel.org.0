Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6434E9BE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Mar 2022 18:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241078AbiC1QG4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Mar 2022 12:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239295AbiC1QGz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Mar 2022 12:06:55 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 893294DF7E
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Mar 2022 09:05:14 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id pv16so29738514ejb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Mar 2022 09:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bEu+oart4Gwr+EP+AbNQngr10mG4qqGsRv4fsyOxjhI=;
        b=avRVoC3lzpjUvhF/Wiu3VOeNZwcC6vRTuDJRyxS38ChAcvk/ia4iNFqJe2FYH2ySDV
         ko3IDhpFgBqMDdZSwvQSNsAIcXllUrKZLWqLNJwiXrc2alJT4AihdevfOShh5cy3m7qY
         eyxdBMW720R+R09G5Xr0/flys3hXmlAoSIH88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bEu+oart4Gwr+EP+AbNQngr10mG4qqGsRv4fsyOxjhI=;
        b=Q63lTSYcVm6Em4Y4sPEFDrqzIXf4qFc2BtWLqMhWbmWJ+aqE3Pp7N4UvhXlcuWkOlj
         vf41CbG1j48C16SiSRGnzvdTHb+A3wAoRvc29fAB9XWmyjiOhLpZjR/obpy2nXKrHVha
         0yfJXzeESRQd4x49E/JM68fGiEqJl3G1SsVnZ0sKJW9O/1i+kVp+/7gEg0UJmBJJzHyG
         M5Zbg0dFPu+e4HzaJHldJJgYJ9cK2YbR7dx9ewOrmxdM4xYtAXD4UQOTjoMxbyRnyT9L
         NMrlGeWdtGQKqXQ/XGMATMqQVOeKeY0W54sV2zNTtzQ8SOpVYktMUGHOVmD/DQ/2sH2O
         wgFw==
X-Gm-Message-State: AOAM532TJ6J9kMr+BMY97oV8jPidPHgcG1UfyhoPciX86TQuGf/7BjFp
        TLePE43rjDvrbZImpgktkQSb01Nft5u8sA==
X-Google-Smtp-Source: ABdhPJyK24OJz7COLyhie1M9tt73mA3ndqCbKxMpuRFRMSiwL9J6khrcb+2rz9qhnUpd3UrTeHwqUA==
X-Received: by 2002:a17:906:1153:b0:6df:d816:264a with SMTP id i19-20020a170906115300b006dfd816264amr27530748eja.546.1648483512626;
        Mon, 28 Mar 2022 09:05:12 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id da19-20020a056402177300b00413583e0996sm7003367edb.14.2022.03.28.09.05.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 09:05:10 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id d7so21083535wrb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Mar 2022 09:05:10 -0700 (PDT)
X-Received: by 2002:a5d:4491:0:b0:203:f63a:e89b with SMTP id
 j17-20020a5d4491000000b00203f63ae89bmr24455813wrq.342.1648483509935; Mon, 28
 Mar 2022 09:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220325234344.199841-1-swboyd@chromium.org> <20220325234344.199841-2-swboyd@chromium.org>
In-Reply-To: <20220325234344.199841-2-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 28 Mar 2022 09:04:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VEZ6pTuqsjWaNAeMc8_szDDZSXdmU9K3FdQpdyU0VKLw@mail.gmail.com>
Message-ID: <CAD=FV=VEZ6pTuqsjWaNAeMc8_szDDZSXdmU9K3FdQpdyU0VKLw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180-trogdor: Simplify trackpad enabling
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Joseph Barrera <joebar@google.com>
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

On Fri, Mar 25, 2022 at 4:43 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Trogdor boards with a detachable keyboard don't have a trackpad over
> i2c. Instead the trackpad is on the detachable keyboard base. Let's move
> the enabling of the trackpad i2c bus out of the base sc7180-trogdor.dtsi
> file so that each trogdor board that is detachable, of which there are
> many, doesn't have to disable the trackpad bus.
>
> Cc: Joseph Barrera <joebar@google.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi   | 4 ----
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi | 4 ----
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi    | 4 ++++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi          | 1 -
>  4 files changed, 4 insertions(+), 9 deletions(-)

What about pompom?
What about trogdor-r1?
