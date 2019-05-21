Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3332561D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 18:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729051AbfEUQxq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 12:53:46 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36922 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727817AbfEUQxp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 12:53:45 -0400
Received: by mail-pf1-f195.google.com with SMTP id a23so1261666pff.4;
        Tue, 21 May 2019 09:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iBNWA3Q34YdWgsuNmXPxNF7vrc9TL3I+nOP4vsPlPnU=;
        b=edSeyhbEQGp0mubLqWZZ6VG6eKSS0mrzq+2AQ8aGxaLB/g/EynpSREp/6DuUWumbn2
         ssr3+zPLpBy8YK3eEQfF6u+3dDwUBwCfzx/dJyUz3ndvG59YUx5RUqpxwsVZ4chZgvF+
         AFDGrHYNzbuqUlmpYlAjqjx5N0d3081jZgh6La3XbViNn5Vr7jDYgvucNTGsH9CULMCk
         os+Egpk38ehbY/6MJ1XwVqLH8fQB8TCOkZRJmhPQVqVJUw7u2K4WDQB50KmEOxiXAXQF
         PJFJ/YX8CjG5g21cdNPM85pBCttvavPOrF5nD+dmVJ8uAYrm3GJH4YqWXWohj4602wRj
         Tt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iBNWA3Q34YdWgsuNmXPxNF7vrc9TL3I+nOP4vsPlPnU=;
        b=KsDAoZc1MVoW0Dmw/40dUl4d7jgsP2WfNz4ElAMwpmleIoLtp2tu2awpPn/wf6e71H
         9QLp+GjxccoexeJc9CM29q9SvC0aPwK7PU44DpZ3wQUgzTQlHK/eGt0KVnOfqjeyDFsE
         qWx9gvtTpr+rgYtzlf2xAWM4haP670+D3WCpu7UwXeUKIdRQgzoiN6Ae6pnLJ+0oq3Os
         p84wAcN4yAdUkNzODuOOXSYhuj4pkiLb4bukeoI8EHMKvagBVgEu9nUqDZC+G9Bv4+N0
         Aq65Cmx2H2MTgDCVybFeqSEtyl/c2ny5XVoNGvhJY4u4BSZjX2F5hn64eGGRa5xe/MzD
         KVjw==
X-Gm-Message-State: APjAAAXbw64zLdjyv5mapoA3BKufPj8XBd9KKQhWkt0sPF2WZjE81Gh+
        malq0+UCTfCXQEcsihnHAvk=
X-Google-Smtp-Source: APXvYqzUlkwfNiyb0GSJJJSTJpQ/cd+NBDP2GV2EyQpv7q8n+S7SUmkK8fjdYKQywfSNKBkMpAOOrg==
X-Received: by 2002:a63:68e:: with SMTP id 136mr29459333pgg.81.1558457625231;
        Tue, 21 May 2019 09:53:45 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id q4sm25587328pgb.39.2019.05.21.09.53.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 09:53:44 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org
Cc:     jcrouse@codeaurora.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 3/3] arm64: dts: msm8998-mtp: Add pm8005_s1 regulator
Date:   Tue, 21 May 2019 09:53:41 -0700
Message-Id: <20190521165341.14428-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190521164932.14265-1-jeffrey.l.hugo@gmail.com>
References: <20190521164932.14265-1-jeffrey.l.hugo@gmail.com>
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
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index f09f3e03f708..108667ce4f31 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -27,6 +27,23 @@
 	status = "okay";
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

