Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5B571561ED
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2020 01:28:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbgBHA2e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 19:28:34 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44972 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727309AbgBHA2e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 19:28:34 -0500
Received: by mail-wr1-f66.google.com with SMTP id m16so865744wrx.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Feb 2020 16:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=soWAD8UNijAJb7SHutHwxxBAWeNh89k1vOpxcKcfupY=;
        b=Rq+8kIqJ3e0cTG7areebQpeL5NmWDETx87Z+Q1RTs2pwBS4e/iV+ReWWbbHTpVeu21
         WMZ2Wa/qaTVJjkCRtipWIGitiWe2oOoMBC/KOTmy+Q/SyHJifvj+Ha6QylV0/rdL+blZ
         0eSV4GNC0CRK0KSmfg5R7a4YqXnHBbAl3uTP4DJhsmp0o0NH/SJ5GaBav64HSV4+jvzs
         BOXXS/o+/sDYGH27Jd4xZzTz5Sni46L0o/CDmLhRU1PsfPA2iGOvrowtImgQxuACpsav
         sMIzLkn9ba+aBiF5ZnRKDVb1+3Wvc7mVYU1P/Rr6ncewadY1QNMyGKHvnivi5mr5B4MB
         BnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=soWAD8UNijAJb7SHutHwxxBAWeNh89k1vOpxcKcfupY=;
        b=rmCtO5Yf+tdjYw9Bc+7bAynX68MFlVJEVbvnAtJ09OdUIJ1oEJgom2+5MnEU7noinw
         FikEMb4ezRix4perC84IElPqGBvi/zFEF3qT8/y2Kp/8gyV4SBp6BwnGuU0FC+OjSbL7
         vPZLhiK1DrLbAE0sxX9g/kIbzNrx09vBv7ytYZT7FL3i/k1P8AbfE4JnMZOcCKF00uw5
         j0VChdXT6EcJmK2SrKdIEik4QGkUJRVavsx+6mbWTGx4US4nLOnNsusoV5RtD5rbO0YL
         IlOh2hskmw1vGv2M91Q02IcXUENRb6glqS8OTHEbqJrtu5g9sUTkOdybWIWMibbkyE+w
         cXSQ==
X-Gm-Message-State: APjAAAUVs1nnXaYQSuKVOLuANcQNlYvbeZuzccdCpPbeCqCrvrG4LEZn
        dRwl5jmNISDglyQd+GyTRlYKTg==
X-Google-Smtp-Source: APXvYqwpCvKOJ+uTpFQDfPG7Et4tMAqIsOquaCQjzGt7yEWxxkI5+rj4ldwoYGEx1NnuOzKik7RqTQ==
X-Received: by 2002:adf:ab14:: with SMTP id q20mr1592820wrc.274.1581121710957;
        Fri, 07 Feb 2020 16:28:30 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id h17sm5668150wrs.18.2020.02.07.16.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2020 16:28:29 -0800 (PST)
Subject: Re: [PATCH v5 11/18] usb: dwc3: Add support for a role-switch
 notifier
To:     Jack Pham <jackp@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20200207201654.641525-1-bryan.odonoghue@linaro.org>
 <20200207201654.641525-12-bryan.odonoghue@linaro.org>
 <20200208001520.GB18464@jackp-linux.qualcomm.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <9e653a9a-2fc4-645c-ac33-d9826a7ecbd9@linaro.org>
Date:   Sat, 8 Feb 2020 00:28:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200208001520.GB18464@jackp-linux.qualcomm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/02/2020 00:15, Jack Pham wrote:
> Hi Bryan,
> 
> On Fri, Feb 07, 2020 at 08:16:47PM +0000, Bryan O'Donoghue wrote:
>> Role-switching is a 1:1 mapping between a producer and a consumer. For DWC3
>> we have some vendor specific wrappers, notably the qcom wrapper that want
>> to toggle some PHY related bits on a USB role switch.
>>
>> This patch adds a role-switch notifier to the dwc3 drd code. When the USB
>> role-switch set() routine runs, the notifier will fire passing the notified
>> mode to the consumer, thus allowing vendor specific fix-ups to toggle from
>> the role-switching events.
> 
> Neat! This could work. But let's see if Felipe likes this approach.
> 
> If you need, here's a
> 
> Reviewed-by: Jack Pham <jackp@codeaurora.org>

Appreciated
