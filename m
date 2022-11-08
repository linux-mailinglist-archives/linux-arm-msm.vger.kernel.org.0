Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A65D6219DE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 17:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234163AbiKHQ4G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 11:56:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233904AbiKHQ4F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 11:56:05 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A10E72314A
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 08:56:04 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id r3so18078028yba.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 08:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TN8l2lGtVmcCUipWgzLJOYNCDLR8IIsOAYeFjH7zJ1w=;
        b=g5OU3wWOpPPOiIkbca2HE3EGr3zNuD22/5cVb58DoDhivuCuM0q7rGOcbDSVt6mbM7
         puJ6zoUGLHjZ/1y6uiMnCnkawiLa+M5N9DdXrQ4fzYvPxIjFicmtVpQ8iKuahX6iPh0i
         X33uSN0n5zZzyPl0GscyTiXlC/PF+u4fiNCN8nZFt1t5CQBCzfLjrBf1UE1UaRSAWmsU
         /H/vai7wpg8sZXUHAjh6JncNyIQ3i9u3PIH5a4SM67tfTLu4wIulHKdk3lJ+poqtCJRJ
         eKxusToqrCDwwsWxNYuMzuHTDss2yuC8kvBnCyb0uZnmj2tZGUMLRFR75V/P53l4/ANS
         /5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TN8l2lGtVmcCUipWgzLJOYNCDLR8IIsOAYeFjH7zJ1w=;
        b=nFaZUtvogdKCrsecBkzVFvx5TFDG2ue9CYKkBLUDsI2l2AiIqPERywuay8QtrlUIMg
         jx+UNXvktDv057mPz+24kZTQ0Z52YUUVYqQQ500w4vRNCEC19FLi0O67jQUtITeEFbRR
         2SvtnAnSt+4OU7uK1Nc4i5XVMrDUkrBPHuLDrG/FlLxilMAsS44t0imRcG8PZ2PTe3pk
         RsR1akvEpz+PFhZGRWbDjjlxMDclYxP7uasVOkw2V4nuLAgSfGsEQR5jvIkpb8lCLw7A
         vt+vNjJyE4KvW/3VlwjvKPVqIz7g8X895nELG6gqQtz1F+NHaHLuPIS7YNvl4tVka+Dy
         SQ3A==
X-Gm-Message-State: ACrzQf29GWAm2R56IqDOMNCEeP63MFUgOBHBKDt4DSuwrtPi//RytLYg
        iX7Pm4sJbdOIkZPjZUo+DaDkenOnx2dRZBTNegsK8g==
X-Google-Smtp-Source: AMsMyM56aNnx3FqXLL0Tf26b1gUZQslz7y1AQLBr6u3w0T002wSBE6l9w1Rkr4MeMdq0L5BOCNqcXfrK/a4ieFP1Q3M=
X-Received: by 2002:a25:ba45:0:b0:67a:6298:7bac with SMTP id
 z5-20020a25ba45000000b0067a62987bacmr60069197ybj.194.1667926563854; Tue, 08
 Nov 2022 08:56:03 -0800 (PST)
MIME-Version: 1.0
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-4-bryan.odonoghue@linaro.org> <ceffec42-f9af-6bde-8db1-076f0cc2a34f@linaro.org>
 <a8c36604-5f52-0be9-29d7-f64811541c97@linaro.org>
In-Reply-To: <a8c36604-5f52-0be9-29d7-f64811541c97@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 8 Nov 2022 19:55:52 +0300
Message-ID: <CAA8EJpoepOn4ScZT6V7a1T73pWdQKsxUzVKA5KsBy9SFfNVBKQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] dt-bindings: msm: dsi-controller-main: Add vdd*
 descriptions back in
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 8 Nov 2022 at 17:42, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 08/11/2022 12:59, Dmitry Baryshkov wrote:
> >>
> >> Warnings about missing regulators can be resolved by updating the
> >> relevant
> >> dtsi files to point to fixed always-on regulators where appropriate.
> >
> > Ugh. Are they missing or are they optional/not used on these platforms?
>
> Some platforms either don't implement them or worse possibly do
> implement but don't model them when they should.
>
> > Can you possibly list all regulator warnings?
>
>
> Downstream we have
>
> arch/arm/boot/dts/qcom/msm8916-mdss.dtsi
>
> mdss_dsi0: qcom,mdss_dsi@1a98000 {
>         vdda-supply = <&pm8916_l2>;
>         vdd-supply = <&pm8916_l17>;
>         vddio-supply = <&pm8916_l6>;
> };
>
> Looking at something like
>
> arch/arm/boot/dts/qcom/msm8916-mtp.dtsi which references
> arch/arm/boot/dts/qcom/dsi-panel-jdi-1080p-video.dtsi it doesn't appear
> to delete andy of the vdd*-supply references

Good example. We have vdda-supply and vddio-supply in
msm8916-pm8916.dtsi (correct).
And the mentioned vdd-supply is not applicable to this platform. It
powers up the external DSI-to-HDMI bridge. I'd assume that the same
regulator was destined to power up the panel.

So, I'd suggest defining all supplies at the top level and then
pushing all the required: parts into the per-SoC entries.

-- 
With best wishes
Dmitry
