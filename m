Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E33A4569854
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 04:46:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234699AbiGGCqJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 22:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiGGCqI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 22:46:08 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 677FF2E9E4
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 19:46:06 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id s188so21746831oib.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 19:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4qjFAcplDcRzaa7vJN9whYnjs2tJsJNKANPDFAyYaEs=;
        b=mMMhwZDFTY+3DxkcS0R/YCHlkrht8zPICIofshm7hvjHRFbnb6r23mMel+DKaUR9pc
         PPyFPL0L4HtmipThte3LCOzU35DUCYLnsdS8Nf0tOSu/jEdVmmbnMFtqnuW9wn6WH+i5
         F0nFyxOygItkx36wpyIR55BFR71fLxuhJR7/DWMultyGBY/UM8l7koHKw4zo+PxtAS8x
         eOEt+YSLAdCK8VTBYqF7to/pUxfnGAvDBT99YS4NVSKoCdEQoCmBCrJ7vNWMVEa1lI4M
         QHt9p0unAnG4fB04U6u+zgkoj1dKwxhgKpFQzBgzTVsaX56l274PaBAF3v5C5RQZRZMV
         ZCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4qjFAcplDcRzaa7vJN9whYnjs2tJsJNKANPDFAyYaEs=;
        b=izXUJuB6azkwRF0pSy5Vd8bcgjLMItfXejY2O4ocnEBjfrXqNm37par5SUx8ARXKjU
         JzIddDCImhR6aEgi1HMqHnMAHZzV0GwI7JWFcoS/X8lkl3f7mWD7uaS0h4VfmXCAuggP
         7ADzKbuwzZph1/a6QWwngpgmZAKMqwsGYvtqbvwjp8cENe3E6vgebt1AaKiXnX52+gx1
         xjfAs8h+rNWQRMIliubtfuT+GSXxV/Py3X6G5MEzPBLYhoYw/jfeA47LE2KtvwXtfZhl
         pOnlVErlt4Od2+5L5AXGISBTvmCNFYTir5oKPoW8gybTUlM51+K6IcneqrYUFMONLofc
         lsPw==
X-Gm-Message-State: AJIora/86Q2VvlgZwjLOLhp1FL/0JI4pLju+qUZ8cgADErW1uDK+zYKU
        QWXmT0fUdqIuv9YVyYQ6Yyvxuw==
X-Google-Smtp-Source: AGRyM1s24yL2hO/WFK+l/XqF3QQOrWXELrYqGXqtlUnFQvUq5NfNLy2D/i3vE87t6icTfaR82jpIrQ==
X-Received: by 2002:a05:6808:23c4:b0:337:d77d:de75 with SMTP id bq4-20020a05680823c400b00337d77dde75mr1081032oib.133.1657161965795;
        Wed, 06 Jul 2022 19:46:05 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r6-20020a056870580600b001089aef1815sm16450814oap.20.2022.07.06.19.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 19:46:05 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, swboyd@chromium.org,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] Revert "arm64: dts: qcom: Fix 'reg-names' for sdhci nodes"
Date:   Wed,  6 Jul 2022 21:46:03 -0500
Message-Id: <165716195971.869883.14805700295899187397.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220706144706.1.I48f35820bf3670d54940110462555c2d0a6d5eb2@changeid>
References: <20220706144706.1.I48f35820bf3670d54940110462555c2d0a6d5eb2@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 6 Jul 2022 14:47:33 -0700, Douglas Anderson wrote:
> This reverts commit afcbe252e9c19161e4d4c95f33faaf592f1de086.
> 
> The commit in question caused my sc7280-herobrine-herobrine-r1 board
> not to boot anymore. This shouldn't be too surprising since the driver
> is relying on the name "cqhci".
> 
> The issue seems to be that someone decided to change the names of
> things when the binding moved from .txt to .yaml. We should go back to
> the names that the bindings have historically specified.
> 
> [...]

Applied, thanks!

[1/1] Revert "arm64: dts: qcom: Fix 'reg-names' for sdhci nodes"
      commit: 21857088fa274750608e25b44ededa6199fac4a5

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
