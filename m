Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAFF220247C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 16:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728494AbgFTOs6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 10:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728486AbgFTOsy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 10:48:54 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A52F1C06174E;
        Sat, 20 Jun 2020 07:48:53 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id l10so12343428wrr.10;
        Sat, 20 Jun 2020 07:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v27u6v/4r31sW7R7IkR9sZihkmgxxumYeT7d83adnKc=;
        b=OYnTbuR6il1tG5KjtBy+vArm91YZogxWnqPbESp77/Onw2U/fKrADpDBSo/0KsmCDc
         YUagzEW/HavGJHAZBG3wWVKz0nAEM3XaQ2apTr08rLcQRJ/N4qDuX9jeIHp6ItXOQX0W
         G/L0nCkwXVzTB79mPQYjM0q2QwjRNxIumsiBNekE27g7iS2nI7mg0o4GFf6Eueew3Fut
         wLDgfjLJsQj1vjxPGlv8rRRgicPNB1TWhQMDLOEt/A/tbFhJ4RFAr54k0bTpLh1W0STG
         OKRI2ewOXm4+J1Bnqp+1+nq6VcrariCtzAObcSgdH3OB2KujHCC34X3x2cMcasdQ7J4J
         Z6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v27u6v/4r31sW7R7IkR9sZihkmgxxumYeT7d83adnKc=;
        b=CelOpqPxheebQ8YgxRJN6R9PPxNhxw+FvxlbE5QrvYZJ5LLSS1l2ddVzb9WwVP/gTr
         l0jrJKkuqEcNBTGiu9GxW/TEijyUfHnYhzyKqWEiWcPW2dj2sztJ/IKHSZeQTWuAzcyM
         3XJgbDWfW6Dt36ZCPehpWKiz12xdhfbANsWS8ZPRSBajQyZlxldwrrrjCjkWtOoKjLK8
         24uq3MDAjlvfORs5w8ZYqp7KHLI5pR149429btfoDUvsnRXaMbGZE9t9sTmoTIPvUXYO
         HtuQgn3Etyc1lbh6l15IfGSXAM6ss12H4f6AlmPyJdQgCaF280sDvZQ76Q99mrVFYC3M
         jfkg==
X-Gm-Message-State: AOAM530BlsVz6UNXdAzI81bw+5anwq8pLIQzlwnvLG8+dxjt8FbRqTos
        nPdg9PNeuyc9/OOngt50+tI=
X-Google-Smtp-Source: ABdhPJy0oUfHPrQtz+Livf9WWXVE+K4BDIIF+pwiwZ2m8cHsANAnzL08W0epU+CqTNQ+uZqdI5Qn2g==
X-Received: by 2002:adf:e287:: with SMTP id v7mr6044900wri.329.1592664532393;
        Sat, 20 Jun 2020 07:48:52 -0700 (PDT)
Received: from localhost.localdomain (abae138.neoplus.adsl.tpnet.pl. [83.6.168.138])
        by smtp.googlemail.com with ESMTPSA id 63sm11928379wra.86.2020.06.20.07.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 07:48:52 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 18/21] regulator: qcom_smd: Fix pmi8994 label
Date:   Sat, 20 Jun 2020 16:46:34 +0200
Message-Id: <20200620144639.335093-19-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620144639.335093-1-konradybcio@gmail.com>
References: <20200620144639.335093-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

s3 was mislabeled as s2. Fix it.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/regulator/qcom_smd-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index 53a64d856926..7f5c318c8259 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -821,7 +821,7 @@ static const struct rpm_regulator_data rpm_pm8994_regulators[] = {
 static const struct rpm_regulator_data rpm_pmi8994_regulators[] = {
 	{ "s1", QCOM_SMD_RPM_SMPB, 1, &pmi8994_ftsmps, "vdd_s1" },
 	{ "s2", QCOM_SMD_RPM_SMPB, 2, &pmi8994_hfsmps, "vdd_s2" },
-	{ "s2", QCOM_SMD_RPM_SMPB, 3, &pmi8994_hfsmps, "vdd_s3" },
+	{ "s3", QCOM_SMD_RPM_SMPB, 3, &pmi8994_hfsmps, "vdd_s3" },
 	{ "boost-bypass", QCOM_SMD_RPM_BBYB, 1, &pmi8994_bby, "vdd_bst_byp" },
 	{}
 };
-- 
2.27.0

