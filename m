Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F78460210A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 04:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbiJRCTe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 22:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbiJRCTc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 22:19:32 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D485A19A
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 19:19:30 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id f11so21260713wrm.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 19:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uFKD5RqTZ7BNvrU1inlhYnVlXGpq45w67fX3oH7/4Vs=;
        b=U1gICspd/FT0wEzrdZ5t6ekwT415iR1wO5LLHsJR8zaZtJitjJLQQ/aLOB21/KIxY+
         ZI9Hc7IAeYo643OrYBkhUFA0JomYRkza4crCbtAOgVZCpa4/JpIWNzQB8yLAUTnsIAto
         09BaLZreKJWBSYZ0gV+EbEc4yHia0NtlDo8pHUppLSKbh83tWLktdL49y7IiubvXopcB
         nP1jUfT0dk3jx/m7w6Bk+Vecba1Bu9jBEKlAhqSQko45rCtfBe9RyVfzkIVLkd+HRp2O
         nSv5Y6ZDO2LO+iJJb0RoJmz/Tzr+FkU1VpeCiN/6PrsRkxKCuWcp4KIiTUR9IrvJyz/L
         ikFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFKD5RqTZ7BNvrU1inlhYnVlXGpq45w67fX3oH7/4Vs=;
        b=DP7bgA2EAxfhcPhePyhiBcjlaec9qCwFn/R5MkvL5hJ+CheK5y7weczEYmdb0+gouA
         ZxAsOW40mmjny1uCFNdthGyyoaCNi88JijG1rqkUWoj6Nm50WJgYWPDXLTtJfVelEfEr
         6XLn5wzhxydK5hB0/0mnGd2Oz5dECztgD5IkrStmurkDIdQpMcQ4/9yMl5U4pTZmi7/B
         u21+wXtCeRFq+SW4F92otk4MhBT8KtoKkKGHwSGidxksNGS2yjqQarle3d7/23UqlgbC
         TTDNPZGHdMOgHezyJhCSyOtoE7u5p2GlYIQusweAltHRmxZr/718Nmvemw1+lkpDC8Nu
         7JPg==
X-Gm-Message-State: ACrzQf2sHLfo36CNY2qYXSEXBOiRPaUWhNgRuoUMyhK4mnIIJXkxcZNH
        VeE7jM7gu60CG9KTQSwAnG04jw==
X-Google-Smtp-Source: AMsMyM4bYHv45Ga5+YpT5hIohGaxvX8IoOfVy2lF4HoQDn0SLYZXH3rfiiuTboc69KtSd2cc3eftFg==
X-Received: by 2002:a5d:4889:0:b0:22b:214:38dd with SMTP id g9-20020a5d4889000000b0022b021438ddmr396313wrq.32.1666059569184;
        Mon, 17 Oct 2022 19:19:29 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y6-20020a1c4b06000000b003a83ca67f73sm11921533wma.3.2022.10.17.19.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 19:19:28 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     loic.poulain@linaro.org, robert.foss@linaro.org, wsa@kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     vladimir.zapolskiy@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 0/1] i2c: qcom-cci: pm runtime ordering fix
Date:   Tue, 18 Oct 2022 03:19:19 +0100
Message-Id: <20221018021920.3747344-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
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

v3:

- Drops pm_runtime_put, adds Valdimir Rb/Tb - Vladimir Zapolskiy
- This patch was previously part of a series for enabling CAMSS on
  sm8250/rb5. There's no reason to bind this fix up with the enabling
  series since it is an applicable fix for all CAMSS platforms.

https://patchwork.kernel.org/project/linux-media/patch/20220524140207.2758605-2-bryan.odonoghue@linaro.org/

Bryan O'Donoghue (1):
  i2c: qcom-cci: Fix ordering of pm_runtime_xx and i2c_add_adapter

 drivers/i2c/busses/i2c-qcom-cci.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

-- 
2.34.1

