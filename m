Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 202D8108E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 May 2019 16:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfEAORN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 May 2019 10:17:13 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:57958 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbfEAORN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 May 2019 10:17:13 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A11AD60452; Wed,  1 May 2019 14:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1556720231;
        bh=d6UUKM7/SG8Hy+mLxnm6Mk0DPCGJl1FTJg3uSxE3ecU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=WFZP/jMkk8dr94XkDB0jzb9l/YW4WlvFQSUVwwUxP4thdC3KQsymridmRG9kL387n
         6gr9pnFcjObbGHnUuwWl9UIVW3dkX5sX324dhtkdMm3Hla6rpE7+R8jI7E7NF9CP8v
         XPYrlsiiMqM9kc9DhJwSsp6fbSxzTu9A2u7tggVw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 745BE602F8;
        Wed,  1 May 2019 14:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1556720230;
        bh=d6UUKM7/SG8Hy+mLxnm6Mk0DPCGJl1FTJg3uSxE3ecU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=j11ayQuR2WWeXLjnF2qzTelbpemno5LaE5FmMR5ThsiM+sSohRMyhZKv+n1WDeRTB
         oTg+DPEeba189RF6FvTjTmnisqU5IovRKLRJ4yuq/knAyXxqRDK4ACSWni6LhyihD9
         fVichSYoX4sdm77M0bcC36ps6b0T5L7Ez3iGwDyQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 745BE602F8
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: Document external clocks for
 MSM8998 gcc
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, agross@kernel.org, marc.w.gonzalez@free.fr,
        david.brown@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1556677404-29194-1-git-send-email-jhugo@codeaurora.org>
 <1556677473-29242-1-git-send-email-jhugo@codeaurora.org>
 <20190501033430.GB2938@tuxbook-pro>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <807e0789-6a7d-28b5-2811-df8e7e4ae393@codeaurora.org>
Date:   Wed, 1 May 2019 08:17:09 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <20190501033430.GB2938@tuxbook-pro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/30/2019 9:34 PM, Bjorn Andersson wrote:
> On Tue 30 Apr 19:24 PDT 2019, Jeffrey Hugo wrote:
> 
>> The global clock controller on MSM8998 can consume a number of external
>> clocks.  Document them.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/clock/qcom,gcc.txt | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
>> index 8661c3c..7d45323 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
>> @@ -28,6 +28,16 @@ Required properties :
>>   - #clock-cells : shall contain 1
>>   - #reset-cells : shall contain 1
>>   
>> +For MSM8998 only:
>> +	- clocks: a list of phandles and clock-specifier pairs,
>> +		  one for each entry in clock-names.
>> +	- clock-names: "xo" (required)
>> +		       "usb3_pipe" (optional)
>> +		       "ufs_rx_symbol0" (optional)
>> +		       "ufs_rx_symbol1" (optional)
>> +		       "ufs_tx_symbol0" (optional)
>> +		       "pcie0_pipe" (optional)
> 
> The optional clocks here comes from hardware blocks that in turn depends
> on the gcc, so we would need to resolve them lazily (in contrast to xo).
> 
> We typically don't list these in DT, but if this is close to the
> complete list of incoming clocks then I like the explicitness of it.

I reviewed the hardware documentation, and this is a complete list, 
except for some "aud_ref_clk" which I can't tell exactly where it comes 
from, and I see no use for it.  As near as I can tell, this list should 
cover all the needs going forward.

> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Regards,
> Bjorn
> 
>> +
>>   Optional properties :
>>   - #power-domain-cells : shall contain 1
>>   - Qualcomm TSENS (thermal sensor device) on some devices can
>> -- 
>> Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
>> Qualcomm Technologies, Inc. is a member of the
>> Code Aurora Forum, a Linux Foundation Collaborative Project.
>>


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
