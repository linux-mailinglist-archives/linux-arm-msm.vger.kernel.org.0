Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFCB435ABC8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Apr 2021 10:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233606AbhDJIFh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Apr 2021 04:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhDJIFg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Apr 2021 04:05:36 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF3FAC061762;
        Sat, 10 Apr 2021 01:05:21 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id y1so9109223ljm.10;
        Sat, 10 Apr 2021 01:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=O1YTa0bl0npGeThfx55nacESkRL3fgkCwazh8Gv4zCU=;
        b=bLYsja+bzd4hW1XugbxGSDeqC/Kdzc7AhiFr1umBmxXjVo77q4wYMMfwazmxs4ZJXx
         YNEpmtNeoSPgJZOBt1nqJ9uhdTDJqpPU5u78n66fNyHPyUNaaottmBrPsJEZgIYei44D
         wkgEBlQFMZCLOy/SdGaJ55aJBsv6iPcVJCz/EoP2cQlGrL/rL+54Q8hl5hcPTi5wdlJX
         TJth4iJTjQm/h17L0j47pCLDEy3UWDpep+O7jKG/cuK8t07FOI749uTMhAMPCyUMDINA
         qDfO2lqv/R6WqdHugAz82hdIsfNptGN/LYjjQTSIJNxj6pDuAm22zdqqUiXX2ModWhQt
         M0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=O1YTa0bl0npGeThfx55nacESkRL3fgkCwazh8Gv4zCU=;
        b=Mol3b0aPdFq7YGV52FV1zdsv+1p3V7ACvn9tg7+Te1wfxLNWHdKykClKOIvYjN9Aih
         HaijF2XcH6jtV2CZ7TsZYYWSPCrkE9epkCXbL9927bmTKrYWAHh3WxKTAQfwygzPwYLB
         5UQwz13mmYpNWZYOVI6SM/CN8kef1uzWxlpjzbVZ7URVTxx6wPZKCe7F1kZX0Y1QQk5U
         +pMeESFcmBe1B35oO5Jv3JVizYt78/TCh4s1xcy5qCZdHmQMpmOlIf7Pgof4kSuRG55l
         Rtl9v+qlE+Uh6w5QPG0FuKla48y0iNtFnHr/13eiEEVVsGlZCaJ8YbcH103IYyUOcmza
         LYmw==
X-Gm-Message-State: AOAM5301woKwqRgBpnjTkJdl8InKUZL5XAgWeugjwPQcyTaGALI33gEp
        QfTynCWP6Ltp8qdfTjRUoi8QlYtu+XQ6VQ==
X-Google-Smtp-Source: ABdhPJwua9bj/vBqsaUuuaK2REPEbsimVlyNEE3+tSqVv4HpX17uU6lOte0SzgNtTNsQyTk23MdlXw==
X-Received: by 2002:a2e:2ac6:: with SMTP id q189mr8705814ljq.474.1618041919814;
        Sat, 10 Apr 2021 01:05:19 -0700 (PDT)
Received: from ?IPv6:2a01:540:23a1:ff00:6262:e20a:d993:49b3? ([2a01:540:23a1:ff00:6262:e20a:d993:49b3])
        by smtp.gmail.com with ESMTPSA id f11sm868957lfm.230.2021.04.10.01.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Apr 2021 01:05:19 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: Add bindings for Qualcomm
 Memshare service
To:     Rob Herring <robh@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210319172321.22248-1-nikitos.tr@gmail.com>
 <20210319172321.22248-2-nikitos.tr@gmail.com>
 <20210330144048.GA264685@robh.at.kernel.org>
From:   Nikita Travkin <nikitos.tr@gmail.com>
Message-ID: <bf20ff4b-1765-2bc8-d0de-bea675a1d090@gmail.com>
Date:   Sat, 10 Apr 2021 13:05:18 +0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210330144048.GA264685@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi, sorry for a late reply but I couldn't answer earlier.

30.03.2021 19:40, Rob Herring пишет:
> On Fri, Mar 19, 2021 at 10:23:20PM +0500, nikitos.tr@gmail.com wrote:
>> From: Nikita Travkin <nikitos.tr@gmail.com>
>>
>> Add DT bindings for memshare: QMI service that allocates
>> memory per remote processor request.
>>
>> Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
>> ---
>>  .../bindings/soc/qcom/qcom,memshare.yaml      | 109 ++++++++++++++++++
>>  include/dt-bindings/soc/qcom,memshare.h       |  10 ++
>>  2 files changed, 119 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,memshare.yaml
>>  create mode 100644 include/dt-bindings/soc/qcom,memshare.h
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,memshare.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,memshare.yaml
>> new file mode 100644
>> index 000000000000..ebdf128b066c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,memshare.yaml
>> @@ -0,0 +1,109 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/soc/qcom/qcom,memshare.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Qualcomm QMI Shared Memory Service
> How many shared memory interfaces does Qcom have...
>
>> +
>> +description: |
>> +  This driver provides a QMI service that allows remote processors (like modem)
>> +  to request additional memory. It is used for applications like GPS in modem.
> If the memory region is defined in reserved-memory, how are you 
> allocating additional memory? 

Initially remoteproc is loaded into it's own reserved-memory region
but qcom decided that they sometimes need more memory than that.
Memshare driver in msm8916 downstream tree seem to blindly allocate
DMA region for every request that it gets. Additionally for those
clients described in the DT, they do the DMA allocation on boot
time and never free the region. They call it "guaranteed" allocation.

On msm8916 only one "guaranteed" client seem to be used so I decided
to implement it with reserved-memory node. On newer platforms they
seem to have more clients but I think that the driver can be easily
extended to support dynamic allocation if someone really needs it.

I tried to explain that in the cover letter but I think I made some
mistake as I don't see it in the Patchwork.

>> +
>> +maintainers:
>> +  - Nikita Travkin <nikitos.tr@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,memshare
>> +
>> +  qcom,legacy-client:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: Phandle to a memshare client node used for legacy requests.
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^.*@[0-9]+$":
>> +    type: object
>> +
>> +    properties:
>> +      reg:
>> +        description: Proc-ID for clients in this node.
> What's Proc-ID?

The requests from the remote nodes contain client-id and proc-id
that are supposed to differentiate the clients. It's possible to
find the values in downstream DT or by observing what messages
are received by the memshare service (I left dev_dbg logging in
the driver for that reason)

I think I should reword it to make this more apparent, maybe
"Proc-ID that clients in this node send."?

>
>> +
>> +      qcom,qrtr-node:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description: Node from which the requests are expected.
>> +
>> +      "#address-cells":
>> +        const: 1
>> +
>> +      "#size-cells":
>> +        const: 0
>> +
>> +    patternProperties:
>> +      "^.*@[0-9]+$":
>> +        type: object
>> +
>> +        properties:
>> +          reg:
>> +            description: ID of this client.
> How does one determine the ID?

As with proc-id, maybe reword to "ID that this client sends."?

I will change those in v2, I still expect comments on the driver
itself, so I'll wait for that before submitting it with just a
couple lines changed.

>
>> +
>> +          memory-region:
>> +            $ref: /schemas/types.yaml#/definitions/phandle
>> +            description: |
>> +              Reserved memory region that should be used for allocation.
>> +
>> +        required:
>> +          - reg
>> +
>> +    required:
>> +      - reg
>> +      - qcom,qrtr-node
>> +
>> +required:
>> +  - compatible
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/soc/qcom,memshare.h>
>> +
>> +    reserved-memory {
>> +
>> +      #address-cells = <2>;
>> +      #size-cells = <2>;
>> +
>> +      gps_mem: gps@93c00000 {
>> +        reg = <0x0 0x93c00000 0x0 0x200000>;
>> +        no-map;
> We support 'compatible' in reserved-memory nodes, can you simplify the 
> binding and put everything in here?

If I understand this correctly, each reserved-memory node will
then load a new instance of memshare. Since the driver registers a
QMI service that handles multiple clients, there should be only one
instance. Additionally, as I mentioned earlier, some clients may not
need reserved-memory at all

>> +      };
>> +    };
>> +
>> +    memshare {
>> +      compatible = "qcom,memshare";
>> +      qcom,legacy-client = <&memshare_gps>;
>> +
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +
>> +      mpss@0 {
>> +        reg = <MEMSHARE_PROC_MPSS_V01>;
>> +        qcom,qrtr-node = <0>;
>> +
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        memshare_gps: gps@0 {
>> +          reg = <0>;
>> +          memory-region = <&gps_mem>;
>> +        };
>> +      };
>> +    };
>> +
>> +...
>> diff --git a/include/dt-bindings/soc/qcom,memshare.h b/include/dt-bindings/soc/qcom,memshare.h
>> new file mode 100644
>> index 000000000000..4cef1ef75d09
>> --- /dev/null
>> +++ b/include/dt-bindings/soc/qcom,memshare.h
>> @@ -0,0 +1,10 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#ifndef __DT_QCOM_MEMSHARE_H__
>> +#define __DT_QCOM_MEMSHARE_H__
>> +
>> +#define MEMSHARE_PROC_MPSS_V01 0
>> +#define MEMSHARE_PROC_ADSP_V01 1
>> +#define MEMSHARE_PROC_WCNSS_V01 2
>> +
>> +#endif /* __DT_QCOM_MEMSHARE_H__ */
>> -- 
>> 2.27.0
>>

