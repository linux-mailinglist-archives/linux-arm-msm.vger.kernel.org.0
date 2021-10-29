Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F87044041A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 22:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbhJ2Udh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 16:33:37 -0400
Received: from linux.microsoft.com ([13.77.154.182]:39778 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbhJ2Ude (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 16:33:34 -0400
Received: from thelio.attlocal.net (107-203-255-60.lightspeed.sntcca.sbcglobal.net [107.203.255.60])
        by linux.microsoft.com (Postfix) with ESMTPSA id 569D920A65C7;
        Fri, 29 Oct 2021 13:31:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 569D920A65C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1635539465;
        bh=eWzFCLG7u168xXd8dNNZO0ZcqyY8CG/XMu+M9T4558c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pObjYcYPrVWsfDYHs7Z+J6kdCmFkG5j1qaeoOQxFClOez8s23+HrHK2J+KDQ+fWy3
         JpELyCQ+MjGtkZOty9iD+Rj4EaHFF0DEKDsGJ+yYAVDBEm2tQ1DSbHfPOekHF3UQ99
         WqQs0TcDoqYN8QNX5R0ugrGm3qU+UA3r7Q3tNji8=
From:   Katherine Perez <kaperez@linux.microsoft.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, balbi@kernel.org
Subject: [PATCH 2/2] arm64: dts: sm8350: fix tlmm base address
Date:   Fri, 29 Oct 2021 13:30:16 -0700
Message-Id: <20211029203016.2093610-3-kaperez@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029203016.2093610-1-kaperez@linux.microsoft.com>
References: <20211029203016.2093610-1-kaperez@linux.microsoft.com>
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
index e91cd8a5e535..a1d0c51a6da7 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -815,9 +815,9 @@ spmi_bus: spmi@c440000 {
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

