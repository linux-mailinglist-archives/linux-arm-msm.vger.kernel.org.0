Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67BCBA8126
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 13:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbfIDLgU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 07:36:20 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53273 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726943AbfIDLgU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 07:36:20 -0400
Received: by mail-wm1-f68.google.com with SMTP id q19so2925977wmc.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 04:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Uuq1eCLagqB7It6aGbezur+IR8biDO9SazdI7cqdaFI=;
        b=qp0yJe04jx2ivZeuIXUwlhAyXXeFSfk5tgqH6oCkHR05lDEik9mPR5v9927SPGcRcF
         Bqpd9uYWbP1lsr+hb7QvkpYLluhnrev870vk1hyz6CstDwPiqkr8mp4/e4g5uP5dShX8
         xdt0ym7tbVmwYwx2pgRVRGsEZ8C1evHUk9FGitl/8RMxdTyfqj6zxtwcIzKPbnKHu2ay
         q7f/9kZ1lQ7dZpPPtuumZ9QoFlwEHWVriNgD+6IQtn2ystKcFOD1L8ahTB72/zQlOPjj
         vijaYPmPpyVFjezLg3cx8drAtt4pP5Fz+cYk5fH1mE2O8yX+nvUAM681Qx1ltYOUjSXv
         zQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Uuq1eCLagqB7It6aGbezur+IR8biDO9SazdI7cqdaFI=;
        b=NNmNRxKWfPiQd1jochSYKDDcWLsNnKKqMmksgKbH34XCasL42mOCXXlaelfz26AgJn
         Vlg7Wq4/mQbihtIw5csaTChpBHzAD+OqWKQisS6aGRAjvQtfokSWMrrydrmPIFQUyG2Z
         JIqP54aR8MABxJ0T6lqpkvGPKqBNCQvU6ac9HWUyL1wy4dBKouIKajZ153HEXsbByJ8Q
         mYc7VRQAznvGsCuhLnpL5bzY4uNjfWK5m0lbL+pljVwyMMMJvZlKtbf0I0zaNmj60KgY
         16F3JZu9gEZu4R6cDVAQJMgaMMY7xVSMAd/e5NXjaYhmv6W5L2DMyWg3knWfnGOUcuwk
         k9/w==
X-Gm-Message-State: APjAAAU7z9HcKfmp3pveUoTk+goQ5m9MUAheKiZxkMGLdW1dTgeAdDB9
        f4OuZdLXhry5TBi4RTxwHGO8OQ==
X-Google-Smtp-Source: APXvYqxrVXn7NXLmsW+n0aD02675Wv9vt7hSV40SwdLs0RB8oNmnK6HhJ+4q7rd/GnqwtFaz3fRPdA==
X-Received: by 2002:a7b:c8ca:: with SMTP id f10mr3812956wml.36.1567596978030;
        Wed, 04 Sep 2019 04:36:18 -0700 (PDT)
Received: from localhost.localdomain ([95.147.198.36])
        by smtp.gmail.com with ESMTPSA id d9sm10823933wrc.39.2019.09.04.04.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 04:36:17 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     alokc@codeaurora.org, agross@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, bjorn.andersson@linaro.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 2/2] dt-bindings: soc: qcom: Provide option to select FIFO mode
Date:   Wed,  4 Sep 2019 12:36:13 +0100
Message-Id: <20190904113613.14997-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904113613.14997-1-lee.jones@linaro.org>
References: <20190904113613.14997-1-lee.jones@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Used when DMA is not available or the best option.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
index dab7ca9f250c..b0e71c07e604 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
@@ -40,6 +40,7 @@ Required properties:
 Optional property:
 - clock-frequency:	Desired I2C bus clock frequency in Hz.
 			When missing default to 100000Hz.
+- qcom,geni-se-fifo:	Selects FIFO processing - as opposed to DMA.
 
 Child nodes should conform to I2C bus binding as described in i2c.txt.
 
-- 
2.17.1

