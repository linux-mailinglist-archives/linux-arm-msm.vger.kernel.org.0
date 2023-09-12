Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E36179D24E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Sep 2023 15:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235767AbjILNci (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Sep 2023 09:32:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235772AbjILNcU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Sep 2023 09:32:20 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CF7019A6
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 06:32:05 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-403012f27e3so37063545e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Sep 2023 06:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694525523; x=1695130323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fIbXPUxOgaRdqz8db2Ih/LEJAu25y/8yx2Z1zWWYkc=;
        b=h+VXIbylKDiTqHIReWFnyM2iADHgbBv+i1XpXVekNobbAPZ2W2XIzZK+Tjz4y6YA2W
         GS3SM9ZFUdfJgVO5dokLOT706d7X8t4xwU1Yq6Ca/LyQq4rHhXWAncDTjtPoojQuldGP
         PPuL6tuZQ14m0iLV1uVigooMGCYR0VCTS55glBrUlCG/KKFYydi3u+qMKeOE7OM3dicC
         3GQHgoMcWQSPjVqINUdyGG2BdBXsw9WPtM95mCISqTPE8iAszz/btUT4vKKymkrkiwdx
         PwU2b6no1yivQ/RAV391143ufIg3PkzB6kBoe3s03ZDdifGDcNBqpLgoVXjWWiEUBc3b
         4NTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694525523; x=1695130323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7fIbXPUxOgaRdqz8db2Ih/LEJAu25y/8yx2Z1zWWYkc=;
        b=Nj+sOTUbFVbF7Ebtk37Qba9naqd64951WkU5MoSHB7EMTGKbbEhgYJF+wsSwstvMcj
         G3UNLDHe8laW68eI5AaXC6B3ZeldO88r6UvyyZHI5LG5EizaCmmxefP7FbY5Stw0ew+G
         /TYEnETmnqUvXYMNTt2axS/zQClKoOkmrvEquJXOnz7h/unh2au5orMU861lQ02M99LP
         3TZt7WxCRvuvY3Ew25SHDV5avU7WicFjgNFMWF2F6E8RPtzcABkgbp6GX8TuqPKKyJuD
         DOYBfsm5X2Ndn5Bv9gpH3dZ7DORUN4azgtsRcvs6YqYl3pLzhTt3OQJKmyCWc0GxNvr2
         l7iA==
X-Gm-Message-State: AOJu0Yz8wrK4Ys3EcaaV38H/my+f2J+WLPIz/E2vkUFBulYN13wgs4+r
        9EV/01RZaj+4+K6fUcKxDr6KHw==
X-Google-Smtp-Source: AGHT+IHzJIPQHME1Q7uvTkr6fW7CEioQdhde5+dmoERPBsutUw7GSxKetx2FMzynENM3rKV8xd5oDw==
X-Received: by 2002:a5d:448c:0:b0:31c:7ada:5e05 with SMTP id j12-20020a5d448c000000b0031c7ada5e05mr10020874wrq.51.1694525523578;
        Tue, 12 Sep 2023 06:32:03 -0700 (PDT)
Received: from [10.167.154.1] (178235177248.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.248])
        by smtp.gmail.com with ESMTPSA id j2-20020aa7ca42000000b0052a401d8ef6sm5983830edt.71.2023.09.12.06.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:32:03 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 12 Sep 2023 15:31:46 +0200
Subject: [PATCH v2 08/14] dt-bindings: remoteproc: qcom,adsp: Remove AGGRE2
 clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230721-topic-rpm_clk_cleanup-v2-8-1e506593b1bd@linaro.org>
References: <20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org>
In-Reply-To: <20230721-topic-rpm_clk_cleanup-v2-0-1e506593b1bd@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1694525501; l=1615;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=nFM/c4yhEW/1Dlnb7a6ypwnImP1sGtGxirXiBz1eak0=;
 b=JDyPUD41UqorWQJn/tchpJ3anwshIH4V9EmIuE8LBebXP25/DZMh3KXg4CQrOMQ4VZ/xrZfs3
 iIhGTWcO1/6Aymi8D5hrH5z4wKppS/IuNsDm4BZdJkVbXR+2a1OMcBI
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The AGGRE2 clock is a clock for the entire AGGRE2 bus, managed from
within the interconnect driver. Attaching it to SLPI was a total hack.
Get rid of it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,adsp.yaml    | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
index a2b0079de039..661c2b425da3 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
@@ -66,7 +66,9 @@ allOf:
               - qcom,msm8953-adsp-pil
               - qcom,msm8974-adsp-pil
               - qcom,msm8996-adsp-pil
+              - qcom,msm8996-slpi-pil
               - qcom,msm8998-adsp-pas
+              - qcom,msm8998-slpi-pas
               - qcom,sdm845-adsp-pas
               - qcom,sdm845-cdsp-pas
               - qcom,sdm845-slpi-pas
@@ -79,24 +81,6 @@ allOf:
           items:
             - const: xo
 
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - qcom,msm8996-slpi-pil
-              - qcom,msm8998-slpi-pas
-    then:
-      properties:
-        clocks:
-          items:
-            - description: XO clock
-            - description: AGGRE2 clock
-        clock-names:
-          items:
-            - const: xo
-            - const: aggre2
-
   - if:
       properties:
         compatible:

-- 
2.42.0

