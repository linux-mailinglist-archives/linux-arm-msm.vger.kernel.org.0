Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F98D7BE76A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 19:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377162AbjJIRLP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 13:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376797AbjJIRLO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 13:11:14 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D21C94
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 10:11:13 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-504a7f9204eso5704207e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 10:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696871472; x=1697476272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=30KcEZ4SIICqQVAYj3z91SvH9mOrlLfmUCguTSfxTSk=;
        b=kvuOzWmGUuof4IlpbJfoRFeb5+y4H+M41jiw0lHvEDK6LtBqpbbHPilZkWPBdltC0V
         WxoObFfF/mUm9ee/BbIs0biW6uvwn1mqPIJwvFpxw0b9ZEYu3Eig3+ItdSlpbiMSxiZo
         p3/eB9owmcwG9rKnOMzpkvFTI3t63/EpT7VVy9PNnjzZcyIL6EIxgiuTscODEcjBdFVl
         5c70gzv4P6P9J36BKNX4AYlSyXLeOmDBFWAfbNsOXIBV4L9PKMr7cT+upfoDtlYedn73
         Kr56hePQtEVWaAHuTzhZwYWu5ZzaeZQrZwYHr3LCFQqkyDbef8aIBbbgzUrBrv3sGLb2
         c7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696871472; x=1697476272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30KcEZ4SIICqQVAYj3z91SvH9mOrlLfmUCguTSfxTSk=;
        b=U4SjFmnQBl7/C9ppn7sMftkShXETZCMQAdNOeoxqr9952mEuV9RckveXhsmcCom0W1
         wl+qdQjLXXpZlGiFmr4W2TSK4Fvjr6Lq43rvh+sENRzDt0T8qGqswS5I70bynnuW8P10
         pJjnwXoUpJPNrcJa1VK3e0j4FIGEL2rb6MsJ8/b0cLVH0djFltD3jFvlXuuuF5eWm+NK
         wv3BBFjC9SEAKoNxX2wiDHfcw88zVEt6Fw7F9cEMlTwMtcg8CIaROLplFrJMt9NH+FFI
         YVXN8EiOXGCYc0aPy2EICPn+CJtpkhgoEXpqzdW9MzMpVxvGHHTjWWhlYeBc68Quof0t
         CbOg==
X-Gm-Message-State: AOJu0Yz30owY2abeY/hPL9ktFgud0+XUx3e6kpvoyYz4V0HgIrihvZn/
        fGcj/Y11tR1hcJKUokJ4/6Ls8Q==
X-Google-Smtp-Source: AGHT+IEBq766UMuWA+eeA5D2k84fHEbIsahHIHEvGO6Kg7wtTj42eDj0TYj1mQSbBwp3s1gqb2Niog==
X-Received: by 2002:a19:6456:0:b0:503:442:5957 with SMTP id b22-20020a196456000000b0050304425957mr12147556lfj.41.1696871471681;
        Mon, 09 Oct 2023 10:11:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x14-20020a19f60e000000b00502e0388846sm1475991lfe.244.2023.10.09.10.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:11:11 -0700 (PDT)
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
Subject: [PATCH 0/3] drm/msm/dpu: enable writeback on several platforms
Date:   Mon,  9 Oct 2023 20:11:07 +0300
Message-Id: <20231009171110.2691115-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This enables writeback on several platforms where I could actually test
it.

Dmitry Baryshkov (3):
  drm/msm/dpu: enable writeback on SDM845
  drm/msm/dpu: enable writeback on SM8350
  drm/msm/dpu: enable writeback on SM8450

 .../drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h | 18 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 18 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  6 ++++--
 4 files changed, 58 insertions(+), 2 deletions(-)

-- 
2.39.2

