Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 480953112F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 21:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233654AbhBETQq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Feb 2021 14:16:46 -0500
Received: from so15.mailgun.net ([198.61.254.15]:31503 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233773AbhBETOc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Feb 2021 14:14:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612558594; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=eDL+b9jfY8DE4XA0q5g1K7AJkRLqUrDeFoVlzPeAM2g=;
 b=PODGeunNNhysyjVwa+pi0sLS93sN+N0CtISBxamu80YS+JsuYheIORRKkMPIjxZoofHkOITF
 6iD2hQ7MuMKjhxnOMZ46IOMwB/xtvVH9HMiYcW6aNSprfvdTiMQkJjzBO4sVJl26bx2fg0wj
 3oYm8gZHcOKsHfsgJEFz2RhV1Qc=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 601db0d53919dfb455f76a53 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Feb 2021 20:55:49
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0241BC43463; Fri,  5 Feb 2021 20:55:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E1C41C433ED;
        Fri,  5 Feb 2021 20:55:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 05 Feb 2021 12:55:47 -0800
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, bjorn.andersson@linaro.org,
        vinod.koul@linaro.org, rnayak@codeaurora.org,
        dianders@chromium.org, sibis@codeaurora.org,
        Vara Reddy <varar@codeaurora.org>
Subject: Re: [PATCH v10 4/4] dt-bindings: msm/dp: Add bindings of MSM
 DisplayPort controller
In-Reply-To: <161255172811.76967.16401619378965156134@swboyd.mtv.corp.google.com>
References: <1612420939-15502-1-git-send-email-mkrishn@codeaurora.org>
 <1612420939-15502-4-git-send-email-mkrishn@codeaurora.org>
 <161255172811.76967.16401619378965156134@swboyd.mtv.corp.google.com>
Message-ID: <b4bd2263a21f464869ac6d84aa0df131@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-05 11:02, Stephen Boyd wrote:
> Quoting Krishna Manikandan (2021-02-03 22:42:19)
>> Add bindings for Snapdragon DisplayPort controller driver.
>> 
>> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
>> Signed-off-by: Vara Reddy <varar@codeaurora.org>
>> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> 
> [...]
>> 
>> Changes in v11:
>> - add ports required of both #address-cells and  #size-cells
>> - add required operating-points-v2
>> - add required #sound-dai-cells
>> - add required power-domains
>> - update maintainer list
> 
> Where's that maintainer file update?
I had deleted Tanmay.
Anyway, I will removed Chandan at next upload.
> 
>> ---
>>  .../bindings/display/msm/dp-controller.yaml        | 157 
>> +++++++++++++++++++++
>>  .../bindings/display/msm/dpu-sc7180.yaml           |  10 ++
>>  2 files changed, 167 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml 
>> b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> new file mode 100644
>> index 0000000..2b71c7a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -0,0 +1,157 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MSM Display Port Controller
>> +
>> +maintainers:
>> +  - Chandan Uddaraju <chandanu@codeaurora.org>
> 
> This email is bouncing. Please remove Chandan.
ok
> 
>> +  - Vara Reddy <varar@codeaurora.org>
>> +  - Kuogee Hsieh <khsieh@codeaurora.org>
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
>> +
>> +  phys:
>> +    maxItems: 1
>> +
>> +  phy-names:
>> +    items:
>> +      - const: dp
>> +
>> +  operating-points-v2:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  "#sound-dai-cells":
>> +    const: 0
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
>> +        description: Input endpoint of the controller
>> +
>> +      port@1:
>> +        type: object
>> +        description: Output endpoint of the controller
>> +
>> +    required:
>> +      - "#address-cells"
>> +      - "#size-cells"
>> +
>> +    additionalProperties: false
>> +
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - phys
>> +  - phy-names
>> +  - "#sound-dai-cells"
>> +  - power-domains
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
>> +    #include <dt-bindings/power/qcom-aoss-qmp.h>
>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>> +
>> +    mdss@ae00000 {
> 
> mdss is not a standard node name. Maybe 'subsystem'?
Can you give me more details regrading this.
I had double checked both ti/ti,am65x-dss.yaml and msm/dsi-phy.yaml and 
can not find any clue for this.
Can I just followed msm/dsi-phy.yaml for this?
> 
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +      reg = <0xae00000 0x1000>,   /* mdss */
>> +            <0xae90000 0x1400>;   /* dp */
> 
> This second reg property shouldn't be here.
ok
> 
>> +      reg-names = "mdss", "dp";
>> +
>> +      displayport-controller@ae90000 {
