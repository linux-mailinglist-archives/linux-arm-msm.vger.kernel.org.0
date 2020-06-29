Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C647B20E3D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 00:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390810AbgF2VSj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Jun 2020 17:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390647AbgF2VSj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Jun 2020 17:18:39 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5FEBC03E97A
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 14:18:38 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id m8so4142492qvk.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2020 14:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fem3XNP+K3JU9MCaDCRGbzpn3Qjj+S6fTPpAXuau47M=;
        b=Tn7k1LrSf6XKp3W/qTgokaoOKLSCFtf27xTvqer3ndaiwop4QHiDEM23VnFfwUDOgM
         XDAR87wg5GP+0k3okcCl+xyT0NeMeaTl5Bakkw7HjqZPrvCWqnx4dXpJMd3DbXs3wMrw
         W9tkaULO5Q45zP8HPcLC+3Puvov43Zd4IZFd2Cna98Rdsmx/SlAn1zq9pHaMvNXt96Sh
         9FuKfOFhkm6kysPox8IfpCLVdfvKqEQ8diFyFkYAZv0bgXtq979BoYthFq/Cu2EqtQhO
         6SRPn08pDCCaRxdc/tVSeEh0yIbtFQu2+nJlENRauG3jRfDxk6um3Ze8fhVEtiNI4KCj
         T7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fem3XNP+K3JU9MCaDCRGbzpn3Qjj+S6fTPpAXuau47M=;
        b=UGV62QTIpneMeCWLch/l4fPaQHbgtzngSoFIFADtp8iJF2te3A2J5VzGMwf/Vf/yo4
         gu+C4PFbFwmF/pot/llvDrj+Ec4cwm6dt6yG30rljiZNsVlKfvwmDGr52rpDkrtIbBTm
         nK75fIXIejUhYX1nV/8WaiCaTENoE/YvN2K5eWr3ZFk+bIBRkv4Xxo9Oopacfzw55RL4
         A9St8QgxdoGgeVVWXjpQvjFjip1PZR5P0JRqto3Vw+JImMFfPEt9oSBb7+3QDiRUuZqa
         2PX6Z4Nv5i/rAZemjL7I9LTFxzY1Qz08zT19BMq5UoU0haeI3ga0bz6k+0Gib0FHsrZI
         qx/A==
X-Gm-Message-State: AOAM530ZOIAo8FPslOVzVcW0j+CRsZbNCtV5++YmhAGql25grdn15dRN
        nS2e8vadmsXaNDQDdHjHZAPD49RD9mY=
X-Google-Smtp-Source: ABdhPJxYmnj3766wz3xNh58qo4J2m0WHk33PlfNR2bMI/LND57nvTL+xKqmU8/aYTiLbBPg0aET2PQ==
X-Received: by 2002:ad4:42ad:: with SMTP id e13mr7374289qvr.89.1593465517926;
        Mon, 29 Jun 2020 14:18:37 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id b196sm1169078qkg.11.2020.06.29.14.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 14:18:37 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v2 02/13] clk: qcom: clk-alpha-pll: remove unused/incorrect PLL_CAL_VAL
Date:   Mon, 29 Jun 2020 17:17:08 -0400
Message-Id: <20200629211725.2592-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200629211725.2592-1-jonathan@marek.ca>
References: <20200629211725.2592-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

0x44 isn't a register offset, it is the value that goes into CAL_L_VAL.

Fixes: 548a909597d5 ("clk: qcom: clk-alpha-pll: Add support for Trion PLLs")

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

