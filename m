Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC16C115E9B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2019 21:36:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbfLGUgb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 7 Dec 2019 15:36:31 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45061 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbfLGUgb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 7 Dec 2019 15:36:31 -0500
Received: by mail-pg1-f193.google.com with SMTP id b9so4673252pgk.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Dec 2019 12:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4pU0TgCEVu3iILUXjS64n8D0+VYiF/iGQ/CEZMcyyRk=;
        b=vINxdpICYteO6gJRGK9ywPvLKgr/9A0DCY7QWTX859IXm3YJ+TN4esbzO3tuv7YCS9
         G6Rsl8hL06+MiFFFYuMe+02yjgJJWIdp541Jpkr2rSg8/0JnbyYH48EKE9l+Ogft/jWJ
         cnPo/mk+bg82Q32iz5cCwIN2CVkvg1fOVfxakwgLFFsQUQqeWSRbZVoXFpm3HR5FKeaG
         ulLl0iMW1hZrzIzdb27BUqmGh4OJ5ZRVObBBqQ9rTq+MYnC4ycnoJGApHS0ApBk+qfdr
         dqJjjvS+TV0Q2nsQ0PyXiU0WFQUAGc9gWT2blEQsXucKCGZtpBLcRyjkY/igtSZ22CbX
         LJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4pU0TgCEVu3iILUXjS64n8D0+VYiF/iGQ/CEZMcyyRk=;
        b=NGslatqrkasHKrbKwmUtmdK32jZe7rtcq6jBs5B4BiQmwjg9k7OVz0h48pjrYrP0VP
         4jvJ71OjSl0ETJYdcPZtPYJ22yuuMMYw6tkE6qHSy/0rCG4avHyIPJiDeomAxwUG2+sO
         g39LfN/ZcSzLasnj2S3bvnfYKPJWi/XwwQNdmrNrcwZyWsWYA5hFLU4IStdU0ir9WxDC
         cxZFveRstE6/qkzGNXo5p+I8fBgRWMKCc2aEhOOg8UBOgsgfDaiTz/+lgdCYfpvsVoBZ
         T96pEFUnIdvTik7JqFQTBw1WzmWaogOVRjdDYL7mDm3JAhtBljE4WtuckjcUBqHViILu
         bfDw==
X-Gm-Message-State: APjAAAWo6NOY9eg1XHu7cmDgoAp7UbQjOMGRUDepddCKbp0phetf2L7J
        ona9g89+Iwk1X7+UcNSJkfY4gA==
X-Google-Smtp-Source: APXvYqw901GjcbHTK90oZG2kYPsObEYLR/h3mKtSJ01x0JdZ6I2G5a44GfZhkTBXFwXydT3dY6rdWw==
X-Received: by 2002:a62:6086:: with SMTP id u128mr21734365pfb.4.1575750990366;
        Sat, 07 Dec 2019 12:36:30 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d14sm22982186pfq.117.2019.12.07.12.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 12:36:29 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paolo Pisati <p.pisati@gmail.com>
Subject: [PATCH 0/2] clk: qcom: gcc-msm8996: Fix CLKREF parenting
Date:   Sat,  7 Dec 2019 12:36:01 -0800
Message-Id: <20191207203603.2314424-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We've always seen intermittent resets of msm8996 during boot, seemingly related
to PCIe somehow. The likely cause of these errors are the fact that the CLKREF
of all PHYs are parented by LN_BB, which while being on during boot is disabled
by the UFS host driver if it fails to find its PHY.

As such, depending on the timeing (and success) of the UFS initialization PCIe
might loose its clocking.

These two patches ensures that LN_BB, connected to the CXO2 pad on the SoC, is
described as parent for all the CLKREF clocks. So that they all vote for this
clock appropriately.

Bjorn Andersson (2):
  clk: qcom: gcc-msm8996: Fix parent for CLKREF clocks
  arm64: dts: qcom: msm8996: Define parent clocks for gcc

 .../devicetree/bindings/clock/qcom,gcc.yaml   |  6 ++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  3 ++
 drivers/clk/qcom/gcc-msm8996.c                | 35 +++++++++++++++----
 3 files changed, 35 insertions(+), 9 deletions(-)

-- 
2.24.0

