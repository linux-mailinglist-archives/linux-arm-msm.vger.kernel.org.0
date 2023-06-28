Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0CA47416E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jun 2023 19:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbjF1RBk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jun 2023 13:01:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbjF1RBi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jun 2023 13:01:38 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC9FF13D
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 10:01:34 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b6afc1ceffso846341fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jun 2023 10:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687971693; x=1690563693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a3jAXCPA5P+oVcmiN1WqMULNs6BS64aNdqUj2F01rxk=;
        b=JXjOOZhLiMYaMktPkAQHsDkRVYnrR7x0fyeIJbGodzzLMZLiTdE+SU4FGDi1H4MPFe
         8cfjIGdPo9uvQheVOA+/oUDBMKu4gcEhlvkzZr9p0Vy4LlEDs8cbDUKPsr4C5D5Hwj+t
         OxidHzNdgZnbsMlEj0GCUK0Rvb+6tGxzHh6dw0Lf829Yxtk687zCOdVOQW1Aogcg1FKu
         QtGt8Zt0tUlSOQBZMB1ctj8Uzz1bQDphIaI4K8bfaW6LIbGUpkgGo62t1tQf58OpktLQ
         73XcagisOFC29hOPsSMofM+ieEk+KN096XMrK6qf02n11iLoZMvq8UhgfsArQm7DTX7E
         1Q0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687971693; x=1690563693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a3jAXCPA5P+oVcmiN1WqMULNs6BS64aNdqUj2F01rxk=;
        b=QI6oI5qhVNcEG4KQne3rlz4ldmadKlsd6jHjpNYe9noxoH3918aAWGiAPkhte8Ror8
         UVhgzOOszHfS3mAgaVGDAMzi4YH36X77NjM11qP4yZdeEEFJaRVQ2IrlddGdFe+Vx2J2
         nNwQh2fEAb8gfpuS6w10mYU7B7E1QKghD2GUwN4fj8lxB5l/+CBM+ThrtVlNqVc0N71p
         6GJ57+UHr1Un2R4xM4e385TeMfw5iQkEt2zemrSlZO8SFHeDlY2DHHEH1PJCCHM5tnz7
         E4KmAEIC3MdhazsizFaSowpKJUhOzp1n8jUqn54v5+4zYD/93mWcZp2IwC1Vb3rx1N5/
         XR2w==
X-Gm-Message-State: AC+VfDw4klWeoewbIUXYtEzyM+CYKHfEV+XD0a7VPoaTdwLpSXKNKjvk
        pzFbjx2ioV8WTAKKK0mutMY34w==
X-Google-Smtp-Source: ACHHUZ5/ZB4gpxAhv68DRJt2A8rLz9ZAcJmpBjRmm4ynXXS4Mf9xvXKO9qyXiXbt2UU9LAJTW7ePVQ==
X-Received: by 2002:a2e:7007:0:b0:2b6:b8c2:a18a with SMTP id l7-20020a2e7007000000b002b6b8c2a18amr2503823ljc.37.1687971692931;
        Wed, 28 Jun 2023 10:01:32 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a2e9254000000b002b1fc6e70a1sm328409ljg.21.2023.06.28.10.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 10:01:32 -0700 (PDT)
Message-ID: <86102be0-87ea-6130-6b9b-739dda279808@linaro.org>
Date:   Wed, 28 Jun 2023 20:01:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [GIT PULL, v2] Add Audio topology firmware for Qualcomm SC8280XP
 X13s platform
Content-Language: en-GB
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-firmware@kernel.org
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Brian Masney <bmasney@redhat.com>
References: <9786de04-fd1c-b209-b7b8-0bdbd5a1e215@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9786de04-fd1c-b209-b7b8-0bdbd5a1e215@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/06/2023 14:00, Srinivas Kandagatla wrote:
> The following changes since commit 
> ee91452dac5abfc4c5b9827cf55e701d8c0ca678:
> 
>    Makefile, copy-firmware: support xz/zstd compressed firmware 
> (2023-06-25 12:18:57 -0400)
> 
> are available in the Git repository at:
> 
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/srini/linux-firmware.git 
> sc8280xp-audio-fw
> 
> for you to fetch changes up to f9a35b3f0779844aa686b76506344db70a72820d:
> 
>    qcom: Add Audio firmware for SC8280XP X13s (2023-06-28 11:52:02 +0100)
> 
> ----------------------------------------------------------------
> Srinivas Kandagatla (1):
>        qcom: Add Audio firmware for SC8280XP X13s
> 
>   LICENCE.linaro                                |  30 
> ++++++++++++++++++++++++++++++
>   WHENCE                                        |   8 ++++++++
>   qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin | Bin 0 -> 24296 bytes
>   3 files changed, 38 insertions(+)
>   create mode 100644 LICENCE.linaro
>   create mode 100644 qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin

I'm not sure if this is used for linux-firmware, but:

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks a lot for moving the file into a proper, device-specific location!

-- 
With best wishes
Dmitry

