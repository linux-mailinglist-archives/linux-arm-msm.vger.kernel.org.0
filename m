Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2EF5B51C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 01:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiIKXIK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 19:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiIKXIJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 19:08:09 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E01E41B789
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 16:08:07 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id t14so12700205wrx.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 16:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=cRrFKmXDZ9IOFnRsVuTkSaaU7nKJPrfY26C+G9unL/k=;
        b=lWbAV3OKWJUcGgJWDHNKQGgXBKdn7ng7mBIMP4SAnYJC1lnJ4SNFvswGYY+mouYU6S
         6zkDMJFMnxEWQjnswJzavYDf2M1UnF0LiR9N8iz3N0EPHzh9HF1EFclxO8M1QKjGJTMG
         eb9DRT4Nmx9SHsiolCss3GBvZjWqfTOX3ejfLrGFKEdIM2DwIgUfXPNOkcQ875h8Onv5
         587R3WRfhGHA5Pm26OR7jTBoEVhNMo7/ZlEuWSUzoWXsn2K6EEIYCq+4bh1uiktDzTLn
         usNoOIh3xWviMTHAiOkTt3kRWThUOgdSvwWlAA5kwZga4ByodU2awDBvZ3Nh9ooz4ODu
         d4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=cRrFKmXDZ9IOFnRsVuTkSaaU7nKJPrfY26C+G9unL/k=;
        b=ffiMUSvreJYXzsAJyWCdHXjnN8Iwl+VksYHBB8BuhDQ1raEmjDDQ7ogI+5QZagzyeb
         xRWS+35CxG54jlo8YrHhopZBTTCxRLNort2sBF3mwIOzJ/OxH0u6ScJ0kH042T1uLCp/
         v08MV5fEMZ8vKegiaLAegP44aibCxO113tkmVtSjlvdbr9vA0tRi+czRG6kjLZA0XQ6G
         yO/jCIe5ppGx/RYv6RmVNnZ0iGpks+70rkY5c9U3bterGi7ecJBufQLZr6zQC4PHzsTF
         4DZ6BC5/E/scDHOTKueVKAg3nn94skItoLc/vIl9G/PA8A8NRa10ZWl15CYL6zNZfXuq
         Yx1w==
X-Gm-Message-State: ACgBeo3g7eFrDa0RZI4++zudvqqMeFVLDPQTGYyLLLST8Gj+tdUNR84Y
        F+Kl+3GhjyEhJXCAYyO0y+Znyw==
X-Google-Smtp-Source: AA6agR6FW6q30/h+Pq/9mvfzXr2fr8M5UhDFXOT1qJ7w+Kd2sZF6Fk0GpBAa9gqLN60nXhiI2WKtHg==
X-Received: by 2002:a05:6000:1a8b:b0:222:cac3:769a with SMTP id f11-20020a0560001a8b00b00222cac3769amr12911589wry.120.1662937686495;
        Sun, 11 Sep 2022 16:08:06 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id h11-20020adff18b000000b00228daaa84aesm5780656wro.25.2022.09.11.16.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 16:08:06 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v3 0/1] Update apq8016 lpass-cpu compat string
Date:   Mon, 12 Sep 2022 00:08:02 +0100
Message-Id: <20220911230803.1286202-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
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

V3:
- Fixes indentation splat I missed in global yaml check

V2:
- I polled Krzysztof about the right way to do this and then completely
  forgot to implement it like we discussed. Here's V2 the way we agreed. 

V1:
Per discussion with Krzysztof on this yesterday:
https://lore.kernel.org/linux-arm-msm/20220908105720.857294-1-bryan.odonoghue@linaro.org/T/#mb16386b0b6d45de6a7d7e01733d5b6a7d0b85c25

Mark the old lpass compat string as deprecated in yaml and leave a comment
in the commit log to explain new SoC additions should use the corrected
version.

Bryan O'Donoghue (1):
  ASoC: dt-bindings: Mark old binding qcom,cpu-lpass-apq8016 as
    deprecated

 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml   | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

-- 
2.37.3

