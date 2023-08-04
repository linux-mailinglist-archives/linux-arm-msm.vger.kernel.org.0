Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01DA37704D5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Aug 2023 17:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbjHDPdb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Aug 2023 11:33:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbjHDPda (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Aug 2023 11:33:30 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758DC49EB
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Aug 2023 08:33:26 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fe48a2801bso3882916e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Aug 2023 08:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691163205; x=1691768005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZ+UX1NFwtdq8c+iNmJ6Kjt37lTomrC2VolEknshN2I=;
        b=FbnVAHsKr4U1dcpMmZk1EFlJmERuXHrZkmOGYjmh2gKCAKrRGwLm4ooHJWQlqHYQmo
         6KQqNZvfDMu1RR42234Gn3XodSlUVEvP/reVoUpLvgOKliqyYySYJ5PkgcxXqKgOshio
         UzYD6h+bNfiIAcswQwtwDd3PJhkxGzBUpPVJL6mUekTZUpySWg/AUJT5s5b2gTLsGzqg
         EObkcpIasQXl1TYTSg5zN0ORw8TgMfYNOhAJO4w2YtMl+plcdLMePrYOi2sNJzyshhwL
         1cL9yreZMnSABTA7SfrfMnwky9dv6/6mp6swbzglyC9m+dkzPKTUgLHqbY8los7kuioD
         Vffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691163205; x=1691768005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZ+UX1NFwtdq8c+iNmJ6Kjt37lTomrC2VolEknshN2I=;
        b=T0NxMm3lhO2Qr7KhukTvXlfgPgoSxkugE0BVIsBOq0Kc8z0sNc9TnLE4RqOioYmps8
         zaeY/4zForQqd/fpQgrZB8VcJsVHfwAP57XNwF7Usp2o5/OW9VaBFirNMv/HRAyjbI11
         MGNFV1YqEuuSgbyCpT++mo2bhLCRKrjH/KvNXje69uLTNFdGOUXaWrGXXt8VNYUPBjof
         v7cAymxyZTscEoiMtHAJtcc7QgbHB22oWWSh3g518DzHizMiAhCVY+E5H6B8hUCvbEgF
         1DIaQHxORxWfy7oG/IbKcC6KZLmpgEBwNrjzlgGaYP7vwq97q7vpmM3VEg8CBA1VCOLl
         8FUw==
X-Gm-Message-State: AOJu0Yx6prPZiqTuF1xWaZbkOgjGc+KvCRigCA7F6Y9yYLN9FuTVCAKR
        72mTuQ/MCbPUiwLKFSzHYaTvqA==
X-Google-Smtp-Source: AGHT+IHPMJn8VQ3AtatE6gTGK3ZvQ45T13iV669EXbp2wGSgRQ16VEeobcma+WYpj77O1b8gMGqTwA==
X-Received: by 2002:ac2:48ba:0:b0:4f8:6e52:68ae with SMTP id u26-20020ac248ba000000b004f86e5268aemr1457306lfg.31.1691163204836;
        Fri, 04 Aug 2023 08:33:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w12-20020a05651204cc00b004f873ca4139sm411874lfq.71.2023.08.04.08.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 08:33:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: Drop encoder vsync_event
Date:   Fri,  4 Aug 2023 18:33:19 +0300
Message-Id: <169116308156.148471.598909628622762541.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802-encoder-cleanup-v2-1-5bfdec0ce765@quicinc.com>
References: <20230802-encoder-cleanup-v2-1-5bfdec0ce765@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 02 Aug 2023 10:01:13 -0700, Jessica Zhang wrote:
> Drop vsync_event and vsync_event_work handlers as they are unnecessary.
> In addition drop the dpu_enc_ktime_template event class as it will be
> unused after the vsync_event handlers are dropped.
> 
> 

Applied, thanks!

[1/1] drm/msm/dpu: Drop encoder vsync_event
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fdcb8fe0c9f0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
