Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61F96138B2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 06:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbgAMFtY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 00:49:24 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:36833 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726236AbgAMFtY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 00:49:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578894563; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Y6MzJykOUHgXTHH7mFFwvvjU0SWSAQVmVXjDkrqruY8=;
 b=modq+Zx/VMtbp2dJUw6myVkwXz2T8o8PmWRejx+CWZ+C7DIAYb2LPe+EhOLZZ/hHOWcpnu2+
 8aQWsQ0bJNuDhTjYNA2E1vucnz3ba9ta+e3cHX2+Zz8OTIVqe8UAnXTY2LGAviFc6VB9fYw1
 rokQiq2E8+o5x0vwfu9bjUDUY+o=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1c04dd.7f0c87be2110-smtp-out-n01;
 Mon, 13 Jan 2020 05:49:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5535CC447A1; Mon, 13 Jan 2020 05:49:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 99864C43383;
        Mon, 13 Jan 2020 05:49:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 13 Jan 2020 11:19:16 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: Convert QCOM watchdog timer
 bindings to YAML
In-Reply-To: <20191219232615.GA22811@bogus>
References: <cover.1576211720.git.saiprakash.ranjan@codeaurora.org>
 <0b095b65496073a2ddf9de120f7809619b42cd1c.1576211720.git.saiprakash.ranjan@codeaurora.org>
 <20191219232615.GA22811@bogus>
Message-ID: <1602b7831356274792ce5a84fb44d701@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-20 04:56, Rob Herring wrote:
> On Fri, Dec 13, 2019 at 10:23:18AM +0530, Sai Prakash Ranjan wrote:
>> Convert QCOM watchdog timer bindings to DT schema format using
>> json-schema.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  .../devicetree/bindings/watchdog/qcom-wdt.txt | 28 -----------
>>  .../bindings/watchdog/qcom-wdt.yaml           | 47 
>> +++++++++++++++++++
>>  2 files changed, 47 insertions(+), 28 deletions(-)
>>  delete mode 100644 
>> Documentation/devicetree/bindings/watchdog/qcom-wdt.txt
>>  create mode 100644 
>> Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
> 
> 
>> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml 
>> b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>> new file mode 100644
>> index 000000000000..4a42f4261322
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>> @@ -0,0 +1,47 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Qualcomm Krait Processor Sub-system (KPSS) Watchdog timer
>> +
>> +maintainers:
>> +  - Andy Gross <agross@kernel.org>
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,kpss-timer
>> +      - const: qcom,kpss-wdt
>> +      - const: qcom,kpss-wdt-apq8064
>> +      - const: qcom,kpss-wdt-ipq4019
>> +      - const: qcom,kpss-wdt-ipq8064
>> +      - const: qcom,kpss-wdt-msm8960
>> +      - const: qcom,scss-timer
> 
> An 'enum' is better than oneOf+const.
> 

Will change.

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  timeout-sec:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Contains the watchdog timeout in seconds. If unset, the
>> +      default timeout is 30 seconds.
> 
> Include watchdog.yaml and don't redefine this.
> 

Ok

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +
>> +examples:
>> +  - |
>> +    watchdog@208a038 {
>> +      compatible = "qcom,kpss-wdt-ipq8064";
>> +      reg = <0x0208a038 0x40>;
>> +      clocks = <&sleep_clk>;
>> +      timeout-sec = <10>;
>> +    };
>> ---
>> 
>> I have added Andy as the maintainer here since the get_maintainer 
>> script
>> showed him. If he is not happy, then I can change it to Bjorn probably 
>> and
>> again if he is not happy ;-) then I will add myself or whoever they 
>> suggest.
> 
> Add yourself.
> 

Sure will add myself.


Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
