Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB7D525B21B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 18:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgIBQwx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 12:52:53 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:42755 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726467AbgIBQwv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 12:52:51 -0400
Received: from buildfff.adridolf.com ([188.192.134.246]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MYedH-1k8H3n3bf9-00Vd7Z; Wed, 02 Sep 2020 18:52:44 +0200
From:   Adrian Schmutzler <freifunk@adrianschmutzler.de>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: qcom: remove commented mmc-ddr-1_8v for sdcc3
Date:   Wed,  2 Sep 2020 18:51:59 +0200
Message-Id: <20200902165159.7733-2-freifunk@adrianschmutzler.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200902165159.7733-1-freifunk@adrianschmutzler.de>
References: <20200902165159.7733-1-freifunk@adrianschmutzler.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eoj5L3YYb23t4BdVNP7rzmbK9HUIg7FQUhwepVLrO3/vAiXwMO1
 mmbfxJ9BqMbHIAM3SupAfa42tr2Qw7L8uq5jEYf4TA1nNYXTtoT/nR53QeOQ7Vb7IeOZgkx
 24Cf6ukbZ8cKRh6x4A8s5yrcHgJuQdE32TLZtHpiRg+uzkVxMqmXTUjw+FpCTdhlbgLN+IW
 ptXGGAgaMdMQsuDQYWK7Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:H8UhXfaI/ng=:LvXsXRdXQTxXk7CSxK7lc7
 F3/6fAgRrxFYiYeQdjVKhBUzOB0p9RxQgDCDR+ClO3mIr399WDcaoWz8gYjn1Gz9Ve49VOz3T
 pO3Jv4H90Eu5EqiwShHaO9az5POHDm1MlsOik+e+GptdX6yATfoChck9wxLvCp4dpAO5lZO1r
 CWWF1XtdK9VI8og0+LCI/Vli16qyS91qRybMOs46svcfscXFz+tIWXJsHfPFK1ZRVDJJP2bn5
 1rS+UL2QsY+O+gezz6ffaJQSQib3lV2ENlepp1PdS62kW0U5K0ESve/bvsbsImgUhEKwpkwxH
 O+ogiPkzhJ7HEwuYM6FI2xpiC9ElEWXcpqfPQ7hCuh46YsHFB78xeGLZLRaDU01ZivB1ZO9xx
 mCS5rj82yApCqsoEzEWhbe9+xk6KufR4g8+9iF1lYnqDfZ3LNKGGgE7QpFj+71nD8fWwiRjm/
 KK3E06G5iFyn3UgCTRQQwvmY7gXIxupc+k8qxAiTqvs2PEe64nmXgknJsV8a5kMP3Js59lqj3
 FEGRlua6ndVc9LKwKUq0qnWK7f0KQExAEfoJeuFkQFydGaGpC6MiK8aiEKJIfoKqhqIyQrVzH
 G4Pzq1Tq5z45Vx/NLsoZyBJn20TBa9sKgy3facapfX5/j8STV3YqMKMZ+AAcdlGLlIUTPLqHh
 khpyolU2u8qq7eXjPdmb3ZzMuAil7P4xWzkNOaY5VA+PJpMYyNJKLFkw+MZ6zkn21C5eGaP7Y
 EVO2KruHhJ+9SVYxM8X2SbFtkrKpOMCNHtMq1PkWh9oxeB+KxVex/1wlhhDd+VSjCXpC9yZhq
 Er1Kxqc0BnncYyQZzaCoTZoqjGUAmGbPPaL1pQKfjuLSwg1tYH2aZw9/Py6n5Ltx88weVvP0M
 pBJoAPW8kZNCDbVlp4JA==
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This property appears to be commented out, so we can remove it
as well.

Signed-off-by: Adrian Schmutzler <freifunk@adrianschmutzler.de>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index c51f9fb4a0eb..c4667dff613e 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -778,7 +778,6 @@
 				cap-sd-highspeed;
 				cap-mmc-highspeed;
 				max-frequency   = <192000000>;
-				#mmc-ddr-1_8v;
 				sd-uhs-sdr104;
 				sd-uhs-ddr50;
 				vqmmc-supply = <&vsdcc_fixed>;
-- 
2.20.1

