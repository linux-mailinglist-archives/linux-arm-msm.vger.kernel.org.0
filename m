Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 785D06FF6B1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 May 2023 18:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238561AbjEKQCv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 12:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238393AbjEKQCu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 12:02:50 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587DE46AB
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 09:02:49 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ac785015d6so93899711fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 09:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683820967; x=1686412967;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6JhqElOO9wIra7p8jkoQ6oyPJCsu2/1z8AlYyPP+pK8=;
        b=i3hR/e1zkUJ8KCwu0pnMdd3DQLKf87WThuG23PMElsyxRiUc5D7uNAhELupVPR+ByA
         Fte5Lfy3dc2/mW8mZqN1XWM3ySAfJ2RFNmQgXG+46pDwTywlAKIVx4n9q7p+YqIF2DKF
         toCEOUOyNrdf6r67PCw6k4KEzuV71E/jNNv4d+qxlQnSrS5s23+emf8Jxmjg+BLtHv5f
         Me0OISTu6cu2lEnRn1J3Gc3xIBGMwzpR49065T0AyTcLkn1MBuSuLj8fDAZBGXW5tN81
         1vQW3nYbUFXepsjdyETxaMei5mVSOy8TNlDyEWR1luTauQqZy5qtAAVNV0K+KaA4fJ0S
         Qtiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683820967; x=1686412967;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6JhqElOO9wIra7p8jkoQ6oyPJCsu2/1z8AlYyPP+pK8=;
        b=JbgUIRPF6RDA514HUaTKxldLzpqsSP1Qz08d8KN5WfGCj1/xaG6CROd6bxnaOYuhTj
         C2XIuJZevu6mY4huwBQUqq+RplV1mygH/Ev7UZboyc6ucv96lXAPD5I6TnMi6mjSLDHK
         JtOocBRDiV6CTW60h10INGjbui2AQYQA1UPzu6GsDq7SBUuCLnq5xLVSPIyT7CQtrSz9
         75eIQvAw07ysfDC9+DUNGxxpobDn0Xx64TdxLO2PORrlCa2xHG3wLy/JZ73EmgFERYOH
         0s9NQzbpO5bdtBKhIP5S8ANV8+CPVPiephwZ+qIZ7RNhKUI4XEnEBuxvAYxx6d/J9OIq
         PglQ==
X-Gm-Message-State: AC+VfDxw8mP7nwccv/NgVrMzTov56LySuJBR7i3omluwyfRk0jN/9Qri
        bN+F3Vc0PduW30NMM1JH3AL6GQ==
X-Google-Smtp-Source: ACHHUZ65rAjslkw7nhzx/aWI/cyLqvEoKlMIiSOkzyYwrTXiCP4u00NghNDfKKM7DQZRj0CoLa14Ug==
X-Received: by 2002:a2e:924b:0:b0:2ad:beff:cd9c with SMTP id v11-20020a2e924b000000b002adbeffcd9cmr1045393ljg.53.1683820967538;
        Thu, 11 May 2023 09:02:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id z18-20020a2e9b92000000b002ada45ce1fbsm1104368lji.128.2023.05.11.09.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 09:02:47 -0700 (PDT)
Message-ID: <89938fdd-d0d0-b0c1-7717-4a2bc00236f5@linaro.org>
Date:   Thu, 11 May 2023 19:02:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 0/2] enable HDP plugin/unplugged interrupts to
 hpd_enable/disable
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
        quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1683750665-8764-1-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683750665-8764-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/05/2023 23:31, Kuogee Hsieh wrote:
> There is bug report on exteranl DP display does not work.
> This patch add below two patches to fix the problem.
> 1) enable HDP plugin/unplugged interrupts to hpd_enable/disable
> 2) add mutex to protect internal_hpd against race condition between different threads
>      
> 
> Kuogee Hsieh (2):
>    drm/msm/dp: enable HDP plugin/unplugged interrupts to
>      hpd_enable/disable
>    drm/msm/dp: add mutex to protect internal_hpd against race condition
>      between different threads
> 
>   drivers/gpu/drm/msm/dp/dp_display.c | 37 +++++++++++++++++++++++--------------
>   1 file changed, 23 insertions(+), 14 deletions(-)
> 

BTW: Kuogee, what happened to the patchset promised at [1] ?

In the reply, [2], I asked you to remove DP_HPD_INIT_SETUP completely, 
and then you went silent.

[1] 
https://lore.kernel.org/dri-devel/4c733721-855a-85fd-82a9-9af0f80fc02e@quicinc.com/ 


[2] 
https://lore.kernel.org/dri-devel/358262c3-e501-3c7f-7502-f0323cdcc634@linaro.org/

-- 
With best wishes
Dmitry

