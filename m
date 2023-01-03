Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6473365C253
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 15:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237601AbjACOzU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 09:55:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237608AbjACOzS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 09:55:18 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B33FCFF
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 06:55:17 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id x11so7709775ljh.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 06:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fkeuSTrUwMmPm8PtoG7xtSFktcIJW9+evFPZiE9ItTw=;
        b=neDEoJAHcJ8YkPt6bcDPRHGKqSBV1jiVQ2LkyJRUJu65KP68ZmhBfoSaSLvzYt6LyY
         j9t8e2ot50oA01QY1bsMfPgKltqNJnnN0U9cx08AAqUjs35WCB+Ou3lOlpkb8XvibD5k
         g7zR3xsvXSPBFYVOARVzEVms7IZSXmRMPmW2Ad6Gyj4X3GY0/PtL62WPGYfWH3vzxbLw
         bZjV0/KRbpmAXaKJZLTKfuVts6p3Lfi3w3SCYSdUolfn+So+ouqBO8L0vaDkkjooSPk6
         KIkiSG7LZEygLqZSB3otYxzvszXd1DCVurwPfIFrSokrtesEp1034V7nYkq7sZMtWWAy
         C+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkeuSTrUwMmPm8PtoG7xtSFktcIJW9+evFPZiE9ItTw=;
        b=g8jq5febcRsITrzFbfoX/tcw9HwLWRESP5IGf9fnOFcFKTAK+uAd28o8vdqiztU40/
         FsPejBapYohTnTSiCz0VTBi5k27FM+vHBQXrigcwTgiH6osyvpxORhmfowZMMt/QCJD6
         D1BF0LG+s9b8nCFqEkwAzBQua+mg7zQ09dmdVnR8m2ZUFGYwyfEzDPW5tp1sRnk2+SoB
         RFmp3M8olsf7pGcrH6oAAWE7TBSHuv3sFJNhHxexI5WbSu58IHQElEltlfmoBIgPdhcH
         Gj9SBRFyIZFVOoANZV0XuJ1WF1tGAlOrNsJuZQTDEZ2vJ0JkciczcTs04L9tL8tVTIG7
         gq8A==
X-Gm-Message-State: AFqh2koJsEQaEWV2ghON+zU7CKENgL+o3MMesdiXVjS7fQNbHT4ETqOa
        YAFSVBSFpHfpY4iBIpf8Omk/BQ==
X-Google-Smtp-Source: AMrXdXtScCdTATWkVchRPPhhH1wiOIqoz/OXzuVNUoiS+5DXnENCKTqHAequzsvKyIQ2+rYoweKJvw==
X-Received: by 2002:a2e:b895:0:b0:279:ee72:6ab1 with SMTP id r21-20020a2eb895000000b00279ee726ab1mr15112540ljp.42.1672757716266;
        Tue, 03 Jan 2023 06:55:16 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 00/21] clk: qcom: small cleanup
Date:   Tue,  3 Jan 2023 16:54:54 +0200
Message-Id: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
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

While reviewing dispcc-sm8550 I noticed that existing drivers also have
several small points for improvement.

Dmitry Baryshkov (21):
  clk: qcom: dispcc-sm8450: switch to parent_hws
  clk: qcom: dispcc-sc7180: switch to parent_hws
  clk: qcom: dispcc-sm6375: switch to parent_hws
  clk: qcom: camcc-sc7280: switch to parent_hws
  clk: qcom: camcc-sm8450: switch to parent_hws
  clk: qcom: gcc-msm8939: switch to parent_hws
  clk: qcom: gcc-msm8976: switch to parent_hws
  clk: qcom: gcc-sc7180: switch to parent_hws
  clk: qcom: gcc-sc7280: switch to parent_hws
  clk: qcom: gcc-sdx65: switch to parent_hws
  clk: qcom: gcc-sm6375: switch to parent_hws
  clk: qcom: gcc-sm8250: switch to parent_hws
  clk: qcom: gcc-sm8450: switch to parent_hws
  clk: qcom: gcc-sm8550: switch to parent_hws
  clk: qcom: gpucc-msm8998: switch to parent_hws
  clk: qcom: gpucc-sc7180: switch to parent_hws
  clk: qcom: lpasscc-sc7180: switch to parent_hws
  clk: qcom: dispcc-sm8250: switch to devm_pm_runtime_enable
  clk: qcom: dispcc-sm8450: switch to devm_pm_runtime_enable
  clk: qcom: lpasscc-sc7280: switch to devm_pm_runtime_enable
  clk: qcom: videocc-sm8250: switch to devm_pm_runtime_enable

 drivers/clk/qcom/camcc-sc7280.c       | 268 ++++++++++-----------
 drivers/clk/qcom/camcc-sm8450.c       | 324 +++++++++++++-------------
 drivers/clk/qcom/dispcc-sc7180.c      |   8 +-
 drivers/clk/qcom/dispcc-sm6375.c      |   4 +-
 drivers/clk/qcom/dispcc-sm8250.c      |   9 +-
 drivers/clk/qcom/dispcc-sm8450.c      | 221 +++++++++---------
 drivers/clk/qcom/gcc-msm8939.c        |  32 +--
 drivers/clk/qcom/gcc-msm8976.c        |  30 +--
 drivers/clk/qcom/gcc-sc7180.c         |   3 +-
 drivers/clk/qcom/gcc-sc7280.c         |  10 +-
 drivers/clk/qcom/gcc-sdx65.c          | 109 +++++----
 drivers/clk/qcom/gcc-sm6375.c         | 252 ++++++++++----------
 drivers/clk/qcom/gcc-sm8250.c         |  10 +-
 drivers/clk/qcom/gcc-sm8450.c         | 236 +++++++++----------
 drivers/clk/qcom/gcc-sm8550.c         | 252 ++++++++++----------
 drivers/clk/qcom/gpucc-msm8998.c      |   8 +-
 drivers/clk/qcom/gpucc-sc7180.c       |   4 +-
 drivers/clk/qcom/lpasscc-sc7280.c     |  10 +-
 drivers/clk/qcom/lpasscorecc-sc7180.c |  20 +-
 drivers/clk/qcom/videocc-sm8250.c     |   9 +-
 20 files changed, 896 insertions(+), 923 deletions(-)

-- 
2.39.0

