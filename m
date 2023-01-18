Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28D88671E61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 14:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbjARNwE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 08:52:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230200AbjARNvi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 08:51:38 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A25B927D4C
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:22:57 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id qx13so24812846ejb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jzw4ukr4OpYZCp868fwbZF063Z7CSuuJV2nSvguVwRc=;
        b=UigsaemHm7+NALsNnmH0dn47K8qoAJHMuYBCno+n6o7IVm6YXu814vjs5YGPWAK/UI
         TTWaYcmNhzGW3RvVF5EifqtOlWHxA2IFq8AOgRvxamUi4qlQeesVJHJNRjBEOg9iWV0K
         rVne+n9FFVKSmIE/HjZWngYoXNhzlwm4I4WVjReFhpl+mlUUWCInW0xaD4o4BSaCwgAm
         fQsaudIKpHyhN4cd36xYJcg7+Gla05NM36MPGNL0mZV+Q94zGAbPzFZyErF1NAKlmr1O
         i6nPi0OEk2pWd9yJoDbm+MbOCcfim9ggWH/nQdcaWHr4TJu0TkbwQT2DA5vKasSf2I7E
         zSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzw4ukr4OpYZCp868fwbZF063Z7CSuuJV2nSvguVwRc=;
        b=wG15/n1vWaef0zYPWbPwXYRUfUkOTH6kuHHdgg9SCF69PjfT/K+6Gcpfvu0ZyVXP2n
         JRQIpcgyxDSxCSVtdBkrYoAs06WnH9HTe3XcrVSfP6jdcPJjw1292s+iHPAu+rI+5FgU
         qze/J3tM7WK/1LrzeoSen5MxxwYX+EK0EpStN1laIQEnC5bZz//iSoQIp6beORGwGKDZ
         QcuL1bVuDF6D4C5PiZriwApiU8nq4D3fQdkl2JH5xwTbHUn54H5XDee1XIznN6IjX22m
         BlJO/rYmWFM00Y4dzioh+4ekhBwFMcVXvgyTYYVXFQgwdWQ6lMuHnmXEdxJqnFI+Tmed
         9t9w==
X-Gm-Message-State: AFqh2kpYOx2rfBhwxDQy16AziaMMkm1+9MgB8owBK+3dUVQqOXrPqClS
        dwOfC8pd9h/vlzT3Qzsa7BjIgA==
X-Google-Smtp-Source: AMrXdXvuQbeFMAWRDjnh3rgFpiPyE0Ckd13Y1U0bHB0VZRz1quyBduQ1q/l9DUBUZF5NhwQhckIysA==
X-Received: by 2002:a17:906:5283:b0:84d:4be4:aa2b with SMTP id c3-20020a170906528300b0084d4be4aa2bmr20104855ejm.68.1674048176201;
        Wed, 18 Jan 2023 05:22:56 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709061da200b0083f91a32131sm14633831ejh.0.2023.01.18.05.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 05:22:55 -0800 (PST)
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
Subject: [PATCH v4 0/7] clk: qcom: msm8996: add APCS clock driver
Date:   Wed, 18 Jan 2023 15:22:47 +0200
Message-Id: <20230118132254.2356209-1-dmitry.baryshkov@linaro.org>
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

 .../mailbox/qcom,apcs-kpss-global.yaml        | 37 ++++++---
 drivers/clk/qcom/Makefile                     |  2 +-
 drivers/clk/qcom/apcs-msm8996.c               | 76 +++++++++++++++++++
 drivers/mailbox/qcom-apcs-ipc-mailbox.c       |  2 +-
 4 files changed, 106 insertions(+), 11 deletions(-)
 create mode 100644 drivers/clk/qcom/apcs-msm8996.c

-- 
2.39.0

