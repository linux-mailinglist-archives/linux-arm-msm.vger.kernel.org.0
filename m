Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF1DD14FB87
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Feb 2020 06:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgBBFHe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Feb 2020 00:07:34 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:12731 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725962AbgBBFHe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Feb 2020 00:07:34 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580620054; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=a3q2yNezV9J75HysFSuPYt/Ll9TEKYNx0uEo7VSRjw8=;
 b=tPTiNf+WM9PIMRzeHFys/HG0ZnVE39mpBJi6Y/p3rNha18M7tQlOF0IYwGVUYeJ7wTyq4GO+
 60n7H/dsmeLoN1/OFXHd6iJefwRICponE6nx9dCpXcuzJmckh8jRDrimvQh/DEucf/aNmCx6
 9ZHZtd+RB0cNu7AvKYCGENu/Rjo=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e365914.7f0ac4cc0538-smtp-out-n01;
 Sun, 02 Feb 2020 05:07:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 35617C4479C; Sun,  2 Feb 2020 05:07:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 90505C433CB;
        Sun,  2 Feb 2020 05:07:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sun, 02 Feb 2020 10:37:30 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCHv2 1/2] dt-bindings: watchdog: Convert QCOM watchdog timer
 bindings to YAML
In-Reply-To: <5e36535e.1c69fb81.510f6.ba36@mx.google.com>
References: <cover.1580570160.git.saiprakash.ranjan@codeaurora.org>
 <2edca4b54ee6b33493e0427c17de983d3ce3012f.1580570160.git.saiprakash.ranjan@codeaurora.org>
 <5e36535e.1c69fb81.510f6.ba36@mx.google.com>
Message-ID: <a50468262ed81ca927214db39a0306a3@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-02 10:13, Stephen Boyd wrote:
> Quoting Sai Prakash Ranjan (2020-02-01 07:29:48)
>> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml 
>> b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>> new file mode 100644
>> index 000000000000..5448cc537a03
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>> @@ -0,0 +1,44 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Krait Processor Sub-system (KPSS) Watchdog timer
>> +
>> +maintainers:
>> +  - Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> +
>> +allOf:
>> +  - $ref: watchdog.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,kpss-timer
>> +      - qcom,kpss-wdt
>> +      - qcom,kpss-wdt-apq8064
>> +      - qcom,kpss-wdt-ipq4019
>> +      - qcom,kpss-wdt-ipq8064
>> +      - qcom,kpss-wdt-msm8960
>> +      - qcom,scss-timer
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
> 
> By the way, I would expect the watchdog to have an interrupt property.
> Not sure why it isn't described in the existing binding.
> 

Yes it should be an optional property now that bark interrupt support 
has been added. I will add that in a separate patch.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
