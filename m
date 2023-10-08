Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 260D87BCEB0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Oct 2023 16:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344827AbjJHOB2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Oct 2023 10:01:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234334AbjJHOB1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Oct 2023 10:01:27 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 295BA8F
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Oct 2023 07:01:26 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so46472081fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Oct 2023 07:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696773683; x=1697378483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apniIjixKvqckL9Sm3hOvmNcpwUz/iON/HgK/A5yGAU=;
        b=m5LZQ3Nn/NjXmbY5zQAGGoroZvU75CHl3WA4n8WZMOjPXUTqw1JDXGHOY9x7S2RvrB
         v8M+RPLeu4SlJ3xm6Z2rUlBvJsG+XCVlCxLHn5QEnNNQE4EHpz116v7T1AbfwkIvVV1v
         pP64DtLzBEn5q8IJ2iJqnhNAtADwUb25uG9zxGr4tKWZ7D6yTDO/5pChJUgrNpjJ6jn8
         uFIYJomxi2wzlT+6mbNZkXJzNyklcHtSRBK3gi9V4GUKjHbfJEbRCRgXCaqVUHmori+2
         BYJ3KGw8SbfXppPooeeN5MGRgp4Hh8Bdq9VWBzSC0vDNuHVf8hf15R/pD4cTtFLRghs6
         qjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696773683; x=1697378483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apniIjixKvqckL9Sm3hOvmNcpwUz/iON/HgK/A5yGAU=;
        b=jioPX7Y7wvX1cQKxYAWv14Migr8i4h5eJ4z1Q34matXAYD/ftjKQ77bbyRQ5c3CkXK
         0ANvIZiYhjsCJBkGWj6gffgx3ovM1XASCjq+YlBWTf3yGH/ikiCRtFVcA2sH51mzIPwU
         bB8symGOaGU0trty+voD12tkJysZy45X2x2zp5MMK60ISsXqeT2NA+fJMphKOaP0/Mpj
         M/2W5qjoqbd0k0qAMccsY6qRRoIaoRIZE2YA5tkLVPMKqF+zi/9uZK6xZDXXlkaG6xDB
         UkkkKFotE+BGv/q/pvhLr4uS2AuSEXhNwl1+p0fmjP+I5EGSiikx07vdchHsb5HBDZyC
         1teg==
X-Gm-Message-State: AOJu0Yxb+DFm/ce36vF3slCql1e57EOL3EZGBkHnkGe8HS7oAQgbJNha
        szEE7WTDWVS00khdOcDWOGulfw==
X-Google-Smtp-Source: AGHT+IEyDzFGaiYy77HWqEHLP2FOooiZCpC/5v+tlr+lfavdl6lZ5i/lgD4uei9YtKP+WFzkew4kVA==
X-Received: by 2002:a05:6512:32cd:b0:4fa:f96c:745f with SMTP id f13-20020a05651232cd00b004faf96c745fmr12756503lfg.38.1696773683615;
        Sun, 08 Oct 2023 07:01:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q14-20020ac24a6e000000b00504211d2a73sm1080455lfp.230.2023.10.08.07.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 07:01:23 -0700 (PDT)
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
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 0/8] drm/msm/dpu: change interrupts code to make 0 be the no IRQ
Date:   Sun,  8 Oct 2023 17:01:14 +0300
Message-Id: <169677306919.2570646.15759097589934726278.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
References: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 02 Aug 2023 13:04:18 +0300, Dmitry Baryshkov wrote:
> Having an explicit init of interrupt fields to -1 for not existing IRQs
> makes it easier to forget and/or miss such initialisation, resulting in
> a wrong interrupt definition.
> 
> Instead shift all IRQ indices to turn '0' to be the non-existing IRQ.
> 
> Dependencies: [1]
> 
> [...]

Applied, thanks!

[2/8] drm/msm/dpu: remove irq_idx argument from IRQ callbacks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a437d2ad57cd
[3/8] drm/msm/dpu: extract dpu_core_irq_is_valid() helper
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bd4c87f01ed9
[4/8] drm/msm/dpu: add helper to get IRQ-related data
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c22014a4f9d4
[5/8] drm/msm/dpu: make the irq table size static
      https://gitlab.freedesktop.org/lumag/msm/-/commit/88910969b897
[6/8] drm/msm/dpu: stop using raw IRQ indices in the kernel output
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e44535d80deb
[7/8] drm/msm/dpu: stop using raw IRQ indices in the kernel traces
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4961180f7420
[8/8] drm/msm/dpu: shift IRQ indices by 1
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2ebf933742ec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
