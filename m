Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E90E776A14
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Aug 2023 22:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbjHIUfj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Aug 2023 16:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbjHIUfi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Aug 2023 16:35:38 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6117B4
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Aug 2023 13:35:37 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-317e14b0935so117917f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Aug 2023 13:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691613336; x=1692218136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RfoTq2XW9+R+h/qbUOVt8LKEkXiOZWtHK/uiLQ/IU5A=;
        b=xliiIduM58I6k9OalL8xzwc4n/BV2j7QIRJSK0rVlaynwN6KWfO4uRF11dzKkb0d3W
         upmIBo/gtqwMdWwKfLnEf0aBuvNKYhRS9DzAYIKCBf6ioj05pG4TQVJuK7fweTFM9QGp
         GyOaxkU9sGEZ4a2oeMeE+skCtZ8p+EhwVBlDV+CZzrQfeBTRDNZ5Vn/pm1eN8+Tyv8F8
         9v/9vgPnYU/A37uBUrj8VuRsjoHMx5MMdWp1IwEANYKKJdLofILugdf2cmTDTFZYOpDl
         qjyH+G1WU3iEi29+ZcDPvj5gnedV86fp7QvE1KCHazb8kUA5seBBNP1+CFYF9jyyLe0H
         Tw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691613336; x=1692218136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfoTq2XW9+R+h/qbUOVt8LKEkXiOZWtHK/uiLQ/IU5A=;
        b=EXL7Fhrvl8gzFeVO+nCFVzhDWnpY0hbvwpD7cbT5cVUqu0f6oWCdbjV3ScKEmH5XFV
         hcfsPOgW1LmT9RdtQa/ql1q2nHBUR3XcOle3xkrp7dC4k+ITGLUKcsmrGAk3KD9ahPiq
         Bang6/RuuEjd4HkvX4BDCXfFTppcPFY62CTQLOPsAf98sSCDQ11XqhR9ANOH8/BTgbWv
         dFidCtErMs1p6znAUHPlWBM6GZaWExbOJ+U5mnB0V2ITm0mXES2VgitAHx51ivRKc5lr
         e44+3CTr4pVSwNgw8YNvmkKoVhBrnPAct5J3TZprJUbTm7p7A3//UO4C94tIRXyrLd4J
         bF7w==
X-Gm-Message-State: AOJu0Yy/pYzdCi5vUrBV5CAb+Z8j+ULhwW3okij0zYpedSxj8OKa+xrF
        bgZXRE6YpjT67Ac3XTXzi6bhoQ==
X-Google-Smtp-Source: AGHT+IEwF64TfCzahjZomc+toRMvunS2U2np7joMbcm77GyNVweE4B9Xr+vlLhy1kN7l5qvJHkXu3A==
X-Received: by 2002:adf:ffc7:0:b0:317:5d76:1d1a with SMTP id x7-20020adfffc7000000b003175d761d1amr4217wrs.8.1691613336440;
        Wed, 09 Aug 2023 13:35:36 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x12-20020adfec0c000000b0031274a184d5sm17699490wrn.109.2023.08.09.13.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 13:35:35 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH 0/1] Enable CAMSS on non-mezzanine rb3
Date:   Wed,  9 Aug 2023 21:35:33 +0100
Message-Id: <20230809203534.1100030-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Similar to the apq8016 case we can run the Test Pattern Genrator (TPG) on
the rb3 absent a mezzanine or connected sensor.

Link: https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-08-07-db410c-rb3-camss-dts-v2

Bryan O'Donoghue (1):
  arm64: dts: qcom: sdm845: Enable CAMSS on the bare rb3 board

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.39.2

