Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E07EB56BB45
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 15:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238191AbiGHNyz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 09:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237944AbiGHNyy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 09:54:54 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6042A435
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 06:54:53 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id bn33so4628903ljb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 06:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oBZ6reeyKLnZu1euC93MTf6+D13zsySYlZ/57ITlSLw=;
        b=YVBYUoltBc0ykAUny/Jh48Hq+XAvPrz2KTc7ziz9OlLyJjp7QARaZROASWhZzxHBrk
         4sOQjDNYTYzxlD4fHw2qBPIwm54kh5jrQll5TyAGz0IFAcAGUIcA3Ncyrmp1ioYBmcFE
         E0g+vJGsxO1UIG/swSjWZ3DMhXwLKObUgtI0H9Cb0BTfLzBm9+fk0afVQabAEniOx7HH
         arEgE+U7XfhWHbyi182TlBzThTziXq0SgMMxKDCjhLP/1GfnDnhgt2y36I/MkP6Nqqom
         Em6IBluUT2UmQe3cP+5AjtvX+cH7T3Sq2c0k4tcDffVnV40MUqLgunZuenVuBP9oCaiR
         RfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oBZ6reeyKLnZu1euC93MTf6+D13zsySYlZ/57ITlSLw=;
        b=ya47aOwy+Q5ts/iC3fUhtmsfHGnDKXQ6qXn6RWyMZEBvatZk1FCDkdHyHFFVvNxaeU
         +tDZmk7NMjnHRgV8rR1Jj69zO3cgEHsX3sqTvk5tbyBKaoTBSOxfUWwurXSEvUBKd/ef
         hFppqoow7bF76gI6BR6UrPwCp5bbiu077ESsFHlu1hLg1EQRewOTMm4xZsJZqNbRCz+3
         na84TVpA7TJBInNq8fzs6x4M0gnz37oF9U7UjytIpyP+IR84RceGJ7ganjojK4EBSj78
         y09itAWOQILdQ2TSrcZVEAJFDIiW6b+bJqAe4B9KkIBSyhReL/vo5dWX3l0gwS5ZtJv4
         MImA==
X-Gm-Message-State: AJIora9dO9n4J4OSqBp74BO49YKnjj1q5PVDO1ZYjkdgG/ngJnQH+IiA
        2c6Nvh4jTjwvj1AciIsWhQLfiA==
X-Google-Smtp-Source: AGRyM1tRjA2agm7R/j2hqY/ugg7NtFbwGbRKg9vte1R7g02DanxIiuE1HpTeHHE3MtjrjBWefUzAog==
X-Received: by 2002:a05:651c:4c9:b0:25a:9d24:886 with SMTP id e9-20020a05651c04c900b0025a9d240886mr2154645lji.471.1657288492086;
        Fri, 08 Jul 2022 06:54:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y9-20020ac24e69000000b0047f647414efsm7428352lfs.190.2022.07.08.06.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 06:54:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-phy@lists.infradead.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH v3 0/3] phy: qcom-qmp-ufs: add symbol clocks support
Date:   Fri,  8 Jul 2022 16:54:47 +0300
Message-Id: <20220708135450.2845810-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register UFS symbol clocks in the Qualcomm QMP PHY driver. Some of the
platforms (msm8996, sc7280, sm8350/sm8450) expect them to be defined (to
be used as GCC clock parents).

Changes since v2:
- Added error handling to phy_symbols_clk_register() (requested by
  Johan).

Changes since v1:
- Added a macro used by clk-asm9260, so that the clk-fixed-rate changes
  do not affect the driver
- Changed registered clock names to be unique (as e.g. SC8280XP will
  have two UFS PHYs).

Dmitry Baryshkov (3):
  clk: asm9260: use new helper for fixed rate clock creation
  clk: fixed-rate: add devm_clk_hw_register_fixed_rate
  phy: qcom-qmp-ufs: provide symbol clocks

 drivers/clk/clk-asm9260.c               |  6 +--
 drivers/clk/clk-fixed-rate.c            | 28 ++++++++++--
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 59 +++++++++++++++++++++++++
 include/linux/clk-provider.h            | 41 ++++++++++++++---
 4 files changed, 119 insertions(+), 15 deletions(-)

-- 
2.35.1

