Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF3F165CB3E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 02:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234227AbjADBLD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 20:11:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233699AbjADBLC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 20:11:02 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE074767E
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 17:11:00 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d17so11853096wrs.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 17:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zzy9IdbCGvFojyr0oHdO62u/yQAnwQX6eyPQ6r0ciFk=;
        b=Zo4i9Z/M5U97b5SJEPEcHY1lqDqDYgK0G3f22/cqAaIYRNzsl3/JaugpFnt+j5j4YF
         qrD/Mc5YRJr5ukRVJ9+VJBCf5ZFnqajgbUXbp4FZiCBAvku2QEqkj+bnG1WLGbJNIVdc
         MbpMSRSqXvFuj12m2p1MZSX2FP4AFF97+hDloTIiluVtQVoBejlw0xYVYCd9EQ819INA
         mesZ3TSEDKK8cYrSdXVfPgG8GsKzAtBO+X2XaxiT4OSCp4nf+H09ykorIO8ZSFQ7vVPk
         eNziOOwbJAX7FO9jIinbtgYnF7dxCK73HHVPl+qoppUDw1gJt060wFUjcz9bUXIIonCL
         35aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zzy9IdbCGvFojyr0oHdO62u/yQAnwQX6eyPQ6r0ciFk=;
        b=lMAnNbWRV8ee9oa14mg9nZ7qNNPzZfoaTuTJLhJkK4vxHIvuqwp7eG73VAyCtKYk2c
         MhhEs6099TgPi6/O6WuAhqpMZWacvI6d1dZH7Q5P5Dg2EvXRpCLZBZROoB+Zz7joGeGu
         bqQ/Yz7n9E4OjtpPlVTace2jXi3UxjCsyPCiRRJOn3nS5r7DVIl4eOPUQK4ZqGkx8Qxm
         mj32XpG480D+69YP3hTGmw1ngGb9zzLTreIfSo+hEF+kFIFoWgmEcCo0fq2Kc8B1Al/a
         bEFjZ2cjTtDD7MBSjEGWF9Du4mZg63gt/GYntwifL+QYyXIpfPbhRKXMNbvt/6yQolHq
         XsXw==
X-Gm-Message-State: AFqh2kpBNuedb+xnFzz7jzQtv9WkBlwGPRffLZjIuaDtjCjgfBDpNrYu
        apR8JVeo/5aT715ty3/wP/x+oA==
X-Google-Smtp-Source: AMrXdXsrRHuBZEzh7YCErWIAR5Js1jTR8JGcCsOC6j2Uf6pSUmx0GkX2ecsquw58AxEFnl0R64T5Hg==
X-Received: by 2002:adf:f1c9:0:b0:242:1d69:1ba1 with SMTP id z9-20020adff1c9000000b002421d691ba1mr34874434wro.44.1672794659375;
        Tue, 03 Jan 2023 17:10:59 -0800 (PST)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id t5-20020a5d49c5000000b0028cf987d944sm15564419wrs.33.2023.01.03.17.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 17:10:59 -0800 (PST)
Message-ID: <fbc145b0-0aa7-fde6-5736-5b175880e48f@linaro.org>
Date:   Wed, 4 Jan 2023 01:10:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/4] interconnect: qcom: rpm: Set QoS parameters
 regardless of RPM bw setting
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Georgi Djakov <djakov@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
References: <20230103173059.265856-1-konrad.dybcio@linaro.org>
 <20230103173059.265856-2-konrad.dybcio@linaro.org>
 <0e2bdaec-b7ba-0474-8b80-8901fcc87a0f@linaro.org>
 <108e52fa-e53b-220c-b0a8-b5b746aafde6@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <108e52fa-e53b-220c-b0a8-b5b746aafde6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/01/2023 00:39, Konrad Dybcio wrote:
> tldr: new soc good (*), old soc bad-or-no-effect (*), should ask QC

I think this needs to be tested before application. If it is benign on < 
kernel 5.4 SoCs then that's fine too but, it does need to be validated 
as so.

I suspect there's no silicon dependency, it is probably "just how the 
code was written" without any silicon dependency backing it up but, I 
think we need to do the work to prove that before applying.

An RFT with some interconnect settings targeted for test on pre 5.4 and 
post 5.4 SoCs would do.

---
bod
