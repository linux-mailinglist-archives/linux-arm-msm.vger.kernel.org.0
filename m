Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 560F77272DB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jun 2023 01:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232690AbjFGXVL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 19:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbjFGXVJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 19:21:09 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A68410EA
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 16:21:08 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f4b384c09fso43045e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 16:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686180067; x=1688772067;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5BRvWWvhCLGbcXd1+v4aBkM7sXnYeF061U3u5C8oRU0=;
        b=z0TzEhH1PG61Vx6RPciZ8/KgXo2NqjqmOMgU/fDHAmR4VbCmezy0MslKB3nIfBUtHL
         PTXfEGg4PN3TfMD32midA0h5iCOtY1By/WZCj2eMxxjUpMf4D1mqkb6PV5ilnjlYvi/M
         hx40aMkma5t1ieA+Yo1Hta3e4xC/X7660oW42LW7u8cWcr3qfQypJM8yc3m1Cl4T27g5
         2kOlvdgz1YKBfNlpbI7NykuH2kv3DHMC5RqycxQRJwxRGtMKZRVC8jwjGxFY0V/rOe+k
         sIv54563gl3FeUD8RBDRT1WfDcO0kqwcy/zSRn0ZSzkUG4FN7gPTavNVBX8Y5P4PlKMS
         danA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686180067; x=1688772067;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5BRvWWvhCLGbcXd1+v4aBkM7sXnYeF061U3u5C8oRU0=;
        b=gooA+1Imlfvo8xQ0H2wSs8dhULX2Ur4ijM7O1EHeuUcsCz9Jg/NxYFI8u8jgZAsebl
         1F8O/VzEQQEjMGI71eqF4LY5nZNnsfd47l2V9AKAJiZ8v5inw0hIQ/d1tgj8n873BToT
         5/IcFrM5e0hQbzalWIlQfyyh8KDPVH/w68TgrEmYCKK2lIbOlj0W0FyWdHEIqlORh+0W
         tpmSxQ18pgyMbsrDqkyR7YjvcSjQL0KJVFqQ6DEcWHrN8i3GUx0LcIQGrO//vr1dsXp8
         0Aqie2HmSCGnI/SpZi2UugnjEb9MlVcxXI5nCwlfMAyDz8pXTcOtcO6NMc61h2P9zZ+c
         c2ow==
X-Gm-Message-State: AC+VfDzy2d+Li+eHfnueLdoogl2FER+ugcfAUHBJ9BA0wqPfeA1nLDc5
        6DQv6KWjbdcE8l2DbM1k4uv4xw==
X-Google-Smtp-Source: ACHHUZ7rdziHqciH7iFMaX12zv5gokegQCsJ25zS5juFFtQ9fBof+gAcj4pDb3iXlirtt6YSJ/FFEw==
X-Received: by 2002:ac2:44d8:0:b0:4f3:94b5:3274 with SMTP id d24-20020ac244d8000000b004f394b53274mr2556046lfm.63.1686180066767;
        Wed, 07 Jun 2023 16:21:06 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w5-20020ac24425000000b004edc2a023ffsm1938060lfl.36.2023.06.07.16.21.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 16:21:06 -0700 (PDT)
Message-ID: <d3e58850-6386-77fb-a134-cbaa98ce57f1@linaro.org>
Date:   Thu, 8 Jun 2023 02:21:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v17] drm/msm/dpu: add DSC blocks to the catalog of MSM8998
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org,
        marijn.suijten@somainline.org
Cc:     quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1686082272-22191-1-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1686082272-22191-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/06/2023 23:11, Kuogee Hsieh wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Some platforms have DSC blocks which have not been declared in the catalog.
> Complete DSC 1.1 support for all platforms by adding the missing blocks to
> MSM8998.
> 
> Changes in v9:
> -- add MSM8998 and SC8180x to commit title
> 
> Changes in v10:
> -- fix grammar at commit text
> 
> Changes in v12:
> -- fix "titil" with "title" at changes in v9
> 
> Changes in v14:
> -- "dsc" tp "DSC" at commit title
> 
> Changes in v15:
> -- fix merge conflicts at dpu_5_1_sc8180x.h
> 
> Changes in v16
> -- fix cherry-pick error by deleting both redundant .dsc and .dsc_count
>     assignment from dpu_5_1_sc8180x.h
> 
> Changes in v17
> -- remove sc8180x from both commit title and text
> -- remove Reviewed-by
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I'll fix the commit message.

-- 
With best wishes
Dmitry

