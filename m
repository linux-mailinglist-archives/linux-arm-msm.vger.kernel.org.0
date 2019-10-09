Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB10D0E86
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 14:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730110AbfJIMST (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Oct 2019 08:18:19 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:40636 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729686AbfJIMST (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Oct 2019 08:18:19 -0400
Received: by mail-qk1-f196.google.com with SMTP id y144so1957914qkb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2019 05:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=W0eFvkxC6/6v6MGd/x6emnhmXUqGXpfFvPc0fr695gI=;
        b=nAz6Fdi2dhW3cQpy72UZ2Ed+BztZuCu7D3ldtxo3tDn3TZK6+A3HPBEFye8+Ynfrw8
         nLuvsgdeP/rP+wVGHGDMjFHZzzTMvP8l7R0Hvk6eUf/N9HJUmZSgz7Gpq+iI9dvKNemg
         Fo8ctp5jSdqrM2XQoFcgNwtO0ps05sOSYIfTC6Bbe1uSDjthSyRVK5KTS9cWkVKD6fCG
         sKwHMW7qhSb0YKVcrGx19xZbJin+sRGCQTZcb3A65qEh35/fTHTQLpHWzFiApofiJZCw
         E4f0KTOMvh+ScMmaX3UkAZc7AOUpTRx5oXHfzpfcfX1LR6O1KiXeL5MfQg9wFstEKWil
         m2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=W0eFvkxC6/6v6MGd/x6emnhmXUqGXpfFvPc0fr695gI=;
        b=AAZCqyYkZmyJ9+NenM3NZBZPpoxYyHSrYxFdmo39OIEpFoVl4PAeRsez8tmrX+dFk1
         1nkeF3dsonuSQFS467W4XPyhbpyFOZsKQoP4MpEu3s5yLFPcc9FveATuDSKtGPfxl3eK
         C7yH1koP/IQEZqyG0izyOS43mEB0YP6DnLqKS6fUEwxMUSImNEDqP3y61MIvThfR0EaF
         ZTkykuUDdXRmK0x4GewHI24KVYsgU2wueWpx1MzkGYil5tbCNAsie+DYQRxVoPFG9jrS
         Trnaa3Tyfgoivih58O9k2GZDQm9FOtHTrJ5/7dERE2mZVx/LLwqAxDR80EZcl6zk5cld
         4pjQ==
X-Gm-Message-State: APjAAAUK8RaBpkzF8qmE3D8JpKijxus4LXw+ewvapYyZht8uJaB0jgxu
        P1TdE+LS+nPoalYRAAYHYtev8A==
X-Google-Smtp-Source: APXvYqxn+UAHbLMmArJm7Hi4R0DfzBReb9YubzEEu+CatL2CUv1Gkd7cFDXyBbEHSJS6UT+4dHkKpg==
X-Received: by 2002:a37:f61d:: with SMTP id y29mr3184876qkj.338.1570623498260;
        Wed, 09 Oct 2019 05:18:18 -0700 (PDT)
Received: from [192.168.1.169] (pool-71-255-246-27.washdc.fios.verizon.net. [71.255.246.27])
        by smtp.gmail.com with ESMTPSA id c8sm806133qko.102.2019.10.09.05.18.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 05:18:17 -0700 (PDT)
Subject: Re: [PATCH 3/5] dt-bindings: thermal: Add generic power domain
 warming device binding
To:     Rob Herring <robh@kernel.org>
References: <1568135676-9328-1-git-send-email-thara.gopinath@linaro.org>
 <1568135676-9328-4-git-send-email-thara.gopinath@linaro.org>
 <20190930144205.GA11539@bogus>
Cc:     edubezval@gmail.com, rui.zhang@intel.com, ulf.hansson@linaro.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org, amit.kucheria@verdurent.com,
        mark.rutland@arm.com, rjw@rjwysocki.net, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <5D9DD006.8010809@linaro.org>
Date:   Wed, 9 Oct 2019 08:18:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20190930144205.GA11539@bogus>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,
Thanks for the review

On 09/30/2019 10:42 AM, Rob Herring wrote:
> On Tue, Sep 10, 2019 at 01:14:34PM -0400, Thara Gopinath wrote:
>> Add binding to define power domains as thermal warming
>> devices.
>>
>> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
>> ---
>>  .../bindings/thermal/pwr-domain-warming.txt        | 32 ++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/thermal/pwr-domain-warming.txt
>>
>> diff --git a/Documentation/devicetree/bindings/thermal/pwr-domain-warming.txt b/Documentation/devicetree/bindings/thermal/pwr-domain-warming.txt
>> new file mode 100644
>> index 0000000..25fc568
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/thermal/pwr-domain-warming.txt
>> @@ -0,0 +1,32 @@
>> +* Generic power domain based thermal warming device.
>> +
>> +This binding describes the power domains that can be used as a
>> +thermal warming device.
> 
> This looks like just a gathering of properties and way to instantiate 
> some driver.
> 
> I think this all belongs in the power domain provider. Make it a cooling 
> device and you should know which domains are relevant based on the 
> compatible (though perhaps we could consider a list in DT). If you want 
> to instantiate a separate driver to handle this, then make the power 
> domain driver do that.

This sounds fine. A list in DT might be needed though. I have a separate
driver. I should be able to get the genpd provider driver call
into it. I had asked this to Ulf and he seemed to be fine with it as well


> 
> Rob
> 
>

-- 
Regards
Thara
