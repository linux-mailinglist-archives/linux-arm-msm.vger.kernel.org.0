Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF9A762676A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Nov 2022 07:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234711AbiKLGS6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Nov 2022 01:18:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230327AbiKLGSz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Nov 2022 01:18:55 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 970AF2BB0B
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 22:18:54 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id b3so11283249lfv.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Nov 2022 22:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oyBD99VaO8VEQVZq7O+KQJj5GoNeYJIQtidVjSm/ty8=;
        b=iu52zPDJ4DjSeKErAKY4WaitqjDF/Fb0973RWiJZ12PobXfu1qoEZRIuHoCo6nlv8b
         kEueIT+reRE4b/ZInCpH0GdHa2b+3c6Vi0jR7FzywyhKT0aZUk3jUsNAjNoTIcwzF/1s
         mzujLZD30yVhvYwO4jJ+wt6z2f7Dh7tnEcZIi26Q3KgIQ0Hh+wvOVwCZLKgXotWUOHnV
         sInlhGzvlGY8Auz53eQ8izQw+Cxc5KgRrxfqjSzdf4BABqxsDczthkLI4cFOaW3zMxUy
         WyKNdK2s5JIj7rznbecz9vcl6Emo9YfNfAGZPYwnBFaaHN4EbJOc/PPv9+Gg9xY/jrW9
         DJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oyBD99VaO8VEQVZq7O+KQJj5GoNeYJIQtidVjSm/ty8=;
        b=NFJSG5yYdyHKnTSP6heIlX8m3253284GW/5NS+uJl+XbfrkTDzrGfteR2rRy4FH0wm
         JovuWNe6eF+VrQan68ibPK72pWKUdj1ZKpA3BZ0OqtjFQuUGvoHYYzvnd2rMXAPz9D+H
         6NyPDvbp9KH62ZabpmTjpzuY/x9sqH3AHGPYxO5jby/4kfVol/OKls8ucfe53qP7FKB/
         8Qal0b95CB8uIUbgrLzm3vX03p1s4al++098vNVgjVnmtd9krR0SCZm5WFW9j22irThQ
         r5OIZq9ZNYpt8Uk8q4eeOEWYtgbun5/4Ey2nwDftk06Cx2V7pXZZgTan6Go8qb+aD84z
         c03A==
X-Gm-Message-State: ANoB5pnhpRLHryNMULvQ0rEh2M5CS9g9m/kaVAUrXGQiNeL6c0hMyRmg
        q71LyVjvemMbpjrYWHzdJoPdbw==
X-Google-Smtp-Source: AA0mqf6+ON9YCNMqvgS4Z70cV8ixaeVDjHjBP6+s4aw+cLKlnc4ZDE1hqeEAmTcfNGn+ZDOxPl8e9w==
X-Received: by 2002:a05:6512:3885:b0:4a2:2d86:ad85 with SMTP id n5-20020a056512388500b004a22d86ad85mr1779468lft.277.1668233933019;
        Fri, 11 Nov 2022 22:18:53 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k4-20020a05651239c400b0048a934168c0sm714172lfu.35.2022.11.11.22.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 22:18:52 -0800 (PST)
Message-ID: <4b4d7773-d3eb-8bfd-7b83-ad87a6b7d13e@linaro.org>
Date:   Sat, 12 Nov 2022 09:18:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 02/22] phy: qcom-qmp-combo: move device-id table
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221111085643.9478-1-johan+linaro@kernel.org>
 <20221111085643.9478-3-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221111085643.9478-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/11/2022 11:56, Johan Hovold wrote:
> Move the device-id table after probe() and next to the driver structure
> to keep the driver callback functions grouped together.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 50 +++++++++++------------
>   1 file changed, 25 insertions(+), 25 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

