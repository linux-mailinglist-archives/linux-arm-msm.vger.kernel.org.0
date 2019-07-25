Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A77474BD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2019 12:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388177AbfGYKmF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 06:42:05 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39907 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387903AbfGYKl7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 06:41:59 -0400
Received: by mail-lj1-f194.google.com with SMTP id v18so47481711ljh.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2019 03:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HkR5c7pg+yPuBi2NQ0G3gtI0G9f3RBJtD6x7Jmgjehc=;
        b=ZLmJvOdiUYFEJm4i4mbuyrMY2o6mclBz5DhrFLFaBKoorOt5B6ZiY2psz1JuTtwaFZ
         5kxpMa2cjNwA8rRi8P5H/op90KLl/aDbsFG69P0RY+FnENSQN1Xf2mdDymrZHkplNyRg
         uK5KguUErED95Wmi4b3Ok+n5HeY/cSZEjPm+UMupvLcjVs7VJadZySzkdqoJDY9DOSKA
         LFk5vCN6UOEQ/tjgt/gFuQQdJMvCeLuja7fHjZm8GWioL6xwxmQMzVvNPskaG9fzT/0B
         85I2zrX1TaqE8klv4DrcceVpijzG3OYw4sIEM5/16ijVOGfz0sZjxMakrjAc++87GIQP
         EuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HkR5c7pg+yPuBi2NQ0G3gtI0G9f3RBJtD6x7Jmgjehc=;
        b=djsz1wzv7O5PjutkZeruC9JaNn5VIMZPrA6k2wliXFk3m1/LAwn7NibwSMJ+w6jdU/
         FH+j2KDEVFuthlqiqhkQCSCHgwfltOkLLCo6/lmyvX8gBJdfnZg/C6PJe7508aHkN33S
         mH1a1tTB7CdGHU1VUfd2cJTOhOV76IO4ycGjaKFGbGZ62qf3D2bf2qK4/0IisfEQH2q8
         z75EPtYSzwOivCOQm5QOMOFBsjQg/VqOgjZ6DPwixYkYEOm2iZnr4YmjS1OaHNJTiD7l
         lF8yIWagNKg0CwRkB1rIa+vNTOoI6eADvBoVupqs2mGP8S+MiWuQbvI4KA1BwVDDAhjE
         X1VQ==
X-Gm-Message-State: APjAAAV1ov9CfbSOcQzYw7FqkGNKNz8pyv1xArXkTCB6Piju9iYgxUNJ
        i5mdv+dYSS3whsWkYueJVghPZQ==
X-Google-Smtp-Source: APXvYqwWe8bFQsIaLQgq5TXU6wZZZIiHgi37mSb0dZrMRLQLsCPq/8RZD9nqMFtCDrB3yErElssZRw==
X-Received: by 2002:a2e:534a:: with SMTP id t10mr8150715ljd.109.1564051317095;
        Thu, 25 Jul 2019 03:41:57 -0700 (PDT)
Received: from localhost.localdomain (ua-83-226-44-230.bbcust.telenor.se. [83.226.44.230])
        by smtp.gmail.com with ESMTPSA id b6sm8268306lfa.54.2019.07.25.03.41.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 25 Jul 2019 03:41:56 -0700 (PDT)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>, Ilia Lin <ilia.lin@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org,
        bjorn.andersson@linaro.org, ulf.hansson@linaro.org,
        Sricharan R <sricharan@codeaurora.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/14] dt-bindings: cpufreq: Re-organise kryo cpufreq to use it for other nvmem based qcom socs
Date:   Thu, 25 Jul 2019 12:41:30 +0200
Message-Id: <20190725104144.22924-3-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190725104144.22924-1-niklas.cassel@linaro.org>
References: <20190725104144.22924-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sricharan R <sricharan@codeaurora.org>

The kryo cpufreq driver reads the nvmem cell and uses that data to
populate the opps. There are other qcom cpufreq socs like krait which
does similar thing. Except for the interpretation of the read data,
rest of the driver is same for both the cases. So pull the common things
out for reuse.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
[niklas.cassel@linaro.org: split dt-binding into a separate patch and
do not rename the compatible string.]
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Reviewed-by: Ilia Lin <ilia.lin@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since V1:
-Picked up tags.

 .../opp/{kryo-cpufreq.txt => qcom-nvmem-cpufreq.txt}   | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename Documentation/devicetree/bindings/opp/{kryo-cpufreq.txt => qcom-nvmem-cpufreq.txt} (98%)

diff --git a/Documentation/devicetree/bindings/opp/kryo-cpufreq.txt b/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
similarity index 98%
rename from Documentation/devicetree/bindings/opp/kryo-cpufreq.txt
rename to Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
index c2127b96805a..198441e80ba8 100644
--- a/Documentation/devicetree/bindings/opp/kryo-cpufreq.txt
+++ b/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
@@ -1,13 +1,13 @@
-Qualcomm Technologies, Inc. KRYO CPUFreq and OPP bindings
+Qualcomm Technologies, Inc. NVMEM CPUFreq and OPP bindings
 ===================================
 
-In Certain Qualcomm Technologies, Inc. SoCs like apq8096 and msm8996
-that have KRYO processors, the CPU ferequencies subset and voltage value
-of each OPP varies based on the silicon variant in use.
+In Certain Qualcomm Technologies, Inc. SoCs like apq8096 and msm8996,
+the CPU frequencies subset and voltage value of each OPP varies based on
+the silicon variant in use.
 Qualcomm Technologies, Inc. Process Voltage Scaling Tables
 defines the voltage and frequency value based on the msm-id in SMEM
 and speedbin blown in the efuse combination.
-The qcom-cpufreq-kryo driver reads the msm-id and efuse value from the SoC
+The qcom-cpufreq-nvmem driver reads the msm-id and efuse value from the SoC
 to provide the OPP framework with required information (existing HW bitmap).
 This is used to determine the voltage and frequency value for each OPP of
 operating-points-v2 table when it is parsed by the OPP framework.
-- 
2.21.0

