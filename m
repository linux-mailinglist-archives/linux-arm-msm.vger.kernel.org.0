Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7182B6347DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Nov 2022 21:15:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234729AbiKVUPJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Nov 2022 15:15:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234632AbiKVUPJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Nov 2022 15:15:09 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECB9427CF2;
        Tue, 22 Nov 2022 12:15:07 -0800 (PST)
Received: from g550jk.localnet (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 09F89CE614;
        Tue, 22 Nov 2022 20:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1669148105; bh=tjaabx+DOBEJxsj2AmY3G3Tchs38EEYG75S/4T0olZs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=i0nSZzq6GD7KIP0gmvVbxKBD68Sec5zzm2By2W2IQYCwXTMLFFSpqI3Jj0M6u8uOR
         Tzx3xWsD3KW2It+wSTQyYW5z3zQIZGqJIXZy05ZI2kN6KNnfen+VIRgMouY1s7bUU4
         FmDkOSyI+ZDGhsg9BNvBP7TrTNcwdvFrkxx1RmpY=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     myungjoo.ham@samsung.com, cw00.choi@samsung.com,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gurus@codeaurora.org,
        aghayal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: Re: [PATCH v4 0/2 RESEND] Fix pm8941-misc extcon interrupt dependency assumptions
Date:   Tue, 22 Nov 2022 21:15:03 +0100
Message-ID: <2260542.ElGaqSPkdT@g550jk>
In-Reply-To: <20220926113143.40768-1-bryan.odonoghue@linaro.org>
References: <20220926113143.40768-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Montag, 26. September 2022 13:31:41 CET Bryan O'Donoghue wrote:
> RESEND:
> - I thought I resent these at the start of this month, can't find them
>   in linux-msm I think I just sent them to myself.
> 
>   No change since July 17th
> 
> V4:
> - Added suggested extra log text from Marjin to extcon patch
> 
> V3:
> - Adds a cover-letter since we are now doing two patches a dt-bindings fix
> and platform_get_irq_byname_optional fix.
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

Hi Chanwoo Cho  and MyungJoo Ham,

could you please pick up these patches?

Regards
Luca


