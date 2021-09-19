Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3EFD410942
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Sep 2021 04:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233843AbhISC0p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Sep 2021 22:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233783AbhISC0p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Sep 2021 22:26:45 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C3FC061757
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Sep 2021 19:25:20 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id k23so9609369pji.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Sep 2021 19:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=3gbl2yzkQu7L+icNkfJbGUqsLbJWtBfEFCodA9LbImA=;
        b=LpklsNse301jCHq/7B+k0jmtuEZNV0RM+ni0rexYRD+FSFrLkmUy5vjBV3AlnKCKev
         qqeRsw49XvZaV2zyziNXQZE9YT7fE/IZTsB5/GV8edCJWiJyDACsNNp5pYS8xMvjE3qK
         CQsrlXI5aI30fzdAXNaD0Nv2kbK0cKBAjzBKuXqERnjotPksaxvfstwjbiG19Lo/6A/e
         QWbjJpkD6lD78GkY0uXhYlDKfeBZAIRiaEqeUeiLzeG5FWTB8ZpW/v+wttD/LNQCxs0g
         WTEhjd9XD6Y226QfCndVK2l1Fdj4fyeqvg400jS1rF9ojkVcTfJ7hkCa2lb7vcsrH3H5
         AlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3gbl2yzkQu7L+icNkfJbGUqsLbJWtBfEFCodA9LbImA=;
        b=iGo2bqhfXX20gvnm+RsbKc9EHci38VOFIopbnpUY7005ZHG8yhuqBCvsAAkuTgm/zK
         fN4R+zZKy7vp8UHfCGZjcJKUK7OALD4PWq2HzYHFLMc+tiy9pNRXl/LXDdBBgTOxinY6
         D/6TzcMNxksYh/8WB9SWcik13Xj6YGLGEtQNv2Kp2H0MquJ2WGLo6bDRSaMvwVYP+Uoe
         58BdkzC28b21LhipwNhyvtK6cokqi/zsdxf+qliBA7sgYw/Cwd4gIq0kReeCAy9VTB0R
         GbQ4MDu3r0SVNoJHhJyI476KZdww1y/DjHfYpHBCdPBbyGTMLyoxmBsOv2PY7YoSoMCT
         kANg==
X-Gm-Message-State: AOAM530n1IQYEO0Du9iEwdfzfoVL3GIq+8qd2VmyQ0smUd+BsNh7Bi+4
        5wn9ye/ONZPalDVdCoHJcSLRNw==
X-Google-Smtp-Source: ABdhPJylIOCCQPEMbvyIRzpDWWhmvq24HIRNAwNbsYaessTyp+YIh5fyLXEffBxESRHaPAIueZfKyQ==
X-Received: by 2002:a17:903:110c:b0:13b:7cb8:fbc4 with SMTP id n12-20020a170903110c00b0013b7cb8fbc4mr16653167plh.72.1632018320275;
        Sat, 18 Sep 2021 19:25:20 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id z123sm3687554pfb.166.2021.09.18.19.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 19:25:19 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] clk: qcom: gcc-sm6115: Fix offset for hlos1_vote_turing_mmu_tbu0_gdsc
Date:   Sun, 19 Sep 2021 10:23:08 +0800
Message-Id: <20210919022308.24046-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It looks that the offset 0x7d060 is a copy & paste from above
hlos1_vote_turing_mmu_tbu1_gdsc.  Correct it to 0x7d07c as per
downstream kernel.

Fixes: cbe63bfdc54f ("clk: qcom: Add Global Clock controller (GCC) driver for SM6115")
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/gcc-sm6115.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
index bc09736ece76..68fe9f6f0d2f 100644
--- a/drivers/clk/qcom/gcc-sm6115.c
+++ b/drivers/clk/qcom/gcc-sm6115.c
@@ -3242,7 +3242,7 @@ static struct gdsc hlos1_vote_turing_mmu_tbu1_gdsc = {
 };
 
 static struct gdsc hlos1_vote_turing_mmu_tbu0_gdsc = {
-	.gdscr = 0x7d060,
+	.gdscr = 0x7d07c,
 	.pd = {
 		.name = "hlos1_vote_turing_mmu_tbu0",
 	},
-- 
2.17.1

