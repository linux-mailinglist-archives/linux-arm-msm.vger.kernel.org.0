Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7BDF64DD19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 15:47:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbiLOOrr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Dec 2022 09:47:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiLOOro (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Dec 2022 09:47:44 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C322F64D
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 06:47:42 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id j4so16082999lfk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 06:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FCbBNla3B4qzufgNiT6xhAilFk4aUOoKfWfCbflNpl0=;
        b=GGpwGlA19P0rfy9huqWJGAyESey4vV3uts6zp1U9TMfB6CdZE1djzJyX2IlWeg0Fsi
         helS6xvaZfoKmgFDvcbaJPgATyp8pcPB/HWMY/tKJIeQ3idJLE6YBzRhQoYNWX4qRFGj
         IeA9JaHh31wnd2Nzy8vXoZyW2d+WadWX2vzOCHTAStnD9Nh2puGDXFf/3lBcOOV81DQw
         gTf2XCInIBo/S5uzKnJL3G7LELdeajNHzyUWCiMWReUQAUroiLYGIlnsGnkcafrBF/zs
         OXRP66OWecySoo3pdkoonSJREzdwBsGpuMWgBwrrHNHwLvB7qypS1/7gy0TmKZlMpwfq
         2sGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FCbBNla3B4qzufgNiT6xhAilFk4aUOoKfWfCbflNpl0=;
        b=DMaA6EMfi1q66KFK+nW8ZS/YzVFjQ3VGcqtPQguX6v4urNJsEnFqAgi+BGiK93LMZE
         Dvg9ecqQzwS4ZYI82G2lNF5lxq75Vk7nWNOIq3H8bwyAfay+UFq+iVD1NGX5BhaVtY98
         5Q3gAv9LEbaVWO+L+fw8dqP4iVfC9xIdaHP7LJG1sUD9KrBEui8vc+lsbJJS++4TpKwe
         v9/GYB+d33r09hRCYp4eMtik+buzDmfE3LmZ+UY6O8FTX7rKe6U+XwG4inM33ZCChsBQ
         4u3Tmmt1E4TN4NVi3eYDmU0kx1dUjTdk6IR270iZ6Ufi7ewyjgaHlueoVtWRX9iDlN9D
         tc2g==
X-Gm-Message-State: ANoB5plE5ccVe1ML8ZDg8C/3CB9judwGSI/8He96icTAiczdySbC3Ivt
        e+p6+gMYwqJQvXACPbl69mlXTGzRslg6EJpGqYU=
X-Google-Smtp-Source: AA0mqf5gvjiIw+ORFu7EYu5CDzi6Lcsv22WBWXZZz52qXpJJYm8x2JBbk2HS05E8NYd1MUyiy39YiA==
X-Received: by 2002:a05:6512:224b:b0:4a4:68b7:dedb with SMTP id i11-20020a056512224b00b004a468b7dedbmr10078925lfu.55.1671115660796;
        Thu, 15 Dec 2022 06:47:40 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s23-20020a056512315700b004b5812207dbsm1176577lfi.201.2022.12.15.06.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 06:47:40 -0800 (PST)
Message-ID: <0157bea5-2173-3f45-564d-a0d26b2bffb5@linaro.org>
Date:   Thu, 15 Dec 2022 16:47:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] arm64: defconfig: enable crypto userspace API
To:     Brian Masney <bmasney@redhat.com>, catalin.marinas@arm.com,
        will@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20221214174607.2948497-1-bmasney@redhat.com>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221214174607.2948497-1-bmasney@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/12/2022 19:46, Brian Masney wrote:
> Enable CONFIG_CRYPTO_USER so that libkcapi can be used. This was tested
> using kcapi-rng on a Qualcomm SA8540p automotive development board.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

