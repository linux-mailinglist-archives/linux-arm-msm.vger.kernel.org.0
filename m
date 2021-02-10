Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED15931674A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Feb 2021 13:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbhBJM6W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Feb 2021 07:58:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbhBJM51 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Feb 2021 07:57:27 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832B4C06121D
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 04:55:38 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id l25so3965468eja.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Feb 2021 04:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6HSMvuiMGiIfphZU4Vo/CX2mIjsqBu8/UXWK69Lqxos=;
        b=zT46NYVFSrGggVIbyOEEogHPPkm1SqFJytRsLCRtmsrCeYHkABUo1c5aMMeLk3xMa0
         fHNyLS1B8zkjBA3HKJYal0l77ch2d06q6LGLz0UajkbyRjvFvWIbwouMu+wRkX9w6oJ1
         tDrDzQXXmo+zKFy5eevThg3/xqW8r35rad3/6B43Pm4PoLlxg410b8se0Osm2U4w1da/
         ijfiN/Mh+SKwaBBV6X7Pq4a20EOzkQ3wONJrOi+h2Fa01GT80AGeq0F/W95cbOKKzqM6
         +ohEjIsLMZA/iCYluvXPIPbTgANGOlVI+6ttA2dSLowAaivIwkEivFfbqgfuWY4wGt5B
         1JQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6HSMvuiMGiIfphZU4Vo/CX2mIjsqBu8/UXWK69Lqxos=;
        b=g8rQ6W//wANwHWjRAaEto8FYkMp/glOrAaMy1pNAqd2q5CKznklAIIHkIhJi0EGoEO
         frC+Iz7dazKUzspVz3fD8mXQ5aBY8auoXzg7qt+twCLMy7qnVo+5vkesiDaPi8M+zKDO
         m0cdk/JYrisi8GdJpoBeh/LHGG8hBjFKG3jMX90kS3UeFZGSBzbU2cIsv431qVzlftHf
         naYWZYZbaZJZdzcikg9lscBXMYAefejRHwF1tfo6M8CxIEsWjiPsgqYflDGhfFf6ZhkD
         HQgfzwfqi2tPFj/be05FDYUtSxo4T4aID4pIainCX0yM43F9pRbA+BIrI627mn3GtQ7k
         8Kpg==
X-Gm-Message-State: AOAM531R7K9DPG2ja30P2KstGNQFWKXG4oOiABHutG4Bs5mmV0niSgO2
        n23q9jiJj2gJg6edo1mCD38gP0U6FdD0QHZq
X-Google-Smtp-Source: ABdhPJw2tDiJeYgQ037lzOwHWXvaUdM+6n6I0eYa1cOOaAGbTOYbsnhNFTTPb9Guc0Dz/JYnVxmMmQ==
X-Received: by 2002:a17:906:719:: with SMTP id y25mr2781547ejb.180.1612961737261;
        Wed, 10 Feb 2021 04:55:37 -0800 (PST)
Received: from localhost.localdomain (dh207-97-164.xnet.hr. [88.207.97.164])
        by smtp.googlemail.com with ESMTPSA id u5sm1084900edc.29.2021.02.10.04.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 04:55:36 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, andrew@lunn.ch, hkallweit1@gmail.com,
        linux@armlinux.org.uk
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v2 net-next 4/4] MAINTAINERS: Add entry for Qualcomm QCA807x PHY driver
Date:   Wed, 10 Feb 2021 13:55:23 +0100
Message-Id: <20210210125523.2146352-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210125523.2146352-1-robert.marko@sartura.hr>
References: <20210210125523.2146352-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add maintainers entry for the Qualcomm QCA807x PHY driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 667d03852191..48f32ef108d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14775,6 +14775,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
 F:	drivers/regulator/vqmmc-ipq4019-regulator.c
 
+QUALCOMM QCA807X PHY DRIVER
+M:	Robert Marko <robert.marko@sartura.hr>
+M:	Luka Perkov <luka.perkov@sartura.hr>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/qcom,qca807x.yaml
+F:	drivers/net/phy/qca807x.c
+F:	include/dt-bindings/net/qcom-qca807x.h
+
 QUALCOMM RMNET DRIVER
 M:	Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
 M:	Sean Tranchetti <stranche@codeaurora.org>
-- 
2.29.2

