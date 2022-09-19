Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4EEE5BD710
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 00:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbiISWQI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 18:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbiISWPt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 18:15:49 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C06A64F385
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 15:15:43 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id f23so538393plr.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 15:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=uiQoRdPMS4bN6w+8uKf5shtNLKGDX6ztfUYVVzFqL5c=;
        b=Eg+8oByfDgeaBoiIDA4vMz/xjz5ElWim/fuU4FWVP2kxztwDGzpoyZHPklBETnh7er
         ZwioAwAveki45sv8afbzRH+6FMmKiT6R8DMxKJW40QkBnuXaG9q2QooQQSQ80qp3KNna
         xajYALDZRE06wxvBJ8OBQokzrRbA1zXHiD7i2pSCpMn3jyzeq8pjAMVbTf1r6lK1H1uR
         L9aevNS5n5IW1+c0z5eAkWm1CB2oX/R4FFCZlmc3Un7A4uQBhLDK6JajtxC3/TV8gPdA
         NHt3PPvODkbc1b8LMr1PQkl056EBO/5NUuYcfA/IJuT6rP5Qq4999SW+H9oiS/qlnk2c
         QLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=uiQoRdPMS4bN6w+8uKf5shtNLKGDX6ztfUYVVzFqL5c=;
        b=WwtWnS0ol42xLJ4kJXgHmVS+pm2IupVA3FuV+7OilGfPcupGiJW5nafXrpBKNBJRhi
         3rCooIGpCKFAUta7tFN/F2TbcRFZXvbpBRLybaYzixdSEBFWs5Z0moy10hUrSb2H8eVa
         5AzJEAVSNW+GL7JPL49/lsW5YqqUim9tAP0fJY55IoiJ912EYgv6At54ztuMkr4rqI3d
         Yj8NNx2fm7OYeJf3J3yHGZco4GqEX+RvFiZmKAdKdPcaFly/dHpifXrGtmlukj5t1eoA
         5qLX+7F4DR3SJReY/0p4+au1XWmRrUq9QHxTO7OnlZ4jlSabFZ57MtVFMOukUcofq737
         gdSQ==
X-Gm-Message-State: ACrzQf2v4GiOJBxCF5Z1I+OJCt24yzD84BGduAz8F1l4pASzxTpUtTDK
        fLrkPnVieiitWLAC0iMl7gNe/Athuo3qFQ==
X-Google-Smtp-Source: AMsMyM6u9rp/OLuvTeBYSpX2CjGqyvW8Wq53PaVIuY916O/uv/sM2oFqyY01tn8mGxysCHqRhkOeHw==
X-Received: by 2002:a17:902:c106:b0:178:8cb:2762 with SMTP id 6-20020a170902c10600b0017808cb2762mr1892852pli.58.1663625742398;
        Mon, 19 Sep 2022 15:15:42 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:6535:ca5f:67d1:670d:e188])
        by smtp.gmail.com with ESMTPSA id b22-20020a170902d89600b00176ab6a0d5fsm16198966plz.54.2022.09.19.15.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 15:15:41 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, thara.gopinath@gmail.com,
        devicetree@vger.kernel.org, robh@kernel.org,
        krzysztof.kozlowski@linaro.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de
Subject: [PATCH v6 4/4 RESEND] arm64: defconfig: Enable Qualcomm QCE crypto
Date:   Tue, 20 Sep 2022 03:45:09 +0530
Message-Id: <20220919221509.1057574-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220919221509.1057574-1-bhupesh.sharma@linaro.org>
References: <20220919221509.1057574-1-bhupesh.sharma@linaro.org>
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

Now that the QCE crypto block is supported on several
Qualcomm SoCs upstream, enable the same as a module in the
arm64 defconfig.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5a4ba141d15c..46d6c95b8d25 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1321,6 +1321,7 @@ CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_DEV_SUN8I_CE=m
 CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
+CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_QCOM_RNG=m
 CONFIG_CRYPTO_DEV_CCREE=m
 CONFIG_CRYPTO_DEV_HISI_SEC2=m
-- 
2.37.1

