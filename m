Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFDF073168E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 13:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245338AbjFOLbd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 07:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244933AbjFOLbc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 07:31:32 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382AB272B
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:31 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so10225108e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 04:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686828689; x=1689420689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbafB7CFldn/fkM2UpPUe2mkTVmTH3y0rkj38+8JLV0=;
        b=NC8aQtqVZ0za+j3+jkuyqg7gpl2clA4y9LK7dbY9kjM+DyapLMNII2U32RFEHfDJ/X
         kko7WS/r5bTt0pxMKt9WLMGrdPCalB50BLQqNxmcqzofAF9idKkzwTKhsdrrSOtVqoMO
         wJpcYXOp/Ix4mqZaX2OXQmFuKj++2wCHcMBxHNP3f9eHMhDcb4Ie/ZlzukLUgT8lNZAe
         LXPGGpemSWQp2GaiN3Gxk0GIk6oXWgfMt3lNSGXDJyiD2E+YHWlNFc4QjGE6Q0YMs5YE
         TXHjDGDBDZT/o+0pjo85pgikbNPsFeCEOvly1cqIgVqbgDQ7p2umYTCekkXbvsD+j7Hn
         XylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686828689; x=1689420689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbafB7CFldn/fkM2UpPUe2mkTVmTH3y0rkj38+8JLV0=;
        b=HrD5VsWazoUIaQoYOp2j5zRsjfHLxhI5O7PLIC2hBdlX+b58fFRA0vKrLc8ADXST0A
         S5fb1ImQCHDP7CXAube/A5hKy7G3HkZFaVt0BXZw9uYmYeTQQLW84Epq1W1/yNuTkkH1
         XWBS3gbJperEhqLbwBWA20jT0YnWy5CmI228cstRdx/kwKzBAGb/sebDw7aHZWTe9jKJ
         09psbLqwWSwY1HnZ80QW2z1nrSn8Ddd0A+pTn9YnXSCSubYfdXKl69nPelkPouAg59qv
         2KR0BgiddbqDMqMe2lJEe/ok+EWjkyGwo7E3jVubA/Xh6AXfN9URiqOJIjpLic9qf2Hw
         k88A==
X-Gm-Message-State: AC+VfDwRk1PFlqA946L1uNi06KWEnLIAmVK/4Oc3fylNZx9gCrLG0+Iz
        zbQWrE+LuSBL/YvJ2RLED+RD/w==
X-Google-Smtp-Source: ACHHUZ5VYzmsikxsafYP0OLAIPuaP+UraK9xdVPdzYUjKg3TB7t20IZE8MTlcxjTp6aoA7d4uljNAA==
X-Received: by 2002:a2e:8ec8:0:b0:2b3:4acd:8477 with SMTP id e8-20020a2e8ec8000000b002b34acd8477mr3465408ljl.10.1686828689510;
        Thu, 15 Jun 2023 04:31:29 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 04:31:28 -0700 (PDT)
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
Subject: Re: [PATCH 1/2] drm/msm/dsi: dsi_host: drop unused clocks
Date:   Thu, 15 Jun 2023 14:31:19 +0300
Message-Id: <168682860382.384026.8056760292129315346.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614224402.296825-1-dmitry.baryshkov@linaro.org>
References: <20230614224402.296825-1-dmitry.baryshkov@linaro.org>
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


On Thu, 15 Jun 2023 01:44:01 +0300, Dmitry Baryshkov wrote:
> Several source clocks are not used anymore, so stop handling them.
> 
> 

Applied, thanks!

[1/2] drm/msm/dsi: dsi_host: drop unused clocks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2d1ae9a5ae51
[2/2] drm/msm/dsi: split dsi_ctrl_config() function
      https://gitlab.freedesktop.org/lumag/msm/-/commit/518269541298

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
