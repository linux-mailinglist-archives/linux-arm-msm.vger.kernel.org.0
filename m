Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D22AD5ED826
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 10:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233429AbiI1Ir6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 04:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233662AbiI1IrH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 04:47:07 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A838923EE
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 01:45:11 -0700 (PDT)
Received: from SoMainline.org (D57D4C6E.static.ziggozakelijk.nl [213.125.76.110])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B94B83F20B;
        Wed, 28 Sep 2022 10:45:08 +0200 (CEST)
Date:   Wed, 28 Sep 2022 10:45:07 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     myungjoo.ham@samsung.com, cw00.choi@samsung.com, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        gurus@codeaurora.org, aghayal@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/2 RESEND] Fix pm8941-misc extcon interrupt
 dependency assumptions
Message-ID: <20220928084249.l2qrx7mdbchdbite@SoMainline.org>
References: <20220926113143.40768-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926113143.40768-1-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

(Whoops, I didn't get CC'd in the cover letter - downloaded it from the
lists)

On 2022-09-26 12:31:41, Bryan O'Donoghue wrote:
> RESEND:
> - I thought I resent these at the start of this month, can't find them
>   in linux-msm I think I just sent them to myself.

It seems it made it to the lists successfully - there's a v4 RESEND from
the 8th: https://lore.kernel.org/linux-arm-msm/20220908112556.860343-1-bryan.odonoghue@linaro.org/

>   No change since July 17th
> 
> V4:
> - Added suggested extra log text from Marjin to extcon patch

MarIJn*, thanks :)

- Marijn

> V3:
> - Adds a cover-letter since we are now doing two patches a dt-bindings fix and
>   platform_get_irq_byname_optional fix.
> - Add Review-by -> Rob Herring, Marijn Suijten
> - Add additional patch to negate warning when one of usb_id or usb_vbus
>   is not declared in the platform DTS.
> 
> Bryan O'Donoghue (2):
>   dt-bindings: pm8941-misc: Fix usb_id and usb_vbus definitions
>   extcon: qcom-spmi: Switch to platform_get_irq_byname_optional
> 
>  .../devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 12 ++++++++----
>  drivers/extcon/extcon-qcom-spmi-misc.c               |  4 ++--
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> -- 
> 2.36.1
> 
