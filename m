Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F02C570AFB9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 21:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjEUTEu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 15:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbjEUTEs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 15:04:48 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93671C7
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:04:45 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f380cd1019so5973764e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684695884; x=1687287884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EjzD0RJieB3kY7LZTu5fQEwWkRRa+/As0v5gHQMzbZM=;
        b=fBqdo85gKd1m+mY0hhENEGL5F+mfe30Ib7at50gTSu9D1ytt9kh5iqN9qybuljeW3P
         SHYzCTAeWd+3JfIgN2zdzyIjShDzFRcE+qNp72ZEStDZiiZhxVIx8ejAIHb70ajM6Tdl
         Ae5rcOZAcaqmFNaRgXUNRAc8VxOcrUDN7Y0jDDH9MTczACbLTKW2cZ4/ywIN63SXeNOs
         uJ22WlmVrSGQ2VXCrBkmCSJBhevkHKXDc1/B22j6JDV86p1JlfAYMT3PkMV5Uh3uoILU
         eTBVQQp+SLIoQ5WslWX1cMADRygzMHX5AgYxHuGIhctrL3p9jquW0j4CybeDkn7fXvsV
         ic4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684695884; x=1687287884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EjzD0RJieB3kY7LZTu5fQEwWkRRa+/As0v5gHQMzbZM=;
        b=eFNu1eibgxqlByO0Frzl9oOmAGVV9JOf1nQN7e9BGg2p3nv3VAtXBr9CtzJSj3v+xA
         pcCrjCKaupOMfudDab4Ut6MuhKIHFJiFgng2nJ/oWsCeeMGd5BGIMfeOKXAhDXtLvXDx
         GAn10Sh7JtcFsxUhvuK+qNIVIj5rBUzP4ieyualzzYCtGL2Zvmrj7Qd3OuhUzMhBDytq
         WKpiExZubJRV5zuDc7q9eSxA3HL1yhi+3/BhCpILWgaZAjhtGvckdJL3sicydBtEE0Ao
         amGLdF/yCzuEYfzYVV1Ux1tbiBjPnP/u65yrqkfS5TsRkJP21Mm7wnz74QUfx8I2Yw/J
         pSWA==
X-Gm-Message-State: AC+VfDxOCk2htzzEwAB7D8NETBrwzFf8kJ6ZRLX8daGlkK/r3rOcVED3
        Cng9iV+FZ1bRMB5eTV3yaGOcmw==
X-Google-Smtp-Source: ACHHUZ6MkqQYNTM5Kb99NAfhmkraCoTJLYQEE2zFx66bwqaRhqvqi1ows4vzJNfc9YwvcKYzxbB+yw==
X-Received: by 2002:ac2:4a7a:0:b0:4ed:b048:b98a with SMTP id q26-20020ac24a7a000000b004edb048b98amr2685363lfp.6.1684695883871;
        Sun, 21 May 2023 12:04:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r22-20020ac252b6000000b004f1d884a4efsm694495lfm.242.2023.05.21.12.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 12:04:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm/dpu: yet another attempt at cleaning up encoder's debugfs
Date:   Sun, 21 May 2023 22:04:40 +0300
Message-Id: <20230521190442.8293-1-dmitry.baryshkov@linaro.org>
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

Simplify dpu_encoder slightly by using drm_debugfs_add_file().

Dmitry Baryshkov (2):
  drm/msm/dpu: drop (mostly) unused DPU_NAME_SIZE define
  drm/msm/dpu: switch dpu_encoder to use drm_debugfs_add_file()

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 40 ++++++---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  2 --
 3 files changed, 11 insertions(+), 33 deletions(-)

-- 
2.39.2

