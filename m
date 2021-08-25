Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 839B33F7B0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 19:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241168AbhHYRA5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 13:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhHYRA4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 13:00:56 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC662C061757;
        Wed, 25 Aug 2021 10:00:10 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id n12so3272443plk.10;
        Wed, 25 Aug 2021 10:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GARRipU4tyoOX/kFKAVGnwwP9gM0vSl86b0lA7JfjhI=;
        b=X/VZuzNzm0CgfQ4VwwxFY8Slrtmu0eULlo8vIR7KJ7y0Gg0sVIE7Q9jEnZOMuFi9su
         gz9uqofnnm0dZUestG4p7Y0l0hPc47o2suzXpNZ9a5ojvg8Y1QE3q7+eMUk/9Yr1m+vX
         NxUtnkA7NVshg881J73mw+PIgA10AfmPyKZWyVunTGSHReaYXNiVgWlXFc2ryB7aj4DT
         rwR9JyjltdyifCgXsjKLiXHtRiMr1y82FxPd3fnkPf6+sqWeEhWgozGBJNZ2u5+mmT+B
         WOSYiQb7Jc1x9zWqo35H/WZFDETOydL8dzF/aFUYAwLqRqNr99K4AEMTHAxBcJAP2P9w
         Q2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GARRipU4tyoOX/kFKAVGnwwP9gM0vSl86b0lA7JfjhI=;
        b=cdalV7Q3OCZIVVxQ3ZZ6y/r9zunayRWIMB2tUb7j2/+RrtdnhF6aVcnIoFAGSnWtsW
         3oh1fs5iZ4pX78GbI94QKhFeSlJJ5DYga/weBAxncE4S9s89uihSf2t9YYmN0rhTq3sl
         V69G97bXVGyyVFvuNq1N1v4HgLVbM/xaNZdpOVgiKQOux7718J3YGdDxCIpYlNn6W3Yw
         9gooGBtfxCnfuc/Nn8WGFVujpzTpwcb+t7LEuONTp2ZMuN9aURxOT63CkWhZf+TU+qnu
         5BeXz9f+CzJ8E/Q1mZv/83E2TW+nzV5qJbW46xWdXHT8DwYQ/22bMdrsD1dvf9BE2JVX
         1b0Q==
X-Gm-Message-State: AOAM530rRoejwXcV36gy1D77Wo/VXjJjmq6OEsbMYFkr4+poW4sKxgu9
        z6p6IKA/o6cm8bpbu+zejo1j7Ave0ku1a6jc
X-Google-Smtp-Source: ABdhPJzt4KydQMfivZ4TtsHXZGOnnEGOITz6dZoGewEs79/um0mmV7/DeNAfZsNSlK20h4ByZa5lew==
X-Received: by 2002:a17:90b:1749:: with SMTP id jf9mr2939837pjb.212.1629910809917;
        Wed, 25 Aug 2021 10:00:09 -0700 (PDT)
Received: from skynet-linux.local ([106.201.63.141])
        by smtp.googlemail.com with ESMTPSA id v17sm338508pff.6.2021.08.25.10.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 10:00:09 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/4] dt-bindings: soc: qcom: smd-rpm: Add compatible for MSM8953 SoC
Date:   Wed, 25 Aug 2021 22:29:42 +0530
Message-Id: <20210825165943.19415-1-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210825165251.18358-1-sireeshkodali1@gmail.com>
References: <20210825165251.18358-1-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Document compatible for MSM8953 SoC.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Signed-off-by: Adam Skladowski <a_skl39@protonmail.com>
Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
index cc3fe5ed7421..77963b86b714 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
@@ -34,6 +34,7 @@ properties:
       - qcom,rpm-ipq6018
       - qcom,rpm-msm8226
       - qcom,rpm-msm8916
+      - qcom,rpm-msm8953
       - qcom,rpm-msm8974
       - qcom,rpm-msm8976
       - qcom,rpm-msm8996
@@ -57,6 +58,7 @@ if:
           - qcom,rpm-apq8084
           - qcom,rpm-msm8916
           - qcom,rpm-msm8974
+          - qcom,rpm-msm8953
 then:
   required:
     - qcom,smd-channels
-- 
2.33.0

