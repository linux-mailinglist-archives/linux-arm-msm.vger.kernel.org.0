Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEF8844FC88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 01:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhKOATU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 14 Nov 2021 19:19:20 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:29164 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhKOATT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 14 Nov 2021 19:19:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636935385; x=1668471385;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Tr3VK1M14H+VJdrnmFpJIHHEtR8hyVn1KdLZqLtvvhQ=;
  b=HmgaVSkq1eBQsEzEBO1dAzHc5Fia0Dx/jrapydN2vKz01x4EFxtwIJyz
   q85H/ug2pLQKFTW/AFMhrlxSN+KSbw++VNiF2ekVF1+93vjZL7spscToe
   l/6alksjB4pIRsi7NRTh5F7ze7QOApywvq/umarBe1OM0ec9/vtyiQAiM
   g=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 14 Nov 2021 16:16:24 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2021 16:16:24 -0800
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 14 Nov 2021 16:16:23 -0800
Received: from [10.231.205.174] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Sun, 14 Nov
 2021 16:16:20 -0800
Message-ID: <b2c7bfcb-754b-8817-667e-b81a6ca5500f@quicinc.com>
Date:   Mon, 15 Nov 2021 08:16:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RESEND PATCH v2 11/11] dt-bindings: convert qcom,spmi-pmic-arb
 binding to YAML format
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
CC:     Rob Herring <robh+dt@kernel.org>, <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>, <maz@kernel.org>,
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <tglx@linutronix.de>, <collinsd@codeaurora.org>,
        <subbaram@codeaurora.org>
References: <1636691059-4305-1-git-send-email-quic_fenglinw@quicinc.com>
 <1636691059-4305-12-git-send-email-quic_fenglinw@quicinc.com>
 <1636724917.088909.2463363.nullmailer@robh.at.kernel.org>
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
In-Reply-To: <1636724917.088909.2463363.nullmailer@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2021/11/12 21:48, Rob Herring wrote:
> On Fri, 12 Nov 2021 12:24:19 +0800, Fenglin Wu wrote:
>> Convert the SPMI PMIC arbiter documentation to JSON/yaml.
>>
>> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
>> ---
>>   .../bindings/spmi/qcom,spmi-pmic-arb.txt           |  67 -----------
>>   .../bindings/spmi/qcom,spmi-pmic-arb.yaml          | 122 +++++++++++++++++++++
>>   2 files changed, 122 insertions(+), 67 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
>>   create mode 100644 Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
>>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml: properties:interrupt-names: 'const' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
> 	hint: Scalar and array keywords cannot be mixed
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml: properties:reg-names: {'minItems': 3, 'maxItems': 5, 'items': [{'const': 'core'}, {'const': 'intr'}, {'const': 'cnfg'}, {'const': 'chnls'}, {'const': 'obsrvr'}]} should not be valid under {'required': ['maxItems']}
> 	hint: "maxItems" is not needed with an "items" list
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml: ignoring, error in schema: properties: interrupt-names
> warning: no schema found in file: ./Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.example.dt.yaml: spmi@fc4cf000: reg: [[4232900608, 4096], [4232884224, 4096], [4232880128, 4096]] is too long
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/spmi.yaml
> Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.example.dt.yaml:0:0: /example-0/spmi@fc4cf000: failed to match any schema with compatible: ['qcom,spmi-pmic-arb']
>
> doc reference errors (make refcheckdocs):
> Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt: Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
>
> See https://patchwork.ozlabs.org/patch/1554141
>
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit.
I actually ran "make dt-binding-check 
DT_SCHEMA_FILES=Documentation/devicetree/bindings/qcom,spmi-pmic-arb.txt"
and confirmed there was no error or warning before pushing the change. 
Anyway I will follow
your steps here andcheck it again, if any changes is required, I will 
have them updated it
in next patchset.
Thanks
>
