Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56B1B2EAACC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 13:30:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728710AbhAEM2v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 07:28:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728272AbhAEM2t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 07:28:49 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C0C5C061795
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 04:27:43 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id b5so1615015pjl.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 04:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ruQYP7YBV6AdaomBjYYG5DyZKP86kJmaQHorAaM/MSs=;
        b=MLJ8OEAkspkaSVUgg/g4zGTwcRjNuNM2kTiVGcFROr138ICWaLC/Kvdp5aqQJElFt+
         HPaoHy86uZ10iZjRwkOhMFsC45H3e1WuPWBtyazA5Qkr2kEyLxp1YsX5255MMQBlLmLy
         NIefhr97xlMDTXQH6hLI7k+Rr6gi5dWJ9wKLudHX1JlTJJPVs27eQP39MjqwugqdHsNc
         /JG2wXOTBnlLfjrkfzxlEfewYHEYwrQoQeiI6MpzAsQA1j2X5orPOXxEUGVA4CFlisna
         N7XPCdEhoqIfOMq41Ibe1Pec5jJ+Dp8gB05hWDKObO75G7qQ515+YCjDsqAuEauMNIog
         Ewyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ruQYP7YBV6AdaomBjYYG5DyZKP86kJmaQHorAaM/MSs=;
        b=ZwvMt/swU1r95PSknE0NvRsCxCJ403N3agk0UPXoei7stvwgG7QLRe0ZDLA7Co3dFY
         rkCQSjSsEiBnU26PfdGIDXxGOLR5n4jaUWm0HHbykLOtLmz29wok5lLflgGVBwL/w+gj
         j/FX9Q8FDfHey2+KqvlxBo6kbMzMwjlKa5KG3n2Tr8/NBO2fQ+OKLAGXm912rh0QQ3Pg
         x81imA8qO6RS+k/qa8d+1LCUUOxTMt0Ik3Fkb4M4u5DLh4VEExIUzPABLt5cy6iQh5qi
         +DG6d+7cRjUkvBE6OQD8r/+UzOZkM1ltu2qmA1sV1c4KYzO06EnH2ZckrgU3EgRNWIo+
         n5Vw==
X-Gm-Message-State: AOAM531ufpTrLoV6zgUR+kjrJ1EVzLXlMki6mOmkXVRJF00BVjQyaKr5
        j4f24WNm6ma3PECVY7Fhb7In
X-Google-Smtp-Source: ABdhPJw6GUbOK2p2aZSWKwjHS0/FPwvta3dSDW+Q+stiQqZJI9ujuAd44k8NfB7Pnshc8Kl/3+jAWw==
X-Received: by 2002:a17:90a:74cd:: with SMTP id p13mr3716609pjl.25.1609849662742;
        Tue, 05 Jan 2021 04:27:42 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id t22sm64745402pgm.18.2021.01.05.04.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 04:27:42 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 14/18] ARM: dts: qcom: sdx55-mtp: Add pm8150b pmic
Date:   Tue,  5 Jan 2021 17:56:45 +0530
Message-Id: <20210105122649.13581-15-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

SDX55-mtp features PM8150B pmic, so include the dts as well

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55-mtp.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55-mtp.dts b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
index b8d432a4324c..09aeeb14be37 100644
--- a/arch/arm/boot/dts/qcom-sdx55-mtp.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-mtp.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "qcom-sdx55.dtsi"
+#include <arm64/qcom/pm8150b.dtsi>
 
 / {
 	model = "Qualcomm Technologies, Inc. SDX55 MTP";
-- 
2.25.1

