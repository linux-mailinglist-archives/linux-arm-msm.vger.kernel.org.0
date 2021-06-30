Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6D03B8ABA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 01:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233878AbhF3XCb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 19:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232604AbhF3XCa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 19:02:30 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 058E3C0617A8
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 16:00:00 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id q18so8118556lfc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 15:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mA0O2RS+C77CPjstuqYyfYTBCR08cJ7jlzsIYzrS2WA=;
        b=k+3F3dLS6LM+zaDXVKGyCqiLEPtbj8hiwqQR3AcS0AHnjW4JzhtD8xW4GIxKdCuYfQ
         MSShft0IgI841LbfkoWdbEnCtgmwqFp8I0+ldbCdKo0RfjHhsLhxfCe/NgVz4sWhBV4h
         y4Hgogb5XmNEm238XZg4eqno3f7TD3iRalcgnERCPE4hV3lCuoihSB9Kjxhd+lbS9ft/
         rZRCq2mJeuCO7UHTfcETaCOXc7rUQfoxPL4B+Cykbc1lmId/eGYNhecbNmwYfif/tA1f
         YuL+IlV+6ZGeXmIa9goOGOqedoSCOlIrf964ytJlTZ3B83RX/jhGn4wY6FVjBHJsFmFa
         /isg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mA0O2RS+C77CPjstuqYyfYTBCR08cJ7jlzsIYzrS2WA=;
        b=X4JCIB5vo4AHZ1UsDcOJImtL/+0g6OMTB7tpzes8TYMw+t4yU4yBgBI7t8803ffaaS
         kofC3Y9Q15STFXc1A96EZlDsBU0c6yr9QzrVX0uEPXXcl5YSRRgjOfxRtUIwHlhCtxFV
         e7AtEQciovN2qPi6H6fSQxoXNNnVU0OBCY5PkRr2jZj2jMFL2NFg2oPqKraX5dhteBMN
         2y3hxhimeyS+Cc8UPZp4QbT5gqosv9dOFxZ1GAHHmUUn8lQi6SYyDvy/N6LdU+hja7Gx
         uW2YSHz8p7zq1RuLeUn25Q9uZ68nFKUml7myLyGPBIelTmsnPW3vzGGOUETMADka5tVs
         UC4A==
X-Gm-Message-State: AOAM530XxL3AJzzPgITvzzfZWgrDT7u6kQkv31J+iWr6jFFpmYLZPKRn
        U02F5yo/YSlfP1xRiz3WzpTbK66JXLsqJw==
X-Google-Smtp-Source: ABdhPJwZhitEjLOn7dEgy9fGUNit6J+J616luVsM3y3KoE317Fl6+fySjjpDVwtIM2WoZDzz8RIYdQ==
X-Received: by 2002:a19:8c02:: with SMTP id o2mr6192594lfd.326.1625093998148;
        Wed, 30 Jun 2021 15:59:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e17sm2324444ljn.125.2021.06.30.15.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 15:59:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 0/2] clk: qcom: fix error path and cleanup in gdsc support
Date:   Thu,  1 Jul 2021 01:59:50 +0300
Message-Id: <20210630225952.3337630-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix error path in gdsc_register() and cleanup code in gdsc_unregister()
to properly unwind all genpd registration calls. Both patches bear two
fixes tags, since part of the issue was present in the very first commit
adding support for GDSCs, part of the issue was added when adding
hiearchical power domains support to GDSC code.

----------------------------------------------------------------
Dmitry Baryshkov (2):
      clk: qcom: fix error_path in gdsc_register
      clk: qcom: fix domains cleanup in gdsc_unregister

 drivers/clk/qcom/gdsc.c | 48 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 6 deletions(-)


