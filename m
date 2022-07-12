Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E54AB571C75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 16:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbiGLO0r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jul 2022 10:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233585AbiGLO0f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jul 2022 10:26:35 -0400
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA25B93D6;
        Tue, 12 Jul 2022 07:26:18 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id p13so4937164ilq.0;
        Tue, 12 Jul 2022 07:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=1krryCxXZpZ7zRDoyHmJlv2p3l9oqnjU6GHeaTd0+R8=;
        b=T+Ow9FZdAsgkqR/mucvWZ/7kOqWTCb6XpK/tbPLei6VufBz0GbY9H5ofD5gZQi3is+
         LFAgf+NMk8OgrRrYWaapfYuQSDTc/2NJ3pzwaJJS7MbHGmihvPrw6TSy4lQPWcl7PYzw
         8PqU8/dl6dJpTsbNKYNHE6UMn5Dl1LgYO3GtxfB2EMwF7A1PLTMC6ECDHgijOn7TKSds
         sfEopNzxRB1mGlH3OrooDNTTJeG1pKw5T1K2Lgp62lZ3nC/tmq3qAvZPhewjEDCqbDn0
         myWRvDVLR2GC0OFdpPWJDFtY36YdHqa+cNgNETFhiMI0bxvnO9aDzvE4AePHo0B+Wrjg
         +qFw==
X-Gm-Message-State: AJIora8HDSIyixAicBMHgn1ppnv9rHBhXncSNzuQcZFxc6cGitBGp0CI
        5DM6HCZeW8Iwl8FS/mpGuQ==
X-Google-Smtp-Source: AGRyM1uhyieVNNMFSH9Fn+BMc4R7p6v+ljgAI1PZHfX3Z0Pg5ptWKgDm8FaP+gLvnmaZxcO2Gg6EvQ==
X-Received: by 2002:a05:6e02:1d95:b0:2dc:4746:6a2d with SMTP id h21-20020a056e021d9500b002dc47466a2dmr11933000ila.322.1657635977511;
        Tue, 12 Jul 2022 07:26:17 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id r25-20020a02b119000000b0032e271a558csm4138264jah.168.2022.07.12.07.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 07:26:17 -0700 (PDT)
Received: (nullmailer pid 1805852 invoked by uid 1000);
        Tue, 12 Jul 2022 14:26:12 -0000
From:   Rob Herring <robh@kernel.org>
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-remoteproc@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>, Luca Weiss <luca@z3ntu.xyz>
In-Reply-To: <20220712124421.3129206-3-stephan.gerhold@kernkonzept.com>
References: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com> <20220712124421.3129206-3-stephan.gerhold@kernkonzept.com>
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: qcom,q6v5: Move MSM8916 to schema
Date:   Tue, 12 Jul 2022 08:26:12 -0600
Message-Id: <1657635972.125667.1805851.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 12 Jul 2022 14:44:17 +0200, Stephan Gerhold wrote:
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
> Like Sibi's patch series for SC7180/SC7820 [1] this is somewhat related
> to Sireesh's series that converts all of qcom,q6v5.txt [2] (with a lot
> of if statements). However, this series focuses on MSM8916/MSM8974 (or
> actually MSM8909) only.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/1657020721-24939-1-git-send-email-quic_sibis@quicinc.com/
> [2]: https://lore.kernel.org/linux-arm-msm/20220511161602.117772-7-sireeshkodali1@gmail.com/
> ---
>  .../remoteproc/qcom,msm8916-mss-pil.yaml      | 246 ++++++++++++++++++
>  .../bindings/remoteproc/qcom,q6v5.txt         |  19 --
>  2 files changed, 246 insertions(+), 19 deletions(-)
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

