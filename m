Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0695515AE55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 18:10:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbgBLRJi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 12:09:38 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:34866 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727548AbgBLRJi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 12:09:38 -0500
Received: by mail-lf1-f67.google.com with SMTP id z18so2152363lfe.2;
        Wed, 12 Feb 2020 09:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IqwUgH7eB/6nVqtx7m2GgicIwki2iewzvmH7SSzJ+Nw=;
        b=jcESkBnMu5+UTISPrf2kKrDOunWwyU7PHq6+O4WHizPSw1MpEgfSD/Mt7FNC+3Flvi
         6Uimdr6bMhu7TvAo/4GdudCT/U7Qj3FNUZU+O8Ntt4VQ9Ph/1/RVAvj6coB1IqG+c9ct
         FFAfa9cwZvLvw1hyvVOCtro4+QYAPmE3fmDu0FdTLc268Wda4lpfH8tL2mqw1I+Q/3xp
         8kLrYO/OO+FOC40nUo5+kSpy/ztfFH1821JwDv5cwGdIwoghiZvAVONghymfYtG3bOqq
         OulJgE7QVixo4fvvipmZd7dFQByQDUjxMVfUQY9+2OT7czrdGByETVcmIChe3IyGwAqJ
         sDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IqwUgH7eB/6nVqtx7m2GgicIwki2iewzvmH7SSzJ+Nw=;
        b=JzOBqX/vNz+VGY1he1mgAAxM0uYPCcE9ymAJd4pE5Vx0VtJvrez3JAhnwfHKPVvDEo
         EE+xyjDSdyds/H2FkwOCZac4D7RK9NcCxfHL6C7V+1fWcx+pkqOhvxejd8TMxnPMPvb/
         UrqU0rJsrGJtz4hR8lmZ/uSrz7jYamJDKi0zUf/S7VnlcXEo7O2ay8AxxSjAI4xcgggU
         PBngTX6eei6GOlSSA7Q+plqQMDp8rTCqbm7XrIdvxuVT7v3JR7HLC8eUATYwGT4vbu1p
         lwViLAlXtv+PZqW2ha8LpegvAeVX84aVGAZxRAE/7IHVor2TmFG3jSd+lRWqvje55UvZ
         3ewg==
X-Gm-Message-State: APjAAAVqCQUT7rJULuj9R/7Dpbb5NSILRP4fg+RagkZ7E5JNdEjdyJ9N
        H1zbcat8S6KHYcowV6W8hM4=
X-Google-Smtp-Source: APXvYqy/ZP1W467d/Dw/R9pXyH79NUF3/oLc93xqfKqMI60EA+sOoHLyrTMpbNRfwyuSlY1Tz2+aCg==
X-Received: by 2002:a19:6d13:: with SMTP id i19mr6918510lfc.6.1581527375894;
        Wed, 12 Feb 2020 09:09:35 -0800 (PST)
Received: from emb-minnehanov-OptiPlex-7060.collabio.net ([77.244.21.162])
        by smtp.gmail.com with ESMTPSA id b20sm607955ljp.20.2020.02.12.09.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 09:09:35 -0800 (PST)
From:   Alexey Minnekhanov <alexey.min@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Alexey Minnekhanov <alexey.min@gmail.com>
Subject: [PATCH 0/5] Add initial support for SDM660/630 SoCs
Date:   Wed, 12 Feb 2020 20:09:11 +0300
Message-Id: <20200212170916.7494-1-alexey.min@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset adds some minimal device tree
support for Qualcomm Snapdragon 660/630 SoCs.

Alexey Minnekhanov (5):
  dt-bindings: Add vendor prefix for Xiaomi
  dt-bindings: arm: Add kryo260 compatible
  dt-bindings: arm: qcom: Add sdm630 and sdm660 SoCs
  arm64: dts: qcom: Add SDM660 SoC support
  arm64: dts: qcom: Add Xiaomi Redmi Note 7 (lavender)

 .../devicetree/bindings/arm/cpus.yaml         |   1 +
 .../devicetree/bindings/arm/qcom.yaml         |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  |  42 ++
 arch/arm64/boot/dts/qcom/sdm660.dtsi          | 373 ++++++++++++++++++
 6 files changed, 421 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm660.dtsi

-- 
2.20.1

