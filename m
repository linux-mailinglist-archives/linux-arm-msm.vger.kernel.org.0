Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C375C590D5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Aug 2022 10:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237402AbiHLI2J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Aug 2022 04:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237099AbiHLI2F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Aug 2022 04:28:05 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30A73A7A84
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 01:28:03 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a7so824208ejp.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 01:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=FOvtKT4GDRSWWmANlZuaQLQU83jeOYXI0TRQUgDdg10=;
        b=Tzp3P++LcNmw9+TC/IRERwMx+Wks2NcyvmSodUphcN5+yg8kiJYHvJa+nyNSqODj5B
         pn6vRDYHiIZWVAUCHqQ5S8M3mYM5fYHQEedpLxxlVNGW14j6pWeYsm3QPF8Ned07/YgU
         9Fl/A5dSI08PQBsTowvNtH0O8b0Y7sv7Ta2GXySWEullzj0YVGoA77yU3t4y81BwANH1
         bp7wB+JFIKoAPLocuMEfW9INgK0TWW9+ozYnXEh7PEC3cn2rfajFmMHvV3/04YKpkbGT
         s5RxBc2p17GcJQimnoLLnTBfzQaa33qqED0UrvCS+D/NJkpLR/MYiDDmmHI8GDNJdai3
         oSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=FOvtKT4GDRSWWmANlZuaQLQU83jeOYXI0TRQUgDdg10=;
        b=DE6AKMj0bXkd+SmBDbi41c0JOCWm5bxI+Y6LOfgnQwKKlLSFI2dQPx34U/XfdnrUuR
         bqlTx7X6qL2EMZaIfoA1FoM7EVexbrtgd1K84ByWo/mP7WHPpObQkxir4DTD0PInL87f
         I6r6oAopiQVikO0a1cdWgCYmUMDLhWK7zTtr4ntnMSYO95whnU2dHOG2H9aFU1zdUnUM
         /aR4MEwRZv+08KAE7BstOCGs5E76sdvCI08IibKz6q4vQlLa8jtuwCXNwuindvp2Qv29
         wDNT5297Scs6J66t1Wcds3zPoxR7u4mwXey9FzOn2Q39NZDYN91Ed9McC7EmU/UL6LOS
         fDIA==
X-Gm-Message-State: ACgBeo0JWLKczaZ4M2PmU+x/5i8XNEViPDfBa2pyVH+e67vrp/YLdKjG
        vojsq22fDlzRqO0Nfl8eUjEO11YVcQEnug==
X-Google-Smtp-Source: AA6agR6sMdNeGSxXxvk8uOhNb7/vmNsY06X9b9K9lidIhxQRJXDPodrM5jukgmEgLZ9ll1swk90yqQ==
X-Received: by 2002:a17:907:270d:b0:730:6082:eb62 with SMTP id w13-20020a170907270d00b007306082eb62mr1914257ejk.95.1660292881538;
        Fri, 12 Aug 2022 01:28:01 -0700 (PDT)
Received: from otso.arnhem.chello.nl (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id y6-20020a056402134600b0043cf1c6bb10sm971326edw.25.2022.08.12.01.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 01:28:01 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 0/3] Add GPI DMA support for SM6350
Date:   Fri, 12 Aug 2022 10:27:18 +0200
Message-Id: <20220812082721.1125759-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.37.1
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

This series hooks up GPI DMA support for the SM6350 I2C.

It has been tested using himax,hxcommon driver that I forward-ported
from the original vendor kernel on fairphone-fp4 - previously I have
used i2c-gpio bitbang in my tree.

This also requires the fix from Robin[0] that has already been
accepted into linux-next, otherwise I2C communication fails to work.

[0] https://lore.kernel.org/linux-arm-msm/20220807140455.409417-1-robin.reckmann@gmail.com/

Luca Weiss (3):
  dt-bindings: dmaengine: qcom: gpi: add compatible for SM6350
  dmaengine: qcom: gpi: Add SM6350 support
  arm64: dts: qcom: sm6350: Add GPI DMA nodes

 .../devicetree/bindings/dma/qcom,gpi.yaml     |  1 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi          | 59 +++++++++++++++++++
 drivers/dma/qcom/gpi.c                        |  1 +
 3 files changed, 61 insertions(+)

-- 
2.37.1

