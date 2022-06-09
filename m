Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDB37544772
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jun 2022 11:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233594AbiFIJ3t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jun 2022 05:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiFIJ3t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jun 2022 05:29:49 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EDCC265F91
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jun 2022 02:29:45 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id h23so35213247ejj.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jun 2022 02:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aOr1mc2wtnN7xTcQeWM7ExQn22NUQL8aCOuv/gBNDzY=;
        b=aOAZA9mGho/tE9GqsaBwMvglSG1rbyg61yle0SdiC32XBneHHZZ8pci0HrAbVNH6fK
         tytjEgjhYW/SxHb9tZjeEYjOSi1gYN+kyFTpqgXRW6CuOzDtKd7kvD8ognsTPc9vJfEq
         zE21LFFLRjDYrUZQ9mbBZqfcH0aDjddQygb5uy6I0kLb6K53Vj1bC3Yi9DRT3gaP2YWY
         bW9QnVPd6IAabIqh4nXy/2AAkYa7nhW5Y1AdU0iscZOu1TATDN024gtLps2GAHUx/xqu
         5wP0rrnjpZCQ1x4cWSj/9MWRXYEjit7JVnTvK2+ZUZm622PgOW2mpX8gWPPzGxFhjt1e
         sb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aOr1mc2wtnN7xTcQeWM7ExQn22NUQL8aCOuv/gBNDzY=;
        b=bguORdQXAlPdeOC4cZmNOxGApUNYlTRtTWKVXBgTV7ZE6C9bqLhaRy1tVP9Mi/OIaa
         7c1sOx/f/CtzPFLn2lobl0qFzj7DjNPE1Rv5K5fT5dabv4IiIiao0lBF0dVB6lxQe4cu
         oQdSW1QCneXhga+FarQUrdEprSreVfVU7dCj3DrqBY1ZbHQGY8Ry8HQ5iHr3W6PVbMgH
         nW6BgXjzygeFRXZUoeKddnaDt7ZUxqvdmM0QmgsbWxXFSUO6zx+eFBfNuG5eodttKJk0
         gKxT39rHOhMefRAZpl4F56t1bhgc01hJcuffsd4/brTq/9g3aqvkUduEIIaj5pMkSuHE
         F9Ig==
X-Gm-Message-State: AOAM533m+1Dy0lkofbwtU/xlZeGdlmyHnpb+8NcjOYhsTf9CkaICj/ER
        42UmJskgjdxvGTYF+WcxLUauqQ==
X-Google-Smtp-Source: ABdhPJx++6dSVUgJAvdpO3XlQ9SLi8PAgRbTiOomtko4JVYSNxbY6vcKJ23xYc8vutBLjM7ot6td8w==
X-Received: by 2002:a17:906:a45a:b0:711:d546:478f with SMTP id cb26-20020a170906a45a00b00711d546478fmr16034268ejb.741.1654766983825;
        Thu, 09 Jun 2022 02:29:43 -0700 (PDT)
Received: from prec5560.. ([176.74.57.19])
        by smtp.gmail.com with ESMTPSA id l9-20020a50cbc9000000b0042ab87ea713sm8653417edi.22.2022.06.09.02.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 02:29:43 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, robert.foss@linaro.org, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v5 0/6] SM8350 Display/GPU clock enablement
Date:   Thu,  9 Jun 2022 11:29:34 +0200
Message-Id: <20220609092940.304740-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v2
 - Dropped "clk: Introduce CLK_ASSUME_ENABLED_WHEN_UNUSED"
 - Dropped "clk: qcom: sm8250-dispcc: Flag shared RCGs as assumed enable"
 - Dropped "clk: qcom: rcg2: Cache rate changes for parked RCGs"

Changes sinsce v3:
 - Dropped RBs & SoBs for bigger changes
 - Changed author to me for patches with big changes


Robert Foss (6):
  arm64: dts: qcom: sm8350: Replace integers with rpmpd defines
  clk: qcom: add support for SM8350 GPUCC
  dt-bindings: clock: Add Qcom SM8350 GPUCC bindings
  clk: qcom: add support for SM8350 DISPCC
  dt-bindings: clock: Add Qcom SM8350 DISPCC bindings
  arm64: dts: qcom: sm8350: Add DISPCC node

 .../bindings/clock/qcom,dispcc-sm8350.yaml    |  104 ++
 .../bindings/clock/qcom,dispcc-sm8x50.yaml    |    4 +-
 .../bindings/clock/qcom,gpucc-sm8350.yaml     |   72 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |   41 +-
 drivers/clk/qcom/Kconfig                      |   17 +
 drivers/clk/qcom/Makefile                     |    2 +
 drivers/clk/qcom/dispcc-sm8350.c              | 1330 +++++++++++++++++
 drivers/clk/qcom/gpucc-sm8350.c               |  637 ++++++++
 .../dt-bindings/clock/qcom,dispcc-sm8350.h    |    1 +
 include/dt-bindings/clock/qcom,gpucc-sm8350.h |   52 +
 10 files changed, 2250 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm8350.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
 create mode 100644 drivers/clk/qcom/dispcc-sm8350.c
 create mode 100644 drivers/clk/qcom/gpucc-sm8350.c
 create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sm8350.h

-- 
2.34.1

