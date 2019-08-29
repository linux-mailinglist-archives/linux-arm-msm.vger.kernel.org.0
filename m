Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEC98A22C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 19:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbfH2RvG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 13:51:06 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45958 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727686AbfH2RvG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 13:51:06 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id F1A5F7D4D2; Thu, 29 Aug 2019 08:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567068885;
        bh=lpXLc5F4QsaDKK2TTF0zihfLK87qJP12kwB4PiEb95k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OxBfcrrzfeTUahg9ajJ34hg9KgU9FYJ97KAAKkNHR4nJOzETQFF5+n74FpQw9c5wL
         yvwt7H4q9PKnWZiJNI98yspOBFS7m0oIov6H6pO/BbAjH+MzsviOWfC2vXdhdqdXTs
         Ag8XKnjzHhKQnO1jsECxX0XDOC+PPzXCE5IcNhAI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id DEAA97D4D2;
        Thu, 29 Aug 2019 02:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567046287;
        bh=lpXLc5F4QsaDKK2TTF0zihfLK87qJP12kwB4PiEb95k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=caw7HlmutRgzF374ASAP6arTI7VM0E3MK6sozq/G9a/6B/evXKgsOWHfaSLCZQlPJ
         WXjfjUmB9fZRjkH2ngP+bg3Z2gW6/BSDEdjiRUL9l1TclfsXMeBshmyxAc7filcbzD
         NLnTfCUhuZ8uovGECvtm4gvHzdJq3zF84eJKL/a8=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 29 Aug 2019 08:08:06 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kernel-owner@vger.kernel.org
Subject: Re: [RESEND PATCH v2 1/2] dt-bindings: reset: aoss: Add AOSS reset
 binding for SC7180 SoCs
In-Reply-To: <1566808568.3842.2.camel@pengutronix.de>
References: <20190824152411.21757-1-sibis@codeaurora.org>
 <20190824152411.21757-2-sibis@codeaurora.org>
 <1566808568.3842.2.camel@pengutronix.de>
Message-ID: <4a71d26db054be636e57c4d031b0d3ec@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Philipp,
Thanks for the review!

On 2019-08-26 14:06, Philipp Zabel wrote:
> On Sat, 2019-08-24 at 20:54 +0530, Sibi Sankar wrote:
>> Add SC7180 AOSS reset to the list of possible bindings.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt | 4 ++--
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
>>  	Usage: required
>>  	Value type: <string>
>> -	Definition: must be:
>> -		    "qcom,sdm845-aoss-cc"
>> +	Definition: must be one of:
>> +		"qcom,sc7180-aoss-cc", "qcom,sdm845-aoss-cc"
> 
> Should this emphasize that the common sdm845 compatible always has to 
> be
> included?
> 
> +	Definition: must be:
> +		"qcom,sdm845-aoss-cc" for SDM845 or

can we drop the "or" since
we would need to keep adding
it in the future.

> +		"qcom,sc7180-aoss-cc", "qcom,sdm845-aoss-cc" for SC7180

I prefer ^^ approach for the
reasons stated below.

> 
> or like the qcom,kpss-gcc bindings:
> 
> +	Definition: should be one of the following. The generic
> compatible
> +		"qcom,sdm845-aoss-cc" should also be
> included.
> +		"qcom,sc7180-aoss-cc", "qcom,sdm845-aoss-cc"
> +

It is extremely unlikely that
future SoCs would maintain same
number of reset lines/offsets
due to the constant flux in
remote processors being added
to the SoCs. So a generic
compatible might not make sense
here.

> 	"qcom,sdm845-aoss-cc"
> 
> regards
> Philipp

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
