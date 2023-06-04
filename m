Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04D9D721439
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 05:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjFDDBt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jun 2023 23:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjFDDBo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jun 2023 23:01:44 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D01196
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jun 2023 20:01:43 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b1b86146afso14577731fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jun 2023 20:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685847701; x=1688439701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1X6WEtQyiptIxtD54x3vfD3H70MCzerg/dy1fYVu8V0=;
        b=Y9qE9DmKr3+7luq6lyoo3ph446uZQPaOv+f5sNK9nBEbTweY5lHFyEODPwBWSYvOcZ
         eOMHFVsvv9Cb7dwmY7/eOayugL0rnlTZhCck4P8nKs0ao0mCnbJGKjeiUcY43iIzK8/S
         10ZYW3v7b0Lcaf4MHVuq+YtfohtOEdXlM9NwQkm0xmMhUmtlY+My7acTKOkKQkJ57y8Q
         H/8EKsjG1SYX0HpGvw82QSFPOymgRRFgmdzSiG00cbp5STTnm3cs9Iro7riVajeTRUBG
         xnkdInqxTH7nZHkLhYyEaeaZQmqGZeOIDOmNwiIVWyfHhLIPu3BFryxztA29FElCPVmH
         T9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685847702; x=1688439702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1X6WEtQyiptIxtD54x3vfD3H70MCzerg/dy1fYVu8V0=;
        b=FVEwTJ4LekHDYR819LnQ01ubMR5mOgCqd+hB/3Xk1wS2jPi3SPKUT5aM/k9OSRRc4Q
         htgy5r6g4LvcXPbA6AaAi2jgzmDY+fpud5MgM0z9bPJCTu3cFKd6N2eC+3ky4bk5vwIU
         stm2VePxeLchtyPYPpd1+PjxCqQ5wpgoEXumX+S+PpFcs/ZuFFt6kAw9dOaq44RXz/WK
         vDbx7ozjzxyn6y4Ti25UOTUQggyjTbWBOU74cs3sPw16ZFu73+Ye4PVo+4wuueZpJDB7
         gCiBYgHhPGEsRoiBBQzXbAjUjMZahluEH6mZUih54rjc5XQbQENKxpA5tpRGmwEgCBaS
         adkg==
X-Gm-Message-State: AC+VfDzoKBuiDk1NdKiPopqTvEas3tR2TjyUp7eKTW+W5R9MRt28kCs4
        4sJSIBTxdqqktDKHr2/W5MRywg==
X-Google-Smtp-Source: ACHHUZ7asWJzyIiTNQO6ArOVaTdqSH/P/V4O1sVnyoBURumJ6VpsuYlpXql7+1bSFkxOwUacFcMOhg==
X-Received: by 2002:a2e:9f4f:0:b0:299:a7be:5775 with SMTP id v15-20020a2e9f4f000000b00299a7be5775mr2131524ljk.35.1685847701800;
        Sat, 03 Jun 2023 20:01:41 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 20:01:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] drm/msm/dpu: drop dpu_encoder_phys_ops::late_register()
Date:   Sun,  4 Jun 2023 06:01:29 +0300
Message-Id: <168584750429.890410.14758172280740009870.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
References: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
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


On Sun, 21 May 2023 22:22:28 +0300, Dmitry Baryshkov wrote:
> This callback has been unused since the driver being added. Drop it now.
> 
> 

Applied, thanks!

[1/3] drm/msm/dpu: drop dpu_encoder_phys_ops::late_register()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/95666ca7431c
[2/3] drm/msm/dpu: drop (mostly) unused DPU_NAME_SIZE define
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a659098d78d6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
