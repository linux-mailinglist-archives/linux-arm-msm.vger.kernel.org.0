Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B52C6231DB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 18:50:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbiKIRt6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 12:49:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbiKIRtz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 12:49:55 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920D7BEF
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Nov 2022 09:49:53 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id k2so48899390ejr.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Nov 2022 09:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t7G5Hy6eG2eiNE9V/IOufFYHzNedVTwrudCjfMCx5Fk=;
        b=JGwfZAm56VMEEpaVEjBbiKtXAgZPn/x0vOsk4hnEB8erudvAHaVFZd+BAd4yDKvOJn
         ijtOYe6Mu7ciFKCIpw4N8koUxQg8krvJvptQnsVsd/GJYfGhxXQvoKMKk7Hj2LZeCh+N
         87TH4Qs/B4iVSSd3cm3ZiTtApZQYC7H/Jc2TU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7G5Hy6eG2eiNE9V/IOufFYHzNedVTwrudCjfMCx5Fk=;
        b=kZ6c5kUTXbxvGe1IhuO0cN4mryl+ivHIDSIVoSnCuUQgGZrfDl2HntuHZsgFTBDGDE
         H6gFTqFUNCWV4J/n5bpJgwql5RhKdlHI5jn8BJ2c0PFwc3sAKrvQy99OW0Uv8zYfwDC8
         TLOVpfdFZt5+dihwkhQ2/eYleOW8j4TtAOK7+9PMl0Q+7f02n7b+r/LcB3qPMDjkcGp7
         JeJrbf9y2NxWuetFdiZGB+GONsMtPfsXRUOenVp49ZMPHaR/L79u4WM8ZAYQY0wlApXQ
         e88sepxkNGhwHeomoKgUindp0kFAeq8eeWbyIW43qW3siQism3H+u2z8tUl3b/LHoqgU
         0NZA==
X-Gm-Message-State: ANoB5pn+USTKdsqLDQqcy00m3vfuHkTlM9Gin96M0tI8KbnJ20nxIAIo
        nX+Y/Pu4HjBf7sTyLL9OTRkRQFDqs7aiJZjY
X-Google-Smtp-Source: AA0mqf4CXJK9W0RuVPjS8WX5RfeiiIrLuphxb952yIPzfDZ7PCvWEo50Zao1gSLeQFxiIGVJNbWKZA==
X-Received: by 2002:a17:906:f292:b0:7ae:8a69:a169 with SMTP id gu18-20020a170906f29200b007ae8a69a169mr483251ejb.394.1668016191871;
        Wed, 09 Nov 2022 09:49:51 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id w6-20020a056402070600b0046191f5e946sm7252733edx.21.2022.11.09.09.49.47
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 09:49:47 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id g12so26868446wrs.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Nov 2022 09:49:47 -0800 (PST)
X-Received: by 2002:adf:d1ec:0:b0:236:880f:2adf with SMTP id
 g12-20020adfd1ec000000b00236880f2adfmr39916313wrd.617.1668016186615; Wed, 09
 Nov 2022 09:49:46 -0800 (PST)
MIME-Version: 1.0
References: <20221109055132.609-1-quic_sibis@quicinc.com> <20221109055132.609-2-quic_sibis@quicinc.com>
In-Reply-To: <20221109055132.609-2-quic_sibis@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 9 Nov 2022 09:49:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xpee30TR-+TsJnPkhuAaOEx0cmBVpUgrpMxGGyJ7CcaA@mail.gmail.com>
Message-ID: <CAD=FV=Xpee30TR-+TsJnPkhuAaOEx0cmBVpUgrpMxGGyJ7CcaA@mail.gmail.com>
Subject: Re: [PATCH V3 2/2] arm64: dts: qcom: sc7280: Add Google Herobrine
 WIFI SKU dts fragment
To:     Sibi Sankar <quic_sibis@quicinc.com>
Cc:     bjorn.andersson@linaro.org, jinghung.chen3@hotmail.com,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@somainline.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Nov 8, 2022 at 9:52 PM Sibi Sankar <quic_sibis@quicinc.com> wrote:
>
> The Google Herobrine WIFI SKU can save 256M by not having modem/mba/rmtfs
> memory regions defined. Add the dts fragment and mark all the board files
> appropriately.
>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>
> v2:
>  * Mark the WIFI SKUs of Evoker/Villager-r1
>  * Misc. Fixes [Doug]
>
> Instead of just having remoteproc_mpss node disabled, we go ahead and
> delete it on wifi only SKUs. This is done to avoid the dtbs_check
> failures that we would end of getting if we delete the memory-region
> property present in the node (since it's a required property). I'll
> send a follow up patch with IPA node enabled only on LTE SKUs as soon
> as I verify that it doesn't have any impact on suspend/resume.
>
>  .../boot/dts/qcom/sc7280-chrome-common.dtsi   | 15 --------
>  .../dts/qcom/sc7280-herobrine-evoker-lte.dts  |  4 +-
>  .../boot/dts/qcom/sc7280-herobrine-evoker.dts |  2 +-
>  .../dts/qcom/sc7280-herobrine-evoker.dtsi     |  1 +
>  .../dts/qcom/sc7280-herobrine-lte-sku.dtsi    | 19 ++++++++++
>  .../qcom/sc7280-herobrine-villager-r1-lte.dts |  4 +-
>  .../dts/qcom/sc7280-herobrine-villager-r1.dts | 31 +---------------
>  .../qcom/sc7280-herobrine-villager-r1.dtsi    | 37 +++++++++++++++++++
>  .../dts/qcom/sc7280-herobrine-wifi-sku.dtsi   | 11 ++++++
>  9 files changed, 77 insertions(+), 47 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi

Reviewed-by: Douglas Anderson <dianders@chromium.org>
