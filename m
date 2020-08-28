Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E542559C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 14:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726904AbgH1MEx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 08:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729040AbgH1MEu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 08:04:50 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0CB9C06121B
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2020 05:04:49 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id d2so585714lfj.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2020 05:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TgZN5k4zgCgVIKk9yzQ3Co85che7corukCzN/Lkq+a8=;
        b=QXvXzMXdEnokKqwevSzu0gEWkjTHW4COEm6UC6Wq5YMkNWJXwCsv+lznN2OevmqBcH
         5Fa1LOf1jqZt1yiQoqTbxlgfoLsAZ0sXvWOUSggAed0lb+pAyNXLjr8EszRMvZ32Ncxz
         mtw6Po7OKOeOnl8DXF7jEwDSAhremD6Pjk4OMXl/lVkiXqQu6Hn2moGWAyxPkEDd/OFy
         iydvHn/a2dZU4ckQenX3PsNhtRpwFwmAuOIjyRzHG/CTb7HrfB66bGfT3JwFnGhSiaSD
         XWyForvhEtbK55/PL9W8FN5q6YyX7nQYxMC+Ggt17K2Yus82iOqyIQphdxgU2vXIGYE0
         K9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TgZN5k4zgCgVIKk9yzQ3Co85che7corukCzN/Lkq+a8=;
        b=fNrmpS+7RWOntkKVmPoIigtasqjI8OlW0RwkrKOSked2/m96WSp5jS+Wg8YsQtXBKr
         OYXWSowXaFHIuxfX29sWJrbTa8b+sGR5cPjQc1RTq7czLkQSEOUTRVq/EgYp1YDCnoU0
         quhh2r1d/GzwvGBo7t+DbqpeagLzu8Hk5X74aCikK/yxvllN+0hvXlNTHoa80UfW0Zmg
         fFqzY1sVNc9vGYXaThceg5lUL1caiY8FCvBchAqct9GKDOnvU8GyH5CnVXYjR1ZmMw1r
         g+0c9tATZTX5q7oEZt4oOvlXAPaho3DwY+RH9Z4rqNmpKVleVAMmJQWnTBBSnHeLx+Sz
         Fwsg==
X-Gm-Message-State: AOAM532iig+9g7PLiclEZ4B84t215XJZX5uRy0QPo1m672sCH1Q1XJjN
        7/C5GhVuFANu0r5E6IWXgJOBmg==
X-Google-Smtp-Source: ABdhPJxpXVy+9SjKXDpyOHrVUBisCH9EcV0N2jryHo7PSZZb2KX3/RzOYc9U0FIn/icoWkBP/2uIvg==
X-Received: by 2002:a05:6512:370e:: with SMTP id z14mr660573lfr.80.1598616286521;
        Fri, 28 Aug 2020 05:04:46 -0700 (PDT)
Received: from eriador.lan ([188.162.64.62])
        by smtp.gmail.com with ESMTPSA id c4sm163340ljk.70.2020.08.28.05.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 05:04:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v1 0/2] Add LT9611UXC DSI to HDMI bridge support
Date:   Fri, 28 Aug 2020 15:04:29 +0300
Message-Id: <20200828120431.1636402-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

This series adds support for Lontium LT9611UXC bridge chip which takes
MIPI DSI as input and provides HDMI signal as output.

The chip can be found in Qualcomm RB5 platform [1], [2].

[1] https://www.qualcomm.com/products/qualcomm-robotics-rb5-platform
[2] https://www.thundercomm.com/app_en/product/1590131656070623


