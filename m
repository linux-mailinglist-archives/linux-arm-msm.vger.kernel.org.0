Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA154C372D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 21:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234520AbiBXUzG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 15:55:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234517AbiBXUzE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 15:55:04 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED1922763C9
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 12:54:23 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id q5so4927318oij.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 12:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/3ZWb0FFekjw2ibTg4kgWEENRK4hlj+NVGjtAUq3CDw=;
        b=Npzj+JuGADa6hvnfHwXDXW0iEuRsaI9pHWwav0O/98KAgTkhK7QNXdzuWvbWxbSapL
         6puIbuu/3Cj4o0G24Bg8a0pbvGWiCq2F5fmAkyF1sv6xNyB8oKtNx6RZaPCwCZ8xKRiE
         EAv8BWwriy7lRWcz3QdQSFsGkMcEDDQ0ssUcakIinriD3NB/KkRIBAYaw3wCkeG0bjV7
         46wfb2hcsnf5mo1HHjM9oUc/UlK//cEmzJpSS8khG789j2jy4SlditAbIG1f7ZQpVmwN
         laMX5sAS9b+aDA3Gua+n1S8M4uU7fmfN9msYvv8yL1sqP7z9UFdTTSqnLYLr8JALhoQz
         I0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/3ZWb0FFekjw2ibTg4kgWEENRK4hlj+NVGjtAUq3CDw=;
        b=NbNkdt69p0Hxyp+IH3Dz1VgAlrQSRRKv0svY6ZlSx6dYJf88TGKeU8SA2GJQwBnxh6
         JaJQ70kngd00e01xbLHp6DCJElwvUQNlDnL2uvCXKPaC6gCKoDRwBnQ07EzG/tg55QMa
         46wrf1EvoDTkmGReE7xyNCsHmkrhHQKQ8qO2EekZHfDG0YXbnXtzOrnx4ODdnBlx4nT/
         JKILjvp8CcBmACWlJl5p72rcktvRrp74pGMDA8msxhmoz1QULpUBtXfP/eIvEkopefJK
         vPJIUIxJSpHRGWbAa0o91XsmsRbq9ryWIuFS+OKn3DLgfAr3lJY9IXPGC8JK+TyyJfH0
         ordw==
X-Gm-Message-State: AOAM533GMlodiUbS7IUqDiXX0jg6HbOGtxiCmB1CNXBI3h5odFnwsMOL
        BR9Ac5m5FNZoSKgZG+z4Kce9vQ==
X-Google-Smtp-Source: ABdhPJyW4ku0RVOGMXgzI0YkQYBw1UnrD3vG+zyhcVK/D4KzrVzVIcBTyT3SpMwcEAIrWTKTIhsyaw==
X-Received: by 2002:a05:6870:d78d:b0:d4:4b29:7ccc with SMTP id bd13-20020a056870d78d00b000d44b297cccmr7303374oab.69.1645736062618;
        Thu, 24 Feb 2022 12:54:22 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id c8-20020a4ad788000000b0031ce69b1640sm191259oou.10.2022.02.24.12.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 12:54:21 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     absahu@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, Robert Marko <robimarko@gmail.com>
Cc:     Dirk Buchwalder <buchwalder@posteo.de>
Subject: Re: (subset) [PATCH] clk: qcom: ipq8074: Use floor ops for SDCC1 clock
Date:   Thu, 24 Feb 2022 14:54:07 -0600
Message-Id: <164573604161.1471031.12357402278173909256.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220210173100.505128-1-robimarko@gmail.com>
References: <20220210173100.505128-1-robimarko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Thu, 10 Feb 2022 18:31:00 +0100, Robert Marko wrote:
> From: Dirk Buchwalder <buchwalder@posteo.de>
> 
> Use floor ops on SDCC1 APPS clock in order to round down selected clock
> frequency and avoid overclocking SD/eMMC cards.
> 
> For example, currently HS200 cards were failling tuning as they were
> actually being clocked at 384MHz instead of 192MHz.
> This caused some boards to disable 1.8V I/O and force the eMMC into the
> standard HS mode (50MHz) and that appeared to work despite the eMMC being
> overclocked to 96Mhz in that case.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: ipq8074: Use floor ops for SDCC1 clock
      commit: b77d8306d84f83d1da68028a68c91da9c867b6f6

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
