Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF97B40518F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 14:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348694AbhIIMhF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 08:37:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:39524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350046AbhIIMb5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 08:31:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9046561B45;
        Thu,  9 Sep 2021 11:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631188385;
        bh=0sRjAYb+0qs4QnC1cjMiOdZudBqfkjzC6vfJ9zbTIDw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hCvbKWeUouaml2QmFCVVrf3+HXKnQBBbDsZ62jXPf32nVQixfS/GVpwCUXYhRvQ+j
         B/sr6w+Ok2fczqMGO6ZqHgVdSxzs8JxT4oqM3+E4CHrefJI2FYWsdB8mxJJBGfcBWS
         C84BBCy2iDqmezTKBqBqtFa6KqpuoJvpC9OLEXwr+q/ZreJT45qDRY2407Fz/9R4v5
         PkEJrfyMibZHxeJnKq397m8E0kkVAiIRVjEWkm2D/z1jppFck25Wiq8EY2z8avqQTb
         HdfS1i/QeihOa4VCNPiZ/ZKvrkyPTBHISfuxTqY/jdUaFZwwoNagE5dcSRQKluGJwx
         g7pIbmn46UUCQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sasha Levin <sashal@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 083/176] arm64: dts: qcom: ipq8074: fix pci node reg property
Date:   Thu,  9 Sep 2021 07:49:45 -0400
Message-Id: <20210909115118.146181-83-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115118.146181-1-sashal@kernel.org>
References: <20210909115118.146181-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

[ Upstream commit 52c9887fba71fc8f12d343833fc595c762aac8c7 ]

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
Link: https://lore.kernel.org/r/20210308060826.3074234-17-vkoul@kernel.org
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 829e37ac82f6..776a6b0f61a6 100644
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
2.30.2

