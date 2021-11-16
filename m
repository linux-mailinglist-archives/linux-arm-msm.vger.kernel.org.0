Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B093C453CE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 00:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232409AbhKPXxs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 18:53:48 -0500
Received: from linux.microsoft.com ([13.77.154.182]:51802 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbhKPXxr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 18:53:47 -0500
Received: from thelio.attlocal.net (107-203-255-60.lightspeed.sntcca.sbcglobal.net [107.203.255.60])
        by linux.microsoft.com (Postfix) with ESMTPSA id 51D9820C63B5;
        Tue, 16 Nov 2021 15:50:49 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 51D9820C63B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1637106649;
        bh=LttQCpO7QeJlDeMp9c834UuDMHtJOZUdMm3s6DbZzK4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W3BO2RrRgwhLfMEO6QLeBIbs8gvbq1eNYDIseAdQOhFWteUvREN+dTOXx+CwuhglC
         Ub8AySU6j3QncShtzwC0lK5ktZhx30usjS2HvEtjkVDPbmwz1xX7oi+8O0Sn/gJhoO
         W1mt2P4gAnNNr8baGc9yqMEV9F+Ae2WJq2FK03Qc=
From:   Katherine Perez <kaperez@linux.microsoft.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: [RESEND PATCH 2/2] arm64: dts: sm8350: fix tlmm base address
Date:   Tue, 16 Nov 2021 15:50:45 -0800
Message-Id: <20211116235045.3748572-3-kaperez@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211116235045.3748572-1-kaperez@linux.microsoft.com>
References: <20211116235045.3748572-1-kaperez@linux.microsoft.com>
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

