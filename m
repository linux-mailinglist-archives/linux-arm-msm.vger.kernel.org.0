Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0ABA47B1C9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Dec 2021 18:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237512AbhLTRDz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Dec 2021 12:03:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233963AbhLTRDz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Dec 2021 12:03:55 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1816C061574;
        Mon, 20 Dec 2021 09:03:54 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id d198-20020a1c1dcf000000b0034569cdd2a2so336674wmd.5;
        Mon, 20 Dec 2021 09:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gzVwm42op0dYJGLqZ7dp5IDRU3oxLB2OIuNOvb9n2E4=;
        b=mN2lfyGI1jfyVAAlQI0Cx8V8WvVFKCgdy4HXzFolvb56JyOw/hAbjHk3Il8JdT4N85
         dNNtAHSFJkhgXGogYHWbhTxB74IIVdBM9ik6RLc4G7Of8NyhkW3dGD4hUp1/y2Fbdtrf
         A4XyxaYf98/vS4G3ibTSQMDECU8N6tDT4hSCipnljgpT4rbgHGv6s1H/wl9vtNMfqzIY
         qXZ/H2+/M1KthD13yFXnWmwZiANfg6bSPY1gebtJIutLHoxyz54r7wiHpSk4KuI8ugSU
         TBun44JxXmY+z83T4UvMyzeQcd0RvdO847CTClDS1BT707kQadxn6s/dvoBLYmNBcKOE
         33sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gzVwm42op0dYJGLqZ7dp5IDRU3oxLB2OIuNOvb9n2E4=;
        b=ifuAO0XAKqgg25sxJ1KBSDioes5sYqpnlmHEBaI/Bg6HzBavUonF6B3IUiSXwPAgwM
         H5QgAmlx8xxcjwjKqlXf2MzMcq2h2Tzkkzld4wVx1Fr+a4lNCI9bPvvbblod17fujBLk
         ZFB8rRj7nOymuLi+XokG+uEuHu8pQQejjF9f3VNlJg0lMDuBhW6To9n8xVV1q+enzpfe
         /4EhRfr9T0ee2bvtlqL9ZTbZ2Ie4AlSYB4t2VefLg5peq+sW4Py0uZRPiAfCURzWfIq1
         kMnkP1uC1p1kNKkgDCLrGfwR7xZIWyzu00/d+FCm0Alafnk+rE1EYvKDVsU6V/9wwyBF
         xkOQ==
X-Gm-Message-State: AOAM532NI8IKsp57sPyYvGo24zu2K+p/Ub4LezcKMrrNXhwSrYJxnxlv
        lboQziwSbu8RO5RA6kIIINNNTLkdu00=
X-Google-Smtp-Source: ABdhPJxc25sg88Zy669SelVPqJ+lBNe8kXr+x1M5v7rp2yOXiG1LDtjf+ogEdeayXoH0Te2YCtrItQ==
X-Received: by 2002:a1c:1f88:: with SMTP id f130mr21956775wmf.91.1640019833405;
        Mon, 20 Dec 2021 09:03:53 -0800 (PST)
Received: from debian64.daheim (p5b0d7e31.dip0.t-ipconnect.de. [91.13.126.49])
        by smtp.gmail.com with ESMTPSA id t12sm1913904wrs.72.2021.12.20.09.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 09:03:52 -0800 (PST)
Received: from chuck by debian64.daheim with local (Exim 4.95)
        (envelope-from <chunkeey@gmail.com>)
        id 1mzM4m-000902-IK;
        Mon, 20 Dec 2021 18:03:52 +0100
From:   Christian Lamparter <chunkeey@gmail.com>
To:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Pavel Kubelun <be.dissent@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1] ARM: dts: qcom: ipq4019: fix sleep clock
Date:   Mon, 20 Dec 2021 18:03:52 +0100
Message-Id: <20211220170352.34591-1-chunkeey@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Pavel Kubelun <be.dissent@gmail.com>

It seems like sleep_clk was copied from ipq806x.
Fix ipq40xx sleep_clk to the value QSDK defines.

Link: https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-msm/commit/?id=d92ec59973484acc86dd24b67f10f8911b4b4b7d
Link: https://patchwork.kernel.org/comment/22721613/
Fixes: bec6ba4cdf2a ("qcom: ipq4019: Add basic board/dts support for IPQ4019 SoC")
Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org> (clock-output-names)
Signed-off-by: Pavel Kubelun <be.dissent@gmail.com>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com> (removed clock rename)
---

@Bjorn,

as promised, here's the clock-output-names version.
I've tested it extensively with the lonely devices in the office.

Thank you.
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index 7a181352b306..632038d2f7b7 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -146,7 +146,8 @@ pmu {
 	clocks {
 		sleep_clk: sleep_clk {
 			compatible = "fixed-clock";
-			clock-frequency = <32768>;
+			clock-frequency = <32000>;
+			clock-output-names = "gcc_sleep_clk_src";
 			#clock-cells = <0>;
 		};
 
-- 
2.34.1

