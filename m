Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28FE210398A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 13:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728537AbfKTMIZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Nov 2019 07:08:25 -0500
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:54140
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726689AbfKTMIZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Nov 2019 07:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574251704;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=ZCoBJqI8nQiSfhFad2WwoeMpz/uUodK2E04YZS93oYQ=;
        b=j5Ie0ICLcXKmpX1E+1i7t2ueE2QCdTmpA8VC4M16oinkdl+VR6MDW1v81jEt8rhs
        BxQetQ4BDkBBToIRAlFREwNDiGKBgbHVOkugWVAleGJ43+42N0a1s7cVrKCDOLlIIs3
        haWyg9VZFCqVhLeg0SfDZO4Ll3iOh5SwdyCyVV6M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574251704;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=ZCoBJqI8nQiSfhFad2WwoeMpz/uUodK2E04YZS93oYQ=;
        b=aqRCJ/tOXPYl0s3onydVlDPBwKvg8iki64KW7AEdcnrRRqY2vFO7D9aJe4cSNTm5
        yM9OxV1vMXM4Jf8tEQOE1nQjL6OTt3B6clww4rW9kVHB84LECvyHqvHVLqHYtPiJZiS
        lr6OBIlJNT8gKuqspLy7Ef7ZqM9BQA6TesCxDjh8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 20 Nov 2019 12:08:24 +0000
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     bjorn.andersson@linaro.org, rnayak@codeaurora.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        dianders@chromium.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: power: Add rpmh power-domain bindings
 for SM8150
In-Reply-To: <5dd4398e.1c69fb81.fb48b.b3bd@mx.google.com>
References: <20191118173944.27043-1-sibis@codeaurora.org>
 <0101016e7f99aa17-22b1062e-9922-40e4-ae7e-8b91210bb12c-000000@us-west-2.amazonses.com>
 <5dd4398e.1c69fb81.fb48b.b3bd@mx.google.com>
Message-ID: <0101016e88b6afab-0c74d03c-45e5-4419-b1eb-b57c94b74838-000000@us-west-2.amazonses.com>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2019.11.20-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-20 00:20, Stephen Boyd wrote:
> Quoting Sibi Sankar (2019-11-18 09:40:07)
>> Add RPMH power-domain bindings for the SM8150 family of SoCs.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
>>  .../devicetree/bindings/power/qcom,rpmpd.txt       |  1 +
>>  include/dt-bindings/power/qcom-rpmpd.h             | 14 
>> ++++++++++++++
>>  2 files changed, 15 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt 
>> b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
>> index bc75bf49cdaea..f3bbaa4aef297 100644
>> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
>> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.txt
>> @@ -10,6 +10,7 @@ Required Properties:
>>         * qcom,msm8998-rpmpd: RPM Power domain for the msm8998 family 
>> of SoC
>>         * qcom,qcs404-rpmpd: RPM Power domain for the qcs404 family of 
>> SoC
>>         * qcom,sdm845-rpmhpd: RPMh Power domain for the sdm845 family 
>> of SoC
>> +       * qcom,sm8150-rpmhpd: RPMh Power domain for the sm8150 family 
>> of SoC
> 
> Can you convert this binding to YAML? Would help us validate DTS files
> in the future.

yes will convert it in the next
re-spin.

> 
>>   - #power-domain-cells: number of cells in Power domain specifier
>>         must be 1.
>>   - operating-points-v2: Phandle to the OPP table for the Power 
>> domain.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
