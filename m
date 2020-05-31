Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E59D1E9968
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 May 2020 19:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728277AbgEaR2T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 31 May 2020 13:28:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728267AbgEaR2S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 31 May 2020 13:28:18 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E876BC061A0E;
        Sun, 31 May 2020 10:28:17 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f185so9117251wmf.3;
        Sun, 31 May 2020 10:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jdx6TsJrr78HVKoX/umLdFIRRwm43Z8ByoSKAlhA/pw=;
        b=Psm3aF5+PLuu0RY7Ad+WOkHwPG5miLbeUn4omjTBF4OCQfvDU4trC0miMLRhHB6me0
         ImBwL8S0gGpHzQBxj9ZYr5Jh3x7Tfk44FRA7bLSeUAQZBZLUP93359DoZ3T/Nt+5tS6C
         OCmud4pYuyekG8ay+gzfuSSc44Uakng1PZRUY6DA00HmKnQZ/GlTxwM082FOtiOvbOGa
         yMdCHrhmJOtcVzxKe9YhuMed6XA5O9+ChbLgwztdy8tcI2YnH7TbGNodoIeaCNAWdDey
         8bZOA5u3mswhYxuiPNuuMoczgTHLSvXsWNUqqa+XKQFW6nIuSiTwxVYQa+kVXg9LQlh4
         P07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jdx6TsJrr78HVKoX/umLdFIRRwm43Z8ByoSKAlhA/pw=;
        b=FdvrzgLLnVBUZw5x6ULc9PF6F/B/HQ5WvNG42gyoNuBHzuhXpU/FPcozK8c4/AcDGG
         jUQap+Q+PVheDrP1/l91WZDU55ECdvuTiYfyiilr9JbxSh86XmjyTyMFOIYjGRy4t+gr
         teD2zoJbXmv1z4kh3h2/ppaxWUjuL8MmrTCQgr12gSI4BMA8LrX3e33vR7hYcxJiKazq
         2QCcv4vQS6pz2kJ1U0qiZNs5VqhwHKQOnIiquZtz7Ja9SlsWFkezxT0Wvc8Q/et3C1y0
         gJ5tVYbkr9TokojPsaU1+g1PrYEmUcpIm4PFLfUt3qMHZFi9codkldSE8qcBfeL5kPDp
         OrZQ==
X-Gm-Message-State: AOAM533dFFF600UYc9o8M0Qf4LNIpmUKEw90HOs33MWHzeaHWKxcxAPp
        2SSR/vcpncZm5HFqA19K8RiOG0qF
X-Google-Smtp-Source: ABdhPJxU8pJROgdI37vs5ge7XfwMo9ayil++czWXq57Gkg22uo2GTXwqsNGqcGIJ0oD9IEonf4YBzA==
X-Received: by 2002:a1c:1b17:: with SMTP id b23mr17708805wmb.3.1590946096626;
        Sun, 31 May 2020 10:28:16 -0700 (PDT)
Received: from localhost.localdomain (abad130.neoplus.adsl.tpnet.pl. [83.6.167.130])
        by smtp.googlemail.com with ESMTPSA id b81sm8922326wmc.5.2020.05.31.10.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 10:28:16 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/14] firmware: qcom_scm: Add msm8992 compatible
Date:   Sun, 31 May 2020 19:27:54 +0200
Message-Id: <20200531172804.256335-5-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531172804.256335-1-konradybcio@gmail.com>
References: <20200531172804.256335-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change adds a compatible for msm8992,
which requires no additional clocks for
scm to probe correctly.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/firmware/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 059bb0fbae9e..4ee94c2ff5c0 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -1154,6 +1154,7 @@ static const struct of_device_id qcom_scm_dt_match[] = {
 							     SCM_HAS_IFACE_CLK |
 							     SCM_HAS_BUS_CLK)
 	},
+	{ .compatible = "qcom,scm-msm8992" },
 	{ .compatible = "qcom,scm-msm8996" },
 	{ .compatible = "qcom,scm" },
 	{}
-- 
2.26.2

