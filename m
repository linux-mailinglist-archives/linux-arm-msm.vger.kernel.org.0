Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 553007BEC18
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 22:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378065AbjJIU5d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 16:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378034AbjJIU5c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 16:57:32 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C187992
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 13:57:30 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2bff776fe0bso63708811fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 13:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696885049; x=1697489849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0eITzkUvANYAsbvDWgj6UhlGAl2qMtUqk/UBeg+pxqw=;
        b=w4W0slheo+kQLTAOxjDJpvO72AoxtarBjNo/zEsxE/W1Xq0yBi4lsH3gwihVZcVK9W
         Q5rPWnZ+Qgv5QnC7mXbIBVSE/Hz9NsCudfnRBMJXJ2SJoZrdODFMj4WA+9Fut4v69dJq
         G6YTsYigWQLDJkXhHzXElf8W8bvftmD8yYceRzUULFqiI+c0NP+g5qVUWyZbeMO/eNLe
         zOGBemj8+gvjePyZbUNES5EZBZMWwh1LrwpXvAvA5cw+Hld5TJyJ/U2J/iTclbExgVp7
         uKf/cChLIydJlsY/I3Jao745alQ3wk2jv2zKwKNDMyez1ipPmkcnlZoBCBDTAmMJBF1T
         xaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696885049; x=1697489849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0eITzkUvANYAsbvDWgj6UhlGAl2qMtUqk/UBeg+pxqw=;
        b=Z+REQuIMl/LTa0HrZS6w/WWfXu0Bc9uDlvf1azNluRGVfhGww0PhOOWb9/drPbDJSP
         5aiZTFgGPuNDgnPPf3wcGgOG6WoLfxJMdYPxYB0InUJes2li+qZRnuHW6DMoEsA3WI2G
         l2bZNTJpJFVzgGFgAPadc5AiItZV0F1IemAgslY2iC3v+fFjBsHiOK7lVUn5DrXk1xb5
         ZMQQ9rred33FJ4Z1IzIfsl0Ql+hoytUy990KAPPyZycWV1CoK1p/4XawVXYZrFcJKPNj
         QuYGb9G6aNKz7MaYmImTQjHVj4/QQQ6tsezvfCGSF9z+aghwBNvfQq8iBulxGssxPMOh
         qwrA==
X-Gm-Message-State: AOJu0Yw3L0Wp3J6tugzLpU/Bkk7jWHSTBCp9MXwprUINr7NB2Ecl7RlQ
        6HlAnW5cbkQHA1wSSpsaLk+fQg==
X-Google-Smtp-Source: AGHT+IGV6Jlj2bTZBU1f6GRjpoVIx5VHlILwcpCOt3muFho7MqNFrlanA/giFE5mwSgZWF46Ol8ERw==
X-Received: by 2002:a05:6512:2f0:b0:500:780b:5bdc with SMTP id m16-20020a05651202f000b00500780b5bdcmr13460461lfq.49.1696885048986;
        Mon, 09 Oct 2023 13:57:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f5-20020ac251a5000000b0050300e013f3sm1540844lfk.254.2023.10.09.13.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 13:57:28 -0700 (PDT)
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
Subject: [PATCH 0/5] drm/msm/dsi: remove unused fields
Date:   Mon,  9 Oct 2023 23:57:22 +0300
Message-Id: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As a followup to [1], as suggested by Abhinav drop unused fields from
struct msm_dsi.

[1] https://patchwork.freedesktop.org/series/120125/

Dmitry Baryshkov (5):
  drm/msm/dsi: do not store internal bridge pointer
  drm/msm/dsi: drop msm_dsi_device_connected() function
  drm/msm/dsi: stop calling set_split_display
  drm/msm/dsi: remove msm_dsi::encoder
  drm/msm/mdp5: drop split display support

 .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  | 42 ------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  | 42 ------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      | 14 ----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h      |  9 ---
 drivers/gpu/drm/msm/dsi/dsi.c                 | 10 +--
 drivers/gpu/drm/msm/dsi/dsi.h                 | 22 +------
 drivers/gpu/drm/msm/dsi/dsi_manager.c         | 65 +++----------------
 drivers/gpu/drm/msm/msm_kms.h                 |  4 --
 8 files changed, 18 insertions(+), 190 deletions(-)

-- 
2.39.2

