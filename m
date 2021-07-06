Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 482383BDF90
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 01:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbhGFXH4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 19:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbhGFXHz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 19:07:55 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77403C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 16:05:15 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id j39-20020a05600c1c27b029020028e48b8fso2907504wms.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 16:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aZ0FQWFZAWKS6n30bsCIteW1nd9Jxli6BdvQV5WN+qE=;
        b=RPZPFya8gNWecWQegdxw+wHvN2leMUJhk35oy7xhhqLj6OV7IfgyiVjg34tVYIAi37
         Z4WjMGNKjCrjm8mCAcipIOGeRI5DxYA8C7IyzLOhQaPTbMZLfNO7ApsnCgHdskIs/S4u
         T5eN1r9wE4gjRWhoNt4V/sGW2iUIbWFjZKOqsPNJL1hwr9zB0zrg6eo10TWNRcgka2Zv
         XfHhD+4ZH2DjplNDEN0JZIUPvDUz4ioEb3N0EDbjsNFIFVZUnyT65OotEo8PvNSeBY50
         NDE/Z3KmwHh6y6ggwoBPPvy2lxkQoQE1tqpiZafGRBQvnSYu2kpYAdMuxhlBZRO0EYZf
         PlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aZ0FQWFZAWKS6n30bsCIteW1nd9Jxli6BdvQV5WN+qE=;
        b=ejWCWX/ViytKvpqxes4KP7+Wkj9iqaQwQ7qPi+lPPk95WCP99TJ+yKbf/yLwkYt4GU
         ikZtbCPZY8vZDIILDbnSkFtJmEvifVKobLl+KqdmklPG67AmRqscDyUbeascK/FMZhEE
         0TFyGkKmTGxxlXtu2gR1404Q+5j55UaBTXeM7hmcYwSat7THTERB/v8ikT/gBQKVRno2
         CURhmWZUwxqWTfPiRWRrjBXYSPAkJ3oreYag6/M0omTU4oIi/11phqfmzVJUSl/tlt0T
         A/w8mUd1xO7M7sIA991lMNCCBuw8bAJ83O/L+FQyKzzHkfjs83hAEXfiLvQwIEu4a4bN
         oOww==
X-Gm-Message-State: AOAM533lBCZOLvC2TadJtePuKmiP2RqbXV+rFTmvuoCX3X77FSDBKvJE
        qPkIrbATajx7LpPitDk20Xe5QeKohM1YUg==
X-Google-Smtp-Source: ABdhPJyfyy59pl5cDfNN9DbmWJdQQ+QCru+tbYvErRUS1FVN7fuFKhY+1CzL1NGKLHlxSY6Cif4TYQ==
X-Received: by 2002:a7b:cd8d:: with SMTP id y13mr3235017wmj.131.1625612713036;
        Tue, 06 Jul 2021 16:05:13 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g15sm14241866wmh.16.2021.07.06.16.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 16:05:12 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     vkoul@kernel.org, kishon@ti.com, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc:     robh+dt@kernel.org, jonathan@marek.ca, bryan.odonoghue@linaro.org
Subject: [PATCH 0/2] pm8150b qmp phy type-c orientation fixes
Date:   Wed,  7 Jul 2021 00:07:00 +0100
Message-Id: <20210706230702.299047-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series is a component of a series which enables full Type-C port
manager support on pm8150b hardware as found on sm8150 and sm8250.

https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=usb-next-5.13.rcx-rb5-tcpm-v2

When we change the orientation of the Type-C cable, we must also change the
lane allocation in the qmp phy to match the reported orientation.

The first patch is a simple typo fix in the original upstream commit.

The second patch implements a reasonably complex dance to reset the qmp phy
for the orientation switch. This necessitates registering for the Type-C
switch, resetting the PHY and then bringing the PHY back up with the correct
orientation.

The second patch is based on Wesley's original submission, reworked by
Dmitry and with a few fixes applied by me.

Dmitry Baryshkov (2):
  arm64: dts: qcom: sm8250: fix usb2 qmp phy node
  phy: qcom-qmp: Register as a typec switch for orientation detection

 arch/arm64/boot/dts/qcom/sm8250.dtsi |   2 +-
 drivers/phy/qualcomm/Kconfig         |   8 ++
 drivers/phy/qualcomm/phy-qcom-qmp.c  | 107 ++++++++++++++++++++++-----
 3 files changed, 96 insertions(+), 21 deletions(-)

-- 
2.30.1

