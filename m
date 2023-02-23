Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 253DC6A00C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Feb 2023 02:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232894AbjBWBrp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 20:47:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232573AbjBWBrn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 20:47:43 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6485141B74
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 17:47:41 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id s20so12176012lfb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 17:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nxn/W/DZi3qbxg4e9X034UdXsXls711+0gs5673NuBI=;
        b=mCAik50eLZjjGB53EUXjlQ5ftpVIcO95aPBhIKa/11Adc/DTAgpknKq1Sp1NMU+MX2
         LPN/BAwSeR4NHu/IYKaW4gQb3pnWmpO9OU0+EPQTJ0B/uDuky4PjtNTp3j5N0FkfwjpG
         eiAtCMfumMH5/BTUt1x3H9AsXmykakC9N0eHVRGjzVzkLK58G7Bqarhqc9H9KmheUFlS
         cZfRUg/Wesq7FFWT5xU59mbI95pHHXT7eCaSIWBlKzcfeihI/EaTMc33SBNsBW8UEjjB
         sTW89Djj1aZ3tZuaayLZcO6YiHzUerqs2CbL+IC6/mZuZCZ8HBRhAXdRzG2OgkD7heIl
         oRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxn/W/DZi3qbxg4e9X034UdXsXls711+0gs5673NuBI=;
        b=dgjRG80pXjaAM+b6ZgFFd5oJV0gdMG1Qf6BtEA7ntgHRxaNmFI8a0U6ruYEHHuBG46
         N9mm5aPH0PNPVSNzp+y3JwU5iZ0WlJarxN4ymtNWkcd9sEuZyu4gXWTOxXW/pFJ4Zegm
         eaFPhTUUgj+J+GkmLa2Hd7PEXQVwU8DCpTeDSTVnNG6zkm2f2j5y8fD9g5iZjXiZnTDe
         Lnn525qi9ZTu3UdhcLfmr2YbZRXJqgVNR8gPUDQknR1l0schIIeevdkBWeBBgYo6E7ew
         RMzDdPPDOZE0umDYiWbTWv8p4hPmQtzAsEyLQILueVJ7NJ+XcevFIQwziNFjqogCZjNR
         nPpg==
X-Gm-Message-State: AO0yUKWTvNxNZtfItnq3Cqwyyr1HW9xYfvgsUYauMbXEAaxW3qzicr9O
        B781nd+NVvLIQDHgUc6mzYajYw==
X-Google-Smtp-Source: AK7set/yIipOLIpZGix3iM4th6CUQGlXFXdTgXbTsnVX9emoOTi2dQH/cBV6Nyg50Y8Wz7PP6kqF9A==
X-Received: by 2002:ac2:5fca:0:b0:4db:3890:cb4e with SMTP id q10-20020ac25fca000000b004db3890cb4emr3538750lfg.4.1677116859655;
        Wed, 22 Feb 2023 17:47:39 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id 12-20020ac2482c000000b004dc807b904bsm427376lft.120.2023.02.22.17.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 17:47:39 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/6] OPP and devfreq for all Adrenos
Date:   Thu, 23 Feb 2023 02:47:36 +0100
Message-Id: <20230223-topic-opp-v2-0-24ed24cd7358@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALjF9mMC/x2NQQrDIBBFrxJm3QGdQBNyldCFmmkcEBVtSyHk7
 hmyfJ/3eQd0bsIdluGAxj/pUrICPQYI0eWdUTZlIEOjIRrxU6oELLWisTxZS35+Thuo711n9M3
 lEPWRvynpWBu/5X8H1td5XsvAkPZwAAAA
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677116858; l=2510;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=qfYEQNocMpdpOTn7eel7AhIAvweJRI9r+7Gb86qiMPo=;
 b=E56dXGGVbqioi2hquaXMAnNHLk/bie6SAc+/Kdk47Bh6BiOLpXxDSBY+nspd3UPHVOQaDR11+OLB
 AxaSlPj5BmPRuDXLcRyhNLVTWYqGL/H0Gs8O7ITG338sFf19M6i/
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v1 -> v2:

- Move a2xx #defines to XML
- Use dev_pm_opp_find_freq_floor in the common path in [2/6]
- Clarify a comment in [2/6]
- Move voting from a5xx to Adreno-wide [6/6]
- Pick up tags

v1: https://lore.kernel.org/linux-arm-msm/20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org

This series is a combination of [1] and a subset of [2] and some new
stuff.

With it, devfreq is used on all a2xx-a6xx (including gmu and
gmu-wrapper) and all clk_set_rate(core clock) calls are dropped in
favour of dev_pm_opp_set_rate, which - drumroll - lets us scale
the voltage domain. DT patches making use of that will be sent
separately.

On top of that, a5xx gets a call to enable icc scaling from the OPP
tables. No SoCs implementing a2xx have icc support yet and a3/4xx
SoCs have separate logic for that, which will be updated at a later
time.

Getting this in for 6.4 early would be appreciated, as that would
allow for getting GMU wrapper GPUs up (without VDD&icc scaling they
can only run at lower freqs, which is.. ehhh..)

Changes:
- a3xx busy: use the _1 counter as per msm-3.x instead of _0
- a6xx-series-opp: basically rewrite, ensure compat with all gens
- a2/4xx busy: new patch
- a5xx icc: new patch

[1] https://lore.kernel.org/linux-arm-msm/20230130093809.2079314-1-konrad.dybcio@linaro.org/
[2] https://lore.kernel.org/linux-arm-msm/20230214173145.2482651-1-konrad.dybcio@linaro.org/

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (6):
      drm/msm/a2xx: Include perf counter reg values in XML
      drm/msm/adreno: Use OPP for every GPU generation
      drm/msm/a2xx: Implement .gpu_busy
      drm/msm/a3xx: Implement .gpu_busy
      drm/msm/a4xx: Implement .gpu_busy
      drm/msm/adreno: Enable optional icc voting from OPP tables

 drivers/gpu/drm/msm/adreno/a2xx.xml.h      |  6 ++
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c      | 24 ++++++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c      | 11 ++++
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c      | 11 ++++
 drivers/gpu/drm/msm/adreno/adreno_device.c |  4 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 99 ++++++++++++++----------------
 drivers/gpu/drm/msm/msm_gpu.c              |  4 +-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c      |  2 +-
 8 files changed, 104 insertions(+), 57 deletions(-)
---
base-commit: aaf70d5ad5e2b06a8050c51e278b0c3a14fabef5
change-id: 20230223-topic-opp-01e7112b867d

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

