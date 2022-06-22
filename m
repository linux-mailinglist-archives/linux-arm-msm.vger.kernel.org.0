Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC7AF5552EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 20:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358337AbiFVSDm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 14:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357089AbiFVSDe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 14:03:34 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58C533A20
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 11:03:30 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id t24so16862579lfr.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 11:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZTlj82E6kifi0yQhK+5fXqesjcyWHjDoPKb8Xh0tWaM=;
        b=YPs9zoXTZdCCgy6mwDaLLCe3YJ1nDLJYlFsLY0uB/WaPNWnUwxUBc+MtDtbsjeKocu
         LMvnIlwFtpMsYsE8ZyHPS4PaLaP4HcMROBXckCicyevRV/cByI0U04OV77xamBr9ZugX
         1vt1KR0NBizorFEvz6iPuh1BN6LmBC8qw97dqTbfg35KqhJCHB/BNpFz376kCDaeXsai
         Txdp5bTI2FUlSimWgJ0MPsncJig43DS0TwRrnTbQaLWqRLPQP09fSwCEpKNJI/7E30mm
         7L4+BEtYtm0MJ9ZJctR9TOLEinkeOnw1EU4gbPLbv4XCDftefTceaV2Tk7JOrppz9ByX
         fY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZTlj82E6kifi0yQhK+5fXqesjcyWHjDoPKb8Xh0tWaM=;
        b=heSNSlSmRH2fSAGKI3mWGQkp8dgITeuRZ39AQkhKgEJgcrwJDcHS3L1mBEqoKBffM1
         bsnY37u8t05ZRwL9b/B5afHjvl6L4QFf2I6SA6nk4Am4xcHhOpKZhtbtVbhtLVALTi/7
         sQQTANLSY5rpB6UXMTudf2U1i92Z0KxLlSFTb3JKZpb11TgAtwnMkqsknukhU2f6UWa9
         4H9Ni9FUL8KXIkwjsU80aqcz3vMKB32CZTA6eH8tYab2sRhoRINOMMWcknyDE+a3H1sg
         QJC2LKC8Hy3x9co0T58TuOWOzr00PZRjr7hsxGqnkieIluhzmUZ3unaI65Wwz04kdrGx
         0+LQ==
X-Gm-Message-State: AJIora/H7Od341T3RKAZhc/2Jb6GgGQkBabnFsDrY4XJB8HBEriDAZZZ
        iQ8Etgao4YNAc/9Ky1pY3sozxA==
X-Google-Smtp-Source: AGRyM1um1hIN5A8SQyQ5l8LM5tA3p+87QUOIBbIhZVlEqLdUp6eNRJ1nKpR+IJ+6NHWSX/0tvLXbjg==
X-Received: by 2002:a05:6512:16aa:b0:479:7df:cb68 with SMTP id bu42-20020a05651216aa00b0047907dfcb68mr2742433lfb.666.1655921009223;
        Wed, 22 Jun 2022 11:03:29 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k6-20020ac257c6000000b004785b66a9a4sm1810904lfo.126.2022.06.22.11.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 11:03:28 -0700 (PDT)
Message-ID: <8b751eb3-2e19-0e03-4c94-b26b3badd397@linaro.org>
Date:   Wed, 22 Jun 2022 21:03:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v15 0/3] eDP/DP Phy vdda realted function
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <1655830891-19025-1-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1655830891-19025-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/06/2022 20:01, Kuogee Hsieh wrote:
> 0) rebase on https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git tree
> 1) add regulator_set_load() to eDP phy
> 2) add regulator_set_load() to DP phy
> 3) remove vdda related function out of eDP/DP controller
> 
> Kuogee Hsieh (3):
>    phy: qcom-edp: add regulator_set_load to edp phy
>    phy: qcom-qmp: add regulator_set_load to dp phy
>    drm/msm/dp: delete vdda regulator related functions from eDP/DP
>      controller

Kishon, Vinod, how do we proceed with merging these patches?

> 
>   drivers/gpu/drm/msm/dp/dp_parser.c        | 14 -----
>   drivers/gpu/drm/msm/dp/dp_parser.h        |  8 ---
>   drivers/gpu/drm/msm/dp/dp_power.c         | 95 +------------------------------
>   drivers/phy/qualcomm/phy-qcom-edp.c       | 12 ++++
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 43 ++++++++++----
>   5 files changed, 47 insertions(+), 125 deletions(-)
> 


-- 
With best wishes
Dmitry
