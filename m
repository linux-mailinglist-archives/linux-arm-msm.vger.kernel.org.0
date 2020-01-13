Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1813138B27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 06:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726105AbgAMFrL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 00:47:11 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:17259 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726055AbgAMFrK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 00:47:10 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578894429; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=XoJh0IwkIfbUz6r+FYTpWq3eCJJHoLDTCx+9uGqjfVQ=;
 b=KJbgHUT1z+toec04P6b0HUOSGDoPuuoWEgNyNRRSJFfBitEiESFpUpgEiMutagEvAwULadCF
 /aw5UjUBNeXPSfrcUcg3xnOhi3+gWV/+ke75rBJ/tTz9yoRw6Df9o9faFvyzvB/E+bNu/yYY
 +BluCqf+dT0yCoDraDhWjzM1Wbc=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1c045b.7f84b7316308-smtp-out-n02;
 Mon, 13 Jan 2020 05:47:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 74260C4479C; Mon, 13 Jan 2020 05:47:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D2397C43383;
        Mon, 13 Jan 2020 05:47:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 13 Jan 2020 11:17:05 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: watchdog: Add compatible for QCS404,
 SC7180, SDM845, SM8150
In-Reply-To: <20191219232842.GB22811@bogus>
References: <cover.1576211720.git.saiprakash.ranjan@codeaurora.org>
 <3f871ae3818b46423430074689e33bc34b28aa1c.1576211720.git.saiprakash.ranjan@codeaurora.org>
 <20191219232842.GB22811@bogus>
Message-ID: <e06b96fdaa79c7c02b76c788c04fcf7d@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On 2019-12-20 04:58, Rob Herring wrote:
> On Fri, Dec 13, 2019 at 10:23:19AM +0530, Sai Prakash Ranjan wrote:
>> Add missing compatible for watchdog timer on QCS404,
>> SC7180, SDM845 and SM8150 SoCs.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  .../devicetree/bindings/watchdog/qcom-wdt.yaml       | 12 
>> ++++++++++++
>>  1 file changed, 12 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml 
>> b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>> index 4a42f4261322..ec25ce1c9e2e 100644
>> --- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>> +++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
>> @@ -12,6 +12,18 @@ maintainers:
>>  properties:
>>    compatible:
>>      oneOf:
>> +      - items:
>> +          - const: qcom,apss-wdt-sc7180
>> +          - const: qcom,kpss-wdt
>> +      - items:
>> +          - const: qcom,apss-wdt-sdm845
>> +          - const: qcom,kpss-wdt
>> +      - items:
>> +          - const: qcom,apss-wdt-sm8150
>> +          - const: qcom,kpss-wdt
>> +      - items:
>> +          - const: qcom,apss-wdt-qcs404
>> +          - const: qcom,kpss-wdt
> 
> This can be one entry:
> 
> - items:
>     - enum:
>         - ...
>     - const: qcom,kpss-wdt
> 

Will change in next version.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
