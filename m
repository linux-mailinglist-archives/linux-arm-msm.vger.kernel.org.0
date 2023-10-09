Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C86DF7BE78A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 19:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377277AbjJIRSG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 13:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377398AbjJIRSF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 13:18:05 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4C6CB6
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 10:18:02 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c00e1d4c08so60465281fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 10:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696871881; x=1697476681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zu2R71bsRjtY+DvwxAeRqhKMlPb8WHWJLqI/9lGlnIE=;
        b=U84tVXWcoQ5lO3pDQ2gVUjLwUvth5HDbkeUOF4ud3atUmIfJxra9EPcc/RIg/RHLdv
         dUzEHIf+b6kIOFxq4g+I5NkXYjfA0WRdYrJ/0Lye+GXNlS1X4i9jAeZGI/RIWgMAF9hK
         x94+zqktgnnvwCLELX46cXb6Sb3cNT6w9tUA5FomFebpli++lBgPmpYQ3E7uaKQZh9cE
         RwAmFCfbKgzFuPCtsf3vxHyDDwQo2a9Ml4L3V1h6OYnE97psygZegTI33WEsyqSMHnIe
         +rDj3+A/Gcp2oviFyZo7vXmlkrJMnLT47ivQbJtxIAxboKHlzPOF5dVN0IK9Ul7FD24f
         3JMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696871881; x=1697476681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zu2R71bsRjtY+DvwxAeRqhKMlPb8WHWJLqI/9lGlnIE=;
        b=U9WYv4BOvqGVNC/INeA79JxBI2aFzMZWHwp+4VvJsh50lEGRbincqJ7SW16q9sFxfP
         /fHkDbPIwzv33zYFQWdesP+cmUmrcoeqxak1Otbq9OtYxh9/jYtA3JnSvfKclW035L2U
         waoFnM47bm2hjSB6k86a+eaQAOGfrY5XFNrbTB8ZEnuVWpNqCdPvSineOuQpVjv+qPG2
         L1R7wv3ckykPqEXYMn959VGx0GyeHkSiQJ+bdZ/gRLXEcKxlAtmFrrrNZ3yLonkMNPE8
         IyTXlnc5+8OL7N/3H3CJPncFLEuMglUDNHve3gUqAplSWylLX3JfKAHOilzeT3HN4c/6
         s54g==
X-Gm-Message-State: AOJu0Yw583XFlkhODDZW8+KbT9VetY3KsXEH3JekIbW7rIiCz1Efrwjq
        kDMsM8oPjD+1GJvAxqzj28Djqg==
X-Google-Smtp-Source: AGHT+IHkjsfGPBI0OFfLwOC0eYNMzLTLpB/vFXBlsxYKK6GxOHao9KedFpYz+W9ES7FNvr2C0Y6ctA==
X-Received: by 2002:a2e:7c15:0:b0:2bc:b884:c9be with SMTP id x21-20020a2e7c15000000b002bcb884c9bemr15098772ljc.30.1696871880986;
        Mon, 09 Oct 2023 10:18:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p18-20020a2e7412000000b002bcd2653872sm2088284ljc.30.2023.10.09.10.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:18:00 -0700 (PDT)
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
Subject: [RFT PATCH 0/4] drm/msm/dpu: enable writeback on the other platforms
Date:   Mon,  9 Oct 2023 20:17:56 +0300
Message-Id: <20231009171800.2691247-1-dmitry.baryshkov@linaro.org>
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

I was not able to test it on my own, this is a call for testing for the
owners of these platforms. The git version of modetest now fully
supports writeback.

Compile libdrm/modetest from git version, run modetest -ac to determine
the writeback connector, cat /sys/kernel/debug/dri/0/state to determine
spare CRTC and plane, then run something like:

modetest -M msm -a -s 36@85:1024x768 -o test.d -P 79@85:1024x768

where 36 is the Writeback connector id, 85 is CRTC and 79 is the plane.

Then press Enter and check the test.d file for the raw image dump.

Dependencies: https://patchwork.freedesktop.org/series/124832/

Dmitry Baryshkov (4):
  drm/msm/dpu: enable writeback on SM8150
  drm/msm/dpu: enable writeback on SC8108X
  drm/msm/dpu: enable writeback on SM6125
  drm/msm/dpu: enable writeback on SM6350

 .../drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 18 ++++++++++++++++++
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 18 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 18 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 18 ++++++++++++++++++
 4 files changed, 72 insertions(+)

-- 
2.39.2

