Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9140E1BF3CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 11:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgD3JHc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 05:07:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726677AbgD3JHb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 05:07:31 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B68C08E934
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 02:07:31 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e16so774465wra.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 02:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j/VyKcY8b8oiztzP2PPDO3W5n2EDqYUH2AhxchTmUF0=;
        b=DKVcEDzjU1nHGvIrWrdAgdV4/v+yjAVqF5c8cBmF5F+crl2liyolOdgfbXFBHHAiEz
         Y1sWy2QKykqwgiAz+HCFf6Al7Snk+hfy5I7XqA4EosdGLE8iBZfCnqEV2glGdS3Z/pqE
         GVmrHz/ThDAeQXRiHvFwXI7F4RzU5prw35OoPzPwgx72bfHSDEa5Kxtkx2MUMdpg55zM
         +CZSHXvYkJWVWjyJwR7LGxzrXY2xtQdORNsiHa99hVudBoPV7vAXrgMnh6T7FHEJ2fg9
         WpRZrC8eiY4d+uvSg2N/270+wNvWpg1sCBQosXP6WkPY/4/8Wzy6QtD1dHFBkxOKOBqY
         5m4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j/VyKcY8b8oiztzP2PPDO3W5n2EDqYUH2AhxchTmUF0=;
        b=PlP4Co+ExyDXGpYWi+n+INa/VoFWK3Ubq3h5iWEGXVCpRlAgz6+AbJ9h9Nc2Iuvmov
         IuVI+Yc4XZlDZvW75jsr0I6dTwMG8uJ65DTYio2C0GUxV0fr9RgCPJJKqF4jp4B50nKw
         Ujg46j/izk4WynkHaXK8gOi9uj25yzTeEhLP/eykYvHct5LWdWCnWzsYUSourqgt6SE+
         lOvAKF+D1+0qyfIBDDrf9eJufNJCgvpl60llLoF3/rvBklCCbuvBQ5rpbXUwdpDiLPP2
         Tdkc7AQbP2ROegDXygjOppYAwRYZV0KqZDmZ9wypquKGwQk48LD3PLreTt2JeBpZreq9
         6JdA==
X-Gm-Message-State: AGi0PuZGA97jEh9BMjF7mv70e6zbvGrewiAvdYhdgRRxMmlhn58UgVXt
        piGEx4ft+suJN/BZYp8kcAc60A==
X-Google-Smtp-Source: APiQypKDQa9mMkqV6/Sh2mSfzjhiBnauazreah2B4CDelAiTWBWhB17cPSJG8Vkg/AeUPOhxUH5ULQ==
X-Received: by 2002:adf:cc81:: with SMTP id p1mr2872294wrj.372.1588237650080;
        Thu, 30 Apr 2020 02:07:30 -0700 (PDT)
Received: from localhost.localdomain ([2a0e:b107:830:0:47e5:c676:4796:5818])
        by smtp.googlemail.com with ESMTPSA id t20sm10962025wmi.2.2020.04.30.02.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 02:07:29 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH net-next v5 0/3] net: phy: mdio: add IPQ40xx MDIO support
Date:   Thu, 30 Apr 2020 11:07:04 +0200
Message-Id: <20200430090707.24810-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series provides support for the IPQ40xx built-in MDIO interface.
Included are driver, devicetree bindings for it and devicetree node.

Robert Marko (3):
  net: phy: mdio: add IPQ4019 MDIO driver
  dt-bindings: add Qualcomm IPQ4019 MDIO bindings
  ARM: dts: qcom: ipq4019: add MDIO node

 .../bindings/net/qcom,ipq4019-mdio.yaml       |  61 +++++++
 arch/arm/boot/dts/qcom-ipq4019.dtsi           |  28 +++
 drivers/net/phy/Kconfig                       |   7 +
 drivers/net/phy/Makefile                      |   1 +
 drivers/net/phy/mdio-ipq4019.c                | 160 ++++++++++++++++++
 5 files changed, 257 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/qcom,ipq4019-mdio.yaml
 create mode 100644 drivers/net/phy/mdio-ipq4019.c

-- 
2.26.2

