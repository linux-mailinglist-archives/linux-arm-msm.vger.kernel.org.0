Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B00CE7D5216
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Oct 2023 15:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234404AbjJXNqe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Oct 2023 09:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233153AbjJXNqd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Oct 2023 09:46:33 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CAC1C1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 06:46:31 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9936b3d0286so681005766b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 06:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698155189; x=1698759989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/PDZ9kO7G74nmKb1u4SH9mYF0IVyBxsHL5CzZjHNxg=;
        b=a2nmV7AAYue7cDE2kf8E3r2cs2/ufpJLS+2aXFOe6f5FbB+hA1iH5ah3ffb4loLVxv
         KdXSMdwnvuzoudP0tGIWbvx17n8sB3EFVRrGK33REZhDnYoeyXW6xDfTcCLHCZJ95d+q
         tLhD6R3UzUt3qsT48ZIX5dDHigRwXq8bAPlMM7urudRb/jCZuMR/62whvu5aYlnX7VDn
         ALzhFqA/3sqAsPud2J4qC0p8So+5Dy6GIAzU50P0G+DfvylZPwMpIsSvFKasEn0G+ZpK
         s2AXdjg6BOuoddcm1SJSBjUDhvQWH3ie1Ptt41ovEQJNh6eBrFwf2TfzUr/TofTyv9VO
         1UKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698155189; x=1698759989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/PDZ9kO7G74nmKb1u4SH9mYF0IVyBxsHL5CzZjHNxg=;
        b=Ap98AHDUa1bsC0pWPAObTjLQtzc2QR6mGGb8fKfbTZqZkOnC3756utALPCfQtyDjbX
         FN3Jfme6rOBCer9HOOIT6PvY11W2DoMJra8mNt/61gdnvT8jebvmx/zPLg+1T53v5/+g
         5ZJM0tSYxoyX0neunwILXOfBBFWjpIJbuy7DroeEiUqNrTRu7asuexgRc542JWg0t6YO
         3sc9ISffD3DsTYDUfTUMAbOkF4/4lNr99n3o3N2W8nvhzeRMpizqsaONwYHAAznFr1zs
         GkKJMD9loBT2qJFkj3EKyphxZCy1ev5anTZPMy5jXa2BbmDZHiTkZJTFnshSzGuW3CXI
         /Ztw==
X-Gm-Message-State: AOJu0YxcJKSDmCUQJ/FbPI/+MlZyYrs4M9a33SfVl376ikrcfOK6ueCS
        pPSCqT4JJU8skYPm83t8kyxAwg==
X-Google-Smtp-Source: AGHT+IF+1tfBFlWZ5ekM05Nq5pyNWfVPceFIGTk4iLH6nqXJP1nu6iyfuNMw3LtQyviPzDKHUaf2XQ==
X-Received: by 2002:a17:907:3ea5:b0:9c3:8242:e665 with SMTP id hs37-20020a1709073ea500b009c38242e665mr10019942ejc.8.1698155189411;
        Tue, 24 Oct 2023 06:46:29 -0700 (PDT)
Received: from hackbox.lan ([86.122.213.220])
        by smtp.gmail.com with ESMTPSA id og43-20020a1709071deb00b0098951bb4dc3sm8320367ejc.184.2023.10.24.06.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 06:46:28 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH] regulator: qcom-rpmh: Fix smps4 regulator for pm8550ve
Date:   Tue, 24 Oct 2023 16:46:26 +0300
Message-Id: <20231024134626.2364426-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The type of the smps4 regulator from pm8550ve is actually FTSMPS525
medium voltage. So fix it accordingly.

Fixes: e6e3776d682d ("regulator: qcom-rpmh: Add support for PM8550 regulators")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index d990ba19c50e..b2e359ac3169 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1095,7 +1095,7 @@ static const struct rpmh_vreg_init_data pm8550ve_vreg_data[] = {
 	RPMH_VREG("smps1", "smp%s1", &pmic5_ftsmps525_lv, "vdd-s1"),
 	RPMH_VREG("smps2", "smp%s2", &pmic5_ftsmps525_lv, "vdd-s2"),
 	RPMH_VREG("smps3", "smp%s3", &pmic5_ftsmps525_lv, "vdd-s3"),
-	RPMH_VREG("smps4", "smp%s4", &pmic5_ftsmps525_lv, "vdd-s4"),
+	RPMH_VREG("smps4", "smp%s4", &pmic5_ftsmps525_mv, "vdd-s4"),
 	RPMH_VREG("smps5", "smp%s5", &pmic5_ftsmps525_lv, "vdd-s5"),
 	RPMH_VREG("smps6", "smp%s6", &pmic5_ftsmps525_lv, "vdd-s6"),
 	RPMH_VREG("smps7", "smp%s7", &pmic5_ftsmps525_lv, "vdd-s7"),
-- 
2.34.1

