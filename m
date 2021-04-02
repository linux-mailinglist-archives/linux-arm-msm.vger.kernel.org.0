Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD8D6352958
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 12:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234397AbhDBKFb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 06:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234488AbhDBKF3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 06:05:29 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76307C0613E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 03:05:28 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id v4so4284384wrp.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 03:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oG76MLwzBBbHo4Scp8xxleKgLq3nfk0QlNvLqyY7BH0=;
        b=tfjaY4b3vF9ueUmlZLWouvTlf4/QwWVI5q0REiyLpgmnAtYjT8WLXsxi5kg+42QN+s
         N0a5sWws7Ert8gaHbnWnyo4M5Kf+2rskmspGnfmzx6Nv2iu2ZFXtnwBWBPCc4AYYSJnA
         N190bXRrUYPohliNKc4aXOOFoT1qt7bnKYxGMOtDRWZm0lh1HfFiOwQGYRD4nlpp4oMc
         QeJERzE3vDWTvaHGLqYEoigy8nPhs7eVA0KznJagYSwATGscjBriJJslrKGwuJeDsK+O
         vl1jC2k0aswa9JxxQCwhdx4m7lD+Xwiz3jYO4WZvKhqIr4xwb0in/7iLnKwBn0qqsxXV
         Of+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oG76MLwzBBbHo4Scp8xxleKgLq3nfk0QlNvLqyY7BH0=;
        b=I8k2KCWPkOKFeQrAaDyvx4xstSekXeUh5i3hBjPoduX95yfUqjeIGY26weB6dRsx8o
         Nl9LoZqOX+InH2GEeDW5E1JszO4QHZvMm/Da9UVQCuZNoSflcCfwXv2fQeIEpClvBxek
         F8mGMJFtdj/WSmDGO2R1o2lpVvogp5897PVcxCfRWoaynt4A5e0mWA2pGtzCpLwjgV3w
         EGJBapmoW1SBYa8othHbUTPf+KzS9EevmAaNWscG8G0IrgBSSMlXBkOT8x4ZPg+5ERWa
         NO1TjTQIaduJs/3e6K2lKniWDUdPeMpCDH4UUODF7islgrT2R9CUuVGa2DksaajIdeaP
         dQ1A==
X-Gm-Message-State: AOAM530htOnGfYUqBWeflUruwgkOvsFY4C2pAKfgRHIph8i1JD1913wV
        l20XzZDWE4o2F6RP+1FaiICw3Q==
X-Google-Smtp-Source: ABdhPJxRf9XvXAnT+y8a527RhDWwqWV5tLlkbyVTMoVDd7ZdOM7N6StF5XH2eyUW+N/Noby8acRFgg==
X-Received: by 2002:a5d:6c6d:: with SMTP id r13mr14364639wrz.362.1617357927197;
        Fri, 02 Apr 2021 03:05:27 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:26 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 10/25] media: venus: core: Add an io base for AON regs
Date:   Fri,  2 Apr 2021 11:06:33 +0100
Message-Id: <20210402100648.1815854-11-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

6xx silicon needs to access registers from a AON base address range.
This commit defines the necessary variable for later use.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 1 +
 drivers/media/platform/qcom/venus/core.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index cf2aa83c4378..b6f9ef6b6dcd 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -216,6 +216,7 @@ static void venus_assign_register_offsets(struct venus_core *core)
 	core->cpu_ic_base = core->base + CPU_IC_BASE;
 	core->wrapper_base = core->base + WRAPPER_BASE;
 	core->wrapper_tz_base = 0;
+	core->aon_base = 0;
 }
 
 static int venus_probe(struct platform_device *pdev)
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 0c519211fac3..6de596b5a9d1 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -96,6 +96,7 @@ struct venus_format {
  * @cpu_ic_base	IO memory cpu_ic base address
  * @wrapper_base	IO memory wrapper base address
  * @wrapper_base	IO memory wrapper TZ base address
+ * @aon_base	AON base address
  * @irq:		Venus irq
  * @clks:	an array of struct clk pointers
  * @vcodec0_clks: an array of vcodec0 struct clk pointers
@@ -134,6 +135,7 @@ struct venus_core {
 	void __iomem *cpu_ic_base;
 	void __iomem *wrapper_base;
 	void __iomem *wrapper_tz_base;
+	void __iomem *aon_base;
 	int irq;
 	struct clk *clks[VIDC_CLKS_NUM_MAX];
 	struct clk *vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
-- 
2.30.1

