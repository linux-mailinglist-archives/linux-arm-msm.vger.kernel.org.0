Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00956355CE1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 22:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242842AbhDFUaD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 16:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231650AbhDFUaD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 16:30:03 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C589C06174A;
        Tue,  6 Apr 2021 13:29:53 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id bg21so5502297pjb.0;
        Tue, 06 Apr 2021 13:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2j7CLcad6ed96rIyV9YQHxN3DzjnAJyxSEvNXU02X20=;
        b=nYUal0e85vIHS7aZRNgDglng+qm0qJNbkP5HRG0HaavzZxy1YeoJJfFLszSNBsJOJ3
         7l1zFyXVZonWUYgDSnlmVgLwLS99tZfdfwJJqMX+H8QPJHz5wSqQuDvmwqF9YTABZkMi
         PhR/GWFY1fQsDgoq/mDMgHUGE14wsY9ypMkjEC60wDCH6LL7O3tJD3I1PFzTc6qI18I+
         fA0sG3FrA0QZoOJpyYpjoroSbNfLiph7XbBQVEfzbxeNVCUmppbZxwfqBIrJEkIVSKRs
         gJROKbp2sN9X02bfYVBhJUXj9r0//MzDD8TujZiyZ0106e6BukA2/M60AKVUTqh2hWxJ
         zTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2j7CLcad6ed96rIyV9YQHxN3DzjnAJyxSEvNXU02X20=;
        b=CeK2JIjCLhB942tr6CbkhVm93XKmjybxdLBy8Mnm+L0XqIMzLReFZwECvX95TyNq8P
         DTuXh767OkCaMfQUWdKuPDV525v01RqvL6FWi7baec6OeCTdeRztXNpk0zL3Tj28MBVq
         KJxvB4I4EHPnXtczxNz4YEgiZeI4Y3JdybXdoCoQwExEGNINsO6npcRmyFf5xijAQDmO
         zK+ZEveFdbt4oIblFp47qE8SLPUzQ8clq3C8U+1MxAhtWMGBJygMrFlOyUZVc+f8Uh3x
         R3DWX+Unvju70nvwG+9AwVVks44mbuTvR314CquaRn7O02ti5xKtFaKnktA78CkyMhIy
         JiRg==
X-Gm-Message-State: AOAM533d4BnnIrFmP9WjbOkuNBoHkJtqoOXMXSpPFDYFFtNKLqfN3g5n
        vSEhH598UHpYTQ5uc1d+DKxmwn9BB+BRvw==
X-Google-Smtp-Source: ABdhPJzBnFguFi88gpmuor8iHJxiRXt/MFPep7vFboCRsnlXbgdwOM+ls2m8kZboCUNU/tBINz5c8g==
X-Received: by 2002:a17:902:7788:b029:e9:11:5334 with SMTP id o8-20020a1709027788b02900e900115334mr41037pll.70.1617740993171;
        Tue, 06 Apr 2021 13:29:53 -0700 (PDT)
Received: from dell5510.suse.de ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id x13sm4921040pgf.13.2021.04.06.13.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 13:29:52 -0700 (PDT)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/1] arm64: dts: qcom: angler: Reserve GPIO ranges
Date:   Tue,  6 Apr 2021 22:29:36 +0200
Message-Id: <20210406202936.22500-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reserve GPIO pins 85-88 as these aren't meant to be accessible from the
application CPUs (causes reboot). Yet another fix similar to
9134586715e3, 5f8d3ab136d0, which is needed to allow angler boot after
3edfb7bd76bd ("gpiolib: Show correct direction from the beginning").

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
* Remove <0 4> (not needed)
* Remove from commit message: Fixes: 3edfb7bd76bd ("gpiolib: Show
  correct direction from the beginning") - although fix is needed after
  3edfb7bd76bd, I'm not sure if this commit is to blame commits which
  added/modified DTS.

Kind regards,
Petr

 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
index baa55643b40f..fd8e8e1cb2be 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2015, Huawei Inc. All rights reserved.
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021 Petr Vorel <petr.vorel@gmail.com>
  */
 
 /dts-v1/;
@@ -32,3 +33,7 @@ serial@f991e000 {
 		};
 	};
 };
+
+&tlmm {
+	gpio-reserved-ranges = <85 4>;
+};
-- 
2.30.2

