Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64688611440
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 16:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbiJ1OPQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 10:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbiJ1OPH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 10:15:07 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46CCF66121
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 07:14:59 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id b18so8485770ljr.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 07:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FLuVgFuyXtA4BjMb6aWESdb63RSek4GWqHw+eMz+VJY=;
        b=Ld/jYiac0keX/KCiIBrM9d8Ar+pGP1UFFDF+uLNY29FuWBKOhGoCPc37eifuVOLM3H
         daAxCxygSAhoz3bnoq8b+TvdSGIeeowuA5NyhXpGi1T1zNhqwUUV8jAzqS1lPP1tD2AF
         DUUD23Uue8NwuHWWElO3iIZYYBZsy3escmm0TvPFG9bq/TWu2rurUZjxpuyEvF3b2qAx
         4/b7II9c/7fbjkpEairkH62RwOjKJo+jdK06ohJJm2erilheTZDiKC6qIFD4CVEfNqWE
         rJmB8tQIlAb7f2tF9HFdXTFuwZ8f65dG9i49DsUrvNbNXhBGoG+NH2xZA4UQ2wfRVVns
         qJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FLuVgFuyXtA4BjMb6aWESdb63RSek4GWqHw+eMz+VJY=;
        b=E6CxfmBrnDL5rj4HBMYPLnBY1m5U9Ga5QlUOfYhPTGzet/pPoPqO7wmjhbLEHAMdTH
         WNmdgiDmFhDF9Jh/AuaiuX3P2N+OSzpX3CDW9wO1lzwKN+ZEEdiu2iIqYcDzHDQ8nz9m
         H7btWIYJMXaafjD2TS1jVTLjPYPDR6KiAvgSPQ4tWn6JbarHzDQ/DLe5R+wLL9Z95SiJ
         qJ6HpeZHc8XXPm8SeF/wqemWNAfzq77VKoH1SY8J+YJ4WpRFIR0GOMukpwONCi20AZO2
         rSxQsSJ48BLvKH7GuDZnQyAFsksz4WBiFZ7/na6FjCaTG/N5otvSBCqqnPQt7xSjFXek
         LtCA==
X-Gm-Message-State: ACrzQf32a9ruYsClI3y/gmhUc0ZkJigTVGjIQBZmhj4Yc6O32w9ocYmH
        ZyDIAC5ZWwZ0kwF33znTh46ZdA==
X-Google-Smtp-Source: AMsMyM5WuNvDt6NgstTUOFUL5zNU81R4kQgZexWO7XdLm8DjdmYrHzLUcJYsw6pPpq5bwAziTo47+A==
X-Received: by 2002:a05:651c:98a:b0:26d:fd1f:10 with SMTP id b10-20020a05651c098a00b0026dfd1f0010mr21187718ljq.323.1666966497546;
        Fri, 28 Oct 2022 07:14:57 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w7-20020a05651c118700b0027628240ff7sm647551ljo.135.2022.10.28.07.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 07:14:57 -0700 (PDT)
Message-ID: <2efc7c44-12f2-7547-6c3d-9eda5a09660d@linaro.org>
Date:   Fri, 28 Oct 2022 17:14:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 04/16] phy: qcom-qmp-pcie: clean up device-tree parsing
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20221028133603.18470-1-johan+linaro@kernel.org>
 <20221028133603.18470-5-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221028133603.18470-5-johan+linaro@kernel.org>
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

On 28/10/2022 16:35, Johan Hovold wrote:
> Since the QMP driver split there will be at most a single child node so
> drop the obsolete iteration construct.
> 
> While at it, drop the verbose error logging that would have been
> printed also on probe deferrals.
> 
> Note that there's no need to check if there are additional child nodes
> (the kernel is not a devicetree validator), but let's return an error if
> there are no child nodes at all for now.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 34 +++++++-----------------
>   1 file changed, 9 insertions(+), 25 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

