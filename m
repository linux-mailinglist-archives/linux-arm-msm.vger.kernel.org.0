Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C84B66C7EE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 14:34:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231562AbjCXNez (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 09:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbjCXNew (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 09:34:52 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330DD18B0C
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 06:34:35 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so1596815pjt.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 06:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679664874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3CRcwQcMX+LHn6yf6pY6I2ai/14Nn7fDLUto6EdhoD8=;
        b=CWiprUSZQrlq2pQoacmaIxBaSHOD4N+V33lcMtL5utNbJ1J8+IfWExN5DpwHBP4HAG
         AJQgZrSpJ5o0gdIEWQQunZKt+PKWBkRZnC2oNg6+Vnp6M6eGsAXd/1iRd92fRnbsalGI
         cZU73ze4FR/IqUwE2tU5W+KR7PPM5OvDDuICo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679664874;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3CRcwQcMX+LHn6yf6pY6I2ai/14Nn7fDLUto6EdhoD8=;
        b=UmMeaOnIp6yNK3otIjMoZf87IV4pKz9MxadIURjPVpDxyIVvD5Q22sD5vSULL/+l7B
         Lqd/ILtEJs5TsmL8DC9skqFrNb6+Oyn5N8PMnI0VCEm9vzZu6E19aaJ9WdrHbzwxaJ2j
         6UgvSJ/leXJ4j1ycGP1WUakgEQ19h282yRBLFZQqrGb5vZGtVTrhPXtsyxBiy6OIMTzC
         33Ge8zDx8gCohcIRD2KqjeiaJipOMtI5MaYGOInrKeSmmYUQk1mpxrUmiDcOG818Aw2u
         z3zJOHuScrs0DziYa+WrGocO+6BnxLrXDXZSe/xqP4SC9K12JxCWT076/I2682CJPzPx
         TAQw==
X-Gm-Message-State: AAQBX9d9uF4n4OrX3FaGUHrZ7ayYUTHQFnid5uU1/OneQ8nTBprGbKTj
        0nSi8PvBeRIR23Z/wnvltbyPPw20Uk412lPWe0A=
X-Google-Smtp-Source: AKy350aeN5uwsOA4IfitcbrEaACDA2x3waWJz/fZ3SYrJDPLHi27Q0yHJY/X4C5SIqngSyigZpFB7A==
X-Received: by 2002:a17:90a:b10f:b0:23f:e4b7:afb3 with SMTP id z15-20020a17090ab10f00b0023fe4b7afb3mr3022545pjq.9.1679664874686;
        Fri, 24 Mar 2023 06:34:34 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:16d3:ef20:206a:6521])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090a474200b0023377b98c7csm2916312pjg.38.2023.03.24.06.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 06:34:34 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: qcom-rpmh: Revert "regulator: qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"
Date:   Fri, 24 Mar 2023 06:34:06 -0700
Message-Id: <20230324063357.1.Ifdf3625a3c5c9467bd87bfcdf726c884ad220a35@changeid>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit 58973046c1bf ("regulator: qcom-rpmh: Use
PROBE_FORCE_SYNCHRONOUS"). Further digging into the problems that
prompted the us to switch to synchronous probe showed that the root
cause was a missing "rootwait" in the kernel command line
arguments. Let's reinstate asynchronous probe.

Fixes: 58973046c1bf ("regulator: qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS")
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/regulator/qcom-rpmh-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 903032b2875f..4826d60e5d95 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1462,7 +1462,7 @@ MODULE_DEVICE_TABLE(of, rpmh_regulator_match_table);
 static struct platform_driver rpmh_regulator_driver = {
 	.driver = {
 		.name = "qcom-rpmh-regulator",
-		.probe_type = PROBE_FORCE_SYNCHRONOUS,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table	= of_match_ptr(rpmh_regulator_match_table),
 	},
 	.probe = rpmh_regulator_probe,
-- 
2.40.0.348.gf938b09366-goog

