Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F0C5510C94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 01:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356041AbiDZXZ7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 19:25:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356042AbiDZXZ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 19:25:58 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4522369F4
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 16:22:48 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id v12-20020a9d7d0c000000b006054b51c3d4so14122264otn.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 16:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WYejGanUUZmJvZ2w05Ao6DgRupGl4lL6Qt7fE+MxKI4=;
        b=RKzjXG8LHJYjtLTBu1AG5FKNpKuXNbma5GQ/URC7EDsjuYp9+RMq5pKyRrnDsl8CMP
         0xW/ukNJNQ2qXAs9jAC6qDxIb/FrotGQB2Iq2tURl1JUhZpWX7jb0Vnhgja+scyPuIjd
         6QY91pslLff7CmBeWSFWHRjnwol4hRSHa8iHgQSpX/FDO6uGt+85vkXAirQ78SQkwFr3
         3By2patjIiz7mxDNQfGaxD0b2BpcCjcK2VSyQD0vqVqqLbtVDJypkTVXJonf+0bxaN9+
         yRKfbGJwuzpuOIz4Oulxwu+vpLjbznXtcXjS6drrMMNuUIhTf3X4Nmo9OT7j4+giLa1k
         OLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WYejGanUUZmJvZ2w05Ao6DgRupGl4lL6Qt7fE+MxKI4=;
        b=IlT/c0JmLjUkSYgGiEbKGNatq0qwOVmVwcK7/lRiDt5FZpHP6GnqxWB+dzSFt5SiAD
         PIT2cQSHHHBIWGi+4/6Br4LDlx/5nA/n47lGQrelhdb3G6RbDmVFj05N2+B6tgoqmPr9
         5X7o9t/u8YF5219OsUckwvqs2ZQIjw6PIHs7LIHd6r/PdjQbB7kuirmTRE+Qi3RD1CQb
         ty+N9sZmGdnAhwYLnqBBTF3G+TfLGuAUAQwE+n7tVTeZfF7PQlKXeuaE6ngTapcsAi/a
         kYU/r0GDEDHUgLejLjEwgFtqdkjDV9R2fl0eXcve44Mwd4akIm7gWSoHaPwtOASFF/At
         iZ+A==
X-Gm-Message-State: AOAM5318TbSD5jyF4UCUHag2bhoM3I/xqparH2PCsgxJWgBjGObVa/lp
        jFPhiZ3xHo3CWBUvj8EV0tjTqQ==
X-Google-Smtp-Source: ABdhPJyjewHB6NMvvEatTOA4sf1nstaF+5jYRdbM69SIxzsjWm3f3tkm4rPBv+x92t1GXyJda9pn2A==
X-Received: by 2002:a9d:731a:0:b0:605:4e21:cb15 with SMTP id e26-20020a9d731a000000b006054e21cb15mr8984101otk.225.1651015367854;
        Tue, 26 Apr 2022 16:22:47 -0700 (PDT)
Received: from ripper.. ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id n28-20020a0568080a1c00b0032578b7e377sm253000oij.26.2022.04.26.16.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 16:22:47 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] clk: qcom: Add SC8280XP global clock controller
Date:   Tue, 26 Apr 2022 16:24:42 -0700
Message-Id: <20220426232444.1761869-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
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

This adds binding and driver for the global clock controller found in the
Qualcomm SC8280XP platform.

Bjorn Andersson (2):
  dt-bindings: clock: Add Qualcomm SC8280XP GCC bindings
  clk: qcom: add sc8280xp GCC driver

 .../bindings/clock/qcom,gcc-sc8280xp.yaml     |  129 +
 drivers/clk/qcom/Kconfig                      |    9 +
 drivers/clk/qcom/Makefile                     |    1 +
 drivers/clk/qcom/gcc-sc8280xp.c               | 7488 +++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h |  496 ++
 5 files changed, 8123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
 create mode 100644 drivers/clk/qcom/gcc-sc8280xp.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sc8280xp.h

-- 
2.35.1

