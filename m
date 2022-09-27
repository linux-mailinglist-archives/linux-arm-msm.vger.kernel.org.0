Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC9305EC76F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 17:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiI0PTK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 11:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbiI0PTJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 11:19:09 -0400
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D352A13F291;
        Tue, 27 Sep 2022 08:19:07 -0700 (PDT)
Received: by mail-oi1-f175.google.com with SMTP id n83so12186794oif.11;
        Tue, 27 Sep 2022 08:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=wXRxHNgmKmKanl4l8Eg0fqOKtTO4UZYjRiXrYlMvlIs=;
        b=xyIbYgCruNYKEX/gAM8RE9W5eFDqTT3nybB6POGRubRApqbDt735UjeK095knHfrOO
         Fsb/N7Eg5GtmpQLBq1+34J0pGWYvuHMNLHjnaSaL8QXVAC03TA6u428998dAICLicrwt
         wIg0J7zZNoLfSyNVMbN8xSLcKulaY5AUFKKGW3qqNm7W5h7VLxIsdFFDOIDAbrdoimj5
         60kAqOs/8KEQRzHmvYG7/qUBMdwD+ByQGAdeqklYuMP2p5u1XalKQ+1TNk3uU53oPA9U
         U7cCLaoBtXlAIcnf8srFGPSrFsy7we7xofyt/L7DsRUv/ey5kIqd2c9qvg2xPDfzUWJZ
         oRlw==
X-Gm-Message-State: ACrzQf0iAohErXEPY/q2rlhISueA7f6JckgexZCKMvAgLBlCQ0iccmzK
        ZIxz0FnnRN/FYb/9WUl0Rd8B6z3GNQ==
X-Google-Smtp-Source: AMsMyM7Tq6EI9RI+e6p6itE+pIviLGESsSPKqa2eDsEQSeRij6qJxEIF50+Itf26CrjppCHGUK4y9A==
X-Received: by 2002:a05:6808:282:b0:34f:6d11:7f68 with SMTP id z2-20020a056808028200b0034f6d117f68mr2093203oic.237.1664291947082;
        Tue, 27 Sep 2022 08:19:07 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w15-20020a056830410f00b0065689e13f52sm787327ott.71.2022.09.27.08.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 08:19:06 -0700 (PDT)
Received: (nullmailer pid 4054434 invoked by uid 1000);
        Tue, 27 Sep 2022 15:19:05 -0000
Date:   Tue, 27 Sep 2022 10:19:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <andersson@kernel.org>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v8 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Message-ID: <20220927151905.GA4052559-robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-2-dmitry.baryshkov@linaro.org>
 <20220924172339.bebekrawee4ubogv@krzk-bin>
 <CAA8EJpqD74ZWvFK-QQ+MUHxssE7HKLS5D+hVe7+A9_H03QgwOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqD74ZWvFK-QQ+MUHxssE7HKLS5D+hVe7+A9_H03QgwOg@mail.gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Sep 24, 2022 at 09:27:10PM +0300, Dmitry Baryshkov wrote:
> Hi,
> 
> On Sat, 24 Sept 2022 at 20:23, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On Sat, 24 Sep 2022 15:36:00 +0300, Dmitry Baryshkov wrote:
> > > Split Mobile Display SubSystem (MDSS) root node bindings to the separate
> > > yaml file. Changes to the existing (txt) schema:
> > >  - Added optional "vbif_nrt_phys" region used by msm8996
> > >  - Made "bus" and "vsync" clocks optional (they are not used by some
> > >    platforms)
> > >  - Added optional resets property referencing MDSS reset
> > >  - Defined child nodes pointing to corresponding reference schema.
> > >  - Dropped the "lut" clock. It was added to the schema by mistake (it is
> > >    a part of mdp4 schema, not the mdss).
> > >
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  .../devicetree/bindings/display/msm/mdp5.txt  |  30 +-
> > >  .../bindings/display/msm/qcom,mdss.yaml       | 264 ++++++++++++++++++
> > >  2 files changed, 265 insertions(+), 29 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
> > >
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:0: 'byte' was expected
> >         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:1: 'byte_intf' was expected
> >         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:2: 'pixel' was expected
> >         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:3: 'core' was expected
> >         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:4: 'iface' was expected
> >         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: clock-names:5: 'bus' was expected
> >         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: phy-names:0: 'dsi' was expected
> >         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: 'power-domains' is a required property
> >         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,mdss.example.dtb: dsi@1a98000: 'operating-points-v2' is a required property
> >         From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> 
> These are the errors generated by the dsi@ node from the example. The
> DSI schema is handled separately (by Bryan, added to the Cc list). Can
> we have a lifter for this patch? Or I can revert to dropping the dsi@
> part from the example.

It's fine as long as I don't see them in linux-next.

Rob
