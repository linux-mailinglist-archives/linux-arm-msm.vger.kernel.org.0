Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97A9C31DA40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 14:22:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231766AbhBQNV2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 08:21:28 -0500
Received: from z11.mailgun.us ([104.130.96.11]:45306 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232951AbhBQNVJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 08:21:09 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613568050; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Np3U0vaRXZijLVb8hxs+DqV7UZRY4wcdQPUoRJUzFkQ=;
 b=L/lLcpo7tYwflnuqBtHcqacwO1CbxwbDFdRjppAFu4l39RPLBXlBwQPVC68dDnRvTvo6Uujl
 Vqs2/6oAjVgX3j4lhe80yY3MCi1PsMiale3WvtcRR1DRMPU9O0ivYELnNGvV2OwAY2q5ImTe
 m4rqXkskOnxBKEDc7oFAyeFjfag=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 602d1816d2def62f1e45f190 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Feb 2021 13:20:22
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AE217C43463; Wed, 17 Feb 2021 13:20:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DB0D3C433C6;
        Wed, 17 Feb 2021 13:20:20 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 17 Feb 2021 18:50:20 +0530
From:   schowdhu@codeaurora.org
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH V0 1/6] dt-bindings: Added the yaml bindings for DCC
In-Reply-To: <20210217110214.GR2774@vkoul-mobl.Dlink>
References: <cover.1613541226.git.schowdhu@codeaurora.org>
 <5da43657817066e0ffe1e24cfb17104138515452.1613541226.git.schowdhu@codeaurora.org>
 <20210217110214.GR2774@vkoul-mobl.Dlink>
Message-ID: <b0a01a37aedde4b2da2edd7032dd7627@codeaurora.org>
X-Sender: schowdhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-17 16:32, Vinod Koul wrote:
> On 17-02-21, 12:18, Souradeep Chowdhury wrote:
>> Documentation for Data Capture and Compare(DCC) device tree bindings
>> in yaml format.
>> 
>> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
>> ---
>>  .../devicetree/bindings/arm/msm/qcom,dcc.yaml      | 49 
>> ++++++++++++++++++++++
>>  1 file changed, 49 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
>> 
>> diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml 
>> b/Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
>> new file mode 100644
>> index 0000000..8f09578
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
>> @@ -0,0 +1,49 @@
>> +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/msm/qcom,dcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Data Capture and Compare
>> +
>> +maintainers:
>> +  - Souradeep Chowdhury <schowdhu@codeaurora.org>
>> +
>> +description: |
>> +    DCC (Data Capture and Compare) is a DMA engine which is used to 
>> save
>> +    configuration data or system memory contents during catastrophic 
>> failure
>> +    or SW trigger.DCC is used to capture and store data for debugging 
>> purpose
> 
> space after .

Ack

> 
>> +
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +    - enum:
>> +      - qcom,sm8150-dcc
>> +    - const: qcom,dcc
>> +
>> +  reg:
>> +    items:
>> +      - description: DCC base register region
>> +      - description: DCC RAM base register region
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dcc-base
>> +      - const: dcc-ram-base
> 
> drop dcc from names

Since DCC has a dedicated SRAM, this has been named like this as
only base and ram-base are generic names. Let me know if this is
still required to be changed.

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    dcc@010a2000{
>> +                compatible = "qcom,sm8150-dcc";
> 
> should this not be:
>                 compatible = "qcom,sm8150-dcc", "qcom,dcc";

Ack

> 
>> +                reg = <0 0x010a2000 0  0x1000>,
>> +                      <0 0x010ae000 0  0x2000>;
>> +                reg-names = "dcc-base", "dcc-ram-base";
>> +    };
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
