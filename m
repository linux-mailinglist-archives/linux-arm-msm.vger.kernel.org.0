Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2BD3580954
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 04:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbiGZCPA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jul 2022 22:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236463AbiGZCO7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jul 2022 22:14:59 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C39F28E2C
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 19:14:58 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id bn9so7404107wrb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Jul 2022 19:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RhszBCa65sY3B/JEP4mgxAurV3P0RyQjhKzWzBEXlD0=;
        b=QH79a5AB3nRvrSJmSxcHH49VYHb3Icop88lSzU+L8Jzd/qIoxDQWIOm2uuzh1BN1K/
         CbFRcI92RC4NeQTc7zAqBQqBYK03z/gnpOdLaTQLT7h0pXZ8EVNc2PqqyFRQDSU72hE9
         iSRIlxsENzjZ65TtdYfKVNDpjI7Tt3sa0ZmxufFzydw+FkyCXrDWxsuS2Ot/fyGphNOv
         i8iYaRe8GisLfjkNQW5FDyo8vfVk6XQYtM85fFRWrEvH/zzBf3STGiQj2NPIRO6QqUmG
         Ku6VECO3PFvofXZXZfMzHgI72kFU59SYH6NthZFPCKnr9DoH8WN2sSdxkpv68D9yrjx6
         QGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RhszBCa65sY3B/JEP4mgxAurV3P0RyQjhKzWzBEXlD0=;
        b=hrAWa+OShwhk20592ra8SDmnA7Ra5itvsAGNJzl1ZtLnMlYF9xojp4EKq2OgTMLIcO
         6rp7dDLwW9XHX5awwAZia+ip7tDfK1GaTwLyZDCwVDttJ5siyI61xf/YX5Pja+YT9zU3
         /xuGXgWXsXQud4blsf8BZawlEvncdH+zHTb0/rGRYR7gHpP2Ny8S5QwZ6fDwxsiL5oJn
         zh05/n9JWd35FRFafBVcnKt7DONiG78dXSK0roE+v2+BIT4IYZQghtW7c/VQmT7S8RWh
         DN5EYr/t6RApATUKBQsSYJTk91QT/W8WpR3hIF93QOojbtyee4eLT0LxJVqlX1Phvocz
         VgYg==
X-Gm-Message-State: AJIora9fmo5gISxHAy0rCX6dOdp5SYUM/9ul/E6MbHglKIl3+tyMuar9
        IV1RaA9j9/Wc0ZFx7hDBEP+HAg==
X-Google-Smtp-Source: AGRyM1sWuQscPIsL6LyIA+VZIh4QqtkwQHxPi6WBNwhf9q5hwOMgJF5eck9sBbuTCoCR6s6jC6BS2w==
X-Received: by 2002:adf:d084:0:b0:21e:5570:2b05 with SMTP id y4-20020adfd084000000b0021e55702b05mr9124524wrh.554.1658801697069;
        Mon, 25 Jul 2022 19:14:57 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r67-20020a1c2b46000000b003a308e9a192sm20005984wmr.30.2022.07.25.19.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 19:14:56 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH 0/2] media: venus: Fix up buffer handling for HFI_VERSION_1XX
Date:   Tue, 26 Jul 2022 03:14:53 +0100
Message-Id: <20220726021455.1814096-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
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

This series fixes two buffer handling bugs. The first bug is trivial and
~impossible to hit without the second bug but with fixing anyway. Its a
simple NULL pointer handling issue.

The second bug relates to HFI_VERSION_1XX output buffers. Unfortunately
these have been broken since

Commit: 9593126dae3e ("media: venus: Add a handling of QC08C compressed format")

A bit of bisecting the commits in venus found it handily enough. Once the
fix is applied we have I have decode working again on db410c.

Bryan O'Donoghue (2):
  media: venus: dec: Handle the case where find_format fails
  media: venus: Fix NV12 decoder buffer discovery on HFI_VERSION_1XX

 drivers/media/platform/qcom/venus/helpers.c | 13 +++++++------
 drivers/media/platform/qcom/venus/vdec.c    |  2 ++
 2 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.36.1

