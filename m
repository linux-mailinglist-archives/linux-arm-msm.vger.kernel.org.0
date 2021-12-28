Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45221480605
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Dec 2021 05:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhL1EyU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Dec 2021 23:54:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbhL1EyT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Dec 2021 23:54:19 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6022AC06173E
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:19 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id p7so28075643ljj.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Dec 2021 20:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bgZ26gLpYZWia5Mp27KMiIW9vPXm31xwsjzXxL0DvrY=;
        b=ZsuYSlp4hhq7OKMsmg4c3chQLB5QMPCCGWZ8frDNwv5gAAKHpoxCqFDVdKuV1wMK+0
         tRtOPSk+5zwliO7s/urc73AOKsGYqfNkaZoiYn1TwubRIJdsSpZoV35HmWptBFcOi85U
         0QVrZ+ePdbTF9IFnyo2enjUevgnHPMf+1pPciVPleEcRWosIfyGXg2bSI55XPrqh3Hys
         ZTZtmzO67hVK1+y2i/h4jt/78AKW0Vq3xzO4sZv6oSPXz8byv0Zuk/gbGzjOwmoEvZJA
         FmHN106CXUA5YpUY5sSjfzxqhBdP0AaoBU20sdViS3NGHAmCIFDsSZ1ok96/3CFzwFdy
         zIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bgZ26gLpYZWia5Mp27KMiIW9vPXm31xwsjzXxL0DvrY=;
        b=im3WXui/WPBlxPKbgT/I/xmDYZCK0pnvGzz/E5t1b0dfkQvqxvp4WNUIf7aEo5IO+b
         4yrdvKxsEIUDY4vCN0lPwZMCYiiIxlT8KD2S6u3AqS5+ubIyimyM/WtZO1Q/Tx1yZKTH
         Cd5yrmgw+CYrHhAYEmmxieUSiy19HThz9AtXJKbx+S+1NSaVYXs7DM4Vo9yrBHdWtH+e
         zaUWS7Yy1fT89/Xu4pIgf46yE34HyQKsJKPEtyKDTeWcMqI6hITQkR2Kt54zCFunhNEw
         bqaARl2PruK8SZqMYCRB3pY90vSPpRyX5sxgMTMq+/EOdWBmmghKyctZBbRPpqNdFUS+
         Vjag==
X-Gm-Message-State: AOAM530lM2a9tsOuIp0l/QqRoh6pio6dl343D69hchtyk1/om5GKItvL
        RlVEm0FyAB0DETfOU6KUKAY8Yg==
X-Google-Smtp-Source: ABdhPJwOO//FUmIo1Z2x8QYcouiFzsNwH0Tgpq14aYNgNQEe3rjBK5RFopnB9qrvCKB8tkPu6VC85w==
X-Received: by 2002:a05:651c:892:: with SMTP id d18mr16375646ljq.339.1640667257457;
        Mon, 27 Dec 2021 20:54:17 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf3sm1822685lfb.22.2021.12.27.20.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 20:54:16 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 00/16] clk: qcom: another round of clock drivers cleanup
Date:   Tue, 28 Dec 2021 07:53:59 +0300
Message-Id: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Another bunch of updates for Qualcomm clock controller driver, removing
unused enum values, test clock, using parent_data, parent_hws and
ARRAY_SIZE.

Changes since v3:
 - Converted clocks using periph_noc_clk_src as a parent to use
   parent_hws

Changes since v2:
 - fix typo in first patch
 - reorder and rework camcc-sdm845 patches, so that ARRAY_SIZE comes
   first
 - add patch converting gcc-msm8996 to use cxo/xo_board instead of still
   depending on legacy xo clock

Changes since v1:
 - convert two parent_names in gpucc-sdm660
 - split camcc-sc7180 patch into logical chunks
 - split camcc-sdm845 patch into logical chinks
 - reorder gcc-msm8996 patches to put ARRAY_SIZE in front of the rest of
   patches

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git msm-clocks-bulk-2

for you to fetch changes up to eed05fb5fd9768229a70947a907b071c8dadc9ed:

  clk: qcom: gcc-msm8996: start getting rid of xo clk (2021-12-28 07:51:15 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (16):
      clk: qcom: gpucc-sdm660: fix two clocks with parent_names
      clk: qcom: gpucc-sdm660: get rid of the test clock
      clk: qcom: gpucc-sdm660: use parent_hws instead of parent_data
      clk: qcom: camcc-sc7180: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: camcc-sc7180: get rid of the test clock
      clk: qcom: camcc-sc7180: use parent_hws instead of parent_data
      clk: qcom: camcc-sdm845: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: camcc-sdm845: get rid of the test clock
      clk: qcom: camcc-sdm845: move clock parent tables down
      clk: qcom: camcc-sdm845: convert to parent_hws/_data
      clk: qcom: videocc-sc7180: use parent_hws instead of parent_data
      clk: qcom: gcc-msm8996: use ARRAY_SIZE instead of specifying num_parents
      clk: qcom: gcc-msm8996: drop unsupported clock sources
      clk: qcom: gcc-msm8996: move clock parent tables down
      clk: qcom: gcc-msm8996: use parent_hws/_data instead of parent_names
      clk: qcom: gcc-msm8996: start getting rid of xo clk

 drivers/clk/qcom/camcc-sc7180.c   | 221 ++++-----
 drivers/clk/qcom/camcc-sdm845.c   | 323 +++++++------
 drivers/clk/qcom/gcc-msm8996.c    | 971 +++++++++++++++++++++++---------------
 drivers/clk/qcom/gpucc-sdm660.c   |  21 +-
 drivers/clk/qcom/videocc-sc7180.c |   8 +-
 5 files changed, 874 insertions(+), 670 deletions(-)

