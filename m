Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 467EA743192
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 02:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231681AbjF3AYq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jun 2023 20:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbjF3AYo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jun 2023 20:24:44 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1613C2D71
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 17:24:43 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f76a0a19d4so2046088e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 17:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688084681; x=1690676681;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P3KBEQXqn85cnemAvW8b7U5y6xDn7pfz845nnwQx15U=;
        b=mxxORMjPUZ5xJS/+bwWMhNWP4uVk0yW6ko9ZP81iVthje/EeavyFLacVrCOVuViJBn
         cb7SwgNUQ/3rZ9H30EYx8ujy4X6BK1W1DDPiOhGEmGoolvkzqNMmHDVbPEKBHD6niGTf
         ZWq6hF0/gk6ePZFZtu8+0oh2pdPdkg7lxNuX+BYu4yazLNo19V7vqsLsVvQ7i92A6aiI
         JNAR+GiX0UIQFJGi8FPq+7AXa35UzwvnLoGDzz4lvW63nSSNLQmA1YDa8v5bs05StNqX
         j3h6A/SblggHX20zztZ3rLUOq+Qnz2ojJxFjzeqfxSGaHFfnlLWzYW3fSLPKH4Bwe8CV
         FTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688084681; x=1690676681;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P3KBEQXqn85cnemAvW8b7U5y6xDn7pfz845nnwQx15U=;
        b=HAfxt9luiFxRk3bqJri5ybLHecAUJSkGZoV6QgN91k9vGEPkeiSbQmsWi6Lr18lU8p
         Vq0s3SG2UJKp6HVRRQWXENhNslu5Kpj6TmE+cw5+4804KA6mZx1RC4wVIOuMNy80wzN1
         odePN+FYlVzDW//ynq6WxBB8cXr71XFu+e9ypmlyiccm9an7tiUfhXmph/IE18gTv3GZ
         AjHDrO+F4cJKWa/y+h4htdFXU/i0Ask3CVdolFkunYqWIjLvMt5AYE9POjEUh/OrkLMX
         UkcAL/63A7zhqpHGnwQ+tFkO2XH45yK5WO5ArxE5GQJRKUzO3vAlBYwP+NXOq+3LgOUZ
         G/8g==
X-Gm-Message-State: ABy/qLZ57KwXmIr1+UHGsx+ue2dLPXvG0bpEv/Yfl66UFgwfslyq5BSl
        8ujAvVSZfCKSYay08MXGG6plaA==
X-Google-Smtp-Source: APBJJlFHPyzFzeX3bmhyPptlBvzMocUUDkWVl+jZp4sieZNauvmgUPmEPb4MEghRkgJ+WED3kFN8eg==
X-Received: by 2002:a05:6512:2097:b0:4f9:5d2a:e0f5 with SMTP id t23-20020a056512209700b004f95d2ae0f5mr923679lfr.19.1688084680908;
        Thu, 29 Jun 2023 17:24:40 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id p9-20020a05651211e900b004fb7bb42de4sm1519351lfs.58.2023.06.29.17.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 17:24:40 -0700 (PDT)
Message-ID: <aab1883a-b367-f919-8ff6-d3e09ebc0ffe@linaro.org>
Date:   Fri, 30 Jun 2023 03:24:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/3] drm/msm/dpu: re-introduce dpu core revision to the
 catalog
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230629193001.22618-1-quic_abhinavk@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230629193001.22618-1-quic_abhinavk@quicinc.com>
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

On 29/06/2023 22:29, Abhinav Kumar wrote:
> With [1] dpu core revision was dropped in favor of using the
> compatible string from the device tree to select the dpu catalog
> being used in the device.
> 
> This approach works well however also necessitates adding catalog
> entries for small register level details as dpu capabilities and/or
> features bloating the catalog unnecessarily. Examples include but
> are not limited to data_compress, interrupt register set, widebus etc.

Generic note: this description can be moved to the cover letter, it 
covers the series intent.

> Introduce the dpu core revision back as an entry to the catalog so that
> we can just use dpu revision checks and enable those bits which
> should be enabled unconditionally and not controlled by a catalog
> and also simplify the changes to do something like:
> 
> if (dpu_core_revision > xxxxx && dpu_core_revision < xxxxx)
>     enable the bit;
> 
> Since dpu's major and minor versions are now separate fields, lets
> drop all the DPU_HW_VER macros.
> 
> [1]: https://patchwork.freedesktop.org/patch/530891/?series=113910&rev=4

Please use `commit aabbcc ("do this and that")' in the commit messages.

> 
> changes in v3:
> 	- drop DPU step version as features are not changing across steps
> 	- add core_major_version / core_minor_version to avoid conflicts
> 	- update the commit text to drop references to the dpu macros
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry

