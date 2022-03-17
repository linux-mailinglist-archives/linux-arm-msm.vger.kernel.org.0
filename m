Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D70E4DCC10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Mar 2022 18:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236776AbiCQRKM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Mar 2022 13:10:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236767AbiCQRKL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Mar 2022 13:10:11 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD01C6EC3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 10:08:52 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id qx21so12031023ejb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 10:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=29J3WNDJWG+0dPTcDT5HM1sZZoS3aj5OjFfUpwYnn9I=;
        b=lHIWpPHfEecJ2nKBKKKowWuaUA/jOW0RqB/VtVUwveFqAJLISEhF8orq4qPkY9ZDGd
         dLu7MaZd6loBSNr8djqu0QERIhHvgQMsc2K1zr9G3/otkVzGqJKqnf5/9Ttol7fY5b3z
         aO5tEe1TaUYT+uQSICj7yrn89uyGgps0qb+v8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=29J3WNDJWG+0dPTcDT5HM1sZZoS3aj5OjFfUpwYnn9I=;
        b=hmbOpMzZzzAI8yB/h1nKhUKg/Bwtwt93NFl2o3bCSRiFoksjMed32A95Dy8OHNl2X+
         mpne9bvNqe6d7H/k7wxqSP8ltdHCQUb3K2HTFCVyQ+2kxO9b3uWnxxhWtIc1vyGaKWkD
         IjYVQCHnwYPrO408msH1OQgq1r3tw8dqU8rbYk3UrNkPf5LGrVqcJixHhLoocyrHppgo
         uWOyaGsN1e6jxrH2agbWZgVZvJRIR3J2qn8mi+CsQLuLFQvJEWDJYEkl/NR+Fr5ZrQPi
         oI790IZSKEvwh3+IC/Ee27LMt3Jwq1+ElWXWeJkYFTnld7WNaEEhGZsiPDSWtTPw8Hxk
         dRdg==
X-Gm-Message-State: AOAM533aOfTG3FX8lc1vXs+tWFF2f59CPfhbWhyHdQQ20FXZHvPyOhPm
        FXn6ZNtFJkvE3masoZhb1jwE6TT0GIyvidms
X-Google-Smtp-Source: ABdhPJwPTp7T7gc884jnFcvDpR1PQSj5YqFgI633sZGPAcW1aowyFz2r+YmI0QjVu9R6sEdhWvwvBA==
X-Received: by 2002:a17:907:3f13:b0:6db:cf49:8871 with SMTP id hq19-20020a1709073f1300b006dbcf498871mr5361375ejc.766.1647536925480;
        Thu, 17 Mar 2022 10:08:45 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id w6-20020a170906d20600b006ca00cb99e0sm2678689ejz.34.2022.03.17.10.08.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 10:08:44 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id r6so8273686wrr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 10:08:43 -0700 (PDT)
X-Received: by 2002:a5d:6f04:0:b0:203:ed96:8212 with SMTP id
 ay4-20020a5d6f04000000b00203ed968212mr2550648wrb.679.1647536922913; Thu, 17
 Mar 2022 10:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220316172814.v1.1.I2deda8f2cd6adfbb525a97d8fee008a8477b7b0e@changeid>
 <20220316172814.v1.2.Ib0fbb7e5218201c81a2d064ff13c9bc1b0863212@changeid>
In-Reply-To: <20220316172814.v1.2.Ib0fbb7e5218201c81a2d064ff13c9bc1b0863212@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 17 Mar 2022 10:08:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XxuQkWNkCRhFRDQ_7cuyCu0tf5cdHaFKsi3a7L8XNtgA@mail.gmail.com>
Message-ID: <CAD=FV=XxuQkWNkCRhFRDQ_7cuyCu0tf5cdHaFKsi3a7L8XNtgA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sc7280: Add 'piglin' to the
 crd-r3 compatible strings
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
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

On Wed, Mar 16, 2022 at 5:28 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> With newer bootloader versions the crd-r3 (aka CRD 1.0 and 2.0) is
> identified as a 'piglin' board (like the IDP2 board), instead of 'hoglin'
> Add the compatible strings 'google,piglin-rev{3,4}'. The hoglin entries
> are kept to make sure the board keeps booting with older bootloader
> versions.
>
> The compatible string 'google,piglin' (without revision information) is
> still used by the IDP2 board, which is not expected to evolve further.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7280-crd-r3.dts | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
