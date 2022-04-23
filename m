Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD64A50CC26
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Apr 2022 18:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236312AbiDWQGw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Apr 2022 12:06:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236309AbiDWQGu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Apr 2022 12:06:50 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EF586D84A
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 09:03:51 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-e2fa360f6dso11768260fac.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Apr 2022 09:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kiQ7pNVCwMoD8UhW1h8c0W/HM8M+Z96+QSOjzXB6Zh8=;
        b=bbBts4pyM5DBvYrxS03Tb1lopiKXaVL+TB4i++J9cvFH8r5Xs7cJHp5aQ8azsTgrYW
         F2spkeazybQf0gH2AGJtkesbQyyuwK4+1EdhPJlfaUKYFhNKtA6wH4Vd+mdGWkdSfZEc
         h0qR4MKFR1RStQ+DPgtKf4C3V/sA11HFbXl/D/UjtXcpGT2fG6NsgSXYXZ/7o1KKBu+H
         nU2n21lFq3LjRgT95nwQrEm9JdzsXPgZwUgW7xcIXvRTYJ8UdqlzeqdrKVxoYtmGTcgB
         96Gk/MNxTlf/Sj60gTy+fLXmzNeCpBUPUcZ/hEngZ+wP76nChhSkZ1y7crSKgDrDXase
         Jg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kiQ7pNVCwMoD8UhW1h8c0W/HM8M+Z96+QSOjzXB6Zh8=;
        b=5G2Cdq0odgFbeyA+CX9YG98ZPa/dswRkuFWM6dE5SbOqPqZGroNbXRQ2LSIKBIWXBD
         1zoXHfByZ1AOAkjqhLYj0/7C0rFEVpf2Ows4+O/4cM9Cbw7Am6jsTDCx04yg6tXSaLrk
         1ISvkV1Qx7AqZrl5FUX1c7YGH6gR2Sa0yfb4D8JpSa/SfxD+GW2X5twgib1K1s9mDdO4
         u8Yh1s96wx7LnSSfPl6v94C5bfhVvpT3yl8X7hx1vEwlvXV7gGhRnTY3B/WBKwRezHsd
         ryapRWn9aE5gk8AaWqcWRfsDWBaVhBCvU5DULbC+7MGQ7JRGxCkFGHS/uYgYdVfrTQUJ
         xNPg==
X-Gm-Message-State: AOAM53074xRJj8t17HwniT5nazRePDCi4OnLu4tASa/ef+hsgjzEIJo4
        loXGn3EhgZpha5btBq5R6ydrgQ==
X-Google-Smtp-Source: ABdhPJxnuRoEHn6QY41T+WHqV1LPnRyzIM3MyGxzzJsipFPvVkTNAWh6Iw4ALZoSKzpOQJ2vsY12Ig==
X-Received: by 2002:a05:6870:e2cc:b0:e9:1b15:67b2 with SMTP id w12-20020a056870e2cc00b000e91b1567b2mr1031379oad.1.1650729828545;
        Sat, 23 Apr 2022 09:03:48 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id c9-20020a4a8ec9000000b0032438ba79b0sm2123856ool.0.2022.04.23.09.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 09:03:47 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sc7280: Add GPI DMAengines
Date:   Sat, 23 Apr 2022 11:03:44 -0500
Message-Id: <165072980563.2810336.11475780956462186636.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220421115526.1828659-1-vkoul@kernel.org>
References: <20220421115526.1828659-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 21 Apr 2022 17:25:24 +0530, Vinod Koul wrote:
> The Qualcomm SC7280 has two GPI DMAengines, add definitions for these.
> 
> 

Applied, thanks!

[1/3] arm64: dts: qcom: sc7280: Add GPI DMAengines
      commit: c11e239f6aee32e20718dc3cf5349894d0e994ec
[2/3] arm64: dts: qcom: sc7280: Add GENI I2C/SPI DMA channels
      commit: 18bec7f725c5184f7c5b2a404602dd95f630d4d7
[3/3] arm64: dts: qcom: sc7280-idp: Enable GPI DMAs
      commit: f238ff81e8946540e1a7c1496aa92fa2386893dc

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
