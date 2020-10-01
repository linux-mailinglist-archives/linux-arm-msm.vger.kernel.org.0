Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E7427FB31
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 10:15:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731189AbgJAIPI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 04:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgJAIPI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 04:15:08 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FBD5C0613D0;
        Thu,  1 Oct 2020 01:15:06 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id b19so3846763lji.11;
        Thu, 01 Oct 2020 01:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aUUVeqRwkBYrQVEK/UzZRxRNNQt/Zxuufn7DOR6D2tw=;
        b=r80diBXJwyeo0EkkDukjWFUW6oDkzGj3hQk88hB5dKgc1vckC2eoYJ06DHuGPp6CbJ
         LEr5NIY5d9jOlwMkTPdTIz1mDS2K2fHa/INEJpwyzBjg+Ps44cKLHB/bt5rJd74Dumc7
         lDTpEAmYo0n7Fai56DU/URyBj5vTHKz9C9Vv+Qf/L/9An+bVaylj5OVfx74J8M3BZRe8
         qu9XaCEvPFr3MH0iwZej65tdmExqH+Nk2ijEImUlbL++ZMj/2aYrk1QN0WZF+lFlORlH
         X/3/rw+bsRikyJVgnGuj/0g4hbpkf7rxt5+rlzdcydonvubgV9n7ReQKEirYnvCIhAhO
         Rhlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=aUUVeqRwkBYrQVEK/UzZRxRNNQt/Zxuufn7DOR6D2tw=;
        b=JYSA/44rIAHjTj1PofP0ERnyv3SdOjdruYR2q93dIawqu+K7xDqP8gcndc6B1GzvsW
         aNwDuQEOCE9XkBzwtaSMOGICsLWnBjDXrbW0sO4Yi8dAqM6zFtz+N5FDzDrt/62B/wT/
         NOKWiPxwsaBwmG1oet2+zdJlR6/Icb3fYqC6NxmV2zx1TECpPBesKtYKSsfRYXZV8mRn
         qppcAhrz7uWnseFtRyZy8byZvP1RMtKTYfwy77DQERlzbajBRuejd6GzpdA7g29lz+UR
         leBJF4tQfyGsiX44S50xT91Jwg5hxjP9z4TOqE9xX8ukthhC5sbWjTlq2v8wjJIEoZwM
         5wBw==
X-Gm-Message-State: AOAM530a0GM7AcprwDujYUxVx/XfnTPx7uuDfzHXWL5CZrjIK1cLk/Ip
        xHccbo7uTot0poX49vlJBde/1BK44sdRNg==
X-Google-Smtp-Source: ABdhPJwJ3p25brycCQk0ug1xWVQXq4mMwgUt1thwnF1wAjjBckD3tyMvnHgJlqZSngFMrtfBm+kXgQ==
X-Received: by 2002:a05:651c:505:: with SMTP id o5mr2071308ljp.177.1601540104970;
        Thu, 01 Oct 2020 01:15:04 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:429a:7583:e8d3:5f22:8a90:2c65? ([2a00:1fa0:429a:7583:e8d3:5f22:8a90:2c65])
        by smtp.gmail.com with ESMTPSA id 192sm467509lfb.154.2020.10.01.01.15.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 01:15:04 -0700 (PDT)
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: sc7180: Use pdc interrupts for
 USB instead of GIC interrupts
To:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
References: <1601376452-31839-1-git-send-email-sanm@codeaurora.org>
 <1601376452-31839-5-git-send-email-sanm@codeaurora.org>
 <07de71c5-71d0-fbf1-8aa7-c039aeb9dffd@gmail.com>
 <160151435796.310579.15010135021160402839@swboyd.mtv.corp.google.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <e04f3a59-6b65-6bfd-3589-11c985912dbb@gmail.com>
Date:   Thu, 1 Oct 2020 11:14:51 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <160151435796.310579.15010135021160402839@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01.10.2020 4:05, Stephen Boyd wrote:

[...]
>>> Using pdc interrupts for USB instead of GIC interrupts to
>>> support wake up in case xo shutdown.
>>
>>      s/xo/of/?
> 
> No it is xo. If anything it could be capitalized because it's the
> pin name and usually stands for "crystal oscillator".

    In this case, "of" is still needed. :-)

>>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

MBR, Sergei
