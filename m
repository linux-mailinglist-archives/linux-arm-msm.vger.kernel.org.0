Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9843F5072E6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 18:21:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354565AbiDSQXS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 12:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239383AbiDSQXQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 12:23:16 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC99528E0A
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 09:20:33 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id o16so21175051ljp.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 09:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AwPSlRbjlhsy8XFCXSj+BcLSd4AXUjJASAh7ilneiRU=;
        b=LxdPW1NK9aTlMMY3y8zztnSiSCdrno4Eg3+/on48i8bx8yZqlbJseBoHRliPiJI0ZV
         VHndrv3Xj34dfQs+LxcvozbhSgSJGkl1K1Qnf8uEMqlwRt4pLuFDoXMBMwhN9se4LfJ8
         1EGIAmY0tL83XbcYW1+9/peYz/LJS4Ibwwjsxt4QppAD7E9fK9Q838nI27zmVoo3MytN
         6eFqjnpFPlOJ1KP8SBJyJSVYLXpgYBzSYBK8IZHYLZb6GQ2H3D0labkpwmtfdVCPpgHu
         6VDx6Z5EK4UYuysge6MZX9fLp2n/tlo+FuHPTtX6/Z8RBpXsEgT/bIEf5ieYF82PExm6
         97sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AwPSlRbjlhsy8XFCXSj+BcLSd4AXUjJASAh7ilneiRU=;
        b=bosjmoKl53I2+lxsxnVqECfjTawMdGQ8kA5cw7Nad65Z+utwSWCu4YvIydhKdX0MBt
         oyuuL+7KBqSCsQRDAHD7UoPEw8HuvUHkGw6nF86z8QuQ1cn0hlgAJGQ2HA0JtOKSQ86q
         HgECZT481ke2kNA+K4ziChBUPbldZJVW46Mz+SObAkCJwXy78lL2lXtViDSW303+cpis
         UGxdXHT3HqjpdvVgceAl8pPMTfZ6ILgtrSkCjOqVxGSf5k/9DVosv39uZe9pvMD4aRuO
         diSjqFbncRtsYSGBvakLnSFqh7rKo67xtAlVXnDvjTxdfRCflHye7OXHq8TqUqccKmf3
         GpjQ==
X-Gm-Message-State: AOAM5312/No/W08wUDEOoY/XwI1Gl+ePY5e8Tr6ideys9XlYx4s1MSNw
        G6yStSFUW9gqsvQxnw34tmEOhw==
X-Google-Smtp-Source: ABdhPJxJ360RfODzF6vg6Cq8E0E3Qkq7x42CwaLCqbDfnV3nE8JOv6m9pA1PpS3y5AMLEGK6od8/2A==
X-Received: by 2002:a2e:bc05:0:b0:24b:212d:7521 with SMTP id b5-20020a2ebc05000000b0024b212d7521mr10295661ljf.243.1650385232033;
        Tue, 19 Apr 2022 09:20:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k15-20020a2e92cf000000b002493cc687f3sm1495153ljh.45.2022.04.19.09.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 09:20:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/3] Simplify VBIF handling
Date:   Tue, 19 Apr 2022 19:20:27 +0300
Message-Id: <20220419162030.1287562-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

As suggested by Abhinav, rework VBIF handling, simplifying the code.

Changes since v1:
 - Fix array index comparison in patch 1 (as noted by Abhinav)

Dmitry Baryshkov (3):
  drm/msm/dpu: index dpu_kms->hw_vbif using vbif_idx
  drm/msm/dpu: fix error handling around dpu_hw_vbif_init
  drm/msm/dpu: drop VBIF indices

 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |  6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 14 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c      | 65 +++++++++++--------
 4 files changed, 46 insertions(+), 43 deletions(-)

-- 
2.35.1

