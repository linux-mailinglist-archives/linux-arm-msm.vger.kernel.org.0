Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEE016CBFC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 14:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232921AbjC1Mv7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 08:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbjC1Mvg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 08:51:36 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7C3AF34
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 05:51:00 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id o20so9505144ljp.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 05:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680007858;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oPp+3nUFhZ+YccWkOIH56CCwebX/zcxyGIO1u7xt7XA=;
        b=UMUoBtzi8Lljz2Sgb34U5+xP6Cu5rQuIeiaCyv2PE0Qy2pb0JDEUpuRrub0zyOxEpG
         Cz6ta8fT083O124Iuv8hNxLEjJEaTEwySKZRBOCj4XCsSnnCQsJJd1SbR1KDebBCx/UD
         W8Ju0NAR93gKRNTOFefaA1HYM9rkGhZPYuap7A75MkKBehF60/Cc+O93aT6FvX6pfPzb
         3i76DO71uzn07NOuoPLptIeTq79g+lpO7aYaikD/lxpuEbfGnlTogT3qhMT1dSSlSfbO
         4HAwb96diIMyQTLi/KEOP+kT7Khau+oMMDYhtMZgdTEZAduqhqmlh81XdhL6BnLxG/9b
         7Fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680007858;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oPp+3nUFhZ+YccWkOIH56CCwebX/zcxyGIO1u7xt7XA=;
        b=Rio3qGXYa5Mf49dDxJiP4Wm3m3Z3D2Wo6ImFayNSm6ofk+JXTRshMLuccdUXKTDC9o
         qozuNrvUJExf0q+B8KyFUsWeUKj1lJcbfZUOmYLDDcxAYCCBVpyBYpdSTSs5PpULjEO7
         U2iMmH3w87zdQ3ASyePXCAr3ZveMPzOiz/gtEfJDQtn7vZ3SkQ9//TkUH1Wke3wrcOv/
         In6r9uq0Yt+AP54G8J2t3FcrclRkTEPZR7mEgEfQfzLquScjF8Od2B3TqyIt3T5OPBj/
         imR+3HoVO6iqr/ZnS6Y5p5MkVdmmzCzaf0Hw1ipJ2DCZNxKD13se1GuYPbbZMsOZyKoJ
         VX/w==
X-Gm-Message-State: AAQBX9d7haYgHB8rRR2v33Nh9vwDb3JSvJTmUhm59ilzOuNnUIU++jNE
        2NBUDCynrVj1TRlRn8rQGBElJg==
X-Google-Smtp-Source: AKy350Yfu+WCDB8OJ9f2IMPSw0LR1xCUAsN/WKbV1RchlDNRGKaVMzSWeu/KVaJJcuMAw7GWBZ8XcQ==
X-Received: by 2002:a2e:9d0c:0:b0:29e:4fa5:1708 with SMTP id t12-20020a2e9d0c000000b0029e4fa51708mr4844998lji.3.1680007858273;
        Tue, 28 Mar 2023 05:50:58 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y2-20020a2eb002000000b0029b32a40934sm4666781ljk.113.2023.03.28.05.50.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 05:50:57 -0700 (PDT)
Message-ID: <40178a1b-4a97-8f18-74ca-ccb1fc7403d4@linaro.org>
Date:   Tue, 28 Mar 2023 15:50:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 08/10] drm/msm: fix workqueue leak on bind errors
Content-Language: en-GB
To:     Johan Hovold <johan+linaro@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <20230306100722.28485-9-johan+linaro@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230306100722.28485-9-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/03/2023 12:07, Johan Hovold wrote:
> Make sure to destroy the workqueue also in case of early errors during
> bind (e.g. a subcomponent failing to bind).
> 
> Since commit c3b790ea07a1 ("drm: Manage drm_mode_config_init with
> drmm_") the mode config will be freed when the drm device is released
> also when using the legacy interface, but add an explicit cleanup for
> consistency and to facilitate backporting.
> 
> Fixes: 060530f1ea67 ("drm/msm: use componentised device support")
> Cc: stable@vger.kernel.org      # 3.15
> Cc: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

