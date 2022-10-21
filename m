Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1271608071
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 23:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbiJUVAc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 17:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbiJUVAa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 17:00:30 -0400
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F006110B794;
        Fri, 21 Oct 2022 14:00:29 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id f4-20020a9d0384000000b0066208c73094so2572833otf.0;
        Fri, 21 Oct 2022 14:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jp5O+v/VR9Uxc6a9bxAqi2fjatkKvL4KNFA/YE6ATM4=;
        b=nGa2FAG1vzIPTugufoK7mIUxuQULuGZhId4qpsvKJEP2qFtIqkPtWHzoFMPXmNbTvW
         gqJI/oYjCBUVXdwvoQ6PNrn81jADB2tcJ5wxlzXLKTMp9CRoWjvY/FCbJrp0vMrODp/P
         nS+btAt26L8/Ge3UASWDrI9mMDoFauDit1ldq/VmWu7+nYZ5gqcMygjPiTwl72RIkDFi
         Q6BgGAgwKOk6CAU0mfN4HZr2Z/teSZO96yYOhRcwMYbcl1Wae1F/aYG7623SsiqxdSFq
         X2yKDHe83psekFutfd6SFhbG2egBe46uD7HI3ErZuPHcO3liAHZX3MkztVqbNKy/PXXL
         fE9A==
X-Gm-Message-State: ACrzQf3G74abJflzmmnz+LBc+6VbHLCDYUysZfr9epjHe0mKqnds5NcJ
        6UTUYSgMWUHUP9VogneqhQ==
X-Google-Smtp-Source: AMsMyM7d4LB4l4q8le8x1CWXfY+uasId0M+kGCbSwVnvSjOkI5HsMNG3Eu8V1sORN0mJObk7QNOP2g==
X-Received: by 2002:a05:6830:440c:b0:661:e2ad:c599 with SMTP id q12-20020a056830440c00b00661e2adc599mr10066800otv.103.1666386028428;
        Fri, 21 Oct 2022 14:00:28 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e18-20020a056830201200b00661ad8741b4sm1579722otp.24.2022.10.21.14.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 14:00:27 -0700 (PDT)
Received: (nullmailer pid 314789 invoked by uid 1000);
        Fri, 21 Oct 2022 21:00:25 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>,
        devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221021165534.2334329-3-dmitry.baryshkov@linaro.org>
References: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org> <20221021165534.2334329-3-dmitry.baryshkov@linaro.org>
Message-Id: <166638584258.307638.14223403470296832950.robh@kernel.org>
Subject: Re: [RFC PATCH 2/9] dt-bindings: arm-smmu: fix clocks/clock-names schema
Date:   Fri, 21 Oct 2022 16:00:25 -0500
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 21 Oct 2022 19:55:27 +0300, Dmitry Baryshkov wrote:
> Rework clocks/clock-names properties schema to property describe
> possible usage cases.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/iommu/arm,smmu.yaml   | 129 ++++++++++++++++--
>  1 file changed, 121 insertions(+), 8 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iommu/arm,smmu.example.dtb: iommu@d00000: 'anyOf' conditional failed, one must be fixed:
	['bus', 'iface'] is too long
	['bus', 'iface'] is too short
	'iface' was expected
	'iface-mm' was expected
	'mem' was expected
	'iface-smmu' was expected
	[[4294967295, 123], [4294967295, 124]] is too long
	[[4294967295, 123], [4294967295, 124]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iommu/arm,smmu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

