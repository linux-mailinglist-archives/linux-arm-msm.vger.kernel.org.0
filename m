Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 759D0604C3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 17:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbiJSPxH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Oct 2022 11:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbiJSPwu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Oct 2022 11:52:50 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF747676D
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 08:49:49 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id a67so25855111edf.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 08:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x/LBGeRA1bR4x/er8ptm3OVF4CHSU/5RYrhJUueSgZE=;
        b=C1ufBFChd3ta9Bpk6NhYscZbbJ7JDe1ZFQ+hb33zZWt91jdlj+w86KBpTM6vakXu2U
         Qv0x1YlEOhpT9celq+q/nlE3hxnC7RldNre50cZVo02wJvg8NgB+MdadbWkRBZzB49bQ
         k6FO3/apf9bvCZYQGYyY9ln1WQ/EFw8vZXsyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/LBGeRA1bR4x/er8ptm3OVF4CHSU/5RYrhJUueSgZE=;
        b=H8nsANKsQCxvAORjiqWKpc1e3MjJwGofOTf8ml8OnSwMKYddc9NK5pwneDRhEfO1Rf
         aWq0+1rX1N9qAz8nFhbNyFbYlNIXQSfij78u4WC0PrRihSOszpeoIMo2KBGC95nZEwYU
         s31A7w/yERakYjINNosza/zeXTPNAckRoCOmvYf9OjERB+6uciVdOkI/UQmo4lYhOjyt
         /k3UDH/jNaRn7nCQDETqtwAIHMkNCCvwADT4fSBEcpTYBEzJa45KA8JDz0raQxQ2vOc7
         ZEMKlgrs0s1VGBue4PPRh8+09A2kNJkMJOVG3BKiCxt7+n1z6XrXxsPoxJa7RwPSeAIy
         nC2w==
X-Gm-Message-State: ACrzQf2YI8cMMD2PSuK57vgegKF7PPZ9mbxLPNe345oNU9lOzNEJljsc
        AbrQHFN8zMjacGCZyGZhlATJmn2rqrWhMA==
X-Google-Smtp-Source: AMsMyM6VhiU4I9OcIHsYWmQ7ub978OeOIXCWdwh4b2u4KS/+EObNHByvfU3lP7nB3J4Z7IfRTlcisQ==
X-Received: by 2002:aa7:d458:0:b0:45b:ddbf:39fa with SMTP id q24-20020aa7d458000000b0045bddbf39famr8255350edr.335.1666194501753;
        Wed, 19 Oct 2022 08:48:21 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id v5-20020a1709060b4500b0073d6093ac93sm9275882ejg.16.2022.10.19.08.48.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 08:48:19 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id l32so13195332wms.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Oct 2022 08:48:19 -0700 (PDT)
X-Received: by 2002:a05:600c:4b19:b0:3c6:cc7c:763c with SMTP id
 i25-20020a05600c4b1900b003c6cc7c763cmr6355432wmp.57.1666194498976; Wed, 19
 Oct 2022 08:48:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221019001351.1630089-1-krzysztof.kozlowski@linaro.org> <20221019001351.1630089-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221019001351.1630089-3-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 19 Oct 2022 08:48:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UriVs4-=KCg5TkzCuQaS=LEZS=CDOH0=69GsYjhPcu_g@mail.gmail.com>
Message-ID: <CAD=FV=UriVs4-=KCg5TkzCuQaS=LEZS=CDOH0=69GsYjhPcu_g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: sc7180: revert "arm64: dts:
 qcom: sc7180: Avoid glitching SPI CS at bootup on trogdor"
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Oct 18, 2022 at 5:14 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> This reverts commit e440e30e26dd6b0424002ad0ddcbbcea783efd85 because it
> is not a reliable way of fixing SPI CS glitch and it depends on specific
> Linux kernel pin controller driver behavior.
>
> This behavior of kernel driver was changed in commit b991f8c3622c
> ("pinctrl: core: Handling pinmux and pinconf separately") thus
> effectively the DTS fix stopped being effective.
>
> Proper solution for the glitching SPI chip select must be implemented in
> the drivers, not via ordering of entries in DTS.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Changes since v2:
> 1. New patch
>
> Not tested on hardware.
>
> Cc: Doug Anderson <dianders@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 27 +++-----------------
>  1 file changed, 3 insertions(+), 24 deletions(-)

It would have been nice for the commit message to mention the fix in
the driver, which has already landed as commit d21f4b7ffc22 ("pinctrl:
qcom: Avoid glitching lines when we first mux to output").

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I've confirmed that this patch is fine after taking the pinctrl fix.

Tested-by: Douglas Anderson <dianders@chromium.org>
