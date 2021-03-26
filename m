Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E089634AAA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 15:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhCZO7H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 10:59:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbhCZO6y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 10:58:54 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 796C4C0613B2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 07:58:54 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id r20so7741058ljk.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 07:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=poG+00NR3A/mJvY0huIpYA8eZO34WbE2BkLHQjye9Xo=;
        b=lTOosdYbCD9/gpjh2Jw/ASQJNPOr7lwvxyE/E+tTyeEwq3Pj8TRUsOikBb4yLo19t7
         kmu5p9/ICxySQmZrXOMi3md57VJ5Nind++mFrz5CiYormjAPBtT6zCQiDO+moqIwMUMK
         Ng/OQpT3oxaIgCrK7ZdG2ub/njE4msdqWLPW6kHfwPItBYeAdwH+g7lcJKQRYbUhqYYE
         yHwRPI12Grg1qa+m9uPcqKtIl2J0BbasxMQ8VIRO6GywG92egDKmVTwitEWsOToFCWj6
         MqVPWYYNTBLWhoK4hE15BIipnAQjQDQ8Kqo/Sjh6PCOqvFF8VxfeTeNN0C1olqzTAkOn
         WxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=poG+00NR3A/mJvY0huIpYA8eZO34WbE2BkLHQjye9Xo=;
        b=gZ2I5teKXBbaUQY/SmddlROv+/CqUFOzkzXRovvC0e+gd7tTvIe3en3EskEF0IUF8Y
         cnPj575T2P4PqgT85pbVeNsw4R8i/6c0zdVttYSfc5igYCLSJIoPPb4JSjZH5+hHBJth
         +rC6M8YsFwK1eYoLBGMCXfId/kvmMHWh0YslKkRbeDiOFLgehjjIC5LDuOpZpOLM/NE6
         OSJnj2VJdmL2eHJH/hJg66FdFzVwFbUw232NQZUPjfeS93AAc7lxbKXAL6lqCYA6jKNJ
         wbcjwiINFMKOA9aOTXP4HQeg/afy5eml5KuvgNAQBRmbPJ+uaAAX5P8NTbhqzB0w6wAa
         yDtQ==
X-Gm-Message-State: AOAM532k8MyyQfbtCiewrwx0MoEFr0FxbzgyU2yVoeOBUoJGfq2QRaKH
        p0eQbKZW8vp1KQyfa89kKpXPorrTKVf07ySsNwY=
X-Google-Smtp-Source: ABdhPJyQPBwS17vy4o4cDJyDTWBJcHrL3hLQRNn+/Ag329pJV9TjcbwV+wASNpObNwq3uGNp3Vep2g==
X-Received: by 2002:a2e:9c8e:: with SMTP id x14mr9326421lji.312.1616770733080;
        Fri, 26 Mar 2021 07:58:53 -0700 (PDT)
Received: from PackardBell ([82.160.139.10])
        by smtp.googlemail.com with ESMTPSA id k2sm893382lfm.174.2021.03.26.07.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:58:52 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 15a566f0;
        Fri, 26 Mar 2021 14:58:48 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH 4/5] dt-bindings: arm: qcom: Document MSM8226 SoC binding
Date:   Fri, 26 Mar 2021 15:58:15 +0100
Message-Id: <20210326145816.9758-5-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326145816.9758-1-bartosz.dudziak@snejp.pl>
References: <20210326145816.9758-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the MSM8226 SoC device-tree binding.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 11ec349d56..73902ce46f 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -31,6 +31,7 @@ description: |
         ipq6018
         ipq8074
         mdm9615
+        msm8226
         msm8916
         msm8974
         msm8992
@@ -111,6 +112,11 @@ properties:
               - qcom,apq8084-sbc
           - const: qcom,apq8084
 
+      - items:
+          - enum:
+              - samsung,s3ve3g
+          - const: qcom,msm8226
+
       - items:
           - enum:
               - qcom,msm8960-cdp
-- 
2.25.1

