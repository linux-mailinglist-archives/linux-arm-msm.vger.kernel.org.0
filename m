Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9141AC341E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 14:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732728AbfJAMUw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 08:20:52 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:60658 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbfJAMUw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 08:20:52 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4A1F46034D; Tue,  1 Oct 2019 12:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569932451;
        bh=lp5RfcJ7QOMHh//lUV03XTYmhcqbXMbwWSVbR7ckkS8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RbZZF6RkorD85xRj5KASghXa7/ojak9WzQuxbkaE7OyPTDMg64YCoDi+Zk6jfs7T0
         V9p0hzMHVfI7ukNn03QZUGIFxCI6p+hzjE4adCB3eHUh0aA2CNAF1cdS2HYnAtKGsG
         TZTpAxLhRK3WP38bI2qqK/7tqVK9x8Uo4rjtgnRI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id F3C166034D;
        Tue,  1 Oct 2019 12:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569932450;
        bh=lp5RfcJ7QOMHh//lUV03XTYmhcqbXMbwWSVbR7ckkS8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lvExq41qsZhsJtjPYClvoajbSAD3zlG1PM/tpzugpdGpVjm3+8GBjRcOQyGVcINoa
         l03xiLzMRytM3WYSp3fyBrrN7L8xhHZVZPsg7hpMEeY/GgTg/ij+NoUXWi3WR3nvv8
         w7gx0fPPmTeHNxWok46S/tBwwk4wB85MrFJ7fCsA=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 01 Oct 2019 17:50:49 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        evgreen@chromium.org, daidavid1@codeaurora.org,
        saravanak@google.com, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: Add OSM L3 DT bindings
In-Reply-To: <53e76100-b7c9-1069-b571-b17271fe41c5@linaro.org>
References: <20190821091132.14994-1-sibis@codeaurora.org>
 <20190821091132.14994-2-sibis@codeaurora.org>
 <53e76100-b7c9-1069-b571-b17271fe41c5@linaro.org>
Message-ID: <e163cb4ff67b312c39c3eef543d7c62b@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Georgi,

On 2019-09-27 04:46, Georgi Djakov wrote:
> Hi Sibi,
> 
> On 8/21/19 02:11, Sibi Sankar wrote:
>> Add bindings for Operating State Manager (OSM) L3 interconnect 
>> provider
>> on SDM845 SoCs.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  .../bindings/interconnect/qcom,osm-l3.yaml    | 56 
>> +++++++++++++++++++
>>  .../dt-bindings/interconnect/qcom,osm-l3.h    | 12 ++++
>>  2 files changed, 68 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
>>  create mode 100644 include/dt-bindings/interconnect/qcom,osm-l3.h
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml 
>> b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
>> new file mode 100644
>> index 0000000000000..dab2b6875ab27
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
>> @@ -0,0 +1,56 @@
>> +# SPDX-License-Identifier: BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/interconnect/qcom,osm-l3.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Operating State Manager (OSM) L3 Interconnect 
>> Provider
>> +
>> +maintainers:
>> +  - Sibi Sankar <sibis@codeaurora.org>
>> +
>> +description:
>> +  L3 cache bandwidth requirements on Qualcomm SoCs is serviced by the 
>> OSM.
>> +  The OSM L3 interconnect provider aggregates the L3 bandwidth 
>> requests
>> +  from CPU/GPU and relays it to the OSM.
>> +
>> +properties:
>> +  compatible:
>> +    const: "qcom,sdm845-osm-l3"
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: xo clock
>> +      - description: alternate clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xo
>> +      - const: alternate
>> +
>> +  '#interconnect-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - '#interconnect-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    osm_l3: interconnect@17d41000 {
>> +      compatible = "qcom,sdm845-osm-l3";
>> +      reg = <0x17d41000 0x1400>;
>> +
>> +      clocks = <&rpmhcc 0>, <&gcc 165>;
>> +      clock-names = "xo", "alternate";
>> +
>> +      #interconnect-cells = <1>;
>> +    };
> 
> Are we going to do the bandwidth scaling from some cpufreq driver? 
> Under which
> DT node will we put the "interconnects" property?

Its still undecided :( unfortunately.
Using Saravana's series means that
bandwidth scaling will be done from
the cpufreq driver. The property
will be a part of the cpu-nodes. But
the part of adding the bw opp-tables
also to cpufreq driver or nodes doesn't
seem correct to me.

> 
> Thanks,
> Georgi
> 
>> diff --git a/include/dt-bindings/interconnect/qcom,osm-l3.h 
>> b/include/dt-bindings/interconnect/qcom,osm-l3.h
>> new file mode 100644
>> index 0000000000000..54858ff7674d7
>> --- /dev/null
>> +++ b/include/dt-bindings/interconnect/qcom,osm-l3.h
>> @@ -0,0 +1,12 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2019 The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_OSM_L3_H
>> +#define __DT_BINDINGS_INTERCONNECT_QCOM_OSM_L3_H
>> +
>> +#define MASTER_OSM_L3_APPS	0
>> +#define SLAVE_OSM_L3		1
>> +
>> +#endif
>> 

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
