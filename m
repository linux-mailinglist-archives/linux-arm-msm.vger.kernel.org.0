Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F29270782
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 22:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgIRUwc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 16:52:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726159AbgIRUwc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 16:52:32 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C61D6C0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2020 13:52:31 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e17so6504138wme.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2020 13:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5FMcTfB8bTNiA4IO/9hnI5vPpMpLqnjxtoFBZxrk7cE=;
        b=xZbdn2brp8iJKt3mCiCe80a1m4D8Lb5T70pNABO2DKRoI+Br9p6grk2AdI3QUBUGH2
         YOog8mw90sa9mYVJz75XfhY1Bn7/c/jcWPSOnjvpPnQCq7kS9AX/1MXQPj7Gw4SPyiVj
         CXbQH6EYHJgGD0Eg5/Nmur2erzRkJ2CFwM/rughEpsc8ouzngFNj1DnT1RNvlhge5T/J
         wkouoURDrYk0U8YQQeV0j+sAUu7Ex8vHgbvi7ACtNnRFD02UhFkA6DzAqcLcJzF04gvT
         XYAI7CC1JQyTGFYwVtJsBX6cu91CrzeMPBVHEHVyDYMqAOxfkXVCBI4e9LLl1z2lHCXh
         0zcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5FMcTfB8bTNiA4IO/9hnI5vPpMpLqnjxtoFBZxrk7cE=;
        b=AEoS3nBcG17eBYdYPGo8sO+udNIbJbq+0+hB684W/TgzFbepB6Mjo8/CmxyJgJEzrN
         fQTrOf6T9x0konHaoeXfMUd30faVZKge3aedoUa37REH+p6oh+UM5iz4hFEcjSV2KMt+
         x3hCp4QGiZk83F0dmQ9t5crq7ttXF/Mu0R9/owyFf00BJ3L9Ftzirpv70LbhTnAHzelo
         lMQnlrNXaB9lYwxEZdvGi98h5R5SRCKDAt+jnxcGFIHp1+D8eQtKdN9L4j1sKYBf2OjS
         73aeaAb0nNWtxeocv64SHnOHcKWnWEFi0FCu7oOQHbMXBeyAsP0tL6nnDMWMOJGLaEd2
         nxSQ==
X-Gm-Message-State: AOAM531XWiukVSl03luMExPQZJ6Puom/gogRGz7tABjHygxXLVHVEpqv
        yPoWudIXCkPhMruEYYifCo/Ojg==
X-Google-Smtp-Source: ABdhPJz1s7iaFLlprcjzI6+V5+IneVUiLhkPjcqU9oGnTUsJuwN91xmDsjAo3grsZUsi2FAriERYNA==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr18211963wmb.155.1600462350313;
        Fri, 18 Sep 2020 13:52:30 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-14.xnet.hr. [88.207.97.14])
        by smtp.googlemail.com with ESMTPSA id z19sm6694041wmi.3.2020.09.18.13.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 13:52:29 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
        davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 0/2] net: mdio-ipq4019: add Clause 45 support
Date:   Fri, 18 Sep 2020 22:52:20 +0200
Message-Id: <20200918205222.2698102-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds support for Clause 45 to the driver.

While at it also change some defines to upper case to match rest of the driver.

Changes since v1:
* Drop clock patches, these need further investigation and
no user for non default configuration has been found

Robert Marko (2):
  net: mdio-ipq4019: change defines to upper case
  net: mdio-ipq4019: add Clause 45 support

 drivers/net/phy/mdio-ipq4019.c | 109 ++++++++++++++++++++++++++++-----
 1 file changed, 92 insertions(+), 17 deletions(-)

-- 
2.26.2

