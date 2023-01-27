Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E154D67E1FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 11:41:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbjA0Klr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 05:41:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbjA0Kle (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 05:41:34 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10AFC79230
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 02:41:01 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id t18so4592073wro.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 02:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ndsWZlMYJtLnCMyPNKqHVtE/EpqIzhsLhwbLZ4yPv4=;
        b=pcaxpn5GMKc3hkUSiYbL+KXIkk1Q1jNEiF+bU+AlkY+STYO3YlRvQm4CL21G4uTads
         F/E/cizCK4pB4IQlFZKWr8aSp4CCedzSP2kphFS6FM/wvN0Luquv6iGCXd/tWJXY8GX0
         9bsSectbf3oqAaCTzIoEYNOIW56UR0X/8PYQARIfXV3J6PsZGKoS4sdm8p/QY1N1D3ql
         ANEzBvnGxND2hKbLMo4bOSELPxRaJfYjp0wgi2if4zc7TbN9VBlnFQRJG7ZLNUG1v3Ry
         3ySwzcl03uohRgHU0KFYDSwcLQMlZVBi3c5g87Yg1c3Pa1hIZAmjGNgfwY+HwgaM/H+0
         +TMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ndsWZlMYJtLnCMyPNKqHVtE/EpqIzhsLhwbLZ4yPv4=;
        b=SSvOk1IylRzbhTWr0pp/DsQYy/v2QFzgV5fZn8b/bcdQqDTQ2ryStDRWHn8KYUBq7x
         S+e1qgGiL/Xo3lzA1UmUDMsGaGwqAY4/SW+jSBVkyknh55ludgTK5OJ59Ttjt0kPnFSn
         1DZSeYsHIlsl6Tb3MFA6nMI4DU+9L6oQcusQ/+xeuImHIeWet2O5xy1FqFoIC1+Uogke
         Zu9NSZ8YOy9FEQbqwq713Ia4pHeGILbovN1xr/gFIBrQZ0v2OmflpTqsB+V3NR/B+lLx
         7leHKrDbqkBjI/vSSGqhoYjtnUr8cUHNBzmYbJsp+eTbvZrJrN4HvWJknTMQLQnnMtXy
         ykUA==
X-Gm-Message-State: AFqh2kogjIlISbvLHKjBrNsMD+i6Oeoz0LImGE/Ou74ZyyJTMGLGIeIk
        s+rrxaDSusTFs/iDyw/4KwDM2Q==
X-Google-Smtp-Source: AMrXdXtjBKnqIUXFzK6rBR+HmbIbBe/29qiO4dzM4gQIAWtKV0EMLASAJZaz9DTkAQvvlkGJd/5SnQ==
X-Received: by 2002:a05:6000:8d:b0:2be:3a6a:f565 with SMTP id m13-20020a056000008d00b002be3a6af565mr25744279wrx.38.1674816058948;
        Fri, 27 Jan 2023 02:40:58 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id e21-20020a5d5955000000b002b57bae7174sm3613089wri.5.2023.01.27.02.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 02:40:58 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-pm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [RFC PATCH v2 2/2] soc: qcom: rmphpd: Call the genpd unused power off sync state callback
Date:   Fri, 27 Jan 2023 12:40:54 +0200
Message-Id: <20230127104054.895129-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127104054.895129-1-abel.vesa@linaro.org>
References: <20230127104054.895129-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Genpd provides a generic sync state callback for disabling unused
domains for a specific provider identified by its device. Call that
generic callback from the existing sync state callback in order to
disable all RPMh PD unused domains when all the consumers have probed.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

This patch was not part of v1. Added to this patchset for context.

 drivers/soc/qcom/rpmhpd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/rpmhpd.c b/drivers/soc/qcom/rpmhpd.c
index f20e2a49a669..8b341cb97546 100644
--- a/drivers/soc/qcom/rpmhpd.c
+++ b/drivers/soc/qcom/rpmhpd.c
@@ -832,6 +832,8 @@ static void rpmhpd_sync_state(struct device *dev)
 			dev_err(dev, "failed to sync %s\n", pd->res_name);
 	}
 	mutex_unlock(&rpmhpd_lock);
+
+	genpd_power_off_unused_sync_state(dev);
 }
 
 static struct platform_driver rpmhpd_driver = {
-- 
2.34.1

