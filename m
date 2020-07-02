Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66565212143
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 12:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728447AbgGBKaL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 06:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728346AbgGBKaK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 06:30:10 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99AB4C08C5DD
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2020 03:30:10 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id o2so27314030wmh.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2020 03:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rGcFFw5Nzu6VhZiGQetAIFUMxgGvSVZizNqBhV84xWg=;
        b=0Ydm4tR4j2q0OjR55gGolBuZ26NjGFaA/Zr+e35oxw2/eIWErBddN4dRlLVATg7zLt
         onwvPRrG0Nv9JQFUaSvA5BMYNMeTs28ceuyDAcnfp/Wfs1A24cz5WwJRq6Fh8Nb1KnXU
         jihJI2brvS1X7f6H3uNArluDzQ/4j0Qfogp8jHe8siMGwYsSYAhp35iH3N5/LbwJSO1d
         pwLqKGQuNYD3rr7iOp3nE7ynrrUQZUTwKxfdNhlIhDvmepvJjeehdNxz7gNi6VGYe6OG
         tQmvh3/FwyFX+2x17bM3zIT4u4rI3qYmNgNg1QREC6ljBEGzf+GMEs6YsMZhzysGoAa2
         BdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rGcFFw5Nzu6VhZiGQetAIFUMxgGvSVZizNqBhV84xWg=;
        b=lvDQJpZN58FPZ8gDYB/o1An/TiAl4jBqLhg+d75NeTvR22JVA+1uVPiL7i9bsC8mJ6
         qQomdXEAsRfZ8XxLKseN5MQa+qNBvfbi5O+3tIbjmwbv/Hp/zw2CAISv5tKtxQQyuCXC
         jmIJjtm0xsUCWwy5dgtXcMgG8fZ6hcPaVicAqW781tP4Hi8UCVoh6aE+41vZMUsRGMKa
         2SGo4ADuoj+46r7Rv/OdMoFQLaUog5Ow1iArRp2AYgA49sNkdgL6WP+MlrVLkvyDkzdA
         YXA5dwBMHCKLCQmdWbBPT81L05fI3rFtxpNihwVW9oJKmQfcL6b1ToY1CRqE55xDTdie
         ZbEg==
X-Gm-Message-State: AOAM531FNGnoW9U+uvDR7HO9nZ/Lt41RsttvNzcwaTHFHvc93qL1PKE+
        4lv7672nXwpaUxGFkypRU7TNiQ==
X-Google-Smtp-Source: ABdhPJwJNE/SVDANdbxD71ir1Np5JakGw8nIvAnHDnXJBL7Jt2Lw0x7bxBRiYZl34MN3Gf22EcIujA==
X-Received: by 2002:a1c:c902:: with SMTP id f2mr30428182wmb.53.1593685809206;
        Thu, 02 Jul 2020 03:30:09 -0700 (PDT)
Received: from localhost.localdomain (dh207-99-59.xnet.hr. [88.207.99.59])
        by smtp.googlemail.com with ESMTPSA id 68sm10406912wmz.40.2020.07.02.03.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 03:30:08 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [net-next,PATCH 0/4] net: mdio-ipq4019: add Clause 45 and clock support
Date:   Thu,  2 Jul 2020 12:29:57 +0200
Message-Id: <20200702103001.233961-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for Clause 45 and clock handling support to
the driver.

While at it also change some defines to upper case to match rest of the driver.

Robert Marko (4):
  net: mdio-ipq4019: change defines to upper case
  net: mdio-ipq4019: add clock support
  net: mdio-ipq4019: add Clause 45 support
  dt-bindings: mdio-ipq4019: add clock support

 .../bindings/net/qcom,ipq4019-mdio.yaml       |  11 ++
 drivers/net/phy/mdio-ipq4019.c                | 141 +++++++++++++++---
 2 files changed, 132 insertions(+), 20 deletions(-)

-- 
2.26.2

