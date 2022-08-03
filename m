Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38A6B588ABC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Aug 2022 12:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbiHCKpT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Aug 2022 06:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233605AbiHCKpS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Aug 2022 06:45:18 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6008E26F4;
        Wed,  3 Aug 2022 03:45:17 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id b21-20020a05600c4e1500b003a32bc8612fso677576wmq.3;
        Wed, 03 Aug 2022 03:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m8278Hs6Ub3EKMJF6GHEl38sS0VhPP4vdfVJwEcQvvY=;
        b=Cjv3D3SJgeNwX9oRHLovihTb8AsRyqpxlr+x9A+T5AWC07BI5KvyUVLF97fQdRQJVf
         mf9zw/bGLdIG7tQ1wE4fkG565unYDF1Xn/xxZ8/Fwi4+dnQ1/G4LKb/CHSJiiOwcDpfV
         0OLKZIyE4Nge4V3hF3sv+RcODzX5Ymi0uH12f8dYGKIbsX8+Z6EEBgM0nVBX09/l1FvX
         vcR733pkMKZ4QU65SqvcvKG/owSHdftRMljplsovc2yncR/J4IVxNFcmBRZz7Q0FyweP
         Gu4tdkUJY7YCP8laCAtfm9gp6e/pMpgH9a2uG1To8VvMO1vpDgyO6KXAZYotaIvFT3dA
         zIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m8278Hs6Ub3EKMJF6GHEl38sS0VhPP4vdfVJwEcQvvY=;
        b=7gIOBngEzsRgkhbH1/b7+I5hfq4hGkFgXKcADc1TZP7l/aRu+rd5WdvAk7ZDUlJqJt
         sMjDnAk3UR8rl+eJ5HDc3nJzj+JFr5VBdJsM9A4/5JiI/TJoSk3Rq367aV7L17XBgz+6
         mVJhTebTdYnhHdZu7cCmAY3d8FJpnTgVFVLLJ1NYj7xvXPQLVZg7gS3vNtBOYlJIN7bd
         3uEnpjSJ/mbWzH4pB2WaUUpQ92hxumzqYAP/uVFNhSXvcAn/DXMQHMDM8kfbSmJO0xpq
         8uGi22r5twXckM6b/EW7w4/K/EXaIBVz3sG347vjHcm2OBBpTEa7C6qIys2xiV/k5ph8
         JwaA==
X-Gm-Message-State: ACgBeo3/d1cRFcWPrYiZ7TyWVsdXgS55cu+A0jpiZyZ5WbvmspQrTizf
        p7RTWaBy7MGn9EB4sD5Lp8IiCki+qCNF0g==
X-Google-Smtp-Source: AA6agR7Qfl1ygpQk+wsDGvjIMmphX8TDddKZmwv90ZS0evv7n2nA3qK7C9Bnx3Zsc2Gk/9dWcBmImA==
X-Received: by 2002:a05:600c:284a:b0:3a2:ffb7:b56f with SMTP id r10-20020a05600c284a00b003a2ffb7b56fmr2448224wmb.134.1659523515641;
        Wed, 03 Aug 2022 03:45:15 -0700 (PDT)
Received: from ainazi.localnet (p200300d09706d9000384b2cb471c28f8.dip0.t-ipconnect.de. [2003:d0:9706:d900:384:b2cb:471c:28f8])
        by smtp.gmail.com with ESMTPSA id bg7-20020a05600c3c8700b003a3186fa559sm2203463wmb.29.2022.08.03.03.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 03:45:15 -0700 (PDT)
From:   Shinjo Park <peremen@gmail.com>
To:     dmitry.baryshkov@linaro.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, quic_tdas@quicinc.com, robh+dt@kernel.org,
        swboyd@chromium.org
Subject: Re: [PATCH 00/15] clk: qcom: use parent_hws/_data for APQ8064 clocks
Date:   Wed, 03 Aug 2022 12:45:14 +0200
Message-ID: <5883539.lOV4Wx5bFT@ainazi>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tested-by: Shinjo Park <peremen@gmail.com> # tested on Gasio GzOne w/ MSM8960


