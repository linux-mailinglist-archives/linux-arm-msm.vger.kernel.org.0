Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B51B3608D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 14:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232829AbhDOME1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 08:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232823AbhDOME0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 08:04:26 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08C94C06175F;
        Thu, 15 Apr 2021 05:04:02 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id f41so15430159lfv.8;
        Thu, 15 Apr 2021 05:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=i8SvjhCdw9FOVSaPraQjjwhoUPipML/qWazODxE0U8s=;
        b=bvWm9RIaJiU3Ofe+3/JkijqiWfbEaM091mffgZw8yyspgVO5TWdg+HinCbKgXeIC80
         e1NxlwJ9bcYc/PSsnqZDjXd0FkyxM41yjrTLmTeEGblZjBHDA9L85cfp+bh1QL/TnT6I
         QYgNsabE8YYZsJFHZs+gYbLZVpHEit1bg8Ua8EfsGrR+zt4dukRStRaRSzoA7yZ4Ai3l
         XfFSUiN8MCxj/cTW8vO5TTVgic603XGuzoATheq0xA4TXDK2MSgnyHrdcTTOns7ZpUvZ
         ZBaSf/y8DFvUPBsxt8sIBIrnnodcWk3/9kz0zVOZLC32musLh9NeqGJRSG3B3e8AZydS
         0fJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=i8SvjhCdw9FOVSaPraQjjwhoUPipML/qWazODxE0U8s=;
        b=MttfKpf0gCCiatUh9YYxikuddHVmMbotTX4t0lo1u3Fe1MQcPNudWnjwWRs8gao2tP
         zfv5lUQTBUdQMk8NoKoyOcJ4p5b/0rgCErdAaoxMP55zBTF5PrOyAw3LQcsY7DG2RMlJ
         k9SgUXXs4zUhR4cKXoSj4tvHU92POsV/zmBtDQ3jxPCDC9GrBPf4QOIRy6vUJmUtc28u
         BHON1SqX92wfPFbAKitTnoVeHdDd30LQaAja5erwdYViMBesuEjksSmcQbBgAOJMfWNm
         9s4o46arUNQT+h6TVmTNzyNQSo01C03rIQP/sdZq50sxgkE7PYMOgaq4Li2YVQmh+Z6y
         nwHA==
X-Gm-Message-State: AOAM531r8PPv20dZ81BVMpOosYDZm67X14wpcPKuZQabmb5BmErDrbtN
        11hgVwyf81sviei0uiCgXdtqpnaKAgyzWQ==
X-Google-Smtp-Source: ABdhPJxMTT2WwznsOdtTXXIHXd84qsCTwH3w38K6OX/rYlm2MCvz0rhORbBnp6DoTZvhniSK0fQ4yw==
X-Received: by 2002:ac2:5094:: with SMTP id f20mr2237456lfm.226.1618488240133;
        Thu, 15 Apr 2021 05:04:00 -0700 (PDT)
Received: from ?IPv6:2a01:540:23a1:ff00:5d3d:c2a0:35e0:a43a? ([2a01:540:23a1:ff00:5d3d:c2a0:35e0:a43a])
        by smtp.gmail.com with ESMTPSA id q10sm638666lfo.78.2021.04.15.05.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Apr 2021 05:03:59 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: Add bindings for Qualcomm
 Memshare service
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210319172321.22248-1-nikitos.tr@gmail.com>
 <20210319172321.22248-2-nikitos.tr@gmail.com>
 <20210330144048.GA264685@robh.at.kernel.org>
 <bf20ff4b-1765-2bc8-d0de-bea675a1d090@gmail.com>
 <20210414031508.GZ1538589@yoga>
From:   Nikita Travkin <nikitos.tr@gmail.com>
Message-ID: <1ce601f3-3915-fcf7-df27-746a16ba7b37@gmail.com>
Date:   Thu, 15 Apr 2021 17:03:58 +0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210414031508.GZ1538589@yoga>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



14.04.2021 08:15, Bjorn Andersson пишет:
> On Sat 10 Apr 03:05 CDT 2021, Nikita Travkin wrote:
>
>> Hi, sorry for a late reply but I couldn't answer earlier.
>>
>> 30.03.2021 19:40, Rob Herring ??????????:
>>> On Fri, Mar 19, 2021 at 10:23:20PM +0500, nikitos.tr@gmail.com wrote:
>>>> From: Nikita Travkin <nikitos.tr@gmail.com>
>>>>
>>>> Add DT bindings for memshare: QMI service that allocates
>>>> memory per remote processor request.
>>>>
>>>> Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
>>>> ---
>>>>  .../bindings/soc/qcom/qcom,memshare.yaml      | 109 ++++++++++++++++++
>>>>  include/dt-bindings/soc/qcom,memshare.h       |  10 ++
>>>>  2 files changed, 119 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,memshare.yaml
>>>>  create mode 100644 include/dt-bindings/soc/qcom,memshare.h
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,memshare.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,memshare.yaml
>>>> new file mode 100644
>>>> index 000000000000..ebdf128b066c
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,memshare.yaml
>>>> @@ -0,0 +1,109 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: "http://devicetree.org/schemas/soc/qcom/qcom,memshare.yaml#"
>>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>>> +
>>>> +title: Qualcomm QMI Shared Memory Service
>>> How many shared memory interfaces does Qcom have...
>>>
>>>> +
>>>> +description: |
>>>> +  This driver provides a QMI service that allows remote processors (like modem)
>>>> +  to request additional memory. It is used for applications like GPS in modem.
>>> If the memory region is defined in reserved-memory, how are you 
>>> allocating additional memory? 
>> Initially remoteproc is loaded into it's own reserved-memory region
>> but qcom decided that they sometimes need more memory than that.
>> Memshare driver in msm8916 downstream tree seem to blindly allocate
>> DMA region for every request that it gets. Additionally for those
>> clients described in the DT, they do the DMA allocation on boot
>> time and never free the region. They call it "guaranteed" allocation.
>>
>> On msm8916 only one "guaranteed" client seem to be used so I decided
>> to implement it with reserved-memory node. On newer platforms they
>> seem to have more clients but I think that the driver can be easily
>> extended to support dynamic allocation if someone really needs it.
>>
> Is the "guaranteed" memory required to come from the reserved-memory
> part of memory, or could it simply be allocated on demand as well (or
> preallocated, but at a dynamic address)?

This is rather complicated.

For most (msm8916) devices it works with a region from dma_alloc but
there are at least three devices where it causes problems.

If the region was allocated by dma_alloc (somewhere near 0xfe100000
if I remember correctly) then
- Wileyfox Swift (Longcheer L8150): Location service "crashes"
  (repeats request every 10-ish seconds while location session is
  open and gives no location data)
- Samsung A3, A5: The entire modem crashes after it gets the response
  with such address.

Downstream kernel allocates the region at slightly different address
which works fine.

It's probably possible to change the allocation address with dma mask
but I have no idea why the crash happens on those devices, if it's
even possible to debug this or find all the "bad" regions.
Because of that I prefer using a known-good address at least for the
location client that keeps it forever.

> If these allocations always came from a reserved-memory region, then
> adding a "qcom,memshare" compatible to the reserved-memory node itself
> seems like a reasonable approach. But if dma_alloc is sufficient, and
> there's cases where there's no "guaranteed" region, perhaps we should
> just describe this as part of the remoteproc node (i.e. essentially
> flipping the node/subnode in your current binding).
>
>
> E.g. can we get away with simply adding an optional qcom,memshare-node
> to the remoteproc binding and when that's present we make the Qualcomm
> remoteproc drivers spawn the memshare handler and listen for requests
> from that node?

I'm having a hard time imagining how this would be implemented...

Assuming that I need to keep reserved-memory for some clients
and other clients will need proper dynamic allocation (maybe on a
newer platform), there will be an optional subnode in each remoteproc
node, that will be detected by the remoteproc driver which will then
start memshare. It will have all the id-s, size or phandle to
reserved-memory. Then there may be multiple of those in one
remoteproc. Or one memshare subnode will contain multiple client
nodes? Then if I understand correctly, there are multiple different
remoteproc drivers so each will have to be modified. They will need
to spawn only one memshare instance and pass the clients to it.
Or maybe the subnode can contain a compatible and the code to keep
only one instance will be in the memshare driver itself...

To be honest, I'm getting very confused by even trying to lay this
down in my mind. I think it just unnecessarily complicates both
binding and the driver to "hide" it's nodes through the device tree.

Maybe I just didn't understand the proposal...

>> I tried to explain that in the cover letter but I think I made some
>> mistake as I don't see it in the Patchwork.
>>
>>>> +
>>>> +maintainers:
>>>> +  - Nikita Travkin <nikitos.tr@gmail.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: qcom,memshare
>>>> +
>>>> +  qcom,legacy-client:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +    description: Phandle to a memshare client node used for legacy requests.
>>>> +
>>>> +  "#address-cells":
>>>> +    const: 1
>>>> +
>>>> +  "#size-cells":
>>>> +    const: 0
>>>> +
>>>> +patternProperties:
>>>> +  "^.*@[0-9]+$":
>>>> +    type: object
>>>> +
>>>> +    properties:
>>>> +      reg:
>>>> +        description: Proc-ID for clients in this node.
>>> What's Proc-ID?
>> The requests from the remote nodes contain client-id and proc-id
>> that are supposed to differentiate the clients. It's possible to
>> find the values in downstream DT or by observing what messages
>> are received by the memshare service (I left dev_dbg logging in
>> the driver for that reason)
>>
>> I think I should reword it to make this more apparent, maybe
>> "Proc-ID that clients in this node send."?
>>
> If this is a constant for each remote and we make this a child thing of
> remoteproc perhaps encode the number in the remoteproc nodes?
>
> (We still need something in DT to state that we want a memshare for
> a given platform/remoteproc)
>
>>>> +
>>>> +      qcom,qrtr-node:
>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>> +        description: Node from which the requests are expected.
>>>> +
>>>> +      "#address-cells":
>>>> +        const: 1
>>>> +
>>>> +      "#size-cells":
>>>> +        const: 0
>>>> +
>>>> +    patternProperties:
>>>> +      "^.*@[0-9]+$":
>>>> +        type: object
>>>> +
>>>> +        properties:
>>>> +          reg:
>>>> +            description: ID of this client.
>>> How does one determine the ID?
>> As with proc-id, maybe reword to "ID that this client sends."?
>>
>> I will change those in v2, I still expect comments on the driver
>> itself, so I'll wait for that before submitting it with just a
>> couple lines changed.
>>
>>>> +
>>>> +          memory-region:
>>>> +            $ref: /schemas/types.yaml#/definitions/phandle
>>>> +            description: |
>>>> +              Reserved memory region that should be used for allocation.
>>>> +
>>>> +        required:
>>>> +          - reg
>>>> +
>>>> +    required:
>>>> +      - reg
>>>> +      - qcom,qrtr-node
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/soc/qcom,memshare.h>
>>>> +
>>>> +    reserved-memory {
>>>> +
>>>> +      #address-cells = <2>;
>>>> +      #size-cells = <2>;
>>>> +
>>>> +      gps_mem: gps@93c00000 {
>>>> +        reg = <0x0 0x93c00000 0x0 0x200000>;
>>>> +        no-map;
>>> We support 'compatible' in reserved-memory nodes, can you simplify the 
>>> binding and put everything in here?
>> If I understand this correctly, each reserved-memory node will
>> then load a new instance of memshare. Since the driver registers a
>> QMI service that handles multiple clients, there should be only one
>> instance.
> This you could work around in the driver implementation, to refcount a
> single implementation shared among all the instances.
>
>> Additionally, as I mentioned earlier, some clients may not
>> need reserved-memory at all
>>
> This on the other hand, makes me feel like we shouldn't go that route.
>
> Regards,
> Bjorn
>
>>>> +      };
>>>> +    };
>>>> +
>>>> +    memshare {
>>>> +      compatible = "qcom,memshare";
>>>> +      qcom,legacy-client = <&memshare_gps>;
>>>> +
>>>> +      #address-cells = <1>;
>>>> +      #size-cells = <0>;
>>>> +
>>>> +      mpss@0 {
>>>> +        reg = <MEMSHARE_PROC_MPSS_V01>;
>>>> +        qcom,qrtr-node = <0>;
>>>> +
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <0>;
>>>> +
>>>> +        memshare_gps: gps@0 {
>>>> +          reg = <0>;
>>>> +          memory-region = <&gps_mem>;
>>>> +        };
>>>> +      };
>>>> +    };
>>>> +
>>>> +...
>>>> diff --git a/include/dt-bindings/soc/qcom,memshare.h b/include/dt-bindings/soc/qcom,memshare.h
>>>> new file mode 100644
>>>> index 000000000000..4cef1ef75d09
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/soc/qcom,memshare.h
>>>> @@ -0,0 +1,10 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +
>>>> +#ifndef __DT_QCOM_MEMSHARE_H__
>>>> +#define __DT_QCOM_MEMSHARE_H__
>>>> +
>>>> +#define MEMSHARE_PROC_MPSS_V01 0
>>>> +#define MEMSHARE_PROC_ADSP_V01 1
>>>> +#define MEMSHARE_PROC_WCNSS_V01 2
>>>> +
>>>> +#endif /* __DT_QCOM_MEMSHARE_H__ */
>>>> -- 
>>>> 2.27.0
>>>>

