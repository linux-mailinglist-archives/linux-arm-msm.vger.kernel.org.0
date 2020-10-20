Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88E16293762
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Oct 2020 11:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392284AbgJTJBm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 05:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392280AbgJTJBm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 05:01:42 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9F8C0613D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 02:01:41 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id i1so1164473wro.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2020 02:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q4O6c5ivLmf5Ylkh4llF14kt1PENj2Zzl8IB9YFIIj4=;
        b=m6eHkmT8IEJpYr2gcGiLGKBcZkF81y5O8Z+qXZPwHQyM4EyEn/vONmrRSoD8KUP1X+
         +zCT0rHB77mVw1NrAGD4FB0+FjB2+Pml1pNdF4eHUPW6OzP+3RCTaMgWkjDxb2oAtPVa
         Lf9ePlf8LP2nNXfB12DYW7AuoMFitb84Wq47bEvGocLpm8o+k1XlLgeqE4kURGu5SVMW
         nUzOxwwdDkDlDG9sWmobczknUQmwuEw6lSqWewhvb4A8dRKK/2xhkJGxWR73GJgSI2ET
         GaJLk2oN/ShfwRoUSXiKlub1gN9+CJ1Qr3f3iXdnWy/1iKeyvlZIrEzqCLc6V44NvHNy
         94zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q4O6c5ivLmf5Ylkh4llF14kt1PENj2Zzl8IB9YFIIj4=;
        b=MqvdSw8eHAOylInSDhvK3GrkqoZSubxFgpAN7qXS9Di71JrwwQ2EYQHM/zcLAsPsGr
         29nJqkYqsN9/WNTHWrYUrAI+9k8v+aefrNMSDakTbotfV8oYktJ4rDJlV9UoYRNh/nZi
         Xxo5IWCdD1nNOIvhzmGfQcMdLV4VzhrxwmBr1m7lf61bBDZbQW/PEHWHtE2p5Y17S5P5
         oc8FwfeNs7cjpNCl+MMIoIs4wkk5uJDM9iNfF5gsAPGoGZibaK5btvn314MCnefWUZQl
         ZdP6Qj5Jp1EdbSk2BzTHJTb9y1I+oS3fk9pd2s15pFrgD6ky4rmOhYoV99/Ic/Y8udWO
         oLXQ==
X-Gm-Message-State: AOAM532Hh6Cagt/u5OJj1CIchvoY8gbP012cKUb5DKxiIfkib+pCDuHZ
        9c4jrRZiB13tyn9+Z/ceaGEiyHAej0OvJg==
X-Google-Smtp-Source: ABdhPJzTL0aKsgR/snCSdeHOMhJQnqO/Ml9Vj2IqzAyO5HT5bSkRr7fMGxq3FQUW7rb/RaUFkcwrdQ==
X-Received: by 2002:adf:d4c5:: with SMTP id w5mr2420156wrk.226.1603184500233;
        Tue, 20 Oct 2020 02:01:40 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id 71sm2057313wrm.20.2020.10.20.02.01.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Oct 2020 02:01:39 -0700 (PDT)
Subject: Re: [PATCH v3 0/4] clk: qcom : add sm8250 LPASS GFM drivers
To:     Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20201016141241.5839-1-srinivas.kandagatla@linaro.org>
 <160314732379.884498.15569172477533491589@swboyd.mtv.corp.google.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <af7d64f5-aa30-2965-3c2c-ca72aed1ae49@linaro.org>
Date:   Tue, 20 Oct 2020 10:01:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <160314732379.884498.15569172477533491589@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 19/10/2020 23:42, Stephen Boyd wrote:
> Quoting Srinivas Kandagatla (2020-10-16 07:12:37)
>> This patchset adds support for GFM Muxes found in LPASS
>> (Low Power Audio SubSystem) IP in Audio Clock Controller
>> and Always ON clock controller.
>>
>> Clocks derived from these muxes are consumed by LPASS Digital Codec.
>> Currently the driver for Audio and Always ON clock controller only
>> supports GFM Muxes, however it should be easy to add more clock
>> support when required
>>
>> Changes since v2:
>> - updated Kconfig text and help as suggested by Stephen
>> - removed unnecessary header file include
>> - use fw_name instead of name for parents
>> - use devm_platform_ioremap_resource
>>
>> verified dt_binding_check to pass on linux master,
> Which linux master? Can you try on linux-next?

I meant linus master branch. However I learned that Bot runs only based 
on rc1 tag (5.9-rc1 in this case) which is why its still reporting this 
errors even though the dependent patches are already in linus master branch!

I will resend this version patchset once rc1 is out!

thanks,
srini
