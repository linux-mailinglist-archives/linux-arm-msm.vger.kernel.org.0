Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1C5F3B52
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 23:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727642AbfKGWVr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 17:21:47 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:46444 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727625AbfKGWVr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 17:21:47 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CC69760D8F; Thu,  7 Nov 2019 22:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573165305;
        bh=GawXUoGeUimTeAM5BUpkGaBlbU+H7gZBm0dmsexcDGE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SLiagC0nKiIydlfg0Gv3jKMGWNdUFqPJKBw8Mfuo7gwEhHR3FFMNaejEegEyvd7iv
         sJBWSkwwUt8PD5VrQGmp0zPA9pL8t/MCBpiyNPqPycFwNs6K1D7rp2ZVBULssNzA8t
         flPHFXzaZwMENpukGE9eScY/b3qW9BY5uUAKHxGY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C33E160274;
        Thu,  7 Nov 2019 22:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573165304;
        bh=GawXUoGeUimTeAM5BUpkGaBlbU+H7gZBm0dmsexcDGE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=oFsWqQJO3bJYma9TWQcHmenWosFN5+JKGt9KB/XXYEHB7s3+mq8yhTINBalUEabqt
         vlJrsHVoVXk/s5jY+tQs/YzDSD8C+rXg/CYjzQFMcJqOcrZD4zuL53KlfxEwO6REkB
         H9kdUW70pC3a1KYgkv5S39uQAVrSvTlXNWtuDCUo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C33E160274
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v6 1/6] dt-bindings: clock: Document external clocks for
 MSM8998 gcc
To:     Stephen Boyd <sboyd@kernel.org>, mturquette@baylibre.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <1569959656-5202-1-git-send-email-jhugo@codeaurora.org>
 <1569959718-5256-1-git-send-email-jhugo@codeaurora.org>
 <20191107214730.781622084C@mail.kernel.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <bc3d173d-6b87-29d1-475d-e569dec826b2@codeaurora.org>
Date:   Thu, 7 Nov 2019 15:21:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107214730.781622084C@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/7/2019 2:47 PM, Stephen Boyd wrote:
> Quoting Jeffrey Hugo (2019-10-01 12:55:18)
>> The global clock controller on MSM8998 can consume a number of external
>> clocks.  Document them.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>   Documentation/devicetree/bindings/clock/qcom,gcc.txt | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
>> index d14362ad4132..32d430718016 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
>> @@ -29,6 +29,16 @@ Required properties :
>>   - #clock-cells : shall contain 1
>>   - #reset-cells : shall contain 1
>>   
>> +For MSM8998 only:
>> +       - clocks: a list of phandles and clock-specifier pairs,
>> +                 one for each entry in clock-names.
>> +       - clock-names: "xo" (required)
>> +                      "usb3_pipe" (optional)
>> +                      "ufs_rx_symbol0" (optional)
>> +                      "ufs_rx_symbol1" (optional)
>> +                      "ufs_tx_symbol0" (optional)
>> +                      "pcie0_pipe" (optional)
> 
> This got wrecked by Taniya's changes to this file. Can you resend and
> rebase it? Sorry for the troubles.
> 

I was afraid of that.  I will rewrite and resend.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
