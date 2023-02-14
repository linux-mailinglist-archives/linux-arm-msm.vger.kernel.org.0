Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E552696399
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Feb 2023 13:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbjBNMfd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Feb 2023 07:35:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232338AbjBNMfJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Feb 2023 07:35:09 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D80CDC7
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 04:35:07 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b3so23273307lfv.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Feb 2023 04:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vgeYEYP51vHsST01dLtYg6fF7hAGkVx9e9N4X/a0L4k=;
        b=jI/GJxl9CNH2yhi4NRFnnuwuG5OSEgx3+S3X4x3j5vT07hrw80oy8Uo1yXGbgbSR7F
         RXeX5rCRHIFWHTWPg/E/E9DtmEAZQPSxMsklPqB1S/ccE29vGCDKQoylx2Y4BD1dow79
         iqKf3XCKxcA3qKhYQ3lqrSH/qRE93/n7418YQH9/kZa4siLe/cSXZmK9lKxBb76JEgvs
         MzDAq4KgSBwMgyRXTRg3513tYvOrhYSdkH5ZBKAJncMQG+V0ozRLX+HP+kyiNiSk7mQl
         HMwyJUUbBTVylyy/wDVq3WBoj47EY4xpfUwsBfgcwN7qDp8oK1LkLLtDykdWJLt6YQAp
         dnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgeYEYP51vHsST01dLtYg6fF7hAGkVx9e9N4X/a0L4k=;
        b=FM1+793M7DQdkfHG0uIHJFkKVJKOhIPLggH+7ujGs8T/MVYfDXUZaenZ5XoGtVCRFm
         MeL/VOQ/z6+lbtKTRJCyS6v5aiZ8fyNB/I9iuqcOWNA2381dxbXY42P7QdkOjLO6CNvx
         6yN7IUGsZ1w3aOr+8wISxsl6zviIDtsvpoDXblcgXasrx3N8oLfR/Cu2UkhdtdK5AQXh
         z8lvqVtFJmtqlvR9glvFVyvglA70cXHV4vBS+d6e/AVW+HlQ7zOLharQnqyLZirvz44o
         Arm+1dk7wh5T67I0ebfQtXBPlb4F2PkLOsotAto2L5Ur1bfbKz5svrW9Jtd2Vl5MbUs6
         Pq2Q==
X-Gm-Message-State: AO0yUKWiTQJCamTcpRTGDae0Xsis4P2tyhitFbZvKCDL3YeWbAVSIQKu
        hfzSZjRDwucAEio1939RZoZ9yw==
X-Google-Smtp-Source: AK7set/iTdHf7YxO2g+rThSDtaij0QNrbLQRJIotuyZCyn1GzpiayUW7c6kW2TTKlkDRKdXpb3E9Xg==
X-Received: by 2002:a05:6512:374e:b0:4cb:10ad:76bd with SMTP id a14-20020a056512374e00b004cb10ad76bdmr522821lfs.64.1676378105420;
        Tue, 14 Feb 2023 04:35:05 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v19-20020ac25613000000b004ab52b0bcf9sm1077158lfd.207.2023.02.14.04.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 04:35:05 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm/adreno: implement devcoredump support for a5xx
Date:   Tue, 14 Feb 2023 15:35:01 +0300
Message-Id: <20230214123504.3729522-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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

During the debug of the a5xx preempt issue, having the devcoredump
support was a great help. These patches port necessary code bits from
being a6xx-specific to generic code path and then enables devcoredump
for a5xx.

Dmitry Baryshkov (3):
  drm/msm/adreno: stall translation on fault for all GPU families
  drm/msm/adreno: split a6xx fault handler into generic and a6xx parts
  drm/msm/a5xx: add devcoredump support to the fault handler

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 13 +++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 64 +++----------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 62 +++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  4 ++
 drivers/gpu/drm/msm/msm_iommu.c         | 38 ++++++++++-----
 drivers/gpu/drm/msm/msm_mmu.h           |  1 +
 6 files changed, 109 insertions(+), 73 deletions(-)

-- 
2.30.2

