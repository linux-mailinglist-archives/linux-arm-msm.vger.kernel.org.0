Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6567D2317C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 04:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731094AbgG2Ctc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 22:49:32 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32799 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730407AbgG2Ctb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 22:49:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595990971; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=s59Yw3fasEaqZROVI4pIOg10UgBffG1K/Zo2DcvLBPw=; b=cEHQ2sMSsMFwcUpBOFpnWHnT6KwsYL0OeiZ77NK9y3AnSv9RmJOgaZcXmj8CNh9G+AtFxSgp
 ggIPIWtpbrCxu5Cruq/LWGjGWWepAo5G7V9IfVVjRpV5e5CVFRsqfnKW+e9AZvNUmnP5D+jN
 8DMclk4LJlFSyVhO5p7IPCHYA3s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f20e3a8a61bb9e3f5144c67 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 29 Jul 2020 02:49:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AF642C433CB; Wed, 29 Jul 2020 02:49:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.101] (unknown [49.204.127.128])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AE9CBC433C6;
        Wed, 29 Jul 2020 02:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AE9CBC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [PATCH V2] dt-bindings: pci: convert QCOM pci bindings to YAML
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        PCI <linux-pci@vger.kernel.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <1595776013-12877-1-git-send-email-sivaprak@qti.qualcomm.com>
 <CAL_Jsq+-rwG73mEkYmMQcnxHoBpbFMWHKDvzUK=6-fMAo77-9w@mail.gmail.com>
 <CAL_JsqJU81U5CNSia3Lrzwb2VpPy3YMK=tJfXgU49TuGn1eRyQ@mail.gmail.com>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <fcb3df88-18bd-add1-5329-92af92948048@codeaurora.org>
Date:   Wed, 29 Jul 2020 08:19:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJU81U5CNSia3Lrzwb2VpPy3YMK=tJfXgU49TuGn1eRyQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On 7/28/2020 9:24 PM, Rob Herring wrote:
> On Tue, Jul 28, 2020 at 9:27 AM Rob Herring <robh+dt@kernel.org> wrote:
>> On Sun, Jul 26, 2020 at 9:07 AM Sivaprakash Murugesan
>> <sivaprak@qti.qualcomm.com> wrote:
>>> From: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>>>
>>> Convert QCOM pci bindings to YAML schema
>>>
>>> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>>> ---
>>> [v2]
>>>    - Referenced pci-bus.yaml
>>>    - removed duplicate properties already referenced by pci-bus.yaml
>>>    - Addressed comments from Rob
>>>   .../devicetree/bindings/pci/qcom,pcie.txt          | 330 ---------------
>>>   .../devicetree/bindings/pci/qcom,pcie.yaml         | 447 +++++++++++++++++++++
>>>   2 files changed, 447 insertions(+), 330 deletions(-)
>>>   delete mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie.txt
>>>   create mode 100644 Documentation/devicetree/bindings/pci/qcom,pcie.yaml
>>
>>> diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
>>> new file mode 100644
>>> index 000000000000..ddb84f49ac1c
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
>>> @@ -0,0 +1,447 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +
>>> +%YAML 1.2
>>> +---
>>> +$id: "http://devicetree.org/schemas/pci/qcom,pcie.yaml#"
>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>> +
>>> +title: Qualcomm PCI express root complex
>>> +
>>> +maintainers:
>>> +  - Sivaprakash Murugesan <sivaprak@codeaurora.org>
>>> +
>>> +description:
>>> +  QCOM PCIe controller uses Designware IP with Qualcomm specific hardware
>>> +  wrappers.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - qcom,pcie-apq8064
>>> +      - qcom,pcie-apq8084
>>> +      - qcom,pcie-ipq4019
>>> +      - qcom,pcie-ipq8064
>>> +      - qcom,pcie-ipq8074
>>> +      - qcom,pcie-msm8996
>>> +      - qcom,pcie-qcs404
>>> +      - qcom,pcie-sdm845
>>> +
>>> +  reg:
>>> +    description: Register ranges as listed in the reg-names property
>> Can drop this.
>>
>>> +    maxItems: 4
>>> +
>>> +  reg-names:
>>> +    items:
>>> +      - const: dbi
>>> +      - const: elbi
>>> +      - const: parf
>>> +      - const: config
>>> +
>>> +  ranges:
>>> +    maxItems: 2
>>> +
>>> +  interrupts:
>>> +    items:
>>> +      - description: MSI interrupts
>>> +
>>> +  interrupt-names:
>>> +    const: msi
>>> +
>>> +  "#interrupt-cells":
>> In pci-bus.yaml, so you can drop.

I am getting the below error if I remove #interrupt-cells alone.

properties: '#interrupt-cells' is a dependency of 'interrupt-map'

interrupt-map is also documented in pci-bus.yaml hence dropping that as 
well.


