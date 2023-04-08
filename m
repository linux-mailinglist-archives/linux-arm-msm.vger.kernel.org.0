Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF096DB7BA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Apr 2023 02:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjDHATn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 20:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjDHATm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 20:19:42 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 428D0E07F
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 17:19:41 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id s20so24530401ljp.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 17:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680913179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57HcPU0bVjNRBD2VzJ3NmOqnMURGDJjSzS2VLeSuLyM=;
        b=DHr+UeVkBe9KXl0I1AT+rCbbTdagUZq5LuRuL+pTLJH6x/HrbecmncSqEUJZSzvSgy
         gxcQBNzqMMZdGmRa9jzvl8ldTo00cibKWCuLjwYPR1DV3r9wDveZPssbqPhbFSTIfTPB
         iAna0l4KJpUeHuZD4CcV93O4pwq+oNq0lf1GiXegryqQVE+sgHB5RP/K8LUIazXrsUWG
         ofdeNb7EMa6nz9yuYsfgCHEU+tpFvmc3h+xc4zdOSicFpXnouc+uAoJBB9jOocbEqfza
         z9nrMS5oTnFJT08LBgYx/b6MUT23xsxuTYh5VTIpNJUossH5OhKnsyNBrmotK8FNA6KR
         wMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680913179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=57HcPU0bVjNRBD2VzJ3NmOqnMURGDJjSzS2VLeSuLyM=;
        b=wagI1o4PL+jhf3lhOzFTPN9/Q8jwoHy2YGovDDs8lxB9CPdCCZbnm3LsvSdM16sw0i
         K6wMJhR3ySFaV/3zor42XNQixWwzAMgJX4he2lepLZplT/d1GlZC2Quk+xd4biVYX8G0
         QUMZajQX3lBSw9X4caG2ageQEuObTGGzL0Go+kENR1ISv6/602qQDRnuLZckgd740eNZ
         1ocJLfb5ZVEOe51NbMip/CvuQHWBi9fuoQrYwFAE1/66kEjgdeZwkujzGww+ggePQhjF
         ylMPeLFAqvHQt3XuPdRaDSXFqNQnNxnUF83dfzF1fWKkpZrEgdmbPHqruEWC3CdM+P8j
         C38g==
X-Gm-Message-State: AAQBX9ecuVw0/PEB8k62Y9eob0dsVhRVFgECzEAmf3vQ4GHpb3qZuPwc
        nYaCpNhRxAQ9UED9m3yvfT+Mvw==
X-Google-Smtp-Source: AKy350bRXN2zFKtJmnwFM15cD6NKUPDtoQ1g4HFH1TA+02d9oBfPpHYYQmmKmQSDUtxWuoWqieqiNQ==
X-Received: by 2002:a2e:860b:0:b0:29f:390:6642 with SMTP id a11-20020a2e860b000000b0029f03906642mr101395lji.7.1680913179345;
        Fri, 07 Apr 2023 17:19:39 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f20-20020a2e9e94000000b00299ab697a9esm1041942ljk.111.2023.04.07.17.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 17:19:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 00/42] drm/msm/dpu: rework HW catalog
Date:   Sat,  8 Apr 2023 03:19:38 +0300
Message-Id: <168091312792.2720696.9740741305690316067.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, 04 Apr 2023 16:05:40 +0300, Dmitry Baryshkov wrote:
> This huge series attempts to restructure the DPU HW catalog into a
> manageable and reviewable data set. In order to ease review and testing
> I merged all the necessary fixes into this series. Also I cherry-picked
> & slightly fixed Konrad's patch adding size to the SSPP and INTF macros.
> 
> First 6 patches clean up the catalog a bit in order to make it more
> suitable for refactoring.
> 
> [...]

Applied, thanks!

[02/42] drm/msm/dpu: Allow variable SSPP_BLK size
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8f940ddbc4f1
[03/42] drm/msm/dpu: Allow variable INTF_BLK size
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8399a5ff18dc
[04/42] drm/msm/dpu: constify DSC data structures
        https://gitlab.freedesktop.org/lumag/msm/-/commit/fc4fcfb0744b
[05/42] drm/msm/dpu: mark remaining pp data as const
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ac1c5ed678e8
[06/42] drm/msm/dpu: move UBWC/memory configuration to separate struct
        https://gitlab.freedesktop.org/lumag/msm/-/commit/fbbd8cce803a
[07/42] drm/msm/dpu: split SM8550 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9cc547933636
[09/42] drm/msm/dpu: split SC8280XP catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/225978f43986
[10/42] drm/msm/dpu: split SC7280 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f0f2c32a662c
[11/42] drm/msm/dpu: split SM8350 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b8ece0c61e13
[12/42] drm/msm/dpu: split SM6115 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/01f2e9a70be1
[13/42] drm/msm/dpu: split QCM2290 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c22a42bd3eb7
[14/42] drm/msm/dpu: split SC7180 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c9cd1552e95b
[15/42] drm/msm/dpu: split SM8250 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2f36168e3257
[16/42] drm/msm/dpu: split SC8180X catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/97e2c8037694
[17/42] drm/msm/dpu: split SM8150 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/25035306871e
[18/42] drm/msm/dpu: split MSM8998 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1c611c481e8d
[19/42] drm/msm/dpu: split SDM845 catalog entry to the separate file
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9a4425f404c3
[20/42] drm/msm/dpu: duplicate sdm845 catalog entries
        https://gitlab.freedesktop.org/lumag/msm/-/commit/460c410f02e4
[21/42] drm/msm/dpu: duplicate sc7180 catalog entries
        https://gitlab.freedesktop.org/lumag/msm/-/commit/7ea3e251a84e
[22/42] drm/msm/dpu: duplicate sm8150 catalog entries
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8589ccd71067
[23/42] drm/msm/dpu: duplicate sm8250 catalog entries
        https://gitlab.freedesktop.org/lumag/msm/-/commit/586c11233ea8
[24/42] drm/msm/dpu: duplicate sm8350 catalog entries
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9bea40825512
[25/42] drm/msm/dpu: expand sc8180x catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2861ce202cd8
[26/42] drm/msm/dpu: expand sc7180 catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/02538790a8d4
[27/42] drm/msm/dpu: expand sm6115 catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5ce224840b9e
[28/42] drm/msm/dpu: expand sm8550 catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/463ba323aeb4
[29/42] drm/msm/dpu: use defined symbol for sc8280xp's maxwidth
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8f41187a0649
[30/42] drm/msm/dpu: catalog: add comments regarding DPU_CTL_SPLIT_DISPLAY
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5a7e3c008d35
[33/42] drm/msm/dpu: drop duplicate vig_sblk instances
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d16b77dd8658
[35/42] drm/msm/dpu: inline IRQ_n_MASK defines
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e5edf654536f
[41/42] drm/msm/dpu: fetch DPU configuration from match data
        https://gitlab.freedesktop.org/lumag/msm/-/commit/dac76a0144d3
[42/42] drm/msm/dpu: drop unused macros from hw catalog
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ac7e7c9c65ec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
