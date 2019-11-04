Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5662ED8DA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 07:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728064AbfKDGLW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 01:11:22 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:39712 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfKDGLV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 01:11:21 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 06FC360DA6; Mon,  4 Nov 2019 06:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572847881;
        bh=Q6sNuBc7E5i7G0ni731o8Sdbe8pkK1pnQ5JaOmyxR04=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SuBz/A2ZXpzYpeEBGSlYcD+wihSzFVurAp67almR8tfBjAnGz0anS/u8WpgAmWnmS
         Xvqem4lyXr5nX5MB/w+Qfba1JH/trUY0i40wy79vUJR2dxHmg6ELv7k9oKDc1j8igw
         MbvlDZNULI3zmJ/W5uYhL5LHMaXvkuSVeTiEJH9w=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.136.17] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C616260BEB;
        Mon,  4 Nov 2019 06:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572847879;
        bh=Q6sNuBc7E5i7G0ni731o8Sdbe8pkK1pnQ5JaOmyxR04=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=I9GjlYjcjnCGdrLHYtABLnQ3j4WYnREyc4gkwM6CBDA5CsAvGzq3Acs6Tf18GBJST
         MXsQIeH7ZVuoZc7cHrhWi6AEz1uWT1yQesR2K5bGBfXyGjcX3fHwJYecw/85e1LeaR
         D8J35VKaNpKL/zfR7B0T4F+Zt8AIWiX1n7/zJnK0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C616260BEB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v3 03/11] dt-bindings: arm-smmu: update binding for qcom
 sc7180 SoC
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Joerg Roedel <joro@8bytes.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <20191023090219.15603-1-rnayak@codeaurora.org>
 <20191023090219.15603-4-rnayak@codeaurora.org>
 <5db86c09.1c69fb81.3981b.b748@mx.google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <6c3e1461-ddcf-9914-d416-7ef42f6971b2@codeaurora.org>
Date:   Mon, 4 Nov 2019 11:41:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5db86c09.1c69fb81.3981b.b748@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/29/2019 10:12 PM, Stephen Boyd wrote:
> Quoting Rajendra Nayak (2019-10-23 02:02:11)
>> Add the soc specific compatible for sc7180 smmu-500
>>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> Cc: Joerg Roedel <joro@8bytes.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> ---
>>   Documentation/devicetree/bindings/iommu/arm,smmu.txt | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.txt b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
>> index 3133f3ba7567..347869807cf2 100644
>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.txt
>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
>> @@ -30,6 +30,7 @@ conditions.
>>                     Qcom SoCs implementing "arm,mmu-500" must also include,
>>                     as below, SoC-specific compatibles:
>>                     "qcom,sdm845-smmu-500", "arm,mmu-500"
>> +                  "qcom,sc7180-smmu-500", "arm,mmu-500"
> 
> Please sort.

thanks, will do.

> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
