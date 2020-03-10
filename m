Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47657180228
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 16:44:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbgCJPoQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 11:44:16 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34711 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgCJPoC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 11:44:02 -0400
Received: by mail-pl1-f194.google.com with SMTP id a23so2875904plm.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2020 08:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s2p+EcI7L/A1DVC/29xLNkKoAlt6wKb9qgS0/TTntts=;
        b=BdwMJy5ModIWnTns/Hmo1norAhn7toeZcwzhh1mWGCyafM1GB1p/TSRDLh5lDA5AC4
         N9RZvDG2r3PGnocKoaWGq5iva3cEoYDsb4ZkhbFBLQ7r0p4A2ua/jWhd9T4jLVvsExqB
         3ByWj2yt7V0RzcxEp/312/y+DaucUA2vIzpWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s2p+EcI7L/A1DVC/29xLNkKoAlt6wKb9qgS0/TTntts=;
        b=JIvYEEGt2L7DzmzyimUsd4Di0q3xchgMcUn9gq4jeww9PfbSutCCqNtaD3NMi03kaE
         s28sIgrsvmRIajQ8ktrZnayKL2VGC7Jr75j4r/CHprEuNZdN8mZSmDW3KpUJqz6UVAQw
         dIwnNyNw2nY0WXom+K9WDzPEysZ9XItD9hUTIuFcwQMvh8cZvXguZkSNV7VhVmq5kwKO
         rVcq9C2g+JVSVvqPUmfmvJkZVpFfEpVMG2KAqv75JNqTZn5V13vE3DaE21kAFtm6iLCa
         7kmJzNLVJtO1RoTYLqcLei3/jT0xPAXxfz3/0r4+JeaFeCCqJRELWHloxdJigaMAyUR0
         EvNQ==
X-Gm-Message-State: ANhLgQ1fmHN3o6RbdxUn3z10YnkOXSErd3/YaXNQcQg779KRVopQv1K9
        BWuouhCVx5j4YXflS/fjuaGpXw==
X-Google-Smtp-Source: ADFU+vspG8Hr+OXyqIuMQSfkHHhLCVU2hiot8wjx0g6f9q8vljrpx0xyBhDfkfu5EpF55umf6MGrTQ==
X-Received: by 2002:a17:90b:4903:: with SMTP id kr3mr2329828pjb.3.1583855041356;
        Tue, 10 Mar 2020 08:44:01 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id m12sm2731090pjk.20.2020.03.10.08.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 08:44:00 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Alok Chauhan <alokc@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v2 1/3] i2c: qcom-geni: Let firmware specify irq trigger flags
Date:   Tue, 10 Mar 2020 08:43:56 -0700
Message-Id: <20200310154358.39367-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200310154358.39367-1-swboyd@chromium.org>
References: <20200310154358.39367-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We don't need to force IRQF_TRIGGER_HIGH here as the DT or ACPI tables
should take care of this for us. Just use 0 instead so that we use the
flags from the firmware. Also, remove specify dev_name() for the irq
name so that we can get better information in /proc/interrupts about
which device is generating interrupts.

Cc: Alok Chauhan <alokc@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 17abf60c94ae..4efca130035a 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -549,8 +549,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	init_completion(&gi2c->done);
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
-	ret = devm_request_irq(&pdev->dev, gi2c->irq, geni_i2c_irq,
-			       IRQF_TRIGGER_HIGH, "i2c_geni", gi2c);
+	ret = devm_request_irq(&pdev->dev, gi2c->irq, geni_i2c_irq, 0,
+			       dev_name(&pdev->dev), gi2c);
 	if (ret) {
 		dev_err(&pdev->dev, "Request_irq failed:%d: err:%d\n",
 			gi2c->irq, ret);
-- 
Sent by a computer, using git, on the internet

