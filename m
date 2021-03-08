Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCFB33307F3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 07:10:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234839AbhCHGJz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 01:09:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:44998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234669AbhCHGJ0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 01:09:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC4BB64FBA;
        Mon,  8 Mar 2021 06:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615183766;
        bh=NQ/oMT71Ey7p9P9G9HjBn4Djd8XpcMOBPu9RA6VjanU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=M5Go90b6NfN+K4J3+TihL9kYuu4mCOH0U+f8fG5o/BrmI60vnYbGRXNX3y7Ae3Ncn
         /ZBwjfCk0qF4HfJ5pCJCNl/sU64dSDaweebZyWUlwvBMBDjc1WpWwV/ybao9uGb4no
         T7fAyqhcTEImAmbgSxjV1fEd+UulhMmStULyHwmG4V4MTr6rkjK3dv29NPnx3dOKDN
         xPKhZeGkv4+iuH1W3Jrraj1ZG9TLhphG5QW0IDIfEqiOzq4PuQxZ3K8W2dITdstAH1
         l3pd3T69Dj7uRV+s7mx+flz+gzCfA5IoClInmgOejccm9Yn6/PD+niv+GPor18mk7R
         Fg+7pYpZoHTkw==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 16/18] arm64: qcom: ipq8074: fix pci node reg property
Date:   Mon,  8 Mar 2021 11:38:24 +0530
Message-Id: <20210308060826.3074234-17-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308060826.3074234-1-vkoul@kernel.org>
References: <20210308060826.3074234-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

reg property should be array of values, here it is a single array,
leading to below warning:

arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml: soc: pci@10000000:reg:0: [268435456, 3869, 268439328, 168, 557056, 8192, 269484032, 4096] is too long
arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml: soc: pci@10000000:ranges: 'oneOf' conditional failed, one must be fixed:
arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml: soc: pci@10000000:ranges: 'oneOf' conditional failed, one must be fixed:
[[2164260864, 0, 270532608, 270532608, 0, 1048576, 2181038080, 0, 271581184, 271581184, 0, 13631488]] is not of type 'null'
[2164260864, 0, 270532608, 270532608, 0, 1048576, 2181038080, 0, 271581184, 271581184, 0, 13631488] is too long
arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml: soc: pci@20000000:reg:0: [536870912, 3869, 536874784, 168, 524288, 8192, 537919488, 4096] is too long
arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml: soc: pci@20000000:ranges: 'oneOf' conditional failed, one must be fixed:
arch/arm64/boot/dts/qcom/ipq8074-hk01.dt.yaml: soc: pci@20000000:ranges: 'oneOf' conditional failed, one must be fixed:
[[2164260864, 0, 538968064, 538968064, 0, 1048576, 2181038080, 0, 540016640, 540016640, 0, 13631488]] is not of type 'null'
[2164260864, 0, 538968064, 538968064, 0, 1048576, 2181038080, 0, 540016640, 540016640, 0, 13631488] is too long

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index a32e5e79ab0b..e8db62470b23 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -567,10 +567,10 @@ frame@b128000 {
 
 		pcie1: pci@10000000 {
 			compatible = "qcom,pcie-ipq8074";
-			reg =  <0x10000000 0xf1d
-				0x10000f20 0xa8
-				0x00088000 0x2000
-				0x10100000 0x1000>;
+			reg =  <0x10000000 0xf1d>,
+			       <0x10000f20 0xa8>,
+			       <0x00088000 0x2000>,
+			       <0x10100000 0x1000>;
 			reg-names = "dbi", "elbi", "parf", "config";
 			device_type = "pci";
 			linux,pci-domain = <1>;
@@ -629,10 +629,10 @@ IRQ_TYPE_LEVEL_HIGH>, /* int_c */
 
 		pcie0: pci@20000000 {
 			compatible = "qcom,pcie-ipq8074";
-			reg =  <0x20000000 0xf1d
-				0x20000f20 0xa8
-				0x00080000 0x2000
-				0x20100000 0x1000>;
+			reg = <0x20000000 0xf1d>,
+			      <0x20000f20 0xa8>,
+			      <0x00080000 0x2000>,
+			      <0x20100000 0x1000>;
 			reg-names = "dbi", "elbi", "parf", "config";
 			device_type = "pci";
 			linux,pci-domain = <0>;
-- 
2.26.2

