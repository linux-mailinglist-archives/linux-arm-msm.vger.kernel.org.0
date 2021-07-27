Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 719A33D7DA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 20:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbhG0S3t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 14:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231836AbhG0S3s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 14:29:48 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B8F0C061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 11:29:47 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id l4so16293811wrs.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 11:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rHRF5Z6zV8T8deErhjvinL45ZW5rIgTPGE0mB00ml4s=;
        b=gCZcVysrYiWMN5aPRmyk7hsb9ZBGp/H1b7ahCwB2yq8bWgYzJt3ffNc9AtQ9NbQwKd
         LPwQiuOJ3zVcV9nDogJilvocjFC+jywPs9+oT6Y2cIvQdjieYPVepGFsnQr4Yi9ronca
         6iA0xvVsmfxudjzDVZQraUuHi3XZBIDWS7cfoiTG7px2i29LHVeQFjQGgTy/jxnuSCcr
         jYxrr7F3IT9KTllnK7u5Z9Gxtz9ymq5/8G4VTVpaPZscrwAML+upmlYMy+fmexjd7A7T
         pvkP6iVL4mCWdQkK5lwVTYca/u/m912ZMYfkIhuZJVrykmP7BNNL/Mz8w6J6UBiusE1u
         u70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rHRF5Z6zV8T8deErhjvinL45ZW5rIgTPGE0mB00ml4s=;
        b=t5Sb4T0b4ep4W70zzTM+BWsLEhPPh9YiREMNsDJ5KMrpFUSfIoa5cl7OLAFSoExLcq
         RXWqANYehflvVjwB3EL1I50tllLeezSAJAM5z2MDdGNBbZG5r/wAc2UGDsXDXdecoiex
         ZOzKg93Xol5m72DFJmAJg/cjvqreQoJ+uEOwk0KA/tWfeaA9M+AAqha5DCbAgRMil9Qj
         G6WIQoZNnFwUHC9yprp5CGOFSLw/Y25mM90uTCX1Y48BZ9MANT6XXhBbKWKQoc2zkDP0
         /cGlCOXuzShz3aBel0ICI98QgrT66xJXgPiSxNW9CAu45K2HEihTgHH7hCOnycrA31Tk
         tddA==
X-Gm-Message-State: AOAM5310vnNtOcNyOb3lMrfsoO6niI/ALoKIIWgUbT9jm7iKH9sl/YPj
        gqmhJAXIDLX8KY/IaPvw5Zg9vw==
X-Google-Smtp-Source: ABdhPJyODHtevLdPwHjQgbTFElV3zPUd75YyjAlJrrvtSAZImk6a6O9h1zqZqThsFed9LIxZty0IDg==
X-Received: by 2002:adf:ef8a:: with SMTP id d10mr26168601wro.359.1627410586130;
        Tue, 27 Jul 2021 11:29:46 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a8sm3870103wmj.8.2021.07.27.11.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 11:29:45 -0700 (PDT)
Subject: Re: [PATCH 1/2] clk: qcom: camcc-sm8250: Fix absent mmcx regulator
 reference
To:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, mturquette@baylibre.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        dmitry.baryshkov@linaro.org, jonathan@marek.ca,
        robert.foss@linaro.org
References: <20210708010839.692242-1-bryan.odonoghue@linaro.org>
 <20210708010839.692242-2-bryan.odonoghue@linaro.org> <YOZ4+ptO+eQbmxal@yoga>
 <162741055915.2368309.10049224467908332702@swboyd.mtv.corp.google.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <ed6e31a9-fb07-458d-e791-d2ebad0b8fb3@linaro.org>
Date:   Tue, 27 Jul 2021 19:31:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <162741055915.2368309.10049224467908332702@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/07/2021 19:29, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2021-07-07 21:03:06)
>> On Wed 07 Jul 20:08 CDT 2021, Bryan O'Donoghue wrote:
>>
>>> The current implementation omits the necessary mmcx supply, which means if
>>> you are running the code for this block and a prior clock driver, like say
>>> the videocc hasn't run, then a reset will be generated the first time we
>>> touch these registers.
>>>
>>> Fixes: 5d66ca79b58c ("clk: qcom: Add camera clock controller driver for SM8250")
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>
>> camcc isn't enabled in the upstream dts yet and I expect that we're
>> going to conclude on defining these GDSCs as subdomains of the cc's
>> power-domain in time for v5.15.
>>
>> I don't mind if Stephen picks this to make sure the driver is
>> functional, but I will hold off on the dts change.
>>
> 
> Seems like this is superseded by the GDSC patches that use subdomains
> instead of a fake supply?
> 
yep
