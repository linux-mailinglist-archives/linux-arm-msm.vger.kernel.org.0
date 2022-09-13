Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 453005B7AB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 21:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiIMTTx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 15:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbiIMTTv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 15:19:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72A84237E5
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 12:19:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 322DAB80EA9
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 19:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F21C43144
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 19:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663096786;
        bh=R6jS4Z4a97K5U8pIi4B/KhdQlMe9099Tb7Nblpb7eAg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=W67DQT0Jpa6VrypZZXw3RXWi2q8jJCcR3yTMzL8lQ6O5aCcwy55a4ldaGFRYgpA5X
         3l8hNvm6we5YERfbpPEZHpCEH7gsSEAz2kBE2d72740JxSarKGD4N/wh13wvDW2ij7
         EEE38cPpXb8IyO7XhLv4XcuZOigpKu/zdLikFcGMwlxpeHj+O7ZkQJj3T0pxVe0Iay
         rntDxxZsiEjCMJxlqwiWwTIA4sQoKlPVeg2WcOYeOTXRGfolmO1bZbKLomUjSuqehl
         P6juOsd2tAyuEG7/Qr4XzZNEqgl5DkL3mfVT/CZOTKVFnW6e/3p4OKhh725TJ7ie/0
         p6mVzBaaZi/Dw==
Received: by mail-lf1-f51.google.com with SMTP id w8so21687108lft.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 12:19:46 -0700 (PDT)
X-Gm-Message-State: ACgBeo0ZUdX0yK8QFjxQk7/K9WLmPs/FcE5jcLq56xuAfv5VKzArEYmF
        FqphiRDSE05UiKfqS9/4T0w8NJGE79pOq0+clxzqVg==
X-Google-Smtp-Source: AA6agR5aM4pWdQSmUlxw3xzfWQVfAcmWpXX4S0yTh4MBo1COoiN3Z+VmIU18K5DPji7JAYTvTwXfChZqZwoswz6K7YI=
X-Received: by 2002:a05:6512:118b:b0:492:e3c4:a164 with SMTP id
 g11-20020a056512118b00b00492e3c4a164mr12052488lfr.598.1663096784863; Tue, 13
 Sep 2022 12:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220910124701.4060321-1-dmitry.baryshkov@linaro.org> <20220910124701.4060321-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220910124701.4060321-2-dmitry.baryshkov@linaro.org>
From:   Amit Kucheria <amitk@kernel.org>
Date:   Wed, 14 Sep 2022 00:49:33 +0530
X-Gmail-Original-Message-ID: <CAHLCerNqsDCFLwSBfioWhCTiNfscywhZVe7Uqk49E5A5H7cyxw@mail.gmail.com>
Message-ID: <CAHLCerNqsDCFLwSBfioWhCTiNfscywhZVe7Uqk49E5A5H7cyxw@mail.gmail.com>
Subject: Re: [RFC PATCH 01/10] dt-bindings: thermal: tsens: support per-sensor
 calibration cells
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Sep 10, 2022 at 6:17 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Allow specifing the exact calibration mode and calibration data as nvmem

typo: specifying

> cells, rather than specifying just a single calibration data blob.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Amit Kucheria <amitk@kernel.org>


> ---
>  .../bindings/thermal/qcom-tsens.yaml          | 64 ++++++++++++++++---
>  1 file changed, 54 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 038d81338fcf..b813f6f19c1d 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -77,18 +77,62 @@ properties:
>        - const: critical
>
>    nvmem-cells:
> -    minItems: 1
> -    maxItems: 2
> -    description:
> -      Reference to an nvmem node for the calibration data
> +    oneOf:
> +      - minItems: 1
> +        maxItems: 2
> +        description:
> +          Reference to an nvmem node for the calibration data
> +      - minItems: 5
> +        maxItems: 35
> +        description: |
> +          Reference to an nvmem cells for the calibration mode, two calibration
> +          bases and two cells per each sensor
>
>    nvmem-cell-names:
> -    minItems: 1
> -    items:
> -      - const: calib
> -      - enum:
> -          - calib_backup
> -          - calib_sel
> +    oneOf:
> +      - minItems: 1
> +        items:
> +          - const: calib
> +          - enum:
> +              - calib_backup
> +              - calib_sel
> +      - minItems: 5
> +        items:
> +          - const: mode
> +          - const: base1
> +          - const: base2
> +          - const: s0_p1
> +          - const: s0_p2
> +          - const: s1_p1
> +          - const: s1_p2
> +          - const: s2_p1
> +          - const: s2_p2
> +          - const: s3_p1
> +          - const: s3_p2
> +          - const: s4_p1
> +          - const: s4_p2
> +          - const: s5_p1
> +          - const: s5_p2
> +          - const: s6_p1
> +          - const: s6_p2
> +          - const: s7_p1
> +          - const: s7_p2
> +          - const: s8_p1
> +          - const: s8_p2
> +          - const: s9_p1
> +          - const: s9_p2
> +          - const: s10_p1
> +          - const: s10_p2
> +          - const: s11_p1
> +          - const: s11_p2
> +          - const: s12_p1
> +          - const: s12_p2
> +          - const: s13_p1
> +          - const: s13_p2
> +          - const: s14_p1
> +          - const: s14_p2
> +          - const: s15_p1
> +          - const: s15_p2
>
>    "#qcom,sensors":
>      description:
> --
> 2.35.1
>
