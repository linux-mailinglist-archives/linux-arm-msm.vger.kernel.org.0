Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2DA16465A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 01:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230189AbiLHAIz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 19:08:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbiLHAIy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 19:08:54 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C6838BD1C
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 16:08:53 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id x11so22709392ljh.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 16:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M9RR/O4yQfGfzl6TlQ9lRZSB0qlvvscxICLTLIsSg48=;
        b=PBVhQNapqr4cmLJCdR8D5Sdl5P4/8tpAEwjNuEE2wGLMJ5peKvdtsnI2ivJpl+jHzN
         uAoxNVeQhgeQQTBA/aBhz9f4QhlfikT6pl4uSV3hAGzGhExCpvUGtL6u5REV8z3Lb2uq
         tI1KWLFLs3D+DU6rxTZ4OzZmhMYdcY4PP/lP8wu4LWRECsrgeWDpibMAqu6jyzCGXxhg
         LwhVM7kdLxQvfwv3hVhjqWFyLUO5NwEHexMlipGeU3HwEKQqys+1gd3iqrWz4sdE52lY
         gI0Bxmp/Oo0y+A0qGPanxfFyxueP2buHqVWX7eHOfmCmgMvmX6VaxTrZ2XBrl/dxnTc6
         aG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9RR/O4yQfGfzl6TlQ9lRZSB0qlvvscxICLTLIsSg48=;
        b=B1U9mnJLNZKTBgc9ziCCTONYDVNVSM+65YKKs1uAPZkwvzr3JB3elJUss40UJIoLRI
         wEbeatfpY3KFIJmSrT/CSyRj/Ozvf0KR21UjmcmlQHwz+OC2hRJsuMLEfrylFhYByrGV
         CHM9JSKRc5I4VlP/BfQNI3YrXsPo3jUduS+1Gf64Uu8nO3Dt7DhoSMQoW7Cwa95O3+r5
         CdWSv5GngLkEolz8VHpXeffhcQQuIZ3O24zYud30Uvzf4AKYUYmNOtESOqGs66RkSVGn
         tpdoLojfW1VSlJVhWCEsdE33Yo9VMG1jTYS6Q2YN5ND/7bks7BjrOUMRyuU1XAZjppxo
         +W/Q==
X-Gm-Message-State: ANoB5pl5u7GeaDRy5knFezU2uPPFnIJmw50OvSKqZyerKnmq/vLG5E3y
        TGt/NGv/Fb35B04nulBk8V0MWg==
X-Google-Smtp-Source: AA0mqf5f4MwUymkUiV5aW2405ea51sxV7NAFzW4fUh0BO0lImetVwSWSzxgMRYBuksvOy7RXokUYWw==
X-Received: by 2002:a05:651c:50e:b0:277:1c8d:27b9 with SMTP id o14-20020a05651c050e00b002771c8d27b9mr25091000ljp.210.1670458131740;
        Wed, 07 Dec 2022 16:08:51 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id z6-20020ac25de6000000b004a2c447598fsm2062992lfq.159.2022.12.07.16.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 16:08:51 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 0/4] drm/msm/mdss: rework UBWC setup
Date:   Thu,  8 Dec 2022 02:08:46 +0200
Message-Id: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

The commit 92bab9142456 ("drm/msm: less magic numbers in
msm_mdss_enable") reworked the static UBWC setup to replace magic
numbers with calulating written values from the SoC/device parameters.
This simplified adding new platforms.
However I did not estimate that the values would still be cryptic and
would be C&P-sted instead of being determined from the vendor DT. Some
of the platform (sc8180x) completely missed this setup step.

This series attempts to rework the static UBWC setup to be both
manageable and hopefully easier to write.

The series (being an RFC) depends on three pending platforms series
(sc8280xp, sm8350 and sm8450) with minor fixes applied on top of them
(e.g. to fix the hbb on sm8350).

Dmitry Baryshkov (4):
  drm/msm/mdss: convert UBWC setup to use match data
  drm/msm/mdss: correct the ubwc version for sm6115 platform
  drm/msm/mdss: add data for sc8180xp
  drm/msm/mdss: add the sdm845 data for completeness

 drivers/gpu/drm/msm/msm_mdss.c | 173 ++++++++++++++++++++-------------
 1 file changed, 107 insertions(+), 66 deletions(-)

-- 
2.35.1

