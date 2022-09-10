Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCF05B4382
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 03:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbiIJBLi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 21:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbiIJBLg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 21:11:36 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC3BBFC674
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 18:11:35 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id v128so2762118ioe.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 18:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=5pILyiPDCM9SKmo7wNT1UylORqh3jGN1ac6dkAugrO8=;
        b=pFbp7jtM060PZR0aws7LaEpRUbvtKbUMGN9ZBXctH70BqqTpwYA3d2yf+vGRt9blgX
         C1MLMwV4/QopFHtiKyuBQ2VsRNAMmDj6OOpdQGpsoqnCyYhcOzJe06SO/T8hY9a9Du/o
         4QN8+W1G9tM1yktjyV9ngD0OgrPbytZSjHXuaP8uHK4KFNnOSrCvgnab0ckvGVFRssng
         TRbzEgxtieVGzaVurXNi4McKeyj3OYpVTyvvKG1FhugkAcpFCRk3/iL5yyU6ek2AbjSH
         Quyzi+rGdeRb026WemeWNC8y9T+X7McFezD1021bzkSqlhA3bvSpyWJZZFuq+w6ZdoY3
         u8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=5pILyiPDCM9SKmo7wNT1UylORqh3jGN1ac6dkAugrO8=;
        b=rl8l6QwspCMBzhHyTwB95y2slqSMwFDXASg9fr8YBl/7m/YAFYjJ+wp6Nm2byt9oHs
         obf8fEmzZZZnkHI75dsl5ijFHzTw1rm7oP1er15lMq7SEkypnIXqT/lCvawhtXs6pyKN
         6c74pEX05yCTJjnbZxuw+Iek+hLEHrq9DjtSm2CrpvJ+/Qtv+5MVdjHoDjl7rcrDAegU
         Skz7dd6NfmK6tTXwkF4ZBjNy0bUEJJW/Jx/Q8Ti7wNPZNbR6tOjGC96atTX3dWfQlnys
         nZcP0FAUvMttbFz5qFp92dseErohydJoJuphVGmSKXjgDM5FefkQ+u6klcE4rbiNXbrs
         3L2g==
X-Gm-Message-State: ACgBeo0PisimXGH3EY/cnM7/xngb2J/BvZzCyfA3E02s0zglTa44RwVH
        gcKDmIFwm+hCEdjhMvrOAYA92g==
X-Google-Smtp-Source: AA6agR7sbBDlYreETwAl42T9aSWNR3thTX1pQTKuyBL2y8qJ7KU12+v3soK40W12DGpfOLYHIPk3aQ==
X-Received: by 2002:a6b:f00a:0:b0:692:386:e12a with SMTP id w10-20020a6bf00a000000b006920386e12amr7689137ioc.112.1662772295027;
        Fri, 09 Sep 2022 18:11:35 -0700 (PDT)
Received: from presto.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id u133-20020a02238b000000b00348e1a6491asm733064jau.137.2022.09.09.18.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 18:11:34 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com
Cc:     mka@chromium.org, evgreen@chromium.org, andersson@kernel.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/6] net: ipa: a mix of cleanups
Date:   Fri,  9 Sep 2022 20:11:25 -0500
Message-Id: <20220910011131.1431934-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series contains a set of cleanups done in preparation for a
more substantitive upcoming series that reworks how IPA registers
and their fields are defined.

The first eliminates about half of the possible GSI register
constant symbols by removing offset definitions that are not
currently required.

The next two mainly rearrange code for some common enumerated types.

The next one fixes two spots that reuse local variable names in
inner scopes when defining offsets.

The next adds some additional restrictions on the value held in a
register.

And the last one just fixes two field mask symbol names so they
adhere to the common naming convention.

					-Alex

Alex Elder (6):
  net: ipa: don't define unneeded GSI register offsets
  net: ipa: move the definition of gsi_ee_id
  net: ipa: move and redefine ipa_version_valid()
  net: ipa: don't reuse variable names
  net: ipa: update sequencer definition constraints
  net: ipa: fix two symbol names

 drivers/net/ipa/gsi.h          |   8 --
 drivers/net/ipa/gsi_reg.h      | 208 +++++++++------------------------
 drivers/net/ipa/ipa_endpoint.c |  44 ++++---
 drivers/net/ipa/ipa_main.c     |  25 +---
 drivers/net/ipa/ipa_reg.h      |   5 +-
 drivers/net/ipa/ipa_version.h  |  28 ++++-
 6 files changed, 110 insertions(+), 208 deletions(-)

-- 
2.34.1

