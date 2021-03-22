Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFE1343974
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 07:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhCVG1r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 02:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbhCVG1h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 02:27:37 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 983A7C061574;
        Sun, 21 Mar 2021 23:27:37 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id j7so11553626qtx.5;
        Sun, 21 Mar 2021 23:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UN2DBp337bmBg2JvFEjyAICLpTyBUkKCj50Vu8+iwuM=;
        b=Jc9deH4H24Hwb+zAcnS/+DV4Uc9NQo4DVFWJ3tytn9oE2c5VR14YI9Lil+U+sR20bw
         8kP53duoNq906ODsgcQ42bc2/NJuTx3r35IMAUYVMpbpKAoPS1fS057FnCzIJGoX/Mw8
         pzhhobgidi7r6mExQedAnXQWvNtREM4bZFzd07wTF+X0m+CazjFCnPoLxmIc51mNUlXu
         EVyGo+mgRg5WBqIQrdh/zAroIy/7st5oPsFzuPwAYqm5BUmcNVEbD0ljyT7fsrn7zgsf
         8/NQoFSszycCJskPW0UHcDaxxomv175Bmbru5jAmCUbGvy/n7eX7Vb/4D3kactiTumnx
         tIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UN2DBp337bmBg2JvFEjyAICLpTyBUkKCj50Vu8+iwuM=;
        b=jJWtmoQdBtnTvjYXGPXSSfBK/HAArkxfaI0u1SYzO2aZ+aq3fJwhsE4b7rFB7AYXIX
         Ye0oDd6N6ZQT30i8jRitfDW/rD/XinyGyeAijsmEcS5YjFez0q/0E6x3OdCmpMqwM4tY
         0d8z6LgxTTghaHQXHrv39NHGneE6VO27uZ0v3zDI3kX8NiGQYXdhoTPHlpG/Kx9jjvWG
         QD+o21KVaK3dgk+mSm1JtR3i3Oxd8VDAzZQklozlBwrG4ARaQzgtpsH+IcQH+YcHZftF
         s6Vk5XinLfSn98E1EesPdL5GWZxnJLC9y8U5ylX9O2lM14ekx7Gfm/eShr1dUsTHn7+l
         gWGw==
X-Gm-Message-State: AOAM531w75krN83FTpwZ/nhjrla6QLK/w4BD7sxUfOyQ4Que8WsXcZAU
        XfWx6Dbqkyi5mJ3YbqIgFMY=
X-Google-Smtp-Source: ABdhPJy4NxShUwnCd/VrghbUj6oBBdhFC2Gxq22ZklZjA6vzIY+k1hFBOaq0tGdi0GcFlF2FTF0vmQ==
X-Received: by 2002:ac8:109a:: with SMTP id a26mr8228026qtj.156.1616394456942;
        Sun, 21 Mar 2021 23:27:36 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.40])
        by smtp.gmail.com with ESMTPSA id t188sm10405066qke.91.2021.03.21.23.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 23:27:36 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, jonathan@marek.ca, unixbhaskar@gmail.com,
        dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org
Subject: [PATCH] drm/msm/dpu: Fix a typo
Date:   Mon, 22 Mar 2021 11:57:23 +0530
Message-Id: <20210322062723.3215931-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


s/struture/structure/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 09a3fb3e89f5..bb9ceadeb0bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -343,7 +343,7 @@ enum dpu_3d_blend_mode {

 /** struct dpu_format - defines the format configuration which
  * allows DPU HW to correctly fetch and decode the format
- * @base: base msm_format struture containing fourcc code
+ * @base: base msm_format structure containing fourcc code
  * @fetch_planes: how the color components are packed in pixel format
  * @element: element color ordering
  * @bits: element bit widths
--
2.31.0

