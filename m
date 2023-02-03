Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C91E768A1ED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 19:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233199AbjBCSYV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 13:24:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233436AbjBCSYU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 13:24:20 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C564ADB95
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Feb 2023 10:24:13 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id dr8so17622196ejc.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Feb 2023 10:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54FW5UQ57LYDUUaOoRG1eWQLZeg9cuZyn479cV2SDq0=;
        b=gfqECzwoBp8RaT3ApZKy9Fa4Cy8hWotg/eNuNS60VzcZiIkoWliF7jfw3EeDDJnXct
         U7wPZ4oPF9qNZGbFnpYIpXdWE25M3/e3Dvo/SaeP9falxVNKrT4/KE5rdYZA5KD/cQ8Q
         ZWpOZzhtWTmSQFaXT0h2U8sXq5AKoQWBa+3URYLHImXAFtcuyamT1nbQ5B5v3cLRLtQT
         +n62I3dpd2CxplrS5VYb0Ne8Wvbf3rjVx7n5XXlWPZRm6YhpKWF31pBKfXUP1c59VDgI
         UWnROeNiyIb26QFY7G2GCmw4XtxTPEmsDxKs6YLVMBhC5jhHco9nOVgKUPORuyQjxuXI
         2XrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54FW5UQ57LYDUUaOoRG1eWQLZeg9cuZyn479cV2SDq0=;
        b=XHKL5Ipii8kpFFYmqhO7cH0tqpmMQ00x+8KeT2hhGX9zdZdf7iVE5hi7xEP5kDJlm8
         OJCxF7TTd1HOGGJHmxovlHUigds4nLCsRBa04/Kzm4t9xHvuB0EeBESg9rfsdHMEjrLm
         ea8JpxGUHQPn444Du0/mmaFaHB7NH6BHUh/x955zAtLLcQq07MfRPjeSs9A04A95WkXD
         mtO4YpqDsiojl23su0ZNetsiPpZHclZxSN3rjegNYZrUgryWTG5ZzveJRj9wqQ4qEpMI
         DpCnjf9VM7YIsPkTY9F1jM8i1qbhv4qO4QTCpcuTLLypiZ3qSE0YzLcKd+kuZ8Wr1L7S
         7AWg==
X-Gm-Message-State: AO0yUKUEyirWkRjBgvTNmmSngSO+LGjQTLfJKY8mXY3JqPUwdLwOOqcA
        30I+vc+u4/6PRZ/guTNvSSV+SyFcufM5r9pN
X-Google-Smtp-Source: AK7set/jRLYp2R0PI3fKAjVVQSQr4euujeoFEw8ZsadsYOId/b2rRWWXXOcVHh+zgdp4jBoRGCqp/A==
X-Received: by 2002:a17:906:94cb:b0:879:ec1a:4ac with SMTP id d11-20020a17090694cb00b00879ec1a04acmr9868422ejy.76.1675448652002;
        Fri, 03 Feb 2023 10:24:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id x16-20020a170906149000b00889c115cf6asm1713775ejc.145.2023.02.03.10.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 10:24:11 -0800 (PST)
Message-ID: <27c7f706-ba8e-c743-0465-1ca2381d12bc@linaro.org>
Date:   Fri, 3 Feb 2023 20:24:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 00/27] drm/msm/dpu: wide planes support
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/02/2023 20:21, Dmitry Baryshkov wrote:
> The review of the first half of v2 took more than a month. Let's update
> the reviewed patches in attempt to get the first half of the series into
> the acked and mergeable state. This would allow us to lower the impact
> (and the patch count). At 27 patches this series is approaching the
> limits of manageability.
> 
> This patchset brings in multirect usage to support using two SSPP
> rectangles for a single plane. Full virtual planes support is omitted
> from this pull request, it will come later.
> 
> Changes since v1 (which was ages ago):
> - Rebased on top of 6.2-rc1
> - Dropped the controversial _dpu_crtc_blend_setup() split patch
> - Renamed dpu_hw_pipe to dpu_hw_sspp
> - Other misc changes

I forgot to add it here, please excuse me:

Changes since v2:

- Renamed dpu_hw_pipe_cfg to dpu_hw_sspp_cfg
- Added a patch to clean up src add / layout for the solid fill planes
- Fixed several comments and commit messages which caused confusion
- Added documentation for new dpu_plane_state members
- Slightly reworked dpu_plane_atomic_check() to make it more logical and 
obvious

-- 
With best wishes
Dmitry

