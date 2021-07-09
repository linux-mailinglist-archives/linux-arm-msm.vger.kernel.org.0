Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE233C1E69
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 06:32:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbhGIEej (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 00:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbhGIEe3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 00:34:29 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826B8C061764
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 21:31:46 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id a6so5955991ljq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 21:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OW6r9Ztak14Z94NLN85hpavnPWferFff+9qy6SUKk4g=;
        b=UvGi1B+es3fCaDxmJpGeewLmLB8C2VxxdjqqEEtrzFv0O0YZAolKlF756ouyrJpI2/
         fY58oGEn7/X9Y0nAPmv0ScmYyuXiAwRTIXpbMMSsy3KmpFYPdYDg1hs/Xmv6cEngQ00W
         gDrrrmODv6Sg1V7A1keQiN0XEBDXoTVvhSdXjWAvgBpuEOwDF2XdumPevBMFw29rfxHS
         r3xkD6To+3liLwf4z+QeiiT/BX8mVtxJyeZ2BdpS6cOgLwozikH84JZ1KCpHwGlc+HkM
         E5RZgZz7GZHGYnGfg8jPZwzKoepOd9ankKqCplBpO6fTlLs7AzIrDIjbJJsEY7xQVP86
         SHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OW6r9Ztak14Z94NLN85hpavnPWferFff+9qy6SUKk4g=;
        b=mSHWsDY8Rw9NxzVl3GyuaVd27mgz+xQG2DXxwguB8mlULGXRGrpce+WiwgkXkyrXVi
         XN5va2U+ZpmGx4Ttna2coXmIDoe/t/UTSycEar2oiYJo/pW/YsfsuHpcinEgKWFdQR8X
         rWBTh/dw0/GLN1Z5mubBPb/cux5VX0fArFa7bIS846QqOTnb05Ex0bxxRJ5QUZTN8EwG
         hAWmZPuBWQ+YZHAjGHdYUFDvmJ150nf0ABPjDLVwKtRohz6vKnFkESJrX+XZWW4IsquL
         rwXhlrROKa0tsOB5WJAFpuOkZ/Sshlp4Y1Izy/XDpN+GLMny8hV8+mjdYntA1du24GFd
         elXg==
X-Gm-Message-State: AOAM533r0ujFSiapUFpv1NLCH6VopCvwute3/9qg9SitrCLkQYGIiZdU
        q9WvouIOq2jcEDeNizTJiFUxzA==
X-Google-Smtp-Source: ABdhPJyY7ngGsTRiOotvZgAIDUFql0+KdrxnztkmsKdBzpgq9oLFTrwe/YXta5EHMcKPW9w4HgfmDA==
X-Received: by 2002:a2e:9b46:: with SMTP id o6mr21455694ljj.501.1625805104909;
        Thu, 08 Jul 2021 21:31:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h1sm13028lft.174.2021.07.08.21.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 21:31:44 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2 7/7] clk: qcom: videocc-sm8250: stop using mmcx regulator
Date:   Fri,  9 Jul 2021 07:31:36 +0300
Message-Id: <20210709043136.533205-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
References: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now as the common qcom clock controller code has been taught about power
domains, stop mentioning mmcx supply as a way to power up the clock
controller's gdscs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index 7b435a1c2c4b..eedef85d90e5 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -276,7 +276,6 @@ static struct gdsc mvs0c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs1c_gdsc = {
@@ -286,7 +285,6 @@ static struct gdsc mvs1c_gdsc = {
 	},
 	.flags = 0,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs0_gdsc = {
@@ -296,7 +294,6 @@ static struct gdsc mvs0_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct gdsc mvs1_gdsc = {
@@ -306,7 +303,6 @@ static struct gdsc mvs1_gdsc = {
 	},
 	.flags = HW_CTRL,
 	.pwrsts = PWRSTS_OFF_ON,
-	.supply = "mmcx",
 };
 
 static struct clk_regmap *video_cc_sm8250_clocks[] = {
-- 
2.30.2

