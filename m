Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2DBC35B799
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Apr 2021 02:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235722AbhDLAKQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Apr 2021 20:10:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235095AbhDLAKQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Apr 2021 20:10:16 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BF64C061574
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Apr 2021 17:09:59 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 12so18415880lfq.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Apr 2021 17:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2oMyNmdOBQN3Shr+asOuK5lZYp7QDtf0TjwjEv7kY0I=;
        b=OmvDZii4vmb8/0sBD0CQQgLdaycbFPDwbuVJZBq8ACYRKsOn2rsvZXw7kT/7GOFCL+
         USb7IO6es5ortDKX2IC4NXxIMo55eFrPgkYsZ3s4hbXhnU05v5HFruUC2/WONkiBmgEA
         Q97ctTW6Hs6dGtJ16jGNq23ChfGFEeTdRPP3RoR9RGfzlHcYaVanPriZNJ1KaRvR92wa
         plQPmjw0wlj5ZfAonnLQqoqV+VoPgS6fayZ2epVmbaBHPwobgkMvk2TiZtgXIukKkh8P
         ktwKbB3DU1D9Y3jWVeu0bK/NlNrzIp72xDDHj6wScVkW7K/4yn0tj6kpuWhQx6b5+fMn
         7LeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2oMyNmdOBQN3Shr+asOuK5lZYp7QDtf0TjwjEv7kY0I=;
        b=jaA0mzrb/r1kp8JC/8jDTXvbyPCEDfNiPXuhBEPIUCGYTWNeJxHV5a/+iFYnzgG4Ru
         h+TKi9wMccatfJqOoc+r2ryomYUrwRoDA+QAs4mhoemRLTZPqvqMbjfgoyIhc8F06+i8
         sW0ME3ueWEtM/2s0odE1BJ+d9DAgBbckelkotmcHdIu2IKm69y0k4HDtKrV0MzEmMSGA
         db/W/4z5IgtkQu5mq5FiLfibZsce6+yNVGEENz0pf73YghXtyZd0I2vEnAJAD1rclKqy
         lgl+Joq0EGSUYNSUJiqnzZP1qNi045+CS6RhfJ4XYShA5lDztH9BWR6LcVtHu7WSHHug
         8c9w==
X-Gm-Message-State: AOAM531t3brN/kLreeCup29+k6yHoiHL0ShUIRK8IxyX6yTAnttWa5cn
        r9zTo3vO2tvH+LQsE4cTeayYCQ==
X-Google-Smtp-Source: ABdhPJw64o0fsIyMT6VMVTXR1CJsgkeTVjv86+/qNb+VMX3cHR/nBKnLZ54ICd7ERmwyotwdOcQWhw==
X-Received: by 2002:ac2:52b9:: with SMTP id r25mr17758694lfm.25.1618186197646;
        Sun, 11 Apr 2021 17:09:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s22sm2307212ljd.28.2021.04.11.17.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 17:09:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1 0/3] drm/msm/dpu: rework irq handling
Date:   Mon, 12 Apr 2021 03:09:51 +0300
Message-Id: <20210412000954.2049141-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Simplify IRQ handling. dpu_irq_map is a huge table consisting of all
possible IRQ entries (including a plenty of 'reserved' = not existing
IRQs). It is always used to lookup the interrupt index (in the table)
and then to use this index to lookup related interrupt register and
mask. For the long period of time these indices had 1:1 correspondence
to register/mask pairs. SC7280 introduced 'additional' IRQs removing
this correpondence.

Replace all IRQ lookup with stable irq indices, which correponds
directly to the register/bit pair. The dpu_irq_map table is used only
for the lookup of the irq index.

Changes since RFC:
 - rebase on top of msm/msm-next to include SC7280 changes.


