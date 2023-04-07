Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF4FA6DA97F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 09:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbjDGHqT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 03:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232563AbjDGHqR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 03:46:17 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8667DA5FD
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 00:46:15 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id sg7so6712267ejc.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 00:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1680853572; x=1683445572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gb/NJByikwNeC0y/lKpExe6RRbIL2UvmiCGNOX7UGPc=;
        b=qBKLwA4mq4ZqfHlszARRRXndkFRl/cUyzjlKK3GBMGlP3Vh6pgrRFliyor7ZGzVn+Z
         UZhEGfNLPJrAirV2d1w+bhHULRry6YWNn7J9mQg4hD4JVl4j4oq1jdwFEsrswtiDhZjw
         HabH+dzNu5oE833nqdMMTjTZej6m9hdDuCXxrXHOgGlb36iLUMKyFCTUqJf/khnMSeaY
         OyNiMzfI/10sPBpffIZe7arEloxC5WmRvHZ7DF8LUCq3rEFFMvIJueKmbfq9TVOmzGhA
         HWdo2HW9gQJvSabJntsGYbatJby9tqBxloUO2Yk0yqClsPLJ04rQhRhpPGdNhPE5/gIR
         3zGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680853572; x=1683445572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gb/NJByikwNeC0y/lKpExe6RRbIL2UvmiCGNOX7UGPc=;
        b=rb8cKuenYP4SkkbSUgLO4Mxf6CQFKkVp41q5Y1iBFP+6UxkYsCMHRByzge+GNnQScV
         nOncL0tDunzMLiygcVURTwoLbuLgHaaXyBFrWDa9a8MGxU7jSlzr20GlnpUDoPKEbI1M
         trXklNp1E4urjfibdMCtWspXh3hYIXt0Om9zwiyZe5kXjC1s+Y9Kxt0UNLbGUbv3x20I
         58IRljLKCbrwWoD/KafnoC9TPRRcj+/pH2r0IJsd6I7wvCnLSm0dCOo4fxJI7hzmNjnl
         nyxQw7hUd29lfuD/mceC38Prq7/htngJqsvYRy7bJ8vtsIKb2oeZyZCnxHMP/8tLKo6D
         kPgg==
X-Gm-Message-State: AAQBX9f1fJM0cZaAAopaiptx/KhYdm2m/kHqPq6wc9augh/LW6d314HQ
        uhEJWjyyoHjHybNxi5oyAp1hKZBCVPWWZcSdgT0A5Q==
X-Google-Smtp-Source: AKy350bQ8Gx7PXKz9FdJofFrLi+INHIfe6L0eIwsWx6Pt+gyk1r18TwO9ZI+Ymc1IeWXi4joncB49g==
X-Received: by 2002:a17:907:3183:b0:92b:b4d9:3f07 with SMTP id xe3-20020a170907318300b0092bb4d93f07mr2202341ejb.14.1680853572711;
        Fri, 07 Apr 2023 00:46:12 -0700 (PDT)
Received: from [172.16.220.24] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id sa28-20020a1709076d1c00b00949c04d1c64sm1762378ejc.41.2023.04.07.00.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 00:46:12 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 07 Apr 2023 09:45:44 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: pm7250b: add missing spmi-vadc
 include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230407-pm7250b-sid-v1-1-fc648478cc25@fairphone.com>
References: <20230407-pm7250b-sid-v1-0-fc648478cc25@fairphone.com>
In-Reply-To: <20230407-pm7250b-sid-v1-0-fc648478cc25@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This file is using definitions from the spmi-vadc header, so we need to
include it.

Fixes: 11975b9b8135 ("arm64: dts: qcom: Add pm7250b PMIC")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index d709d955a2f5..daa6f1d30efa 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) 2022 Luca Weiss <luca.weiss@fairphone.com>
  */
 
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 

-- 
2.40.0

