Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CAFA4B9885
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 06:55:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233867AbiBQFzu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 00:55:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232434AbiBQFzt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 00:55:49 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B237E297207
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 21:55:35 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id p22so7954688lfu.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 21:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/0CR4bg/aP+HYLaxgruFj36yg6CA19rL8bNRs6En6EY=;
        b=Pmt47riEYW0RnTKnLKfpZ9wNNpw8xDqXNVZSeeR56zhnZ/pS8uhfwEePar4mneJanK
         KW9qulmsVBHGditbxVswz6KGfXGDReNfoibGEr2+eHaaUlkOkOhjrP8n/6UJg2kRDTp9
         /Gmv97l1SX/f8hLNSaRZSUmuJfW88xAjsBmrP7DRFIh88SaXKuDaUlQJf0c5CfUC8T1s
         76Ieits0v0zlePNU7SWz/i48TJnTMj7H+wNtxty0QyX9XyHqUVYmhqHLg3C1De4mJWup
         yobSJmm3ZTlnnKRGQaPdNBmHl4vjsrMoUSP9nZ4wIE3Svi53hkCd/6uytWqgyInksfNH
         E07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/0CR4bg/aP+HYLaxgruFj36yg6CA19rL8bNRs6En6EY=;
        b=geL7ikXtY5ORnvzDYb4FCmFP9z/8I1V1OLiRHAxnX42I5g5izVSyV7qw2g2MaKIrDw
         TNrg89a84BfKiP1NKNeTDUMmHv3sx4EdQuwyZ67dLbU6tqu9LZgKjRgRTizTf3g47q9G
         RmwBykuyIWfcqKC0iHz/9SWvh8SpnExK4sG2Qc/dYrxKn+dnZ1zR/HlzT0KlqcrhFFuC
         lgb+07SdfWWlY9ZPfdrm2nwPNajzZQ+RdRWMP3Bq5izfgMKYa3imWx1eyp+elrgNG7X5
         udsDF6kpEn9EG54ADFOcaceOpHLiQjHZ1v8Ah3K4e18vXz1EDuJCYCVCZqVnG9Iy5Bxn
         GuiQ==
X-Gm-Message-State: AOAM532cruM8DiockMqOwKEclApTik6rCHxWObVY+VBsk8/X+1fRnXdp
        8DT2rlpgpTV6LhGbr/BnBdgIDw==
X-Google-Smtp-Source: ABdhPJyCqRQFL/8kW2qka2z7yQ2e41iQFhz/oVM7tj5ddheolaV0OojmGa7YZrgNoSsrXFrq5WWMUw==
X-Received: by 2002:a05:6512:696:b0:443:7fb9:1ae3 with SMTP id t22-20020a056512069600b004437fb91ae3mr1078435lfe.249.1645077330914;
        Wed, 16 Feb 2022 21:55:30 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u13sm5015998lfs.260.2022.02.16.21.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 21:55:30 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v5 0/5] drm/msm: rework clock handling
Date:   Thu, 17 Feb 2022 08:55:24 +0300
Message-Id: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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

msm_dss_clk_*() functions significantly duplicate clk_bulk_* family of
functions. Drop custom code and use bulk clocks directly. This also
removes dependency of DP driver on the DPU driver internals.

Note that DP changes were compile-only tested.

Changes since v4:
 - Use size_t for num_clocks in dpu_kms/dpu_mdss
 - Use min() in dpu_core_perf_crtc_update()
 - Drop overcomplicated clock rate setting wrappers inside DP code.
   We were setting the opp for one clock and setting a rate for a single
   clock! Call dev_pm_opp_set_rate() and clk_set_rate() directly.

Changes since v3:
 - Switched to devm_clk_bulk_get_all() per Stephen's suggestion.
 - Removed a call to of_clk_set_defaults() (per Stephen's suggestion
   again). It duplicates a call in platform_probe().
 - Split the first patch (moving helpers to msm_io_utils.c), it's unused
   now.

Changes since v2:
 - Retain conditional code/prints in DP code to ease debugging
 - Rebase on top of msm-next and [1]
 - Split helper functions to msm_io_utils.c as suggested by Jessica

Changes since v1:
 - Rebase on top of current tree to fix conflicts

Dmitry Baryshkov (5):
  drm/msm/dpu: simplify clocks handling
  drm/msm/dp: "inline" dp_ctrl_set_clock_rate("ctrl_link")
  drm/msm/dp: set stream_pixel rate directly
  drm/msm/dp: inline dp_power_clk_set_rate()
  drm/msm/dp: rewrite dss_module_power to use bulk clock functions

 drivers/gpu/drm/msm/Makefile                  |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  23 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c   | 187 ------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h   |  40 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  46 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      |  26 +--
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  13 +-
 drivers/gpu/drm/msm/dp/dp_parser.c            |  43 ++--
 drivers/gpu/drm/msm/dp/dp_parser.h            |   6 +-
 drivers/gpu/drm/msm/dp/dp_power.c             | 105 ++--------
 12 files changed, 74 insertions(+), 426 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h

-- 
2.34.1

