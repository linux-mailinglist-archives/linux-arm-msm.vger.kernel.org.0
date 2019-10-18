Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A222DBD5C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 07:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406729AbfJRF57 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 01:57:59 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33930 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392149AbfJRF57 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 01:57:59 -0400
Received: by mail-pf1-f194.google.com with SMTP id b128so3182483pfa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2019 22:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BjR68Nu1t94WjnFzIRWXICEwhOwBhStsX4bSmZOmhNs=;
        b=U+fb3tE/PXhBNdyt+N8SnfrqAnvToUfKvHhzKzU0b45zxSed9yn6r1dkMtJEzAMp12
         b1q/xjnm/4KeWJUVrj19bSnu9nxn9JwA29Dp3+d02eB14HJ2tbRnWCyx3RsfbNGxV8E7
         iwh/HzxzF+Cr0JvgfFOIa5EvWJ+PlDYp0SmuSgXw5a2Zub9Tiki6hA+I2mi8rUlxt8sp
         CmvnBXem1FFDkVXLLJ91IVwDJv5UaR7p2S3xo9zxBmSNrfn3U7XvFlDWEo92oNKYjetN
         z3+/AwRmQUsxJGezI6NQOEWKqEUU6TfhKhCQnEmfcmbKcYYj1NGEUqGlgQJlDxdydym+
         WZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BjR68Nu1t94WjnFzIRWXICEwhOwBhStsX4bSmZOmhNs=;
        b=QAxIRPymGoTEOq850ehJqXhb/6VGuG/Rx7UagPMRo9PsKTA6A8gosOcdRMCZyoLEMn
         UkBBlTX+5mExEP8HILk83cw45LLYoMx6TlnLW7vVTp4cLDmqmkGWFqk15kvl3uUcGlMc
         /nK9dA5Rwmg6B+PIh9j4y2qLtETuiU8cl2FAMtTs9gXzth+4TYsri/l4mGLXJFVWsHkg
         7/MQYH+mMmryUFrtelXApMNw5+WxZ/5TTzN4Ix4poo/jTMuA36ZKbS/TToXD173Kh0c8
         PkVeKHjcv2+CXTGBX+65Z7GpaXsE5B3soTWYsejDJfVxBW86hldmnHYlzYzdSLB5Z0XY
         pJNg==
X-Gm-Message-State: APjAAAWYNUwXSZGHM3adkcHPECPUnUx5qtQ6NW6Phn4NzvGf9YIlcPuk
        q8uyILLJuIjDx6pi6qi6tCw54A==
X-Google-Smtp-Source: APXvYqy5IJeHpgkEnhtjCit/UQHxfkfdJ1iX3G7PowQjWoI5KfKn/OGjXDBMpAkntx8AHu8A8oBhuw==
X-Received: by 2002:a62:3441:: with SMTP id b62mr4734957pfa.233.1571378276610;
        Thu, 17 Oct 2019 22:57:56 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f89sm4447849pje.20.2019.10.17.22.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 22:57:55 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: c630: Enable UFS device reset
Date:   Thu, 17 Oct 2019 22:57:52 -0700
Message-Id: <20191018055752.3729530-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Setup the TLMM UFS_RESET to make the UFS core reset the UFS memory
device during initialization.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 13dc619687f3..01709951fdb6 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sdm845.dtsi"
 #include "pm8998.dtsi"
@@ -394,6 +395,8 @@
 &ufs_mem_hc {
 	status = "okay";
 
+	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+
 	vcc-supply = <&vreg_l20a_2p95>;
 	vcc-max-microamp = <600000>;
 };
-- 
2.23.0

