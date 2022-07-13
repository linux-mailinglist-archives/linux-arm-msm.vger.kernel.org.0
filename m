Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2B99573AB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jul 2022 17:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237082AbiGMP6E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jul 2022 11:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbiGMP6C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jul 2022 11:58:02 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B434F6AB
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 08:58:00 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id os14so20648667ejb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 08:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5/Vj1VhdY5NW6ohPgoVwI8+jslVLxU7aofSuN+zvekk=;
        b=oUXldJ8ZPFnIrUN6j4zP6t/M60/eQCX1n+2O4QAs8x351TwUOianbZzOD/qVR5Xbc1
         VgSyE5rPJF83VQ4d0XEI/Dg0M49+YbqXCJDEM1JqYcaQBRedJVat7BoSiFToqHh60rwm
         6mQxbKhfNx7JevSsNTK0eoU3OPJfhmJvL0syA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5/Vj1VhdY5NW6ohPgoVwI8+jslVLxU7aofSuN+zvekk=;
        b=jIEQxnUpzx88pFSxVGVDq0jCLogH5MZpa5mJX2++pRUxUAHZycmhrn8CZdvsMgAp2t
         vpTAgLoSVnYelZZlrfwKnQbsGtgvCrRkPuvrhdL4LkvY9eDR1KleGy5j94eF+3RR51aV
         DULynd7ITM9s8sgB4obr6X6QTnarVQF+PYxKZwH7SRS22n8RiIvPbIBne+aRWKcA/bbm
         lZoowhzca6PvhzNEAjcgy5E/bYja5hM2Qas4rVnmfcO9Mu7BzJ3S9+v2e5Fg0LoBDoyt
         D8ggjd5yCEE1qSO0FOxkRPMsR/Z+0SDKTuP8jYHMUPCHhEUP2ieTUJg3g6bLUTP5fpYd
         4SFQ==
X-Gm-Message-State: AJIora8GQgppE/NswzC3L7qmdKj6Db4OXv2UkUCZiPpJPggsPwqaHw0S
        O+m9D+cHwVHfWeVcOepbIunTtmAkgvmRlrcj
X-Google-Smtp-Source: AGRyM1vnnMzLd4vqN2pivvQhunvAN5pwfBZaGHtIJomxzdO3loml1SyEBiHLr5SSMr+99UYsuS5l+A==
X-Received: by 2002:a17:906:3989:b0:70c:2090:b498 with SMTP id h9-20020a170906398900b0070c2090b498mr4212321eje.56.1657727879024;
        Wed, 13 Jul 2022 08:57:59 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id r11-20020a170906a20b00b0072b2378027csm5048609ejy.26.2022.07.13.08.57.57
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 08:57:58 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id z12so16127525wrq.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 08:57:57 -0700 (PDT)
X-Received: by 2002:adf:fb12:0:b0:20c:79b2:a200 with SMTP id
 c18-20020adffb12000000b0020c79b2a200mr4002688wrr.617.1657727877212; Wed, 13
 Jul 2022 08:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220712150219.20539-1-krzysztof.kozlowski@linaro.org> <20220712150219.20539-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712150219.20539-4-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 13 Jul 2022 08:57:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VPHwkKUjanLtaM+cXdp+VGPExJ_XDe=-O8j=ayGNtnVQ@mail.gmail.com>
Message-ID: <CAD=FV=VPHwkKUjanLtaM+cXdp+VGPExJ_XDe=-O8j=ayGNtnVQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mmc: sdhci-msm: drop redundant of_device_id entries
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jul 12, 2022 at 8:02 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> This reverts three commits:
> 1. Revert "mmc: sdhci-msm: Add compatible string check for sdx65"
>    This reverts commit 953706844f0f2fd4dc6984cc010fe6cf51c041f2.
>
> 2. Revert "mmc: sdhci-msm: Add compatible string check for sm8150"
>    This reverts commit 5acd6adb65802cc6f9986be3750179a820580d37.
>
> 3. Revert "mmc: sdhci-msm: Add SoC specific compatibles"
>    This reverts commit 466614a9765c6fb67e1464d0a3f1261db903834b.
>
> The oldest commit 466614a9765c ("mmc: sdhci-msm: Add SoC specific
> compatibles") did not specify what benefits such multiple compatibles
> bring, therefore assume there is none.  On the other hand such approach
> brings a lot of churn to driver maintenance by expecting commit for
> every new compatible, even though it is already covered by the fallback.
>
> There is really no sense in duplicating of_device_id for each
> variant, which is already covered by generic compatible fallback
> qcom,sdhci-msm-v4 or qcom,sdhci-msm-v5.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Personally, I would have taken the extra step and added a comment in
the code to prevent someone from doing this again. Maybe like this:

/*
 * In the device tree, all boards are required to have _two_ compatible
 * strings listed: a SoC-specific one followed by a more generic one.
 * Normally we can just rely on the generic string, but we always
 * include both so that if we ever find a bug on a specific SoC that
 * we need to workaround (like in sdm845/sc7180) that we can quickly
 * work around it without any changes to the dts.
 */

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
