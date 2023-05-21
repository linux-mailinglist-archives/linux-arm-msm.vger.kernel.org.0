Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F364C70AF49
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 19:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjEURWn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 13:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbjEURKr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 13:10:47 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6DDCBE
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 10:10:29 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f3baf04f0cso996435e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 10:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684689028; x=1687281028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fYV/rFxGmAkYvn7ECK1PtdeztFOLj2h0SHwr4ArK2io=;
        b=b7kX0/aXlmNZOFeh11PvW+LciHypbh4eT2g27ddcMy40Rc33RIjxdu4P+A0pr+ye1U
         SCeYRjpbXGpvV6ghLmO5HmW9F2Kn/upBsOQdebPcwG7Vx4Rwe7fv42yTTCyErU4D6Xtx
         ZzsEgHT/et8Qf+isIMTxHIMPXbGBWVdz3YQacpjWQH3LWDzoAVVYRagptmGdZGZMcfq4
         0D+N8x3qlQP5LtcqbO3nI8VUrE1VG1nLOA4lL9zwmvUkg911NI2AoflhGBBOJy+i4pbY
         28Zb5FMIAGuujAlFDYbYrlMkVVNzUtX72Irs2kZFUMOq4OGTmMhNVkctRS5CxKlVuc9J
         YgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684689028; x=1687281028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYV/rFxGmAkYvn7ECK1PtdeztFOLj2h0SHwr4ArK2io=;
        b=VvKJCjpC6qNygcUdRH11532j5XFnCCkeI3S/atYG6VMJEL4un5EOB6PcF4uo6F2xI3
         mv2U2ttw39mNVKSP0f5QgyxFqblcFPDKeZBPwy2RLIiPVLCpBDIypTmBK1c0bhzgFQ1a
         7FKGyUyzs8F1pe7RC55mQ3VQQ2Geufnn7NZiz8zj/pEb/RWVDcs1Bsq302zuK9VeQL2t
         Q4XbR0KHqKnNreoUZk9UgOu1dO8ykHjl1hRm6LyxiOU4A28OQPoF/212yukAjNvke9sg
         4JSAkIsVF6xZwUDopvmGpHUURRBPxFZPh1d29Ot0Zr7xVlmaL29FmUI77BqQX7CXC6wu
         yweg==
X-Gm-Message-State: AC+VfDxBqejPQaH/yMKojHpFv4YRBnTtfBtZhJU0DaqyqwTKNUALl4O3
        fqML3gy/yES4Flv1ujIlLTPNDA==
X-Google-Smtp-Source: ACHHUZ6yRkEK5cbVc6jo5msqa4pTXUv+RLs3eukHFXQv28lAf3WCIaPNb9bEed8K2ne5prVReOxDJw==
X-Received: by 2002:ac2:5ec2:0:b0:4f3:94b5:3272 with SMTP id d2-20020ac25ec2000000b004f394b53272mr2708446lfq.11.1684689027985;
        Sun, 21 May 2023 10:10:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k19-20020ac24573000000b004f00189e1dasm680493lfm.143.2023.05.21.10.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 10:10:27 -0700 (PDT)
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
Subject: [PATCH 0/6] drm/msm/dpu: use UBWC data from MDSS driver
Date:   Sun, 21 May 2023 20:10:20 +0300
Message-Id: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
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

Both DPU and MDSS programming requires knowledge of some of UBWC
parameters. This results in duplication of UBWC data between MDSS and
DPU drivers. To remove such duplication and make the driver more
error-prone, export respective configuration from the MDSS driver and
make DPU use it, instead of bundling a copy of such data.

Dmitry Baryshkov (6):
  drm/msm/mdss: correct UBWC programming for SM8550
  drm/msm/mdss: rename ubwc_version to ubwc_enc_version
  drm/msm/mdss: export UBWC data
  drm/msm/mdss: populate missing data
  drm/msm/dpu: use MDSS data for programming SSPP
  drm/msm/dpu: drop UBWC configuration

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  6 --
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  6 --
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  6 --
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  6 --
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 --
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  5 --
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  6 --
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 --
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  6 --
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 15 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 18 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 16 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  2 +
 drivers/gpu/drm/msm/msm_mdss.c                | 90 ++++++++++++-------
 drivers/gpu/drm/msm/msm_mdss.h                | 27 ++++++
 22 files changed, 122 insertions(+), 139 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.h

-- 
2.39.2

