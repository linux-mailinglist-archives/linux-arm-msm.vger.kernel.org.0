Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FEEF72143F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 05:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbjFDDBy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jun 2023 23:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjFDDBr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jun 2023 23:01:47 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2077196
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jun 2023 20:01:45 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f61735676fso1885906e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jun 2023 20:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685847704; x=1688439704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxdMejx+aeya5Jh769pAU4kEMRzgbXnMQm/8cCXpI0Y=;
        b=WmKKSgUXwASDPmK2q4G4UCuz8wrL3jcNxZAKq5lLBHQVuePBgjoDEKZauB9bdR1E3O
         ROJVblyjFMPc34s37CHPMiy1X3ssr3NfhFif1fMVG0/+/UJE2LTlaIGDkIGxQZbdRPot
         n9JrerF/auZUTlP7f8oeH6CQwdnWcqDuUp3GtFU8eEC+ir4Z87WXxoXfCcU7JShUQ0ii
         ZeNrBIeJp73n7lL8r23SDg3AJnYwd+TPCdlKhBKZRZ42wn2Kn/QSd3YH4lQnfB5f/Q/I
         Gf7b5I6X4ETUSo9Do0Yc93qoycNCeCzzpN51vB2WiAgvP3ooVpk272J3u9lg5SZgPNZP
         mnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685847704; x=1688439704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxdMejx+aeya5Jh769pAU4kEMRzgbXnMQm/8cCXpI0Y=;
        b=HHVGjxVG9wbbQSXZB8HTieXpR1HsPb4rChf0C61PdFcAk1BTiG//jnObP0ZaK+l+ma
         kCs0RaTs0QfMNnP+aK5Og9hoBGVSKKfA2vIODJv5Ys8wWes50774r34A2a8mhiyZ48OW
         pzRkwfSOKeWK4S6mdRh9WG0VlOZeQpErso6mCujhadA5ZH1hVTeof8eMYjY6WkDIT9bG
         Kak96VL+Hxhkz9zKdDhW0Glm8mB0/yMqFUVcak8wuSNZ/JTiKilCcQ44LAADY6LODDJF
         u0a7K88skQ7ffeAdf+BqtWYEmWajq/MNlRuhmD9leiDrEHX/P+IkYVPpaaz13mNk/ACl
         TruA==
X-Gm-Message-State: AC+VfDz8IYNJoKPIELWYMDrVls/GAF0kGgQr4z6S1r19mRO5BQwgdpm8
        0jrHTu3jabSQVKNl6Z6Tt8kT7g==
X-Google-Smtp-Source: ACHHUZ50qPNApFi2MmOPTnvCr77WdeYUjwF6pPWrKpYzpgU/fRaUrIYxv1IxrwaHH8zrKr3sxiGMTQ==
X-Received: by 2002:a2e:9d82:0:b0:2b1:b831:47d with SMTP id c2-20020a2e9d82000000b002b1b831047dmr1708268ljj.50.1685847704284;
        Sat, 03 Jun 2023 20:01:44 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id d15-20020ac24c8f000000b004eb4357122bsm653181lfl.259.2023.06.03.20.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 20:01:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Subject: Re: [PATCH v3 0/9] drm/msm/dpu: simplify QoS/CDP programming
Date:   Sun,  4 Jun 2023 06:01:32 +0300
Message-Id: <168584750430.890410.17521895983925668903.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518222238.3815293-1-dmitry.baryshkov@linaro.org>
References: <20230518222238.3815293-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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


On Fri, 19 May 2023 01:22:29 +0300, Dmitry Baryshkov wrote:
> Merge SSPP and WB code programming QoS and CDP. This allows us to drop
> intermediate structures and duplicate code.
> 
> Changes since v2:
> - Moved SSPP_VIG_CSC_10_OP_MODE close to other CSC10 defines (Jeykumar)
> 
> Changes since v1:
> - Fixed kerneldoc for _dpu_plane_set_qos_ctrl()
> - Fixed danger_safe_en programming conditions (Jeykumar)
> - Simplified the code surrounding setup_cdp() calls (Jeykumar)
> 
> [...]

Applied, thanks!

[1/9] drm/msm/dpu: fix SSPP register definitions
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5f31d7e61ddf
[2/9] drm/msm/dpu: simplify CDP programming
      https://gitlab.freedesktop.org/lumag/msm/-/commit/48b3207e4ed9
[3/9] drm/msm/dpu: fix the condition for (not) applying QoS to CURSOR SSPP
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2defa907ed50
[4/9] drm/msm/dpu: rearrange QoS setting code
      https://gitlab.freedesktop.org/lumag/msm/-/commit/78c2925de971
[5/9] drm/msm/dpu: drop DPU_PLANE_QOS_VBLANK_CTRL
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d5f86e50f031
[6/9] drm/msm/dpu: simplify qos_ctrl handling
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f68098003dc3
[7/9] drm/msm/dpu: drop DPU_PLANE_QOS_PANIC_CTRL
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9ccff1d2c062
[8/9] drm/msm/dpu: remove struct dpu_hw_pipe_qos_cfg
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a5ebb27bffcc
[9/9] drm/msm/dpu: use common helper for WB and SSPP QoS setup
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5fe0faa62461

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
