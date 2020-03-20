Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CADAD18C74D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2020 07:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgCTGF4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Mar 2020 02:05:56 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49218 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgCTGF4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Mar 2020 02:05:56 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02K65liF087197;
        Fri, 20 Mar 2020 01:05:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584684347;
        bh=92aYmx2LDHn+oan17yeViCMmubMagIT6Mha4LGq7Gkc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=cIwMG4nAK+q7Y/r2s2YXS7oQzrP/xC9HdV8YC9KgMIUWwC3qs6KzLrfnsWr6ov7LT
         mOywKLzOLZQfz1XDCf0FWr6vx+siRGKTnDR8BTSTz1ZzvKHu9/y4dYkxxnuUDQQQas
         /L1XS64STiict+RZCGjs2XdYXa6/nKM6CMRyueK4=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02K65lK7003285
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Mar 2020 01:05:47 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 20
 Mar 2020 01:05:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 20 Mar 2020 01:05:47 -0500
Received: from [10.250.133.193] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02K65gR0046350;
        Fri, 20 Mar 2020 01:05:43 -0500
Subject: Re: [PATCH v5 0/9] Add QUSB2 PHY support for SC7180
To:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Manu Gautam <mgautam@codeaurora.org>
References: <1583747589-17267-1-git-send-email-sanm@codeaurora.org>
From:   Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <a1fe769a-a19f-c753-70f1-ad1a8a87d914@ti.com>
Date:   Fri, 20 Mar 2020 11:35:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1583747589-17267-1-git-send-email-sanm@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/9/2020 3:23 PM, Sandeep Maheswaram wrote:
> Converting dt binding to yaml.
> Adding compatible for SC7180 in dt bindings.
> Added generic QUSB2 V2 PHY support and using the same SC7180 and SDM845.
> 
> Changes in v5:
> *Added the dt bindings which are applicable only to QUSB2 V2 PHY in 
>  separate block as per comments from Matthias in patch 1/9 and patch 4/9
>  and addressed Rob's comment in patch 1/9.
> *Separated the patch for new override params and added a local variable
>  to access overrides as per comments from Matthias patch 5/9 and 6/9.
> 
> Changes in v4:
> *Addressed Rob Herrings comments in dt bindings.
> *Added new structure for all the overriding tuning params.
> *Removed the sc7180 and sdm845 compatible from driver and added qusb2 v2 phy. 
> *Added the qusb2 v2 phy compatible in device tree for sc7180 and sdm845. 
> 
> Changes in v3:
> *Using the generic phy cfg table for QUSB2 V2 phy.
> *Added support for overriding tuning parameters in QUSB2 V2 PHY
> from device tree.
> 
> Changes in v2:
> Sorted the compatible in driver.
> Converted dt binding to yaml.
> Added compatible in yaml.
> 
> Sandeep Maheswaram (9):
>   dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy bindings to yaml
>   dt-bindings: phy: qcom,qusb2: Add compatibles for QUSB2 V2 phy and
>     SC7180
>   phy: qcom-qusb2: Add generic QUSB2 V2 PHY support
>   dt-bindings: phy: qcom-qusb2: Add support for overriding Phy tuning
>     parameters
>   phy: qcom-qusb2: Add support for overriding tuning parameters in QUSB2
>     V2 PHY
>   phy: qcom-qusb2: Add new overriding tuning parameters in QUSB2 V2 PHY

merged the above patches to phy -next.

Thanks
Kishon
>   arm64: dts: qcom: sc7180: Add generic QUSB2 V2 Phy compatible
>   arm64: dts: qcom: sdm845: Add generic QUSB2 V2 Phy compatible
>   arm64: dts: qcom: sc7180: Update QUSB2 V2 Phy params for SC7180 IDP
>     device
> 
>  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 187 +++++++++++++++++++++
>  .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |  68 --------
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts            |   6 +-
>  arch/arm64/boot/dts/qcom/sc7180.dtsi               |   2 +-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi               |   4 +-
>  drivers/phy/qualcomm/phy-qcom-qusb2.c              | 144 +++++++++++-----
>  6 files changed, 297 insertions(+), 114 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> 
