Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21B484A88F9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 17:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352344AbiBCQqj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 11:46:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242631AbiBCQqj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 11:46:39 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE2F1C061744
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 08:46:38 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id i34so7287491lfv.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 08:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6eCj/v8zX5auOFJWHqJA0245e7LfVyGUd0icgsO85GA=;
        b=QACmUevu70dLEDO4C7OXJEzJ/auhpnKawKYZ9fJ5cghANwS9BmlM+IBRUvSTaTNg6w
         an1Ex0u3Xr4d9n+5CeFq3wIPmeFbKLAFrtlD2zmZRUBN7ymf8/55hgJseG/FQTR9CJN3
         tz8Avn81lL5fIxmaBHhQYFmtuWvpPv8DhKLCf6IAVIyp9mqubknz7d7TtpMcwPj5+A80
         ijuPgZWFTrnBuL4//sFAttg2+l4gkE/pcRxhFtQ+pPWva9jSBQ7MuaP+WlBZneAnSwLV
         0ke92LZQrbx5+s6EG85J/o5zuHVSysVWZB00Nlh/yalDf2xsmlZme7t/q/9z7BVP35CK
         Iieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6eCj/v8zX5auOFJWHqJA0245e7LfVyGUd0icgsO85GA=;
        b=cfgfr7ta/RvvRBmugKWk+qxncapq08qbecnaNPr/Ly9KvQ3c/qXTIeQUCn/4c8xCPR
         mfiL/jgDbTatAcL9hqWOe5rdfDJGZOtgLqAgBvqO3a9VUPsyC1gq8l01RxafLmFDkKvu
         pPmkKiRCCw5IeF/hXpsi+aq63oRT/VsyWR47lSSw0NIVr/MOD0IZYALZBHwhpDZls74d
         yRNBpLAFOOvq3542Etzl6529lAcM9VQf+OmqNwi/2UJtdcRd/mbq19IGSXOx2NKhth9F
         IpBnniUSKy876LhMnVlU80mY40M3R17w3IN1jht859wRyYYB9+1exBlrK074Qhuo4mNU
         /YDQ==
X-Gm-Message-State: AOAM533x8ICYrB+CQVWlTzSudzi6mLpvwYXsAYb2Ni+xP1Du8RcYiEQq
        uz6Ub1+U7W8qwtwwfl8zBb5nUg==
X-Google-Smtp-Source: ABdhPJxsAyvdMto3oEeJ+xFPUhuckio4nahIIoeIh6orsZByx3/fa9XQZnFbY0cY/5bNGVo+ijpCKw==
X-Received: by 2002:ac2:4357:: with SMTP id o23mr28496643lfl.680.1643906797192;
        Thu, 03 Feb 2022 08:46:37 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id h6sm269999lfm.237.2022.02.03.08.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 08:46:36 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/9] dt-bindings: i2c: qcom-cci: add description of a vbus-supply property
Date:   Thu,  3 Feb 2022 18:46:29 +0200
Message-Id: <20220203164629.1711958-3-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quite regularly I2C bus lines on QCOM CCI controller require an external
pull-up to a regulator powered line, to be able to define all such
cases an additional vbus-supply property of a bus subnode is wanted.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
index 924ad8c03464..9f5b321748f1 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt
@@ -60,6 +60,11 @@ PROPERTIES:
 	Definition: Desired I2C bus clock frequency in Hz, defaults to 100
 		    kHz if omitted.
 
+- vbus-supply:
+	Usage: optional
+	Value type: phandle
+	Definition: Regulator that provides power to SCL/SDA lines
+
 Example:
 
 	cci@a0c000 {
-- 
2.33.0

