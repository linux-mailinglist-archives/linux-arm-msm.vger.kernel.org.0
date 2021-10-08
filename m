Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC6B54261C8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 03:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhJHB1b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 21:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236805AbhJHB13 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 21:27:29 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4B7C061769
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 18:25:34 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t9so31418415lfd.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 18:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jPqe703H6IymTOKSZQDO6LX/0zlyxMHngDY3uRoclEk=;
        b=uJgSuxFdLZN7ePM6wH+96t2n+DPHBqLeAszdom840iKOnzfwFlh2K5EJv5ccn5i5Ay
         c88gbpvUK06xWacn0aiVry6qdIVO7XPnk7bSUbK58enUzsnhWDrRqXxJ4MNTLdZPMSdn
         dPaD3f14YTf9RML2mrVyY/I7q3qwi1594f1m8PaxaZJ/BjJP7dTC5YrI5mR3JEZsNgd7
         Vc0HHhDOLI2GG3fftoBoEIDBZxFMwzL/JwTg6+pK4xh+KSk3U3yFGxEUNm5adh4SW7VE
         X0OH61CY+P1x1j22mebXtnvq5ns5NLo+68qXt3ULXVayT1/o+JAuC/YagrWRwIItXrhd
         dj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jPqe703H6IymTOKSZQDO6LX/0zlyxMHngDY3uRoclEk=;
        b=DGNtK7gtN2i++WGyIfTj/oHjusJVvVU52LuO652BP/zQOh+HIIe8hNVFI/rQW90nEj
         ftCYgY/hTLVgWnlr9UPgL5pcOrr6WUZd2PHUj2/wdWW82dmwKUddfrxsNsHwzPqf5Y8e
         fFcWSadepuDE0P/ToiKVWlXrlshoAjrsSdrOiGZGduug3IQ4fSTMW46uA316TDnC8/LN
         RTsAMbBhqluoKqL5gxWMWNeylf/psARg+L+zNGutpNlC8V0F/zRqDx2ue9gsh303ruFD
         X5YLHFmeMj4mmdZY+YhY+FAp9VmoaX640sLPUxpNeAj1/jPpeOQcKdZpI6f6QgpC23zJ
         vusA==
X-Gm-Message-State: AOAM532B6Fk2rIqQiOcCTxKRFHNY6SxisMcaj7h1Cyw67lRjotBJyu+y
        IRNZn/sjIev42e0JyxwoiIONYg==
X-Google-Smtp-Source: ABdhPJwMxbV0vtkbZvaATJwbz9qAxRs/uR2BDyciy0OSyfS7SqgfG/Kd1ol93HvioqxwiS8XVjW/gQ==
X-Received: by 2002:a05:6512:c24:: with SMTP id z36mr6419114lfu.62.1633656333297;
        Thu, 07 Oct 2021 18:25:33 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 08/25] ARM: dts: qcom-mdm9615: add gpio-ranges to mpps node, fix its name
Date:   Fri,  8 Oct 2021 04:25:07 +0300
Message-Id: <20211008012524.481877-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rename mpp node to mpps@50 (instead of mpp@50). Also add gpio-ranges
property to mpps device tree nodes, adding the mapping between pinctrl
and GPIO pins.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-mdm9615.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index dda2ceec6591..cfff1a5706ed 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -300,7 +300,7 @@ pwrkey@1c {
 					pull-up;
 				};
 
-				pmicmpp: mpp@50 {
+				pmicmpp: mpps@50 {
 					compatible = "qcom,pm8018-mpp", "qcom,ssbi-mpp";
 					interrupt-parent = <&pmicintc>;
 					interrupts = <24 IRQ_TYPE_NONE>,
@@ -312,6 +312,7 @@ pmicmpp: mpp@50 {
 					reg = <0x50>;
 					gpio-controller;
 					#gpio-cells = <2>;
+					gpio-ranges = <&pmicmpp 0 0 6>;
 				};
 
 				rtc@11d {
-- 
2.30.2

