Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87607A3DB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2019 20:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbfH3Se1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Aug 2019 14:34:27 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53596 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbfH3Se1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Aug 2019 14:34:27 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3F0D4602CA; Fri, 30 Aug 2019 18:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567190066;
        bh=1vCASBpYbJrLGe59kevioefRiDfDBB6T5W2s5KIcxNk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nEccCaklrsmIlZB0g/6/0CJj8PBs976ENZwpxI8Foxd3+Pa/xEbwp8+4mCn4KCYSr
         Ru3FsCmTquDS6GBzGdMgzZLvioc3nPQiv3VxQ0y7l9nYjq7Ta2U8qdTDR2Ra078OSy
         hhNdfDB9qxnhzrEh0lqmOddEgE65oc+2fF4wP44E=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 98FCA6020A;
        Fri, 30 Aug 2019 18:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567190065;
        bh=1vCASBpYbJrLGe59kevioefRiDfDBB6T5W2s5KIcxNk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bzScLQ3iPPFGoe3S/s6ZIs+W1Ldlr/83E6CELG3xWCiiJFCJ24sRnFxYanF9OjAq0
         L1fJNVtbwBYWmLxr/54sw3ny9GLfIE6gz1QIemyaXT1P1paX+jrZQEVKkMITSPhmnq
         8nwzRESEoth3FVOM2p4yQSb+8xpRjzl6IJpnOJ6s=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 31 Aug 2019 00:04:25 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     bjorn.andersson@linaro.org, p.zabel@pengutronix.de,
        robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [RESEND PATCH v2 1/2] dt-bindings: reset: aoss: Add AOSS reset
 binding for SC7180 SoCs
In-Reply-To: <20190830053250.D772A21897@mail.kernel.org>
References: <20190824152411.21757-1-sibis@codeaurora.org>
 <20190824152411.21757-2-sibis@codeaurora.org>
 <20190830053250.D772A21897@mail.kernel.org>
Message-ID: <6e87c7d270f0714fd9f2a2f629ffac27@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Stephen,
Thanks for the review!

On 2019-08-30 11:02, Stephen Boyd wrote:
> Quoting Sibi Sankar (2019-08-24 08:24:10)
>> Add SC7180 AOSS reset to the list of possible bindings.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt | 4 ++--
> 
> Can you convert this binding to YAML/JSON schema? Would help to 
> describe
> the 'one of' requirement below in a more structured way.

yeah converting them shouldn't
take time but 'oneof' isn't the
requirement here. We want to
specify that sc7180 should
continue to use the sdm845
compatible since the offset/
num of reset are identical.

> 
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt 
>> b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
>> index 510c748656ec5..3eb6a22ced4bc 100644
>> --- a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
>> +++ b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
>> @@ -8,8 +8,8 @@ Required properties:
>>  - compatible:
>>         Usage: required
>>         Value type: <string>
>> -       Definition: must be:
>> -                   "qcom,sdm845-aoss-cc"
>> +       Definition: must be one of:

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
