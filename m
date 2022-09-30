Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C42065F0BB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 14:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbiI3MZV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 08:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbiI3MZL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 08:25:11 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C2C24952
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 05:25:08 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 10so6635487lfy.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 05:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cpELwLH0ZI8nf8G6yup16pe7jJbK/KtXSjKlemf7AuE=;
        b=QvtaGExpFqrCLYIejt1fpOhjf48kveGEnztdBBxRkxBAGaSaks2SycKwtqgbbfEiAZ
         2eXpopb8TGXJCW/kSH5k5BjqX/PtDm/4Dcd9wDzmdwwUD0aLvSeLcffYRmqfqvqhtrv9
         Imr8TvqcbNPVaPmlsn/k0BpFsJAHbDzfsn0Kem33PEKWeeS9VQujk69jZ1k/qK3tdHTJ
         MrZg3TK2HOLP8BSwTMmqB1jBBXwz5ei99T3BiLsq4JCFPHwGiGXk1lG9N1dIKICDbVS6
         W+nyz+LEs2CCr+SyqLesU+5E9JyK20m4yIBpQ1zsqsZWfxpoKT6/3RGxGti0uV/g0m6m
         +fzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cpELwLH0ZI8nf8G6yup16pe7jJbK/KtXSjKlemf7AuE=;
        b=JdR+Lc+2WuH/Fib5lXMDV040/8+H7F/57bW//UMAdlRpu40Vh17nPOWRab7qCCmVMX
         cWzpxlOC6u384JI98zxQ900LvEZ1P/il4cnmu8y83SSh5n70pdgXzGIFFjj4xv9j46MH
         UXTKIj+L/XICap22D6Yn/PYUSLsHQF9j7WWQOMZgXaEJ4KupB9M9VyIDprxaTUxgVK8z
         HzL6csrkWCUHbEyKey+RqMy/Y9rN1n9tblK+HC/H+TtZD4i7H2GMg7sd0ewyX5GUTZ0K
         LEvqIiYrCxEeryiCHvZ9GZatOi7Tll8RpJl9c8cLqfhNaNmZoKvttNIgh9IEU2Gmj/mF
         F06Q==
X-Gm-Message-State: ACrzQf0h28ia/ziyL8uDHP4/lOzhnuoPA5BplZ/htdaFldcthdaHfBRI
        Ygq9a05GRCIDjIJ+xi5EV1A6EQ==
X-Google-Smtp-Source: AMsMyM5TFdaOyMs0noMLGTfM7Rjvv6o8ypJkhwFseJiP/YIfg4gGI14+wfR1DzTFlevbnPO6wwQ5Xg==
X-Received: by 2002:ac2:4bd0:0:b0:497:abfd:3572 with SMTP id o16-20020ac24bd0000000b00497abfd3572mr3062160lfq.200.1664540706943;
        Fri, 30 Sep 2022 05:25:06 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id i12-20020a056512318c00b004a031805c8bsm282968lfe.106.2022.09.30.05.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 05:25:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Opasiak <k.opasiak@samsung.com>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: (subset) [PATCH 1/3] arm64: dts: exynos: fix polarity of "enable" line of NFC chip
Date:   Fri, 30 Sep 2022 14:25:03 +0200
Message-Id: <166454069282.276470.16158572411298373751.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929011557.4165216-1-dmitry.torokhov@gmail.com>
References: <20220929011557.4165216-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 28 Sep 2022 18:15:55 -0700, Dmitry Torokhov wrote:
> According to s3fwrn5 driver code the "enable" GPIO line is driven "high"
> when chip is not in use (mode is S3FWRN5_MODE_COLD), and is driven "low"
> when chip is in use.
> 
> s3fwrn5_phy_power_ctrl():
> 
> 	...
> 	gpio_set_value(phy->gpio_en, 1);
> 	...
> 	if (mode != S3FWRN5_MODE_COLD) {
> 		msleep(S3FWRN5_EN_WAIT_TIME);
> 		gpio_set_value(phy->gpio_en, 0);
> 		msleep(S3FWRN5_EN_WAIT_TIME);
> 	}
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: exynos: fix polarity of "enable" line of NFC chip
      https://git.kernel.org/krzk/linux/c/bd1a665a01b4d65fd8dc6fece4b376fa5c8c55bb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
