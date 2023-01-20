Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93859674D0E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 07:14:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjATGOZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 01:14:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjATGOX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 01:14:23 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22AD87CCC7
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 22:14:21 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id qx13so11317552ejb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 22:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ESKvgTayz6dgs1jEkiJ0s0q3qentgpGHI5ZQhX/NmjA=;
        b=TJa7INX5SIEEJ5tLUWOSwnCGr5rIVy/4ytwSVg0fchj+dBK1SVVf7nplhJ7jtvPp9Q
         FJIhMAbU29nA/cnmFMdIT5pNg/JXsahcmbFmrFgplPZJYjg7uNbRmJ/uwzrQFCwwSWcg
         Trk5lG7LsNr5p3veXMhP+tojOeyVq0SQSW6EzY8+H8adO1nr9SqR1lbhcpNavVgdXntH
         JTzw0tFHMP5/0k6MFO71KnUXf4I5i+KdwJ3jM9DDnPRs3YJvOgeScMTRSGvSAvLIakmp
         dbwNGm3RM06Gx8cidMrqa3oj5ijLagsP7nkj7PNdzj2Q9xJQZkLcz64LtDNq5UnyFoA1
         6kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESKvgTayz6dgs1jEkiJ0s0q3qentgpGHI5ZQhX/NmjA=;
        b=INieC8aEwi9DJvdgyarYQMTNziCV4XlxxZ5A0Ft7WOSh22cOchmYbtuhVwrIiLOSJ+
         m9AiFuwJH/VriR0AjeZvcM55vz+pBg0FDuwUn6WBt6qGsV//wWZX6qhCL/FBkIlGlVuU
         qYLtkCgWi5pBSFdvB7cOv+bU9rEYTW+wrn4dWNv0Cvo7suaFa325fez/FprFKkpQ4YX8
         l/5zASFi7FmgS8MzyyItVL1HgEzSGP7h0VtvZP1mvTntP9Naf3XjTB0N9el+usg+V8M8
         GjuRVAnA6Txy4biC7iW62wcBMF5MpV/YmYLHmEeKYo40qnRCxfxDni/F7zGKyf64iJUN
         Xtmw==
X-Gm-Message-State: AFqh2kq8SIEk3LUD6QxV+ORhiK06KSyWBnqgKVYnqgKOQjctScfA8QG5
        RIstbRQcW7WWY5ilo/DTa/NDkA==
X-Google-Smtp-Source: AMrXdXtBj/aX76zNo4ihfmLZudtl2bveeHq7IeIvpCqOyiKM2JblbzfZlvGt5eNPV9lBbsFkIDwZCQ==
X-Received: by 2002:a17:906:3396:b0:871:ac32:88a6 with SMTP id v22-20020a170906339600b00871ac3288a6mr13729121eja.39.1674195259695;
        Thu, 19 Jan 2023 22:14:19 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id hp24-20020a1709073e1800b008720c458bd4sm5813358ejc.3.2023.01.19.22.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 22:14:19 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 0/8] clk: qcom: msm8996: add support for the CBF clock
Date:   Fri, 20 Jan 2023 08:14:09 +0200
Message-Id: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On MSM8996 two CPU clusters are interconnected using the Core Bus
Fabric (CBF). In order for the CPU clusters to function properly, it
should be clocked following the core's frequencies to provide adequate
bandwidth. On the other hand the CBF's clock rate can be used by other
drivers (e.g. by the pending SPDM driver to provide input on the CPU
performance).

Thus register CBF as a clock (required for CPU to boot) and add a tiny
interconnect layer on top of it to let cpufreq/opp scale the CBF clock.

Dependencies: [1]

[1] https://lore.kernel.org/linux-arm-msm/20230111191453.2509468-1-dmitry.baryshkov@linaro.org/

Changes since v2:
- Added interconnect-related bindings
- Switched CPU and CBF clocks to RPM_SMD_XO_A_CLK_SRC

Changes since v1:
- Relicensed schema to GPL-2.0 + BSD-2-Clause (Krzysztof)
- Changed clock driver to use parent_hws (Konrad)
- Fixed indentation in CBF clock driver (Konrad)
- Changed MODULE_LICENSE of CBF clock driver to GPL from GPL-v2
- Switched CBF to use RPM_SMD_XO_CLK_SRC as one of the parents
- Enabled RPM_SMD_XO_CLK_SRC on msm8996 platform and switch to it from
  RPM_SMD_BB_CLK1 clock

Dmitry Baryshkov (8):
  dt-bindings: clock: qcom,msm8996-cbf: Describe the MSM8996 CBF clock
    controller
  dt-bindints: interconnect/msm8996-cbf: add defines to be used by CBF
  clk: qcom: add msm8996 Core Bus Framework (CBF) support
  clk: qcom: cbf-msm8996: scale CBF clock according to the CPUfreq
  clk: qcom: smd-rpm: provide RPM_SMD_XO_CLK_SRC on MSM8996 platform
  arm64: qcom: dts: msm8996 switch from RPM_SMD_BB_CLK1 to
    RPM_SMD_XO_CLK_SRC
  arm64: dts: qcom: msm8996: add CBF device entry
  arm64: dts: qcom: msm8996: scale CBF clock according to the CPUfreq

 .../bindings/clock/qcom,msm8996-cbf.yaml      |  53 ++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  72 ++-
 drivers/clk/qcom/Makefile                     |   2 +-
 drivers/clk/qcom/clk-cbf-8996.c               | 458 ++++++++++++++++++
 drivers/clk/qcom/clk-smd-rpm.c                |   2 +
 .../interconnect/qcom,msm8996-cbf.h           |  12 +
 6 files changed, 591 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
 create mode 100644 drivers/clk/qcom/clk-cbf-8996.c
 create mode 100644 include/dt-bindings/interconnect/qcom,msm8996-cbf.h

-- 
2.39.0

