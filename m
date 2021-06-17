Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2453F3AAB16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 07:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbhFQFg7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 01:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbhFQFg5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 01:36:57 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523F0C0617A6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 22:34:50 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id p4-20020a17090a9304b029016f3020d867so1078822pjo.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 22:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UcB/vjjB0e9gJipKA//v703MbAzCMRsupGuwwOTjDio=;
        b=fgXIaaj0HsETVKRyV7KBf7e8L7whuTkRdRypBzdMxreL8fpjS/pj+jJmzd/e6Tqsoc
         fwz8wO2Ex40oAjBGyov+1j71RuXcfPZzstyUVkSOtB+fkkJGA2MaBq268rPFZH3K05AX
         lkozkVGK9PW7AEUmagUY7QhmXxxIF6/YEGfaRuLAuPewiWAEDgbHtPCq/3ejFk9cKeBw
         A1ckh0w3ipZWbLUGS/Nk/hvpqsgJpJnt3RsCUQxoSclVLbyH4wY6ljG7uS/MBqhIopDI
         I9DAkT7PcDUtFbZYSelMnwPvDSuFbHQE6sPPJKxLsJc+jf0aEHwgMVCkGtoyTG0qYJf0
         mBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UcB/vjjB0e9gJipKA//v703MbAzCMRsupGuwwOTjDio=;
        b=NGLbWz3JChRNTRcnEQN3ZXeIDBoct1uU7vkMw4hiVcVOed56IDBNtPL3//BBu7kX/n
         TXXVg25m+dYLYAyfdP0g99PS9WzqxRXN0zq3nlUOxugKOqukZbmMC3MxnoymAhCQR2k6
         PBaZ0jjCUKgDpyGIw0lPAWpjfQSQ3p+gQmkZQYWuArfXLeQZIvbBwsXcfg+fUj4fffv5
         8eyx+br45CKz05Z8ifRe6nFWeQM+ob1GRdQHR5Z1CWFz99g7ZFGGg3cb/yJ79jdVG2YV
         4JLdvCkFFbhqLB+jNajylmzM2K7IdGJPRxzFhW+6766vl0GyokapBpMbiaGYoUK3wC/p
         MXgw==
X-Gm-Message-State: AOAM533l++qUSw5WB7ekc7ptR+Siup8NOUpmazPhe7RIthJfKutvBWZM
        CRKN0/QXYjXRj5dYtkbEMijfeXNq1RCogQ==
X-Google-Smtp-Source: ABdhPJyPwl7B31LdfVyW4xxhljTdgfTaKBwcQ7ULtqWZptk2a47gLvT69SNWtCi1HT4v67HIoi2N2w==
X-Received: by 2002:a17:90a:1da3:: with SMTP id v32mr2774502pjv.192.1623908089665;
        Wed, 16 Jun 2021 22:34:49 -0700 (PDT)
Received: from localhost.name ([122.177.46.2])
        by smtp.gmail.com with ESMTPSA id m126sm4056405pfb.15.2021.06.16.22.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 22:34:49 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 2/4] dt-bindings: pinctrl: qcom,pmic-gpio: Add compatible for SA8155p-adp
Date:   Thu, 17 Jun 2021 11:04:30 +0530
Message-Id: <20210617053432.350486-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617053432.350486-1-bhupesh.sharma@linaro.org>
References: <20210617053432.350486-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add pmic-gpio compatible string for pmm8155au pmic
found on the SA8155p-adp board.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 10f049e21264..95d158848546 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -33,6 +33,7 @@ PMIC's from Qualcomm.
 		    "qcom,pmi8994-gpio"
 		    "qcom,pmi8998-gpio"
 		    "qcom,pmk8350-gpio"
+		    "qcom,pmm8155au-gpio"
 		    "qcom,pmr735a-gpio"
 		    "qcom,pmr735b-gpio"
 		    "qcom,pms405-gpio"
@@ -122,6 +123,7 @@ to specify in a pin configuration subnode:
 		    gpio1-gpio2  for pmi8950
 		    gpio1-gpio10 for pmi8994
 		    gpio1-gpio4  for pmk8350
+		    gpio1-gpio10 for pmm8155au
 		    gpio1-gpio4  for pmr735a
 		    gpio1-gpio4  for pmr735b
 		    gpio1-gpio12 for pms405 (holes on gpio1, gpio9 and gpio10)
-- 
2.31.1

