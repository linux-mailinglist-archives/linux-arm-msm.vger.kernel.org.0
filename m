Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 159BE6CCD85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Mar 2023 00:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbjC1Wig (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 18:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbjC1Wi0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 18:38:26 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE37030FA
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:15 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id a21so6997524ljq.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 15:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680043095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzrHNhj4mC5D3BSVzsRn+bfppIAJb6omjbQHw5uSNww=;
        b=wiY9wELxeAw8XealgU0KrNeoQG7lMAOp1Z/t/H/9fpFrj99bdXDk3xvoZyst7EUVWh
         RALoCZF9lRQxK2hdARTVKrS0gQyoNnbezfUpz2E+T+FoKtfvI+9SRy7DvFmTJLJZW75+
         gkVF8nvXaO9+/VFTZ3x6CAYfryI+g8kQNSqIBmDgm/UQcOQrBY5XCViAvCDHm32N/Hz1
         rsx6cCol2oD9Gghtf3CwwequBRhFts3H7PWTGu29iue2gx+yu43CeOWgSEr7tHFUJ02k
         Fl/LiX33mznL3PzpUvaAV+qhtNDlapAnb8+ljW5eIeHJLmoXxmpIdZOzugE+KSnkO3tt
         JKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680043095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xzrHNhj4mC5D3BSVzsRn+bfppIAJb6omjbQHw5uSNww=;
        b=jy/MufHOrpJvlY3Dp4KcRmde7wOfi02B5y8Mm4cPHsXykhjidtaxD2o0lXZwTevnO8
         7R6sSHPknKJs0fAcK94y14gy+czsvLZXfH7sgg9I1nyBvBQPIN/SVA84fq6c9MTXq6Uz
         Nz2wVbXg8FQ81JOXungZ0erqExyBb1wYcOn5g1roFykR8eQTAx6r5MhojRQx1jNdivto
         FLZOdFshKNLjMH5fgqP1aoEUtMpskPX+DDUdGD905uTXokNIo0yFE9wBHcoQ8AioriGB
         xbEDFVLSF3NWlLKO0lXbF8vn7Rit1tYa8FFHC/zZB226JSvlf3zmARYFvZPK77Qp8UCu
         FUKw==
X-Gm-Message-State: AAQBX9cG1tI0fADe80j7RlXXBXXV/zc9j8CFZYtCpsAe8OS+wXkX7lL0
        pCiHIQq2prDjK6iWTImlq1a9iA==
X-Google-Smtp-Source: AKy350YPdYgCgBPwMF71vrPCJWfK+dspAXZuTvv4O48LPCzNaPLnY08jSnb2j+86thVL4IGtKMf0qw==
X-Received: by 2002:a2e:7c06:0:b0:2a4:44a5:d4a3 with SMTP id x6-20020a2e7c06000000b002a444a5d4a3mr4760700ljc.0.1680043095309;
        Tue, 28 Mar 2023 15:38:15 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9d16000000b002934d555783sm5199522lji.6.2023.03.28.15.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 15:38:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Danylo Piliaiev <dpiliaiev@igalia.com>,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Rename drm_msm_gem_submit_reloc::or in C++ code
Date:   Wed, 29 Mar 2023 01:38:02 +0300
Message-Id: <168004255460.1060915.10055014271321088817.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230326163813.535762-1-robdclark@gmail.com>
References: <20230326163813.535762-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sun, 26 Mar 2023 09:38:13 -0700, Rob Clark wrote:
> Clashes with C++ `or` keyword
> 
> 

Applied, thanks!

[1/1] drm/msm: Rename drm_msm_gem_submit_reloc::or in C++ code
      https://gitlab.freedesktop.org/lumag/msm/-/commit/be7772e53681

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
