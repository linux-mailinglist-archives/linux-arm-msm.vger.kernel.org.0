Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEA92FF8F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 00:34:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbhAUXdu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 18:33:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbhAUXdt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 18:33:49 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACAFAC061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 15:33:08 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id m25so5006651lfc.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 15:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V6TNPYLJ/iTyhc4r9Xcvd9mWakKDvfSC0jfUqMNIv0I=;
        b=xDLeMku/suleSBlyaJI8VCb98rqZT5n7zloXMr0s4hjlYwxAMh6jU9eP9V0Dg0jBOB
         aJOa9mDJ+obXgxCwOoxVZRUXk3BIArQHWmpxYCfcuj2xoNJk2OwSWt4bfUKo+D8JW4/k
         WojIq+xhCo3UW4ETF+NnJbfyho8A7Aw84vHfLoJrTOFHLL68eWVmAzy5r7SZXVK31wdo
         bfa3vO+g7d4J7CfFu9dIDnLUd8s3y75P9Lh+sHHekVo+lvLpC7bG10tQl4c5k0qE7htG
         ZxkwHtyH8+/EWrRTEbWZwH2WJ7ep2ckyl/2ublNeWvTumoe6fTvShqlG6ds5AWHEs6//
         EOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V6TNPYLJ/iTyhc4r9Xcvd9mWakKDvfSC0jfUqMNIv0I=;
        b=Lh78kXOt1FaMIlsDu51WEEk4q4E8YsvVtFGB5PH2eUnjIDp+q5gTgZgtHnw+jNMOWm
         xHaEWAjcuPHVk6vJK/hLhtFvxQK5pV+T+O5BS1or6EEmY3CakyFp8I4qhNdVXlGPzBwj
         oWkjA10viGQdvf+NpHZ68CgXqqC3nVwtc2Jr8wt736TbFD16uY+GtXpm2/9L1k8HQlzD
         TDQein9BlSqXpTFnYA7a++0aO1r0F+nDQxSuW/YSEXqaNaCdFxIn02oGkDZOTBzMoVxw
         hg2l3rsfCvFiacBiqwT8ZgXlwaO+hfoGaoTSbioItsWGCwThyoc4KGts1y4kWYpifEpG
         Rxyg==
X-Gm-Message-State: AOAM532NV0Wqcp+rVdGpogMvM/N0m85qnmHmLFJOEWWW1/glZaLMBxv4
        2RXZL0gUVF06tnZG72++TokLsQ==
X-Google-Smtp-Source: ABdhPJwsdWbtbJtOtXvFD0vfg/VHE1WKYeMUXeN2ZJo8MM+gyoIui3wEyNDP67qjC817StoRNRGlpQ==
X-Received: by 2002:ac2:5dd1:: with SMTP id x17mr276362lfq.252.1611271987142;
        Thu, 21 Jan 2021 15:33:07 -0800 (PST)
Received: from eriador.lan ([188.162.64.145])
        by smtp.gmail.com with ESMTPSA id l28sm726969ljb.42.2021.01.21.15.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 15:33:06 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vinod Koul <vkoul@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 0/3] drm/bridge/lontium-lt9611uxc: fix handling of EDID/HPD
Date:   Fri, 22 Jan 2021 02:33:00 +0300
Message-Id: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These three patches provide fixes for HPD handling and EDID readout for
Lontium lt9611uxc DSI-to-HDMI bridge driver.

Changes since v3:
 - Protect hdmi_connected using ocm_mutex
 - Remove !! conversion from int to boolean
 - Add missing Reviewed-by tags.

Changes since v2:
 - Declare lt9611uxc_hpd_work as static

Changes since v1:
 - Split first patch into two smaller patches
 - Add Fixes tags

Dmitry Baryshkov (3):
      drm/bridge/lontium-lt9611uxc: fix waiting for EDID to become available
      drm/bridge/lontium-lt9611uxc: fix get_edid return code
      drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler


