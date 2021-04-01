Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 119A43510C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 10:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232951AbhDAIWs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 04:22:48 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32207 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233394AbhDAIWK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 04:22:10 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617265330; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=73kahUGG37r2p6wLbYlXpBi11gwXumfvlc37qLlQw/0=;
 b=ZItyyMHMKjwX8I4FMCK2ZKkJpR6OKe3YnJTHyASupzeIAfGn5cTkNli5pjmexSeQDDR7XDT0
 dcyDmTyfqaY9x+wucPltvLRyWeFRwM9ruFoGGRMNUJcG/qyj5Sh7mTvZmfhQiVal+YqqkMQu
 yPENeUx+OAy76uGcPYPCUtEQlaA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 606582b18807bcde1d0d22fc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Apr 2021 08:22:09
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 61D41C43466; Thu,  1 Apr 2021 08:22:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B6CF3C433CA;
        Thu,  1 Apr 2021 08:22:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 01 Apr 2021 13:52:07 +0530
From:   schowdhu@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, vkoul@kernel.org
Subject: Re: [PATCH V2 1/5] dt-bindings: Added the yaml bindings for DCC
In-Reply-To: <161704647819.3012082.13027529193947275446@swboyd.mtv.corp.google.com>
References: <cover.1616651305.git.schowdhu@codeaurora.org>
 <5cd274f98b38d4b85c1ce212720b6b680f4a00f0.1616651305.git.schowdhu@codeaurora.org>
 <161704647819.3012082.13027529193947275446@swboyd.mtv.corp.google.com>
Message-ID: <0e389c1a842e66db58f2d9371b23c4f3@codeaurora.org>
X-Sender: schowdhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-30 01:04, Stephen Boyd wrote:
> Quoting Souradeep Chowdhury (2021-03-25 01:02:32)
>> diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml 
>> b/Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
>> new file mode 100644
>> index 0000000..c6e0a9c
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
> Add space between trigger. and DCC?

Ack

> 
>> +
>> +
> 
> Drop double newline?

Ack

> 
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - qcom,sm8150-dcc
>> +      - const: qcom,dcc
>> +
>> +  reg:
>> +    items:
>> +      - description: DCC base register region
>> +      - description: DCC RAM base register region
>> +
>> +  reg-names:
>> +    items:
>> +      - const: dcc
>> +      - const: dcc-ram
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
> 
> Do we really need reg names? Seems like we can assume the ordering.

Ack

> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    dcc@10a2000{
> 
> dma@10a2000? Or debug@10a2000?

Ack

> 
>> +                compatible = "qcom,sm8150-dcc","qcom,dcc";
>> +                reg = <0x010a2000  0x1000>,
>> +                      <0x010ad000  0x2000>;
>> +                reg-names = "dcc", "dcc-ram";
>> +    };
