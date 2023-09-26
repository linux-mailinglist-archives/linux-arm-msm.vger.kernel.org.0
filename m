Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3B9B7AE369
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Sep 2023 03:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjIZBpC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Sep 2023 21:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjIZBpC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Sep 2023 21:45:02 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B67101
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 18:44:55 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D57C433C7;
        Tue, 26 Sep 2023 01:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695692695;
        bh=3GmjWwlLfKkAaee1U7rANvoiG26U/KNUaceqIPsT6ng=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=iygnGX/zFTHpDM5zr/7FqpXcmSkCqfdehvGtxkU7MbfwLy/cUlC/E1M8LoQPpaQBN
         Gksex02EneZnNH11O34brahnhFYM90ZhLA4YsBrD9OpOFvsa7KqsYh8651sMiomYRY
         dq8QrDUSRenRpeB70fhqfhLQ7GDLLui2cqvdoyZdTlbtfGVKROfuQac/Z59NIQ+xTF
         2sSD9tOqAX4h1RPaamOVZ+hwhL2gAJSll2R9H1p1co9KBIWvYAfgDPaVr9IpiNiLHF
         GSmLjIg4eg8YfCYdRaHSjrsUuhTPE6lK3lweZGyOHUPuGZid0XLm+H8OAPWW7f3x+u
         ng8IVaPvMpsAw==
Received: (nullmailer pid 2651675 invoked by uid 1000);
        Tue, 26 Sep 2023 01:44:49 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Richard Acayan <mailingradian@gmail.com>
Cc:     Sean Paul <sean@poorly.run>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ryan McCann <quic_rmccann@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        dri-devel@lists.freedesktop.org,
        Liu Shixin <liushixin2@huawei.com>, devicetree@vger.kernel.org,
        Robert Foss <rfoss@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Conor Dooley <conor+dt@kernel.org>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230925232625.846666-12-mailingradian@gmail.com>
References: <20230925232625.846666-9-mailingradian@gmail.com>
 <20230925232625.846666-12-mailingradian@gmail.com>
Message-Id: <169569268968.2651575.14271780119784995097.robh@kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: display: msm: Add SDM670 MDSS
Date:   Mon, 25 Sep 2023 20:44:49 -0500
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 25 Sep 2023 19:26:30 -0400, Richard Acayan wrote:
> Add documentation for the SDM670 display subsystem, adapted from the
> SDM845 and SM6125 documentation.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../display/msm/qcom,sdm670-mdss.yaml         | 280 ++++++++++++++++++
>  1 file changed, 280 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/qcom,sdm670-mdss.example.dts:198.43-200.27: Warning (graph_endpoint): /example-0/display-subsystem@ae00000/dsi@ae96000/ports/port@0/endpoint: graph connection to node '/example-0/display-subsystem@ae00000/display-controller@ae01000/ports/port@1/endpoint' is not bidirectional

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230925232625.846666-12-mailingradian@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

