Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC4671F094
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 19:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbjFARWl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 13:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbjFARWl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 13:22:41 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0356CB3
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 10:22:40 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f60ccfc0d6so353105e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 10:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685640158; x=1688232158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sWVaudt6LsFTD/rqYNILwYPV4mqbIoPZfzCN0ltwBe0=;
        b=oKS648V4csGwPY/aR2vtqyAMJUbtbly8L8AZnN8my8AgTv8p/GMBbQGxASb9nJ+XHd
         KEyyaCT/1Fo56HZpUwsGdQA55nrYnSOY25SPSczTFVV5L8E/yqmdfd4O7BXMcY4Y7hPb
         lrGgskYsO1qxZHhR4bsYDo6YTsz7vz8B9Iye8foRdblMbsnVICgsC9mvq9PM6xczNp06
         t8iYOPHLg5HwZKnA3uwYvLnkdbCt31B6kITerh06/kVfNFsnnbRUTJk0NYaroJwUKIiK
         vuv9HWHJLlNS6PbcozwcaPRyRo1/NSy+NNHKtk63W6RoLdHmraZiJTLpja84FxpLtGxe
         5nHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685640158; x=1688232158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWVaudt6LsFTD/rqYNILwYPV4mqbIoPZfzCN0ltwBe0=;
        b=FJZB8sggSxYV8TeUEwb0BeMZ8x2H7oWmQQH1lAqum6TkNiNTkWNYGchlUrcT+3N+LW
         fpcmhLnnjfLZ4utt5a6lfkxBIGbIKLJc6CV0k9Fmd/pTtt+Qd/gmYaOJexA7s71hPLHv
         ejPMwd1sYL33cavWS0M2ZuEuVkRwKfTiZSxnd9iUkMSov6sxZNO52XuY1IhhDwxN43+L
         tOW766IIGsFmYDmIx4AgHcvMFs6NGPRjuCvZ4QsPookf/GfxX2MCli0vscKsWcucVNF3
         4smq/dFwcsJMJgvbWyAvq7yJ8wN+sLMKXrILDt6eGue+2EP1TtZciqB0fi4+gC0EV6Us
         4IXw==
X-Gm-Message-State: AC+VfDyxPNaW3VCi05jnEskMXUNe0v919IOvlRDyw6TZNe9cXTiB3+9t
        eLlBB3XAIets79aN26Wrne7pJA==
X-Google-Smtp-Source: ACHHUZ6nIBJXKG+xTUTHYyhVVGJkUrZWZrvseGKuDtApB9Is+JPcnXkFZilVLdboy10XG1W8jjaJKA==
X-Received: by 2002:ac2:5627:0:b0:4f3:880b:285a with SMTP id b7-20020ac25627000000b004f3880b285amr456411lff.29.1685640158258;
        Thu, 01 Jun 2023 10:22:38 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b25-20020ac25e99000000b004eb2f35045bsm1145739lfq.269.2023.06.01.10.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 10:22:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 0/7] drm/msm/dpu: simplify DPU encoder init
Date:   Thu,  1 Jun 2023 20:22:29 +0300
Message-Id: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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

Rework dpu_encoder initialization code, simplifying calling sequences
and separating common init parts.

Changes since v2:
- Rebased on top of msm-next-lumag branch

Changes since v1:
- Withdrawn two pathes for a later consideration
- Changed dpu_encoder_phys_init() to return void (Abhinav)
- Added small simplifications of dpu_encoder_phys_cmd_init() and
  dpu_encoder_phys_wb_init()


Dmitry Baryshkov (7):
  drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
  drm/msm/dpu: separate common function to init physical encoder
  drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
  drm/msm/dpu: inline dpu_encoder_get_wb()
  drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
  drm/msm/dpu: drop temp variable from dpu_encoder_phys_cmd_init()
  drm/msm/dpu: simplify dpu_encoder_phys_wb_init()

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 178 ++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  14 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  15 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  37 ++--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  19 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  35 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  87 ++++-----
 7 files changed, 141 insertions(+), 244 deletions(-)

-- 
2.39.2

