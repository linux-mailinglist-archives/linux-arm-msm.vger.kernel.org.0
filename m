Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4868C4301DE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 12:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244041AbhJPKWp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 06:22:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42858 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236213AbhJPKWo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 06:22:44 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: aferraris)
        with ESMTPSA id A1FDA1F44939
From:   Arnaud Ferraris <arnaud.ferraris@collabora.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Martin Kepplinger <martink@posteo.de>,
        Heiko Stuebner <heiko@sntech.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lucas Stach <dev@lynxeye.de>, Angus Ainslie <angus@akkea.ca>,
        Guido Gunther <agx@sigxcpu.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Johan Jonker <jbx6244@gmail.com>,
        Eddie Cai <eddie.cai.linux@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Brian Norris <briannorris@chromium.org>,
        Dan Johansen <strit@manjaro.org>,
        Simon South <simon@simonsouth.net>,
        Matthias Brugger <mbrugger@suse.com>,
        Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: [PATCH 1/4] arm64: dts: allwinner: add 'chassis-type' property
Date:   Sat, 16 Oct 2021 12:20:22 +0200
Message-Id: <20211016102025.23346-2-arnaud.ferraris@collabora.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211016102025.23346-1-arnaud.ferraris@collabora.com>
References: <20211016102025.23346-1-arnaud.ferraris@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A new 'chassis-type' root node property has recently been approved for
the device-tree specification, in order to provide a simple way for
userspace to detect the device form factor and adjust their behavior
accordingly.

This patch fills in this property for end-user devices (such as laptops,
smartphones and tablets) based on Allwinner ARM64 processors.

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts   | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 2 ++
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts    | 1 +
 arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts    | 1 +
 4 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
index 34e67f5f8297..63571df24da4 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
@@ -15,6 +15,7 @@
 / {
 	model = "Pinebook";
 	compatible = "pine64,pinebook", "allwinner,sun50i-a64";
+	chassis-type = "laptop";
 
 	aliases {
 		serial0 = &uart0;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index 5b44a979f250..87847116ab6d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -12,6 +12,8 @@
 #include <dt-bindings/pwm/pwm.h>
 
 / {
+	chassis-type = "handset";
+
 	aliases {
 		ethernet0 = &rtl8723cs;
 		serial0 = &uart0;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
index 6a4af14718f5..6303cd2fc398 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
@@ -16,6 +16,7 @@
 / {
 	model = "PineTab, Development Sample";
 	compatible = "pine64,pinetab", "allwinner,sun50i-a64";
+	chassis-type = "tablet";
 
 	aliases {
 		serial0 = &uart0;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
index aef571acd67f..aff0660b899c 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
@@ -14,6 +14,7 @@
 / {
 	model = "Olimex A64 Teres-I";
 	compatible = "olimex,a64-teres-i", "allwinner,sun50i-a64";
+	chassis-type = "laptop";
 
 	aliases {
 		serial0 = &uart0;
-- 
2.33.0
