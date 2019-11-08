Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBD4CF3E85
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 04:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729592AbfKHDuT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 22:50:19 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:45520 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbfKHDuT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 22:50:19 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C38BE60DA6; Fri,  8 Nov 2019 03:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573185018;
        bh=FKAOMRwFC7OQo/fJ+VzJARN7pUwUPaE483PakKH4jXU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gMt0u74eLf2BinrcRNgY1QWBLSFzZdcwCwvHvZyGzCcpV6yJZPUGf0/UUf8YYOQ6G
         LvQQxVH25mJ3Ryb18hxJ9PIaF8LpCOEgnyVgvLJ6LLOi0lyBv6MUNCrS0I93jErB8K
         84Mglfu7vb+H6QNKI3fjVp3BkHNQXeKcnXdImRs0=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 832EC60ACF;
        Fri,  8 Nov 2019 03:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573185018;
        bh=FKAOMRwFC7OQo/fJ+VzJARN7pUwUPaE483PakKH4jXU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gMt0u74eLf2BinrcRNgY1QWBLSFzZdcwCwvHvZyGzCcpV6yJZPUGf0/UUf8YYOQ6G
         LvQQxVH25mJ3Ryb18hxJ9PIaF8LpCOEgnyVgvLJ6LLOi0lyBv6MUNCrS0I93jErB8K
         84Mglfu7vb+H6QNKI3fjVp3BkHNQXeKcnXdImRs0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 832EC60ACF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v4 06/14] arm64: dts: qcom: sc7180: Add rpmh-rsc node
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Maulik Shah <mkshah@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org>
 <20191106065017.22144-7-rnayak@codeaurora.org>
 <5dc45a1a.1c69fb81.62b3b.65c6@mx.google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <55258ebe-a341-57e5-dd9a-e8e719d899a4@codeaurora.org>
Date:   Fri, 8 Nov 2019 09:20:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5dc45a1a.1c69fb81.62b3b.65c6@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/7/2019 11:23 PM, Stephen Boyd wrote:
> Quoting Rajendra Nayak (2019-11-05 22:50:09)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 61250560c7ef..98c8ab7d613c 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -387,6 +388,24 @@
>>                                  status = "disabled";
>>                          };
>>                  };
>> +
>> +               apps_rsc: rsc@18200000 {
> 
> The node name is non-standard. This has been a problem since sdm845
> though so it would be nice if we can invent some new name for this that
> is standard at some point in the future.
> 
>> +                       label = "apps_rsc";
> 
> Can we remove this property? The value seems minimal given that we can
> use the dev_name() and get the address in there instead of using a label.

Sure, i'll remove it.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
