Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF1544EFE1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Nov 2021 00:01:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbhKLXEI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 18:04:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbhKLXEH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 18:04:07 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACA8C061767
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 15:01:16 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id s13so18153868wrb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Nov 2021 15:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vc+ozzegQu9E060BWyNWE6QYi6X3ewwqh8BLUJc9Afg=;
        b=L+Y/HehTTOAHNMJTXcZyxIi1eFGVjS7HuEyu9bSNGLfOh7gTwl10LpbmklxM9741XC
         kHtpX5n88Z4g7Yu4yh4sG0i1dUMkX+obauYPx65dCWNaXd/nmvOL1FmXpWOgh1NPBl30
         33ptRRA02umH08gWy7DqOTCTu6tSeE5nJD8MWqUrzWd5LlH72reVB8TQJRldnfz5dJEn
         2mMM7E56rHpGdR9I0EFKOwwe5v0mcRjnU7/Fh/rfQ36DflKEYyodzmV4aZNhX639Apoh
         rMxL08Bvpkqm+eTE4ZNLbqFkJiYktvScquxGF31bhPVFaaeNpwVXY/r1r1aKU5v50yDL
         3BCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vc+ozzegQu9E060BWyNWE6QYi6X3ewwqh8BLUJc9Afg=;
        b=r2BfttVoDXzkykhzD5fH+VA0pAZLMmLZhdyYSw8WQ5Ybmz/VGDO08dm/vNsHOXesZe
         mPgIYIsa7IEn0XgwZV48RUz7CPjx/nsDlrw0xCxzxEcQgYaQqsUjK6au0aapZZ8NRJcu
         VOTV9BThhhYnoSTd77Q7Wu//6AuBhT65kk9lqhFAd3HKS3nc0a/WFewetftdtPVOwVXT
         ku2VkM4RNX0QGcVc8tz7yaUCb80hHcr2KxHzjK4ywQvwk5UShQtRRxx4eqmAYitibBMx
         6cHEwuzgbSHGfPuXYBOw/onV4lKaFIQtPtkXfbEt2q9hHnVAQcZagwCOe7ZOYxjbJLgO
         36Lw==
X-Gm-Message-State: AOAM5325ISZShp8vpq0uapeI8Fs4S0t7FZikdQxEJGvhrwP3E8oNXMrM
        ZsmO45ibBNieQSsn6lYxikICCBKWtB+7ohqC
X-Google-Smtp-Source: ABdhPJzl8b1hRH5zxaTKqUesqVewP4iALaU9dSBVgJ7MJ64/+XclXmFexpLIQdymL1AtDiO9sH+xtw==
X-Received: by 2002:adf:f88c:: with SMTP id u12mr23491919wrp.29.1636758074601;
        Fri, 12 Nov 2021 15:01:14 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u15sm7753483wmq.13.2021.11.12.15.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 15:01:14 -0800 (PST)
Message-ID: <c2716d3c-e9ec-eb43-1bca-dfbdd7217cdc@linaro.org>
Date:   Fri, 12 Nov 2021 23:03:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v3 1/7] dt-bindings: usb: Add qcom,pmic-usb-typec
 dt-binding header
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, bjorn.andersson@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, wcheng@codeaurora.org
References: <20211105033558.1573552-1-bryan.odonoghue@linaro.org>
 <20211105033558.1573552-2-bryan.odonoghue@linaro.org>
 <YY7qcrf3axIWcQni@robh.at.kernel.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <YY7qcrf3axIWcQni@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/11/2021 22:28, Rob Herring wrote:
>> @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
> Did you check with QCom on this license choice for DT files?
> 

Hmm to be fair I'm not sure this matches the original header downstream, 
I will check again.

---
bod
