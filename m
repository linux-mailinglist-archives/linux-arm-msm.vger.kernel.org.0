Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9B8B5163C7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 May 2022 12:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239196AbiEAKjN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 May 2022 06:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345384AbiEAKi6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 May 2022 06:38:58 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C23E41
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 May 2022 03:35:32 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id a1so13712795edt.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 May 2022 03:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0y5yzicLsas4EmHAcITZdZkPnQbuPjF+Rg+p5VrAikk=;
        b=Rg0/nl3fR4LHEemjPjE6BNFsVJbpSfkKUgt9QbXYRHwHu51tUEcrTf8gA9nRzDeMnQ
         kG4BVCJ/mJDO7XH0wtnbw/AGtNTJ23F3d2GhwmKQdYDAUvJ1Y/kWo97UtuC1jSld5VSQ
         JuGaJTXwHb/Tk7sI4NgARxpEUZw9yEM6CLiA893wqR87pO9arJG5BtruiVIWLK+IlXe6
         XpD2/2IQD+oc6akmpEcaqSLbnnxwRTiIdeJIAaPY0+DjJR1zKAg+KHxVsIwaAKz7F8uX
         od9FyZa3KjpYmDmLPQg4UL87r5S+7BaYNMZuaLivlp9/yhcucbs3hEsb+usDFTmLScJW
         8kBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0y5yzicLsas4EmHAcITZdZkPnQbuPjF+Rg+p5VrAikk=;
        b=yu0H56KhiRP3oHwoRcwEHbLgX1H/sSE5CnUIcuO1XiClRAK439EgEkVlRJhe9jJX9W
         3lrQ4PPV6y9AapIGHUScxcDf2aRlouVmEZBkjK6ftxy8IKGqj9ueW42I1lxmdiU8gW0z
         +0T/BHmzDYBFNafNFao5fAQWZU/Rb54TkeyqlY5VxNqqkBBAGtlr61Oksbip/7PEDvC8
         LzFNDrkCQDQT2pbZtN7U/yPx9xHDOsY0r7QkI5WHrA7PjgAJAudQ3Sd3MS4U+yu5poBw
         vJnsMaRgfoA6JFlYZjrGeluyEKtnMxk8NX9qfAg/aqdb7ejUK4s5MkVggOkS58BYhQcW
         P8gw==
X-Gm-Message-State: AOAM530qOcr8jP/kLTQLSVJ+zInFBueAx62vLGG0dQssZRPT4iY3r0a1
        7PWWL/TBwggjJZTCx0UNrk/sAQ==
X-Google-Smtp-Source: ABdhPJxd9q5dD1HBp8ci0ndlYpDqxQEaNKu7CYNuW/hdf1Co5oOWllrk9R1fcJtEOmPDmN5nmFg9Dg==
X-Received: by 2002:a50:d65c:0:b0:425:ea34:7dd7 with SMTP id c28-20020a50d65c000000b00425ea347dd7mr8290816edj.18.1651401331027;
        Sun, 01 May 2022 03:35:31 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id zp1-20020a17090684e100b006f3ef214df1sm2464438ejb.87.2022.05.01.03.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 03:35:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/8] remoteproc: qcom: correct kerneldoc
Date:   Sun,  1 May 2022 12:35:15 +0200
Message-Id: <20220501103520.111561-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
References: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
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

Correct kerneldoc warnings like:

  drivers/remoteproc/qcom_common.c:68:
    warning: expecting prototype for struct minidump_subsystem_toc. Prototype was for struct minidump_subsystem instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/qcom_common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
index 4b91e3c9eafa..020349f8979d 100644
--- a/drivers/remoteproc/qcom_common.c
+++ b/drivers/remoteproc/qcom_common.c
@@ -50,7 +50,7 @@ struct minidump_region {
 };
 
 /**
- * struct minidump_subsystem_toc: Subsystem's SMEM Table of content
+ * struct minidump_subsystem - Subsystem's SMEM Table of content
  * @status : Subsystem toc init status
  * @enabled : if set to 1, this region would be copied during coredump
  * @encryption_status: Encryption status for this subsystem
@@ -68,7 +68,7 @@ struct minidump_subsystem {
 };
 
 /**
- * struct minidump_global_toc: Global Table of Content
+ * struct minidump_global_toc - Global Table of Content
  * @status : Global Minidump init status
  * @md_revision : Minidump revision
  * @enabled : Minidump enable status
-- 
2.32.0

