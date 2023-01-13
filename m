Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93D0766A4D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 22:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjAMVMC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 16:12:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjAMVMB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 16:12:01 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B20479FE
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 13:11:58 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id 20so4816322ybl.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 13:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nwi1WKddhAW8sPy/ujwfpc17G/Uaa3ESBQr8HYWaLxw=;
        b=ExxIeFvd2GIeHxK1e+u7KroQtACr/sH8/Ejm/zvlmXV5RBmEQVVZQCPlClFKUg+Y/Z
         Zu3o8WoEMu4BezFPqGnlQee8qPTqHyb/Dcj+xVOZfPj19hblI7bmW+jOWbDqCDasMjWd
         xlCM1bDHQegocMk5ELWQxR9whwDPRTfhJ98FzgZpUw+w9gY6cy7y0SKyyu3lNDOjzfbo
         h08KT8Qr8L7kgMW/RsyycO3QVrxrYu2BzJ+jpPjUf6P93rF1prGzohzz3uvWo0jByz+z
         7T8OW/7o2lbGmpcMdVyFEsgfkf5ztFQWM+rQy+1zEnzLa26wp6G4RE/6eJKBdDLkhqG2
         Q/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nwi1WKddhAW8sPy/ujwfpc17G/Uaa3ESBQr8HYWaLxw=;
        b=JWP7n4O1Ow7vcPQUUXTsYn46oJG97y6WraXUdneNw2N/vLNth/awHOW89ugDWpAEJh
         vhHR29XBzo0/avgQGafmWBno6ppb/JLMUd6b61+eq4A5LXlbmXmfcVrs5vV2IYYPSw8Y
         /luQOucl0AAukhoCfF2nlcMvr60I0sObq/WQvePqMcET+5e5zri4YI6tZYQ5HX/lFe7/
         WFUtF0uPGox78Evzx0tT0KGfZ3IQNt4huJ8bfQOishOdgpRxJLvuhg5cMx3UEGk2RwQ4
         J39vnPUkFd/WFnYEUAv8i7kHvYBigiMNXKWEdspuI9A1axo3Whs1/hGwZcRUyhNd/tQ6
         8TOQ==
X-Gm-Message-State: AFqh2kqG+Zf1+KCrcQivBHqOMCWBA9xq0snQMK0HMdWlzOBzqwPYptps
        y4XQTPCnmU/U3Zx0MH2572rFAKC9r6tHMXRzXy/0gQ==
X-Google-Smtp-Source: AMrXdXvcqjA0Ri5PB+/+im8+2opI/8QMNUqxjMQxunAmz1hTImGN3pCiltxTaFVZMZwXeDlQ8av4C7+HLdLGbnDwgn8=
X-Received: by 2002:a25:cc7:0:b0:6e0:c7d3:f026 with SMTP id
 190-20020a250cc7000000b006e0c7d3f026mr8961122ybm.275.1673644318081; Fri, 13
 Jan 2023 13:11:58 -0800 (PST)
MIME-Version: 1.0
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-2-dmitry.baryshkov@linaro.org> <167362343145.2212490.16180994187587985655.robh@kernel.org>
In-Reply-To: <167362343145.2212490.16180994187587985655.robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 13 Jan 2023 23:11:47 +0200
Message-ID: <CAA8EJppdA_LZsbF9zbcF=bf-HqOyM=xSNoOX-_7ZA1w5WWExLA@mail.gmail.com>
Subject: Re: [PATCH v6 01/11] dt-bindings: display/msm: convert MDP5 schema to
 YAML format
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 13 Jan 2023 at 17:26, Rob Herring <robh@kernel.org> wrote:
>
>
> On Fri, 13 Jan 2023 10:37:10 +0200, Dmitry Baryshkov wrote:
> > Convert the mdp5.txt into the yaml format. Changes to the existing (txt) schema:
> >  - MSM8996 has additional "iommu" clock, define it separately
> >  - Add new properties used on some of platforms:
> >    - interconnects, interconnect-names
> >    - iommus
> >    - power-domains
> >    - operating-points-v2, opp-table
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/display/msm/mdp5.txt  | 132 -----------------
> >  .../bindings/display/msm/qcom,mdp5.yaml       | 138 ++++++++++++++++++
> >  2 files changed, 138 insertions(+), 132 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> >
>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>
> Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230113083720.39224-2-dmitry.baryshkov@linaro.org
>
>
> mdp@1a01000: compatible:0: 'qcom,mdp5' was expected
>         arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb
>
> mdp@1a01000: compatible: ['qcom,msm8953-mdp5', 'qcom,mdp5'] is too long
>         arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb

This is because we ended up in the middle of the conversion. msm8953
ended up using a new style of bindings, while the rest used old ones.
This is fixed by the patch 02 (which adds SoC-specific compatibles to
the schema) and patches 6 and 7 that convert the rest of DT.
--
With best wishes
Dmitry
