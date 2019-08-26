Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C19AE9D45B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 18:48:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733202AbfHZQsO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 12:48:14 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38222 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732425AbfHZQsN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 12:48:13 -0400
Received: by mail-wr1-f66.google.com with SMTP id g17so16025986wrr.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2019 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1eN7cVd81RI8zQ0Y9k2UD2x6CFiI8Tg5XhL9VySum/g=;
        b=ucUaEDCjqc88r6EwNRvuZ4pqV2M9i1Y+DSqBWhESZQlZTfVTxLuOnzeLY6dzXb06P3
         oX/i4yQDEBxPozva8cMA4cieQZgoDSX5Kk9BFvoYPNa1NowROPGlGLjXGb0CBGmu5onk
         J57zwVshE1hKDzf2oFwzoYShD0QBm1m2NJF6ac/vpDCR5Rhw0sZlSNCM/JP8IByF+XaO
         XYqzUl070rO+I9aXxk5vSHL2+8yvVfOgTBQHIxd+wU4ens0azVJTZbSy6Dp1I+vtKk+O
         HjgtVLaToqubdGDekVdbA/XF9EOHDeXbjfQXP3pdNqGThFzha16Gv0NZNN57paW4IMwj
         iKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1eN7cVd81RI8zQ0Y9k2UD2x6CFiI8Tg5XhL9VySum/g=;
        b=LgL1vMSNypJ5Mtf3N1U2y0G0v2uJ4o48U22w1c8FVqhs7+FDLUw51gakCTEDh/gkUZ
         bWWcGY1zY1Dpe/Vzb4oINJvCyVVLS0OVICklkN/kfyjs+Pp7NhVIAFzu9dxDXbQE+YLe
         vwx+NTpUSVTE5QfMYm1nNCqp8LOzPIoOSDY+Z3s0JPM4V0J2PlndUo+VqVY5d97eKB8v
         EFA/f854LpcxSHa+XRaMDzS4wPkZTTzMblW1NHItOO0dc5VFX25zl6MZLySbJsjZomaU
         pkrOx1/wMPi8ocGFqpIDP4YA1/6wZ5I8EE90MBXSvh2DKZfYGRxtkx9UaOU/RxOglE+h
         eGpQ==
X-Gm-Message-State: APjAAAUoXua1fHKu4/ICMXDVPrXf7MhCzz7OrZM5QKdPRfeHKFrSRaMR
        nSWmRJPqUUjmufKWKoVtrg8dXw==
X-Google-Smtp-Source: APXvYqxZ1dkFGwwK1lqL8ofG9U9AtmmwCLX2B/k0MkIoCZJ6svkNEhbHuO1jti7Off9aao83Ezt6dw==
X-Received: by 2002:a5d:5183:: with SMTP id k3mr24270444wrv.270.1566838091411;
        Mon, 26 Aug 2019 09:48:11 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id o14sm21800076wrg.64.2019.08.26.09.48.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 26 Aug 2019 09:48:10 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com
Cc:     niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] arm64: dts: qcom: msm8916: Add the clocks for the APCS mux/divider
Date:   Mon, 26 Aug 2019 18:48:03 +0200
Message-Id: <20190826164807.7028-2-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190826164807.7028-1-jorge.ramirez-ortiz@linaro.org>
References: <20190826164807.7028-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Specify the clocks that feed the APCS mux/divider instead of using
default hardcoded values in the source code.

The driver still supports the previous bindings; however with this
update it we allow the msm8916 to access the parent clock names
required by the driver operation using the device tree node.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 5ea9fb8f2f87..96dc7a12aa94 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -429,7 +429,8 @@
 			compatible = "qcom,msm8916-apcs-kpss-global", "syscon";
 			reg = <0xb011000 0x1000>;
 			#mbox-cells = <1>;
-			clocks = <&a53pll>;
+			clocks = <&gcc GPLL0_VOTE>, <&a53pll>;
+			clock-names = "aux", "pll";
 			#clock-cells = <0>;
 		};
 
-- 
2.22.0

