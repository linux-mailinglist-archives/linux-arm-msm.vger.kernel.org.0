Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EEE5651EC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Dec 2022 11:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbiLTK03 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 05:26:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbiLTK0R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 05:26:17 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3721ED69
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 02:26:16 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso8389384wmo.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 02:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4RYuujFw7tzeiIajfN4hmE1N1EVgTyDYADTMYOS2Fnk=;
        b=zHRwPfp63Mv3Lj1JRru1xRcyYpOCXpr2kHVGGCQAxPRhhwwNTbi0SRvenEzrDu7EZD
         /oS6LebKjWRSsGL6TBYPf+AlXslUsHVwIs9X3AoEKYYprQ0KoLj2EYtfEjzhPaKMhQSk
         nnPM00vKhNQsP/QNffZcKppKz0JWwq0iTsd88knfGR7PWAlYYQS1wmqncI7tFvuvSDxe
         ORam5WV+GSm86TvD6p740jc2zFn89W4H29VSIdeiY9l1iI00KM1Yvwa7Ljs9kMQY/Hjf
         RC7aVHrOn08GD25EMDlZWrYnUPmq/hDJ/MwrEBMMoL76dvhm3tyxoCq47/cWFx2FMhp5
         ILlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4RYuujFw7tzeiIajfN4hmE1N1EVgTyDYADTMYOS2Fnk=;
        b=t2Pk0T3idA9gWfMDq8xEJCHmBtR2gdI0jkQ3HlM93ibHejs+q5n6C2YjD+ebhW32C9
         UlT9mOiQcwsRbrw4hy0WrSHbmnbiXVoeH+qnkeRAla2Oq7N5tAu00GLevHooU9dGsb6D
         b8+ZxDtMbYS3d10F8i11KnNDSy9zkorbj5F8qh6DRXTyzDs/vAkRN8Mwo+8G3dXifF8S
         o8je/knVMg2+HJeNZdozDk0xlfqsrXgn/Z7wdwC1E8vlIhYC6tDpOQio3qYQtPlHm5n9
         g1BQmRePBDarjVPKMciuHXBvHMk97gns8c19tcX18fzu98XVxzJ7EpizqTurwwpeRORe
         w2rQ==
X-Gm-Message-State: AFqh2kr30XTkcQJvSAoTs92hE4clSSexq5MfUWKExBjwdhILuDK/akFt
        N+67KkNBm/PrFo8Thm/HVbWOmA==
X-Google-Smtp-Source: AMrXdXs4AlYscxSxHGeG8BqlrM0dGf2Is9M2vpRO/z9t21AhKhASITL8X0N2UIRkNtiqNaCOobTrcg==
X-Received: by 2002:a7b:cc85:0:b0:3d3:3c93:af5e with SMTP id p5-20020a7bcc85000000b003d33c93af5emr13284088wma.35.1671531974819;
        Tue, 20 Dec 2022 02:26:14 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id q14-20020a1cf30e000000b003cf6a55d8e8sm14882608wmq.7.2022.12.20.02.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 02:26:14 -0800 (PST)
Message-ID: <5bd2c0cd-741c-8865-5f35-25baf6787480@nexus-software.ie>
Date:   Tue, 20 Dec 2022 10:26:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 08/15] thermal/drivers/tsens: Drop single-cell code for
 msm8939
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
References: <20221220024721.947147-1-dmitry.baryshkov@linaro.org>
 <20221220024721.947147-9-dmitry.baryshkov@linaro.org>
 <78fd7174-9aa4-f067-72ca-514c8fb09ee5@linaro.org>
 <d0a6b9cb-f321-7d5b-5767-acd12cfd78f1@linaro.org>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <d0a6b9cb-f321-7d5b-5767-acd12cfd78f1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/12/2022 10:21, Konrad Dybcio wrote:
> The point of this patchset is to remove logic like this, as it's
> very repetetive and all it does is read fuses with a ton of magic
> offsets. Dmitry pushes that to DT with the generic nvmem API, so
> that instead of these magic &s and <<s, one is simply supposed to
> define QFPROM fuses at the correct offset and with a matching bits=<>
> property. This does not remove any functionality, it just changes
> how the fuses are accessed and makes the code more generic.
> 
> Konrad

Hmm but then there's extra work to get this working again on 8939 right?

Seems very dogmatic to drop working code for want of sending a dtsi out.

Certainly my preference is to keep exiting working code and just 
complete landing the relevant dtsi, rather than eject working code and 
have to do the same work all over again.

---
bod
