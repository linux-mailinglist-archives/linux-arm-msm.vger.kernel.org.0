Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A76F565F62
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 00:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbiGDWP6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 18:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbiGDWP6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 18:15:58 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2943D2BC0
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 15:15:57 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id a39so12413267ljq.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 15:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tb0cg7d562ipFX8SeGS2ifuv2oavUfFOHpaJXDXdxcg=;
        b=vjkPuicdcWHZlkTTkAHPmu196YNSDMoX5IGJNUsqa2Vp+IcCxDu0lpTKvZJLsxzUqT
         6UMt5aXb1LV7mlHvid4ktZKvYhCAlkVJZbIDiIByfaC9J838gzxrxIiiOHWDexSATXGb
         zI2r7hPPnhrmqU/7OrT2t2eZ4HNmLx8QIp52fObhQ6hZ3Y1FrT+GxBf9q+G8ivqKP5A3
         La3tAM8/ulrlB22CR/4/wdW25s4SeImd+Nn2Mm+56ImKiZrBPEP0pYyaOHx4PfwNgns3
         iQPAM49rCw8cuweVwjV0bP20z18ou27vxqhrGhDxrjqsSoKUIqjiUzDmXuDSLmtOAnCJ
         9s3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tb0cg7d562ipFX8SeGS2ifuv2oavUfFOHpaJXDXdxcg=;
        b=qbJO1VBrb5EJ0egO2QCVJn7aBctJgt0mNuSyYe/ehL++Sf6o6VhjkiIMOJS3pmttSR
         vGwxkurX1BNtx1zeYm0Q8PW9HZNVsLL88oG2mh3ZyTbwFHlyodl6SEt5oKFV1ZfsIiEj
         QPMuPPZ3bU5eV6E6NF3Vj6v0RN9nSNSSGa9p+J9r62JFLxjkv8mx9FwG5qdfeTXexJ9g
         FV0VwkIymPPhXI7U9aOlTg9RnUp4Xy8C42S7jBs7FIiOHYB7KqMW42BG1ByFiSxPnoay
         uq2nup2ENPVD3hRc0wX/B37xstUM5RUsjV9x52TW7y0W58DLSevx8tPBCqokanDa4Wkf
         Gbgw==
X-Gm-Message-State: AJIora/XNMoN1buMUi47MynJ+sq6Tst8GdNZZFwOsLsvZG1jhGyXfyIm
        lZQ27wKnOniVhUmQUkwcj56qSw==
X-Google-Smtp-Source: AGRyM1tT9uIUrN7GcjyY5VmuwTBxFwgVcKJ+ASECGoPIcTSkOg2vSQpXztwaABBDI5LBRqOCjHolUQ==
X-Received: by 2002:a2e:8195:0:b0:25a:6f9b:d6a6 with SMTP id e21-20020a2e8195000000b0025a6f9bd6a6mr18799273ljg.276.1656972955460;
        Mon, 04 Jul 2022 15:15:55 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id o13-20020ac25e2d000000b0047f660822e0sm5319931lfg.289.2022.07.04.15.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 15:15:55 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Todor Tomov <todor.too@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 0/2] media: camss: Simplify and improve power management of VFEs
Date:   Tue,  5 Jul 2022 01:15:46 +0300
Message-Id: <20220704221548.629302-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
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

Since a rework of CAMSS power domain management for newer platforms done in
commit 2f6f8af67203 ("media: camss: Refactor VFE power domain toggling"),
all operations over CAMSS imply enablement of all power domains described
in the correspondent device tree node. Apparently it's too excessive and it's
quite a complicated scheme to allow simple addition of newer platforms with
even more power domains.

I would appreciate, if somebody can test the changes on db820 for any probable
regressions.

The change is based on changes in clock framework [1] and on a recent fix-up [2]
in camss.

[1] https://lore.kernel.org/linux-clk/20220519214133.1728979-1-vladimir.zapolskiy@linaro.org/
[2] https://lore.kernel.org/linux-media/20220704220814.629130-1-vladimir.zapolskiy@linaro.org/

Vladimir Zapolskiy (2):
  media: camss: Collect information about a number of lite VFEs
  media: camss: Split power domain management

 .../media/platform/qcom/camss/camss-vfe-170.c | 20 +++++++-
 .../media/platform/qcom/camss/camss-vfe-480.c | 20 +++++++-
 drivers/media/platform/qcom/camss/camss.c     | 50 ++++++++++---------
 drivers/media/platform/qcom/camss/camss.h     |  1 +
 4 files changed, 66 insertions(+), 25 deletions(-)

-- 
2.33.0

