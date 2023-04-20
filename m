Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECB7E6EA057
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 01:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbjDTX6Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 19:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231611AbjDTX6Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 19:58:25 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1CD92680
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 16:58:23 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4ec8da7aaf8so1019269e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 16:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682035102; x=1684627102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7AK29Vqlmjj3QqMiRI2bsAKdpcELqF+rg3ndnHxq09Y=;
        b=FYZ/2dMxGYlduhZjTzDa90fPuGbrAZHU7W7leXYuArgvcLMh9r57wVo3PxIuUDB5/N
         MCLuTbcmoEazsNJMhWYIvXNw48VjO0EcWk2pqfyAVjBC92uMeCa38Wu6AcRDMhgXmi7W
         IXqnuyO5FH9CXCADxDPdWnttgNRg34/AFhfRrKHXqBLaF0qabFsuoJ5sP/JUXfxgaQkj
         LjTCANlCnLzeo2eLVcCBkB2rhvHfQcY+B98tej7wqOYZ3g2hYWrNk+63O132akiR7i9O
         H9uxNQrXlSBhhErYA2TzfUBA6VXbyrtU6QE/5ja+BKfZFlrH4Ikh19BBHSThA/uOsud1
         RiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682035102; x=1684627102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7AK29Vqlmjj3QqMiRI2bsAKdpcELqF+rg3ndnHxq09Y=;
        b=CJkw9vqOwk3wPRlMvXjNSPKg7CJnORok/yrirnAcBtT6xRmyjYGfjNIR/owT73MmZH
         ycfF+o8gvULARdwrjVAg3SWm5s+EDj00N4+2Q3F+2H7KjL1pYHWlNFKLsLbjSp/o8Gso
         JLxEv2iZvzYD89txoDIjIFxg+CPrMguoNEQRcY422E5wcpgdyXPanE8IO7G/A73q98Gg
         Bi91qNoRW/8NK86WXAL8TVWE71RC1iLaWf++6LenRrlbKLOpmxhpfSI5lL16zkzj8Yye
         FQFGQ/Vy2ZlWIoD08JSy9Qj73cMGkH67bKege2JBAIiZjX4yYY5lkHNRvrhoXvcLup/5
         72sQ==
X-Gm-Message-State: AAQBX9dtqfXkQdOAgSlV2AyYHTQYM1PGbZB3SSqJVZT2DRHK9l9iMJli
        HeMBNqAS+TH7/9pnIim4jDZmOg==
X-Google-Smtp-Source: AKy350YWf5KVt5uMobAN0BnSlS3GmR5H5Tp+nYzhcAsHZ7p988nsIWUE1rY6pnczQp8z17yHnk/90g==
X-Received: by 2002:ac2:48a8:0:b0:4dc:84dd:eb91 with SMTP id u8-20020ac248a8000000b004dc84ddeb91mr796914lfg.22.1682035102091;
        Thu, 20 Apr 2023 16:58:22 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t1-20020ac25481000000b004e92c0ed7a0sm368682lfk.100.2023.04.20.16.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 16:58:21 -0700 (PDT)
Message-ID: <fe419932-3a1f-033d-eb85-dfc69c97d40d@linaro.org>
Date:   Fri, 21 Apr 2023 02:58:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 2/5] drm/msm/dpu: separate DSC flush update out of
 interface
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1682033114-28483-1-git-send-email-quic_khsieh@quicinc.com>
 <1682033114-28483-3-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1682033114-28483-3-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/04/2023 02:25, Kuogee Hsieh wrote:
> Current DSC flush update is piggyback inside dpu_hw_ctl_intf_cfg_v1().
> This patch separate DSC flush away from dpu_hw_ctl_intf_cfg_v1() by
> adding dpu_hw_ctl_update_pending_flush_dsc_v1() to handle both per
> DSC engine and DSC flush bits at same time to make it consistent with
> the location of flush programming of other dpu sub blocks.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 14 ++++++++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 22 ++++++++++++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  | 10 ++++++++++
>   3 files changed, 38 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

