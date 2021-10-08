Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36A9A4261BD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 03:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236118AbhJHB12 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 21:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234407AbhJHB11 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 21:27:27 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7695FC061764
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Oct 2021 18:25:32 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id i24so30954979lfj.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Oct 2021 18:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=clR0pd2rxG7rsbJsSmT96iRGAfExlfxhlmBSBtDpU+E=;
        b=cHPcGJugcIEIj7qiruq9EapjU3rzcxhYWG1TXzY5AkX8rE7pjc7vDrHq0+jrce34xn
         eJiQmKEInBCpIn/R3g4ex0+cBPs5zxxe8FnMcJtdGIKigtycCx0ei6anMchp7kmh6xXM
         I/t21gX/nAOd1+S8796p1iD6LcTI+3hPYIgJ1nqpU6dg+YLqTfG8KZOyMEvTq5P5ad/8
         a0sfRvenRwiQ5BZKKX4KTq8h22WuEt+SMxu+XZNoyTpariS2cuP4pHyXO6NElm32gnEp
         j4FlqLgczmxO9iIIh+jB3w008Y0qTBH6u3S2YIfGZSsZIShvEytAAyRZ617WTKx40x6J
         tyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=clR0pd2rxG7rsbJsSmT96iRGAfExlfxhlmBSBtDpU+E=;
        b=ySsoiOiXljycK3HAlpNCMjm9jId0RehEGz4rRmGEVVXIlK17w5ju6XfyAYu3YLk2Vd
         ZtSMuF7NIMZM9ZXOKhN/6y+ueWQRYYOXzv+t9xMXW4Q7rjpbtepBUL1H0yJ2D6Xkg4hT
         OTVZmvM3L0AOas8H56lfWtY1P6V2enFDGW6egmzZ/fOlotM9hSyLK8X4ea8SNMlrDmHb
         PteTAyvnOqrz5LhysqZ2ageR/BDxoUnI9O2L4VMC6Tvv2qkWFVfthwcOt/t5EU12tOD0
         3te+HxiVMiIK60sLYTukdP4wMxysakgJxLXEjgj+05EZn6I4V5T6fFqQ9J1yQhMj0+cJ
         KgMQ==
X-Gm-Message-State: AOAM531nmTd7RLJBBEHQdPgCYHvXpZvwTZyXWbkaH/jSYvVoXI4di0Fe
        hBQsapl6iaAF0TCQb9mfpu9dbw==
X-Google-Smtp-Source: ABdhPJyGM7o5G0i6hoOpaUrxWb56kXiSMqcM/MjOQzctlUK3zFXekZ7gV0F0bQ7nQglo6H38HlhhcA==
X-Received: by 2002:a2e:550:: with SMTP id 77mr377760ljf.478.1633656330786;
        Thu, 07 Oct 2021 18:25:30 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s4sm112875ljp.115.2021.10.07.18.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:25:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 04/25] ARM: dts: qcom-msm8660: add gpio-ranges to mpps nodes
Date:   Fri,  8 Oct 2021 04:25:03 +0300
Message-Id: <20211008012524.481877-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
References: <20211008012524.481877-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add gpio-ranges property to mpps device tree nodes, adding the mapping between
pinctrl and GPIO pins.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8660.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index 480fc08cbe8e..d404d386d392 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -307,6 +307,7 @@ pm8058_mpps: mpps@50 {
 					reg = <0x50>;
 					gpio-controller;
 					#gpio-cells = <2>;
+					gpio-ranges = <&pm8058_mpps 0 0 12>;
 					interrupt-parent = <&pm8058>;
 					interrupts =
 					<128 IRQ_TYPE_NONE>,
-- 
2.30.2

