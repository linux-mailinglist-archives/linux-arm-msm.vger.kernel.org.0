Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6001E7D4CA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Oct 2023 11:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234143AbjJXJkN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Oct 2023 05:40:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234170AbjJXJkL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Oct 2023 05:40:11 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58DB110CE
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 02:40:07 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4084e49a5e5so36427895e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Oct 2023 02:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698140406; x=1698745206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s5f7lk/sUG2K+sQIa3tjkVyEh0bsGlRfNvy9ZFNdKNY=;
        b=QTQWkmhc0BqLIA8qDMKzNV2MkliYchZ7Dxm897HUywGCxC6j1/b4focsMmuvLrL8PN
         TPChlrWSht0h/dOBDIxH6gl092z6jR/R4HGSp6S+WChgS/XoiKQPozVztn0SBb45GXup
         rMmiTJa5HJ/CjvaqQfDzIsgrMLzvgesglTxeNPv3ScBwUJGKu3Uli7AvoCkaxFBefguZ
         HGFnWh+IWNEtazj99eEbtJGSMw9QQLm2ONhy3arCjh78WB5t3loK74+LsbB/cSDetIWm
         OjciaiQGT79d/r0Ss7chH0bDBfdrpIT5HcLtanr82JCIGfw9+5WKrSKfBR2Amy5fMUXe
         j4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698140406; x=1698745206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s5f7lk/sUG2K+sQIa3tjkVyEh0bsGlRfNvy9ZFNdKNY=;
        b=JsAK/GGGRAM35xAejom5PsMBqmusDbP3DlLcj8j8AE1Be7ejtbu3VR8ubeq2EZvXJa
         w3YC/ezMf390HicePTVcKuXIEp6RXgiVuublwQ6JHfPmjM3cbIbNQzrjYptB4I18Lu1G
         Pj1NgcYAtBtItKhRPSh0k9cTTErN6ZxVMxuHnRUi1LBQGw1j+wFWZKhxoMb1fwX9XmRB
         vC2+GHQXYKKw78DR+s7AZSePRXIxvHOwTNBEnnxvG40Y51CDLpt8qic8/QO3TRmq4q7V
         uGvDhe4nNF30KtQ3aNJu+4n9m0AIcLnVsMZXGxOjBjyBlLiLjYCKI8CjeUJqidvp08KV
         7gng==
X-Gm-Message-State: AOJu0YzyBK5AbskXVaMfroskjRQxIaSRD+ml2rUZjRb9jC+uI6xKV+qu
        42ky20qyQXXnPbN6/OdMTBwjgg==
X-Google-Smtp-Source: AGHT+IE5TFlYkZdpsRZM+iH9l+SKXhZgWmaMXLLCnEWvyFWT59f5AvnVu7eLhTN1BnA5As6Hb9uDhw==
X-Received: by 2002:a05:600c:3109:b0:408:5bc6:a7d with SMTP id g9-20020a05600c310900b004085bc60a7dmr6475543wmo.19.1698140405732;
        Tue, 24 Oct 2023 02:40:05 -0700 (PDT)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id l22-20020a05600c1d1600b004042dbb8925sm16576200wms.38.2023.10.24.02.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 02:40:05 -0700 (PDT)
Message-ID: <866d5582-a4e2-4b98-a291-6e41939bd9f3@linaro.org>
Date:   Tue, 24 Oct 2023 10:40:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3.1 3/4] clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC
To:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org,
        andersson@kernel.org, conor+dt@kernel.org,
        dmitry.baryshkov@linaro.org, jonathan@marek.ca,
        konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, quic_tdas@quicinc.com, robh+dt@kernel.org,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231023153821.189331-1-bryan.odonoghue@linaro.org>
 <20231023153821.189331-4-bryan.odonoghue@linaro.org>
 <aef93a48cf270d5078ccdc39d95113a4.sboyd@kernel.org>
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <aef93a48cf270d5078ccdc39d95113a4.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/10/2023 01:34, Stephen Boyd wrote:
> Quoting Bryan O'Donoghue (2023-10-23 08:38:20)
>> diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
>> new file mode 100644
>> index 000000000000..0631bd5fad57
>> --- /dev/null
>> +++ b/drivers/clk/qcom/camcc-sc8280xp.c
>> @@ -0,0 +1,3048 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2021, The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2023, Linaro Ltd.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/err.h>
> 
> Is this include used?
> 
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
> 
> Should be mod_devicetable.h instead?
> 
>> +#include <linux/of.h>
> 
> Is this include used?
> 
>> +#include <linux/pm_clock.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +#include <linux/pm_runtime.h>
> 
> This got included twice.
> 
>> +
>> +#include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
>> +
>> +#include "clk-alpha-pll.h"

You're right, I didn't scrub the autogen headers.

Update sent as v3.2.

---
bod
