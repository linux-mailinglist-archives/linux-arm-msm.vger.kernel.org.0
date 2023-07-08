Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50CB574BB2F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 03:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbjGHByy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 21:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjGHByx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 21:54:53 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC4AC3
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 18:54:51 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b708e49059so36578621fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 18:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688781289; x=1691373289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=npaEU4Jq+DAwfVt4RBA7ILDlsHaYzhtoNC6VoI1b+k0=;
        b=gPZfaN7wS1UvnJsefZI2XiL3Q1PD5is58lGYunpUxNdO8PPo4qWpmUh/eC4+JWtb9S
         ih0YWQ10owKrZ25fsuouXL1f/P0wuFOLQvd2UuWt8zbKb2ZjSCoi9NM7QY3rOqt3kJl/
         cvQveiw9Mq1lVSrYvYYq0DnDclWNRoa16g48QanJvN4fWzttvpr5kqGdyiUTCLba70uH
         ANznAzqveAcvo9xRQDd9VtlcQphPGkXoofB3pgNU60oP0jeRSq76PDUiFd8AubuDCE1+
         dnRf4EvB9YuwvGUI8t70eiW54Sia4PKsDjbIxivVKgrPgjPclvJuMCfn9K5fC+lsbK6r
         oITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688781289; x=1691373289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=npaEU4Jq+DAwfVt4RBA7ILDlsHaYzhtoNC6VoI1b+k0=;
        b=FP4+HCFwiDXrdokzvJJkO7mpb+hkBiPeVLTrJ13oko8wyrIzvxfTVuv40810oj7VB/
         hxGOhg9xlHg9fJKFt8KFN60o8Mj6sxVMmdBS4PpJ/hKPJ3pj7yrjt0AzPs/VDROfhXes
         /RSnhZwAIs7buA1/tQRp2JAXMKQd+VBUPy5nU4m1jsFR8D7xlGOfZbi47VlujYOqHyYE
         qQp0dkk+ZprCa1/T019B/VoXa8vuiP0TV0VFI7cVLnLhIZq1x6+PajaYh5T4IegmOP4c
         h3Pg+4t6KvfTcm0WNnuo3SL2gCclhQBhHpyQj2mYVFG1wBhFXRirzlp5qHGjBn0dzWsa
         XggQ==
X-Gm-Message-State: ABy/qLYoaklhLgdd40+unaN9s3uoEMrI6lQSEfAnN9fik9xxEZ3dplEc
        qx0o+yMEtojKKohmBlZkXK9JPfHQwPDtvquCHqk=
X-Google-Smtp-Source: APBJJlEqEgf+d4ZF9yehdGdjs2x11q0lZlUuW2aPMwV2iNCRMA3/PB8q3uekMYLKJLMYtpFnAXGJRA==
X-Received: by 2002:a2e:8e96:0:b0:2b6:e13f:cfd7 with SMTP id z22-20020a2e8e96000000b002b6e13fcfd7mr1075227ljk.4.1688781289298;
        Fri, 07 Jul 2023 18:54:49 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id m15-20020a2e97cf000000b002b6e13fcedcsm1011031ljj.122.2023.07.07.18.54.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 18:54:48 -0700 (PDT)
Message-ID: <c6347aed-4beb-078a-2d42-bf2ad335f45e@linaro.org>
Date:   Sat, 8 Jul 2023 04:54:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 5/6] drm/msm/dpu: Refactor printing of main blocks in
 device core dump
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
References: <20230622-devcoredump_patch-v5-0-67e8b66c4723@quicinc.com>
 <20230622-devcoredump_patch-v5-5-67e8b66c4723@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230622-devcoredump_patch-v5-5-67e8b66c4723@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/07/2023 04:24, Ryan McCann wrote:
> Currently, the names of main blocks are hardcoded into the
> msm_disp_snapshot_add_block function rather than using the name that
> already exists in the catalog. Change this to take the name directly from
> the catalog instead of hardcoding it.
> 
> Signed-off-by: Ryan McCann <quic_rmccann@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

