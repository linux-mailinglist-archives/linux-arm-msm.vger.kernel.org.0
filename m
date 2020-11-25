Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9722C385B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 06:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbgKYFMX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 00:12:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgKYFMW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 00:12:22 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A156C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 21:12:22 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id n137so1227028pfd.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 21:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X6k1IOsQDjGvUYpOQL8+dKZam2GpJjbx2h3F0tfq99Q=;
        b=lm5wloISPmPIpsMkmVsXeb9y1sX+o8SnV5tVZ1Sli/jgcrDpczXPSa9ZEcFtUXA8Af
         fHn0hzPuzLnZq+t8wRdcjEYGxJrcw00B0VfXcuG5qHiZt/TFqtKqvNws/N1+xjkrIzFg
         T74wOOSZSvMgnVH8Mz4cbWrcyBsIB7deqbVmo1iVhPejKf480JsNpsrrQzcrKIO3jbyx
         4Q8XpaOiAIY4MFmP6hvzyzCWh9/lEC58uJ+ThDjGEL19HdzpXz5tNQxNmBYkJofjjoJz
         pNknomy/0SVSTVLBKGmtXwUZ+kDeS1WzA3JWSLKeEc0UOCfxiVAI+CCkaNiltIbjjybd
         Z2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X6k1IOsQDjGvUYpOQL8+dKZam2GpJjbx2h3F0tfq99Q=;
        b=lHiTtWEJO6dO05GIa43PXK2RM+ZVWpbK3hrzquf4Fx3ecObx3CL/Igc/ZKp1o8ALoW
         qPVmgSPMMBnDL25ba5rb4Uo8kGCAffNJtPyewkgvn1tsBw5m4sxIe/QOh5/So2mAatnE
         HU+REmcofmGiiom2JSSk2W0emBFGx6c6jY7Ro/hjvBWDsmScVPRSooO4r5dBhZ9i/dUc
         b9SI8KrML9JM/bKe6evmRWKbfm9vv0zWCUVyNT787QxmkrCSS3jxBPL4lnDp7z9b5mA8
         kDflF4O4hKvkepk6YyJhiMWUPCf0enc7yqX5c83mwkVRL9QHA5gDvDgEAtUYR5EDhBh8
         jRKw==
X-Gm-Message-State: AOAM5326VxwI3tQcqzBVxMVQyqzQ0cyFwdhfhccwiY8JLMsCLmYyc0Qs
        RpFMq/TEZ2fLzmIPWslwzKPW
X-Google-Smtp-Source: ABdhPJxSmftf9qmgHx/LwTeuK7k8MhqnLoDp/5fru9cO8O+Wipj7JnSA7Yh6WIiXASkM7GfndP0Lbg==
X-Received: by 2002:a17:90a:de89:: with SMTP id n9mr2093594pjv.224.1606281141935;
        Tue, 24 Nov 2020 21:12:21 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id x30sm763612pgc.86.2020.11.24.21.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 21:12:21 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 0/2] Add devicetree support for SDX55 Modem and MTP
Date:   Wed, 25 Nov 2020 10:42:09 +0530
Message-Id: <20201125051211.8089-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

This series adds devicetree support for Qualcomm SDX55 platform and MTP
board. This series functionally depends on Clock support series [1]
which is under review.

With the current devicetree support, the MTP can boot into initramfs
shell.

Thanks,
Mani

[1] https://lore.kernel.org/linux-arm-msm/20201119072714.14460-1-manivannan.sadhasivam@linaro.org/

Changes in v2:

* Incorporated review comments from Bjorn. Mostly minor changes.

Manivannan Sadhasivam (1):
  ARM: dts: qcom: Add SDX55 platform and MTP board support

Vinod Koul (1):
  dt-bindings: arm: qcom: Document SDX55 platform and boards

 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 arch/arm/boot/dts/Makefile                    |   3 +-
 arch/arm/boot/dts/qcom-sdx55-mtp.dts          |  27 +++
 arch/arm/boot/dts/qcom-sdx55.dtsi             | 201 ++++++++++++++++++
 4 files changed, 236 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/qcom-sdx55-mtp.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx55.dtsi

-- 
2.25.1

