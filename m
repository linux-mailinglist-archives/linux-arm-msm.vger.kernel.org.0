Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B004303DCE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jan 2021 13:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404030AbhAZMtY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jan 2021 07:49:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391934AbhAZMsj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 07:48:39 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5B3C0698E2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 04:46:01 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id c127so2615517wmf.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jan 2021 04:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4mll2lpwENE608kX1kOhep+FnuspDxHBBTIWjYWHVv4=;
        b=pN4lfLmmVBgLX1q2BKk4RyuM8nfGi0iSK2p5oFzqbwR48oc2/k0GoyukN3ekRynO06
         FKaAaAsWyotTSplcMwQPMAZVfJizyGQiOJBMk0yYcAymhgu9N2ZSbUSh6qjy288ou0pc
         HqtayVh1cyMBIbzfiBYPHmvVjr9IdO/PtWWdjNpPkVFE2CynLfawGQEBle+vluHgUEPi
         XIkSyDlNFtRmGLri4EMRNLpm0jF2EqbuLb6EDwAkGFdlQ5TAMlRTr4lVHYp6w+0UpvW3
         IMv+nTm9wowh7LVp4WikScVxnNSItGlVg6V+ACms+OKjBP2oRnEDQeXLGZ596/KJomrY
         KMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4mll2lpwENE608kX1kOhep+FnuspDxHBBTIWjYWHVv4=;
        b=tZnwdmqRY/Gdrnv76N/TsncVjDbTC5cw/fcL8vOWdRKiEosJ7SAjZ+/bXrTHKTdlI4
         CjNx0shhQnLpopDFGN8T0OHjsdPVZ2MIlmSOLngNFiS3FD3Q7h5/o2QrWe56y8UgO9NG
         sV0wlhE/y4hEP5V8fQaRu5ArXEliaD+ZdYqW/Y2xfaTyiezEhg9DjtzLVFfgqOoldNnG
         sCGh6oy/NoEnuAyqO7/r83HkqO+/41/jBlg1ch+VQPfbCk1LUpWIjL49v0uEpsxztEQT
         Jf/5yrkJbHTKwLmyKDaMOh6lfyPYInZznjox2ln/W1CSetIrW6VfdeWt4F9ww+3u1+uT
         cX/A==
X-Gm-Message-State: AOAM5302xp7wjHlXsZatpzsmntBhS/LCuRxINBVqqWcFXpFiXJZJ9UQ2
        5jXcFXBVPTpnsro0cHBX79QKbeb9b3wqQAgV
X-Google-Smtp-Source: ABdhPJwsLKoq02G2opNkx2KyZBjwCJrT1QWUMlzjgyZlIH/qv0W5suRHKqypiyBgXWhP7zNqj62Grg==
X-Received: by 2002:a05:600c:1911:: with SMTP id j17mr4552481wmq.63.1611665159968;
        Tue, 26 Jan 2021 04:45:59 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id i131sm3263073wmi.25.2021.01.26.04.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 04:45:59 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 13/21] clk: qcom: gcc-ipq4019: Remove unused variable 'ret'
Date:   Tue, 26 Jan 2021 12:45:32 +0000
Message-Id: <20210126124540.3320214-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/qcom/gcc-ipq4019.c: In function ‘clk_cpu_div_set_rate’:
 drivers/clk/qcom/gcc-ipq4019.c:1279:6: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/qcom/gcc-ipq4019.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
index ef5137fd50f3f..8abad4032de71 100644
--- a/drivers/clk/qcom/gcc-ipq4019.c
+++ b/drivers/clk/qcom/gcc-ipq4019.c
@@ -1276,16 +1276,15 @@ static int clk_cpu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct clk_fepll *pll = to_clk_fepll(hw);
 	const struct freq_tbl *f;
 	u32 mask;
-	int ret;
 
 	f = qcom_find_freq(pll->freq_tbl, rate);
 	if (!f)
 		return -EINVAL;
 
 	mask = (BIT(pll->cdiv.width) - 1) << pll->cdiv.shift;
-	ret = regmap_update_bits(pll->cdiv.clkr.regmap,
-				 pll->cdiv.reg, mask,
-				 f->pre_div << pll->cdiv.shift);
+	regmap_update_bits(pll->cdiv.clkr.regmap,
+			   pll->cdiv.reg, mask,
+			   f->pre_div << pll->cdiv.shift);
 	/*
 	 * There is no status bit which can be checked for successful CPU
 	 * divider update operation so using delay for the same.
-- 
2.25.1

