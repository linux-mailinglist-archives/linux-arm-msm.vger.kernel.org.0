Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A77D48C4D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jan 2022 14:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353592AbiALNaU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jan 2022 08:30:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347543AbiALNaR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jan 2022 08:30:17 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33239C06173F
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jan 2022 05:30:17 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id i14so3578471ioj.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jan 2022 05:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VyNu9b/u15HNK8WgayC0PGs5Li3Fy8D8TOIf0HOapA0=;
        b=iWwYPFxkZeFWNMVWpJ8ZlJ0K3PD3B8Xj7l8DZ67qgzlX3JsspMlbjs56J8UMNtzoJE
         b7llpcsjCiYLuAfc8Jn9K5MXlVCDktWSqNgxohzC9YATeBVxzwtDkqin9JjMKfo2yTdq
         GArmkeeDqVjo1HJWYi+UeMD2c8pwYS4EEXku3Oyvgp1R9cmohFnFdmkr1UMH5pf5g6h8
         zTVQLqsowIgLQSKEEIUym/aIpoGP8aaooMTXQPfiesF2VfzSR2RuVKW+jtpNwThHHcHL
         fw+bRnNCrJRD7l8umr+8kDFBn2a+wN8SIdvdUEcwjoXRYMFElQ+b10dz53DTkJt8uMjI
         A6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VyNu9b/u15HNK8WgayC0PGs5Li3Fy8D8TOIf0HOapA0=;
        b=23wlCnrDZnjIttZUlz8GpYNdoQgkhNWS8Ge8tOMhmuPqbrxWca9vak5HaB0Fku2Iwg
         gaUdaLT2Mt5fdYm7apKFPGV9GN9naVUOV0pxKoDBhHgvMsMUf/TeXJJMOeEYX7mOu1dJ
         gUiZweiB321gDBVKrP1y4V+J8qK/dKIi0ri2Bt+HFkgzOumwdjGmdbEKMQDYYS+GXOMU
         dCDSV8/3+vqXgCSKHMyzO3PGG5hBK/K5XFrYNLCrVp9mtXWOWGAtSuH9aPkWKHe8zbqF
         asJH1aeOt4bXY/clGHjzUkTgdll+QCuLPvjLaO+/jqqPKsqYtP35OC/N6Mxi+KDbnOvJ
         FRxg==
X-Gm-Message-State: AOAM532lUq+e1rpztfF/+lTimnLtkjVlM51hKYvBX++A81fi4iR1ObB6
        73M+yO1+jtpAKfROAM6euMWurg==
X-Google-Smtp-Source: ABdhPJyBaFc5FMh753j2k67ag7qUA7kfpJvOinYb7RQl0hMI8/m3KqimEx5BBy1BfVSUS0HLwwwAGQ==
X-Received: by 2002:a05:6602:490:: with SMTP id y16mr4620715iov.162.1641994216584;
        Wed, 12 Jan 2022 05:30:16 -0800 (PST)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id e17sm7476742iow.30.2022.01.12.05.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 05:30:15 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     jponduru@codeaurora.org, avuyyuru@codeaurora.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        cpratapa@codeaurora.org, subashab@codeaurora.org, mka@chromium.org,
        evgreen@chromium.org, elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net v2 0/3] net: ipa: fix two replenish bugs
Date:   Wed, 12 Jan 2022 07:30:09 -0600
Message-Id: <20220112133012.778148-1-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series contains two fixes for bugs in the IPA receive buffer
replenishing code.  The (new) second patch defines a bitmap to
represent endpoint the replenish enabled flag.  Its purpose is to
prepare for the third patch, which adds an additional flag.

Version 2 of this series uses bitmap operations in the second bug
fix rather than an atomic variable, as suggested by Jakub.

					-Alex

Alex Elder (3):
  net: ipa: fix atomic update in ipa_endpoint_replenish()
  net: ipa: use a bitmap for endpoint replenish_enabled
  net: ipa: prevent concurrent replenish

 drivers/net/ipa/ipa_endpoint.c | 28 ++++++++++++++++++++--------
 drivers/net/ipa/ipa_endpoint.h | 17 +++++++++++++++--
 2 files changed, 35 insertions(+), 10 deletions(-)

-- 
2.32.0

