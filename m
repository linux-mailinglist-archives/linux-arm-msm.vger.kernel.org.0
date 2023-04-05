Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFC46D71C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 03:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236733AbjDEBAm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 21:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236731AbjDEBAd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 21:00:33 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938974EC3
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 18:00:05 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id c29so44613424lfv.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 18:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680656403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GcoiMrViDnZHlrKyL7yBvDwh3HgZ08tXcqNo5+Sq0gY=;
        b=IhVO4NXV9rPbDyCa4YIAqIVWEciYhWbG6JqaO5Qk9pT113glq332E9MZCWmHicRTms
         Roe+goawdwXsFvBDJq9fpq/q1C28ctHI5vmQJ3AbLTdVZgpbFH3itOZKc0TqBhJx1Jvh
         L0PRYGLb+/rs0C+j/UyzfTocqeBj0mPNaDQps7EtJegZ0OPv6KT/9ds5c90BtpHmyEKc
         Qr5uNO5eFNODRPWuY8Zp3dl+KDKaSyc0JHNa2ihMDoMAideoxkQtlLBSKdmnOqYVPcjj
         74tOPAsNd/pSB4kqFZvF7H1Ih8J3miAU/rnktCfh8idyPgNFzj88PXG31YHpOzwPU4eP
         dncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680656403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GcoiMrViDnZHlrKyL7yBvDwh3HgZ08tXcqNo5+Sq0gY=;
        b=kO7ac5W+Z5DuHt0nQYfMFLafeYw2gARyqkLrL+7PZFzoLfF7+cQwkkfRvdIuroXnc7
         YaUy7NFis0FA4dCYdclLYspDoSVrN5JE+kgNTcwGxh4CnaOSYcOSkXoVT4n819p1SI9Y
         pnSqIdZFGAvywLVeQ3DSbGTBZZwoTZfAXfv2+94obrHOZosjQhPyi4uj+oulVve94FGY
         ABjdg1fzVNvH2S8tgvL7TymEoWk+qBDl95PWXEwDTtqCfrWGf7ZlSv8fR3Z2hY10+mlR
         yMSBGtgmaQwXBgD4WGQ9cgJhlE19amsWX34ogLD2cwg1ZgjvgqGyOBjFkDLmp/xBL6x5
         9gXw==
X-Gm-Message-State: AAQBX9dvKkT56yWIN9Nx6JTvxuz2kaRv8sS0qIa5LeL+llMoNkom/eXu
        NHTNTJo2FqQG/1XrABNgaI8LzCbV0gCmUVRQRpUC2w==
X-Google-Smtp-Source: AKy350bk28Ecr3+zl0vqVdiKvr+VWBUTdlhCWa7xakZAat4a+MhCn21kqM0agi3rq3dRhXJewwoLgg==
X-Received: by 2002:a19:c50b:0:b0:4e9:a75b:cccb with SMTP id w11-20020a19c50b000000b004e9a75bcccbmr1149700lfe.28.1680656402964;
        Tue, 04 Apr 2023 18:00:02 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w9-20020ac24429000000b004eaf6181a32sm2570310lfl.75.2023.04.04.18.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 18:00:02 -0700 (PDT)
Message-ID: <8a87358e-e17e-eb2f-4a21-082bb272537c@linaro.org>
Date:   Wed, 5 Apr 2023 04:00:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH][next] drm/msm/mdss: Fix spelling mistake "Unuspported" ->
 "Unsupported"
Content-Language: en-GB
To:     Colin Ian King <colin.i.king@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230329093026.418847-1-colin.i.king@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329093026.418847-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/03/2023 12:30, Colin Ian King wrote:
> There is a spelling mistake in a dev_error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

