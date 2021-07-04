Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD6703BABD6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jul 2021 09:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbhGDHnq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 03:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbhGDHnp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 03:43:45 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331EFC061762
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 00:41:10 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id e20so15002335pgg.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 00:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=KaN3RE0+9NsNDRthBW+pFqdpkAjR9drVErioQrFNtSI=;
        b=P2rxe9qCfQwQ254RIgo1HLaGo2dMUvV5ZPc0lMo95rCWioDnPyQv4r6xdSf2ii3kSr
         /EgFNTEsPgZaCinSa368b9iYqb6Wh+mw3MkDGWxkZaIvG2gsQuxOegqDnP5M4cPvKGpF
         96J9rYMokNVeavYNe80+rUFF8Q2JEiszXIGU3XSFzPwVNfr/2KefJqbEvz94ffwFjZkF
         PPzrq6Y2+yMLlr+29+SZKwdcNX/XDrw3np7vy0lcjJBRkgFeg28oS9UZBdP57uiTb7Jk
         RIF0PnnENdlD0g9w7bYsAm7e3uw2m727l7yJwAhrgwJQKBQNogGWDSsFsKISLDB2e4DW
         YAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=KaN3RE0+9NsNDRthBW+pFqdpkAjR9drVErioQrFNtSI=;
        b=DMWj+LVNIk7xIujboKd7O4xgFZD8mnbkgMn0O0c0xnw2k9GHSs7vF12enImBvUf6jN
         HNF23c6/hGbYj/Sny5sX9q3VAaeOW8dZ5nCgjyjB8r5iM1WqJkAwKs4nlt2yw3IsALW9
         53Pp5afOVTq8lyuPL6+5AeS/lV04asZx/bEHOW4rNiMH+Y8rfNbaKNoX27Q8ZZ1JMMoS
         GCGbzVioCn5SMUKnJaKs5/gvAunFyCy/f0uBqeIxFiH2ewR2C62BCQ+iOmHtTf8PajJU
         xs0yAqpCW4jF7hfvqbEqdxZn6mY9RX0bBUdjNwmOh1vcynsbf+PEmr+Sm0S40+aEb39c
         IjEQ==
X-Gm-Message-State: AOAM533kD3wjl8vbzKl+6vbrLgolxcpdx21q/QNCgZ5zvcUyiRt4xN5y
        5S2P/2He78lfUzjY9QO833Ofjw==
X-Google-Smtp-Source: ABdhPJxFm52r7uA7oCYYTMgL58oAlH5DbhkXSUAMxP2ZR6ekG3pYWgFmpeaRToiK/GSZJBBYX07InA==
X-Received: by 2002:a05:6a00:216c:b029:30c:5b4b:ee46 with SMTP id r12-20020a056a00216cb029030c5b4bee46mr8416365pff.81.1625384469533;
        Sun, 04 Jul 2021 00:41:09 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id gz24sm7052956pjb.0.2021.07.04.00.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 00:41:09 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 0/3] Add 'qcom,mode-in-imem' support in PON driver
Date:   Sun,  4 Jul 2021 15:40:42 +0800
Message-Id: <20210704074045.21643-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's not always the case that reboot mode value gets stored in PON
register.  For example, Sony Xperia M4 Aqua phone (MSM8939) uses a
different set of mode values and stores them in IMEM.  Add property
'qcom,mode-in-imem' to distinguish this mechanism from the existing
one.

Shawn Guo (3):
  dt-bindings: power: reset: Convert qcom,pon to DT schema
  dt-bindings: qcom,pon: Add 'qcom,mode-in-imem' support
  power: reset: qcom-pon: Add support for 'qcom,mode-in-imem'

 .../bindings/power/reset/qcom,pon.txt         | 49 -------------
 .../bindings/power/reset/qcom,pon.yaml        | 68 +++++++++++++++++++
 drivers/power/reset/qcom-pon.c                | 25 ++++++-
 3 files changed, 92 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/reset/qcom,pon.txt
 create mode 100644 Documentation/devicetree/bindings/power/reset/qcom,pon.yaml

-- 
2.17.1

