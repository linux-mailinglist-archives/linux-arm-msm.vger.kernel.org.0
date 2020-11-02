Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC8DF2A3308
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 19:32:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbgKBScV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 13:32:21 -0500
Received: from foss.arm.com ([217.140.110.172]:36062 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbgKBScV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 13:32:21 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D34FD139F;
        Mon,  2 Nov 2020 10:32:20 -0800 (PST)
Received: from [10.57.54.223] (unknown [10.57.54.223])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEF683F719;
        Mon,  2 Nov 2020 10:32:18 -0800 (PST)
Subject: Re: [PATCH v18 3/4] dt-bindings: arm-smmu: Add compatible string for
 Adreno GPU SMMU
From:   Robin Murphy <robin.murphy@arm.com>
To:     Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Cc:     iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20201102171416.654337-1-jcrouse@codeaurora.org>
 <20201102171416.654337-4-jcrouse@codeaurora.org>
 <77278507-a6be-8517-6f76-02a0ff588e39@arm.com>
Message-ID: <9409941f-366e-4dca-f49b-48eeff1ea248@arm.com>
Date:   Mon, 2 Nov 2020 18:32:17 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <77278507-a6be-8517-6f76-02a0ff588e39@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-02 18:22, Robin Murphy wrote:
> On 2020-11-02 17:14, Jordan Crouse wrote:
>> Every Qcom Adreno GPU has an embedded SMMU for its own use. These
>> devices depend on unique features such as split pagetables,
>> different stall/halt requirements and other settings. Identify them
>> with a compatible string so that they can be identified in the
>> arm-smmu implementation specific code.
>>
>> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
>>
>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml 
>> b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index 503160a7b9a0..3b63f2ae24db 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -28,8 +28,6 @@ properties:
>>             - enum:
>>                 - qcom,msm8996-smmu-v2
>>                 - qcom,msm8998-smmu-v2
>> -              - qcom,sc7180-smmu-v2
>> -              - qcom,sdm845-smmu-v2
> 
> What about the "Apps SMMU" instances? Those are distinct and don't 
> have/need the GPU special behaviour, right?

Oh, having looked at patch #4, which prompted me go and look at the 845 
DTSI in context, now I realise the subtlety I overlooked. So I guess it 
really was worth resending, ha! Sorry for being thick :)

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> 
> Robin.
> 
>>             - const: qcom,smmu-v2
>>         - description: Qcom SoCs implementing "arm,mmu-500"
>> @@ -40,6 +38,13 @@ properties:
>>                 - qcom,sm8150-smmu-500
>>                 - qcom,sm8250-smmu-500
>>             - const: arm,mmu-500
>> +      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
>> +        items:
>> +          - enum:
>> +              - qcom,sc7180-smmu-v2
>> +              - qcom,sdm845-smmu-v2
>> +          - const: qcom,adreno-smmu
>> +          - const: qcom,smmu-v2
>>         - description: Marvell SoCs implementing "arm,mmu-500"
>>           items:
>>             - const: marvell,ap806-smmu-500
>>
