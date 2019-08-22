Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C822998B7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2019 08:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbfHVGjs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Aug 2019 02:39:48 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58338 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728104AbfHVGjs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Aug 2019 02:39:48 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 609F260A96; Thu, 22 Aug 2019 06:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566455987;
        bh=OYUu5JAm1bl+zh0nxUjpxjn9+/5Y2P9wOVNGY8i1OE4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=UgvpH0uYAl5oiGGAz2FbZQwaZMN8KZY+t0IpZJrEzzRRcmRRcFp8jlNoycYpmx2AV
         9cT5Tr1Q7+VOVdmK74k47Kgn48J2odr9QX4qg882VcdRf4iz1+fPVBm4gixLH7gFSA
         ZlmLRlCRTeHVjwpaKoe/7rQpkyXsgCgWmzJR/Xc0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 9428D60A96;
        Thu, 22 Aug 2019 06:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1566455986;
        bh=OYUu5JAm1bl+zh0nxUjpxjn9+/5Y2P9wOVNGY8i1OE4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kn1rOIl4Bt7u5rWyAB4669HaA0Gj6GaFy57m/MEYEa7OLm68t1m8uv2jJH3PH2drw
         sE8lXN0M4Va3QfADB+Cf3p5ck4cjjozMExO326EJ++qhypKGunRusNyEMDIc/8cPt/
         391L6S5M8hMxHl/hGxSYi9jAamWzKyNsrA1KBR4M=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 22 Aug 2019 12:09:46 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: reset: aoss: Add AOSS reset binding for
 SC7180 SoCs
In-Reply-To: <1566383523.4193.5.camel@pengutronix.de>
References: <20190821095442.24495-1-sibis@codeaurora.org>
 <20190821095442.24495-2-sibis@codeaurora.org>
 <1566383523.4193.5.camel@pengutronix.de>
Message-ID: <f6f36181660057325742318519e541ad@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Philipp,
Thanks for the review!

On 2019-08-21 16:02, Philipp Zabel wrote:
> On Wed, 2019-08-21 at 15:24 +0530, Sibi Sankar wrote:
>> Add SC7180 AOSS reset to the list of possible bindings.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt 
>> b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
>> index 510c748656ec5..8f0bbdc6afd91 100644
>> --- a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
>> +++ b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
>> @@ -8,7 +8,8 @@ Required properties:
>>  - compatible:
>>  	Usage: required
>>  	Value type: <string>
>> -	Definition: must be:
>> +	Definition: must be one of:
>> +		    "qcom,sc7180-aoss-cc"
>>  		    "qcom,sdm845-aoss-cc"
>> 
>>  - reg:
> 
> Does sc7180 have exactly the same resets (mss, camss, venus, gpu,
> dispss, wcss, and lpass) as sdm845? If so, it could be considered
> compatible, and the driver changes wouldn't be needed at all:

Yes they are identical both
AOSS and PDC resets.

> 
> -	Definition: must be:
> +	Definition: must be one of:
> +		    "qcom,sc7180-aoss-cc", "qcom,sdm845-aoss-cc"
> 
> 	    "qcom,sdm845-aoss-cc"
> 
> Is there a reason not to do this?

I am fine with ^^, will change
them in v2.

> 
> regards
> Philipp

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
