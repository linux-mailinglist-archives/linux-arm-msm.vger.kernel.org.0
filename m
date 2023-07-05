Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 962E3748E9F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jul 2023 22:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbjGEUMA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jul 2023 16:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233435AbjGEUL7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jul 2023 16:11:59 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B60641980
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jul 2023 13:11:54 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fba86f069bso8014660e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jul 2023 13:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688587913; x=1691179913;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lcVd66LGKDN5EYJvATzXLdn3h1LOEZrZslPujKR9gFU=;
        b=YXGZIJZ6nachVEuQzc/IZNo9zEXiYi+3qek3qmciqPadXYSqe6tdM6yFyIkxS4finp
         yToukamMSrKbSnNMEAQNsCT6gDDTZCMCzzSKsFMv94vgr3Cyfn8k1Nf3PpjfJFCsEFvz
         8gDs0uKyi6Y2zhJogLFuuIQUsq/0k2Hf5F4zCl0XMnA8cgXNwZCpSja16LGLXCkyohjv
         GCadnX8Ipim7DjQ1rh6aC/TfpA645DjlTEU+Lg61ilNuklhe9l+SF29RMvGTjlqVevou
         iSCHZ+2vLEWgEW+OhOG0maqMfG+e/eNVQCQb2v2K54ii/WmYrHKEaNZj8SlWyOcZfFLk
         mX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688587913; x=1691179913;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lcVd66LGKDN5EYJvATzXLdn3h1LOEZrZslPujKR9gFU=;
        b=U9TcpPiZDx4e7rr8VLCicwjrRf0QsNv18osow2tAJ1lWOhCoZW0tsZYMlkVZlnJYMh
         nCKsucAmYiUVf2l8XN6xh735o9U0zp37NT1ADwF4cgdjpVinMVi7Xpp/9NlRYcqbup3e
         b9kKzxVDYITihIYqz2XuxznVplBLOOmbsmpE+pelA1RvndT9DY+NcliNvCV7dvBWlDI9
         fJ8oJhqdmsqlycjOGDGbaLWo80DOpyF9zSzS5S4WpfATnVKYw5npGDkVcoRzoi+Ha9kK
         JjZs0z+q3SN8zvvwQzkBxpa0gI+drp0K2nkOb2T4tnv7k6vQV26F8L77//OzV+2aZNQu
         7gnQ==
X-Gm-Message-State: ABy/qLazOKYAA4ulgA1yhZ8YH+67zqxLoYcS6ny4w3P3+lCFiQcNMW3V
        DPKgRCNRgeeThMMc8KZn92+ZNA==
X-Google-Smtp-Source: APBJJlGOWtuaZF1gcaIcgphg/Ji6Uk1NoTGrqR5CoDcm174dMUUXiOcCMmFdYb2CR95t/vfYN5Mdew==
X-Received: by 2002:ac2:4bd4:0:b0:4fb:99f7:da35 with SMTP id o20-20020ac24bd4000000b004fb99f7da35mr65182lfq.15.1688587912764;
        Wed, 05 Jul 2023 13:11:52 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id z14-20020a19f70e000000b004fa35167729sm5488873lfe.159.2023.07.05.13.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 13:11:52 -0700 (PDT)
Message-ID: <26c7e593-7635-e96c-c21f-5fd2e5285281@linaro.org>
Date:   Wed, 5 Jul 2023 23:11:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 4/5] drm/msm/dpu: Remove redundant prefix/suffix in
 name of sub-blocks
Content-Language: en-GB
To:     Ryan McCann <quic_rmccann@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_jesszhan@quicinc.com
References: <20230622-devcoredump_patch-v2-0-9e90a87d393f@quicinc.com>
 <20230622-devcoredump_patch-v2-4-9e90a87d393f@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230622-devcoredump_patch-v2-4-9e90a87d393f@quicinc.com>
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

On 05/07/2023 22:30, Ryan McCann wrote:
> For a device core dump, the registers of sub-blocks are printed under a
> title formatted as <mainBlkName_sblkName>. For example, the csc sub-block
> for an SSPP main block "sspp_0" would be printed "sspp_0_sspp_csc0". The
> title is clearly redundant due to the duplicate "sspp" and "0" that exist
> in both the mainBlkName and sblkName. To eliminate this redundancy, remove
> the secondary "sspp" and "0" that exist in the sub-block name by
> elimanting the "sspp_" prefix and the concatenation of "num" that results
> in the redundant "0" suffix. Remove num parameter altogether from relevant
> macros as a consequence of it no longer being used.
> 
> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 50 +++++++++++++-------------
>   1 file changed, 25 insertions(+), 25 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

