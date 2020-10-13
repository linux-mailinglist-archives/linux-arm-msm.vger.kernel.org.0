Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73A2728C87D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 08:07:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389086AbgJMGG5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 02:06:57 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15208 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389023AbgJMGGy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 02:06:54 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 3102DFFE654D1B534E1E;
        Tue, 13 Oct 2020 14:06:50 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.134) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Tue, 13 Oct 2020 14:06:42 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        "Scott Branden" <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/2] arm64: dts: broadcom: remove an unused property dma-ranges
Date:   Tue, 13 Oct 2020 14:06:22 +0800
Message-ID: <20201013060623.1711-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20201013060623.1711-1-thunder.leizhen@huawei.com>
References: <20201013060623.1711-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.134]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

stingray-usb.dtsi is finally included by three dts files:
bcm958802a802x.dts, bcm958742k.dts and bcm958742t.dts. I searched all
these three entire expanded dts files, and each of them contains only one
dma-ranges. No conversion range is specified, so it cannot work properly.
I think this property "dma-ranges" is added by mistake, just remove it.
Otherwise, the following error will be reported when any YAML detection
is performed on arm64.

arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
(dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
its #address-cells (1) differs from / (2)
arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning \
(dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but \
its #size-cells (1) differs from / (2)

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
index 55259f973b5a9e4..9ac8be6c65aa031 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
@@ -4,7 +4,6 @@
  */
 	usb {
 		compatible = "simple-bus";
-		dma-ranges;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x68500000 0x00400000>;
-- 
1.8.3


