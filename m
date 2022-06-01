Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7202353AAC6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jun 2022 18:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355216AbiFAQN4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jun 2022 12:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355305AbiFAQNy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jun 2022 12:13:54 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD2641FA9
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jun 2022 09:13:53 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id t13so2541307ljd.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jun 2022 09:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j9xbAye+km4e1PFapdp7FfBArJEJLR0pC6Qj/2+Uu54=;
        b=P7c8bft7rzjQmuIK3eBPro9p+e63zwRCElPjHnhF9iB7WH41V0omjYi3+HJMoY3xoR
         MOrT3j2gYj2ueX/pl397yjMwen+IKdat+8lI3MMBAp+bJPvuxVorswttzrWQQpnd5Y1F
         X3E/jdWGJyTvQNwYgrncj38RZ/Qa90YlnpQGVedR70DXYU3OiSRDyOEywl1gLf27NDuM
         8W7b5S9JHUhnZOdpP8rd4tdMyXJzawK6DrUVP5wQgSJT4YX/q4fRsxMJznhS7wUxtzho
         N4WTuu8/6hBS/AdEXefMcSm23fML1u8BAVKT6Jqdw3vPc0L1UyYVsWiwrH62TpSa+OCt
         /B4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j9xbAye+km4e1PFapdp7FfBArJEJLR0pC6Qj/2+Uu54=;
        b=YCrjhyItSiSHVuiCUA3DPiz1VclprUo7SkuJlng8AgbHZGPD3ABOgroU0/irEeoY0d
         TmKI/DD8sCYSZIoi48U7gVUm3928/CnS3AjOi3jFFIP2+iS8RH68oIYVLuejn8yb4GZa
         sZgv3nAQ3gmYHUjfZjFmSq4ddSO8JaOKN7C0TGHAJNoRfcRr0JlQ9PbU/JZ+KBEvedN+
         XV1n2qze7vx6OSMpaOplhRgahs/rOw1LAC98BpXxEF/qRXDmPsYOISqtzkJSN4MIgIR1
         7J01mp4X08csOHYlsF38sM3p/I7xqkMfspxVq8syyLffB8/pDoOGKUGvZ+ZEFu/1kKih
         bpmQ==
X-Gm-Message-State: AOAM532ZaEEait332cLSAxb6IExBSDe0ii12xgFkcGHxN91WRz2QbDQR
        Jz/cJe/P7cVISGiDLAccbnA3JQ==
X-Google-Smtp-Source: ABdhPJxS0sYSzLqJcAZ0oz42b/ywmKG4qFCHR1ER0yMVDC7xpxE4M2h2VUeS01TFjENuq/NLzDiuoA==
X-Received: by 2002:a2e:b812:0:b0:253:e6c7:259 with SMTP id u18-20020a2eb812000000b00253e6c70259mr31169131ljo.487.1654100030380;
        Wed, 01 Jun 2022 09:13:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k2-20020a05651239c200b00479066d45bcsm339545lfu.214.2022.06.01.09.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 09:13:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v1 0/4] drm/msm/dpu: cleanup struct dpu_hw_blk_reg_map
Date:   Wed,  1 Jun 2022 19:13:45 +0300
Message-Id: <20220601161349.1517667-1-dmitry.baryshkov@linaro.org>
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

Cleanup the fields of struct dpu_hw_blk_reg_map, remove unused fields,
merge base_off with blk_off into blk_addr. This patch series depends on
the patch [1].

[1] https://patchwork.freedesktop.org/patch/488001/?series=104613&rev=1

Dmitry Baryshkov (4):
  drm/msm/dpu: drop xin_id from struct dpu_hw_blk_reg_map
  drm/msm/dpu: drop length from struct dpu_hw_blk_reg_map
  drm/msm/dpu: merge base_off with blk_off in struct dpu_hw_blk_reg_map
  drm/msm/dpu: move struct dpu_hw_blk definition to dpu_hw_utils.h

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h      |  1 -
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h    | 25 -------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h   |  2 --
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h     |  1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    |  4 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |  6 ++---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  6 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   | 18 +++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  4 +--
 26 files changed, 28 insertions(+), 85 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.h

-- 
2.35.1

