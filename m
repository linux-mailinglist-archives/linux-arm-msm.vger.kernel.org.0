Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 643A41FC18B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 00:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbgFPWav (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 18:30:51 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:48018 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725849AbgFPWav (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 18:30:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592346649; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zIiyILVfFV4UeSP8Fb9UXjt+SpqTgZRRbkXg00ivuxQ=;
 b=kmzCaZzAd4zHpGsY4Cqc2gYhMXOP7UsSAoLNEgqWE8LvOW/DQ4zMexPpuPQvl/TtqFAOFkNN
 VbaoM2A+/O0xKHRyYzMLpe9CoAoZQlE6/NlZT3XfvNoERLmMOwkzUrrTEZ0fPDFZ25opo6jO
 TWdla8lB6SViTHmZzKN/r8SdmtU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-west-2.postgun.com with SMTP id
 5ee947fa5866879c76b64a09 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Jun 2020 22:30:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EEA39C433CB; Tue, 16 Jun 2020 22:30:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C6F41C433C9;
        Tue, 16 Jun 2020 22:30:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 16 Jun 2020 15:30:16 -0700
From:   tanmay@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, sam@ravnborg.org,
        seanpaul@chromium.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, chandanu@codeaurora.org,
        robdclark@gmail.com, abhinavk@codeaurora.org,
        nganji@codeaurora.org, dri-devel@lists.freedesktop.org,
        linux-clk@vger.kernel.org, Vara Reddy <varar@codeaurora.org>
Subject: Re: [PATCH v6 1/5] dt-bindings: msm/dp: add bindings of DP/DP-PLL
 driver for Snapdragon
In-Reply-To: <159230492894.62212.17830740055624171310@swboyd.mtv.corp.google.com>
References: <20200609033818.9028-1-tanmay@codeaurora.org>
 <159175530931.242598.4696487926885071106@swboyd.mtv.corp.google.com>
 <d6db52a33ac787c0fe6134ca32c06007@codeaurora.org>
 <159230492894.62212.17830740055624171310@swboyd.mtv.corp.google.com>
Message-ID: <339dea7850113f9721a1761e31902af5@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Stephen for your answers.

On 2020-06-16 03:55, Stephen Boyd wrote:
> Quoting tanmay@codeaurora.org (2020-06-11 13:07:09)
>> On 2020-06-09 19:15, Stephen Boyd wrote:
>> > Quoting Tanmay Shah (2020-06-08 20:38:18)
>> >> diff --git
>> >> a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
>> >> b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
>> >> new file mode 100644
>> >> index 0000000..5fdb915
>> >> --- /dev/null
>> >> +++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
>> >
>> > Typically the file name matches the compatible string. But the
>> > compatible string is just qcom,dp-display. Maybe the compatible string
>> > should be qcom,sc7180-dp? Notice that the SoC number comes first as is
>> > preferred.
>> >
>> These bindings will be similar for upcoming SOC as well.
>> So just for understanding, when we add new SOC do we create new file
>> with same bidings
>> with SOC number in new file name?
>> Instead we can keep this file's name as qcom,dp-display.yaml (same as
>> compatible const) and we can include SOC number in compatible enum ?
>> some examples:
>> https://patchwork.kernel.org/patch/11448357/
>> https://patchwork.kernel.org/patch/11164619/
> 
> Yes that works too. It's really up to robh here.
> 
>> >
>> >> @@ -0,0 +1,142 @@
>> >> +# SPDX-License-Identifier: (GPL-2.0-only  OR BSD-2-Clause)
>> >> +%YAML 1.2
>> >> +---
>> >> +$id: http://devicetree.org/schemas/display/msm/dp-sc7180.yaml#
>> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> >> +
>> >> +title: Qualcomm Display Port Controller.
>> >> +
>> >> +maintainers:
>> >> +  - Chandan Uddaraju <chandanu@codeaurora.org>
>> >> +  - Vara Reddy <varar@codeaurora.org>
>> >> +  - Tanmay Shah <tanmay@codeaurora.org>
>> >> +
>> >> +description: |
>> >> +  Device tree bindings for MSM Display Port which supports DP host
>> >> controllers
>> >> +  that are compatible with VESA Display Port interface specification.
>> >> +
>> >> +properties:
>> >> +  compatible:
>> >> +    items:
>> >> +      - const: qcom,dp-display
>> >> +
>> >> +  cell-index:
>> >> +    description: Specifies the controller instance.
>> >> +
>> >> +  reg:
>> >> +    items:
>> >> +      - description: DP controller registers
>> >> +
>> >> +  interrupts:
>> >> +    description: The interrupt signal from the DP block.
>> >> +
>> >> +  clocks:
>> >> +    description: List of clock specifiers for clocks needed by the
>> >> device.
>> >> +    items:
>> >> +      - description: Display Port AUX clock
>> >> +      - description: Display Port Link clock
>> >> +      - description: Link interface clock between DP and PHY
>> >> +      - description: Display Port Pixel clock
>> >> +      - description: Root clock generator for pixel clock
>> >> +
>> >> +  clock-names:
>> >> +    description: |
>> >> +      Device clock names in the same order as mentioned in clocks
>> >> property.
>> >> +      The required clocks are mentioned below.
>> >> +    items:
>> >> +      - const: core_aux
>> >> +      - const: ctrl_link
>> >> +      - const: ctrl_link_iface
>> >> +      - const: stream_pixel
>> >> +      - const: pixel_rcg
>> >
>> > Why not just 'pixel'? And why is the root clk generator important? It
>> > looks like this binding should be using the assigned clock parents
>> > property instead so that it doesn't have to call clk_set_parent()
>> > explicitly.
>> >
>> Are we talking about renaming stream_pixel to pixel only?
>> We divide clocks in categories: core, control and stream clock.
>> Similar terminology will be used in subsequent driver patches as well.
>> 
>> We can remove pixel_rcg use assigned clock parents property and remove
>> clk_set_parent
>> from driver.
> 
> Cool. Using assigned clock parents is good.
> 
>> 
>> >> +  "#clock-cells":
>> >> +    const: 1
>> >> +
>> >> +  vdda-1p2-supply:
>> >> +    description: phandle to vdda 1.2V regulator node.
>> >> +
>> >> +  vdda-0p9-supply:
>> >> +    description: phandle to vdda 0.9V regulator node.
>> >> +
>> >> +  data-lanes = <0 1>:
>> >
>> > Is this correct? We can have = <value> in the property name? Also feels
>> > generic and possibly should come from the phy binding instead of from
>> > the controller binding.
>> >
>> We are using this property in DP controller programming sequence such 
>> as
>> link training.
>> So I think we can keep this here.
>> You are right about <value>. <0 1> part should be in example only. It
>> was passing through dt_binding_check though.
>> Here it should be like:
>> data-lanes:
>> minItems:1
>> maxItems:4
> 
> Ok.
> 
>> 
>> >> +    type: object
>> >> +    description: Maximum number of lanes that can be used for Display
>> >> port.
>> >> +
>> >> +  ports:
>> >> +    description: |
>> >> +       Contains display port controller endpoint subnode.
>> >> +       remote-endpoint: |
>> >> +         For port@0, set to phandle of the connected panel/bridge's
>> >> +         input endpoint. For port@1, set to the DPU interface output.
>> >> +         Documentation/devicetree/bindings/graph.txt and
>> >> +
>> >> Documentation/devicetree/bindings/media/video-interfaces.txt.
>> >> +
>> >> +patternProperties:
>> >> +  "^aux-cfg([0-9])-settings$":
>> >> +    type: object
>> >> +    description: |
>> >> +      Specifies the DP AUX configuration [0-9] settings.
>> >> +      The first entry in this array corresponds to the register
>> >> offset
>> >> +      within DP AUX, while the remaining entries indicate the
>> >> +      programmable values.
>> >
>> > I'd prefer this was removed from the binding and hardcoded in the
>> > driver
>> > until we can understand what the values are. If they're not
>> > understandable then they most likely don't change and should be done in
>> > the driver.
>> >
>> Typically customers tune these values by working with vendor. So for
>> different boards it can be different. Even though it is hard for
>> customers to do this themselves, these are still board specific and
>> belong to dts. As requested earlier, we have added default values
>> already and made these properties optional but, we would like to keep 
>> it
>> in bindings so we can have option to tune them as required.
> 
> If they're in the binding then they should make sense instead of just
> being random values. So please move the defaults to the driver and
> have human understandable DT properties to tune these settings. This 
> has
> been done for the qcom USB phy already (see things like
> qcom,hstx-trim-value for example).
> 
Ok. For now I will move these values to driver and later we will add dt 
properties as required.

>> >> +
>> >> +required:
>> >> +  - compatible
>> >> +  - cell-index
>> >> +  - reg
>> >> +  - interrupts
>> >> +  - clocks
>> >> +  - clock-names
>> >> +  - vdda-1p2-supply
>> >> +  - vdda-0p9-supply
>> >> +  - data-lanes
>> >> +  - ports
>> >> +
>> >> +examples:
>> >> +  - |
>> >> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> >> +    #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
>> >> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>> >> +    msm_dp: displayport-controller@ae90000{
>> >> +        compatible = "qcom,dp-display";
>> >> +        cell-index = <0>;
>> >> +        reg = <0 0xae90000 0 0x1400>;
>> >> +        reg-names = "dp_controller";
>> >> +
>> >> +        interrupt-parent = <&display_subsystem>;
>> >> +        interrupts = <12 0>;
>> >> +
>> >> +        clocks = <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>> >> +                 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>> >> +                 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> >> +                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
>> >> +                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
>> >> +        clock-names = "core_aux",
>> >> +                      "ctrl_link",
>> >> +                      "ctrl_link_iface", "stream_pixel",
>> >> +                      "pixel_rcg";
>> >> +        #clock-cells = <1>;
>> >> +
>> >> +        vdda-1p2-supply = <&vreg_l3c_1p2>;
>> >> +        vdda-0p9-supply = <&vreg_l4a_0p8>;
>> >> +
>> >> +        data-lanes = <0 1>;
>> >> +
>> >> +        ports {
>> >> +            #address-cells = <1>;
>> >> +            #size-cells = <0>;
>> >> +
>> >> +            port@0 {
>> >> +                reg = <0>;
>> >> +                dp_in: endpoint {
>> >> +                    remote-endpoint = <&dpu_intf0_out>;
>> >> +                };
>> >> +            };
>> >> +
>> >> +            port@1 {
>> >> +                reg = <1>;
>> >> +                dp_out: endpoint {
>> >> +                };
>> >> +            };
>> >> +        };
>> >> +    };
>> >
>> > I believe there should be a '...' here.
>> I think you mean signature is missing? If not could you please 
>> explain?
> 
> No I mean there should be a triple dot at the end.
