Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 689309B0A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 15:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388328AbfHWNS7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 09:18:59 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52896 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730419AbfHWNS6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 09:18:58 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E46246085C; Fri, 23 Aug 2019 13:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566566337;
        bh=nhaZfNNo2jB08y4SKSdMywztvd+UxVbloE+IbtiL6BY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SJfCsL6olWU/JEXqxObHtsBGvSp/4nFyzKwKwOi7OgccAjwKpbL9gQ7hZj8ay9Nl/
         y7Pr2CvjeHtobWGB+02JtydcYRuA5HRvmIeTaiHVqsGfuiJghSrG6X4acuRu6ti90m
         WrwU+C3S9HFB7JmJrfM02M+kykZPJtu6qQ5YXw+M=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 310CF6016D;
        Fri, 23 Aug 2019 13:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566566337;
        bh=nhaZfNNo2jB08y4SKSdMywztvd+UxVbloE+IbtiL6BY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SJfCsL6olWU/JEXqxObHtsBGvSp/4nFyzKwKwOi7OgccAjwKpbL9gQ7hZj8ay9Nl/
         y7Pr2CvjeHtobWGB+02JtydcYRuA5HRvmIeTaiHVqsGfuiJghSrG6X4acuRu6ti90m
         WrwU+C3S9HFB7JmJrfM02M+kykZPJtu6qQ5YXw+M=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 23 Aug 2019 18:48:57 +0530
From:   Govind Singh <govinds@codeaurora.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>
Subject: Re: [v2 1/2] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock
 controller bindings
In-Reply-To: <CAL_JsqK-GK8arfRu6sqP9UjNrwc0=aUWXymMRF5fQhg+M2TNng@mail.gmail.com>
References: <20190813130946.16448-1-govinds@codeaurora.org>
 <20190813130946.16448-2-govinds@codeaurora.org>
 <CAL_JsqK-GK8arfRu6sqP9UjNrwc0=aUWXymMRF5fQhg+M2TNng@mail.gmail.com>
Message-ID: <2454a240a165862c551b52b224ceedab@codeaurora.org>
X-Sender: govinds@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On 2019-08-13 19:13, Rob Herring wrote:
> On Tue, Aug 13, 2019 at 7:10 AM Govind Singh <govinds@codeaurora.org> 
> wrote:
>> 
>> Add devicetree binding for the Q6SSTOP clock controller found in 
>> QCS404.
> 
> You need to test this with 'make dt_binding_check' and fix the errors.
> 

Fixed in v3.

>> 
>> Signed-off-by: Govind Singh <govinds@codeaurora.org>
>> ---
>>  .../bindings/clock/qcom,q6sstopcc.yaml        | 45 
>> +++++++++++++++++++
>>  1 file changed, 45 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml 
>> b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
>> new file mode 100644
>> index 000000000000..861e9ba97ca3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
>> @@ -0,0 +1,45 @@
>> +# SPDX-License-Identifier: BSD-2-Clause
> 
> GPL-2.0-only OR BSD-2-Clause
> 

I have kept BSD-2-Clause as its new binding.

>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/interconnect/qcom,osm-l3.yaml#
> 
> needs updating
> 

Fixed in V3.

>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Q6SSTOP clock Controller
>> +
>> +maintainers:
>> +  - Govind Singh <govinds@codeaurora.org>
>> +
>> +description:
>> +   Q6SSTOP clock controller is used by WCSS remoteproc driver
>> +   to bring WDSP out of reset.
>> +
>> +properties:
>> +  compatible:
>> +    const: "qcom,qcs404-q6sstopcc"
>> +
>> +  reg:
>> +    maxItems: 2
>> +    description: Q6SSTOP clocks register region
>> +    description: Q6SSTOP_TCSR register region
> 
> Not valid json-schema
> 

Fixed in V3.

>> +
>> +  clocks:
>> +    items:
>> +      - description: ahb clock for the q6sstopCC
> 
> Single item just needs 'maxItems: 1'
> 
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - '#clock-cells'
> 
> Should have an 'additionalProperties: false' here.
> 

Fixed in v3.

>> +
>> +examples:
>> +  - |
>> +    q6sstopcc: clock-controller@7500000 {
>> +      compatible = "qcom,qcs404-q6sstopcc";
>> +      reg = <0x07500000 0x4e000>, <0x07550000 0x10000>;
>> +      clocks = <&gcc GCC_WCSS_Q6_AHB_CLK>;
>> +      #clock-cells = <1>;
>> +    };
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

BR,
Govind
