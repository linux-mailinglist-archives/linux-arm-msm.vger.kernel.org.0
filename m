Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 344F11555A2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 11:27:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgBGK14 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 05:27:56 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:42157 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726587AbgBGK14 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 05:27:56 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581071275; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=SXtKwR+Qh4XdJBE5iN9hKj4xfIJl9gq5XMMKEVbj36E=; b=RrUF7JI3v4GIQ3eEv0lfsui/zvxpboylk5Ru0ehvNPSWL0kDMzf7nVFw+RH3fS2gWM0GJhDt
 RsXBS4sfPhS3LsUKFbRzU1lQolBsZvDIHAMbXEtA6vVmESqmRWoqzR2mSenQefGGKM2C5iH4
 U5JEH642Z7qLkToEwIonGdBW8es=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3d3ba9.7f531d0fc298-smtp-out-n03;
 Fri, 07 Feb 2020 10:27:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 224F0C4479C; Fri,  7 Feb 2020 10:27:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4EDA4C433CB;
        Fri,  7 Feb 2020 10:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4EDA4C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        linux-kernel-owner@vger.kernel.org
References: <1580357923-19783-1-git-send-email-tdas@codeaurora.org>
 <1580357923-19783-2-git-send-email-tdas@codeaurora.org>
 <8d29b13e5444676df46b2479a1f48e36@codeaurora.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <ca500b7e-2a58-8e72-255c-8a5c68cfaed4@codeaurora.org>
Date:   Fri, 7 Feb 2020 15:57:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <8d29b13e5444676df46b2479a1f48e36@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/7/2020 12:57 PM, Sibi Sankar wrote:
> Hey Taniya,
> 
> On 2020-01-30 09:48, Taniya Das wrote:
>> The Modem Subsystem clock provider have a bunch of generic properties
>> that are needed in a device tree. Add a YAML schemas for those.
>>
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>> ---
>>  .../devicetree/bindings/clock/qcom,mss.yaml        | 58 
>> ++++++++++++++++++++++
>>  1 file changed, 58 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,mss.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,mss.yaml
>> b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
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
>> +  - Taniya Das <tdas@codeaurora.org>
>> +
>> +description: |
>> +  Qualcomm modem clock control module which supports the clocks.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +       - qcom,sc7180-mss
>> +
>> +  clocks:
>> +    minItems: 1
>> +    maxItems: 3
>> +    items:
>> +      - description: gcc_mss_mfab_axi clock from GCC
>> +      - description: gcc_mss_nav_axi clock from GCC
> 
> we don't seem to be referencing the
> mss_mfab_axi and mss_nav_axi in the
> mss clk driver though, do we really
> need them in bindings? If we dont
> can we drop the clock-names as well.
> 

They are linked as parent for the clocks. So we need them.
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "gcc_mss_nav_axi_clk",
+			},

>> +      - description: gcc_mss_cfg_ahb clock from GCC
>> +
>> +  clock-names:
>> +    items:
>> +      - const: gcc_mss_mfab_axis_clk
>> +      - const: gcc_mss_nav_axi_clk
>> +      - const: cfg_clk
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - '#clock-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  # Example of MSS with clock nodes properties for SC7180:
>> +  - |
>> +    clock-controller@41a8000 {
>> +      compatible = "qcom,sc7180-mss";
>> +      reg = <0x041a8000 0x8000>;
>> +      clocks = <&gcc 126>, <&gcc 127>, <&gcc 125>;
>> +      clock-names = "gcc_mss_mfab_axis_clk", "gcc_mss_nav_axi_clk", 
>> "cfg_clk";
>> +      #clock-cells = <1>;
>> +    };
>> +...
>> -- 
>> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
>> of the Code Aurora Forum, hosted by the  Linux Foundation.
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
