Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F00145954A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 20:06:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235954AbhKVTJV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 14:09:21 -0500
Received: from linux.microsoft.com ([13.77.154.182]:54662 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234206AbhKVTJU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 14:09:20 -0500
Received: from thelio.attlocal.net (107-203-255-60.lightspeed.sntcca.sbcglobal.net [107.203.255.60])
        by linux.microsoft.com (Postfix) with ESMTPSA id 9A04E20CEA98;
        Mon, 22 Nov 2021 11:06:10 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9A04E20CEA98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1637607970;
        bh=LttQCpO7QeJlDeMp9c834UuDMHtJOZUdMm3s6DbZzK4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JYypCteON8EJ2wNUAlux4O2kHEbElE8rbPbqTRXJ51X2y4/W+1nLAnHl6aBHMZbCq
         +YLNSAeU7GnTw9yhauIFzqfjhb5y2Jxevi9wSbYzKr9tD654yX4PTPwstFYI6dV3iA
         0VPaM5Suc4nkjM8rkVeT6TxiXT/ZSS6vMSXjN4dM=
From:   Katherine Perez <kaperez@linux.microsoft.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: sm8350: fix tlmm base address
Date:   Mon, 22 Nov 2021 11:05:52 -0800
Message-Id: <20211122190552.74073-3-kaperez@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211122190552.74073-1-kaperez@linux.microsoft.com>
References: <20211122190552.74073-1-kaperez@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

TLMM controller base address is incorrect and will hang on some platforms.
Fix by giving the correct address.

Signed-off-by: Katherine Perez <kaperez@linux.microsoft.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index d134280e2939..624d294612d8 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -960,9 +960,9 @@ spmi_bus: spmi@c440000 {
 			#interrupt-cells = <4>;
 		};
 
-		tlmm: pinctrl@f100000 {
+		tlmm: pinctrl@f000000 {
 			compatible = "qcom,sm8350-tlmm";
-			reg = <0 0x0f100000 0 0x300000>;
+			reg = <0 0x0f000000 0 0x300000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			#gpio-cells = <2>;
-- 
2.31.1

