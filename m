Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26E2F46CACC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 03:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239178AbhLHCZp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 21:25:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233825AbhLHCZp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 21:25:45 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F339BC061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Dec 2021 18:22:13 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id k37so2589722lfv.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 18:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h0YRgXHcSWRba2Ict+O0TMvcAlWgS1miFDpuMNxYh2g=;
        b=sLjx5bs60f+vR90h8bw9ai3mkDMLur94sarzKYoin1tBq+8DE7aHKW06qOJxWEGpU6
         i1tv27Bvfc6J7h/N8QMycnJ3fcmU21wkcPHG2ixbc9V+EozLecQ4ZUoXIsgN7rYUmeMJ
         nE+/j427Njbb90iUS/A/kPb3jy9mcFQNOmpepfs9fAeHHbMuzQ60DE9WrfljF9liZ3lV
         AOz0xY1P/Hbg1N8xxZBdQ3D1yUsstypMb2K0SVB81wpOl04t4UywkBv4rQqvlM7SFJoG
         Y+Uc0KAPHf4RuNKeal2sVRD1tSWOKGg+qjL9MtYz99VRCC3z2l4CaL8J7+wCTk0woowX
         HcFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h0YRgXHcSWRba2Ict+O0TMvcAlWgS1miFDpuMNxYh2g=;
        b=PEaeDX+aawSDQIwNJRI5US3EmpQxhXHDKElpPOoB+nORlOk0oOhVZ1vNwj8dAfahKY
         vV3TW8obIVEXZDyCTwcKhLJ5/0N5DTsBWkv5L0R8T3mu3VHwS9EbkHeTfxnt8JI5RuPI
         SUC/rQulb54OKi1ATMMPd38zybrzLzV+wRnN5TZLkIwI/zXbyXWBx2tepbhj4kJ5W/nR
         W/b9xiiwUv6W8+ep5FtQERRFko0oCqEz3ZuAvja5OkKiCx8Cb7Od9gIUdv7DI4PQc40T
         YOgI2T/auhDHOiCMojKwZdha3HZWPyc0BlpcJ4X2tYBR6rYDVzilwQKTiUhA6Ic6o+4v
         DO+g==
X-Gm-Message-State: AOAM532rCIPNMe9RZEr5EEl0RBV2zdKMV+Z4cnq+TmgcwNcTXIKa51bn
        7oP4vhRGsCaVBhTV1PP7zR31AnDVhDKCFKWC
X-Google-Smtp-Source: ABdhPJwHBRaETtpHHZyTBJtL0mxv8z5vbVb8a0PxjIH72YgJ9dVEJwezOFA34zX6uRI4vNKMfT6hOA==
X-Received: by 2002:a05:6512:b14:: with SMTP id w20mr43745098lfu.164.1638930132144;
        Tue, 07 Dec 2021 18:22:12 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o22sm114111lfu.274.2021.12.07.18.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 18:22:11 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 0/2] clk: qcom: fix disp_cc_mdss_mdp_clk_src issues on sdm845
Date:   Wed,  8 Dec 2021 05:22:08 +0300
Message-Id: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is an alternative approach to the issue that Bjorn proposed in
https://lore.kernel.org/linux-arm-msm/20211203035436.3505743-1-bjorn.andersson@linaro.org/

The disp_cc_mdss_mdp_clk_src clock can become stuck during the boot
process for reasons other than just disabling the clocks in
clock_disable_unused phase. For example other drivers during the boot
procedure can toggle parent of the clock, disabling it for some reason.

So instead of enforcing clock parking during the clock_disable_unused,
park them during the driver probe. This can break the splash screen
display, however loosing the splash screen for few seconds is considered
to be lesser evil compared to possibly loosing the display at all
(because the RCG gets stuck).

----------------------------------------------------------------
Dmitry Baryshkov (2):
      clk: qcom: add API to safely park RCG2 sources
      clk: qcom: dispcc-sdm845: park disp_cc_mdss_mdp_clk_src

 drivers/clk/qcom/clk-rcg.h       |  2 ++
 drivers/clk/qcom/clk-rcg2.c      | 34 ++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/dispcc-sdm845.c |  3 +++
 3 files changed, 39 insertions(+)

