Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEF8C34A5B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 11:37:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhCZKhL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 06:37:11 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:64752 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbhCZKgr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 06:36:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616755007; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=6lGtO08dpDF1Iyq9sKetPqsh85UrTYIJWbX4cUE0v+Q=;
 b=G3EK5y9uXUaC5UTl01G/SkMAke8puwO8mUKW58rUb2+1VZ1mnwEHWn8ZF0tNGA56vxdK8fMc
 0+gpVsw3PZTdJYXX0qcKTrNDptbyeWalkYOfxbG6A4pnBiwDpPmOrKAhvUEx1qqLN/OrCBkK
 qU8iZqa69UPR9KhrNGpe97IeObQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 605db9300a4a07ffdade7e0c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Mar 2021 10:36:32
 GMT
Sender: mkrishn=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9AE7DC43463; Fri, 26 Mar 2021 10:36:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mkrishn)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1A228C433ED;
        Fri, 26 Mar 2021 10:36:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 26 Mar 2021 16:06:30 +0530
From:   mkrishn@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, bjorn.andersson@linaro.org,
        vinod.koul@linaro.org, rnayak@codeaurora.org,
        dianders@chromium.org, sibis@codeaurora.org, khsieh@codeaurora.org
Subject: Re: [PATCH v14 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 PHY bindings
In-Reply-To: <161671311714.3012082.4777798674596112311@swboyd.mtv.corp.google.com>
References: <1616673661-20038-1-git-send-email-mkrishn@codeaurora.org>
 <1616673661-20038-3-git-send-email-mkrishn@codeaurora.org>
 <161671311714.3012082.4777798674596112311@swboyd.mtv.corp.google.com>
Message-ID: <81ea21602c74d2b18e4b013dda3a3213@codeaurora.org>
X-Sender: mkrishn@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-26 04:28, Stephen Boyd wrote:
> Quoting Krishna Manikandan (2021-03-25 05:01:00)
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>> new file mode 100644
>> index 0000000..4a26bef
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-10nm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Display DSI 10nm PHY
>> +
>> +maintainers:
>> +  - Krishna Manikandan <mkrishn@codeaurora.org>
>> +
>> +allOf:
>> +  - $ref: dsi-phy-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,dsi-phy-10nm
>> +      - const: qcom,dsi-phy-10nm-8998
>> +
>> +  reg:
>> +    items:
>> +      - description: dsi phy register set
>> +      - description: dsi phy lane register set
>> +      - description: dsi pll register set
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dsi_phy
>> +      - const: dsi_phy_lane
>> +      - const: dsi_pll
>> +
>> +  vdds-supply:
>> +    description: |
>> +      Connected to DSI0_MIPI_DSI_PLL_VDDA0P9 pin for sc7180 target 
>> and
>> +      connected to VDDA_MIPI_DSI_0_PLL_0P9 pin for sdm845 target
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - vdds-supply
>> +
>> +unevaluatedProperties: false
> 
> additionalProperties: false instead? This comment applies to the other
> bindings in this patch.

Hi Stephen,
We are referencing dsi-phy-common.yaml in this file. Since the 
properties of dsi-phy-common.yaml are applicable to this file also, I 
added unevaluatedProperties: false. If we add additionalProperties: 
false instead, then the properties of dsi-phy-common.yaml will not be 
applicable here and this will throw an error if we add the properties 
from dsi-phy-common.yaml in the example.
I will address all other comments in the next patchset.

Thanks,
Krishna
> 
>> +
>> +examples:
>> +  - |
>> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
>> +     #include <dt-bindings/clock/qcom,rpmh.h>
>> +
>> +     dsi-phy@ae94400 {
>> +         compatible = "qcom,dsi-phy-10nm";
>> +         reg = <0x0ae94400 0x200>,
>> +               <0x0ae94600 0x280>,
>> +               <0x0ae94a00 0x1e0>;
>> +         reg-names = "dsi_phy",
>> +                     "dsi_phy_lane",
>> +                     "dsi_pll";
>> +
>> +         #clock-cells = <1>;
>> +         #phy-cells = <0>;
>> +
>> +         vdds-supply = <&vdda_mipi_dsi0_pll>;
>> +         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                  <&rpmhcc RPMH_CXO_CLK>;
>> +         clock-names = "iface", "ref";
>> +     };
>> +...
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> new file mode 100644
>> index 0000000..72a00cc
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> @@ -0,0 +1,66 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-14nm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Display DSI 14nm PHY
>> +
>> +maintainers:
>> +  - Krishna Manikandan <mkrishn@codeaurora.org>
>> +
>> +allOf:
>> +  - $ref: dsi-phy-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,dsi-phy-14nm
>> +      - const: qcom,dsi-phy-14nm-660
>> +
>> +  reg:
>> +    items:
>> +      - description: dsi phy register set
>> +      - description: dsi phy lane register set
>> +      - description: dsi pll register set
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dsi_phy
>> +      - const: dsi_phy_lane
>> +      - const: dsi_pll
>> +
>> +  vcca-supply:
>> +    description: Phandle to vcca regulator device node.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - vcca-supply
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
>> +     #include <dt-bindings/clock/qcom,rpmh.h>
>> +
>> +     dsi-phy@ae94400 {
>> +         compatible = "qcom,dsi-phy-14nm";
>> +         reg = <0x0ae94400 0x200>,
>> +               <0x0ae94600 0x280>,
>> +               <0x0ae94a00 0x1e0>;
>> +         reg-names = "dsi_phy",
>> +                     "dsi_phy_lane",
>> +                     "dsi_pll";
>> +
>> +         #clock-cells = <1>;
>> +         #phy-cells = <0>;
>> +
>> +         vcca-supply = <&vcca_reg>;
>> +         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                  <&rpmhcc RPMH_CXO_CLK>;
>> +         clock-names = "iface", "ref";
>> +     };
>> +...
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
>> new file mode 100644
>> index 0000000..743806d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
>> @@ -0,0 +1,71 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-20nm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Display DSI 20nm PHY
>> +
>> +maintainers:
>> +  - Krishna Manikandan <mkrishn@codeaurora.org>
>> +
>> +allOf:
>> +  - $ref: dsi-phy-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,dsi-phy-20nm
>> +
>> +  reg:
>> +    items:
>> +      - description: dsi pll register set
>> +      - description: dsi phy register set
>> +      - description: dsi phy regulator register set
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dsi_pll
>> +      - const: dsi_phy
>> +      - const: dsi_phy_regulator
>> +
>> +  vcca-supply:
>> +    description: Phandle to vcca regulator device node.
>> +
>> +  vddio-supply:
>> +    description: Phandle to vdd-io regulator device node.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - vddio-supply
>> +  - vcca-supply
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
>> +     #include <dt-bindings/clock/qcom,rpmh.h>
>> +
>> +     dsi-phy@fd922a00 {
>> +         compatible = "qcom,dsi-phy-20nm";
>> +         reg = <0xfd922a00 0xd4>,
>> +               <0xfd922b00 0x2b0>,
>> +               <0xfd922d80 0x7b>;
>> +         reg-names = "dsi_pll",
>> +                     "dsi_phy",
>> +                     "dsi_phy_regulator";
>> +
>> +         #clock-cells = <1>;
>> +         #phy-cells = <0>;
>> +
>> +         vcca-supply = <&vcca_reg>;
>> +         vddio-supply = <&vddio_reg>;
>> +
>> +         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                  <&rpmhcc RPMH_CXO_CLK>;
>> +         clock-names = "iface", "ref";
>> +     };
>> +...
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
>> new file mode 100644
>> index 0000000..78f6b16
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-28nm.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Display DSI 28nm PHY
>> +
>> +maintainers:
>> +  - Krishna Manikandan <mkrishn@codeaurora.org>
>> +
>> +allOf:
>> +  - $ref: dsi-phy-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,dsi-phy-28nm-hpm
>> +      - const: qcom,dsi-phy-28nm-lp
>> +      - const: qcom,dsi-phy-28nm-8960
>> +
>> +  reg:
>> +    items:
>> +      - description: dsi pll register set
>> +      - description: dsi phy register set
>> +      - description: dsi phy regulator register set
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dsi_pll
>> +      - const: dsi_phy
>> +      - const: dsi_phy_regulator
>> +
>> +  vddio-supply:
>> +    description: Phandle to vdd-io regulator device node.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - vddio-supply
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +     #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
>> +     #include <dt-bindings/clock/qcom,rpmh.h>
>> +
>> +     dsi-phy@fd922a00 {
>> +         compatible = "qcom,dsi-phy-28nm";
>> +         reg = <0xfd922a00 0xd4>,
>> +               <0xfd922b00 0x2b0>,
>> +               <0xfd922d80 0x7b>;
>> +         reg-names = "dsi_pll",
>> +                     "dsi_phy",
>> +                     "dsi_phy_regulator";
>> +
>> +         #clock-cells = <1>;
>> +         #phy-cells = <0>;
>> +
>> +         vddio-supply = <&vddio_reg>;
>> +
>> +         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                  <&rpmhcc RPMH_CXO_CLK>;
>> +         clock-names = "iface", "ref";
>> +     };
>> +...
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
>> new file mode 100644
>> index 0000000..c81399f
>> --- /dev/null
>> +++ 
>> b/Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-common.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Description of Qualcomm Display DSI PHY common dt properties
>> +
>> +maintainers:
>> +  - Krishna Manikandan <mkrishn@codeaurora.org>
>> +
>> +description: |
>> +  This defines the DSI PHY dt properties which are common for all
>> +  dsi phy versions.
>> +
>> +properties:
>> +  "#clock-cells":
>> +    const: 1
>> +
>> +  "#phy-cells":
>> +    const: 0
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: Display AHB clock
>> +      - description: Board XO source
>> +
>> +  clock-names:
>> +    items:
>> +      - const: iface
>> +      - const: ref
>> +
>> +required:
>> +  - clocks
>> +  - clock-names
> 
> Why isn't #phy-cells and #clock-cells always required? I would guess
> power-domains may also always be required.
> 
>> +
>> +additionalProperties: true
>> +...
