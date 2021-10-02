Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB19341F8F9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Oct 2021 03:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbhJBBK5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 21:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbhJBBK5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 21:10:57 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01FAC061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 18:09:11 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id i25so45063500lfg.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 18:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QJi5dnZCRKyuIr330IEjUyQqWCQ+hUanK7f88GGsu9Y=;
        b=nFHh7xfeu3FDgfUVmmY7kwwhhlAStH/ZjAG7GcUikKfIqKSAUt8ypN75c+TWlVlGx7
         9hvUnWWt4W4QtbuOZpa4cav8jbDq8bMTzwJg3fjNlZC0LJPShuHZfVdR8O9Lw+OoJwpg
         IDbDajtOhCaK1OJRoscZkI15jZcmKN4dJZM8gD+4JPDLjVrJMxZO5NEf8SYyBk7c2yq3
         R4ZCVuHd1KMJilEloga5g/IzGElbkf3QCSWo0SLNqdoK/mzVYQXKN2VoMB7Pt+XZ/asi
         f9Kcv1TmPCxa2ENHfVxpaju+164xC38UZjrUFDSPvq0DluzEM0x4aBpUE5eA/Ki8swEL
         pLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QJi5dnZCRKyuIr330IEjUyQqWCQ+hUanK7f88GGsu9Y=;
        b=MEgyk0bqJZAfgJIwOK++j6Ga43XP1BgRnOHp4vt+QwLP9t8O3DS/m5r++B/Yc26+cE
         4A5SHz+5dEq0PHc1D7hVt3BMPYaFQTx6RPd2A8NljjJrMoEr4cKozyrSHRuIhu/7Tvou
         7u6RDqZ1NbhLeAOGdTkZjbthuE1lCCoueVw5i3hmy31jnG+JkqSbhZHCMc1lE0FsZ2YG
         ah6Arm7dqiCf38hRIca9LO8AVLfE8t4VuKCs4Du+N1W5PuLjFRQPgawRCeHncOrZV1wQ
         TsgQfXYqBD4ooBbVJ9gymeJi3oS2m38xCnGSOxPpZ0gB0GBlXN1t3JKGXxcsiALO0Kvr
         nSvw==
X-Gm-Message-State: AOAM531mxBMrPDjMh3zjLc5mc2fhxrGwYvfBCRzi3V+VxMS6L+OtzC/t
        1MVMS+bEvgD86yOdkJAPVbYKlQ==
X-Google-Smtp-Source: ABdhPJwxzP+S3xwprLe/RPXXMzTtfSmSOF8004b+WHO3RmXKN3BGThk4h2PUn2QcZOVxPlyH+VLdBg==
X-Received: by 2002:a05:6512:31c6:: with SMTP id j6mr1183238lfe.436.1633136950279;
        Fri, 01 Oct 2021 18:09:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t10sm280248lfq.251.2021.10.01.18.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Oct 2021 18:09:09 -0700 (PDT)
Subject: Re: [PATCH 1/3] mfd: qcom-pm8xxx: switch away from using chained IRQ
 handlers
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20211002010814.647394-1-dmitry.baryshkov@linaro.org>
Message-ID: <1e5700d7-ff19-b714-3192-9f9794056a54@linaro.org>
Date:   Sat, 2 Oct 2021 04:09:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211002010814.647394-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/10/2021 04:08, Dmitry Baryshkov wrote:
> PM8xxx PMIC family uses GPIO as parent IRQ. Using it together with the
> irq_set_chained_handler_and_data() results in warnings from the GPIOLIB
> as in this path the IRQ resources are not allocated (and thus the
> corresponding GPIO is not marked as used for the IRQ. Use request_irq so
> that the IRQ resources are proprely setup.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Please ignore this duplicate, it was sent by mistake.


-- 
With best wishes
Dmitry
