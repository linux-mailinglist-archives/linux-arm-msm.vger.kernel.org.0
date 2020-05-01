Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E2C1C20C1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 May 2020 00:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgEAWdP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 18:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgEAWdN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 18:33:13 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52231C061A0E;
        Fri,  1 May 2020 15:33:13 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id x18so13419974wrq.2;
        Fri, 01 May 2020 15:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l1iUiHlCX8vszl1pLIMm9oBcP0m3wLHIgAhR3pi1/gc=;
        b=FH3toebpbf24518LoXwizU5siw7UX9ZFwKGT403KZIQm2SvyJ7yhnbuCTH+b9Cdiby
         BVrCXsCnUg8FaC7EbSKQ5BHRfSdOv8ir1KMGfWAf8obOX0+YuusFIzRpV/+szPHmoh4g
         5Aa0pYbgJ/nWOrgJ51XRQ4afVtNUEfHi/XIAsnwigwa98Ih5RXfGJNUXv/gUT+Xc0Qot
         wWdyNNA7bioMvVMBJsrt1Q0aJxJWNiggmb6c4AysLnLEBSuaqi2egQegOqwP5VeR1W9X
         QyOtagSG06RUGlqDqsyOw39Cmd0wvfFNULupiApQOzG4mzvxZ+4bFGW7f+isnJ5cAdzb
         cflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l1iUiHlCX8vszl1pLIMm9oBcP0m3wLHIgAhR3pi1/gc=;
        b=L+7wqiobhFJWWoHfT3gP8Ijh3KTP79seXP3hO030taA4yJJ0KUJuG9d2Ntazvmj1wa
         akLghKGXJa0gAKojtoPgL4+3DEtuHfABV5RT4GwcHc0DabvAxgip59qmARZhWP+r6w9d
         IfGzzoWBrton5lmFv/THv4BXuVevp4g3LiZ7p3LHH2eqgncUiXOVS1sIg/WuNBY0ZnoS
         LEW2b2gSxG48sXrlXMWtezbjRJh4ILbkLLU5RUw5F+P3qJzD0VJ7kTOYsuH77bHeOIxK
         Xm3waGUxZXopd8s11zyWZmwQoPi3hqSAUrq4KNiQxgozzSr2QZ67eElxqyFPHBclCnfJ
         Ne6w==
X-Gm-Message-State: AGi0PuZrlp0Pkbeeg4C8rnIbJlAg9jqDnozZeev0DiN5ErxXVQh/+KC8
        7BskMmRlWAXIRGRGBQGG5uE=
X-Google-Smtp-Source: APiQypISQnXBlkEKKggPdILRkZOQxcjW44onLqbEjhVTrQWmpR/UBmzyUGw5aatNiTX+ohW4DBSw9w==
X-Received: by 2002:a5d:4905:: with SMTP id x5mr6995455wrq.158.1588372392144;
        Fri, 01 May 2020 15:33:12 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl. [83.6.170.125])
        by smtp.googlemail.com with ESMTPSA id n9sm6237750wrx.61.2020.05.01.15.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 15:33:11 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vincent Knecht <vincent.knecht@mailoo.org>
Subject: [PATCH 4/4] dt-bindings: soc: qcom: Document MSM8936 SMD RPM compatible
Date:   Sat,  2 May 2020 00:32:32 +0200
Message-Id: <20200501223232.275800-5-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200501223232.275800-1-konradybcio@gmail.com>
References: <20200501223232.275800-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vincent Knecht <vincent.knecht@mailoo.org>

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
index 616fddcd09fd8..55f8abd845a7e 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
@@ -21,6 +21,7 @@ resources.
 	Definition: must be one of:
 		    "qcom,rpm-apq8084"
 		    "qcom,rpm-msm8916"
+		    "qcom,rpm-msm8936"
 		    "qcom,rpm-msm8974"
 		    "qcom,rpm-msm8976"
 		    "qcom,rpm-msm8998"
-- 
2.26.1

