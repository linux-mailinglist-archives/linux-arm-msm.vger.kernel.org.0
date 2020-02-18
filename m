Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C734162DF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 19:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgBRSNH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 13:13:07 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:53648 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726444AbgBRSND (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 13:13:03 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582049583; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0c1mjaoinwfnnDHt6xgGoo8PceKhGgd93L7iJhOjAzw=; b=YfU1BjIDUk93sqTSIEtLvdgQODlrZiLupN73myKqRnRk27/YyUrE9MO50Xd5SDBzK5J/Sae4
 KRMuT5t1TbSr7lmiNFNS0vdABm/Ynezdl22dyGaY5jOnEdbLkf9DWvkhZvfVjP4SVizaJplP
 CTssGNgQq8dCLNvXOTm/LNz8ADw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4c2925.7fc52b12a1f0-smtp-out-n03;
 Tue, 18 Feb 2020 18:12:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C2D45C447AF; Tue, 18 Feb 2020 18:12:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.107] (unknown [183.83.146.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C1A07C447AA;
        Tue, 18 Feb 2020 18:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C1A07C447AA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
References: <1580357923-19783-1-git-send-email-tdas@codeaurora.org>
 <1580357923-19783-2-git-send-email-tdas@codeaurora.org>
 <20200130180637.9E02D206F0@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <6ea1e6a5-4942-5dba-4e91-28275db00153@codeaurora.org>
Date:   Tue, 18 Feb 2020 23:42:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200130180637.9E02D206F0@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Stephen.
Will address the comments in the next patch series.

On 1/30/2020 11:36 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2020-01-29 20:18:41)
>> The Modem Subsystem clock provider have a bunch of generic properties
>> that are needed in a device tree. Add a YAML schemas for those.
>>
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>> ---
>>   .../devicetree/bindings/clock/qcom,mss.yaml        | 58 ++++++++++++++++++++++
> 
> Please rename to qcom,sc7180-mss.yaml
> 
>>   1 file changed, 58 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,mss.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,mss.yaml b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
>> new file mode 100644
>> index 0000000..ebb04e1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bindings/clock/qcom,mss.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Modem Clock Controller Binding
>> +
>> +maintainers:
>> +  - Taniya Das <tdas@codeaurora.org>
>> +
>> +description: |
>> +  Qualcomm modem clock control module which supports the clocks.
> 
> Can you point to the header file from here?
> include/dt-bindings/clock/qcom,sc7180-mss.h I guess.
> 

will add the same.

>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +       - qcom,sc7180-mss
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 3
> 
> Why is it optional? Don't these all go there?
> 

Yes, moved them to required.

>> +    items:
>> +      - description: gcc_mss_mfab_axi clock from GCC
>> +      - description: gcc_mss_nav_axi clock from GCC
>> +      - description: gcc_mss_cfg_ahb clock from GCC
>> +
>> +  clock-names:
>> +    items:
>> +      - const: gcc_mss_mfab_axis_clk
>> +      - const: gcc_mss_nav_axi_clk
>> +      - const: cfg_clk
> 
> Do these really need _clk at the end? Seems redundant.
> 
Removed _clk.

>> +
>> +  '#clock-cells':
>> +    const: 1
>> +

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
