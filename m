Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BED314EDAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 14:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbgAaNnp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 08:43:45 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35252 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728514AbgAaNno (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 08:43:44 -0500
Received: by mail-wm1-f66.google.com with SMTP id b17so8744952wmb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jan 2020 05:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+Z/QqKPZRNPOFz7Xr+UvMoQ/x/R9CxVbSeJizVEab2M=;
        b=fzWaT5awKSTprWGNFjvI5CWYnpVIrcnpr/AbZvBQFVBcyiGG+bYBV2uAED78hSAEz0
         7zsFtBxH85RtgleESDclo/phjJl0zeCBDiIqdBdt/oDG636i/yRAF9NlJVHdUemRVUy6
         vC+sSqdEcIgsBUtMrVwGouKeiHl//FBWO1Ln3kPU6kgmjlyo4w2yQzhCLbWSkMMS+K68
         +ixaKPMOyhESZQw4ZJWuPLJaVEhp/KetXJBZKLrHAMXkGY/3LQktbA1oIoL8nNdoWdyM
         l6zu1UeE01BWgm8s5Xnw22cGgb7DrvNxpuTfTXMdjPGN/k4oj/XEp+RQRAN5+N+mQVTh
         TfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+Z/QqKPZRNPOFz7Xr+UvMoQ/x/R9CxVbSeJizVEab2M=;
        b=fhAqFZBPMYUr3TkZjwu/G19GIJsdlGj28lruqj8+2LsoKWyq35Y1zk7RoVcZ8gM18s
         limkJvNjFqo8JUewcoynBISaXgJaLxEr6QGJe7xlnEd6WfrtikBvA7nLC2q/Ag1+hFnf
         ixniqS7BHrZ+pGK2Pwb8Eth2ZKY9YrNxbMvrNHMPVsoKY6DEQpo2/L70OsQjpN1Hg0IX
         y7QN5mDbb7IOH8eCzvFfLoiog8E5BaNhz3PCHSifSrd4N2JvbmyyD9g/sA31cR7iJ0++
         zRaqggXhixQS3P74qEOE86R/YuHV8ecw3bDPGofxDNostr0/qrOYPh9ISkUZXq9EyOtn
         08/A==
X-Gm-Message-State: APjAAAUVh9AqYddzUjeG9c90Qx/qsggon37ynzUzj1FO5VL9UtakmNRh
        6rgMDAugBqlKXsf5k9bLcMhHWA==
X-Google-Smtp-Source: APXvYqzt/Q19RKB5qlDxzHOJGecKCDHb2QXQ847rq1x4DycbKl05VzkB6sXzwu8DxSWkFSpV18idNA==
X-Received: by 2002:a1c:2358:: with SMTP id j85mr12487076wmj.28.1580478223062;
        Fri, 31 Jan 2020 05:43:43 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id g25sm16185615wmh.3.2020.01.31.05.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2020 05:43:42 -0800 (PST)
Subject: Re: [PATCH v3 10/19] usb: dwc3: Add support for
 role-switch-default-mode binding
To:     Felipe Balbi <balbi@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        jackp@codeaurora.org, bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, John Stultz <john.stultz@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        ShuFan Lee <shufan_lee@richtek.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Yu Chen <chenyu56@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        devicetree@vger.kernel.org
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
 <20200122185610.131930-11-bryan.odonoghue@linaro.org>
 <87o8uj7nzj.fsf@kernel.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <9b95478d-5ac7-3dfa-a70e-1dd881bd5b2c@linaro.org>
Date:   Fri, 31 Jan 2020 13:43:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87o8uj7nzj.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/01/2020 13:29, Felipe Balbi wrote:
> 
> Hi,
> 
> Bryan O'Donoghue <bryan.odonoghue@linaro.org> writes:
>> From: John Stultz <john.stultz@linaro.org>
>>
>> Support the new role-switch-default-mode binding for configuring
>> the default role the controller assumes as when the usb role is
>> USB_ROLE_NONE
> 
> per specification, device is supposed to be the default role. Why isn't
> that working for you?
> 

Speaking for myself - its only the role-switch logic I need. This patch 
seemed to go along with the the role-switch stuff but, now that you ask, 
this series can probably do without it.

---
bod
