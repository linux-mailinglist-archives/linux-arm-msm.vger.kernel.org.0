Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE2111087
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2019 02:14:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbfEBAOL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 May 2019 20:14:11 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40219 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbfEBAOL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 May 2019 20:14:11 -0400
Received: by mail-pl1-f196.google.com with SMTP id b3so166771plr.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 May 2019 17:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Iu74mABmTcz9qvR1S/macY1NtZu8pvPEuuqjMwQiaE4=;
        b=FH/e3UzlQ7TB4FnQeE6cZQOpYdJsfmmYvWaIiYgK/HVPkws+au4HUZ4zfRZSUqCw8W
         iDa8MMPxVT5cZODFinL7MbXkbkFDsz2uFzH8RExkRM8fI0bSh0/RVpDfZaHSydEAWe7B
         Xkyd0lHCKdmg06QsT9m5uoiQOQ9kalFqgUhIkFfjy3VDHCBFAFmNVN6NmNWGeM5xtjWi
         fTjeRgDNSNTaZcocnfW6U2XNaWe1tpDH9hCogBGUe3b6K5dB5W8Pe29TvULxbAvAjCa7
         v7yjN8fC82oyMh1d5BRhvS3ZlYVP7M5s3ei9kr3aPOxzo+GpSqjFnyH3gOvhY8hQ/rNQ
         2A/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Iu74mABmTcz9qvR1S/macY1NtZu8pvPEuuqjMwQiaE4=;
        b=elwlOgOqnpaBi9BlCldNNaar+xaH8g7vF7Njc/SmZUMZwCgDProkmTl3pTY437h2J8
         YoTuZl6FMlqfHZl2s40zlI2W9OCndmvfkxcaMWU/vRtZVDWw3i2w2RWmosr5rGbFSflD
         gI9AH+LORPxd/fgBoUqF4GWPDMGT5DN3ZGhYsPTDpSwvO3dX7qLKLty5euqDfuMQ0qDA
         SBbwsu4mZ6Pg+qH4gFsG0sdbaFNb1tbLY851EXtCX8pxV8AxL59CaqJPpy5lmlEjdduC
         PQvkjnIzFQB07VNLU7OwKgClkyQoJe5hg8fgsjcRZ3mbAYMisOuNHo0EtX/mRmeyoan6
         FBJg==
X-Gm-Message-State: APjAAAWIX0Fy+yVf25bZ9fz6Tco7LXdAIHkp1ltZaHUbsXD2QBp9xS77
        BTkLBlVVpqX9jdL7MF/q/AioAw==
X-Google-Smtp-Source: APXvYqx9imtGsUTvT2yc4e3OReRF3d5SmwGegbm39zqB/5mcFc34Icou5TEX9bIbSs6JmXJm1dWS/g==
X-Received: by 2002:a17:902:2:: with SMTP id 2mr486749pla.61.1556756050469;
        Wed, 01 May 2019 17:14:10 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z9sm2329695pga.92.2019.05.01.17.14.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 17:14:09 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] Qualcomm PCIe2 PHY
Date:   Wed,  1 May 2019 17:14:04 -0700
Message-Id: <20190502001406.10431-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm PCIe2 PHY is based on design from Synopsys and found in
several different platforms where the QMP PHY isn't used.

Bjorn Andersson (2):
  dt-bindings: phy: Add binding for Qualcomm PCIe2 PHY
  phy: qcom: Add Qualcomm PCIe2 PHY driver

 .../bindings/phy/qcom-pcie2-phy.txt           |  42 +++
 drivers/phy/qualcomm/Kconfig                  |   8 +
 drivers/phy/qualcomm/Makefile                 |   1 +
 drivers/phy/qualcomm/phy-qcom-pcie2.c         | 331 ++++++++++++++++++
 4 files changed, 382 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt
 create mode 100644 drivers/phy/qualcomm/phy-qcom-pcie2.c

-- 
2.18.0

