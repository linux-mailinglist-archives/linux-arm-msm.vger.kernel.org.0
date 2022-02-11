Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72F9A4B2BB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 18:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352066AbiBKRYq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Feb 2022 12:24:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352054AbiBKRYq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Feb 2022 12:24:46 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A741FC
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 09:24:44 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id h7-20020a17090a648700b001b927560c2bso8279012pjj.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Feb 2022 09:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k4sUyQ2m3qZejZGx0cYyvcgcz19XfwQKp1LqX4dw1q0=;
        b=jG/QJstkExgSQvkyKqSsRmjn0SJ7pKmQvKK4mXOB4SBTyI3f/G36j/ILZebCWFTj0n
         hU2L6kYvVqUT0mygu88SdMPGTb8gs8rNDJ6nP9d07fxZ5+7vudmwt3QSoLFt9Q7ji9tI
         lTfQ6lrnY/Pr1nQIF8wUDJfuZTxUxm049vKNlonUcubKID8dDj1GYJsauBpS35RBgfqv
         5zItp+XvuLIxOxB+VCL+3c1BwVSVg2KtVt3+5LvSJP6cOJC3elR6aEEVvNH3RrUPawEm
         WrzdGZPTvRgYkAlW3QQLz7uRo019cY5roHoSX6TCMCc0WxVkrC/5fz2UGpuiEU2gVKde
         ABgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k4sUyQ2m3qZejZGx0cYyvcgcz19XfwQKp1LqX4dw1q0=;
        b=V//UotGq9aApKZORc6qhM9qlawS5byVrBdtv/FuDQX4lwOGh5S70+VuYRhpXIkmTt2
         M5NjUk1YCjZowJSHHTNdOohVz9Hmgzuvajdn7vLafzBLJA3eUNGm9hp+D4e7zTVciAEf
         7Kk5YKJJY7Rc9x0eaGEKDoERk92/ofpeJkqPeBeLNC8AvVFDP7laPmMQHSAlZjM36ac7
         oDzoSmF8ZRfBZVUeKAa0bg+1M9ZSNHEQM//Raxl7WLGRyXDh2X6nkOVyKD9z5s8w9qrH
         LsHJ2k2URXhbdOxLP1ezeFrIA80/L72yz5S0up5v9KC5niT6btFw8E9bNim242mIKDx2
         5MpA==
X-Gm-Message-State: AOAM531EIpFHZUfpxmHjsfsVTur5GuKRQsHrabVUh9LYpNV49HMiFH8a
        VnPGNaYbpRfSWdu9DdVHgBzpDmgqY0pfShPGLVKGFxOHSoc=
X-Google-Smtp-Source: ABdhPJzv3kePNpZZUDUVLYHIWbK1s9HKTHIn6V0cUY4dwRLD5M0hYqX6iZ3jmkiqGjiHfczQLUNiGlcJwmHxVuZn0gI=
X-Received: by 2002:a17:902:b115:: with SMTP id q21mr2547799plr.6.1644600284112;
 Fri, 11 Feb 2022 09:24:44 -0800 (PST)
MIME-Version: 1.0
References: <1644338552-14426-1-git-send-email-loic.poulain@linaro.org>
 <1644338552-14426-2-git-send-email-loic.poulain@linaro.org> <1644352412.089743.2969147.nullmailer@robh.at.kernel.org>
In-Reply-To: <1644352412.089743.2969147.nullmailer@robh.at.kernel.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Fri, 11 Feb 2022 18:24:07 +0100
Message-ID: <CAMZdPi8OHy-G6z9enOH1wwWYJjSnayGrXurYmK3s3iOO-vr+xQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: msm: disp: add yaml schemas for
 QCM2290 DPU bindings
To:     Rob Herring <robh@kernel.org>
Cc:     bjorn.andersson@linaro.org, sean@poorly.run, robdclark@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, dmitry.baryshkov@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 8 Feb 2022 at 21:33, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, 08 Feb 2022 17:42:32 +0100, Loic Poulain wrote:
> > QCM2290 MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> > like DPU display controller, DSI etc. Add YAML schema for DPU device
> > tree bindings
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >  v2: no change
> >
> >  .../bindings/display/msm/dpu-qcm2290.yaml          | 214 +++++++++++++++++++++
> >  1 file changed, 214 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dts:19:18: fatal error: dt-bindings/clock/qcom,dispcc-qcm2290.h: No such file or directory
>    19 |         #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This header is part of an other series that has been merged into
qcom/linux.git (for-next):
[PATCH v5 1/2] dt-bindings: clock: Add qualcomm QCM2290 DISPCC bindings

Regards,
Loic
