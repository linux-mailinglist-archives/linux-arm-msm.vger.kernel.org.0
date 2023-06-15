Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF8C731691
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 13:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244933AbjFOLbg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 07:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245084AbjFOLbe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 07:31:34 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E966272E
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:33 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b1acd41ad2so25734601fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686828691; x=1689420691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+R28EYMi3DlJmTBU7U1geaSX05Z1OjPxPWagMOu3k88=;
        b=TE1/Xp39sVTPGA1LLhCwGizAzjrW93eQzCiuBneFqQvMKNu5G1jQtEeluJMahEk71O
         gZdlWKafsKY4CX6/a4mZTx2qGDDS1T0ffl/eD3SM0E/sso2nhDRFnrY3R1Pym80o3wyQ
         RD6PYBUHIq5AIXPsFRS9QAwcxz7mrNevjrlLTkGqteFu6xI8hWgBmTG5ul+U7ZctLxmP
         5tQTE0KbhB4OPLmF4duSsLfveaGx7Dm53YpN+DnswzDKaA/lICJEiuz771xwuwrw9olp
         jE3UbraVGbKHZTAc2XYuWu7WRJ0POVtydVPhmMWu/IX9GMbMQlqZifldCOr/0tJbPPxO
         nuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686828691; x=1689420691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+R28EYMi3DlJmTBU7U1geaSX05Z1OjPxPWagMOu3k88=;
        b=CrDVcT/jgGSwVmd+vbZLKZgW5GpoOoa5nBbaYIW3zXLD2eKnHKY6K2Vw3YyfFV36a/
         OFDAsGbu+ZgqEGx+QP2ygPD87Ag65isM29YIwTEf0dgkq8wzmVKb7ENYq5PNJOJeWhGr
         VukOhJA+HBI3Oa/7TaWRIIN1Im8L/Qhbij+ymNs5Okc0fQ0/M/XvVHxWktaFl7huaJ+k
         6UOepcIz2Bq2jxy790aslVeDTK5TAFCgaEi7NXyYV/o0QrKteXlKkm8G1Y6RFMbAaLKQ
         ZqZnKxGP1n165GXprAoWfvCvV7H3JXzZK2eqg4qzwW1RPXpm4ogS6UD6GF442y0lznGT
         Tv2g==
X-Gm-Message-State: AC+VfDxoHVJQblKCSNt9EUBj47IgQXLRE7vNyD7bkD3vb0JvUny+GFT8
        Zc8TZ8W3PhXNRiVphbnaYKnvrsdkFwWuiHtkJ14=
X-Google-Smtp-Source: ACHHUZ4SWQ0MBhu3MEQ55/IpB7XEmUn0DFpajcifAL+IgjEtUcqUI1UprpO7jJFGAxBjf69hp5OpxA==
X-Received: by 2002:a2e:a316:0:b0:2b4:48dc:4fad with SMTP id l22-20020a2ea316000000b002b448dc4fadmr668100lje.5.1686828691621;
        Thu, 15 Jun 2023 04:31:31 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 04:31:30 -0700 (PDT)
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
Subject: Re: [PATCH] drm/msm/adreno: make adreno_is_a690()'s argument const
Date:   Thu, 15 Jun 2023 14:31:21 +0300
Message-Id: <168682860389.384026.3598956001805387481.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612182527.3345786-1-dmitry.baryshkov@linaro.org>
References: <20230612182527.3345786-1-dmitry.baryshkov@linaro.org>
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


On Mon, 12 Jun 2023 21:25:27 +0300, Dmitry Baryshkov wrote:
> Change adreno_is_a690() prototype to accept the const struct adreno_gpu
> pointer instead of a non-const one. This fixes the following warning:
> 
> In file included from drivers/gpu/drm/msm/msm_drv.c:33:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h: In function ‘adreno_is_a660_family’:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h:303:54: warning: passing argument 1 of ‘adreno_is_a690’ discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
>   303 |         return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adreno_is_7c3(gpu);
> 
> [...]

Applied, thanks!

[1/1] drm/msm/adreno: make adreno_is_a690()'s argument const
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b263325b4f34

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
