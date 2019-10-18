Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7009BDC86A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 17:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406633AbfJRP1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 11:27:47 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56774 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394233AbfJRP1r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 11:27:47 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7DA496106C; Fri, 18 Oct 2019 15:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571412466;
        bh=bZG3L7zXqO4GvOLgoEZUpllZarQ7DPHvX/3FqZ0KPQw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oy7Z0pRoF1j3FkzYFH7DTJOqJNKHwv6Ak4sgytcpG3WVjaNyw8Uyb/zQ1oLW0ueEa
         2Fu+3zvWoAf4tjHfk31oFdsSGTfKI+LCgC7x/11sWJuEjKmhxx7p3C0Yq46e713M0h
         Q3WCf+J/igRsUUWAQGQ0WEOe/+JpnNc0c1NXQHno=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id DA9D960FD2;
        Fri, 18 Oct 2019 15:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571412465;
        bh=bZG3L7zXqO4GvOLgoEZUpllZarQ7DPHvX/3FqZ0KPQw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Ud1/1TAdWTnt5PC9DJBLOFdAFBQTt3OrSCQ2lV/36mOyu4Q/DFcniZNrMzJN0lJD6
         gWbZSP8qOkvP9skewKanC9t639IegWEU5bSgeZSW2/XHMqD3oDmmdEvq4iYdVhEUmz
         F+bo1/SOzlWm6kep8HH577Mz0VWDH1zVcYtnMZkQ=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Oct 2019 20:57:45 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        Doug Anderson <dianders@chromium.org>,
        devicetree-owner@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: msm: Add LLCC for SC7180
In-Reply-To: <5da9cce6.1c69fb81.d3cb2.07d1@mx.google.com>
References: <cover.1571406041.git.saiprakash.ranjan@codeaurora.org>
 <30f419d1612a3912e323287a96daa2b4fbe3dacd.1571406041.git.saiprakash.ranjan@codeaurora.org>
 <5da9cce6.1c69fb81.d3cb2.07d1@mx.google.com>
Message-ID: <576b11d1f1fece666e2e8735c3a8657e@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-18 20:02, Stephen Boyd wrote:
> Quoting Sai Prakash Ranjan (2019-10-18 06:57:09)
>> Add LLCC compatible for SC7180 SoC.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> Can you convert this binding to YAML? Would be useful to make sure it's
> used properly.
> 

Ok will do in next version.

>> 
>> diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt 
>> b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
>> index eaee06b2d8f2..f263aa539d47 100644
>> --- a/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
>> +++ b/Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
>> @@ -11,7 +11,9 @@ Properties:
>>  - compatible:
>>         Usage: required
>>         Value type: <string>
>> -       Definition: must be "qcom,sdm845-llcc"
>> +       Definition: must be one of:
>> +                   "qcom,sc7180-llcc",
>> +                   "qcom,sdm845-llcc"
>> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
