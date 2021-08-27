Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720193FA0E2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Aug 2021 22:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbhH0Uuv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Aug 2021 16:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbhH0Uuu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Aug 2021 16:50:50 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C118C0613D9;
        Fri, 27 Aug 2021 13:50:01 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id u14so16380403ejf.13;
        Fri, 27 Aug 2021 13:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KasoWwT+Q4gofr9QBSjUL1Cy40NSgOuJugmN8Oq4nsE=;
        b=By+JlkafpyWxPZomHEu2Y2TyodMM0TU543YMHcTvIy2L+aTaEoRyk2J8dVpk3WVub1
         mPAadkKwt7guXNRr++RlV7BPEbFDe3XIrlT1RGF8s3D97H9h+xCDFGSKPhiToPLMhI9V
         O4unzIRx3Q8C7zMZeU7kKlMdzZeEoTEFA2Iis/zM8d5U5Cff9dG57YR+JyQbHS9PtT13
         JoIs0zChUHjvQfxC1f5T+5VjOOK60YCHl8p8q8jX73tu1jNxp2B1a9ttlDHMv1Xb+GiZ
         c6LlNlwSmoDgiQV9WS5vMk9VLkBM1XYhwuT3bp/4gcuK+2cN56FpoXLz8dCzEdyzivdw
         XHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KasoWwT+Q4gofr9QBSjUL1Cy40NSgOuJugmN8Oq4nsE=;
        b=EBsVbeSqHKX+d0pt7utjdjk8mtD3QJLY/IW7VhtOqY3RM5hbXus1IYK8N5A3MoYokn
         LQTUV30LNeJtLk0T6a8/7p+4QsXJkksAREzzP9Un4icsP0kJ4daDmQEo1xKj2wxrw/F8
         V8Cq+jKqkBaxA8Mh67ppTDfMf9vsyqS7YW5Z9WzGyYgUUOc07+3+/nprBTzSSmBrHH0y
         lPg7d3OOHzQYOnrBOK7Uw5/IQ6KRo+d3XOva0zGMY0LFJ8Qr5FGDg49HfjbhqoNwMkqH
         KDrI3t7Bkf8/PTxvKdZK45jnOJOjykGD6yuoEw4oGkHMzNK0y1oxlruXhhTMfLaLsSPX
         PAVA==
X-Gm-Message-State: AOAM530YS6Q3FkiF/h8nZeSyF6Kd1XGl7E1sYk4RJwa/jY2/zk9OLjZS
        yD2mJZWFxa1AUwbiaoRtq3g=
X-Google-Smtp-Source: ABdhPJx2+g1sK5VxQEGFGoscts265WqnlDMr+9lMq3kOysNCtnz5SSqKD5X7moIfAQoTeiuOzLkNxA==
X-Received: by 2002:a17:906:3589:: with SMTP id o9mr11975443ejb.150.1630097398595;
        Fri, 27 Aug 2021 13:49:58 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:1b32:912f:78cc:6c61? ([2001:981:6fec:1:1b32:912f:78cc:6c61])
        by smtp.gmail.com with ESMTPSA id k6sm3810520edv.77.2021.08.27.13.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Aug 2021 13:49:58 -0700 (PDT)
Subject: Re: [PATCH v2 0/3] Revert "usb: gadget: u_audio: add real feedback
 implementation"
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ferry Toth <ftoth@exalondelft.nl>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        Lorenzo Colitti <lorenzo@google.com>,
        Wesley Cheng <wcheng@codeaurora.org>, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        frowand.list@gmail.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>
References: <20210826185739.3868-1-ftoth@exalondelft.nl>
 <YSiiAsrCaxOn8myU@kroah.com>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <1faf1ad0-25eb-4d78-98d5-4612b8b8f3be@gmail.com>
Date:   Fri, 27 Aug 2021 22:49:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSiiAsrCaxOn8myU@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi
Op 27-08-2021 om 10:27 schreef Greg Kroah-Hartman:
> On Thu, Aug 26, 2021 at 08:57:36PM +0200, Ferry Toth wrote:
>> Although there is a patch resolving this issue (see
>> https://lore.kernel.org/linux-usb/1jilzsy8g7.fsf@starbuckisacylon.baylibre.com/T/#u)
>> it needs a little work and will not be ready for v5.14.0 release. Until then
>> revert the series.
> 
> revert the series for what?  5.14-final needs these reverts?  Or are
> these for 5.15-rc1?
> 
> confused,

Apologies. Yes, the idea was to revert for 5.14-final as the series 
creates a regression.

However, an updated patch "usb: gadget: f_uac2: fixup feedback endpoint 
stop"
https://lore.kernel.org/linux-usb/1jfsuvw817.fsf@starbuckisacylon.baylibre.com/T/#m922149b7e74204c8ed1bed2c624910ab4eafd43c
now has been acked by Felipe.

If we can get that it for 5.14-final it would be less messy.

Can we?

> greg k-h
> 

