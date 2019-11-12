Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2830F8B4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 10:03:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbfKLJDT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 04:03:19 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:50738 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbfKLJDT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 04:03:19 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 9453A60D93; Tue, 12 Nov 2019 09:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573549398;
        bh=LHrXLLcNflZB2+NvOcUkU7ZFzJgbXbolPPApRHfDjVg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TLMp9JmQjQAvPoSUwrfRnjN2pIv2GmlbxzFbSN7Y+O65rz7PfHaofd4oD012w1bAh
         WXBDQyFZvdYx+J+Zl1sc3HPFYAClkjY48lGg3RdW4fN4B3pbU1+XcaH4+vfPTYXsjy
         Pq1l6CThVSYlBM/gbYcHT1r8pMqwqIWIUIvImdPU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 2E62B601B4;
        Tue, 12 Nov 2019 09:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573549396;
        bh=LHrXLLcNflZB2+NvOcUkU7ZFzJgbXbolPPApRHfDjVg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=e/QkaBjRxOp4UK+rzyhGuw5XcZ68Git7gpVqeQP6Q8qx4xZpyzsSBpoHCy9VUackf
         jvXosEZBErKg5KmWUPByAgC9LW7+R3NkSq9bKCEKUDlSOIZx4IcQHyi6PPTvUIhr+T
         DLlD9gouGAwhiN5p9InA+Hrn2J5M8llQAVR+frHo=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 12 Nov 2019 14:33:14 +0530
From:   kgunda@codeaurora.org
To:     Lee Jones <lee.jones@linaro.org>
Cc:     swboyd@chromium.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, rnayak@codeaurora.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH V2] mfd: qcom-spmi-pmic: Add support for pm6150 and
 pm6150l
In-Reply-To: <20191111112842.GK3218@dell>
References: <1572931309-16250-1-git-send-email-kgunda@codeaurora.org>
 <20191111112842.GK3218@dell>
Message-ID: <8a6ae98c18ba7bc2effa535dfa0f647c@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-11 16:58, Lee Jones wrote:
> On Tue, 05 Nov 2019, Kiran Gunda wrote:
> 
>> Add the compatibles and PMIC ids for pm6150 and pm6150l PMICs
>> found on SC7180 based platforms.
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> ---
>>  - Changes from V1:
>>    Sorted the macros and compatibles.
>> 
>>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt | 2 ++
>>  drivers/mfd/qcom-spmi-pmic.c                             | 4 ++++
>>  2 files changed, 6 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt 
>> b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
>> index 1437062..b5fc64e 100644
>> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
>> @@ -32,6 +32,8 @@ Required properties:
>>                     "qcom,pm8998",
>>                     "qcom,pmi8998",
>>                     "qcom,pm8005",
>> +		   "qcom,pm6150",
>> +		   "qcom,pm6150l",
> 
> Tabbing looks off.
yes. Placed a tab mistakenly. Going to address in next post.
