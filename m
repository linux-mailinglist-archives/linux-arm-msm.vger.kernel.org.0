Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07D543E021A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 15:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237660AbhHDNfG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 09:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236799AbhHDNfF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 09:35:05 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35766C0613D5
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Aug 2021 06:34:53 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id az7so2707422qkb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Aug 2021 06:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XSfNtUyU9x/YGEG2BT0B9uxjpaTMgrW+GMW+Gx0V97Q=;
        b=TpJYOKtrBFCaIgXuJrcHTL9EdQQt/csWAYYnG/TNqSXdjlttxf00i3FumuVwQpC/i0
         pyfQyywmeGDkG/1pH3aozxBecjgdjvF+ryY1UQ2NFBsNKqfCflLMbOzmDqL4qk/UYiJy
         js9SGtFIVZ+rhbM66/odc+gGx5HYgIko2j2ShmUO5qJgoiQig132zbESQ5bK//hFwj1c
         oyueGqgnhmdwYSYBk/5UjslheYVPlT9RMCqXz9RHPdBNwNKkkJMZvtt573O0tECXCWV/
         lkmiok0E7LQpt+rvED+wrD/Ln7HahrGdtgWIyvCItrhGEPAK1RFNudkEuAz3/xqjvXiX
         Qr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XSfNtUyU9x/YGEG2BT0B9uxjpaTMgrW+GMW+Gx0V97Q=;
        b=jiCbsGcRsCLl64hwvUz4MMp6P6d4PTVFqwkUYbdKQYcav2EJun+RuONdls99aFI0Hq
         dUrgPBQ8YslpUhflWh6irqA2iF7aD9VsPsLkKbNRk/ihbNZ7HN0gFR0F0wDkBtJk1ZwU
         KU7WLuBTxyFwtG4V/dPgqcYHwK1uPikS434pW4KjC7HwEkOJ1tdtnV9SMgLvFQAIg2QD
         kLFSHIbaCp/0sklM6iUgNdWqTQQbphpmujGPg3lQQZ08IrPlaGPC+h0XYW1+mVqkBit3
         dj5XxHIp1aXA71PeiWkilCkKJusQrIsKFP2Y7d8Gzhhf2lqumZcWFNzEfFG9N+prAcGB
         yqaA==
X-Gm-Message-State: AOAM532asg4mOEuegYLybD2jmnMea+NWkTIM1LwHKw0KNHCB1Dr6e4Mb
        WZoQ/5T2oPd8cjZmhKIZO4QUKg==
X-Google-Smtp-Source: ABdhPJyk5Ylha0tBS0IPdf6k19JH5IiOL/TMwax3CAbXwe5mPVxvRQa2P0A+g9mDDJAgyUrioDgaTQ==
X-Received: by 2002:a05:620a:448c:: with SMTP id x12mr26075570qkp.39.1628084092359;
        Wed, 04 Aug 2021 06:34:52 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id z23sm847908qts.96.2021.08.04.06.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 06:34:51 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     rjw@rjwysocki.net, viresh.kumar@linaro.org,
        bjorn.andersson@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] cpufreq: blacklist Qualcomm sm8150 in cpufreq-dt-platdev
Date:   Wed,  4 Aug 2021 09:34:51 -0400
Message-Id: <20210804133451.2503674-1-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm sm8150 platform uses the qcom-cpufreq-hw driver, so
add it to the cpufreq-dt-platdev driver's blocklist.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index 9d5a38a91f10..231e585f6ba2 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -141,6 +141,7 @@ static const struct of_device_id blocklist[] __initconst = {
 	{ .compatible = "qcom,sc7280", },
 	{ .compatible = "qcom,sc8180x", },
 	{ .compatible = "qcom,sdm845", },
+	{ .compatible = "qcom,sm8150", },
 
 	{ .compatible = "st,stih407", },
 	{ .compatible = "st,stih410", },
-- 
2.25.1

