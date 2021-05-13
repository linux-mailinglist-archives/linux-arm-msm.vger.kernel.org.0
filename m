Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBCC37FA2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 May 2021 17:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234688AbhEMPDp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 May 2021 11:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234709AbhEMPDm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 May 2021 11:03:42 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BECC06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 08:02:32 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id m12so40356309eja.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 May 2021 08:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OIXdSqEGkbHBOM/2TuUbjshekHlIgJ6Oep6duC2gNEc=;
        b=GdTxJdRCJzrk/Zh4va4SOCDJ/2Akzb25/t5VAKvkXpTPCWaLBodgxNCh9pPUUW7eSq
         PmoElLl89zSe5iLYKSyjMR+4tAo1ES1Aek0RMhKKQk96lWxXQTKDI3XijkXKIqVhjjEd
         DkvqSOankLexjGl3yCn4alKec9kOULZz48zFovlxw1WArq9PwUYt5mRykNaaAtQDkHir
         fCrH8vmXEC8lnrq1Vc34gvecGIMl83lsqGILLrjxH5icbJ/NEjMWQxREvOz8+oIj85OM
         h3v7sW415OeyUXvu0P8Ok9l/AMRqecEx8uVVg2E7NBBJxwK4OSVbgNp6wRa2e+q2LY6w
         I7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OIXdSqEGkbHBOM/2TuUbjshekHlIgJ6Oep6duC2gNEc=;
        b=b+McFalmiD/JnSON5sB6gQm4vKNcMf5KD7IWVnabyEvs4UtgWfJTpZfzw8psSK2k4g
         eSSLdOBZK+LIM0r2JNFpa+BhU9JAu0VXVpS2zkHw5BjJt8RSr8PNNC66JAg4w7VPkWEg
         61PAEHN/QTM9Thn8CJGy+nodYHiYgqjZC6RJbkZFVuiqby2rriGiDKEfUSlj+QoEW+B1
         nyFCzhak+WYlaYMaS5zD8zITOFXOLvK3iARVWTzJuzjuEqolM7YMjF0Z96HhR5eweqjs
         ldAyv5q69bAElKMj5G2cI8GArNvfCECSVTy3uGpMtNHgcyanOmmeNxAbhQhUyRCUo3Hb
         vx4w==
X-Gm-Message-State: AOAM53195tuqImyoUz+IHzZYm9XqXDuv8UNqdm1bgpVqe8XsxDsO4Lnd
        Oux+CjlsqhRDqIBqui3SUuIMb6N2mKn2JWXw
X-Google-Smtp-Source: ABdhPJz2i+QBqp3AltAlPmh+8rGt91M893Z/xkSmvi5ReDvLvm+GImdNmE4YSan9GELUbsI0QlFkHQ==
X-Received: by 2002:a17:906:c788:: with SMTP id cw8mr43512308ejb.190.1620918150778;
        Thu, 13 May 2021 08:02:30 -0700 (PDT)
Received: from PackardBell (192038133011.mbb.telenor.dk. [192.38.133.11])
        by smtp.googlemail.com with ESMTPSA id gt12sm1925824ejb.60.2021.05.13.08.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 08:02:29 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id bf99f369;
        Thu, 13 May 2021 15:02:10 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH 1/2] dt-bindings: arm: msm: Add SAW2 for APQ8026 and MSM8226
Date:   Thu, 13 May 2021 17:01:49 +0200
Message-Id: <20210513150150.51464-1-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the dt-binding compatible in the SPM AVS Wrapper 2 (SAW2) for the
APQ8026 and MSM8226 SoC platforms.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt b/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
index ae4afc6dcf..73e70e99e1 100644
--- a/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
+++ b/Documentation/devicetree/bindings/arm/msm/qcom,saw2.txt
@@ -25,7 +25,9 @@ PROPERTIES
 			"qcom,saw2"
 		    A more specific value could be one of:
 			"qcom,apq8064-saw2-v1.1-cpu"
+			"qcom,msm8226-saw2-v2.1-cpu"
 			"qcom,msm8974-saw2-v2.1-cpu"
+			"qcom,apq8026-saw2-v2.1-cpu"
 			"qcom,apq8084-saw2-v2.1-cpu"
 
 - reg:
-- 
2.25.1

