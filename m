Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6387B33CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Sep 2023 15:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233445AbjI2NjY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Sep 2023 09:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233448AbjI2NjP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Sep 2023 09:39:15 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0E092702
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 06:39:02 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-533d6a8d6b6so14776576a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Sep 2023 06:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695994740; x=1696599540; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N80cnpAhKZAQNAt0LvDi0BgqS0Cl+s+lMzHKGl0eRh4=;
        b=PB8XYtTt/2Krfplz+H6ZYkl33Gsq3y7RiFEHlwN2Fx5sYwSBaxmZHsI6PzDMLixWuc
         GimMf2klP1e394MhNDSs9zB2qqgttaiSiqf2pRNMMVdLfs/T0o4TWEvl+3e15n66gzM/
         CYBpPeMZL19lRhu4wjSNwX0iOpA3o2/IbTBsiddzUsZvETt4vrOknQXJx4bZAn5me3lV
         2Di6xELuCUHCPdiEHOppLqdr84AcwUTWqpX1TkHSz0T2zca84LRYWdF+7py9tG8Ks7eZ
         HOr0jX4+V2ZHpEXrR/djBjh1OU7DkUHGxdzSBiy1T5JKFCm63nQOaNWhbAI8QOYL2uWL
         fSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695994740; x=1696599540;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N80cnpAhKZAQNAt0LvDi0BgqS0Cl+s+lMzHKGl0eRh4=;
        b=J4Ec9zGbTlj7ItZAj5v4YiexXmusFqPdrC7j+O0IVVcsXbDQLnqk4AGHKQ+nXpU3tM
         oaUjJTvelG5i1XGXV2U3uO8QIjdImhSw7rIrhSP/qCCSFP3eKC7k56U4xm21xZe8Bpir
         mtq7vk7vKSTZszgy1TsEGbcbGmRTJLs1J43dUyHEU3j4kdBoLKhGr3udOzteL6v0bbm2
         c4bIyMUtqxxXclBQT99lzD88u1zBwSsV/QiC7iKHHcT7Hs9qWDXVwY/12uO8kvfqD5/h
         lG7y8CYFKvSCD5VZSob8jC1/QqdYXWTBA1cV3hxQme0PhHXpoA0MCNsscGREghXrDAd2
         mDew==
X-Gm-Message-State: AOJu0YylatVOIt5tecjbLQCMKbX31m94Fb/TWspLoNTKgbqZuDd/X8uo
        JOftMn1qP/Y6KGbbd+BkoLxab6QDw+Nqpui6hLA=
X-Google-Smtp-Source: AGHT+IHDZ7g5o9oqgsZvyPyN1QPbuYPFz8FvHA9hu9FRmuuDczT6e2mlFwjshH5KeTJNcUqMM0Qqbg==
X-Received: by 2002:aa7:c58d:0:b0:530:8d55:9c6f with SMTP id g13-20020aa7c58d000000b005308d559c6fmr3183409edq.2.1695994740560;
        Fri, 29 Sep 2023 06:39:00 -0700 (PDT)
Received: from [127.0.1.1] (178235177217.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.217])
        by smtp.gmail.com with ESMTPSA id cx14-20020a05640222ae00b005362bcc089csm2215701edb.67.2023.09.29.06.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 06:39:00 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] 8280 display ahb clk fixes
Date:   Fri, 29 Sep 2023 15:38:51 +0200
Message-Id: <20230929-topic-8280_ahbdisp-v1-0-72bdc38309b9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGvTFmUC/x3MMQqAMAxA0atIZgMxClqvIiK1Rs1SSysiiHe3O
 L7h/weSRJUEffFAlEuTHj6jKgtwu/WboC7ZwMQ1GTZ4HkEddtzRZPd50RRQqpaEnOWmYchhiLL
 q/U+H8X0/pz8Sc2QAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13-dev-0438c
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Little fixes to shut down disp ahb clk when dispss is not in use.

If possible, the dt patch should theoretically go in first, but x13s
worked fine regardless.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      arm64: dts: qcom: sc8280xp: Use the correct AHB clock for DISPSS1
      clk: qcom: gcc-sc8280xp: Don't keep display AHB clocks always-on

 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 4 ++--
 drivers/clk/qcom/gcc-sc8280xp.c        | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)
---
base-commit: df964ce9ef9fea10cf131bf6bad8658fde7956f6
change-id: 20230929-topic-8280_ahbdisp-e170e0ca2442

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

