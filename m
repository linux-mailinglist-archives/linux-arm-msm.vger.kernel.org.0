Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8098E7124EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 12:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236934AbjEZKkE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 06:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243219AbjEZKjz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 06:39:55 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 493A119A
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 03:39:50 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f60b3f32b4so4066465e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 03:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685097589; x=1687689589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K5qc+6R+4cg++tOBhrk8VJFcNLpwxweUmH8mmAsqivg=;
        b=ug3+0aca7Ve1E4V3g5YqDWH2Rah4zTe+KtqBd1PONpb0KkyolG2e7f6ABfRTn3y5MF
         /PD3ZAeIs7N0KQ60SO/4iOboLj9TCqEThEF6l7g6n8XOeRQyVvHtdfzfqNtmHmzSBmH8
         OaUC8CbKV7nubP73c45rRrUk18BH8HlTTWekV8vghWwSSBS4/spvFwqxFy8C1i/okZg4
         sALQTgK3P51sCJxOit9k147V8wGaIQ43zEY2oluGz3taJwDKAFV/nBuBIvC2o8KypGrb
         9cwysltv7H4IQP2MhLQwuFQ6fvIIbNtecX+nNVUieULj3JrAUBaKt+7QktPmgmy8zN7/
         dhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685097589; x=1687689589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5qc+6R+4cg++tOBhrk8VJFcNLpwxweUmH8mmAsqivg=;
        b=CKZ0GF9ktBhkT32CgFcRiGoa662SNIwX3XReD/1elRwhvJ0r4PKGBdQyhhLr2hnMlp
         NOObvySBopM7We/5DIMgehF1+BfYnq/7BOBztXp/3kcq4WulopQtBUIZnizPwilrDdlH
         6vDbmUUadroCyhvQLFqS0+US8xLyY3CVSyAODKs5g3Bx1SLHMD6+viYqGTWAB6IkrBfG
         bMOa5/j+A/JOey1clGs7PIuUyG3SMVOvzgQ3ZbilEatw2uNI1pcsiK1PJyiVq5vjTMvo
         lPJ/0iGgrt7u348UFLzRh1VuKAvr7Rruvx3xgJdyJwOzG28McjM7j0GruoBD1VaJ+c8y
         2yeg==
X-Gm-Message-State: AC+VfDzfXL6OTgUxVCkAvjpqv4iudK77nINaDworW3CJPv01IQ2BegTM
        nvPgzfa4RT7pPYZnmbIB3Kg8dQ==
X-Google-Smtp-Source: ACHHUZ5bWuN3xO60xxeTu2/pEznSg52lRAzP05K3isPLI5aCV5M4pSup4e5FJ7O05LEmuOVeUmWaiA==
X-Received: by 2002:a1c:7914:0:b0:3f6:e73:ef1d with SMTP id l20-20020a1c7914000000b003f60e73ef1dmr1240678wme.18.1685097588747;
        Fri, 26 May 2023 03:39:48 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id l18-20020a5d5272000000b002fefe2edb72sm4638660wrc.17.2023.05.26.03.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 03:39:48 -0700 (PDT)
Date:   Fri, 26 May 2023 11:39:46 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Artur Weber <aweber.kernel@gmail.com>
Cc:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Helge Deller <deller@gmx.de>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Luca Weiss <luca@z3ntu.xyz>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-pwm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v2 4/4] arm64: dts: adapt to LP855X bindings changes
Message-ID: <20230526103946.GG626291@aspen.lan>
References: <20230519180728.2281-1-aweber.kernel@gmail.com>
 <20230519180728.2281-5-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519180728.2281-5-aweber.kernel@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 19, 2023 at 08:07:28PM +0200, Artur Weber wrote:
> Change underscores in ROM node names to dashes, and remove deprecated
> pwm-period property.
>
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
