Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8DA170080
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 14:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgBZNzT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 08:55:19 -0500
Received: from foss.arm.com ([217.140.110.172]:36280 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726388AbgBZNzT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 08:55:19 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A59B30E;
        Wed, 26 Feb 2020 05:55:19 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 969CC3F9E6;
        Wed, 26 Feb 2020 05:55:17 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: arm-smmu: update the list of clocks
To:     Matthias Kaehlcke <mka@chromium.org>,
        Sharat Masetty <smasetty@codeaurora.org>
Cc:     devicetree@vger.kernel.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, dri-devel@freedesktop.org,
        freedreno@lists.freedesktop.org, will@kernel.org,
        iommu@lists.linux-foundation.org
References: <1582186342-3484-1-git-send-email-smasetty@codeaurora.org>
 <1582186342-3484-2-git-send-email-smasetty@codeaurora.org>
 <20200220210242.GC24720@google.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <9cb8551f-becd-d84e-e0ce-43f13b84ad89@arm.com>
Date:   Wed, 26 Feb 2020 13:55:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200220210242.GC24720@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[ /me fires off MAINTAINERS patch... ]

On 20/02/2020 9:02 pm, Matthias Kaehlcke wrote:
> On Thu, Feb 20, 2020 at 01:42:22PM +0530, Sharat Masetty wrote:
>> This patch adds a clock definition needed for powering on the GPU TBUs
>> and the GPU TCU.
>>
>> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> index 6515dbe..235c0df 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>> @@ -28,6 +28,7 @@ properties:
>>             - enum:
>>                 - qcom,msm8996-smmu-v2
>>                 - qcom,msm8998-smmu-v2
>> +              - qcom,sc7180-smmu-v2
> 
> The addition of the compatible string isn't (directly) related with $subject,
> this should be done in a separate patch.

...or the patch should just be accurately described as "add support for 
new variant X, which requires an additional clock Y".

And speaking of which, can anyone clarify how "TCU and TBU core clock" 
manages to abbreviate to "mem_iface_clk"? I would have naively assumed 
something like "core" would be most logical.

Robin.
