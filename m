Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA0C530323
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 May 2022 14:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345234AbiEVMqP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 May 2022 08:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345269AbiEVMqM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 May 2022 08:46:12 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 676DC2F01A
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 May 2022 05:46:10 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id hh4so10937228qtb.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 May 2022 05:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=z9V1W249zALQzWHiAtZPoaL65EZlj/9URHZe/haLICQ=;
        b=GLtfwI+lhlzd1uVR2zN59m3yhU/Krnfw4ZVaEeTAX0yEIwZ0qmY2LNEGQMN1An+fe6
         VX56+Fz/lvlsqyI95zH9LFDsSyBRlzKn3acrCIErD8igtr1XEjgeuR5JTFj6uYKobtgp
         RbdwdcZYl0H0H1GCBLzM7W84EdVGdBrTnxSj1OzwkK/P9+Dm37+SXSxXM+DmMM1//tC/
         QRuWYmxiudtjnIIUMdOygFnmxt/Bsq+x7ij6XzCTXUvY/LZsgV42/M7wlXiL/BAAkhv9
         Oze46thssYFPQ272e8I5cIgbE5Okmh6aLRk4BCKnQuqt0Aexo5i2c+H4/HDfGpig3UC7
         b3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=z9V1W249zALQzWHiAtZPoaL65EZlj/9URHZe/haLICQ=;
        b=bHQ5Yd2YhrecfPV5/QGf5/rHfrRyrpTRW9HDs46FHTrCeyKNzTW8RY9z9VwW+EteX/
         aRtd+Ro5Zu++lUAQKlnp5ZYr+js4aJfxJmItpgT3QD3Q8Z7Wq1wHYD7SCVsN/dM6Spq9
         vx+KPGyQnlv/58+CO5uj2/PUYmQ+46XKIVKSm1aPoYKM2E0UBSBT+A+VPlC+SFh1EJg/
         jnjkGAoFmeq4Tdf+ASrRDYqQLF65vD9IX9Qg/0GJmPBYGBz0gon0ynwQJHVahypVTz7K
         TEdh8Dep56JdiShr400CjBbep4Q510AReHz13le+EkdBO+PeV4sDvyryfoBdr/7bZxP9
         60Nw==
X-Gm-Message-State: AOAM5314bfXhA4zuz84DMdFWb5JP7v36HQbF4DSrJBqrzA/VLKiuwA0Y
        bVIaoyEqyX0SP+0VBtzZNC+IYw==
X-Google-Smtp-Source: ABdhPJzGQXO+DHntP6x4u2fTddzWClTANimOTcQYK++DehFlNl8xjJgjLFDfcwG/tsnkD/M4yVGjgg==
X-Received: by 2002:a05:622a:3c8:b0:2f3:ef89:fa28 with SMTP id k8-20020a05622a03c800b002f3ef89fa28mr13604105qtx.136.1653223569197;
        Sun, 22 May 2022 05:46:09 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id q24-20020a05620a0c9800b006a04256022bsm2710166qki.107.2022.05.22.05.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 May 2022 05:46:08 -0700 (PDT)
Message-ID: <59c6347c-2689-24bf-47b8-b635fef2e530@linaro.org>
Date:   Sun, 22 May 2022 07:46:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH net 0/2] net: ipa: fix page free in two spots
Content-Language: en-US
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, bjorn.andersson@linaro.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220522005959.1175181-1-elder@linaro.org>
In-Reply-To: <20220522005959.1175181-1-elder@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/21/22 7:59 PM, Alex Elder wrote:
> When a receive buffer is not wrapped in an SKB and passed to the
> network stack, the (compound) page gets freed within the IPA driver.
> This is currently quite rare.
> 
> The pages are freed using __free_pages(), but they should instead be
> freed using page_put().  This series fixes this, in two spots.
> 
> These patches work for Linux v5.18-rc7 and v5.17.y, but won't apply
> cleanly to earlier stable branches.  (Nevertheless, the fix is
> trivial.)
> 
> 					-Alex

I accidentally based this on net-next/master rather than net/master.
Sorry about that.  I'll send version 2 in a few days.

					-Alex

> Alex Elder (2):
>    net: ipa: fix page free in ipa_endpoint_trans_release()
>    net: ipa: fix page free in ipa_endpoint_replenish_one()
> 
>   drivers/net/ipa/ipa_endpoint.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 

