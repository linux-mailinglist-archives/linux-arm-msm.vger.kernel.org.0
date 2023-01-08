Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA9E661B02
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 00:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233986AbjAHXMt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 18:12:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233145AbjAHXMr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 18:12:47 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DFB5B4B0
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 15:12:46 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bq39so10498575lfb.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 15:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uyFGGVLs/X6oL8cfpRetF9oZ4VlqVuFMXwGIYKkQRkI=;
        b=aG6LThJZqWRVweoJO0jwQRjFwKWagT5dK6iw1vNYa/3/jb36t7n28l4RiVNMMLp+TL
         V4vYPcOBkysP+/81wr9FLgC46uEDwyG+H9ov0vjKzenY25TODIePHBa47NTg57a/NeDb
         LYTs48iYMrtkGH4nrlZVI7opycnG8sFve32x+GwWkf0vas7KlbIA+4y6E7P6ymWt3e/t
         iphUJilhxSgyDbYf5z4om8VYBZ2+5TzgYJHV9d4zr+fkLRWbZhj5kyDhqCYp4E65EslW
         /v9SzJEENG7HYFRK/tG/Q3XsBUbvpP3AfaXQ40BPaNJtBoBFqlWGXIj1tJH6MLwymTWF
         JZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uyFGGVLs/X6oL8cfpRetF9oZ4VlqVuFMXwGIYKkQRkI=;
        b=GskJdNZk8ZOe54ich1esDtGQK5rHXQSNQlORxllZrLCT9w7qpqfmLVTlbE4aDfU+KE
         Z+A7DBg+JlAqXeoPLMagIqQU4Qd15QSLPFHpQ6gFsI66RfWtz7RnOBptfI+M3r/l2fWN
         LiIo6ljsL29xGkw2Q29wI8xUpstzwFX+pNbHQ3V8GkmAwjm/VcQmIRwcpljpZtiwg56x
         Z+OZeOfb5nibGM4uXqwvCnqNqAuKrKxiz2QsgvAONG6sdBByilSyWrEVjCyvJKCUwRoE
         mhj7Iz/CCwYnP5R6efqWHU8rzLLm9Aao1Ov+b0VSN5rydV3eovGPb0AHSbFOeD89fwK0
         v7gw==
X-Gm-Message-State: AFqh2kojqoHJFr+1syPE5mD1zeEstksnY6/5jLcglqYSL1Moz9tEbs4E
        eMy7shj1FNPbLriOpSbNhs4o1w==
X-Google-Smtp-Source: AMrXdXtBO07Ci/cm6XtwIo7+eG+FyzqM0WTNU0N/lz4hEY76r1feVjhiX6KA8dHnX1QRCX23G/Qjcw==
X-Received: by 2002:a19:f517:0:b0:4c3:35b3:9a0e with SMTP id j23-20020a19f517000000b004c335b39a0emr15285692lfb.56.1673219565005;
        Sun, 08 Jan 2023 15:12:45 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id du3-20020a056512298300b00494978b0caesm1266728lfb.276.2023.01.08.15.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 15:12:44 -0800 (PST)
Message-ID: <dfb08b6b-af9a-e96c-fae7-386f70815455@linaro.org>
Date:   Mon, 9 Jan 2023 01:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/6] drm/msm/dpu: add support for SM8550
Content-Language: en-GB
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v1-3-9ccd7e652fcd@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v1-3-9ccd7e652fcd@linaro.org>
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

On 04/01/2023 11:08, Neil Armstrong wrote:
> Add definitions for the display hardware used on Qualcomm SM8550
> platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 197 +++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h    |   2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |   1 +
>   4 files changed, 201 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

