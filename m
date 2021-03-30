Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3714634E437
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 11:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbhC3JXV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 05:23:21 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:29831 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231600AbhC3JXN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 05:23:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617096193; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/0NkHSEK91jnwUXqBPOOJloIbSiil4C09BHiJ/kvl/w=;
 b=Hopap4sNSDvMHiPMn6ryqTW9/x6PPQKO4frtX98Ar/x24QLwwQpC/L3Koe/7gKRPX/xqMeUQ
 gc2CTtK/nTlqKV2IF26i9357p9SzIZabj67ih532izMHf5vvV2q/O6FfjRiK3+KdRYcw3Rgw
 fEwkseXOYKI/8HSSgTIE59tmjfw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6062edd70a4a07ffda522a33 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 09:22:31
 GMT
Sender: mkrishn=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2D9ACC43461; Tue, 30 Mar 2021 09:22:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mkrishn)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1C065C433CA;
        Tue, 30 Mar 2021 09:22:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 30 Mar 2021 14:52:29 +0530
From:   mkrishn@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, bjorn.andersson@linaro.org,
        vinod.koul@linaro.org, rnayak@codeaurora.org,
        dianders@chromium.org, sibis@codeaurora.org, khsieh@codeaurora.org
Subject: Re: [PATCH v14 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 PHY bindings
In-Reply-To: <161698798504.3012082.2821776620747041419@swboyd.mtv.corp.google.com>
References: <1616673661-20038-1-git-send-email-mkrishn@codeaurora.org>
 <1616673661-20038-3-git-send-email-mkrishn@codeaurora.org>
 <161671311714.3012082.4777798674596112311@swboyd.mtv.corp.google.com>
 <81ea21602c74d2b18e4b013dda3a3213@codeaurora.org>
 <161698798504.3012082.2821776620747041419@swboyd.mtv.corp.google.com>
Message-ID: <b41d57010d51356bdc4af1cd9d9c01ec@codeaurora.org>
X-Sender: mkrishn@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-29 08:49, Stephen Boyd wrote:
> Quoting mkrishn@codeaurora.org (2021-03-26 03:36:30)
>> On 2021-03-26 04:28, Stephen Boyd wrote:
>> > Quoting Krishna Manikandan (2021-03-25 05:01:00)
>> >> diff --git
>> >> a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>> >> b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>> >> new file mode 100644
>> >> index 0000000..4a26bef
>> >> --- /dev/null
>> >> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>> >> @@ -0,0 +1,68 @@
>> >> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>> >> +%YAML 1.2
>> >> +---
>> >> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-10nm.yaml#
>> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> >> +
>> >> +title: Qualcomm Display DSI 10nm PHY
>> >> +
>> >> +maintainers:
>> >> +  - Krishna Manikandan <mkrishn@codeaurora.org>
>> >> +
>> >> +allOf:
>> >> +  - $ref: dsi-phy-common.yaml#
>> >> +
>> >> +properties:
>> >> +  compatible:
>> >> +    oneOf:
> [..]
>> >> and
>> >> +      connected to VDDA_MIPI_DSI_0_PLL_0P9 pin for sdm845 target
>> >> +
>> >> +required:
>> >> +  - compatible
>> >> +  - reg
>> >> +  - reg-names
>> >> +  - vdds-supply
>> >> +
>> >> +unevaluatedProperties: false
>> >
>> > additionalProperties: false instead? This comment applies to the other
>> > bindings in this patch.
>> 
>> Hi Stephen,
>> We are referencing dsi-phy-common.yaml in this file. Since the
>> properties of dsi-phy-common.yaml are applicable to this file also, I
>> added unevaluatedProperties: false. If we add additionalProperties:
>> false instead, then the properties of dsi-phy-common.yaml will not be
>> applicable here and this will throw an error if we add the properties
>> from dsi-phy-common.yaml in the example.
>> 
> 
> Does that matter? I was wondering about that and so I peeked at the
> qcom pinctrl binding and it seems to follow a similar design but 
> doesn't
> have unevaluatedProperties: false. Instead it has additionalProperies:
> false. See qcom,sc8180x-pinctrl.yaml for an example. So did you try it
> or does something say you can't do this?

Hi Stephen,
I had tried the same thing in one of my initial patches and I got a 
comment from Rob that we have to use unevaluatedProperties when we are 
referring another 
file(https://patchwork.kernel.org/project/linux-arm-msm/patch/1589868421-30062-1-git-send-email-mkrishn@codeaurora.org/)
In latest dt-schema tool, we will get error if we try to change it to 
additionalProperties: false.
For example, in this patch "#clock-cells' and '#phy-cells' are mentioned 
in dsi-phy-common.yaml and I am referring this file in 
dsi-phy-10nm.yaml. If I add
additionalProperties: false instead of unevaluatedProperties: false, I 
will get the error mentioned below.

I checked qcom,sc8180x-pinctrl.yaml that you had mentioned in the 
comment and this file is compiling without any issues even though it is 
using additionalProperties: false. But I see that the properties 
mentioned in the reference file (in this case, qcom,tlmm-common.yaml) 
are again declared in the main file qcom,sc8180x-pinctrl.yaml even 
though these are mentioned as required properties in the common yaml 
file. If I remove these properties from qcom,sc8180x-pinctrl.yaml, I can 
see the same error that I am getting for my file also if 
additionalProperties are used. If I follow the same approach , ie define 
the properties again in dsi-phy-10nm.yaml and add additionalProperties: 
false, I dont see any errors during check (working change mentioned 
below). Should I make this change for all the files?

Error logs:
mkrishn@mkrishn-linux:/local/mnt/workspace/linux-next-latest/linux-next$ 
  make dt_binding_check 
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
   CHKDT   
Documentation/devicetree/bindings/processed-schema-examples.json
   SCHEMA  
Documentation/devicetree/bindings/processed-schema-examples.json
   DTEX    
Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.example.dts
   DTC     
Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.example.dt.yaml
   CHECK   
Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.example.dt.yaml
/local/mnt/workspace/linux-next-latest/linux-next/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.example.dt.yaml: 
dsi-phy@ae94400: '#clock-cells', '#phy-cells', 'clock-names', 'clocks' 
do not match any of the regexes: 'pinctrl-[0-9]+'
         From schema: 
/local/mnt/workspace/linux-next-latest/linux-next/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml

Working Change:
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
@@ -30,6 +30,11 @@ properties:
        - const: dsi_phy_lane
        - const: dsi_pll

+  '#clock-cells': true
+  '#phy-cells': true
+  clocks: true
+  clock-names: true
+
    vdds-supply:
      description: |
        Connected to DSI0_MIPI_DSI_PLL_VDDA0P9 pin for sc7180 target and
@@ -41,7 +46,7 @@ required:
    - reg-names
    - vdds-supply

-unevaluatedProperties: false
+additionalProperties: false

Thanks,
Krishna
