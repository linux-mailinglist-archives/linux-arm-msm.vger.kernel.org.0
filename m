Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2C5A198BDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 07:44:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgCaFoP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 01:44:15 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33024 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbgCaFoP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 01:44:15 -0400
Received: by mail-pg1-f194.google.com with SMTP id d17so9859005pgo.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2020 22:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uK3BmSb3QWPSt6rWVBQhv/InDeHrsw1A2WAoGEe/xYU=;
        b=UUO43VcnOlW5f1fQ4GHfzAUzGnoaDOwuPUrZrYIJVySTj2iCzKN8TX96Ya1GXb+ZkV
         Cv9x0bGCCo/R61aUBDkflXd8Too/h5vxt1K0t1WB1ZzB66XoHIZUX5NaaAXvpBwQ29Jv
         6FNpU/6LDfPQj2HiCcXgQstPKjI4qBOH4zgDJjJoKeKTqTZ1I0kYoVsgZPx/k6MFfw/2
         pm5pqZ7w9Qs9vUB2Vgu00R5TO2td97FHD+5DUfPSFozJZsOxUiqR8oAQStTQmvFcXQcw
         BRAsOHiwraBM6ddHj4EywNuHQ/32Cqczdjv69sHmA4E7oRqJZ0looDo1M+nriMh5gFSC
         jlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uK3BmSb3QWPSt6rWVBQhv/InDeHrsw1A2WAoGEe/xYU=;
        b=P4tJvTwSW+qL+CQEb4o+hHmfKu+1tBUu1rOcn6m03IW/mAGhVAIomGyLOK6D80eAId
         uSI5dhj1aXoPF58Vrjyp/vtcGYt8SPPz6LAOP/HNmRa2bPfwi5uXfLb/jH/v6iDBAmF6
         Rl9xb9h0O+QhbsSl4r+mW38W/lrLh4PvOh4ScQrS1s1ckdSWdqa6F6NXCsqaFszi/0CR
         1R5GT0fSFINxW7wgIYSHWwb3uxPryER/vailI33oimHxGbMQsIdq58Uhso7U+flkSQ1H
         kKF43J5aZQpzLRqGAsK5LNgR07FQm+SsRNbHw/IvTszbD108znhQKa1iP70GeSakzDv3
         cAjA==
X-Gm-Message-State: ANhLgQ22t8LsoyneAOP3gpCEsEOsJKIKvXAQJmWQo3b4ntTQj0i/eI/z
        hrsGeqCh4gEnszTzKuJ8R9HnA1/du88=
X-Google-Smtp-Source: ADFU+vubkUBYViYG1wiOE0PIkC4wOOUOcthcv6nrmXRSLZrwr2SnZnpdw6z2qt3JJpncraWpwspdng==
X-Received: by 2002:aa7:9a45:: with SMTP id x5mr16941750pfj.248.1585633452726;
        Mon, 30 Mar 2020 22:44:12 -0700 (PDT)
Received: from localhost ([45.127.44.10])
        by smtp.gmail.com with ESMTPSA id w27sm11527583pfq.211.2020.03.30.22.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2020 22:44:11 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, sibis@codeaurora.org,
        swboyd@chromium.org, dianders@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: cpus: Add kryo468 compatible
Date:   Tue, 31 Mar 2020 11:14:06 +0530
Message-Id: <18123f08bf1e60f6f7356c53f355884883b0897f.1585633235.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Kryo468 is found in sc7180, so add it to the list of cpu compatibles

Fixes: 90db71e480708 ("arm64: dts: sc7180: Add minimal dts/dtsi files for SC7180 soc")
Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes since v1:
- Added fixes tag
- Added acks

 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 0d5b61056b106..4cece4c27b73a 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -156,6 +156,7 @@ properties:
       - qcom,krait
       - qcom,kryo
       - qcom,kryo385
+      - qcom,kryo468
       - qcom,kryo485
       - qcom,scorpion
 
-- 
2.20.1

