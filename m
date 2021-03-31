Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B809934FE8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 12:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235167AbhCaK56 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 06:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234987AbhCaK5i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 06:57:38 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9E9C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 03:57:38 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id v15so28508657lfq.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 03:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8MkWJRDgLEB9kWyZ5s8Q9VLg7igUl49cjQjKv9VhOQs=;
        b=T2l1mkshCl6YEr2sg1PpgXbvvm/1CotkrF/GcTGYx7oF8cy3+4seZQ7q+wc3xZmSgg
         O57t6sdxREYa5YWhKrfD2ZxjaF/BBfa51oC9m9HXrwZfBaKaHH3p93e+F3jHQiKp4WJS
         sEIrO8xpUNxiYnzaZ52ZRZHSaG2jHw2r+xMzTHMeC4UEr8sIGCijKNwQPaFNyiJheU/Y
         wBaOCSJlnyoP9HW7F2L5eCzOwLx1bIDeNJvL4djxZBN4AomdnakpYFv1ZHfSDy7mPssz
         8M+BZvmQjysRNTSOMsvPcQRO/V5mFfk18EYIMHpFx4NfBIWPcaZNFP//z4fmkA3cA1VO
         YeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8MkWJRDgLEB9kWyZ5s8Q9VLg7igUl49cjQjKv9VhOQs=;
        b=nllsUbVavBGZd7NrMokA9IyyjZedA+seaH01wCuPa6NA6TW81gg+jOhv3OfSgy8pzK
         tr1FCOgMzZV9Pp/j/oyEPtYCFTeo3i3UlFAyuGZstngm4F5ljHLLznG7YgvbLYFAGY3t
         kDTp9d6zHUXZq7CL2VxEmhp1OD+YtSyUWJ72FQl8miVu4IyNJArl/dyCEGK3Dg9wjmCH
         LTd/7n5QuOCxdPIBDVfFu59y5jbScW2+JV/x6vG/rAAHI9A28g2iTs3jMpK7PyfykKel
         xee/7mZoQX/KZ8mgCoLDHHYd4yWXuN7gWDvJP11ikwtWPiz6IhS8WRSevhDbuPk+hEbH
         nYLA==
X-Gm-Message-State: AOAM532LkG/OpOyQjbkf4VrgPgpJiqzSeNEcT1IYxmn+LPcPlkU/G11f
        cEOK8C9wrazx/mxwi4/JP2CxlA==
X-Google-Smtp-Source: ABdhPJzinUMr68L3H0gNll59ZE9d2mkq7SzhhgLoSGMm3q7hf8wIK1TFkvYKx2COry8hY5RNKVo9Bw==
X-Received: by 2002:ac2:4e43:: with SMTP id f3mr1830598lfr.206.1617188256679;
        Wed, 31 Mar 2021 03:57:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h3sm184359ljc.67.2021.03.31.03.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 03:57:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v4 00/24] drm/msm/dsi: refactor MSM DSI PHY/PLL drivers
Date:   Wed, 31 Mar 2021 13:57:11 +0300
Message-Id: <20210331105735.3690009-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Restructure MSM DSI PHY drivers. What started as an attempt to grok the
overcomplicated PHY drivers, has lead up to the idea of merging PHY and
PLL code, reducing abstractions, code duplication, dropping dead code,
etc.

The patches were mainly tested on RB5 (sm8250, 7nm) and DB410c (apq8016,
28nm-lp) and lightly tested on RB3 (sdm845, 10nm).

This patchet depends on the patch "clk: fixed: add devm helper for
clk_hw_register_fixed_factor()", which was merged in 5.12-rc1:
https://lore.kernel.org/r/20210211052206.2955988-4-daniel@0x0f.com


Changes since v3:
 - Rename save_state/restore_state functions/callbacks
 - Still mention DSI_1 when determining settings for slave PHYs in 14nm
   and 28nm drivers.
 - Stop including the external dependency merged upstream long ago. It
   is properly mentioned in the patchset description.

Changes since v2:
 - Drop the 'stop setting clock parents manually' patch for now together
   with the dtsi changes. Unlike the rest of patchset it provides
   functional changes and might require additional discussion.
   The patchset will be resubmitted later.

Changes since v1:
 - Rebase on top of msm/msm-next
 - Reorder patches to follow logical sequence
 - Add sc7180 clocks assignment
 - Drop sm8250 clocks assignment, as respective file is not updated in
   msm/msm-next

Changes since RFC:
 - Reorder patches to move global clock patches in the beginning and
   dtsi patches where they are required.
 - remove msm_dsi_phy_set_src_pll() and guess src_pll_id using PHY usecase.


