Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0135F5E8F4C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 20:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbiIXSXM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 14:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233961AbiIXSWn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 14:22:43 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F160A32D8A
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 11:22:32 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-3487d84e477so30495557b3.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 11:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=s2yVFEWeDENib5ZI/a0e4ge6cSf4cj8rWCXGLC8hWc8=;
        b=wxMdeFEZDUmk1q3u139fGzFutmWA3RDqZJDDpILqRY8aNRDEHhddkYzPg3AmSAmtKL
         a28v+VdYgGVulYsS+pbwPNXyWq4u7zF0P3w/4Jo2MLt0Q99QblBroXAzGYWb+cTHxXqg
         OCpHbKEzut3wEex19I/RXeUN9ZV4FqD2L33md0qJ+APWgl/qlX0dJrH9stA6F+f4ZG8t
         /5+CWuEAjpFC6q/1pn3czSH1jVuj6S4lkcMCbKnPj2PSP6gzRmPt3Fg3zyYRGmbYSx69
         xltQVHNl+GV6On0h971Iu3BqUG1ZUJh4KloHkfvQgYzjDYusKvsoJKVKUqUxizCKmIJg
         Mchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=s2yVFEWeDENib5ZI/a0e4ge6cSf4cj8rWCXGLC8hWc8=;
        b=IbCcIFMSGZ6jzO9BQSnAaVuDzuBbEjKaqQ0MPDX5Lxty4EicwWGzyV11wwFLdJgdFF
         fbM1dMFWrZOiQd5THDoSv+UrzWQvXgK7o1fVQ+y2RU3eY387njIQbiYELdrCa1aBl5+p
         iesNlfQiC2MI1IhhN+BQBq96AsTaSg2e31OFOJr9sCOnsFEib13gVQhUA6jqVaPQiZvI
         +uWOc2CJ4Sg/2zlrCI8AttYqDkyUQd1CXRxHnhV4+P0LGpjTm3lp1IDyOSxUljBHT2bl
         vThN9RGXhL2P9uW25X1CdR8pRNp1EoS31vmXTOeKD3tV+VDMVXQDGs3lYPZK5p8hwLx4
         4jcQ==
X-Gm-Message-State: ACrzQf2uwAUJO68ujjfwcysGLCWgzM4oA/NHZY3Uz6+STZ0GucVLQHuR
        kgZjDqfEmEPPLFN/fULD2NgV9AHlMXkRfD+AHlaBtQ==
X-Google-Smtp-Source: AMsMyM55C7BiVAgLyyl2DjyMdVD0pDcGpUVDvvuje9A16f1dgXZcSU4O2RBMsUKcA7MgADqVBthdJWgunYiS+vBYqbo=
X-Received: by 2002:a81:1e0d:0:b0:33b:fb67:9895 with SMTP id
 e13-20020a811e0d000000b0033bfb679895mr13952159ywe.188.1664043752195; Sat, 24
 Sep 2022 11:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-4-dmitry.baryshkov@linaro.org> <20220924172324.qdgz5dnccncadmfz@krzk-bin>
In-Reply-To: <20220924172324.qdgz5dnccncadmfz@krzk-bin>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 24 Sep 2022 21:22:21 +0300
Message-ID: <CAA8EJpoZq9zrVeSYdn4_MQ_HVQTEXR8Zmx+BWpoo1PDUS7X+5A@mail.gmail.com>
Subject: Re: [PATCH v8 03/12] dt-bindings: display/msm: add interconnects
 property to qcom,mdss-smd845
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 24 Sept 2022 at 20:23, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On Sat, 24 Sep 2022 15:36:02 +0300, Dmitry Baryshkov wrote:
> > Add interconnects required for the SDM845 MDSS device tree node. This
> > change was made in the commit c8c61c09e38b ("arm64: dts: qcom: sdm845:
> > Add interconnects property for display"), but was not reflected in the
> > schema.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/display/msm/dpu-sdm845.yaml    | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
>
> Running 'make dtbs_check' with the schema in this patch gives the
> following warnings. Consider if they are expected or the schema is
> incorrect. These may not be new warnings.
>
> Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> This will change in the future.
>
> Full log is available here: https://patchwork.ozlabs.org/patch/1681884
>
>
> mdss@ae00000: 'dsi-phy@ae94400', 'dsi-phy@ae96400', 'dsi@ae94000', 'dsi@ae96000' do not match any of the regexes: '^display-controller@[0-9a-f]+$', 'pinctrl-[0-9]+'
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dtb
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dtb
>         arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dtb
>         arch/arm64/boot/dts/qcom/sdm845-db845c.dtb
>         arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb
>         arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dtb
>         arch/arm64/boot/dts/qcom/sdm845-mtp.dtb
>         arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dtb
>         arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dtb
>         arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb
>         arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akari.dtb
>         arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dtb
>         arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-apollo.dtb
>         arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dtb
>         arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dtb
>         arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dtb
>         arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dtb

This is expected and fixed by one of the later patches.

-- 
With best wishes
Dmitry
