Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D99112E41C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Dec 2020 16:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441073AbgL1PNM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Dec 2020 10:13:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439080AbgL1PNJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Dec 2020 10:13:09 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B4EC061795
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Dec 2020 07:12:29 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id h22so24596730lfu.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Dec 2020 07:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YNJS9fn7So0GAgGtiGVRg9HlgH1csfI40n8xQ2wlGR4=;
        b=iU7LSNsayaZYIC53A98xFYWcla6cmzkkxz/s3tK+1X1TvRCf8Hl7U9sL5FFZPE/Syz
         9vna7td9oQl/Zyq1CTce2degdYeyqamm31Aq8ioXhLxkHWB+c2QJZW7hTzHKM9QU6UYj
         foeIGRLifRHYDtr14aDiHCd83coput+Be+1bPJVmes0ZGolMhctpxwgZ4vXRSmmxu5Ch
         W1tGWHlBpoVWF+mY14wkYwT69vMv3BGgjrbn1U3BuD0UJm1IHPxYEs5yFfKogOdNrH+q
         13wpKe8pkqX1MT8Z78PYsoYiPHMdJo1ex2BIvbx8fG09iuYaSOmueIXHOFDuKRHHsOQ6
         f3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YNJS9fn7So0GAgGtiGVRg9HlgH1csfI40n8xQ2wlGR4=;
        b=T8NWWMIkBnkpvsmd5La649yb9Okis0hxLDce0kN6xW9Mj0Qq4PHLI7BxT2OmxZ5mr5
         udiDXBXPK5GEmB9lJ5tQI9gVQdT3YYNSfXDyupprP/pVwMm5OUei8BTy6SjbA9LyL06o
         qZywn+xGoau4VINRAi4+cjxDau4VsWByP6h6dKuz0nq79WRCK0tzWFGEJkPWjuP4NTq5
         OyyHOtRuzqn1PHiPpsDjJcY38jbqPItdscHjoBBMHjPrMwsvi8OyzlVEe/QtgZjzxi5B
         wv5qzZhP9k+bieAhQu7Y/MIKqOuG9BSXTCg0m2ggVk0lSxiN1bIPTrsVtJl9QvYCKCH5
         w/KA==
X-Gm-Message-State: AOAM5316yy4H18C/Aj1ZAEPtpDUBos1nGE+8e521GW1C/3+lfzuOAJoi
        hEOtyzuHoHvtZ2t6tL9TZq1vRQ==
X-Google-Smtp-Source: ABdhPJxzgSI3cN18jyeShBZ1fMO1FpZNcmQWk9tOoBLABwzaqT8Wb+xz2TxU2wiSOLWo3RZzC7CRBw==
X-Received: by 2002:a05:651c:1069:: with SMTP id y9mr21282525ljm.453.1609168347878;
        Mon, 28 Dec 2020 07:12:27 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id a24sm5336936lfi.192.2020.12.28.07.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 07:12:27 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: defconfig: enable display clock controller on sm8250
Date:   Mon, 28 Dec 2020 18:12:25 +0300
Message-Id: <20201228151225.4018477-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the driver for the display clock controller on Qualcomm SM8250,
needed in order to get the display working. This driver provides
power-domains and as such should not be compiled as a module.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6308c84b31b8..a90034e033f2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -932,6 +932,7 @@ CONFIG_SM_GCC_8150=y
 CONFIG_SM_GCC_8250=y
 CONFIG_SM_GPUCC_8150=y
 CONFIG_SM_GPUCC_8250=y
+CONFIG_SM_DISPCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_HWSPINLOCK=y
 CONFIG_HWSPINLOCK_QCOM=y
-- 
2.29.2

