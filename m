Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF2F76C9E8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 11:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233451AbjHBJz4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 05:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232454AbjHBJzw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 05:55:52 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DE5B2
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 02:55:51 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fe0e34f498so10620206e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 02:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690970150; x=1691574950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJMrjcr9jkge2euMTkVKQqYLJujx++pfTrs/hAuV4KA=;
        b=Si+SdWOVoxjzyjWsTNLd2wkWg+SneGUGPpFJXDry5EGZ71CvSAFsjShd7gi0pSd0w4
         Hssw+Ya5xNwlUH2pk796rdGVQhOLyP8+BHokymAjY8Wi8lKELrvQxbMHl6yvu2yisD5m
         Xm3SiG3ErDtf8Vl4b82H/KHYLP/xGx679fIHDGvarF3oUX3cb/LyKY/SvsGtuIs48KhG
         gKF5QC8hMLNHhrpd3+a7Q2AfyObKLo4S5XpnSSfB6IyawbJ1u/nYnHTp9bPkAt2R0b8H
         cTqZBdfOeaoSI/uDF0E7VToX5yq90XAoT2LqH6+MBHzC+lJ/NnR4MgXIBJTg4K8nC1mA
         gBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690970150; x=1691574950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJMrjcr9jkge2euMTkVKQqYLJujx++pfTrs/hAuV4KA=;
        b=k8oU8mzm66oOG4TruBHOj2HCmlWysiJ12F5UXQlhzqKrOjHGMeN/J9xjlOCDM+ClGH
         1hgXdZASd0ISsNbt5VN5DEIijh7UfKOzPdcAQM1wjRYgnthllvIcL3z0m6LbtHW2hGGw
         AeNHjgkmOeHSJfiWYcxNJQZ4ghvBpj0Q2smAoKf2/Am0O7g8ZmMMOlWRFQaelWbvGNZ5
         Pm5CLDww7n94yhtbb47iAziD6+Uqb92tGYYRTcMwETS1vGWVaD1KjA99jIa3z5paMLcy
         I5Op+2W2BbHL7UyxKhhiWlJ3nfb8Ijl3sdPXe/nbsCY1LIh9IURKS2YbUQ9voK2sboKE
         BsTQ==
X-Gm-Message-State: ABy/qLbjjgALb/WU921XuW+eI6YpNGufgHHRr3j+VtoAGdOGh8k/o3Su
        735vgJeWFEegHIQHhAOFjXCw2g==
X-Google-Smtp-Source: APBJJlEiprUvU7VvPCQFdVaf45lrlrgDbSbxANKym6XICGanWfSRc+sGRON3aEiXWBa00AOeRJTuQA==
X-Received: by 2002:a05:6512:6d1:b0:4fe:19ef:8791 with SMTP id u17-20020a05651206d100b004fe19ef8791mr5303425lff.38.1690970149856;
        Wed, 02 Aug 2023 02:55:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x17-20020ac24891000000b004fe1960dd7csm2779762lfc.132.2023.08.02.02.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 02:55:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 00/10] drm/msm/dpu: cleanup dpu_core_perf module
Date:   Wed,  2 Aug 2023 12:55:45 +0300
Message-Id: <169096995979.4183272.6636182589721297040.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
References: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sun, 30 Jul 2023 04:00:52 +0300, Dmitry Baryshkov wrote:
> Apply several cleanups to the DPU's core_perf module.
> 
> Changes since v4:
> - Dropped the 'extract bandwidth aggregation function' (Abhinav)
> - Fixed commit message for the patch 9 (Abhinav)
> 
> Changes since v3:
> - Dropped avg_bw type change (Abhinav)
> - Removed core_perf from the commit cubject (Abhinav)
> 
> [...]

Applied, thanks!

[01/10] drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f15de4f6245b
[02/10] drm/msm/dpu: bail from _dpu_core_perf_crtc_update_bus if there are no ICC paths
        https://gitlab.freedesktop.org/lumag/msm/-/commit/808c92df654a
[03/10] drm/msm/dpu: drop separate dpu_core_perf_tune overrides
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6a4bc73915af
[04/10] drm/msm/dpu: rework indentation in dpu_core_perf
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a6239e65c801
[05/10] drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s stop_req param
        https://gitlab.freedesktop.org/lumag/msm/-/commit/716f0d4cac0f
[06/10] drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
        https://gitlab.freedesktop.org/lumag/msm/-/commit/779f336ed4b8
[07/10] drm/msm/dpu: remove unused fields from struct dpu_core_perf
        https://gitlab.freedesktop.org/lumag/msm/-/commit/7a735940293d
[08/10] drm/msm/dpu: remove extra clk_round_rate() call
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d64d83806aa4
[09/10] drm/msm/dpu: move max clock decision to dpu_kms.
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4161ec7e93d1
[10/10] drm/msm/dpu: drop dpu_core_perf_destroy()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3d5199a173d0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
