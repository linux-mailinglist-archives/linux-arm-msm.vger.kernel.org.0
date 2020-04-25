Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D372F1B884D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2020 19:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgDYRx1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Apr 2020 13:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726387AbgDYRxS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Apr 2020 13:53:18 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A91A3C09B04F
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2020 10:53:17 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d184so6456463pfd.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2020 10:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FrSh0eY3IS/4QrOJLBtSTCw9OHLmyvJKPIU4beyGV4Q=;
        b=f27tU2CWV1WQDXaifhB0T/PwLb1JNY9J89+fk68X3qCxAdXClxrZDnDRRfrHKe7T9Y
         7980ywDC/b870iFjnznfyBbXDe0nWvo89wUuNNA/JzHsF9bKnglB8NKz/q3RjtwHwf6D
         JCzPqU3357Nvj0JxYM+uZzqObwKwWMVUroebQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FrSh0eY3IS/4QrOJLBtSTCw9OHLmyvJKPIU4beyGV4Q=;
        b=R0zCMAM9lLGYtqIbZCkhn7xjmOJmw8lbxG6mNSr0hGWlMoLb9itHR4HD2JggUSU+1f
         qqyug358uXk05MdcoQF8ObzMRAZOmiZu+LrDI2XEh4BCeMRj6tPC13va7N1TyD2yiCpR
         JHWfG62MnKHvcN8dGLW4yNKFRi2cOYuU/1Wn9RW8rZ9qAMOit8pC8h8o3SlNgD/52mvv
         9lKawayyMsKcTORdMna0V+7bhEPNuhCCzWQUZHWP2kR9hAjKujqhfAWprn5kZGQnKE3L
         0bUWZxDHwNm95IhAHMSfT1IR9wDXnXNb+Pl/vUFdxbmXQYSwc+HkRT+XKKrjZnuaBToz
         GxKw==
X-Gm-Message-State: AGi0PubZYVgQjHUKX96S4Or9hnlSM/tfrb+WXj01/N/Ep5ghfTE4HqqS
        V1/8s315SdOTWawifHgT2VOdJQ==
X-Google-Smtp-Source: APiQypL5MG+Vfwqb8wBO8IiaFFMITLB4Am2vvtE3JEkGU334jEY/6jpIt9LWokuQ57EOJCrtkJTTDw==
X-Received: by 2002:a63:48a:: with SMTP id 132mr5268581pge.380.1587837197259;
        Sat, 25 Apr 2020 10:53:17 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id v127sm8342148pfv.77.2020.04.25.10.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 10:53:16 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 3/3] soc: qcom: rpmh-rsc: Fold WARN_ON() into if condition
Date:   Sat, 25 Apr 2020 10:53:12 -0700
Message-Id: <20200425175312.124892-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
In-Reply-To: <20200425175312.124892-1-swboyd@chromium.org>
References: <20200425175312.124892-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the WARN_ON() into the if condition so the compiler can see that
the branch is unlikely() and possibly optimize it better.

Cc: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/rpmh-rsc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 28121a32a434..4accfeb191de 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -373,10 +373,8 @@ static irqreturn_t tcs_tx_done(int irq, void *p)
 
 	for_each_set_bit(i, &irq_status, BITS_PER_TYPE(u32)) {
 		req = get_req_from_tcs(drv, i);
-		if (!req) {
-			WARN_ON(1);
+		if (WARN_ON(!req))
 			goto skip;
-		}
 
 		err = 0;
 		for (j = 0; j < req->num_cmds; j++) {
-- 
Sent by a computer, using git, on the internet

