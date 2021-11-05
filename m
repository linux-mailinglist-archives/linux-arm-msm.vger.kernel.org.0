Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45B9B4466A4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 17:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbhKEQGS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 12:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbhKEQGS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 12:06:18 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6910BC061208
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Nov 2021 09:03:38 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id b2-20020a1c8002000000b0032fb900951eso9889048wmd.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Nov 2021 09:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=s68XxEAQVTsbV0tiQ0iC8ThpTbLQFrCbAZYJOejjuWU=;
        b=WZNy4+rVsDTNDm9cYERP4vmFEuI5AYOyn6O+Fm8jDDNB4DPKNk3+wNX3QBRg0oiPLV
         ElOLuPozvQJ2xRfo597DUFJHrpCk0yIxEVCInREkf0a4HFyNnwAuAlGuf7ZHA0mQrT7y
         qFnlc296uLGzOc4ys0WtehThiUh0gSSVA8NjHkSOwa6wX/GOt+Y2TOkftC9qG3l2wiKC
         rZ7ckF4ezvs144xYLRost6UaGvjpVqW6FhSJRpAzrv+VVFgHhTSI3w/InkASTuZ5MRJo
         rA0v7ZT0oHFrkI9E7Rq4mhjD/t99LmFGHpimIsLZQSe3qU/LuCZsBc575c26Lpp8EmtZ
         6csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=s68XxEAQVTsbV0tiQ0iC8ThpTbLQFrCbAZYJOejjuWU=;
        b=llVAmFVjQcsPbK5sVMdwlLATC7A5FjWxCw/ja2BWUYmvJeIVmZJVAK5la6LU/GhO77
         e7NC18lAnVCpSBuWUrnS9Cjp18oO9CamuRlbAnKLxaQ6/7EbNYw5G8ZX/6QBc32kZXNc
         LayILgBOj+OOb+cS+hSPhxSPINkqtOgwZz8ndPMyTTCx9Ia01fEBE+K2kMJZhBBgd3r/
         9y/AYVOK99UqYU5BHQecs2wKVkYRkrT2MOau60qXwIy9z3ifAAp44EuWLSnCuu8Z8QHm
         jbCEI3cl49/D4MxU7ik7PsBO8/LOITWZgHxTbXfqu592r/fT0oluLFllkZ5x7yMeTYVQ
         KWHA==
X-Gm-Message-State: AOAM530v9pf/8Oh4cAC7sDF3Z2p480CzxPI/OlMWIVZ30FQvlB3Uhu0k
        XTPK78waXyYe5vWD8ncp7L0Pmg==
X-Google-Smtp-Source: ABdhPJwk5F9B0etWwFBCXvheHF5J5gH7BY6sepmL4k2YFCG8vTHMM7lBF6xaLxyQR3GplJclTlSZvg==
X-Received: by 2002:a1c:447:: with SMTP id 68mr31515335wme.69.1636128216838;
        Fri, 05 Nov 2021 09:03:36 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id h7sm8044083wrt.64.2021.11.05.09.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 09:03:36 -0700 (PDT)
Message-ID: <749a058d-a16d-3a92-25b6-97afcfaa7787@linaro.org>
Date:   Fri, 5 Nov 2021 16:05:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3 6/7] usb: typec: qcom: Remove standalone qcom pm8150b
 typec driver
Content-Language: en-US
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux@roeck-us.net, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, wcheng@codeaurora.org
References: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
 <20211105033558.1573552-7-bryan.odonoghue@linaro.org>
 <YYVG5DZJdNfZyj8x@kuha.fi.intel.com> <YYVHcHC1Gm92VxEM@kuha.fi.intel.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <YYVHcHC1Gm92VxEM@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


>>
>> I don't like that you create point where the support is temporarily
>> removed for this hardware. I know Guenter asked that you remove the
>> old driver in a separate patch, but I believe at that point you were
>> also proposing different config option name for the new driver, so you
>> could have removed the old driver only after you added the new one.
>>
>> Since you now use the same configuration option name - which makes
>> perfect sense to me - I think you need to refactor this series. Maybe
>> you could first just move the old driver under drivers/usb/typec/tcpm/
>> in one patch, and then modify and slit it in another patch.

No problem with this in principle

> Or just merge this patch to the next one.

I think this for preference unless Guenter has an objection .. 
easier/less work

---
bod

