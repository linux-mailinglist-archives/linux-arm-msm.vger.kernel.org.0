Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A168EA13A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 10:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfH2I2Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 04:28:25 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46718 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbfH2I2Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 04:28:24 -0400
Received: by mail-wr1-f67.google.com with SMTP id h7so1140576wrt.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 01:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EMCFDUI7F1iRPWNuyA0vZPwvE9bgb/HOPGdiTj2TTzo=;
        b=pvWh8aXLB52cE8NwojVfuKES2r964HyauHY3gdgiWRedNr/hiDr0sAyjEiuz882xBs
         mkghumAcr6Uy5i5ZLOXceaZTHTiZhI9HqW1TkGczjO0WA5j/dEtbE+/yyWitpCXI/8QE
         qwglN8igSgLbqOVkej/CiPaOgJBXGoDGa8RlBZc3ReWCNaz28sn371HStJpOnCecE9u6
         mFPd695iEd1ek0uGPbpFlkI7hOc2Nm5q8q/uNmBvgPxA7tbpCT+FMx6pdvGAPtX4XL0l
         6Tx/h6RZAyf3muqG66IRj3jC3dRm23RJ0bzrBSpH5ajx5LjnHcULb4gH/MZdxC1QiWrM
         /qwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EMCFDUI7F1iRPWNuyA0vZPwvE9bgb/HOPGdiTj2TTzo=;
        b=sU66rCWDho5ClvjHAhGIuHqx92+My1MnUgOjUsMWtni0hE7RvolYz5UnvZtEMrF8eu
         5/bWtttxmjA6vFXwoEvSBByT0w6Mo/Yv4i4AzQBXgXcX78UzDzqxz2BH7cXDmNPuo/Sa
         D6QXhH2/HDSBE3AyG6jRGYBtkpFKxHBGPnr/odcteTRPCtHMYq8GXipAK6wvX/yQj4A4
         5QaSDp8vP7vuDdLloYMv3gylk4xGk6zcQd9R4y3EE88M4F8le4TE10gQFAg5So8QHT9l
         8mOJylW+V3T/7qQL+P2sd1FFAukGtBEunM2E6DBqbQCbrnKhhP6ko6sX8vVDc6S09vtY
         DTDA==
X-Gm-Message-State: APjAAAVpaBlbRvfSHeVhI8hluKDNg4ApQTEDTzxcUswFVDJW1UzjhU/f
        Vm4hJNkPK2e4alOIusMvA8TWjA==
X-Google-Smtp-Source: APXvYqxg9zgNT+p+MIYdHHYYmbI7yDoxMIjvHepDUL7WobZF0pWP6f/YCLjWZCpt3Ad1rhJ2vfaSqg==
X-Received: by 2002:adf:f90e:: with SMTP id b14mr9255809wrr.124.1567067302978;
        Thu, 29 Aug 2019 01:28:22 -0700 (PDT)
Received: from [192.168.1.6] (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id c62sm1085775wme.20.2019.08.29.01.28.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Aug 2019 01:28:22 -0700 (PDT)
Subject: Re: [PATCH 1/2] mbox: qcom: add APCS child device for QCS404
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        jassisinghbrar@gmail.com
Cc:     niklas.cassel@linaro.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190826164625.6744-1-jorge.ramirez-ortiz@linaro.org>
 <5d6700b4.1c69fb81.24793.0bff@mx.google.com>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <818ffe57-0b1b-2b7c-c3f8-fe9845908abe@linaro.org>
Date:   Thu, 29 Aug 2019 10:28:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <5d6700b4.1c69fb81.24793.0bff@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/29/19 00:31, Stephen Boyd wrote:
> Quoting Jorge Ramirez-Ortiz (2019-08-26 09:46:24)
>> There is clock controller functionality in the APCS hardware block of
>> qcs404 devices similar to msm8916.
>>
>> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
>> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
>>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> index 705e17a5479c..76e1ad433b3f 100644
>> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> @@ -89,7 +89,11 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>>                 return ret;
>>         }
>>  
>> -       if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global")) {
>> +       platform_set_drvdata(pdev, apcs);
> 
> Why did this move? It's required in the child driver or something now?
> Is it a Fixes sort of change?
> 
>> +
>> +       if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global") ||
>> +           of_device_is_compatible(np, "qcom,qcs404-apcs-apps-global")) {
> 
> Maybe this should be a compatible list instead of two calls to
> of_device_is_compatible().
> 
>> +
>>                 apcs->clk = platform_device_register_data(&pdev->dev,
>>                                                           "qcom-apcs-msm8916-clk",
>>                                                           -1, NULL, 0);
>> @@ -97,8 +101,6 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>>                         dev_err(&pdev->dev, "failed to register APCS clk\n");
>>         }
>>  
>> -       platform_set_drvdata(pdev, apcs);
>> -
>>         return 0;
>>  }
>>  
> 

thanks stephen. posted v2
