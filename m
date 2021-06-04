Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D28FD39BED7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 19:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229892AbhFDRdh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 13:33:37 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170]:35868 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbhFDRdh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 13:33:37 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1622827905; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=FWkBjSJ9NzrBBKVQXJdixKMdux64NXMe1Z/fvatnpx55G3g2gi0Zi/tx5eFGXVKdVt
    fkuYY6jxXlBLnmhIh5/FqmuElEWZr3jJOoba6Sx5zYWxvnbqYGPX5Tb91wcP2hGgf57J
    aRliAYAEYdKxAV4tWzobnfYoGv8Db+wCsJJHTEpw6ujucQf3OEYrR7cvJveZXZQS01LF
    1K0ypaoMeWfSbAGl4ROHEJjrDv5mvnwNKcrgbN1a7FBOdU8MZbipLqCtIdZ8+O2dxLS6
    UPQhwty4otx/vwYZw9Uozxxb/wCxSLRHXjA7kwYDe/xoLKfyDY/U/qiq/mYYPXlFtvSo
    gyfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622827905;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=JyS3FQxJZ5yMJJEmnO8zGk2QyVkrz3MttXjb4FvQI1k=;
    b=RrsBYJ87kPEIqcUcnpMb8nsEs5oPa+U2TCxEP1s68MsQDzCOoxxFw7hqVtS5hseAbn
    ts/FPVmbZY4cQ0sXhmqmpVUkMO5xqqmpQ5gtY4jD3YkqLGrqLvI1zkHcPwpdaSYjJcki
    5VNYwKNdONW62NQkhe7ysC7a8T1Nnyyzm30TGzd/GP/BL4FXJFWZmFSVnKr8NWULDo3m
    Kdy6lBkUmdQVNgi0E1sclsNWacgkrQOGg04Q/t9pSIw8XTmNzEvpH7/UetA7++pqRcNa
    QHQFzjByIPhXI+EeutK9lLpfYQx0a7k8/6jAdgRtYBz7W6Vox14Xh6/golO5KRBKm9zZ
    vSDA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622827905;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=JyS3FQxJZ5yMJJEmnO8zGk2QyVkrz3MttXjb4FvQI1k=;
    b=A51x1wkyHoxG6JA32EObMN5MFjLoqRf2dFkMYsm6JSYRLXQlik6HGI7fVNyWoHloxJ
    h7v74fsARmoy8Yt2/Us9f8C5JrBy7h4jmfyYIjcft/3aUtm11c3JCdz+nJKYDutGlBxe
    w7T/j9Uc6/N8rbWGoDTj6wGKpyIHlvParPuZQv3XfzJVBM8xcOrNzSew8jh0DDA/gxZu
    9XcFKC+52WzRhXXkP1vqsTGBb+KxKmF850kZ4EvEc0ak44gR3E426uLYKyhm1fXXGyIE
    ZzlzdlPg/4j5AI1Pl0cu03+ZqLeEPqy8A18QG6hcGq1t4PQHz6mfCjo9OQBCopi2kpzZ
    Grwg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6Pvxo="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.27.2 DYNA|AUTH)
    with ESMTPSA id y01375x54HVjH5a
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 4 Jun 2021 19:31:45 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Michael Srba <Michael.Srba@seznam.cz>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 4/5] arm64: dts: qcom: msm8916-samsung-a2015: Add rt5033 battery
Date:   Fri,  4 Jun 2021 19:27:41 +0200
Message-Id: <20210604172742.10593-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604172742.10593-1-stephan@gerhold.net>
References: <20210604172742.10593-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Samsung Galaxy A3/A5 use a Richtek RT5033 PMIC as battery
fuel gauge, charger, flash LED and for some regulators. For now,
only add the fuel gauge/battery device to the device tree,
so we can check the remaining battery percentage.

The other RT5033 drivers need some more work first before
they can be used properly.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../qcom/msm8916-samsung-a2015-common.dtsi    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index 3c77e7ef9eda..9a6988ded29d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -151,6 +151,20 @@ magnetometer@12 {
 	};
 };
 
+&blsp_i2c4 {
+	status = "okay";
+
+	battery@35 {
+		compatible = "richtek,rt5033-battery";
+		reg = <0x35>;
+		interrupt-parent = <&msmgpio>;
+		interrupts = <121 IRQ_TYPE_EDGE_BOTH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&fg_alert_default>;
+	};
+};
+
 &blsp1_uart2 {
 	status = "okay";
 };
@@ -313,6 +327,14 @@ accel_int_default: accel-int-default {
 		bias-disable;
 	};
 
+	fg_alert_default: fg-alert-default {
+		pins = "gpio121";
+		function = "gpio";
+
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	gpio_keys_default: gpio-keys-default {
 		pins = "gpio107", "gpio109";
 		function = "gpio";
-- 
2.31.1

