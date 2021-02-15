Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD76831BEAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Feb 2021 17:19:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231959AbhBOQQB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Feb 2021 11:16:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232691AbhBOQCm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Feb 2021 11:02:42 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88BFC061223
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 08:01:40 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id v14so9507761wro.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Feb 2021 08:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SIR8kxlA4Jty9/otffAphB5/jPhHJK1wsDSo+IREMHg=;
        b=xAUHUH2ZGTK9itsUvPnViiXQnYk2p/FdoaR+mxhqrVTnKd5ialKAionRBo3hhxAsGV
         /hoc4W3bhajapFNiS+JVgjy5o4u+1cLwo0tLqJcqrYvwQeIGrFt1pijroCfMihJGia/S
         1eTUmEvzA4TH+DyU8Ii0eRjofSXgKo5jnli2HSDBKjdS7vmyGAR1PHK8CFCjizyeXr7c
         myM+sbEP9w30bzgRRwSPF/F3GlHW4IaymBsO3Qk5GGw4c0autgcgxaXcbtNIEe0P1HZL
         GAxZovG64fPEaHY8aC22YUTt2cdKAnkiToC53kfgkja28dxun/oZQYIPILT/cv6FB+0O
         AEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SIR8kxlA4Jty9/otffAphB5/jPhHJK1wsDSo+IREMHg=;
        b=jkZfQCB+r43ETCnND0JhdlP0tRAELyBK1lbngQ0F1EZG0qjkekgLJtghIRdOfsLCeB
         U6De9XHPAdQnvxbMKK8Xthq4tE2bH5c6XAp45tswKnj+byBx5MvVQddpSsQfbJ6jL2mB
         GcqV+FFUKnDViOm7AlsLfLcub6wadNjKIJEMIuQrRsAoOJZ8R5YQ4JGxniXSCBhVRHDh
         0aWqgj4gTju3v7vq38aZo2d9aPHiRIWvZnoomvyWDS8FoLRjHc9oZGsjqEV0Ppld/g5X
         +rfE9R53Yxt4c9sUXhV04BfKSOEEx6mJhpVyma2J0xJ0rtw+UmDFt9zvbhoKzNTodgib
         9nIw==
X-Gm-Message-State: AOAM5321KeVDckcNmaWdpOfBOhz66hcuhSl3cBZAH7GI5hwVhgXP0mzt
        ojV/E4puSxnLzTTYCByF5eYPtg==
X-Google-Smtp-Source: ABdhPJxfJajEcL7wyvjJiHAxOyj00f/iUHnAV6kOd/ACwpwuqYrfHNuFh6oAV4p6EvVHv81pPBZNlQ==
X-Received: by 2002:adf:ef4b:: with SMTP id c11mr13862618wrp.0.1613404899634;
        Mon, 15 Feb 2021 08:01:39 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 101sm14698659wrk.4.2021.02.15.08.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 08:01:39 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stanimir.varbanov@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v2 1/2] dt-bindings: clock: Add missing SM8250 videoc clock indices
Date:   Mon, 15 Feb 2021 16:02:53 +0000
Message-Id: <20210215160254.1572615-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215160254.1572615-1-bryan.odonoghue@linaro.org>
References: <20210215160254.1572615-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Two indexes need to be added to videocc-sm8250.h for venus to function
properly. Rather than adding the missing indexes when used we add them
separately here to keep checkpatch.pl happy.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 include/dt-bindings/clock/qcom,videocc-sm8250.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,videocc-sm8250.h b/include/dt-bindings/clock/qcom,videocc-sm8250.h
index 2b2b3867af25..8d321ac3b1fa 100644
--- a/include/dt-bindings/clock/qcom,videocc-sm8250.h
+++ b/include/dt-bindings/clock/qcom,videocc-sm8250.h
@@ -16,6 +16,8 @@
 #define VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC	6
 #define VIDEO_CC_PLL0			7
 #define VIDEO_CC_PLL1			8
+#define VIDEO_CC_MVS0_DIV_CLK_SRC	9
+#define VIDEO_CC_MVS0_CLK		10
 
 /* VIDEO_CC resets */
 #define VIDEO_CC_CVP_INTERFACE_BCR	0
-- 
2.29.2

