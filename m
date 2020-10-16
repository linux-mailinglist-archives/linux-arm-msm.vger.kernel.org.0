Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4FB32900D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 11:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395014AbgJPJJV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 05:09:21 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:44326 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2394982AbgJPJJF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 05:09:05 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id F05E89640A3407912883;
        Fri, 16 Oct 2020 17:09:00 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.134) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Fri, 16 Oct 2020 17:08:54 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        "Florian Fainelli" <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH v2 0/2] eliminate two common errors reported by any yaml on arm64
Date:   Fri, 16 Oct 2020 17:08:31 +0800
Message-ID: <20201016090833.1892-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.134]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v1 --> v2:
Although it's simpler to delete the empty "dma-ranges" property, and the function
of_translate_one() in drivers/of/address.c will treate non "dma-ranges" case as
empty "dma-ranges". But as Arnd Bergmann suggested: it's not good for the scenario
of IOMMU disabled or absented.

This version make sure that the node have empty "dma-ranges" property have the same
"#address-cells" and "#size-cells" values as its parent node.


v1:
The following errors occured no matter which YAML file I executed on arm64.
Therefore, it is necessary to eliminate it so that people's time and energy are
not wasted every time.

arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)
arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)
arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)
arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)
arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)
arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi:7.3-14: Warning (dma_ranges_format): /usb:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)
arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)
arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #address-cells (1) differs from / (2)
arch/arm64/boot/dts/qcom/ipq6018.dtsi:185.3-14: Warning (dma_ranges_format): /soc:dma-ranges: empty "dma-ranges" property but its #size-cells (1) differs from / (2)

Zhen Lei (2):
  arm64: dts: broadcom: clear the warnings caused by empty dma-ranges
  arm64: dts: qcom: clear the warnings caused by empty dma-ranges

 .../boot/dts/broadcom/stingray/stingray-usb.dtsi   | 20 +++---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              | 72 +++++++++++-----------
 2 files changed, 46 insertions(+), 46 deletions(-)

-- 
1.8.3


