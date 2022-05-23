Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 223D9531DA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 May 2022 23:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231636AbiEWVXA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 May 2022 17:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbiEWVW7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 May 2022 17:22:59 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A13F09969E
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 14:22:58 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id v9so14666533oie.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 May 2022 14:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s84ouXHmk7fiVJEq5GR+aYMEWGBN/ptWHt1c7KVnWA4=;
        b=jDLz5fHRUI8LRqP2vuulFPmR72iYqNW8ZDA0FrKv6CzjUEBOZcmU4KiV8XaQQRxx6+
         h64sQB46EoIUjfiu/PDLrc5Khe5xZ3PGjMkyRSZitVoUgYfvwUm6B1lMtms+3hDTZuED
         ZqpSTa5mXD533floXMcRASAEsdsqu6zpt681mJuWdT2yM59N1oBE2tILA4ZN+SjNj001
         aZ86yWpsBoWXL/hRF7l/W+BV7C65GwlctH2GtdzK/no40xTGSCk46JyMHHBYU6y4ELob
         agkjkxObl4jqCkkhyNUd7el+XAdYqHYSdMYar+2F/LWVw5+FhQlLE/CxqLXLiwyl4BJq
         0nKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s84ouXHmk7fiVJEq5GR+aYMEWGBN/ptWHt1c7KVnWA4=;
        b=yo5xr2Bifjxbr9FgETFBvE5yEk8yngHp8G+Dx+PhRPGDyBm8T3QYozIiEnG65R/DSg
         c9lTCfTd670Xir4BH6be8F5NaEBP5AnqMS37l7354Bs1YitLCkITT+2qb6vvW8aoirHy
         OTfoTvkIHSbnoufJXz/jeA9Hh5jm8za8qWBro/rtdQP1Uu3HL5WvtU6C/jZPixgK8CQN
         vILuU7iAAXabi/IFjX3FHCRct7qveYmBTfMPtVrFAD3ye6Fm6qvoAer/tbFDNK2nY4Pf
         MhpJN7TOdeIIWlV3cjFRWvNlxv/vwPdLUFRbZv+Ah8eD07QgfD5k8r0AW206QZl93EFX
         zJNg==
X-Gm-Message-State: AOAM533lWKc5dUdrjytVNd7oFF0Y4LJ+Q6eExaeuby/ix53BhsbIDGE9
        tiixyEe69XHzXaylrIaD6LCuCg==
X-Google-Smtp-Source: ABdhPJzdRptAS73TmdRt1Jt94isZQ0KxtaDBKrlx/b/vrDf7aagBdRjoVStRW0IaZZU3v+OXaIMDsA==
X-Received: by 2002:aca:de84:0:b0:2f9:c97c:421c with SMTP id v126-20020acade84000000b002f9c97c421cmr581104oig.46.1653340977669;
        Mon, 23 May 2022 14:22:57 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t16-20020acaaa10000000b00325cf57766bsm4465412oie.1.2022.05.23.14.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 14:22:56 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [GIT PULL] Qualcomm clock fixes for v5.19
Date:   Mon, 23 May 2022 16:22:55 -0500
Message-Id: <20220523212255.64355-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
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

Stephen, I sent this as a follow up rather than creating a new tag. Let me know
if you prefer it in a different way.

Regards,
Bjorn

The following changes since commit 703db1f5da1e3a62b84356a29c150efa24a2377d:

  clk: qcom: rcg2: Cache CFG register updates for parked RCGs (2022-05-19 16:42:30 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-5.19-2

for you to fetch changes up to 03e053b4f717c0d893881fe8e4ca8d9ae2f035f2:

  Revert "clk: qcom: regmap-mux: add pipe clk implementation" (2022-05-23 12:26:13 -0500)

----------------------------------------------------------------
Qualcomm clock fixes for v5.19

After concerns were raised about the new PCIe pipe_clk mux
implementation an updated implementation has evolved, but has not yet
been accepted.

This reverts the merged changes to avoid these concerns in the current
release.

----------------------------------------------------------------
Dmitry Baryshkov (3):
      Revert "clk: qcom: gcc-sm8450: use new clk_regmap_mux_safe_ops for PCIe pipe clocks"
      Revert "clk: qcom: gcc-sc7280: use new clk_regmap_mux_safe_ops for PCIe pipe clocks"
      Revert "clk: qcom: regmap-mux: add pipe clk implementation"

 drivers/clk/qcom/clk-regmap-mux.c | 78 ---------------------------------------
 drivers/clk/qcom/clk-regmap-mux.h |  3 --
 drivers/clk/qcom/gcc-sc7280.c     |  6 +--
 drivers/clk/qcom/gcc-sm8450.c     |  6 +--
 4 files changed, 4 insertions(+), 89 deletions(-)
