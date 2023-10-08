Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02D897BCEAD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Oct 2023 16:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232280AbjJHOB1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Oct 2023 10:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230332AbjJHOB0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Oct 2023 10:01:26 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79B1C6
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Oct 2023 07:01:24 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50325ce89e9so4754414e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Oct 2023 07:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696773683; x=1697378483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AxUKAYWwBeD3fhOuChFzH6czq0+a6bwaaNWd9hM/xo=;
        b=RJeD80Uf3G33OkMpdMuvd71y8CJk+UCLOSIgob2CFd23Sn/B9hOnzSBrOomtdFlrkX
         HGmHtgcyABEnzRhC6WCm2GnIEiugPDX8pgzEJp8O/cEkIOGQFe2mGxq9EzYB5lBzYnUE
         upYWghhHn2mMkFAow9fm2uROCl2z+kwp3PTrYXg0cljKRBdP0YNq6hgHzVGMuSdtq7Dm
         oC1jJsz950k552rBhTo/jAO+H8tbKiCJ55E7QMOe8gbZRtwpIN7ThYbKZ2gkq3xhzzR/
         1SKz2Z+uyutcTxEP/b4rPzj3rfR1FLTMNh94JeAC5V2OnNCnBEE8fiZulqe1zCQavG+r
         23Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696773683; x=1697378483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6AxUKAYWwBeD3fhOuChFzH6czq0+a6bwaaNWd9hM/xo=;
        b=rQru9rY3/YKB0pucIKm5saN1xV6B/Rv5PKUHoA4dH8rWrrM5cJAgKlDjBD8YHtSZhV
         aBfp/fTUHbAulk9+HEpyHdZ1AfcAWhyexdWDkLE00tX7NxkHAuuWBEx63sLYO/ta+mrd
         iex+H8z6toPWjLdmOX2Lm7qgaJSja6SDwcoWxnvtboA3udDBENahjkIecanpCzfEZL1w
         hPAnhJRSACgPdY5GtXHidDwQVPp6TItN4yJruKvyFdy+mvUUnNNSZSR6ke55br/KnIOK
         fAud+3+XGS1KaeEcmPbtR0m8jMR3CWwzO7tbhgVoWvjATHmcO5jtEaZcKzT9WPQsD3Rr
         g9Wg==
X-Gm-Message-State: AOJu0Yx+bKCu8GV0lVpe+3OWUHIcnLyMaCFLReu7aQXGl7fZ33b/S4KI
        5Et4+5nD/bkvasb35xMRjp4btw==
X-Google-Smtp-Source: AGHT+IGsqTrsOImdMhvATLLAdYVP4k0fs20niP68rGVFAV23rBnI9b++gPvcTznvyxr7TtMImQjc1A==
X-Received: by 2002:a19:4f43:0:b0:500:a240:7240 with SMTP id a3-20020a194f43000000b00500a2407240mr10846395lfk.52.1696773682823;
        Sun, 08 Oct 2023 07:01:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q14-20020ac24a6e000000b00504211d2a73sm1080455lfp.230.2023.10.08.07.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 07:01:22 -0700 (PDT)
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
Subject: Re: [PATCH v3 0/8] drm/msm/dpu: move INTF tearing checks to dpu_encoder_phys_cmd_ini
Date:   Sun,  8 Oct 2023 17:01:13 +0300
Message-Id: <169677306905.2570646.4925967072440404111.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 04 Sep 2023 05:04:46 +0300, Dmitry Baryshkov wrote:
> rop two feature flags, DPU_INTF_TE and DPU_PINGPONG_TE, in favour of
> performing the MDSS revision checks instead.
> 
> Changes since v2:
> - Added guarding checks for hw_intf and hw_pp in debug print (Marijn)
> - Removed extra empty lines (Marijn)
> 
> [...]

Applied, thanks!

[1/8] drm/msm/dpu: inline _setup_pingpong_ops()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/536cb755ae62
[2/8] drm/msm/dpu: enable PINGPONG TE operations only when supported by HW
      https://gitlab.freedesktop.org/lumag/msm/-/commit/feb77ef1518e
[3/8] drm/msm/dpu: drop the DPU_PINGPONG_TE flag
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ec6a2b7ea1a4
[4/8] drm/msm/dpu: inline _setup_intf_ops()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3d6253c215c1
[5/8] drm/msm/dpu: enable INTF TE operations only when supported by HW
      https://gitlab.freedesktop.org/lumag/msm/-/commit/72e72051c9f3
[6/8] drm/msm/dpu: drop DPU_INTF_TE feature flag
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6a0903388dcb
[7/8] drm/msm/dpu: drop useless check from dpu_encoder_phys_cmd_te_rd_ptr_irq()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b9898213ae5a
[8/8] drm/msm/dpu: move INTF tearing checks to dpu_encoder_phys_cmd_init
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4e2bbf17f41c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
