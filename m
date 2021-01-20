Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BECD22FDDF2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 01:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbhAUAaq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 19:30:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403953AbhATXV5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 18:21:57 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27496C0617BE
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 14:48:54 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id w124so88331oia.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 14:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PuVWjtozf6tjlsvTP6rUGUhjtA8BmU3safV4j5QLlLQ=;
        b=nlGl7XkCn0rg50zVcDNjsmuukkfEOvpVyBlVcaMu/H4VJ2N65Ja8HThIAVmA0XvKUE
         I3Lt1N0/nKH/HuzFXYl7u4q3a5weK9gxb2QRWGXVeH+KM+fvd7apdKvmNjKqDGva/F0y
         5qs7KuuQAKD86CGeszH9jvRlqrEbHllHJu0HoijQHuMT6QnSmYmV6tbaAbsEI1GQxUNz
         QcOSj4jnh1+80PgrS0RQKVoYEXRmXREsA6hSYsC1ovBriluYFk7VjOugxE4Y0zvYkGtK
         s1KbFvMFDC0elSWxWy3Yioq/fnmb0QKRQmN1fvgUWDoQ/LrezOynlQFJeUy1nVycTBuW
         sXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PuVWjtozf6tjlsvTP6rUGUhjtA8BmU3safV4j5QLlLQ=;
        b=itVfz2wiBtb4jmEj3R1xQRzoJCX5oN7kyYLvGAib0e3fk38B0EUqInafeHIMwiJIcC
         FYmsDh/ZrMrc//rNH8ZhC4REVwGS0FKPq4C9fDAVdwGIN4uSURpmCOtENocPp7aghiug
         zMZesrkf/mqmHmQzyjB/RcvomhjOdBer39n8+8C1DtWK20Bt07T2/plAhGMcZcLf27/F
         2R5m/LBhKxtGnC8COQWyPKbNhcQwA6VvfIOJxUqhXwTYZYbRDcPgO7PevUkSlMW3C45K
         Gg8IO/C2M+FhPGGf51xbckKAo+hjf9+Wcx5Pl2sxRwQwRKqt8qa0JSzk054VqLlCWyjG
         UINA==
X-Gm-Message-State: AOAM530iVMIdbKBLO0uqby+JWw/uNOikaYGNcsEmmrenIezukYBfwm9R
        oBfqVqCaoNAaXstZgAUQPaDVQw==
X-Google-Smtp-Source: ABdhPJxZqWHSauMNZuTKTGMF6uVC1ybsgbKaS5vmmG55n9fCvqGa+cEE0LBXhCfO/FIo3QTGqSpuyA==
X-Received: by 2002:aca:4e12:: with SMTP id c18mr3008348oib.68.1611182933617;
        Wed, 20 Jan 2021 14:48:53 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r14sm706740ote.28.2021.01.20.14.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 14:48:53 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: regulator: qcom-rpmh: Add pmc8180 and pmc8180c
Date:   Wed, 20 Jan 2021 14:49:00 -0800
Message-Id: <20210120224901.1611232-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add RPMH regulator compatibles for two of the PMIC variants used on the
SC8180x platform.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/regulator/qcom,rpmh-regulator.txt       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
index 7d462b899473..ce1e04354006 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.txt
@@ -50,6 +50,8 @@ First Level Nodes - PMIC
 		    "qcom,pm8350-rpmh-regulators"
 		    "qcom,pm8350c-rpmh-regulators"
 		    "qcom,pm8998-rpmh-regulators"
+		    "qcom,pmc8180-rpmh-regulators"
+		    "qcom,pmc8180c-rpmh-regulators"
 		    "qcom,pmi8998-rpmh-regulators"
 		    "qcom,pm6150-rpmh-regulators"
 		    "qcom,pm6150l-rpmh-regulators"
-- 
2.29.2

