Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78E17709832
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 15:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbjESN3V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 09:29:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjESN3U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 09:29:20 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B886FC2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 06:29:18 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ac90178fdaso35584961fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 06:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684502957; x=1687094957;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=062DucJSZM1ir9uGBCKc/nlmbbSP2byuRNORA6qyTPQ=;
        b=rYoeEimKwUN9rBpJQr8NFWGMad89OMytiHuI8sGumrM21rcMl8M+faPG1j9Z60Z7C7
         cbYobtTN7dBQB0hkw8NDZ90zQAfh63LE1vIZcl2xOTSr4RCTsgf9VfrVX38Mdfm1qq+Q
         k9AKfH5YSwjWuecWVlETC0og518k1/Uxe5HHM5oPL069HALBdnGxOErxGL6ybJS90fdx
         +st2atGwTwsnCwI+zrui82GsBybMEIRDeQpu8qLzXHGBYzLvbZJW7JT3exyweV/iR6uy
         XXok+3FBpZ3RcO/wpvOPyIF3n01HLBpgAoAln98IQgwANSmu1aT25xB24u0mCeWARPJK
         O0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684502957; x=1687094957;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=062DucJSZM1ir9uGBCKc/nlmbbSP2byuRNORA6qyTPQ=;
        b=QFuZPYLNRkH4bIjwphKLEoaLUC66PlDhSbpPF41jKkZCO2k7rVVx30ZQO6SZZ3FNec
         wkV4jQJ6q4+PTIGQZrVd9jmBq91t3Pnm7psFIks254iBsfd6DUu+oIbOAP8hCNGFSlKA
         zm96tRReD6+b+L5dKIHHuYxXyieXgxE54ELnGbRjLPMym959EOS/OJYf6DO2w/gpf9Fq
         QGkknnFXvEoFRxU5dIefvMmDD6JHDmDtqw7Fq//qZ/bEAsM9rZTZcLfrvItmKA83FUVJ
         N/vg5T/2AztCtFOWGRVR8TSc8TsDBd3VHqt7DkX7SFOGTSXjLlWK12irglnA9hP4gmQv
         u8NQ==
X-Gm-Message-State: AC+VfDwxLNmL2Oc7nNU2fvZiWU/YBQrO7zWydy0eVGo3rSysIK6LpS9C
        cMQCVrMlFZ3duPn5vAtchrABqw==
X-Google-Smtp-Source: ACHHUZ4An4Zn0nCxdOQvjscIRQdVdw5YKfZDEGb/fZyIPdEtEAK+FUDxz4vkUKK6RepEB5UA97H0YA==
X-Received: by 2002:a2e:3506:0:b0:2ac:7ab1:a441 with SMTP id z6-20020a2e3506000000b002ac7ab1a441mr825771ljz.30.1684502957010;
        Fri, 19 May 2023 06:29:17 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id q24-20020a2e9698000000b002ad92dff470sm821384lji.134.2023.05.19.06.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 06:29:16 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/6] Adreno QoL changes
Date:   Fri, 19 May 2023 15:29:05 +0200
Message-Id: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKF5Z2QC/3WNQQ6CMBBFr0K6dkypSi0r72GIKaWFSUhLpkgwh
 Ls7snf5fv7L20T2hD6LutgE+QUzpsigToVwg429B+yYhZLqIm+lhjlN6MDqdX1N5CfQd20r43Q
 nQxBstTZ7aMlGN7AX3+PIIz8Drkfm2TAPmOdEn6O6lL/1f2ApQYK2proG5Y1x6jFitJTOiXrR7
 Pv+BT8FWLHEAAAA
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684502955; l=1302;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=VXBY1tMYfUryEB9oBPhxsJwm809WxNcgkNQbGylhXoM=;
 b=w+XgKEDdVaEnraLk8O2/v+j0nPDV21xxFmeq0iukvcqGuAZwNVmE577OSwHvLLPiZISgimcbj
 XpVrJ00+P6DAi9757vNDqmpxwhaH9608W8sQI60AobALER/s1YyY+b2
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series brings some niceties in preparation for A7xx introduction.

It should be fully independent of the GMU wrapper series.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Drop switching to using the GMU_AO counter in timestamp
- Add a definition for REG_A6XX_GMU_AHB_FENCE_STATUS_CLR, may be subbed
  with a register sync after mesa MR22901
- Link to v1: https://lore.kernel.org/r/20230517-topic-a7xx_prep-v1-0-7a964f2e99c2@linaro.org

---
Konrad Dybcio (6):
      drm/msm/a6xx: Add REG_A6XX_GMU_AHB_FENCE_STATUS_CLR definition
      drm/msm/a6xx: Explain CP_PROTECT_CNTL writes in a6xx_set_cp_protect
      drm/msm/a6xx: Skip empty protection ranges entries
      drm/msm/a6xx: Ensure clean GMU state in a6xx_gmu_fw_start
      drm/msm/a6xx: Improve GMU force shutdown sequence
      drm/msm/a6xx: Fix up GMU region reservations

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 21 +++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h |  2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 14 +++++++++-----
 3 files changed, 28 insertions(+), 9 deletions(-)
---
base-commit: dbd91ef4e91c1ce3a24429f5fb3876b7a0306733
change-id: 20230517-topic-a7xx_prep-787a69c7d0ff

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

