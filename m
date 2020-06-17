Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B00E1FD216
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 18:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgFQQ1R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 12:27:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:42841 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727836AbgFQQ1P (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 12:27:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592411234; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3kphDNNgXxmWAV6mi4fI4VHOf8JSRgD1IIPPeGHUYd0=; b=MAxocyfj6KCgsdqk8Ah81Mx1Xh3B9N3WlmdD9M+jEiARGwDCZnoKZow+92Gw2M504F8vysW8
 4q3cWIqYUU4O0EeHVUd/laRD/xQOj5alqNyaittLuTcEe2KBmoWBPvleGPawMVSuZbLx3Rjg
 QGshnmuQ1D6DWTlUUnRyEBfgMv0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-east-1.postgun.com with SMTP id
 5eea4448c4bb4f886d9c2701 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Jun 2020 16:26:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0A68CC4339C; Wed, 17 Jun 2020 16:26:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.50.9.163] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rbokka)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 315E0C433AD;
        Wed, 17 Jun 2020 16:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 315E0C433AD
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rbokka@codeaurora.org
Subject: Re: [PATCH v3 1/4] dt-bindings: nvmem: qfprom: Convert to yaml
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     dhavalp@codeaurora.org, mturney@codeaurora.org,
        rnayak@codeaurora.org, linux-arm-msm@vger.kernel.org,
        saiprakash.ranjan@codeaurora.org, sparate@codeaurora.org,
        mkurumel@codeaurora.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200617145116.247432-1-dianders@chromium.org>
 <20200617074930.v3.1.Iea2704ec2cb40c00eca47781c310a6330ac5dd41@changeid>
 <ed6d22a1-0d38-9874-d5cc-efe39f360baa@linaro.org>
From:   "Ravi Kumar Bokka (Temp)" <rbokka@codeaurora.org>
Message-ID: <0181cfe3-6627-e599-8f2f-1f433d9e0596@codeaurora.org>
Date:   Wed, 17 Jun 2020 21:56:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <ed6d22a1-0d38-9874-d5cc-efe39f360baa@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/17/2020 8:48 PM, Srinivas Kandagatla wrote:
> 
> 
> On 17/06/2020 15:51, Douglas Anderson wrote:
>> From: Ravi Kumar Bokka <rbokka@codeaurora.org>
>>
>> This switches the bindings over from txt to yaml.
>>
>> Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> ---
>>
>> Changes in v3:
>> - Split conversion to yaml into separate patch new in v3.
>> - Use 'const' for compatible instead of a 1-entry enum.
>> - Changed filename to match compatible string.
>> - Add #address-cells and #size-cells to list of properties.
>> - Fixed up example.
>>
>>   .../bindings/nvmem/qcom,qfprom.yaml           | 45 +++++++++++++++++++
>>   .../devicetree/bindings/nvmem/qfprom.txt      | 35 ---------------
>>   2 files changed, 45 insertions(+), 35 deletions(-)
>>   create mode 100644 
>> Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/nvmem/qfprom.txt
>>
>> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml 
>> b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>> new file mode 100644
>> index 000000000000..5efa5e7c4d81
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>> @@ -0,0 +1,45 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies Inc, QFPROM Efuse bindings
>> +
>> +maintainers:
>> +  - Ravi Kumar Bokka <rbokka@codeaurora.org>
>> +
> 
> Am not sure this was intentional, but the old maintainer name is totally 
> lost in this patch!
> 
> Please fix this!
> 

Hi Srinivas,
The existed qfprom dt-bindings in .txt format.
I will make it as it is to merge whole content in .yaml format once 
confirm all the parameters with this new driver changes.

> 
> 
>> +allOf:
>> +  - $ref: "nvmem.yaml#"
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,qfprom
>> +
>> +  reg:
>> +    items:
>> +      - description: The corrected region.
>> +
>> +  # Needed if any child nodes are present.
>> +  "#address-cells":
>> +    const: 1
>> +  "#size-cells":
>> +    const: 1
>> +
>> +required:
>> +   - compatible
>> +   - reg
>> +
>> +examples:
>> +  - |
>> +    efuse@784000 {
>> +      compatible = "qcom,qfprom";
>> +      reg = <0 0x00784000 0 0x8ff>;
>> +      #address-cells = <1>;
>> +      #size-cells = <1>;
>> +
>> +      hstx-trim-primary@1eb {
>> +        reg = <0x1eb 0x1>;
>> +        bits = <1 4>;
>> +      };
>> +    };
>> diff --git a/Documentation/devicetree/bindings/nvmem/qfprom.txt 
>> b/Documentation/devicetree/bindings/nvmem/qfprom.txt
>> deleted file mode 100644
>> index 26fe878d5c86..000000000000
>> --- a/Documentation/devicetree/bindings/nvmem/qfprom.txt
>> +++ /dev/null
>> @@ -1,35 +0,0 @@
>> -= Qualcomm QFPROM device tree bindings =
>> -
>> -This binding is intended to represent QFPROM which is found in most 
>> QCOM SOCs.
>> -
>> -Required properties:
>> -- compatible: should be "qcom,qfprom"
>> -- reg: Should contain registers location and length
>> -
>> -= Data cells =
>> -Are child nodes of qfprom, bindings of which as described in
>> -bindings/nvmem/nvmem.txt
>> -
>> -Example:
>> -
>> -    qfprom: qfprom@700000 {
>> -        compatible     = "qcom,qfprom";
>> -        reg        = <0x00700000 0x8000>;
>> -        ...
>> -        /* Data cells */
>> -        tsens_calibration: calib@404 {
>> -            reg = <0x4404 0x10>;
>> -        };
>> -    };
>> -
>> -
>> -= Data consumers =
>> -Are device nodes which consume nvmem data cells.
>> -
>> -For example:
>> -
>> -    tsens {
>> -        ...
>> -        nvmem-cells = <&tsens_calibration>;
>> -        nvmem-cell-names = "calibration";
>> -    };
>>

-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of the Code Aurora Forum, hosted by the Linux Foundation.
