Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 753AB1E69CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 20:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406025AbgE1Sx6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 14:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405951AbgE1Sx5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 14:53:57 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8BA8C08C5C6;
        Thu, 28 May 2020 11:53:57 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ci21so3678413pjb.3;
        Thu, 28 May 2020 11:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=tZ7Vc9iMN6KFf8vNf3m0eJCmtRi1FglHJlqzSAdVkZ0=;
        b=YLSJ+LpvFz6XfEKIbwz6U3/AVdLhCJCdC7QEYOF1kKIuTyh3V4d7OwYNyOVaIjRw6Z
         JpXrtlz1k6O44QJh1dMpcwe99fiDC+6t/Pp2UPeu6Jh06dl/VSsdLD+f3nX4lrqUglJL
         d06MsVFz5baw2/SPQUfW0grjn2ZsntL6SVvJQlm+MDYHt5nCa5R+cPZmkRsLSER9+trI
         VHYJJ4tLtJXoPrTIWvP+3uXcg1lR5tvWaA1Svw+oog71tf6tBOqCIAeoHRjoT+648FiQ
         Fhx93wI0jAlBlmJDeGOubdhjH21IqzVPStH1EiPE5DyOR8K2J1ztiiyUfesG3NGIurrK
         D1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tZ7Vc9iMN6KFf8vNf3m0eJCmtRi1FglHJlqzSAdVkZ0=;
        b=oxrGWQLHfF30oD9VgZCf3WMBE5TBapLw1S9Ozfm1X7CiUuUNsr4pZFEjYxd1AOjzgB
         EG48/pOI5VbM5tVz4Ka6HW/IRtEPxpEHyWyx7vHIV1LN7mrPf3zJ/NQlhrTDPRuTUFt6
         hNLkZ/SmNZOfv4BOVYLz0WUp4JbEaOLcJFA/kqRh6RWo1pfTo8SP1Il+J/HKG/6QxNbd
         lbvCYDCXA5XGbjH1wT9djh4MU6VrJ7p03//Vpyky3OxNv5aH35OERbNo1sk5BQXOCaai
         b3kEqQD82bGVW1w4j1NzsizoHr6e4kEY/r3lcHSfvNb2hR3YCKNhpTY8Z8BAozi94/vX
         SHHw==
X-Gm-Message-State: AOAM5314s+e68OKbiGkjj6Rmt/8/79DTLY13l85ZUh5yFUoFT8XnQ0nX
        7YKxQK4JTlu4UvJENi87HTQ=
X-Google-Smtp-Source: ABdhPJzVQUPX3S7UHZlOQgBxQJS9LzRooe+ZAtJZrLVJsm9msV1osHonGBuS22zxeu9SXYRX69qHGA==
X-Received: by 2002:a17:902:8ec5:: with SMTP id x5mr4960795plo.149.1590692037271;
        Thu, 28 May 2020 11:53:57 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id s13sm5253179pfh.118.2020.05.28.11.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 11:53:56 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] arm64: dts: qcom: lenovo630: Add Modem firmware files
Date:   Thu, 28 May 2020 11:53:41 -0700
Message-Id: <20200528185341.4891-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

By specifying the modem firmware files, we can boot the modem subsystem
which also gives us wifi.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
index 407c6a32911c..89492ed5196c 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
@@ -25,6 +25,11 @@
 	};
 };
 
+&remoteproc_mss {
+	firmware-name = "qcom/LENOVO/81F1/qcdsp1v28998.mbn",
+			"qcom/LENOVO/81F1/qcdsp28998.mbn";
+};
+
 &sdhc2 {
 	cd-gpios = <&tlmm 95 GPIO_ACTIVE_HIGH>;
 };
-- 
2.17.1

