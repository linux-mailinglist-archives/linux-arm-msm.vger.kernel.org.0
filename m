Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 153C875091A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 15:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233513AbjGLNCw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 09:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233389AbjGLNCm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 09:02:42 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CE5F1BD3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 06:02:29 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6b87d505e28so5674806a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 06:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689166948; x=1691758948;
        h=content-transfer-encoding:author:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9T8piHX0bubTIqR5dsadlL99AD9gpATcetHPEAi8jTU=;
        b=hIzKop+k4OCTCBWq4j/r6OD7aiiXPsd/rQZ1uF4S9TETD/oKB2rDcKczmsx2A0nJe5
         NWtDC2qPPGP7IM/wx1RvH78MvjJ6gY/YwivETBUZkh+vDWikLxQdZmap/WtbV5U3p2fE
         p5OoOEvAFa/9bydOqp6ak9+2bf8q660eCyEzrIC/1SHTOj9MIVPWcntYo5Y0VljtGzHE
         mgZIlmKBdjkeT3791x7XiE800dSX3/EX7xIgtP5kHtO8nVPlbCyb2u7S6JXlPFNTDwAE
         UGae6a1Zymrpqo19n1nGtitGuwQJG7H3zK3/7eS7IUQfV708JvhyXubPbr6YmxNuc0TL
         sKPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689166948; x=1691758948;
        h=content-transfer-encoding:author:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9T8piHX0bubTIqR5dsadlL99AD9gpATcetHPEAi8jTU=;
        b=A1tdSLwCAiTP8twimsTbySMnDn/k5nXN1VLUMgO2MLuNPIfuxmJMzf89Fw0rvpk5an
         /YY+9gZKjyxNIMzMzorvd1g2/Gtwg81tqoI/lWzj2NyUIyxNQHCOEUxcBUM9zGFQY/L5
         H7OTaz0Lamet5kUr8kzIs69ZzFpCQ1WH7jI39MFaFKsPSfKQYT81tEmWsq3FMkp2Kppy
         QJ51G3QKxXGcp7YsbsSXzp5EMw46luooiYoRUE34amHtJTCjL+rs1PuxcIo/5w0bHPT0
         lpqirmHq+JqOo4LahhA0eSWH4z6JJ+ekU3BHll82uVHA4TsWpWJ7DAcboO/T/IZUMZbt
         65vg==
X-Gm-Message-State: ABy/qLaTPWDxspgkZrt2cSKcFBXk+myQWvkYMGEWlsRfiglFjQ79BK7H
        Ifiioa1eqrsNGdm7/d1ceauA3Q==
X-Google-Smtp-Source: APBJJlHMNeteSeTTb43sYC5YqkHocrWysDwQ9MhmzMKypOa+itOUe2NT1zrkO4ZI8Ox9NbZXCTb+1w==
X-Received: by 2002:a05:6358:341f:b0:135:89d6:22e9 with SMTP id h31-20020a056358341f00b0013589d622e9mr1235888rwd.13.1689166948540;
        Wed, 12 Jul 2023 06:02:28 -0700 (PDT)
Received: from x-wing.lan ([49.207.50.231])
        by smtp.gmail.com with ESMTPSA id p1-20020a639501000000b0054fe07d2f3dsm3417023pgd.11.2023.07.12.06.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 06:02:28 -0700 (PDT)
From:   Amit Pundir <amit.pundir@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Bryan Donoghue <bryan.odonoghue@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dt <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2][v4] arm64: dts: qcom: sdm845-db845c: Mark cont splash memory region as reserved
Date:   Wed, 12 Jul 2023 18:32:15 +0530
Message-Id: <20230712130215.666924-2-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230712130215.666924-1-amit.pundir@linaro.org>
References: <20230712130215.666924-1-amit.pundir@linaro.org>
MIME-Version: 1.0
Author: Amit Pundir <amit.pundir@linaro.org>
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding a reserved memory region for the framebuffer memory
(the splash memory region set up by the bootloader).

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
v4: Re-sending this along with a new dt-bindings patch to
    document memory-region property in qcom,sdm845-mdss
    schema and keep dtbs_check happy.

v3: Point this reserved region to MDSS.

v2: Updated commit message.

There was some dicussion on v1 but it didn't go anywhere,
https://lore.kernel.org/linux-kernel/20230124182857.1524912-1-amit.pundir@linaro.org/T/#u.
The general consensus is that this memory should be freed and be
made resuable but that (releasing this piece of memory) has been
tried before and it is not trivial to return the reserved memory
node to the system RAM pool in this case.

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index d6b464cb61d6..f546f6f57c1e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -101,6 +101,14 @@ hdmi_con: endpoint {
 		};
 	};
 
+	reserved-memory {
+		/* Cont splash region set up by the bootloader */
+		cont_splash_mem: framebuffer@9d400000 {
+			reg = <0x0 0x9d400000 0x0 0x2400000>;
+			no-map;
+		};
+	};
+
 	lt9611_1v8: lt9611-vdd18-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "LT9611_1V8";
@@ -506,6 +514,7 @@ &i2c14 {
 };
 
 &mdss {
+	memory-region = <&cont_splash_mem>;
 	status = "okay";
 };
 
-- 
2.25.1

