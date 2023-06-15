Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89F83731690
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 13:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245363AbjFOLbe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 07:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244888AbjFOLbd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 07:31:33 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC40271F
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:32 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b35109e934so18370671fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686828690; x=1689420690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEH34TZYFNlcgXLePl0rUEbgPVtd5P4NQ5yQ1rh0Ycs=;
        b=wPLej/DcXFmA7QyhANWlKW7XEHFm4RxK5csM8/Wxyo2gaFDJDzEtOLH/7FcUdjhuFl
         HjxgoLRttLDvBl9PDyPA4A3deeUw9TnrULc186HFhuudq2hSmNBPunPx1rjFA/gWFPxi
         6fkmPA6ces7a4Jf087biEp4cyt5ZJRP1UomrXpyxLjaPlaNtCWcwRMbQwOsCk16iCeFH
         zRvbxxIiz6MuOwV3tasE6Nlh9kT35kprdAqg+3mFkUS+Ry0h7Xy928Rj1OyXRKcNeLTh
         101oWFMYs8yP7VtA+sDWpHpfqaqTYbUB4tueHAs8ZnY5xEe5zW42svVCXpl0qHtDP7Lv
         NicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686828690; x=1689420690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEH34TZYFNlcgXLePl0rUEbgPVtd5P4NQ5yQ1rh0Ycs=;
        b=fC2L9iu38O3j4De+A3TiZkNV4LM9vXh2iGZTEzw8OOIroeOQpf3JM4wsAFRFM1f+rz
         SxtovFPWAd9rPnl56pjosGVufAYTjVSvDnas+WGjgvMuED6zYqiGQUvRlW2TDSYIBDlO
         LDRCIlUsdnCEWqrIuhkMpr2/8mWUW11AowtmE4FJMrVzcC4YMXyE9RS0ZI6mROdNSNVN
         24cahUIPtGEaUsfMeJFM2ILaiBdkVMf1QuVvC2M6WX4de4kcVCyjvrV+xNWmddn3qEOC
         nNtQRnvB8CpC5z33vENMU4GQj+q3kEAaY3WyPiWrjJvtf7vxKDJ5LA64RuDkYiZLf7hH
         33Pw==
X-Gm-Message-State: AC+VfDxo/VeUO6tA0c8/+rWEDG1cgQmkQpoqaWjMXMAT0kAOEevYOCWi
        HuGyaTgQLbHV68UVuFk9Gap3tA==
X-Google-Smtp-Source: ACHHUZ5gOziE7LMMkWYZY0KDLUukoRZuf8MqOClCFeDYczkZvamTgwDM/zUUN35yU2xAfqg1R9IlEg==
X-Received: by 2002:a2e:6a09:0:b0:2b1:c039:e977 with SMTP id f9-20020a2e6a09000000b002b1c039e977mr7678787ljc.16.1686828690424;
        Thu, 15 Jun 2023 04:31:30 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 04:31:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Degdag Mohamed <degdagmohamed@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] drm/msm: provide fb_dirty implemenation
Date:   Thu, 15 Jun 2023 14:31:20 +0300
Message-Id: <168682860386.384026.12795500183060045026.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 12 Jun 2023 06:16:15 +0300, Dmitry Baryshkov wrote:
> Since commit 93e81e38e197 ("drm/fb_helper: Minimize damage-helper
> overhead") the drm_fb_helper_funcs::fb_dirty helper is required for
> proper dirty/damage processing. The drm/msm driver requires that to
> function to let CMD panels to work. Use simplified version of
> drm_fbdev_generic_helper_fb_dirty() to fix support for CMD mode panels.
> 
> 
> [...]

Applied, thanks!

[1/2] drm/msm: provide fb_dirty implemenation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fda520976ef4

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
