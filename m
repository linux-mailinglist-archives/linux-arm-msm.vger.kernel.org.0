Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 647813823AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 07:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234079AbhEQF2Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 01:28:25 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:26129 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbhEQF2Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 01:28:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621229229; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MuCdQ3B8kZ30d41nu+ytgA3HhxH13/BnvH4pMsPHBHI=;
 b=WnYPlopQZi5sPHe93LMChdEEicwxiaRJRrbDw84UoVRWu3YrytpdqRarQKEXO5t1V/JvsrWn
 PYRrYLC4ncZAC4DyZW1U7qzrQwArrl15c4aGgWCj9siiVN3QRT18u/G6iCGafU+eqFQ10v78
 dtICZsUFIMCNqY8hHWq7Q+Mde+w=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60a1fead2bff04e53b736e28 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 May 2021 05:27:09
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1C8E4C4338A; Mon, 17 May 2021 05:27:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4472FC433D3;
        Mon, 17 May 2021 05:27:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 17 May 2021 10:57:08 +0530
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: sc7280: Include PMIC DT files
 for sc7280-idp
In-Reply-To: <YJKyc09bL/Z6YcK1@google.com>
References: <1620197726-23802-1-git-send-email-skakit@codeaurora.org>
 <1620197726-23802-9-git-send-email-skakit@codeaurora.org>
 <YJKyc09bL/Z6YcK1@google.com>
Message-ID: <e2ce6842d253bdfa5e166d9e31b32615@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-05 20:27, Matthias Kaehlcke wrote:
> On Wed, May 05, 2021 at 12:25:26PM +0530, satya priya wrote:
>> The sc7280-idp has four PMICs, include their .dtsi files.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280-idp.dts | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> index 02a14fc..704fb9a 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> @@ -12,6 +12,10 @@
>>  #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
>>  #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>>  #include "sc7280.dtsi"
>> +#include "pm7325.dtsi"
>> +#include "pmr735a.dtsi"
>> +#include "pm8350c.dtsi"
>> +#include "pmk8350.dtsi"
> 
> Patch '[7/8] arm64: dts: qcom: sc7280: Add channel nodes for 
> sc7280-idp'
> of this series makes use of the label 'pmk8350_vadc', which doesn't 
> exist
> at that point.
> 
> A series should be organized in a way that applying only a
> subset of the series (in order, starting with patch 1) doesn't
> cause any build or runtime issues. To achieve this patch [7/8]
> and [8/8] of this series need to be swapped.

Okay, I will re-arrange the series and resend v4.

Thanks,
Satya Priya
