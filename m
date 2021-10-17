Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38238430A33
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 17:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344082AbhJQPdy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 11:33:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344079AbhJQPdm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 11:33:42 -0400
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A857C061772
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 08:31:33 -0700 (PDT)
Received: by mail-oo1-xc31.google.com with SMTP id r4-20020a4aa2c4000000b002b6f374cac9so754354ool.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Oct 2021 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IIAVHwexbMKhrI7FMZ1CTcUKEaRKC2WFDIr4wjA9dyM=;
        b=bQdY43ATH2AnaTJzC83o8Ib3eHA2zChAc6yOdTe6pdC+MVQ/Radhbs3cwOTVH/hYWI
         RcmD4j9J5d1EWrdjM7bZ6AJbSurxmzaDnDwVasgTI3yWYjRpmOd6TsLJfp7KN3nlgWmZ
         BEt9vrasPFdbZRHjsC1JAk8dv5Vj213Zfuc6BX81IWJ8uxuuk8IlnYs1SLoDOsgEZQ8y
         6IA1KaH8HVf1GWpvNgSo2exBaAU+6Q5aQRcKVdPlCvxJ2yTf+xLKqh7eZjITD/3kda6h
         fuhEfGOUByVq0cNHdPGAIFQBvwT/BdCNndH3XO3yNc1dfTbcCpcQkCuDtexjIYJa+lLD
         gkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IIAVHwexbMKhrI7FMZ1CTcUKEaRKC2WFDIr4wjA9dyM=;
        b=M0bye/niiTw+1tGrn7D0765L6APNvOmQAUj4zTRy90alWu7OiO6QfEDpi7gW2gI3g+
         67AZyFfxqnC+ahQu/W2sq0cqzNrRanDhvTrXIENQF08o0L0UUAcF7qLOvFkirDm8SAa8
         eRkCe7AsmeuUjwbCKAgDH62nPzTE12yBgoNxuj0PoOoAfVhraNQui/ysGuur13hfpFh8
         WZ2f2DDfmmvgMZJHT+T9cRIDAliDkMkMuElqIt6ik5ylWY2tW1exhsximZakWNWq+6t+
         q2/aGg6Ms/r36SeWlPDYU4FMy6rVETExQE4Q9ZwasFFP9lRH2FrsmDFKkke/VN5rjnMQ
         NcJQ==
X-Gm-Message-State: AOAM533Sd7uacVYTdGicQFZa5PH9GAdNcyxfBPZ4A5G0wg3+znsXXlMx
        utJTsduwQJv9UizZZWxnic0T+g==
X-Google-Smtp-Source: ABdhPJworGe7fs6gl6skg45o+ZKw6EU9Ggscu/3Ure3gpGHUHFi0fean+cLXjYw8B0pOGryGOH6pHQ==
X-Received: by 2002:a4a:d099:: with SMTP id i25mr17637290oor.86.1634484692561;
        Sun, 17 Oct 2021 08:31:32 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id x6sm2565698otp.49.2021.10.17.08.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 08:31:32 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH] arm64: dts: qcom: apq8016-sbc: Clarify firmware-names
Date:   Sun, 17 Oct 2021 10:31:18 -0500
Message-Id: <163448466184.410927.17405938029703984127.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922195853.95574-1-stephan@gerhold.net>
References: <20210922195853.95574-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 22 Sep 2021 21:58:53 +0200, Stephan Gerhold wrote:
> Commit 0f6b380d580c ("arm64: dts: qcom: apq8016-sbc: Update modem and WiFi
> firmware path") added "firmware-name"s to the APQ8016 SBC (DB410c) device
> tree to separate the (test key)-signed firmware from other devices.
> 
> However, the added names are a bit confusing. The "modem" firmware used by
> DB410c is actually a simplified version for APQ8016 that lacks most of the
> modem functionality (phone calls, SMS etc) that is available on MSM8916.
> Placing it in "qcom/msm8916/modem.mbn" suggests that it supports all
> functionality for MSM and not just the reduced functionality for APQ.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: apq8016-sbc: Clarify firmware-names
      commit: 2533786f46d074d67a4bca04c2d44d3825594415

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
