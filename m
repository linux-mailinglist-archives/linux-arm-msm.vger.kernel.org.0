Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1F873E6CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 19:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbjFZRsQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 13:48:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbjFZRsQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 13:48:16 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B01130
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 10:48:13 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b5e7dba43cso31759261fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 10:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687801692; x=1690393692;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I9fUgEJ67HkDH34+zzCuhAJ7MUNwqjTfuQwZXMZwwsw=;
        b=bEYOsRm0zoI3Xf55vqZIXQdAiNJU2p2rgXJv76vUbsoKwZ1qRboNxiayAsAtuI85fV
         heXIcqEnZkd23tZSTNKC4ekY98RaI4RR/01MwGeK3DpDn/NDt0VjQmP/dKWeSxMDENMY
         XqdsiJWpRs95bWGVLBUhvOymcbB8pMZDmKLlW4r4vZQkKTGQ1/A3aLBg654fKf2xYxBA
         97jboCovwbyI0X8bhzlj6kPc696CshDRGcSd6NXVa9YYOqp8OGoRRHBrY5zzqn6gU5uk
         BvuE1JMy/4o3qA5tEKHq3vXwN2jAlnBtYoPtjC4wCJZiEuJkpF+WLkenJGIbKHjgDqKe
         lfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687801692; x=1690393692;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I9fUgEJ67HkDH34+zzCuhAJ7MUNwqjTfuQwZXMZwwsw=;
        b=JCJV3zZzwWjo8YdHuUDaodUn3BCJLpOFKt/Rf1Avz8CCJazzlcPZgh5NXBM6GqvIZJ
         Ktz46ho3JxJG+FRADIduo8mIiPsohUEGHH91nZFQ3ot+HmviCJdqT4k3PDkkK75v0Or6
         opwNU0vajoueRukfM0xKDoGr1w5XD6f5Cbd0SSPQMG9ZGO6fSFXmpLl92aPQIMNhsZDN
         hgi3vkhZXOEd+9HQdZ13H5+IU8AJfoSYfSr5dDv6D/tir8H8x7gmpJ+JcfWll7kADowY
         SmzSdW8mOTZbSZDPRdqq1J7t2pyYGoWi9qZK3q41CksEPEAUM8WDdFxzgB2vZBRZw7VO
         NjAQ==
X-Gm-Message-State: AC+VfDwUPJPsqK4kBxYcEY9Sr/NSCG1kLfMufrUGl+MWq+MMlQ/JStkQ
        MEb6+UigqkqzIpvrvaFLW7MVEg==
X-Google-Smtp-Source: ACHHUZ7FiSeKZXM2baZmXdTjyDzstcuHnUOia802fOfKZ+C6be73RWADkTpg6CqFkSUjDs5F+hoWLQ==
X-Received: by 2002:a2e:8559:0:b0:2b6:9fdf:d8f4 with SMTP id u25-20020a2e8559000000b002b69fdfd8f4mr2322575ljj.29.1687801692061;
        Mon, 26 Jun 2023 10:48:12 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id h19-20020a2eb0f3000000b002b470afec39sm1337076ljl.48.2023.06.26.10.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 10:48:11 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/3] Fix up 8280 GCC GDSCs
Date:   Mon, 26 Jun 2023 19:48:05 +0200
Message-Id: <20230620-topic-sc8280_gccgdsc-v2-0-562c1428c10d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFXPmWQC/4WNQQqDMBAAvyJ7bkqSFqs9+Y8iZbOJcUESSay0i
 H9v6gd6nIFhNsgusctwrzZIbuXMMRTQpwpoxOCdYFsYtNQXWWspljgziUyNbuTTE3mbSShTm5t
 DgzjUUFKD2QmTMNBY4vCapiLn5AZ+H69HX3jkvMT0Odar+tk/l1UJKeRgW4XtVRuL3cQBUzzH5
 KHf9/0L5RFFAs4AAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687801690; l=1075;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=CwESCshIY+wSLyr68qR+yighC4LBKQO7Rmi1mrcuW5E=;
 b=HNxYQKpR8UXJV2+BC97EGzn7IHYPG2F6wVu9z2CwTVU+FxuZU9vTWkt4u5N2mXok2UWz3x+mS
 QAXB7aNmi0xD9cHDkL1HwM6S8/f1QG24pTxzlWXeWik1MKEUb/FWrrI
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Part of the SC8280XP GDSCs were not fully described and others were
missing. This series attempts to fix that.

As usual with the laptop stuff, please test it on your setup to make sure
everybody's still happy.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- Pick up tags
- Drop HW_CTRL as the flag upstream indicates usage and not only support
  for that feature
- Link to v1: https://lore.kernel.org/r/20230620-topic-sc8280_gccgdsc-v1-0-0fd91a942bda@linaro.org

---
Konrad Dybcio (3):
      clk: qcom: gcc-sc8280xp: Add missing GDSC flags
      dt-bindings: clock: qcom,gcc-sc8280xp: Add missing GDSCs
      clk: qcom: gcc-sc8280xp: Add missing GDSCs

 drivers/clk/qcom/gcc-sc8280xp.c               | 121 ++++++++++++++++++++++++--
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h |  10 +++
 2 files changed, 124 insertions(+), 7 deletions(-)
---
base-commit: 60e7c4a25da68cd826719b685babbd23e73b85b0
change-id: 20230620-topic-sc8280_gccgdsc-1b6b7eabaaf6

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

