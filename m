Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4436DBD5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 07:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbfJRF6r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 01:58:47 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44052 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389702AbfJRF6r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 01:58:47 -0400
Received: by mail-pf1-f196.google.com with SMTP id q21so3148121pfn.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2019 22:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kf8Wl/hDIqlCih1Sj7ch2+u/J8zBMzyn3cjl/QZrjFA=;
        b=VcbPssRYtYFfLq3BlQOzi3O3UfsrFx3ywu4mfvNFSYE5JuX7HMOJy6QKGeSqjiJzB/
         Ow2LRoeZPXI/6sQV6wua4F9IpDMXhMPInzYZ6dGBeG8c2TjwRPUbAXHtMbGt6VaSlciF
         7C9O2WTfDLMBAmRFTdhCIxi8/pHvXovHwhFsNpFdurGvz7XFlDOLsDS2+2VXfrbcv0Pd
         JmLpQSKXWbvq9Ei5zpuLtSoBW4AVkWzI3soVpOw6j8+NQxhe1FvEhabvHK3YH//Fw/jo
         WpTcCDyiFMYvtxMSssdXOnUBJwBpiBRCOYB9MttDmXOxjUzPnUytmdCTiPzVrpBOLWO2
         kHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kf8Wl/hDIqlCih1Sj7ch2+u/J8zBMzyn3cjl/QZrjFA=;
        b=rpDPFiMxsdIoC8UT0eSAui+MQv7k8xDeRPqK1ipDe3HXuyE5ExGd0rdehBupTbdbmy
         u1q5gkLfFdRaD0lQNCUWbetnNgmK1KYKVKG79zghqrgXSh0CM0z+Rz97TOvB/FUqy8Bk
         1aC2aPdqPUgWmhacXeJke9VJBzj+VNQV4JhtXphlDI/k2F6Af5a/wlNnNQnfBsESqV9m
         VpnyzukNrdHjof8KMffgk3Gkeu/MM3JsTMFWjrbuSaIr2Ny21DgnZzvYuRncSltOIKi2
         ITJk7y4FcUrznA/4vL7Ajj2B3Yvy6RxrsmGs6xmK3ZDBlCicC7qWL9FIVaaa+/waTLlr
         U5ew==
X-Gm-Message-State: APjAAAXmtZj/DgHD1Tgej6Jth/v64t1AyXW6c8lEL/dnXeAl/qV0iAFr
        PLmtiSkVByzrsNzD1F77MQE9pg==
X-Google-Smtp-Source: APXvYqxGwnRoQLug4jtB3dhzUdDRkIJWOtWJl2b/CkR0ciyZuyOcTWg05+6pXxb0NwOwdDmBW1K28w==
X-Received: by 2002:a63:160a:: with SMTP id w10mr8499180pgl.212.1571378325034;
        Thu, 17 Oct 2019 22:58:45 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p66sm5727799pfg.127.2019.10.17.22.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 22:58:44 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: c630: Add WiFi node
Date:   Thu, 17 Oct 2019 22:58:41 -0700
Message-Id: <20191018055841.3729591-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Specify regulators and enable the &wifi node. The firmware uses the 8
bit version of the host capability message, so specify this quirk.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 01709951fdb6..53d4d40dfe43 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -461,3 +461,14 @@
 	vdda-phy-supply = <&vdda_usb2_ss_1p2>;
 	vdda-pll-supply = <&vdda_usb2_ss_core>;
 };
+
+&wifi {
+	status = "okay";
+
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+
+	qcom,snoc-host-cap-8bit-quirk;
+};
-- 
2.23.0

