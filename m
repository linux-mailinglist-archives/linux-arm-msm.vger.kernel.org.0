Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E941AD41B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 03:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgDQB2V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 21:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725858AbgDQB2V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 21:28:21 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 491E9C061A0C;
        Thu, 16 Apr 2020 18:28:19 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id 131so470747lfh.11;
        Thu, 16 Apr 2020 18:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6bIv4Ey7KTgpP+jJjbFa11g/XmInVR35K0OUuu60uAY=;
        b=X9abtq98/SmIYoikPs/RTpICF5o67Gqe/o81Hr+QM44F/2COwakpQT6bOJBQib0BMn
         MNc8Ztaj9j7wFUj63Y5yr2beYzs4gX+N6UOY86S8vkqzA+0LsC7OiOq0uMvUZsavvU0I
         B68uZae62Ch97IxN4H8pJdZ34Z2OdF96PRuM7CXyiO7e+qSYqJGWBkvyIXVuWf5K1r5D
         wWFNEeeV13SjT0VrCHSLeoijcBEoMtYp8wD48NZeiuaplpQDhUg2YwjgyOaXbWkRlIeI
         8OAAX1dvlzBANqWzdmQmz3U8u38v/pnkauqSc+5ZftdY4WAtFLeXkDJU2RGzBQfj3A74
         bPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6bIv4Ey7KTgpP+jJjbFa11g/XmInVR35K0OUuu60uAY=;
        b=f/hJJE7W5pMFSsksvvI98TJUSdOyg6wxP8NPWbnufP0q0sZWimiKA77TqpU+7l3Vlg
         5m4cD8iAVPadO0jT2eRxFybNOvPljh7GfaP35Dx1RcjsPwX9IgrldY9YcoaUFrUty/EL
         iiyIRODHrcP3WaWnKSHhibvUXY34523Qcx3IrmrUXkRiZ+7NIW/UfradjcBkvDrWxdgY
         OaGfiRVxKWkhivFRZos/XrCvTbNoauoc4O6QyH337aJqLri6DCZVBnE5weGfS/IJIibf
         gtLBgtJTrb+Sl2T7t206k9f2p8PgGH23VgrVPfIZW+mLmaoTbecUeH2sZofWpbwD486q
         XB5w==
X-Gm-Message-State: AGi0PuacfC8sAwXmvRCgfX+heNxUf5a91IjJUwHtoA+kEDss6EPzApNP
        bBHD2p4NU8JqqnbeK3rO8ls=
X-Google-Smtp-Source: APiQypJG6kGvdN67TsZu7OB2kpKPIUggZ4g1a64790zidW4ZHcyfGVG4sz6jWEkUeemtkEc+V3pEfQ==
X-Received: by 2002:a19:88a:: with SMTP id 132mr405691lfi.130.1587086897818;
        Thu, 16 Apr 2020 18:28:17 -0700 (PDT)
Received: from localhost.localdomain ([94.229.111.13])
        by smtp.gmail.com with ESMTPSA id w25sm14644650ljo.78.2020.04.16.18.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 18:28:16 -0700 (PDT)
From:   Alexey Minnekhanov <alexey.min@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Alexey Minnekhanov <alexey.min@gmail.com>
Subject: [PATCH v2 0/3] Add initial support for SDM660/630 SoCs
Date:   Fri, 17 Apr 2020 04:26:27 +0300
Message-Id: <20200417012630.222352-1-alexey.min@gmail.com>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset adds some minimal device tree
support for Qualcomm Snapdragon 660/630 SoCs
and one board that uses SDM660 SoC.

v2:
 - Sorted compatible sdm660 after sc7180 in bindings
 - Moved gpio-reserved-ranges to board DTS

Alexey Minnekhanov (2):
  dt-bindings: arm: qcom: Add sdm630 and sdm660 SoCs
  arm64: dts: qcom: Add Xiaomi Redmi Note 7 (lavender)

Craig Tatlor (1):
  arm64: dts: qcom: Add SDM660 SoC support

 .../devicetree/bindings/arm/qcom.yaml         |   7 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  |  46 +++
 arch/arm64/boot/dts/qcom/sdm660.dtsi          | 372 ++++++++++++++++++
 4 files changed, 426 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm660.dtsi

-- 
2.25.3

