Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4E648158F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Dec 2021 18:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240940AbhL2REd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Dec 2021 12:04:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237582AbhL2REc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Dec 2021 12:04:32 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02DFC061748
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Dec 2021 09:04:31 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id j21so88452835edt.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Dec 2021 09:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ieMbS+0D70pohooVgVjI3yQAHsrI5Yv9aY0un0BvWo=;
        b=xhe6pIARJ6nLxgaxAop08bsGSZx7Kd1UHcvKv5ZPM0idYz9aF0B/bEfVlj/jBvPEtv
         EL+qyUCy17ZT5uW1wjT7/JjXHAAC22rkvHyo8Q2cuyrY5hEzFKU2LMuuPt/bEIBXMBcZ
         tsfJiiDsS97+WiMnMJrXiLSA/kDkYo4uhIiyzdEA4TAXXm+x7BPiFOBCbj5/VlAqsAvE
         2Mltoe9ZvCTgvetpz3GsLVq+0zFxvjuXZA2zLJaeFXQ4D/LPhmRyDvt4ZbQ8WqyNT3Lo
         IxkocrOxDq6U1n3AjNJu8e61H14NFTitTuJYG3isHVjxir78T+h2tld3qMIe4PnoIXv3
         MtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ieMbS+0D70pohooVgVjI3yQAHsrI5Yv9aY0un0BvWo=;
        b=qZtXN7lti49ZCkb5MK2MgBQLGinUGOuU08K9f/QLL6x6VDnUp4WPDlA7uB6E3j7M3+
         0caUbvn8LH8EASJIB0AxFaD8bq3o1NSnAjzfEfIEtbTS5XpDtulJaVLxC4QkGmqkUvYD
         /zQH21WKW/mpq2L1r8bdb4Z/jmIwYmZZK2n7pH9vElXVNTtlz0sJaL1NSVOJkqubrYbA
         QpDZn02MMUs1qf1bq2bIlMed3HjGQ1O27fkJZOyhQcbpJ0QbOy4V3Bqn0+SNJmt72qt9
         XUXX9X0soJIPpz0+0BUA6Z12T/Mq7FS3lcPvhuo4xU3G+QWkZMCRBWlGCyZo1H9Y04of
         8IQg==
X-Gm-Message-State: AOAM531ofJSDF3t+Dwhk8C3LCUlYgHVqvJ9z9iDz/UkNrjylsUc/G5me
        quG0E886zDqT0HW39UApG5ygWTXAXz0bwddN
X-Google-Smtp-Source: ABdhPJxEun8C2Rz5QYSsXiRo78geOqzPnu/l72Y9HBWwUVyyAPVjgqYpYhJYTw9hG0hiFAmsYo+q8Q==
X-Received: by 2002:aa7:c5ca:: with SMTP id h10mr25978582eds.401.1640797469905;
        Wed, 29 Dec 2021 09:04:29 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id w11sm8546153edv.65.2021.12.29.09.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 09:04:29 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Kiran Gunda <kgunda@codeaurora.org>,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH 0/4] Enable display backlight on Fairphone 4
Date:   Wed, 29 Dec 2021 18:03:54 +0100
Message-Id: <20211229170358.2457006-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add and enable PM6150L wled which is used for controlling the display
backlight on Fairphone 4.

This series depends on the recent wled series by Marijn Suijten,
currently applied in the for-backlight-next branch of
kernel/git/lee/backlight.git (or linux-next).

Luca Weiss (4):
  dt-bindings: backlight: qcom-wled: Add PM6150L compatible
  backlight: qcom-wled: Add PM6150L compatible
  arm64: dts: qcom: pm6150l: Add wled node
  arm64: dts: qcom: sm7225-fairphone-fp4: Configure WLED

 .../devicetree/bindings/leds/backlight/qcom-wled.yaml  |  1 +
 arch/arm64/boot/dts/qcom/pm6150l.dtsi                  | 10 ++++++++++
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts      |  9 +++++++++
 drivers/video/backlight/qcom-wled.c                    |  1 +
 4 files changed, 21 insertions(+)

-- 
2.34.1

