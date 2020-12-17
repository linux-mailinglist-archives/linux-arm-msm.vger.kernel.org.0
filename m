Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD31F2DDB9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Dec 2020 23:54:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727136AbgLQWxo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Dec 2020 17:53:44 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:61625 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726796AbgLQWxo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Dec 2020 17:53:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1608245603; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+9Nkpby7DUBrddk8dRHTUTGggp32+n+brr9REUYeZp0=;
 b=ErBuJP64XGovfJ0XeRfEIIem+9VpVXQGkldmVsOsFhJ6bAdqZUh1AFeIlBITsRr4KiOj8KNn
 IzjAlLZCi8p6kdAgA+jAO6meQXGvBKypjViB8UjM52uyYZwusJJHVkGqBIzGuATD1+GjJLCN
 P5Nr5b3mrJW6CzTMibFIY3uxOoY=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fdbe148944e4d244713e0bb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Dec 2020 22:52:56
 GMT
Sender: tanmay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 01FB9C433ED; Thu, 17 Dec 2020 22:52:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EB3E9C433C6;
        Thu, 17 Dec 2020 22:52:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 17 Dec 2020 14:52:54 -0800
From:   Tanmay Shah <tanmay@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, kalyan_t@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com,
        bjorn.andersson@linaro.org, vinod.koul@linaro.org,
        rnayak@codeaurora.org, dianders@chromium.org, sibis@codeaurora.org,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>
Subject: Re: [PATCH v9 2/2] dt-bindings: msm/dp: Add bindings of MSM
 DisplayPort controller
In-Reply-To: <160772619842.1580929.2107809673048637455@swboyd.mtv.corp.google.com>
References: <1607670585-26438-1-git-send-email-mkrishn@codeaurora.org>
 <1607670585-26438-2-git-send-email-mkrishn@codeaurora.org>
 <160772619842.1580929.2107809673048637455@swboyd.mtv.corp.google.com>
Message-ID: <13b88450f124129fd1fec586b6e8f33e@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-12-11 14:36, Stephen Boyd wrote:
> Quoting Krishna Manikandan (2020-12-10 23:09:45)
>> Changes in v10:
>> - Change title of this patch as it does not contain PLL bindings 
>> anymore
>> - Remove redundant properties
>> - Remove use of IRQ flag
>> - Fix ports property
>> 
>> Previous Change log:
>> https://lkml.kernel.org/lkml/1597066683-6044-2-git-send-email-mkrishn@codeaurora.org/
> 
> Why can't that be put in here instead of making me click the link?
> 

Thanks Stephen for reviews.

I just wanted to use space efficiently. But if it helps in reviews,
I will bring all the previous change logs back.

>> diff --git
>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> new file mode 100644
>> index 0000000..bc80632
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -0,0 +1,120 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only  OR BSD-2-Clause)
> 
> Why two spaces between 'only and 'OR'?
> 
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MSM Display Port Controller.
> 
> Drop the full-stop?
> 
>> +
>> +maintainers:
>> +  - Chandan Uddaraju <chandanu@codeaurora.org>
>> +  - Vara Reddy <varar@codeaurora.org>
>> +  - Tanmay Shah <tanmay@codeaurora.org>
>> +
>> +description: |
>> +  Device tree bindings for DisplayPort host controller for MSM 
>> targets
>> +  that are compatible with VESA DisplayPort interface specification.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,sc7180-dp
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: AHB clock to enable register access
>> +      - description: Display Port AUX clock
>> +      - description: Display Port Link clock
>> +      - description: Link interface clock between DP and PHY
>> +      - description: Display Port Pixel clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: core_iface
>> +      - const: core_aux
>> +      - const: ctrl_link
>> +      - const: ctrl_link_iface
>> +      - const: stream_pixel
> 
> There should be a dp-phy too, so 'phy' and 'phy-names' property. I see 
> a
> 'power-domains' property downstream, so please add that too. And also
> '#sound-dai-cells".
> 
>> +
>> +  ports:
>> +    type: object
>> +    description: |
>> +      A ports node with endpoint definitions as defined in
>> +      Documentation/devicetree/bindings/media/video-interfaces.txt.
>> +    properties:
>> +      "#address-cells":
>> +        const: 1
>> +
>> +      "#size-cells":
>> +        const: 0
>> +
>> +      port@0:
>> +        type: object
>> +        description: Input endpoint of the controller.
>> +
>> +      port@1:
>> +        type: object
>> +        description: Output endpoint of the controller.
> 
> This should have a required section too, and state that all the above
> properties are required.
> 
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
>> +
>> +    mdss: mdss {
> 
> Can drop the label. Also this node name is bad! Should be
> 'subsystem@<reg>' I guess? And then the reg can just be the first
> address in a reg property that is remapped for the children nodes.
> 

I didn't get this part:
"And then the reg can just be the first address in a reg property that 
is remapped for children nodes."

Does this mean, I should add reg property for mdss node as well? Node 
mdss address is 0x0ae00000. So something like:

reg = <0 0x0ae00000 0 0x1000>;



>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +      interrupt-controller;
>> +
>> +      msm_dp: displayport-controller@ae90000 {
> 
> Can drop the label.
> 
>> +        compatible = "qcom,sc7180-dp";
>> +        reg = <0 0xae90000 0 0x1400>;
>> +        interrupt-parent = <&mdss>;
>> +        interrupts = <12>;
>> +        clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
>> +                 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
>> +                 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
>> +                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
>> +        clock-names = "core_iface", "core_aux",
>> +                      "ctrl_link",
>> +                      "ctrl_link_iface", "stream_pixel";
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +                dp_in: endpoint {
> 
> Can drop the label.
> 
>> +                    remote-endpoint = <&dpu_intf0_out>;
>> +                };
>> +            };
>> +
>> +            port@1 {
>> +                reg = <1>;
>> +                dp_out: endpoint {
> 
> Can drop the label and show some remote-endpoint connection?
> 

I am not sure what should I include here as connection. IIRC, Robh 
suggested It should connect to the Type-C connector through some sort of 
mixing node. However, I see only typec connector node at: 
Documentation/devicetree/bindings/chrome/google,cros-ec-typec.yaml. 
Should we use that directly or should we use ec node?

Can we do something like:

remote-endpoint = <&typec> or <&ec>

Rest of the comments looks good and I will address them in next patch.

Thanks.

>> +                };
>> +            };
>> +        };
>> +      };
>> +    };
>> +...
