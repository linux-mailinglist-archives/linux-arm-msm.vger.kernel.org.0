Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAE612331D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 18:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbfLQRCx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 12:02:53 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40540 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbfLQRCx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 12:02:53 -0500
Received: by mail-pl1-f195.google.com with SMTP id g6so6372479plp.7;
        Tue, 17 Dec 2019 09:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=mAeEWVXEDZgAte4G+3qjlzHw9lM8+tunyIxAleqSLtM=;
        b=mNyXxVkJuWmDqI/6g0NEV2Q3M2mbnMe5Zos5KLTjZIkjGyLgp/+jFuZVpOR5k3QKsk
         meKuErd+DZ4yn50SsZx9rRpyg/dOF60a+N/TVdNdiuyTD1jnU+Jo59J1z7rly+NNDZP3
         9i/kRQE1DgsJSuvEj2/tjGhO8dIC9+aOEzXNRMRLNgclNWwH4ffadU2wi0ULunbJZWjl
         BdzMgqfBKfJ25EJ2m/WXmR8qqPQegpAeYqTXJpfLeZ3vL8hwkfxhgmNfDPLiIiYMobP4
         QiFe+ZAaN5sx8l5KvJ8POceNDSy1eIjQ8RbR7Ak7N8oV97/0jVBqFv60fxE2B0h9Bokf
         istQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mAeEWVXEDZgAte4G+3qjlzHw9lM8+tunyIxAleqSLtM=;
        b=UMicDF1Zk4hRVVhQVtWVj8s+ig+C8KtV/rUICn/+8AcaWSL5DkVDpBVIsvNdoOtXw1
         4951VlKotoyhl8QFv9Kwh9VLsq1j/zxFP/NLnJaBo1OpryszgaZ1IPVgziDiM+XffhQZ
         1NgN8zlShkZsx5ANsy0d2dhXCBfWNHdk/5N/3BXguwmEoWFsPJur3Uvjv3Fus3oD2Yd3
         UoEZF64Q+5CCydz+6uxf4L72lTtNhbSFIGZgEsB7wl2OFo348SrnaL+dGKrFNQTCUK3H
         rAzERlzzyiXgb9uTdHvDGDkmB73f9OByII7BgzE5p32ocEYEuEAOE7gNb/A8RQzbUtZZ
         ZWHA==
X-Gm-Message-State: APjAAAUqMTLtes896uDOijYj8YOpZr+2sL6jx5x4h3500vcIABR4ydVf
        9JRNn7qevM8fp11FhsF79Cs=
X-Google-Smtp-Source: APXvYqx2PSC9yo/d558+BtjTNXJIxJLKQ15r+ouCDpf7fTfjRzzUonVslTWhnFDmSJtCVlIBBDzaxw==
X-Received: by 2002:a17:90a:2664:: with SMTP id l91mr7494335pje.45.1576602172596;
        Tue, 17 Dec 2019 09:02:52 -0800 (PST)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id p185sm3345505pfg.61.2019.12.17.09.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2019 09:02:52 -0800 (PST)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] arm64: dts: msm8998-clamshell: Add pm8005_s1 regulator
Date:   Tue, 17 Dec 2019 09:02:49 -0800
Message-Id: <20191217170249.5280-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The pm8005_s1 is VDD_GFX, and needs to be on to enable the GPU.
This should be hooked up to the GPU CPR, but we don't have support for that
yet, so until then, just turn on the regulator and keep it on so that we
can focus on basic GPU bringup.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
index 6138b58db6d2..2319315d47b4 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
@@ -74,6 +74,23 @@
 	cpu-idle-states = <&BIG_CPU_SLEEP_1>;
 };
 
+&pm8005_lsid1 {
+	pm8005-regulators {
+		compatible = "qcom,pm8005-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+
+		pm8005_s1: s1 { /* VDD_GFX supply */
+			regulator-min-microvolt = <524000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-enable-ramp-delay = <500>;
+
+			/* hack until we rig up the gpu consumer */
+			regulator-always-on;
+		};
+	};
+};
+
 &qusb2phy {
 	status = "okay";
 
-- 
2.17.1

