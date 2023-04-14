Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9BF86E21B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Apr 2023 13:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbjDNLHB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Apr 2023 07:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbjDNLG4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Apr 2023 07:06:56 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D28C134
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 04:06:45 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id x4so2975892lfr.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Apr 2023 04:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681470404; x=1684062404;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+pbVMYUFkp/wWpVPBgYNzrX3UCSwtdckmQwLwtFjCGg=;
        b=Ecs0U6Fl0zwn2WiDyoyDh684jJKFZ+b9Z9kwZ/Y5S1MyDes1UYONXRjwIZDahTP0Mr
         EY/JvXuPfibFAiKulbDs/AeLzBmh7Ql+T1Tr+bWkVkIvEiLVkNYWPOII7nMWmbKK79DM
         XDmhkmHTaaa7rh9Z2HzVITeWeu7hJ8SXC48KT67Qk09uw2LgAK/cR4LeeRN4zlCaGl5Z
         I+Rg4kTsxmZgISi4dddmFIeJYVipg4tOLON7FfjDhtmZu1B79d1Z79icFLXPrn/tHnTY
         YpSxmg1JY6aPYca28GJZJKODf7n91rEBePiehC93k3zy4q7xEhUJgJENaLtxsQFIXaiW
         ABBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681470404; x=1684062404;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+pbVMYUFkp/wWpVPBgYNzrX3UCSwtdckmQwLwtFjCGg=;
        b=LjeBoybWjNaUv185uPIJlbalQTJJa/yBtT26uCo3OoYSLVqOJuHeQkwf3eZYI3F8nY
         jYWgO601RXCxCG+/XlqLZuSqfym64SOV3od2aXlmWE0qT3umCTam6rZz5N/MaY2k5DQM
         AT4S2qf5Wqj+aHZ386c4qWrYhnS7f6ST9QPjSwDE+BP73FpFT6No9w3lDU4QWyGUZzHU
         mn/RJ+fDPvpI0++rw2huDIaaqnZ/eUZc7/hBkRSFjchEkaa2mjLAPf5bJZBCEMVMaPLo
         mUcMy9HgQYOk2xaktqkuOobAxU/SS5Gbig0MX4Fgrj70EpnjITd/bvPhYerbIPHSUltj
         vtxw==
X-Gm-Message-State: AAQBX9dScd4CWJJ30vS9ogfrIBc4Sy0n+U7eigSx5mR3N5KvWahhnaRG
        Ya3TSgi7NEjUHCXWGFqKDexD1aPYcjSE5Z+xmTI=
X-Google-Smtp-Source: AKy350YmEO0YJUXjQplRF1p2roVwVla0URGrh5PSaNMg7df5LsTT6qI1HTe2XSbdb+O5u95JFZzKeQ==
X-Received: by 2002:ac2:46ce:0:b0:4d7:807:4eaa with SMTP id p14-20020ac246ce000000b004d708074eaamr1780082lfo.43.1681470403880;
        Fri, 14 Apr 2023 04:06:43 -0700 (PDT)
Received: from [192.168.1.101] (abyl123.neoplus.adsl.tpnet.pl. [83.9.31.123])
        by smtp.gmail.com with ESMTPSA id j18-20020ac24552000000b004eae672e96bsm751398lfm.255.2023.04.14.04.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 04:06:43 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/2] QCM2290 dispcc fixups
Date:   Fri, 14 Apr 2023 13:06:34 +0200
Message-Id: <20230412-topic-qcm_dispcc-v2-0-bce7dd512fe4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALozOWQC/32NWw6CMBAAr0L22zWl4gO+vIchZlsW2ARbbJFoC
 He3cgA/Z5LJLBA5CEeosgUCzxLFuwR6l4HtyXWM0iQGrfRBFbnGyY9i8Wkf90biaC22xcmahol
 NqSBlhiKjCeRsn0L3GoYkx8CtvLfPrU7cS5x8+GzbOf/ZP4c5R4Wm1eWlpPORuLgO4ij4vQ8d1
 Ou6fgFfVVdQxgAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681470402; l=851;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=UDEB64Xz5IE9VTGP1A7X45x+eMP2+g5GQeAWrjLQ9yE=;
 b=oq7Xp8Mp5CyZKf2wzpqCcAfJXAw6g+8os24YM0RZ/hVDvtOL+oPBmphIm840NRT3vwjSL73+c1sX
 7bhWrgb4AIStU+kW3Rh0A1O0u+ZVLbLref/InbfTMe9J/6m0bSsx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v1 -> v2:
- Drop the merged "remove inexistent dsi1phy clk"
- Reword the commit messages to hopefully make them clearer

Rebased on qcom/for-next (see base-commit) for ease of merging

v1: https://lore.kernel.org/r/20230412-topic-qcm_dispcc-v1-0-bf2989a75ae4@linaro.org

I noticed some very msm-downstream-y bugs in the QCM2290 dispcc..
Let's fix them up..

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      clk: qcom: dispcc-qcm2290: Fix BI_TCXO_AO handling
      clk: qcom: dispcc-qcm2290: Fix GPLL0_OUT_DIV handling

 drivers/clk/qcom/dispcc-qcm2290.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
---
base-commit: 8358703a007eacc48b007284f29c0df2b694b513
change-id: 20230412-topic-qcm_dispcc-f46cbdeaeb90

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

