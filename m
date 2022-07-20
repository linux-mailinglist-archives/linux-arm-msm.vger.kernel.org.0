Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5772457BE90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jul 2022 21:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiGTT2V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 15:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233242AbiGTT2T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 15:28:19 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5EBE48CBB
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 12:28:17 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t1so31829176lft.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 12:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wNZixQIVMM5cgbKLPHlCP9vKpBMPmBAT1ydA/H1f1s4=;
        b=tpKCcxEl8+oxoo2zEMJhSvbTJeK+o+cpP+oKIynpmuddKZchQMZWajV/052C7krzwF
         BTA4VgjMIhR4NmKsoaV+EbxjsJ14xYSmrlzBupEBufKUK6vsWNUDx+S9aPlbTfEy1Y+X
         7cDtB2fymrtJhUNs2gKOLVGVqeoIuoUgTnxacaiVep2syF6uBWkveN5fHPyJJxG4OBu2
         o4WttYw1DEz/vruR5foIqMp6B5lTWe2mRSDjV8AeljGq2G7XSATpC2mXitOSvLXFFZxl
         Nra1xzwXXMpE5wjGawefd+kN1yBsDunVOO86+TW0VjuZjG0nF/EXw70uJSevPT+LfLCf
         SmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wNZixQIVMM5cgbKLPHlCP9vKpBMPmBAT1ydA/H1f1s4=;
        b=UWbjWAVYTm8zxXEMHaI8FMhDmUs+kTJPo6ZzN7UhVDhC9VspYBSS8CKEjL2TpViF4c
         FkklbbbgKIxfgCQzAyeg4TS1efVoyULGiD83JZXxPq8ohIHJqNFnSKShmcPh+6POnoFC
         VibujmYw3sDYz4eaprTwni9SngQ79A2pi/9PNqO2OJTVBorwN9PRFxx8ASYm09MvNQqa
         G1KS7ec5SCaKmDqDc7c28/rPw6YLh6yll2TqxYDt16e/ZdKhVyzVk8f47Xh2VdcepHCd
         2U6lusnwuAgjbRsnuwJpEExQL6NiodvqP/y+5yuVh+4oZR+fyyvTesQ2I4tA9tDvJhrH
         77Pg==
X-Gm-Message-State: AJIora8BCHuL7xsV/Hk1yzHS3u32OmFWRuVSu0DQos4sHJvOdhynPin0
        3rlEwblGnAIpGHgrjvH5O2Z1Zg==
X-Google-Smtp-Source: AGRyM1scR0YrNW3uG6DEZa4Wfuh6o+mNWP35au04mwSpDZwaoNgjB84QcDBCcGwiiDU7ilbZ5SvZdQ==
X-Received: by 2002:a05:6512:3c9f:b0:48a:2c32:e22c with SMTP id h31-20020a0565123c9f00b0048a2c32e22cmr13724218lfv.356.1658345296194;
        Wed, 20 Jul 2022 12:28:16 -0700 (PDT)
Received: from krzk-bin.. (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id h32-20020a0565123ca000b0047fac0f34absm3985771lfv.196.2022.07.20.12.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 12:28:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: [PATCH 03/10] soc: qcom: icc-bwmon: drop unused BWMON_ZONE_COUNT
Date:   Wed, 20 Jul 2022 21:28:00 +0200
Message-Id: <20220720192807.130098-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220720192807.130098-1-krzysztof.kozlowski@linaro.org>
References: <20220720192807.130098-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

BWMON_ZONE_COUNT define is not used.

Cc: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/icc-bwmon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
index 3415f42523cd..b76a59d9002c 100644
--- a/drivers/soc/qcom/icc-bwmon.c
+++ b/drivers/soc/qcom/icc-bwmon.c
@@ -105,7 +105,6 @@
 
 /* BWMONv4 count registers use count unit of 64 kB */
 #define BWMON_COUNT_UNIT_KB			64
-#define BWMON_ZONE_COUNT			0x2d8
 #define BWMON_ZONE_MAX(zone)			(0x2e0 + 4 * (zone))
 
 struct icc_bwmon_data {
-- 
2.34.1

