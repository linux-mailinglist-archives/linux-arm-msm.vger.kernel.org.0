Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D7A45992D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 01:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbhKWAgq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 19:36:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229672AbhKWAgq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 19:36:46 -0500
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05620C061574;
        Mon, 22 Nov 2021 16:33:39 -0800 (PST)
Received: by mail-qt1-x841.google.com with SMTP id m25so18244272qtq.13;
        Mon, 22 Nov 2021 16:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gjKB0XtBMCJi2kvm0po9umzyxpWvimmoeXX+u/+E7nA=;
        b=jXBLp2Y57GSy4RfvoPqEFHcDelQIVLHjK0yu8msxYKuTOaAwpRTKanbHfQHM+PZea1
         Li7u2PS3PdhjZLGdjRLu4/T4kB8PVkSw0drk6EaFoJtK5fDLi7UFbSVH6JDW11Zk46eD
         F7lToGDIXgxln01rjB7a0mUvDCudb6wzG5ySSW5NltGcdUPVfFEPXFrrzlwghA1ZtT3C
         FztOloanZrsljTGHhAPIGDXeD9zFv/FpOsx40SPnKr8Hr5snDiQX5nr+a2D8wAL2FVTg
         fmVqtmDrVKQy5jU9kHgSQHbZUrFMZ7OHAjTWA9zdexSSsMM7YFx0xfDPIb4TY7eqEZtS
         2RNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gjKB0XtBMCJi2kvm0po9umzyxpWvimmoeXX+u/+E7nA=;
        b=h1orgJvROGCFtX0kgVbJsrACe0LUvYg7RneGFoy7bhAeyR1dIhq0Jg2tmVPy8cBTfC
         69IedxU3QxzRJunfzAXDZNBcGn53D6GcFWVX1RGnJtDYC5vhNGY+z2FbfLyKeAZ12QK0
         02fPEFJr+aU6F8KYKnYqbxEesBlDQS9kgrp9I+BCyY1ZlFiduqQ3oNoRjz3rU8az08gd
         CrS7LKXV2SShbRqxMoXu4e0d+h8vqZHIZtjVVFH24Acg4/uizJfxOEVb0bUl8a/nb9To
         fL5k9sQPdGzIoWEQso85hBqxZrovwIrXknjif49NkI5kehqm0p24Z0bEZcDTFac3cZNL
         pHfA==
X-Gm-Message-State: AOAM531UYM1NJf6XNy6lilaWH6Y/irdCuzWag6EwCtaB+m3vxFNdubnV
        qFVYqjHX+ZXkH0euhjYKl3uq2SMJDKIrzw==
X-Google-Smtp-Source: ABdhPJykuwZU/rqdXrIZwxKA6GehgcBxGIk/xwtP6DP4niV+jeaMqqnv3ocXor+lcJTz9d8xELVQJg==
X-Received: by 2002:ac8:6112:: with SMTP id a18mr1556649qtm.401.1637627617881;
        Mon, 22 Nov 2021 16:33:37 -0800 (PST)
Received: from lumia-dev.localdomain. (pool-96-225-98-253.nwrknj.fios.verizon.net. [96.225.98.253])
        by smtp.googlemail.com with ESMTPSA id bs7sm5508908qkb.79.2021.11.22.16.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 16:33:37 -0800 (PST)
From:   Jack Matthews <jm5112356@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     luca@z3ntu.xyz, bartosz.dudziak@snejp.pl,
        Jack Matthews <jm5112356@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: pm8226: Add vibration motor node
Date:   Tue, 23 Nov 2021 00:32:55 +0000
Message-Id: <20211123003256.2467776-1-jm5112356@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a node for pm8226's vibration motor driver.
Keep it disabled by default, some devices don't make use of it.

Signed-off-by: Jack Matthews <jm5112356@gmail.com>
---
 arch/arm/boot/dts/qcom-pm8226.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-pm8226.dtsi b/arch/arm/boot/dts/qcom-pm8226.dtsi
index 63f3026c25bf..25780c8fa2e9 100644
--- a/arch/arm/boot/dts/qcom-pm8226.dtsi
+++ b/arch/arm/boot/dts/qcom-pm8226.dtsi
@@ -61,5 +61,11 @@ pm8226_1: pm8226@1 {
 		reg = <0x1 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
+
+		pm8226_vib: vibrator@c000 {
+			compatible = "qcom,pm8916-vib";
+			reg = <0xc000>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.25.1

