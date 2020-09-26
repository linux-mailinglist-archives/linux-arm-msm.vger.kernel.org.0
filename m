Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74A9427992F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 14:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727303AbgIZM4J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 08:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgIZM4J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 08:56:09 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0AACC0613CE;
        Sat, 26 Sep 2020 05:56:08 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id e2so2114687wme.1;
        Sat, 26 Sep 2020 05:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wR/SWto3yVcOmz57h5YN6bDYDkl2xYca/i/5K7CwmVU=;
        b=u0yJe5nawQdnyR3uVIJAQR6FKQlcc453XhrQDpb80anVRuwTCdfz69xsUvkwUoW85H
         hjsBwBLFQk4/pra9Jy1SbWsQxXYCtGJR5BX5hOmUv5z4KC+AKmadgWb8LyTP8UrD43cb
         iWOcCmAfgex78fi5xmWpEr3EmzH6hkbgzwnyz8ay3pLDQMLOC+fBIpq1Lyp3DgqTeOPK
         Vr1AE6rVmHkDruULdbbgg7ilWzgJfmcxOWPAot2P4ALdUtroIy16twy0+zx371cS60+4
         HzqZeRJpviLZWHgmfZKJbIahFR0KDop5RXEtqiKqXkzJhqt6A6t4i+0fkNlq+Q5H5PNT
         rUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wR/SWto3yVcOmz57h5YN6bDYDkl2xYca/i/5K7CwmVU=;
        b=E1+JXI7TumRRdon0EWraqb1BEYvacdpbA8I5JYTeP4SIKvwSA6JLesJwp3Ox0Zf0Tf
         jRdnd/wZ9PQtpLElgcQRymKvyOVapfz0HHz+t7inRit51GeRN6WcMQFqljL/tqwt7SpP
         TaBhq/c9J89LG4p1XPbo+WlNGcmAI0Ia2LMVBab4Kp1hSW+nt/qFs2CBZDG1oTd6Wr4v
         UGUNSgrFaS1qJD7qEWM5VYFbOIcP7W2FlrQreAURgWuLNdT891RXJIS29TjQIGbE48P/
         Xw/nxs9LhCn7zTRyNc3O3RI3wmallLkY/4ujE79w1jfBAFAozCAV/HE7jwupDLPiY80N
         IgUg==
X-Gm-Message-State: AOAM532UkoHWKN4g36z+K2AQ1u4aV1euge4Gwvy+wxGbIsh0pbqO7NVM
        fX7/3+iRHe/IXW0g5h87d/U=
X-Google-Smtp-Source: ABdhPJxZcroFu9TKPxARx+BGKjJ/3dwLXkeNrpYw5S6HkBTwrdebunFRGQdadUkCtpGRW6EAayDbUw==
X-Received: by 2002:a1c:a5c8:: with SMTP id o191mr2592109wme.127.1601124967316;
        Sat, 26 Sep 2020 05:56:07 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id h1sm6503024wrx.33.2020.09.26.05.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:56:06 -0700 (PDT)
From:   kholk11@gmail.com
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, kholk11@gmail.com, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Support for PM660/PM660L SPMI and SMD regulators
Date:   Sat, 26 Sep 2020 14:55:42 +0200
Message-Id: <20200926125549.13191-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This patch series enables support for the regulators as found in
the PM660 and PM660L PMICs.
While at it, and to make them work, along with other regulators
for other qcom PMICs, enlarge the maximum property name length in
the regulator core, so that we're able to correctly parse the
supply parents, which have got very long names (details in patch 1/5).

This patch series has been tested against the following devices:
 - Sony Xperia XA2 Ultra (SDM630 Nile Discovery)
 - Sony Xperia 10        (SDM630 Ganges Kirin)
 - Sony Xperia 10 Plus   (SDM636 Ganges Mermaid)

AngeloGioacchino Del Regno (7):
  regulator: core: Enlarge max OF property name length to 64 chars
  regulator: qcom_spmi: Add support for new regulator types
  regulator: qcom_spmi: Add PM660/PM660L regulators
  regulator: dt-bindings: Document the PM660/660L SPMI PMIC entries
  regulator: qcom_smd: Add PM660/PM660L regulator support
  mfd: qcom-spmi-pmic: Add support for PM660/PM660L
  regulator: dt-bindings: Document the PM660/PM660L PMICs entries

 .../regulator/qcom,smd-rpm-regulator.yaml     |   7 ++
 .../regulator/qcom,spmi-regulator.txt         |  31 +++++
 drivers/mfd/qcom-spmi-pmic.c                  |   4 +
 drivers/regulator/core.c                      |   4 +-
 drivers/regulator/qcom_smd-regulator.c        | 113 ++++++++++++++++++
 drivers/regulator/qcom_spmi-regulator.c       | 107 +++++++++++++++++
 include/linux/soc/qcom/smd-rpm.h              |   4 +
 7 files changed, 268 insertions(+), 2 deletions(-)

-- 
2.28.0

