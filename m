Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E04E86910A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 19:48:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjBISsU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 13:48:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjBISsT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 13:48:19 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6992729413
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 10:48:18 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id ud5so9268590ejc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 10:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cVj4jGFm91gVblHchnk/NhqSD0CN2enSZNgJVhtZLGU=;
        b=xxDmmYA6KFjt551HnWXBy6i1VTczv/C9QUW1HSkyJKrfNPlFF7Jb93xvxUrIlUx3/W
         GvRJ7gU9DhGM4j5CvQkNspc7Z+vqK5K+fdNXerYmE9nC94DEnusVddjZsIyLueJO7PHm
         hdj5W+3h9RT+ZHyYL2mtBtoNrffkzNLIyiZ05A1zL9l165aW7lzEY4+s+kie7F9r6O+k
         kHPgGBXpKSoGxeFtjtMbJ28tRf7wa/+KebVm5+qTVBl+hqeDEsjX/AqStHjl2+ktV6yR
         LNX3b09A1RrpmnDv225qKuf60D3KKWmx7g1+p89UmoZeUZ3gPwit594PCxteWmux0IPb
         NbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cVj4jGFm91gVblHchnk/NhqSD0CN2enSZNgJVhtZLGU=;
        b=OHRAo3dkugBZq1I5MIRIyeaK40ofIr+Z/LUAXWoSLXMMdz9D7cY0IY1J5Emfr0JwR+
         EYyRU7scCkmfgS3RpNCe0+MwEsMTs56a7JyMTp65s8bgd+gcOGuRAiuk8MY+LCi9IY7c
         9cvn0P7bpdfY0Cqt5tDJlzv+1LJ2TO0ybGVdmWBeiMd7EMTDtxdKwAgJRKdn5p8Z/w3J
         z6Y265zxAMRyKN6T9cSO+CPRpEJnRk4cRe7Eak6B2SC+wm2G29TYP2f/nee+2PqXl73I
         IAhEcSVucyunLcSvQzne23lcfKyBq1tN/1t3H77G5ipBg+lopuiZ4Od4twAy6clo4G/q
         hGxQ==
X-Gm-Message-State: AO0yUKXcHCf/b5sREGbz7xdcjlERO3vVFTRBfCoq/HLJcIhRWN6Sh4YA
        XwutYLKXyN1Hk5ffa0a3ykajfw==
X-Google-Smtp-Source: AK7set8O1d48Yxy961nQsh5nXpbiT4LjdTRSKH/fLUo9iBfixA94ymRttiGvzRsURqI/gIJQPNUbig==
X-Received: by 2002:a17:906:14d7:b0:86a:316:d107 with SMTP id y23-20020a17090614d700b0086a0316d107mr13221691ejc.72.1675968496986;
        Thu, 09 Feb 2023 10:48:16 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a11-20020a170906684b00b008aea5e0938esm1194906ejs.183.2023.02.09.10.48.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 10:48:16 -0800 (PST)
Message-ID: <85c9e765-6bb5-f195-d0b9-d3b5aa1ffe5a@linaro.org>
Date:   Thu, 9 Feb 2023 20:48:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH v2 4/4] drm/msm/mdp4: Remove empty prepare_commit()
 function
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, marijn.suijten@somainline.org
References: <20230209184426.4437-1-quic_jesszhan@quicinc.com>
 <20230209184426.4437-5-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230209184426.4437-5-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/02/2023 20:44, Jessica Zhang wrote:
> Remove empty prepare_commit() function from MDP4 driver.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 5 -----
>   1 file changed, 5 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

