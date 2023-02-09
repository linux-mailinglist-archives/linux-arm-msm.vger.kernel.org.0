Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 998326906CE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 12:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbjBILUp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 06:20:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbjBILUA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 06:20:00 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C29216A306
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 03:17:28 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so3617735wma.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 03:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PWSXlYEkUeDfubGM0vZj+ySlBlV7F13R5B69CBo5/yQ=;
        b=Dot+4uAVbB7Awoh88Dl3ZIjOdJmHgvLABb7G8O1gttCtzLobuL3eLqpgJxnGiMVP/s
         Gs8RwTa+TG12u1l8ATw67X2MmdxUpTUNm0Lu6DLaptW4vyV57S3FASoVh3tlw3ssZxxS
         x6BMXC0Q/wPw0BiWgeY271Ie58i93YFWzef3m1j+qWvmHx2NqJRWhSmbygfwA1HO71x4
         TuAL/f9LRDOgCQk5N6pyg4F0zvIDE/SjGuWwQiK6FtEMnFsbaErAl8NogzgBBggxFyMb
         Z6oE0WQgN5Vs5dWf/OF8EdnHoWDh8SLX+/ImjzQ05Nzv7X5bN2kSzjfKwrVOf3/JjLbM
         zWpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PWSXlYEkUeDfubGM0vZj+ySlBlV7F13R5B69CBo5/yQ=;
        b=ZRzFpQ1spq7jFiSTy81Uc6CvUtdygb3sJbmK29iwrgjA1kIxWjh8y3m3cH2PDEOhYG
         DYN8cEoFMR6mAozHTgwQjTOJd5lEBISW48sCX3CehWQ0G/i8hnamIuAHnXIsFFHi9V8c
         djDuTKkiEXH6mxETLIMIB/w/umzZRr4SSpC8BLQrtOv0CYQ1OYqy9UMQhplyZhXgi2LA
         iEtqRIuR9eQHx0wbAGoOiVL8T14WfxlgnKwIAl7fi1qwC2L/M3tUI2h8SaNYfb5eCm8U
         5PjXHHKuVJ3FleIV7pgUePS75K+/dU9GDCjP9wHuMkwivtb+nRe8HLuaLKzGJvk5wnSH
         sAlQ==
X-Gm-Message-State: AO0yUKXHKaH32SEU4C4TD6wjxl/PBQjBzaRxWRbmgJQ9OpRQ6s9oPU0Y
        yltZqogGIURexp9vdJ0wppEuqA==
X-Google-Smtp-Source: AK7set+d4YiMnRJTcdgeOreeSxm/SXSlJKtNYfoyWuitR3MzTT8J2L/vLR2u1E5/iqdjQmdkJJuvxg==
X-Received: by 2002:a05:600c:4910:b0:3d9:ee01:60a4 with SMTP id f16-20020a05600c491000b003d9ee0160a4mr9441398wmp.1.1675941446166;
        Thu, 09 Feb 2023 03:17:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c42c600b003df245cd853sm1418559wme.44.2023.02.09.03.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 03:17:25 -0800 (PST)
Message-ID: <3acf2ad0-81a5-80dc-e94b-5eb68949bfcb@linaro.org>
Date:   Thu, 9 Feb 2023 12:17:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/3] soc: qcom: socinfo: add support for SA8775P
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230209095753.447347-1-brgl@bgdev.pl>
 <20230209095753.447347-4-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209095753.447347-4-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/02/2023 10:57, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add SocInfo support for SA8775P.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

