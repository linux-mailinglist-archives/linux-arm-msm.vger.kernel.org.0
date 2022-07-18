Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 701EE578D43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 00:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236429AbiGRWDH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 18:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233533AbiGRWDG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 18:03:06 -0400
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D7030575;
        Mon, 18 Jul 2022 15:03:05 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id n138so9197866iod.4;
        Mon, 18 Jul 2022 15:03:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=+Ds7vAIuyuYjYIOURWWj2FmYD2WCeACWUphKceomFs8=;
        b=Oeijp9pmKah36XYb2DkKHK3MgE5v0BdiyWuge//EHzPZyDRrxh4DmVCsCqV9dJOxYd
         qELoT9HquOiipMDmvLggcOofvCtZcgTKh0BTlJpX3oMCC+jpBTscP/ZDSOFlZUz4Jp/a
         1+L5KszVa1VpLZq7d2qJpyEGLvoudOjiCBNM991J0gJ5YPA6ZH9ET8vh160ZE1f/IxHl
         44ZE74A1zMdTmc06ii3QJc2o04fVAirtdclULYA23B3ZqcWPHm5lwvSjsNCneRCNQ1VZ
         BswECk/8ts5sbt0o+il7VeGmtpNTGyFUpiY0mIUmEpf45fj8IhepHfxsqUPeCRd7BweK
         bP5w==
X-Gm-Message-State: AJIora8akJMQfnA50+ro9DT7T9dedqZrW/HWcTm8xPwR1+5mag0ZvBox
        MIU57CC1iF7vlHj88XjsrNUoqwzGKg==
X-Google-Smtp-Source: AGRyM1tYi/nREKRfmgHFryzYPu9A0DXLc7OMJxv4NHv5FPH8FMRBz5ewJiUW220s6YJVkefCycU11w==
X-Received: by 2002:a05:6638:1920:b0:341:4c2f:18a9 with SMTP id p32-20020a056638192000b003414c2f18a9mr9755282jal.261.1658181785058;
        Mon, 18 Jul 2022 15:03:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id ch23-20020a0566383e9700b003415f2fb081sm3118377jab.125.2022.07.18.15.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 15:03:04 -0700 (PDT)
Received: (nullmailer pid 3645115 invoked by uid 1000);
        Mon, 18 Jul 2022 22:03:02 -0000
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-remoteproc@vger.kernel.org,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        devicetree@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20220718140344.1831731-3-stephan.gerhold@kernkonzept.com>
References: <20220718140344.1831731-1-stephan.gerhold@kernkonzept.com> <20220718140344.1831731-3-stephan.gerhold@kernkonzept.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: remoteproc: qcom,q6v5: Move MSM8916 to schema
Date:   Mon, 18 Jul 2022 16:03:02 -0600
Message-Id: <1658181782.827574.3645114.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 18 Jul 2022 16:03:41 +0200, Stephan Gerhold wrote:
> qcom,q6v5.txt covers multiple SoCs with quite different binding
> requirements. Converting this into one DT schema would require
> several if statements, making the DT schema overall harder to
> read and understand.
> 
> To avoid this, follow the example of SC7180/SC7280 and split
> "qcom,msm8916-mss-pil" (and the equivalent deprecated "qcom,q6v5-pil"
> compatible) into a separate DT schema. The schema is somewhat based
> on the one for SC7180/SC7280 but adjusted for the old platforms.
> 
> Compared to the old plain text bindings, add missing documentation for
> the "bam-dmux" subnode and recommend one particular approach to specify
> the MBA/MPSS "memory-region" (the other one is marked as deprecated).
> 
> Cc: Sireesh Kodali <sireeshkodali1@gmail.com>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
> ---
> Changes in v2:
>   - Add blank lines between top-level properties
>   - Drop "deprecated" in "oneOf" list, it is not clear if this is valid
>     and it should be redundant since the properties itself are already
>     marked as "deprecated"
> ---
> Like Sibi's patch series for SC7180/SC7820 [1] this is somewhat related
> to Sireesh's series that converts all of qcom,q6v5.txt [2] (with a lot
> of if statements). However, this series focuses on MSM8916/MSM8974 (or
> actually MSM8909) only.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/1657020721-24939-1-git-send-email-quic_sibis@quicinc.com/
> [2]: https://lore.kernel.org/linux-arm-msm/20220511161602.117772-7-sireeshkodali1@gmail.com/
> ---
>  .../remoteproc/qcom,msm8916-mss-pil.yaml      | 247 ++++++++++++++++++
>  .../bindings/remoteproc/qcom,q6v5.txt         |  19 --
>  2 files changed, 247 insertions(+), 19 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/remoteproc/qcom,smd-edge.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.example.dtb: remoteproc@4080000: smd-edge: False schema does not allow {'interrupts': [[0, 25, 1]], 'qcom,smd-edge': [[0]], 'qcom,ipc': [[4294967295, 8, 12]], 'qcom,remote-pid': [[1]], 'label': ['hexagon']}
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

