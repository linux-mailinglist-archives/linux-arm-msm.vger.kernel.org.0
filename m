Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63BB75B82DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Sep 2022 10:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbiINIYK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Sep 2022 04:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbiINIYG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Sep 2022 04:24:06 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52494606A1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 01:24:02 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id l12so17310256ljg.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 01:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=V1YVYSsl5D5EOMmP45EuuB6/EETaN2F4Y3Yv5mQzyP0=;
        b=v4wytsxa48nEgAD91g/pZa596RMNquTq15IEhMx7xp5Q86y6iY/DNPspO8hxsStsMO
         rVeIVf4fsNxkJDdeqwFz/CPf5gVvDPfJKsUHKUoJzBaS7BXlvb14wNvYcQjMVjsRiEKB
         soEnc+muFJQn69YRy8oxblBk0e6E2cfFYp6wU9EGMdbC0A1YWZH5drhyw2WA3IU7lX8E
         5uLq31lNxu1JKyVDYkwYmjWKIGVKuKnu8/lqaHy9qDEzPGWDn7sokhn2DtTgw/VJRH8X
         AslAlzM1JQish00MRTcHJUO6Vezfq6aQIgB0Q/Lf3objanuKxNo+waDhbqR+Y+ScYhiu
         +m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=V1YVYSsl5D5EOMmP45EuuB6/EETaN2F4Y3Yv5mQzyP0=;
        b=griUXVOeeir6SzyL1SzGR/go3ytUj8LUr9dLh4EFXaqiz4YN0+lhNmrpgnTsTaYtew
         PBfKtFGLiuhPXIwSHrdXOtcd8scFwt+aBQG//9gdC4N5hAbY9UZZgA2L1JxHf3nR/Q4w
         DJ8nDMJhf35XuKlPyX2NYQeGxGQPw25x7rf6Wtt0SW01DuzDgpLimUTv+S2tEVbfPJHO
         MNV1QT4fAJg0JupSrDlaZtlG+rTWGn48+lKgHMcK76QLSGEudF4SIByetxImShkN0Lok
         7DXQSCKvzaGJ9/7jph1E/gGsMsXDivlTL+lCBrSYRl+S+6aspQkHXJkLlBFfYRUNdxGT
         qPYg==
X-Gm-Message-State: ACgBeo11Q0KGeEL2QoOa7yIqA9WWvtCZPpvnyjF4e38lN/0MeZF+Sm/r
        ZhPi7Ad0BWTn/5OvHmLukpKlQQ==
X-Google-Smtp-Source: AA6agR5rklM6tu/ivEH7rZ+xthwXKKqcvkr4NjOV71oLH8VLbJajXjeCDpCBdloTLPGCpTf6RlEz3g==
X-Received: by 2002:a2e:50b:0:b0:26a:b7ec:59ea with SMTP id 11-20020a2e050b000000b0026ab7ec59eamr10910287ljf.312.1663143840708;
        Wed, 14 Sep 2022 01:24:00 -0700 (PDT)
Received: from fedora.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id o10-20020ac25e2a000000b00497a879e552sm2113647lfg.291.2022.09.14.01.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 01:24:00 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 5/5] ARM: dts: qcom-msm8660: fix node names for fixed clocks
Date:   Wed, 14 Sep 2022 10:23:58 +0200
Message-Id: <20220914082358.350971-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909105136.3733919-6-dmitry.baryshkov@linaro.org>
References: <20220909105136.3733919-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> Fix node names for three fixed clocks to follow the
> no-underscores-in-name rule. To remain compatible with the drivers
> expecting to find the old clock names, add clock-output-names
> properties.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
