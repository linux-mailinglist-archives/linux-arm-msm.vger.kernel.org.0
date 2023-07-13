Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDCAA752928
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 18:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235340AbjGMQxB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 12:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235423AbjGMQw6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 12:52:58 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C423A2719
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 09:52:54 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3463de183b0so3911995ab.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 09:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689267174; x=1691859174;
        h=content-transfer-encoding:author:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dcIGYFaQfGqSRzz1TR43A9wAS36o64Mm47YNW9KhJGo=;
        b=rNKbM43IVbuLmaY5vpRk95N0ouqDf122oy6vp3z+XqzqJdSqzEJE49uA/+LAlaTvzC
         va80pws1oE2LFizrEocPk3POxluC+DsEHwwhMXkn9kZxztlmon0JerXhq+Rv985t9dfJ
         izZengGZk7DseJjSpHjHc9HrswDXf08dRy2VywcwJF8q6Qj2EP66+D0f8kQxk+lCznmY
         Kon7SzME/qoenAAUA7B2HPEHQj2HTWWhYlvOOD1kqMp2ld4hf+6qAnnpwzEdHgCNCd1Z
         Vr0lmId459CUK8susiATSTB9UXoPJ9XogCq9WhynQ50c7Z23C+gEFoBJiGw+x6n8hdHk
         yXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689267174; x=1691859174;
        h=content-transfer-encoding:author:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dcIGYFaQfGqSRzz1TR43A9wAS36o64Mm47YNW9KhJGo=;
        b=EuPm0x0QsBVg8LTUzBvQC4c1AhYmaNWTrIkJWYpYJHGyEGen+wHNWlq6P/5m0/9o/x
         FbXZ6TjjgLoopRFIOHsf9a5bp0mClFxhP5/NFeft08qRmgoN93kurNChL/PIVakJnK+b
         yPg9Z+9FA3NxOHdSgH2GlAGs5FySn0tiCrbpASr4gO9RSDMl404FpSVbudVsRDTn6907
         TVFXxVdLpwc1HUrKk6RDUIwgXJQ2mtYgdn9U1O3H93EstHjbTDWQ5xVCKyVUDcZJBQHp
         AnIpkSvnGtlXgMVLxf0ZDj2DCAMD7UO2SBWAIySxaMtWT9Nt7/xpR5WkVxeVZP7OlpBe
         Xsdg==
X-Gm-Message-State: ABy/qLYQOeTQohrUeIytiQs11ew0r6BSIGq/m4MsZDUUX1VgDyI0+jo1
        DKu1ZUaD+ZuG4DuANcINyr6Jgw==
X-Google-Smtp-Source: APBJJlEXsdTd6Pdgx3SCjb2Ew/A5vqSryB0OA8QHjsU17e1cE61ltYcsbHB9o5es5L+hVdITQ4UnZA==
X-Received: by 2002:a92:c6c7:0:b0:346:5813:f7f5 with SMTP id v7-20020a92c6c7000000b003465813f7f5mr2120484ilm.12.1689267174022;
        Thu, 13 Jul 2023 09:52:54 -0700 (PDT)
Received: from x-wing.lan ([49.207.50.231])
        by smtp.gmail.com with ESMTPSA id d3-20020a17090abf8300b002633fa95ac2sm12009150pjs.13.2023.07.13.09.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 09:52:53 -0700 (PDT)
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
Subject: [PATCH v5 2/2] arm64: dts: qcom: sdm845-db845c: Mark cont splash memory region as reserved
Date:   Thu, 13 Jul 2023 22:22:38 +0530
Message-Id: <20230713165238.2814849-2-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230713165238.2814849-1-amit.pundir@linaro.org>
References: <20230713165238.2814849-1-amit.pundir@linaro.org>
MIME-Version: 1.0
Author: Amit Pundir <amit.pundir@linaro.org>
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adding a reserved memory region for the framebuffer memory
(the splash memory region set up by the bootloader).

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
v5: Re-sending with updated dt-bindings patch in mdss-common
    schema.

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

