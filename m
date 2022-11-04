Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7216F619621
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 13:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbiKDMVh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 08:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbiKDMVe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 08:21:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AB672D1F6;
        Fri,  4 Nov 2022 05:21:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 30C7F620BC;
        Fri,  4 Nov 2022 12:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95BE2C433D7;
        Fri,  4 Nov 2022 12:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667564492;
        bh=ZXLJVpZXT+rWJ0ivseoUk9nwVTF3CBUlHi/ObsPKqIE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OBM77ubcRT9a5w/v78iozP0L2hG7m4X1G75HVaBibLtU25YftqEBE5Ndooewxzy3c
         ZeXDb/WzrIW3iDDeLe4Em83u0w93DhzPQmMtj9RmUOPO3XwS5XJdmqw0PsmMQsVLCx
         9ol/afe0iVZEJMgO1GrPZGrYleovk/ZymFAuCfLC8DSoEr7FUooH063SvS4K+7chmp
         /3aBEwPTJ8JhMfRQcdmiwIdKPUIxu+WlNG4qvKCO9Dk5KZOq+fEq/zoRvG4nq3T8Ca
         GsbV7XySi5YaUfX3FD4wdayFLaLd9CeQpzjgb1XkzZhgmaBjNT3riekPEAydEpBMDw
         xKBYHv0MpVYIQ==
Received: by mail-lf1-f50.google.com with SMTP id f37so7172613lfv.8;
        Fri, 04 Nov 2022 05:21:32 -0700 (PDT)
X-Gm-Message-State: ACrzQf1lhExyGHn0PmcMnhRMiNOl8i1cUUvnzzkT09ocvkoksvIYXWy6
        KjlhKxZ+f2edQ8H3VNW9tJwvhyog5dIKJDxjTA==
X-Google-Smtp-Source: AMsMyM5kTNZDfNz1NMagVWEucdPQHrDVvMm1GNlzFfBYpRDW2nbr0fXNbF2H0V1PLZq0+l5VjjjYUpUH27KcZlOR9e0=
X-Received: by 2002:a19:5048:0:b0:4b1:3856:e422 with SMTP id
 z8-20020a195048000000b004b13856e422mr5516827lfj.368.1667564490584; Fri, 04
 Nov 2022 05:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 4 Nov 2022 07:21:21 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+_p36jCUTE+9V+eAyxF9ETcgk4gBDN7-+mgJVd7-ZYzg@mail.gmail.com>
Message-ID: <CAL_Jsq+_p36jCUTE+9V+eAyxF9ETcgk4gBDN7-+mgJVd7-ZYzg@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] dt-bindings: display/msm: rework MDSS and DPU bindings
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 24, 2022 at 11:42 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Create separate YAML schema for MDSS devicesd$ (both for MDP5 and DPU
> devices). Cleanup DPU schema files, so that they do not contain schema
> for both MDSS and DPU nodes. Apply misc small fixes to the DPU schema
> afterwards. Add schema for the MDSS and DPU on sm8250 platform.
>
> Soft dependency on [1] to define qcom,dsi-phy-14nm-2290 binding used in
> examples
>
> [1] https://lore.kernel.org/linux-arm-msm/20220924121900.222711-1-dmitry.baryshkov@linaro.org/
>
> Changes since v8:
>  - Dropped DSI/DSI-PHY examples from the first patch. Proper example
>    generate a pile of warnings because of DSI schema deficiencies. I'll
>    add these examples back, once DSI schema is fixed.
>
> Changes since v7:
>  - Expanded examples to include MDSS child nodes (Krzysztof)
>
> Changes since v6:
>  - Removed extra newlines (Krzysztof)
>  - Added $ref to dpu-common.yaml#/ports/port@foo to enforce schema
>    for the port nodes (Rob)
>  - Removed unused allOf's (Rob)
>  - Fixed repeated interconnects descriptions (Rob)
>  - Fixed dpu-common.yaml and mdss-common.yaml descriptions (Rob)
>  - Fixed intentation of examples (Krzysztof)
>  - Renamed MDSS and DPU schema to follow compat names (Rob)
>
> Changes since v5:
>  - Dropped the core clock from mdss.yaml. It will be handled in a
>    separate patchset together with adding the clock itself.
>  - Fixed a typo in two commit subjects (mdm -> msm).
>
> Changes since v4:
>  - Created separate mdss-common.yaml
>  - Rather than squashing everything into mdss.yaml, create individual
>    schema files for MDSS devices.
>
> Changes since v3:
>  - Changed mdss->(dpu, dsi, etc.) relationship into the tight binding
>    depending on the mdss compatible string.
>  - Added sm8250 dpu schema and added qcom,sm8250-mdss to mdss.yaml
>
> Changes since v2:
>  - Added a patch to allow opp-table under the dpu* nodes.
>  - Removed the c&p issue which allowed the @0 nodes under the MDSS
>    device node.
>
> Changes since v1:
>  - Renamed DPU device nodes from mdp@ to display-controller@
>  - Described removal of mistakenly mentioned "lut" clock
>  - Switched mdss.yaml to use $ref instead of fixing compatible strings
>  - Dropped mdp-opp-table description (renamed by Krzysztof in his
>    patchset)
>  - Reworked DPU's ports definitions. Dropped description of individual
>    ports, left only /ports $ref and description in dpu-common.yaml.
>
> Dmitry Baryshkov (12):
>   dt-bindings: display/msm: split qcom,mdss bindings
>   dt-bindings: display/msm: add gcc-bus clock to dpu-smd845
>   dt-bindings: display/msm: add interconnects property to
>     qcom,mdss-smd845
>   dt-bindings: display/msm: move common DPU properties to
>     dpu-common.yaml
>   dt-bindings: display/msm: move common MDSS properties to
>     mdss-common.yaml
>   dt-bindings: display/msm: split dpu-sc7180 into DPU and MDSS parts
>   dt-bindings: display/msm: split dpu-sc7280 into DPU and MDSS parts
>   dt-bindings: display/msm: split dpu-sdm845 into DPU and MDSS parts
>   dt-bindings: display/msm: split dpu-msm8998 into DPU and MDSS parts
>   dt-bindings: display/msm: split dpu-qcm2290 into DPU and MDSS parts
>   dt-bindings: display/msm: add missing device nodes to mdss-* schemas
>   dt-bindings: display/msm: add support for the display on SM8250

This is now warning in linux-next:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.example.dtb:
dsi@ae94000: 'opp-table' does not match any of the regexes:
'pinctrl-[0-9]+'
        From schema:
/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.example.dtb:
dsi@ae94000: 'opp-table' does not match any of the regexes:
'pinctrl-[0-9]+'
        From schema:
/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.example.dtb:
dsi@5e94000: compatible: 'oneOf' conditional failed, one must be
fixed:
        'qcom,dsi-ctrl-6g-qcm2290' does not match
'^qcom,(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+-.*$'
        'qcom,dsi-ctrl-6g-qcm2290' does not match
'^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$'
        'qcom,dsi-ctrl-6g-qcm2290' does not match
'^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
        'qcom,dsi-ctrl-6g-qcm2290' does not match
'^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
        'qcom,dsi-ctrl-6g-qcm2290' does not match
'^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
        'qcom,dsi-ctrl-6g-qcm2290' does not match
'^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
        'qcom,dsi-ctrl-6g-qcm2290' does not match
'^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
        'qcom,dsi-ctrl-6g-qcm2290' does not match
'^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
        'qcom,dsi-ctrl-6g-qcm2290' is not one of ['qcom,gpucc-sdm630',
'qcom,gpucc-sdm660', 'qcom,lcc-apq8064', 'qcom,lcc-ipq8064',
'qcom,lcc-mdm9615', 'qcom,lcc-msm8960', 'qcom,lpass-cpu-apq8016',
'qcom,usb-ss-ipq4019-phy', 'qcom,usb-hs-ipq4019-phy',
'qcom,vqmmc-ipq4019-regulator']
        'qcom,dsi-ctrl-6g-qcm2290' is not one of ['qcom,ipq806x-gmac',
'qcom,ipq806x-nand', 'qcom,ipq806x-sata-phy',
'qcom,ipq806x-usb-phy-ss', 'qcom,ipq806x-usb-phy-hs']
        From schema:
/builds/robherring/linux-dt/Documentation/devicetree/bindings/arm/qcom-soc.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.example.dtb:
dsi@ae94000: 'opp-table' does not match any of the regexes:
'pinctrl-[0-9]+'
        From schema:
/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
