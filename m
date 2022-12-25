Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCE4655DF2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Dec 2022 18:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbiLYRHH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Dec 2022 12:07:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbiLYRHB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Dec 2022 12:07:01 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B9F25FB
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 09:06:56 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id tz12so22265179ejc.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 09:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vyDyfKRe4UciHLbWhp5EP/ZhHAR/iZg7adKyYym7xzY=;
        b=N4QcCUEG2b8wZOSRUGbQHEasDbDcOxPvvwT8t3U8oYzVSvInG5+110rCSiI9rP/ReG
         hCdVnmCzCISjX40Dt3IiLQ7cRo2jWEdwpI5zUkfMxXPmsK3yWtTGojAF9OImQxOe7f+a
         NQNWSOZ22Z4ezO3hYUp+lM4aHTNLl+G91YwKy7SwywuO/O6EJ9lAmhfOGEa0Mthe63vS
         ekXqsr9VDEbnsDwEOxLhI0J83jdSBBJ6aXSpZEc63q2IoiJZ8Jf8chO30iAM6Fb87dsJ
         jPYTjRSl+S63jqn3fdPO48Zvxy78A/seAKYzsFV+XAfqKEpY+W3Lm1GkrZ2Tk5eYI+MM
         kCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vyDyfKRe4UciHLbWhp5EP/ZhHAR/iZg7adKyYym7xzY=;
        b=ezPFvUk6BXTwKqyY+ZuRUsJBgYsGIGBiQRWINe+DU1PleqkqFieOPAz+UI+MxS+Tm8
         dZg6DmbwXN/4usaKWfg3sYYKstKITy7vFFl6cvDtQSqnDnz0gN4Qa+KvzXHbuS3Muc28
         kSoI1gr8iUPMePwXp5bHqqua18s3Ip17MhEJOJ8fdbKmUkjBrmLK9hgm62jJoQWoMAIg
         AN/O+SDKUx+mCndxjTDX5ctX1C+o1O2+qlEZQ13b6Y9+J3e46T47J2SSZ1FcMU31vXLe
         tjCtgJgvlxfGPHfPZHzFk4c7yWtQwaMZIkB1GGBGw+DL8sNREiRhk/J91EB7ZX9sxghU
         2IHA==
X-Gm-Message-State: AFqh2kovlbYDIJvChzRNqpz9MJlSK2xiHjDpoC5yc3dqdZEsHZIkHwab
        44NEryDDTABk/zGKKMI/92PK0hXD9s3MmRgNjX/m5A==
X-Google-Smtp-Source: AMrXdXtOvc9dlNwPaScI0wSXynsYQ7+IqTsTIyB525hizm7bv+IyI2UsppjW9+rsTRedl4krrJ/m5q6e6bEowJCO9TY=
X-Received: by 2002:a17:907:1703:b0:7c0:b569:8efd with SMTP id
 le3-20020a170907170300b007c0b5698efdmr1965453ejc.652.1671988014767; Sun, 25
 Dec 2022 09:06:54 -0800 (PST)
MIME-Version: 1.0
References: <20221225040821.8395-1-steev@kali.org> <CAA8EJpqD6pvZjXa4_cQ=02o_Ns94LAJ3n-S2Q8LjfqOySgHHfA@mail.gmail.com>
In-Reply-To: <CAA8EJpqD6pvZjXa4_cQ=02o_Ns94LAJ3n-S2Q8LjfqOySgHHfA@mail.gmail.com>
From:   Steev Klimaszewski <steev@kali.org>
Date:   Sun, 25 Dec 2022 11:06:30 -0600
Message-ID: <CAKXuJqhHF6FCe26KKoFMHnKgoV3WifveQYq5FyiGKHPbvHXPyA@mail.gmail.com>
Subject: Re: [PATCH 26/26] arm64: dts: qcom: c630: set venus firmware name
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Dec 25, 2022 at 9:22 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sun, 25 Dec 2022 at 06:08, Steev Klimaszewski <steev@kali.org> wrote:
> >
> > The Lenovo Yoga C630 can't use the generic venus firmware that is in the
> > linux-firmware repository, and needs a signed one.  This file is
> > qcvss850.mbn from the Windows partition and needs to be copied manually.
> >
> > Signed-off-by: Steev Klimaszewski <steev@kali.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > index 7e80e2950f8d..78a14f899df9 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> > @@ -801,6 +801,7 @@ &usb_2_qmpphy {
> >  };
> >
> >  &venus {
> > +       firmware-name = "qcom/venus-5.2/qcvss850.mbn";
>
> Please follow the established convention (see e.g. the x13s laptop firmware).
> It should be "qcom/sdm850/LENOVO/81JL/qcvss850.mbn" (or
> qcom/sdm845/LENOVO/....).
>
> >         status = "okay";
> >  };
> >
> > --
> > 2.35.1
> >
>
>
> --
> With best wishes
> Dmitry

Thanks for pointing that out; will make the change for v2!
