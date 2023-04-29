Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0D36F2206
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Apr 2023 03:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347256AbjD2BYA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Apr 2023 21:24:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347251AbjD2BX5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Apr 2023 21:23:57 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B92C46B1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Apr 2023 18:23:56 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-2f95231618aso216552f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Apr 2023 18:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682731434; x=1685323434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=htj/8vCj4I57SLW2faNCG4a/nF8sQzzLcq7GSZbM288=;
        b=Pxo53+demnDQ6RpXQYMMyGE3bI1+MCzP2V7rPxsTzQkvqaz9HkTHQbMEVpQKViAc14
         PYR6R0U0RS5N6BDbAguA3o9MobR8p+IinCEpTegzS1CEXFPSDeR0ZyOWBp5cAvhgB+Et
         y+P5wRc7v1n0MlVaz5v7wzIHZrgTSQPW82UVkLEGVxs2J2kcsi4TnZY3BwahETsZqEDM
         TYT6tpeHELzW4Rh5lmzErkYT7JzA0TVWi9hpl8GkJb2rBxjVN8ctenJVEmBVtP1JlwA+
         U16xm6fuUOKtuHWR1k1oX+suDeMMx2rnOebfuGj7PVjWYD42b9Xwk2WL+4n/0/nrxHVy
         U5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682731434; x=1685323434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=htj/8vCj4I57SLW2faNCG4a/nF8sQzzLcq7GSZbM288=;
        b=AdEAjn2lW/OYRf3XEuIq1w5NBtn6wyhWinrJhvBsNu2OOe4UfV4vXhfaeWLotjRNvL
         y/nO9p7xqKerNtD3cMImKRlFV6ijCl20L0CjjzowEkBqvrMYi3GjVUTESOrsZY8vhTIF
         anODOiW2EQ3oHPdKwxyUUmrHMOejZSHRclMHVebtYzxhKDvSOx0PaMZ9kZSmAE6BBUeY
         jXI4NT0+IcfDVSfviBeoEjxKZbvzI45cYYOxEP86ham8dT3RqGxMqkAo54vDwM+k9oMW
         bdR3ZpfJwcQ1wUTiyeMUfdZ/yRPQyfD+58kP4r/TYNIiX0+b5hE8hOJl+GAak6kGy/CG
         h3Gw==
X-Gm-Message-State: AC+VfDyHqeNaOMmb01wH2vMScb+dvBwjud/qcjnbdpR9VI8/gFCmo6pq
        r85QTtc3UqqRFZtiTbVqklGSuA==
X-Google-Smtp-Source: ACHHUZ4ZWWsBh7oQ8wmPJFzelGX0O+OdC3f2yjnNkKepKP7xmHU96NT194CO4Qr1Gw/oAiBMhgnYtw==
X-Received: by 2002:a05:6000:136f:b0:2f0:e287:1fbc with SMTP id q15-20020a056000136f00b002f0e2871fbcmr5647327wrz.11.1682731434688;
        Fri, 28 Apr 2023 18:23:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([212.140.138.218])
        by smtp.gmail.com with ESMTPSA id p10-20020a5d48ca000000b003047dc162f7sm12983554wrs.67.2023.04.28.18.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 18:23:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/msm/dpu: drop _sspp_subblk_offset()
Date:   Sat, 29 Apr 2023 04:23:50 +0300
Message-Id: <20230429012353.2569481-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rework dpu_hw_sspp.c to access sblk base address directly rather than
getting the sblk address through indirect function call.

Changes since v1:
 - Dropped DPU_SSPP_SRC feature, making SRC-related functions mandatory
   (suggested by Jeykumar)

Dmitry Baryshkov (3):
  drm/msm/dpu: drop SSPP's SRC subblock
  drm/msm/dpu: access QSEED registers directly
  drm/msm/dpu: access CSC/CSC10 registers directly

 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  14 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 198 +++++++-----------
 3 files changed, 76 insertions(+), 150 deletions(-)

-- 
2.39.2

