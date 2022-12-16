Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0147264E57F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Dec 2022 02:01:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbiLPBBW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Dec 2022 20:01:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbiLPBBV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Dec 2022 20:01:21 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C05CE18B34
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 17:01:19 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id o13so564826ilc.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 17:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g08NksEKoOrU8KMw47a1woD21yieKuv5YfZnJWjlF2A=;
        b=WK0BCJRkm8uppwvGebpPX5SnM2eeJ7ZP6cQ3Dhz8iASi+JJ7u+NoHWJFt5s4aOX/Zc
         JCMgJePxJea9Nt++2tHIvgqaw8Cbc8OBPaFpFfruaytR1TfLtnHAvYPzCRp6Gk0ruUtI
         IG6SYugnQRhvV0RKu73Syv4uC4Ny4PEaMhB/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g08NksEKoOrU8KMw47a1woD21yieKuv5YfZnJWjlF2A=;
        b=UI4YbGgYqa8vHYBTpTH6Wj6ZD95/b/ZFn6/TSi+DoVO2OlupZpMs6GKEE9nBQDmDpM
         slnm8TVgabAoAt+rLwMg+0oZmd1Ds88p3za1yIxrdWEQ3Q0g/7zrp0S26R7kkQtTU727
         0cver0PSZ9JwDoc5+sUzRrX6+va7fn/mLdXloWVNxd0I9TTs4vSmiO5Y7JcMu2GMqjxT
         abKGOG1izwCH1QdwfDb20G3mVvneSR3yzstofTmB8lTMHtFsyBbu6CAOPzhnGHMgt26X
         kLJHzdGoEuW10DIe6rMn1ZSMMXFLegom1GIwu2sIdX4EQ1zSX0xSvbVQUvDRStZRgr6f
         IoMA==
X-Gm-Message-State: ANoB5pnpikKppySToroTUA35c6diS62gWsi5PUbUoJ+8/hQpM4gOeYE0
        WG5bk8Aq0fJSSdZcI+ha6eyxYg==
X-Google-Smtp-Source: AA0mqf6Z3EP0FVuJ9aPL1X1LLxeikpzpLlGGOwb5PJeZpFwguYvehqnlLzh4Sgf96Gw0oBTMiv8iUg==
X-Received: by 2002:a92:ccca:0:b0:300:e8df:4901 with SMTP id u10-20020a92ccca000000b00300e8df4901mr16927674ilq.10.1671152479106;
        Thu, 15 Dec 2022 17:01:19 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id r9-20020a92c5a9000000b003039e7d680fsm270394ilt.11.2022.12.15.17.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 17:01:18 -0800 (PST)
Date:   Fri, 16 Dec 2022 01:01:18 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alex Elder <elder@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, agross@kernel.org,
        quic_sibis@quicinc.com, elder@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: enable IPA in
 sc7280-herobrine-lte-sku.dtsi
Message-ID: <Y5vDXm4oo2cn3etX@google.com>
References: <20221215224552.1232449-1-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221215224552.1232449-1-elder@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 15, 2022 at 04:45:52PM -0600, Alex Elder wrote:

> Subject: arm64: dts: qcom: sc7280: enable IPA in sc7280-herobrine-lte-sku.dtsi

nit: that sounds as if IPA wasn't enabled previously. It would be
clearer to say something like: "sc7280: only enable IPA for boards
with a modem".

> IPA is only needed on a platform if it includes a modem, and not all
> SC7280 SoC variants do.  The file "sc7280-herobrine-lte-sku.dtsi" is
> used to encapsulate definitions related to Chrome OS SC7280 devices
> where a modem is present, and that's the proper place for the IPA
> node to be enabled.
> 
> Currently IPA is enabled in "sc7280-idp.dtsi", which is included by
> DTS files for Qualcomm reference platforms (all of which include the
> modem).  That also includes "sc7280-herobrine-lte-sku.dtsi", so
> enabling IPA there would make it unnecessary for "sc7280-idp.dtsi"
> to enable it.
> 
> The only other place IPA is enabled is "sc7280-qcard.dtsi".
> That file is included only by "sc7280-herobrine.dtsi", which
> is (eventually) included only by these top-level DTS files:
>   sc7280-herobrine-crd.dts
>   sc7280-herobrine-herobrine-r1.dts
>   sc7280-herobrine-evoker.dts
>   sc7280-herobrine-evoker-lte.dts
>   sc7280-herobrine-villager-r0.dts
>   sc7280-herobrine-villager-r1.dts
>   sc7280-herobrine-villager-r1-lte.dts
> All of but two of these include "sc7280-herobrine-lte-sku.dtsi", and
> for those cases, enabling IPA there means there is no need for it to
> be enabled in "sc7280-qcard.dtsi".
> 
> The two remaining cases will no longer enable IPA as a result of
> this change:
>   sc7280-herobrine-evoker.dts
>   sc7280-herobrine-villager-r1.dts
> Both of these have "lte" counterparts, and are meant to represent
> board variants that do *not* have a modem.
> 
> This is exactly the desired configuration.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>
> Reviewed-by: Sibi Sankar <quic_sibis@quicinc.com>
> Tested-by: Sibi Sankar <quic_sibis@quicinc.com>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
