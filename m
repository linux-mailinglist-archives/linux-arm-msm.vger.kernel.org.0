Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3D11E02DA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2020 23:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388075AbgEXVGY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 May 2020 17:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387848AbgEXVGX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 May 2020 17:06:23 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B96C08C5C4
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2020 14:06:21 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id s1so15951418qkf.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2020 14:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SMexMeVTm63rHWx/JVuuK6vnjusS2CuBaYCJ1ubsUHs=;
        b=1JKePdYirIa/xYzsH6LsSwNwjA8gJbjzNc7twg6f8DPN18cwtCA0vArVBxSyKrzwOC
         XthO7qIO9vA3RRN3+tojwHCBG3t4z91tLS3NrsK5lpW8vBxOxJzGilyhdUhBY0t71RJU
         3pexLHsPLP4NpTXHLh/ubZgFq9a2lOEsA/TWToMLuIz4OJvJ7PWqmkmMaAY5IcOUnhRE
         0RqhdMSxjwtOhO3MvBo+sWzrl+zpdaU2cwGm3NYWWifV37GcJmcwWSREd0fK73/9hd++
         AshtWVMEBdZ/VNo2ubWltFpFL7Tc0M0ARizZIR/YVghoNsF8IRHTZmsl4oBQk2piKgSW
         ohbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SMexMeVTm63rHWx/JVuuK6vnjusS2CuBaYCJ1ubsUHs=;
        b=LkxkR3Bd/82s35M08/oa0DOiJkbw/cfqK6O/qztqHj2O4IS/P+1/qMHWaSnkzlcOnR
         Cj00V2rnYKhIrdLruX3NDO+Ndj+YdlHvwl25L6rQhXf0TySjoBIJIz2mEh64cw6Eu4of
         NxryT+P/VaqeOXYoHFOKt8kqLUrnJBy2QAhsjng2aXWsOuYx0yiTMKIJwIdn/3JImbgl
         AY8LYcVBp+OCILtejp6dwBKD0KXZ7HTWsTX+WrXisKSEuxygmfRGt0Ud7kAYBaV0hZ3G
         OrqsvgIJVJI2I8Tl/abS1CguClK3xxlalR3t1hwMEhfRkcBTKE0f4ZUyEtWM7nkvvD6k
         X26Q==
X-Gm-Message-State: AOAM532Nu3np3b/MB1taJyJI1dvCmKgTlWwQ+r+t4Pu7ai3KMyxWqHWC
        5DusF7PuS4YCQ9fcQdhNSsxvbKqbETg=
X-Google-Smtp-Source: ABdhPJwi1NS9dgh+AnJIWhS0n3NdreA/ALo8O17bbkZnccp0vKqKC9yFbnoRSvMemCoMX3c5YyruMA==
X-Received: by 2002:a05:620a:a53:: with SMTP id j19mr24845844qka.183.1590354380991;
        Sun, 24 May 2020 14:06:20 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id g51sm4401769qtb.69.2020.05.24.14.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 14:06:20 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 01/10] clk: qcom: clk-alpha-pll: remove unused/incorrect PLL_CAL_VAL
Date:   Sun, 24 May 2020 17:06:02 -0400
Message-Id: <20200524210615.17035-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200524210615.17035-1-jonathan@marek.ca>
References: <20200524210615.17035-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

0x44 isn't a register offset, it is the value that goes into CAL_L_VAL.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/clk/qcom/clk-alpha-pll.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 9b2dfa08acb2..1325139173c9 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -56,7 +56,6 @@
 #define PLL_STATUS(p)		((p)->offset + (p)->regs[PLL_OFF_STATUS])
 #define PLL_OPMODE(p)		((p)->offset + (p)->regs[PLL_OFF_OPMODE])
 #define PLL_FRAC(p)		((p)->offset + (p)->regs[PLL_OFF_FRAC])
-#define PLL_CAL_VAL(p)		((p)->offset + (p)->regs[PLL_OFF_CAL_VAL])
 
 const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 	[CLK_ALPHA_PLL_TYPE_DEFAULT] =  {
@@ -115,7 +114,6 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_STATUS] = 0x30,
 		[PLL_OFF_OPMODE] = 0x38,
 		[PLL_OFF_ALPHA_VAL] = 0x40,
-		[PLL_OFF_CAL_VAL] = 0x44,
 	},
 	[CLK_ALPHA_PLL_TYPE_LUCID] =  {
 		[PLL_OFF_L_VAL] = 0x04,
-- 
2.26.1

