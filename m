Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEEC1B3FD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 12:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731603AbgDVKk1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 06:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730139AbgDVKVM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 06:21:12 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2A3FC08C5F2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 03:20:57 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id d17so1695543wrg.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=123u9I7LwrG7OqauG/EgayFD4qVNvmiu3Wq50pc/uqc=;
        b=GvNKDJfeh4dQsO8mnI588YI2+9PpMuErH9kG2Ok/GZC9xY5NOMt9q1qJZrqmGVMUZK
         R4sR2TNQO5gXPNlLTiiVmKvSNzArGmbUIr9yPqT1Y0dUpt+5Hfh30s8eDZ1nhX+FYHLv
         zNHDnSM9BSKH+LqlQn21ZUSUMVJuesdnj3M6ZsBu5gttTYxuyFN14IGmKUNGGckLRYgy
         /AJAAMCPn5+p7w36EAidIpMXqzdLrfGwZHODddvNxpFzf7YfLjP4K05bRiPrMJwpEftD
         vKHFD7PdJNhNsHpfeIHciBjKhzwVDIlIcTnsHMr0936gNrAhM6aCSewT+xKhNeEIKi/s
         h27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=123u9I7LwrG7OqauG/EgayFD4qVNvmiu3Wq50pc/uqc=;
        b=RPHCPn8Q2kIXfRvFESt7JL1JPJjzYR6dxdx0e0gLbT1hhCLyF1ON6BFzT3r4KgHp7U
         uLpXv1Y6VAfuA0d2JwxvW4BqGKbJxK0BD8mLnMjWJbJ6JzrnzTPNfiiQ7riszIynLpmq
         OuPpwnin+dsGsJywZ2WH8aDdHgKVDUKBlKvC1ym9GpMccDugbwFChmktr87TDQjav5gJ
         l1zIqQQieMmzFtIpYuOEMQdwhHPly6QLmenoq74s71StN9Wjmm0CvnAAN8DQHLR9/oJ2
         Cj+b2HqAwcuxL7LEaE9PYCpp61F5yX6ER7wMdXACw/NzXh79d5kjt7AM9gMSZ9K0PkbZ
         XtaQ==
X-Gm-Message-State: AGi0PuYkR/n28CBBM21VOo4tmFp4eyKeClzvwUO7zhFxoFS0ouzxHomb
        MV7GwER0RZphI6no6w/e436xNg==
X-Google-Smtp-Source: APiQypJt2yJqpBjOpfZHuVtBJqDu3oRBOVm+IrdDn08DJb66CNt9BsvawPp+OzA7IVCouOqPrEL82g==
X-Received: by 2002:a5d:60ca:: with SMTP id x10mr28404439wrt.407.1587550856176;
        Wed, 22 Apr 2020 03:20:56 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id h10sm7792460wrq.33.2020.04.22.03.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 03:20:55 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/2] arm64: qcom: c630: fix asm dai setup
Date:   Wed, 22 Apr 2020 11:20:43 +0100
Message-Id: <20200422102044.8995-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

"direction" property is only valid for asm compressed dais,
so remove it for non compressed dais

Fixes: 45021d35fcb2 ("arm64: dts: qcom: c630: Enable audio support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 3b617a75fafa..51a670ad15b2 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -359,12 +359,10 @@
 &q6asmdai {
 	dai@0 {
 		reg = <0>;
-		direction = <2>;
 	};
 
 	dai@1 {
 		reg = <1>;
-		direction = <1>;
 	};
 };
 
-- 
2.21.0

