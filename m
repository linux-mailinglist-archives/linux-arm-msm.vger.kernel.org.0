Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA2A03307AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 06:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234625AbhCHFp1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 00:45:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234615AbhCHFpO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 00:45:14 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7EBC061760
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 Mar 2021 21:45:14 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id o10so5725802pgg.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Mar 2021 21:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0vZpb9y8MutMaka6YLswZQUFtbMSrJ0Y46Hxti/8tHM=;
        b=BJ/nj+3l8mDnLcnBxLlfarOq64qe5GCTAGyv452RcjzDzQpB4tYWS6+XYTFp1wDjLg
         iekeoQ8giTKMDsFCXfSNVD0QgoGyu/K42d7mJXVvz2aZnWHm/gNU14zW/Y3R7m5YsN3h
         fd7WoXMP/NspTSfDlYrON5Hdlbrys7rnjkhYIunH2u2usjqGZ3LVdW0ymxcqrvobyp93
         UvbWKUzzalTAkVeIqkca95kXND+bReJeQoPRoLuOgzOD2pqaupg7xO76WXBfkXBWfOsj
         LEIpVyb42vMZL1lLkvnY0ikFcr64g4HTqfIZseiRA1pZfYXuyiUcX6jbIpEDNbTM5rL6
         NjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0vZpb9y8MutMaka6YLswZQUFtbMSrJ0Y46Hxti/8tHM=;
        b=D4tTxAO89mm/6eRN9FtieqO9CnPSsltW/wlVD2qUZkvY1WIoqrWA1Y/xR4nggRHjYo
         E+CZJ2eWQALkWGvXGaSuglx5C10k2H/1aeV1V+UIo1ZHyfCzNXwcuus6oLPD6lLbrHpW
         GjWiTzE3vHMmSTLyI904IzP9UqaxL/6Lj2m/Yk8RFBTFSb90Qfs2zAF5E2DH0SapVQtJ
         k4m9jJ1D4H4+T0KN1FxqLx3gkB89X/eXSqT8htw73LxsCIZDvdqDe4pSwI9RXP+hBj0v
         RRw4x08I6TlxP/E1We9nA52IK9v+aXwnTF5CEtkmNoAMwr4oRO6cot9M7L8sPXBtPyQY
         qf/g==
X-Gm-Message-State: AOAM531mvO5nGOdSGKyLIbRIWydUoy25D5F2dBumXKR/YKyOoK3luQo7
        H+tzDEMpF82iJnEhrcdQUcMf
X-Google-Smtp-Source: ABdhPJzu4JCu5Md6ryj1ZYan4yE9jY/7uorHkfnhX/Zx7RM8Yyi0ijeyH/Uqm+yzonvi8XTt8PV6Fw==
X-Received: by 2002:a05:6a00:1493:b029:1ef:a5e:ae7 with SMTP id v19-20020a056a001493b02901ef0a5e0ae7mr20047950pfu.61.1615182313824;
        Sun, 07 Mar 2021 21:45:13 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6e84:fef9:1070:d306:6d0e:bf6b])
        by smtp.gmail.com with ESMTPSA id y29sm4331506pfp.206.2021.03.07.21.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 21:45:13 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
        bjorn.andersson@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 2/3] dt-bindings: mtd: Add a property to declare secure regions in NAND chips
Date:   Mon,  8 Mar 2021 11:14:46 +0530
Message-Id: <20210308054447.28418-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308054447.28418-1-manivannan.sadhasivam@linaro.org>
References: <20210308054447.28418-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On a typical end product, a vendor may choose to secure some regions in
the NAND memory which are supposed to stay intact between FW upgrades.
The access to those regions will be blocked by a secure element like
Trustzone. So the normal world software like Linux kernel should not
touch these regions (including reading).

So let's add a property for declaring such secure regions so that the
drivers can skip touching them.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/mtd/nand-controller.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index d0e422f4b3e0..15a674bedca3 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -143,6 +143,13 @@ patternProperties:
           Ready/Busy pins. Active state refers to the NAND ready state and
           should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
 
+      secure-regions:
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        description:
+          Regions in the NAND chip which are protected using a secure element
+          like Trustzone. This property contains the start address and size of
+          the secure regions present.
+
     required:
       - reg
 
-- 
2.25.1

