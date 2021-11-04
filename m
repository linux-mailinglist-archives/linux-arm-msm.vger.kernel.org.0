Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9D3444D21
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Nov 2021 02:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230198AbhKDB4y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Nov 2021 21:56:54 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:18668 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231945AbhKDB4y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 21:56:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635990857; x=1667526857;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xHDRhxBwYvWNSiLaJE2QebAyd+xmjgZ4zT973gaed6A=;
  b=yycPZc367/5yb5t19o+0AqfXwiO4UTtyPXv+Jdr852yuPTp5NwDC7oUm
   FkTAanEV/iotPZavDUpcRjt8JgP8DWWyfMFgl8Dd0Y1pUiskR4GFO3ZlM
   nNaadlE30KZvsCQklmEqOgt48sh3PzzSsIZSt+4ZGl+BVj2Bs3DJ8eqsB
   g=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 03 Nov 2021 18:54:17 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2021 18:54:16 -0700
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Wed, 3 Nov 2021 18:54:16 -0700
Received: from [10.231.205.174] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Wed, 3 Nov 2021
 18:54:13 -0700
Message-ID: <8be3ee89-7fa9-4611-3fda-c152ca9fa444@quicinc.com>
Date:   Thu, 4 Nov 2021 09:54:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1] dt-bindings: convert qcom,spmi-pmic-arb binding to
 YAML format
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <collinsd@codeaurora.org>, <subbaram@codeaurora.org>
References: <1635836275-8873-1-git-send-email-quic_fenglinw@quicinc.com>
 <YYMLKCspjdyaKWUK@ripper>
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
In-Reply-To: <YYMLKCspjdyaKWUK@ripper>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2021/11/4 6:20, Bjorn Andersson wrote:
> On Mon 01 Nov 23:57 PDT 2021, Fenglin Wu wrote:
> [..]
>> diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
>> new file mode 100644
>> index 0000000..05bb114
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
>> @@ -0,0 +1,122 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/spmi/qcom,spmi-pmic-arb.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SPMI PMIC Arbiter
>> +
>> +maintainers:
>> +  - Fenglin Wu <quic_fenglinw@quicinc.com>
>> +
>> +description: |
>> +  The SPMI PMIC Arbiter is found on Snapdragon chipsets. It is an SPMI
>> +  controller with wrapping arbitration logic to allow for multiple
>> +  on-chip devices to control a single SPMI master.
>> +
>> +  The PMIC Arbiter can also act as an interrupt controller, providing
>> +  interrupts to slave devices.
>> +
>> +  See Documentation/devicetree/bindings/spmi/spmi.yaml for the generic
>> +  SPMI controller binding requirements for child nodes.
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^qcom,spmi@.*"
> Node names should never contain "qcom,". Seems the agreed upon node
> named should be "spmi@.*".
>
> The rest looks like a reasonable conversion to me.
>
> [..]
Thanks, I will update it in patch V2.
>> +examples:
>> +  - |
>> +    qcom,spmi@fc4cf000 {
> Regards,
> Bjorn
