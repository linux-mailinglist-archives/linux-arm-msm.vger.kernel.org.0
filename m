Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBBFE5E8F53
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 20:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbiIXS1Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 14:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232550AbiIXS1Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 14:27:24 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5563A4BF
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 11:27:22 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-3321c2a8d4cso30607167b3.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 11:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=JxrzgfxApmWB8NBqb1wQvRFuNzvTICyUAKynMb46yI8=;
        b=g94fGvcEckzfyT/KF/vWdxoEhe0MKwlX+DUzNgYXklxi/UtSSVvcgPvXBkFLWZsu4U
         6GVTx4NdvHsyim/zVyJmRB27Y95Xa772Ej+njy5Dsoy6R6xpPiK7UGR+faCJSreOOrww
         gV9mz39X1ywE+O2SRGDGvJiHm+8TfoU220MT1dpUFQl0gbPAhLgOciNw7XHpqBSGFNaQ
         QHOfi7WQdCunK7YmByjVS6rksszxAQDYu0HuqAzRniHVidflSVo0NiyqVp1Jkbbxv6NC
         yfRZqdkq4pBkgCgU+tBj+2tZU/l4H0/LRMlbgN4bsdCipiFcH8SLwdp88pfCAZI2TOFG
         kyvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=JxrzgfxApmWB8NBqb1wQvRFuNzvTICyUAKynMb46yI8=;
        b=OBkQ42Hnz2sorOd5qS1Gomlg46mouLnRu9je8SKK2mi9RvnqbysNdSzoso/w0yPbSj
         5lS9OtcAXe1isEeGoiE1aFFyLvUpZWaDUtPQnyJDw2QoaCJqQkEmZ2yd9rW7i6k/hnhW
         mBysxxM45tPLbLautBv9YQufalNAp+/dOKJXLcOYwN4ZHoGt9bS2U0KPz8rJYWfruDfv
         9RRpMiGWgy1zxh7sbQ4xH7p9xHqg1MrZImkawea/3OUnYNq8magzehkVML1N6SZAzO0b
         bMKkPPqQXC+bUCnW2pYGV2i9ETYCSKGrR4mkZvvy5AjnnLTEWgSGFqLzN3l3aKSGGF3u
         5IMQ==
X-Gm-Message-State: ACrzQf32808MA8vs60fy9TzaV7E5NIBXC2jI5HAwX1gNGPBMpFJH7bqN
        quYtzgqlzK7Xg0HSsNg5l1iWv3n82/P/ytYf3kg09w==
X-Google-Smtp-Source: AMsMyM7v+tXK8lfQAiAaF9Qy6dCtG7stCIz1g+xy7jiiQaS0jaNh05vITohMH5ZizxvRVFIMPYCyl4HOeFlB13ny9ew=
X-Received: by 2002:a81:c45:0:b0:34d:21de:b794 with SMTP id
 66-20020a810c45000000b0034d21deb794mr14850122ywm.138.1664044041621; Sat, 24
 Sep 2022 11:27:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-2-dmitry.baryshkov@linaro.org> <20220924172339.bebekrawee4ubogv@krzk-bin>
In-Reply-To: <20220924172339.bebekrawee4ubogv@krzk-bin>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 24 Sep 2022 21:27:10 +0300
Message-ID: <CAA8EJpqD74ZWvFK-QQ+MUHxssE7HKLS5D+hVe7+A9_H03QgwOg@mail.gmail.com>
Subject: Re: [PATCH v8 01/12] dt-bindings: display/msm: split qcom,mdss bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, 24 Sept 2022 at 20:23, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On Sat, 24 Sep 2022 15:36:00 +0300, Dmitry Baryshkov wrote:
> > Split Mobile Display SubSystem (MDSS) root node bindings to the separate
> > yaml file. Changes to the existing (txt) schema:
> >  - Added optional "vbif_nrt_phys" region used by msm8996
> >  - Made "bus" and "vsync" clocks optional (they are not used by some
> >    platforms)
> >  - Added optional resets property referencing MDSS reset
> >  - Defined child nodes pointing to corresponding reference schema.
> >  - Dropped the "lut" clock. It was added to the schema by mistake (it is
> >    a part of mdp4 schema, not the mdss).
> >
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/display/msm/mdp5.txt  |  30 +-
> >  .../bindings/display/msm/qcom,mdss.yaml       | 264 ++++++++++++++++++
> >  2 files changed, 265 insertions(+), 29 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:0: 'byte' was expected
>         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:1: 'byte_intf' was expected
>         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:2: 'pixel' was expected
>         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:3: 'core' was expected
>         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:4: 'iface' was expected
>         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:5: 'bus' was expected
>         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: phy-names:0: 'dsi' was expected
>         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: 'power-domains' is a required property
>         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: 'operating-points-v2' is a required property
>         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml

These are the errors generated by the dsi@ node from the example. The
DSI schema is handled separately (by Bryan, added to the Cc list). Can
we have a lifter for this patch? Or I can revert to dropping the dsi@
part from the example.

>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/patch/1681881
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.



-- 
With best wishes
Dmitry
