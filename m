Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA9B667D940
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 00:03:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbjAZXD3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 18:03:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233205AbjAZXD2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 18:03:28 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C57D94E533
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 15:03:26 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id h184so1191005iof.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 15:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lDvjx1OAw6eQs2/sFgtQAyk0Q6Guc7Gzx5Io8f3s9oI=;
        b=lHx/lO9HI6ftgZ/rw+Z06Dt3hSVRG+R/CtayYvvCendTbJHv2BcjDkc2efh4WYv4T8
         ak5rcMF7F+iP90vUOc/umofoyKiErte6ngVbTSc8VmAXdbDlGwu5Lb4ataRpU8IkLcRn
         eRSeICbV3V+o1EStDHRUvc6JjUVG0zU6326FOTcjaDG0oXBaIFcU32RjiNUcgQfi7bfD
         x+FYNG5IdBr39hGAXKqogObuhvrPrCoLfTjJPRbqJuEkbdPuskY0hw5EkGu/N6/1mLXJ
         KbJhIzr6jNC5mr2iK4g8b8VX1dU5sRCmiVr+fRAV++Lvzy89QnWxbP/GQ2y5WGMllSf7
         4I3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDvjx1OAw6eQs2/sFgtQAyk0Q6Guc7Gzx5Io8f3s9oI=;
        b=w1aKRFkfGDxT2A6bU14T8iasFObYJpMWAGDWsC6wIZnYMdldxEOlny+DbO6ACNAkOE
         psRD/DFeJu6OPFDBwDdcw6A0F9UuL4enRk6fvoxyFcOZGSbC7C2YQJ5NNQ4MErMNMY/V
         H/8FSX7QTjtjhavXtZgS7xSy27PPxLQD44l3eSfC2rOPl9oR5wUjrTBD+GWiJEiic27J
         2RkSyz+GFMKIQ3cajPFQq8TWv7LQkV2LzM7rG5229wHXK6cBrKZ56pZScpNfo7zSbK/b
         Dib2vxzpcLgb8QB72Y+SMieAQJfQTElRFZkIjg5JuikaTvaRe5H8vtB10W4R3S4qju+z
         ZoDQ==
X-Gm-Message-State: AFqh2ko1ntnbsPMA0HW8ca5Jo6gYkPFepGg4D0tBUhyAr/5rMpobyfQb
        xq7Hc8qOCOonQzm6xjF88E4ZPw==
X-Google-Smtp-Source: AMrXdXvzqmdWnM7zCcU7G7xkVdOfFqlEHNh6UDZ5VeNfnQFBuIboNwXtKkVcvGdKTwuYmS3pvlRXEg==
X-Received: by 2002:a05:6602:1253:b0:6e3:19f:b3c3 with SMTP id o19-20020a056602125300b006e3019fb3c3mr27906330iou.0.1674774206203;
        Thu, 26 Jan 2023 15:03:26 -0800 (PST)
Received: from eriador.lumag.spb.ru ([194.204.33.9])
        by smtp.gmail.com with ESMTPSA id l4-20020a6bd104000000b006f8b7d869a0sm670924iob.1.2023.01.26.15.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 15:03:25 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/7] clk: qcom: msm8996: add APCS clock driver
Date:   Fri, 27 Jan 2023 01:03:12 +0200
Message-Id: <20230126230319.3977109-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The sys_apcs_aux clock can be used by CPU and CBF clock drivers to drive
those clocks from GPLL0 while doing initial setup. Add simple driver to
setup and export this clock.

Changes since v4:
- Expand comments in the apcs-msm8996 driver describing the delay and
  the reason for setting up the sys_apcs_aux clock as a fixed rate
  rather than a fixed factor clock.

Changes since v3:
- Split the patch 3/6 into two: first one moves existing strings, second
  one adds new compatible strings to the conditionals.

Changes since v2:
- Added the conditional clause to schema forbidding usage of clocks and
  clock-names on platforms which do not pass additional clocks to the
  APCS device node (Krzysztof)
- Added SDX55 compat string
- Moved MSM8976 compat to the list of platforms using syscon.

Changes since v1:
- Removed the clk.h header inclusion (Stephen)
- Changed the module license from GPL v2 to bare GPL.


Dmitry Baryshkov (7):
  dt-bindings: mailbox: qcom: add SDX55 compatible
  dt-bindings: mailbox: qcom: enable syscon compatible for msm8976
  dt-bindings: mailbox: qcom: correct the list of platforms using clocks
  dt-bindings: mailbox: qcom: add missing platforms to conditional
    clauses
  dt-bindings: mailbox: qcom: add #clock-cells to msm8996 example
  mailbox: qcom-apcs-ipc: enable APCS clock device for MSM8996
  clk: qcom: add the driver for the MSM8996 APCS clocks

 .../mailbox/qcom,apcs-kpss-global.yaml        | 37 ++++++--
 drivers/clk/qcom/Makefile                     |  2 +-
 drivers/clk/qcom/apcs-msm8996.c               | 88 +++++++++++++++++++
 drivers/mailbox/qcom-apcs-ipc-mailbox.c       |  2 +-
 4 files changed, 118 insertions(+), 11 deletions(-)
 create mode 100644 drivers/clk/qcom/apcs-msm8996.c

-- 
2.39.0

