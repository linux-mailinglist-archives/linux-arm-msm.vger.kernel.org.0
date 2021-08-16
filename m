Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 559F83EDEE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Aug 2021 23:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231726AbhHPVAt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 17:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231698AbhHPVAs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 17:00:48 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA8EC061764
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 14:00:16 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id f16-20020a056830205000b00519b99d3dcbso1537341otp.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 14:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u5UDbARCogMc3tk8X3SMDF68KW4wo6rxwxOPLfLDf0w=;
        b=alwKgKEVSmhx7VhAtCo6RC7luejxVz6EcoXZDb87WtX/dskllvt/aaVKwWLrXP78Ik
         rCrR+b1TkUREtNRoOl43x0dfUJkAN7BIG8u2QPl4I3f2Ki/Y6TBMATZ8rLp0HAirnxwj
         ePJtG1moMayyEN1BipWQcSlKiKyd6FryEmoxKWClsqA5VckEqrUYBC2Jz94l449g/914
         8Sv6M7xJ75l9IZkojPWfEuA88ad6ayVX0ISCCQp3VH5IPwBaWjuyA0DzNpB3zN0npCoM
         z9p6RmvRPAc0OVkriCTy2KTF7gUgVa3oQ3Sk3P5YP4I7nO5DjG+fuRpGX5cq9KFMq5mj
         QA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u5UDbARCogMc3tk8X3SMDF68KW4wo6rxwxOPLfLDf0w=;
        b=bjl3SvuVNjMdQXchscu0MGklSag2iCzj09KB4vPnfx020FlXdCaIT/4ArUrimpN3Yl
         SO7B6XtlxYuAsCsT2VltbJsqIHuOifIE6Ro45c0yu6eTbrXCyodvr1uv+zxqiZnMM+SS
         yn/mcqEtdMkx8b8/3KJd7ba6lmuPCqmthnXSkxMtKzyBygBMb9QopZrjEFDHcXvyZly2
         IojMo+vyFHLdBcqZ1ZoJbaHXjJrO3VRJJYRWzJiGK+piZpmv8u59Uzds+kg31XCprTAl
         46eHPP6UN4rNAEUwEN8JCdZB3jiEAIP4w3yD3elhyEVtNDPpz9tTbh9D8SMNfc2i/FGp
         EO7Q==
X-Gm-Message-State: AOAM532vBNhfgetCPEaxc2WN2vNn5P9uOJLgq6nXEtPmiRSCx9iopU/g
        Uo3gCEo1GgZ6NtTbYw2WrRBU/KKujSZcNQ==
X-Google-Smtp-Source: ABdhPJwTHQKU7QIjZBBDi7fDrFKPBlbD2lE2h7dQyUE+Vhbo6ljOH7uWpaKol+rYbaSvqCqbqIi5hA==
X-Received: by 2002:a9d:1441:: with SMTP id h59mr72685oth.15.1629147615944;
        Mon, 16 Aug 2021 14:00:15 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t1sm88145otp.9.2021.08.16.14.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 14:00:15 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v5.15
Date:   Mon, 16 Aug 2021 16:00:14 -0500
Message-Id: <20210816210014.577699-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.15

for you to fetch changes up to 20d7a9fb00ebc53e73d49df0048afb02ef92a635:

  arm64: defconfig: Enable Qualcomm MSM8996 CPU clock driver (2021-08-04 15:02:54 -0500)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v5.15

This enabled the MSM8996 CPU clock driver, enabling CPUfreq on the
platform.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: defconfig: Enable Qualcomm MSM8996 CPU clock driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
