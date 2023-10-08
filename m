Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9B67BCEB9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Oct 2023 16:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344849AbjJHOBf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Oct 2023 10:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344838AbjJHOBb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Oct 2023 10:01:31 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E467D8
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Oct 2023 07:01:29 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5043a01ee20so4420643e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Oct 2023 07:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696773687; x=1697378487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxakH265LpATzSTaf30OW9So30zUQfcE2yrNl/MhWDo=;
        b=dU3x9p4iOX75EpYEqgQ37wy734/yJbCHn/7k5zGHeyOwquq/6Ip9SQoxWsEhlOvw1d
         i9Xkb044JdQT3z/7Wwh4FY0OCZfcoW2jVHcagOhSR+7a2jZjzLqfmJp6P7kWEZe1x7JW
         9Bb7wj/sednYz8K5bIkHrqJidBZVajOix86PmLCCMw7MBYKjGxm2xEDNiNP2gYVosH1R
         HcxYpLqrqI6w9Q9gNo1GKDJMmkVjE0ur4n4kXfMfAN2Ht9koA6Vq0JU5QrbkThi2xzDq
         il3T+hSVMzJBaZw4tcNEKoeysNez8vPJwqyvMWekikI40sFGIyhY3MqI4ze+3WrWXiGP
         em+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696773687; x=1697378487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxakH265LpATzSTaf30OW9So30zUQfcE2yrNl/MhWDo=;
        b=SUq3d4H3izkAiCqTApMupTZow/MBYPqrNqBs+gVNgReKPXoKRLdOsER2TAGQCexEo7
         0L1DtZw48tGs+kpzj5WKfQbr+h5RGlwUj+rRVcfnmUHeoJNWvqBB6ldMXCj7lFkCA+mw
         rUtEH9549r6RB0EBSSmMnWI5jyMJO9AOm8K+0XUD+6HFwpYbEzGlDrHPbtCgrNxviPnl
         flCZ1ykjWBe1ZwNPuZp9urCg0WrvF3B7Xn6MGem17ygsN1mpTjxirT0pVKtHRvwvFQAs
         sh2EpulOYbSs06/NwaSPPX1/54HI7XfPIBgppyhwTF8EGdwH3f55fd0Kjn+9iakcvqEl
         B+uA==
X-Gm-Message-State: AOJu0YxEnk2gDQhPMAavDapTApSgtVyUsUrMurkSYQYcaKDVJrO4mvwp
        1VMYBHfsMJ8mNl1OOi//44sJeg==
X-Google-Smtp-Source: AGHT+IEZhcTkbfnDMA0TmtMUY6GUYhyBTjDeQoEWBa7c/RqNiiO7pOQy12FcGXqIQaqK7WTV5qhK2g==
X-Received: by 2002:a19:910c:0:b0:501:c1d4:cf68 with SMTP id t12-20020a19910c000000b00501c1d4cf68mr9460445lfd.15.1696773687355;
        Sun, 08 Oct 2023 07:01:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q14-20020ac24a6e000000b00504211d2a73sm1080455lfp.230.2023.10.08.07.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 07:01:26 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Felix.Kuehling@amd.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
        Rodrigo.Siqueira@amd.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        marijn.suijten@somainline.org, bskeggs@redhat.com,
        kherbst@redhat.com, lyude@redhat.com, kraxel@redhat.com,
        gurchetansingh@chromium.org, olvaffe@gmail.com,
        paulo.miguel.almeida.rodenas@gmail.com, wenjing.liu@amd.com,
        haoping.liu@amd.com, Charlene.Liu@amd.com, chiahsuan.chung@amd.com,
        george.shen@amd.com, sancchen@amd.com, tony.tascioglu@amd.com,
        jaehyun.chung@amd.com, tales.aparecida@gmail.com, drv@mailo.com,
        aurabindo.pillai@amd.com, quic_vpolimer@quicinc.com,
        jiasheng@iscas.ac.cn, noralf@tronnes.org,
        jose.exposito89@gmail.com, javierm@redhat.com,
        mairacanal@riseup.net, davidgow@google.com,
        arthurgrillo@riseup.net, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        Ruan Jinjie <ruanjinjie@huawei.com>
Subject: Re: [PATCH -next 0/7] drm: Remove many unnecessary NULL values
Date:   Sun,  8 Oct 2023 17:01:18 +0300
Message-Id: <169677306919.2570646.8217027380730287216.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809034445.434902-1-ruanjinjie@huawei.com>
References: <20230809034445.434902-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 09 Aug 2023 11:44:38 +0800, Ruan Jinjie wrote:
> The NULL initialization of the pointers assigned by kzalloc() or
> kunit_kzalloc() first is not necessary, because if the kzalloc() or
> kunit_kzalloc() failed, the pointers will be assigned NULL, otherwise
> it works as usual. so remove it.
> 
> Ruan Jinjie (7):
>   drm/amdkfd: Remove unnecessary NULL values
>   drm/amd/display: Remove unnecessary NULL values
>   drm/msm: Remove unnecessary NULL values
>   drm/radeon: Remove unnecessary NULL values
>   drm/virtio: Remove an unnecessary NULL value
>   drm/format-helper: Remove unnecessary NULL values
>   drm: Remove unnecessary NULL values
> 
> [...]

Applied, thanks!

[3/7] drm/msm: Remove unnecessary NULL values
      https://gitlab.freedesktop.org/lumag/msm/-/commit/92a48b6ed510

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
