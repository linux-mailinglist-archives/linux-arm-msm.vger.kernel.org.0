Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1EA25BCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2019 03:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727681AbfEVBxr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 21:53:47 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35044 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbfEVBxr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 21:53:47 -0400
Received: by mail-pf1-f193.google.com with SMTP id t87so433813pfa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2019 18:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=LlxRyT+mbsnTVNTKSITBJmRiSrxfctVw8atQ9aC4s90=;
        b=LQZb/vjKAJSs4KcX5G91N4TfJF4lnwNCerToC7NPX0ZiF1SeZmnFrgslAo/Ehj7Ays
         vTcCigfoicBqFk3/cFD25tDvPYKCmuopKzOB9wZjNGLQMLqTfqSMXsx5xkIp+TMIwZ9p
         /aXA51kU0Nw4LB1636JvDgComqQYYS4O/aMmzkr0gDOAEC12uRDf2ha+OI7/Z3OsqBol
         +FaAMtdRYzoIKo+08tsZE0kpHNdsf/Cu9bAGhJwVHeDBpxKDY4Mz182jLQLSO5yH6hoI
         EQSNJLOUtcDP930SVt0p2UpKO/ZuX2YeviTNEAGqBjGHhI05Yul6Y345Nfg4CEuAk8gr
         feiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=LlxRyT+mbsnTVNTKSITBJmRiSrxfctVw8atQ9aC4s90=;
        b=DT8ejWGqXUj3psKe1avr251HAa5OgYLkBeOEoFHSx0uDOBdrjA0K2mxXVmeKlOSvcf
         3AqS5n+2NIfQ8gJBxPwm3Km7OWXB8SzbU9jdymqmxYemuWBWdgm8qyOHQrOAOg/9Gx3k
         LUiHDA8bXmMMwm1iFdIa2On5HjMGsAnxSRUSHc7+nRJ/W1Upm3WA3X1xQUFEqJ9tcTdl
         nQRiSrfTaCmpxbPIORcY5S8YWUTQeejS4nMi5dHUeJjio/10+7TbAVmdV2lZmtycsgh0
         D+T+huCVXdgsfHRj6qcVZQaJ5/EHRTYmfdnGtEw6Hc+a15eIuMn962rNiD5o/NnikiJe
         nq8Q==
X-Gm-Message-State: APjAAAXlY/vvgdCU6Rlk6pDiMy30z4eqPqf5lLfywE4pIQjq4/n+tv+z
        HnKeznaSTMKLnTgU/aZyOiGxCQ==
X-Google-Smtp-Source: APXvYqwErOiQXUAm3LtR1L1z9k+pkiWT1RA4VF+qZwNsLRF4A82r6eTtgvGC90jKTyxYHpvWhI1kmA==
X-Received: by 2002:a63:700b:: with SMTP id l11mr30923085pgc.449.1558490026123;
        Tue, 21 May 2019 18:53:46 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i27sm47073805pfk.162.2019.05.21.18.53.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 18:53:45 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org
Subject: [PATCH] soc: qcom: apr: Don't use reg for domain id
Date:   Tue, 21 May 2019 18:53:42 -0700
Message-Id: <20190522015342.29501-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The reg property represents the address and size on the bus that a
device lives, but for APR the parent is a rpmsg bus, which does not have
numerical addresses. Simply defining #address/#size-cells to 1 and 0,
respectively, to silence the compiler is not an appropriate solution.

Replace the use of "reg" with an APR specific property.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

The APR device was recently added to msm8996.dtsi, but this is still
depending on working SMMU to provide functional audio support.

 Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt | 2 +-
 drivers/soc/qcom/apr.c                                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
index bcc612cc7423..38d3c06abc41 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
@@ -9,7 +9,7 @@ used for audio/voice services on the QDSP.
 	Value type: <stringlist>
 	Definition: must be "qcom,apr-v<VERSION-NUMBER>", example "qcom,apr-v2"
 
-- reg
+- qcom,apr-domain
 	Usage: required
 	Value type: <u32>
 	Definition: Destination processor ID.
diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 74f8b9607daa..b83d71b2e0a4 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -276,7 +276,7 @@ static int apr_probe(struct rpmsg_device *rpdev)
 	if (!apr)
 		return -ENOMEM;
 
-	ret = of_property_read_u32(dev->of_node, "reg", &apr->dest_domain_id);
+	ret = of_property_read_u32(dev->of_node, "qcom,apr-domain", &apr->dest_domain_id);
 	if (ret) {
 		dev_err(dev, "APR Domain ID not specified in DT\n");
 		return ret;
-- 
2.18.0

