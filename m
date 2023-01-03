Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FAD465BD18
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 10:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237207AbjACJYe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 04:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237213AbjACJYb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 04:24:31 -0500
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBA86E0A4
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 01:24:30 -0800 (PST)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-15027746720so21101255fac.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 01:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mzcK4BlDrehna2Cf5WyLld2E+p/c7PCOy1ZvlyaJP1k=;
        b=bR1gztSKPi5u6/qmjSq8JJxxv3wfyJmMLpirn/KjmYibxhjZo7U5fODxttptFG4MZ4
         0IXObSQFL1xNHqEy9yAzbxhEb+FU5HZHEK34C6Ofn5xjvKJTxUVdiTMnzTXI5lLY6jmn
         uqPKflfmFLiTiOLvpmlbSeXcHUMzp4BHwLzZ+gx+mL/n09kl/h3U90Lxgu9xZyERDy+X
         pN+aGzLOCuL5GZJI2FeIyy8y1r7QTz61jIjmrPeSChzLCOCVEiunaEiVXRndm9YbAak0
         tpw42Yi+0S4wXmyg/of7mbrSehHDNbYtLyhTXH05Yrk8uYo3xyuziGAMU9T+Hc9Ke44Z
         F8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzcK4BlDrehna2Cf5WyLld2E+p/c7PCOy1ZvlyaJP1k=;
        b=e4WRoVLmIOtt5FZwLKkDaku0aQUta9gJ+nx5uKMaO0tkjxS6TZmKCPoCduUklvhsj+
         mD8nBMRrscvBqQDz1qdaH0l9N8XJG2Jln3rxPsu+nj+lT6SGAtwe4v1s1cPsq3kN4LQP
         KqvZc/Eu67uxcmhcTGzjDbKlgq5GYPSU9g3dpTpEXGumrVzgxQWhkHeYxziLitNGHve1
         N8cIeR0UqA3aY7/m4tUJGKjLp7/gT9yf9z8biIhAA6rpdHkhn9YR2+jzITYZHnA13ICB
         ewzg5qi3sF/ip6fFdo9xaAzlrGvwQKcBpOHgcJSS3ZxkuHoCtt8io5MPifa7YbfgG4oY
         Vydw==
X-Gm-Message-State: AFqh2kroy4RYk98TMupbUgxw5xPpeSSXWPKcYCtpSs/timx0BasOkKJ/
        2yMppx1bzFecXus4rVAQ4KJrZhI2c/pSBZudHSV3vg==
X-Google-Smtp-Source: AMrXdXu7+GEt205lhs8PRbBO9C5QHjATHLZxARTl42LbFtqkt0s4GGajjKBhO17x3s7QodHXVkcp8SHp01rNiJX+xZo=
X-Received: by 2002:a05:6870:fb90:b0:150:22dd:1f54 with SMTP id
 kv16-20020a056870fb9000b0015022dd1f54mr1713164oab.155.1672737870170; Tue, 03
 Jan 2023 01:24:30 -0800 (PST)
MIME-Version: 1.0
References: <20221230153554.105856-1-robert.foss@linaro.org>
 <20221230153554.105856-9-robert.foss@linaro.org> <deb17787-1a5a-89a3-3ecf-7690b4149f5c@linaro.org>
 <CAG3jFysU84LRcqQOspub+9vtsP3syiksrGX6D7i3ff+X6+mbTA@mail.gmail.com> <b8a0d9c5-eb26-c41c-1190-2628977bc582@linaro.org>
In-Reply-To: <b8a0d9c5-eb26-c41c-1190-2628977bc582@linaro.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Tue, 3 Jan 2023 10:24:19 +0100
Message-ID: <CAG3jFyuUV79nyjnqNysDKQSyYb4HUSWu-BvxG6LAz1Uavmvkbg@mail.gmail.com>
Subject: Re: [PATCH v4 08/11] arm64: dts: qcom: sm8350: Use 2 interconnect cells
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        quic_jesszhan@quicinc.com,
        angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
        vkoul@kernel.org, a39.skl@gmail.com, quic_khsieh@quicinc.com,
        quic_vpolimer@quicinc.com, swboyd@chromium.org,
        dianders@chromium.org, liushixin2@huawei.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
        vinod.koul@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 3 Jan 2023 at 08:59, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 02/01/2023 18:10, Robert Foss wrote:
> > On Fri, 30 Dec 2022 at 17:12, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 30/12/2022 16:35, Robert Foss wrote:
> >>> Use two interconnect cells in order to optionally
> >>> support a path tag.
> >>>
> >>> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> >>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 28 ++++++++++++++--------------
> >>>  1 file changed, 14 insertions(+), 14 deletions(-)
> >>>
> >>
> >> I think you need to rebase to include:
> >> https://lore.kernel.org/all/167233461761.1099840.5517525898039031248.b4-ty@kernel.org/
> >
> > Ah, I see. Functionally I seemed to do fine without those commits.
> >
> >>
> >> On which tree/revision did you base this?
> >
> > msm/drm-msm-display-for-6.2
>
> Then it is not a proper base for DTS changes - you will miss quite some
> commits. The DTS patches should be based on Bjorn's SoC tree or
> linux-next (although the latter sometimes can lead to conflicts).

Alright, then in that case this series needs to be split into 3 parts.

The dts fixes, remaining dts changes & the remainder of code.

Is this what you'd like to see?

>
>
> Best regards,
> Krzysztof
>
