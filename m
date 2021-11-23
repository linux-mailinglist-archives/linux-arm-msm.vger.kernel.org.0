Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA7345AAEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 19:08:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239618AbhKWSL5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 13:11:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239498AbhKWSL4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 13:11:56 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E252C061574;
        Tue, 23 Nov 2021 10:08:48 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id e11so12756639ljo.13;
        Tue, 23 Nov 2021 10:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=56dyo2B5WxLSRjH8dLU5dNlhfoG71/Hfm6ftni52IYk=;
        b=CR7mbvgSr/cJkFxHEQ+ms+toHQcxH851XqAFwpfJzz543FrfgIc8MQpdwUhXzzYFKl
         pXCW3vi6SXprCzAHzHVeXJN+yOs7hkyZOPNDX99021nhSF61L6Twl4ck/S3kVGT+bEHU
         GF/NbWcjnyKmGnVoD0zzGEi8OO8t6Bm95pHTmTCYznQ5E7tKCCRtS0lNjZTyk0x66ulK
         PybjJTn7CSRs+exbZihltyyqAP+vsIHYIhfhiFeJBGMfM4HxGSYvp1MHuUSz6wulADJq
         zwS6HgizVuyYE6Cs7ifNG1N5GaGW9viZpcd6ZTHtdKyTf2+D4vN4O+NXz+QD2YT8k6q+
         Dv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=56dyo2B5WxLSRjH8dLU5dNlhfoG71/Hfm6ftni52IYk=;
        b=u4lkkB17NaTjUxkr0a8f03v6n651Q95PagGe+RmpXTThNTPHy+rD+6W/RTJmcrdaub
         2VMl8pljUeMNck9n60hireMbPqxxldUgBaUNV65Am1bgUbyuawEgJQTRLK2i8Ff4EDsq
         WVN4nm1IMP8CxoJHV2H48vJSZfyCLnnITkLx+dsAT/VPuwlm4j2VaKFlFMVvmDGh9R2D
         kX1sCHtJhVEXl/BVvv3h4wzq6ZlYWMkQyqO3YFnfTtPomb8UNeg2Imu0RbA98etCG5Bo
         ypfMl/Gbfswv/wK8w5wUooZEkgFx2IIJj8TD4mtDyb8YGYBQBTyXeQoKgv3j6VisWi67
         INvA==
X-Gm-Message-State: AOAM533rrkdyDVmlK23r4MPBKVTaoMl4av9GcOaIxTkMLWi/Q7U9ehEG
        K05nJCfGblq2A5IEE6DdE7M=
X-Google-Smtp-Source: ABdhPJzSLfpSBsiDXgtGymQV5xPGQ2oxpL3HVL4A7epVul9quMnngyVM0xyR9B/ohIxO24hH2VUneg==
X-Received: by 2002:a2e:a483:: with SMTP id h3mr7641944lji.106.1637690926436;
        Tue, 23 Nov 2021 10:08:46 -0800 (PST)
Received: from localhost.localdomain (public-gprs375115.centertel.pl. [37.47.96.140])
        by smtp.googlemail.com with ESMTPSA id q1sm874981lfh.234.2021.11.23.10.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 10:08:46 -0800 (PST)
From:   Dominik Kobinski <dominikkobinski314@gmail.com>
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Subject: [PATCH 3/4] dt-bindings: regulator: qcom: spmi-regulator: Document pm8226 compatible
Date:   Tue, 23 Nov 2021 19:08:16 +0100
Message-Id: <20211123180816.2835-1-dominikkobinski314@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211123174127.2261-1-dominikkobinski314@gmail.com>
References: <20211123174127.2261-1-dominikkobinski314@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Suggested-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
---
 .../devicetree/bindings/regulator/qcom,spmi-regulator.txt        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
index 2b544059e029..c2a39b121b1b 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
@@ -6,6 +6,7 @@ Qualcomm SPMI Regulators
 	Definition: must be one of:
 			"qcom,pm8004-regulators"
 			"qcom,pm8005-regulators"
+			"qcom,pm8226-regulators"
 			"qcom,pm8841-regulators"
 			"qcom,pm8916-regulators"
 			"qcom,pm8941-regulators"
-- 
2.34.0

