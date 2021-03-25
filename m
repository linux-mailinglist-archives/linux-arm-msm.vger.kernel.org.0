Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5135C348E9B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 12:12:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbhCYLLx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 07:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbhCYLLt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 07:11:49 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A177FC06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:48 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id b14so1901908lfv.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c8O6C32PD89GprqMJQwno+b7WTQDEMP/jCvNqkvFxTo=;
        b=XZp7ODJ+ge2AWn2kwo/L4yef2TRzqZAwi3Opw4N3umbak03mdAQZIl+1b6pkdgKW+1
         HOJr5+XJm6BRDL74w0+bEGVW+QpE7bRw/AZk+P61eHx/itc3LsCRipBotyhqD5GNBJU6
         u7kfzyAyH05jQ18f8gHQq1VGOMzGTb6yiTBEiQVo7J6+bG1n8W1sbTOCXNFe/lIlmBBk
         01RIg9oNQ8lZ79ugsH6Bs2tFLJZnUn3mxbCyb/pab1pqHHMoGMGE/0ryxcjmcFEFUcAu
         jWMyWDsY1OR115C3auexyKUDZY0tiXFusCZaI3mG1d/uoQcMWZZidAUzDcUEB42yUNiy
         Jedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c8O6C32PD89GprqMJQwno+b7WTQDEMP/jCvNqkvFxTo=;
        b=bu9ONsTicxaZPmlICNq8YOQcPaav1qqEbqi6MK3DvcAvx3+X2g0lsrMxQKRy2qlthX
         w13s6rUHrnFTIN5kgf2Hrvdvsj3Qi9B+JHUmHsnHxYjOg2h0rFkahyTVGKqLE8UwIPmT
         m3JC0OaS+Pu5gPQj8oS1kTstlMLHeFPkKf9inh36jFUGbqSfQ4ZZ8ifJdUHd62mPF6pc
         UO05PyUjN+8iboLkf0Ec/cTmaqsOItlbs11wLZg7/b/75xWphlv9ZfeyJsQpaO9wSDjs
         xW67hmqvdzXpt1rE5QXEDxK9vPVH7iNDV1kvhd0LjO1cBN1NaqYPh3mz4jv76yj3CPie
         zcRg==
X-Gm-Message-State: AOAM530yZXdOIRYoNxzhXLZpPoOf2P2VPL1jolgdU/x5Qu700EsLF/Z5
        oVsVx9bsIQHWKjtkZ75qKqSrWQ==
X-Google-Smtp-Source: ABdhPJzuXC5gF1ErYjkwFS3UgknsyVU+sTmL2wjKfzFkkV6BQ+SeE11G3RIhgdU1F5jVCqB1DnNsDg==
X-Received: by 2002:ac2:5091:: with SMTP id f17mr4750634lfm.660.1616670707010;
        Thu, 25 Mar 2021 04:11:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 00/15] clk: qcom: cleanup sm8250/sdm845/sc7180 clock drivers
Date:   Thu, 25 Mar 2021 14:11:29 +0300
Message-Id: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Cleanup several Qualcomm clock drivers by removing unused entries from
parents map, removing test clock, etc.

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git qcom-clk-cleanup

for you to fetch changes up to 4b3bb3df68f187dcda8ab229f9ffd793395452c5:

  clk: qcom: videocc-sdm845: get rid of the test clock (2021-03-25 14:06:52 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (15):
      clk: qcom: dispcc-sc7180: drop unused enum entries
      clk: qcom: dispcc-sm8250: drop unused enum entries
      clk: qcom: gcc-sm8250: drop unused enum entries
      clk: qcom: gpucc-sm8150: drop unused enum entries
      clk: qcom: gpucc-sm8250: drop unused enum entries
      clk: qcom: videocc-sc7180: drop unused enum entries
      clk: qcom: videocc-sm8150: drop unused enum entries
      clk: qcom: videocc-sm8250: drop unused enum entries
      clk: qcom: dispcc-sdm845: convert to parent data
      clk: qcom: gpucc-sdm845: convert to parent data
      clk: qcom: gpucc-sdm845: get rid of the test clock
      clk: qcom: dispcc-sdm845: get rid of the test clock
      clk: qcom: videocc-sdm845: remove unsupported clock sources
      clk: qcom: videocc-sdm845: convert to parent data
      clk: qcom: videocc-sdm845: get rid of the test clock

 drivers/clk/qcom/dispcc-sc7180.c  |   2 -
 drivers/clk/qcom/dispcc-sdm845.c  | 217 ++++++++++++++++++--------------------
 drivers/clk/qcom/dispcc-sm8250.c  |   8 --
 drivers/clk/qcom/gcc-sm8250.c     |   1 -
 drivers/clk/qcom/gpucc-sdm845.c   |  43 ++++----
 drivers/clk/qcom/gpucc-sm8150.c   |   1 -
 drivers/clk/qcom/gpucc-sm8250.c   |   1 -
 drivers/clk/qcom/videocc-sc7180.c |   2 -
 drivers/clk/qcom/videocc-sdm845.c |  49 ++++-----
 drivers/clk/qcom/videocc-sm8150.c |   2 -
 drivers/clk/qcom/videocc-sm8250.c |   2 -
 11 files changed, 146 insertions(+), 182 deletions(-)


