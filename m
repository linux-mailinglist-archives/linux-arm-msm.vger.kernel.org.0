Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1D2A1E311E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 23:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389914AbgEZVYZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 17:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389572AbgEZVYZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 17:24:25 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 579E9C061A0F
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 14:24:25 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id f189so22294141qkd.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 14:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QBRz1+/7+0iGsXWNeTLr3q8/FFn5AWhnRzIa/vyWa3g=;
        b=PyQ1E+UC6flPY4IF4ASkvmgiPe+bGnoyS++a9wtIGNDVbdA7CwVxC8NNFVLNVVPt9Q
         ea+JqFHSMi3JjRYt0NQKFmcHNjXkwAOF/DnMKltFIE1DtyVMMJqyPO2Mnp5lwv5Xk08I
         A/6Rd6CumqigVLzvQ6UmSRzBq3gvNL/otLrm04ys17lEA3Rn1Q3vv/86ASUXh8Gy5obA
         zcbz8Ri/xz39piuOOCIS9j67ZL60C/+/JyQ7rniOKLJkkeyYYfq5qv0VKhmOMyUfciS3
         ULoHxlbPbKYIO4NY7A6Rfyth4PfgS6thGgpIPbM5y45JZHHuylXM9FK3rgdnwvYiSQ4B
         ngAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QBRz1+/7+0iGsXWNeTLr3q8/FFn5AWhnRzIa/vyWa3g=;
        b=j5Zs7UiGdt1dwhZShDKkBzd6uYo6JauxOrwIjBIjj/z3miH3LDTqx58JrnDAG3f9Qw
         vVs2snUmmnuQQ9X3/FvWj7ieryPpuXy44FWJCAJEe4FERSkojUp9ioPzxdA525ETKJSg
         LlOoUK7wSY0nBLXw7w7I6+xaApOBOvr712L44lV6CIIwm3ryw59P7EGSQlKVTBTk69XO
         TtVyfFOwXMF0toI2Lss5kKUYcHEVrxD3GSiUwO9Q5z5GsH7HRtRgnqbXgWMFYOKwbgxp
         InzSjAKiiE0p+eKBivdwXYjyx8qS4OjbK+ZHRu5b+I4wOt64+QHXHaJGGdCJVSe+e/YY
         GX6g==
X-Gm-Message-State: AOAM531aqz08o/6E+KN+Pvr9zEOq4gmiZ1Aa+aK3jFK0o/KIRCFo3Hu0
        VsFP2MFbEs6znXo5h33Z7NOvAw==
X-Google-Smtp-Source: ABdhPJzQhvUqUjxcMGfDJg9Cd3DUf3NBupqjurT0pomIH1kEQijK3lmaExCaJ84plMXhxS+sIx0YDA==
X-Received: by 2002:a37:2710:: with SMTP id n16mr897806qkn.149.1590528264459;
        Tue, 26 May 2020 14:24:24 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-255-246-27.washdc.fios.verizon.net. [71.255.246.27])
        by smtp.googlemail.com with ESMTPSA id r14sm698678qke.62.2020.05.26.14.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 14:24:24 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8250: Fix device name for ufs controller
Date:   Tue, 26 May 2020 17:24:23 -0400
Message-Id: <20200526212423.24452-1-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change ufs controller dev name from ufs@1d84000 to ufshc@1d84000. Without
this change when ufs controller is built in as part of kernel, the driver
code fails to initialize the device  due to a check against
android.bootdevice.(The validity and reason for this check in the driver
code needs to be revisited. But the change in device name allows ufs
controller to be registered during boot). This change also makes the dev
name compatible with how it is defined for other Qualcomm SoCs.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7050adba7995..0ef72c839ed8 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -306,7 +306,7 @@
 			};
 		};
 
-		ufs_mem_hc: ufs@1d84000 {
+		ufs_mem_hc: ufshc@1d84000 {
 			compatible = "qcom,sm8250-ufshc", "qcom,ufshc",
 				     "jedec,ufs-2.0";
 			reg = <0 0x01d84000 0 0x3000>;
-- 
2.20.1

