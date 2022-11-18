Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC6862F925
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Nov 2022 16:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242101AbiKRPUg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Nov 2022 10:20:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241919AbiKRPUf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Nov 2022 10:20:35 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F821CB08
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 07:20:34 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id j4so8766723lfk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Nov 2022 07:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9dA0rI2Y1/RGg4xPtZeUhqidrdeTWgiKWbShXHxYBXk=;
        b=pLCKIfuoabXLhdiAPOmsyvzKa5COyq1OgPyUBKdxVqk/ZDK237VWJ/qBRdnNfM8fpU
         ktHPKlpTjJOxkMZE73VHoWuf4ZQ3TQnMxqwv9E6NGDzKeh2nFZxpslL74VJVSPzGt6Dl
         BjGf0rNJ/ka8JadY0tIwSYq1xPgkSEQQrQuA1Tu5b9g0GcYIt5jIFOEkO20jYSmIrOQS
         EjL0rTCTqMgcbxieoDz7uD7r9hgUCUbE4LisKxiVXHoMT7IMJMQSSFcp7M/kweMhzUYo
         phS6kyN5C3h1+PsDW6GvIQesTbhgL7ozgXTT0Zq2cddz9Oq+nnv8d3V6lj5X35X/UpEZ
         niKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dA0rI2Y1/RGg4xPtZeUhqidrdeTWgiKWbShXHxYBXk=;
        b=d4sg3ABD5I5RlCYYBsywb6bsQWSo8yUcmSb7cjqB+rS369f1Ko6GzpzYSoo8V3fPU/
         vKObtXDh7Zv2piakprEBqZxcAuZGQnmkKDdPCiCLVwM4TpC/IQN67gY0gPmug2VLXxoa
         WAorBODATc5hrVAEW8maBq6lPui0jLr1/p3hxYMZb7ejjGQO7rWbdpP9QFSEANArHF0W
         c+M2qGSs5dxtwwsyZI/9CJvp2fIFm7FgordhOXOuQHvHQrp1RzrtMTDpIGaR0GmIvWLg
         dvvEb63Px9dWmc/4fmVpQ+/waqBNJmRRaB81TUjVECacedgwwEqudjCX0kkSMETnn1Ni
         ZLtg==
X-Gm-Message-State: ANoB5pkjImUoFieuYjNtQgtuMT1w+3ZweCcVNWvuClP+2O3sZ+DBj+gj
        cUe4/VqN/9vvZJYAG9SzCSJD1GdhPZ74idhr
X-Google-Smtp-Source: AA0mqf6pUb7cpQuV7RQcp5C/KZJmyj05ogiyh3InBQq7+Y2Bdw0hxx8UHfS3/+mvPMw3iMnaQJV3Ew==
X-Received: by 2002:a19:4f0e:0:b0:4a9:e691:9232 with SMTP id d14-20020a194f0e000000b004a9e6919232mr2441328lfb.182.1668784832479;
        Fri, 18 Nov 2022 07:20:32 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id 12-20020ac25f0c000000b004948ddb4e4dsm690597lfq.301.2022.11.18.07.20.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 18 Nov 2022 07:20:31 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] SM8350 Sagami PMIC lane names & SLG51000
Date:   Fri, 18 Nov 2022 16:20:26 +0100
Message-Id: <20221118152028.59312-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
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

This short series adds PMIC GPIO line names to Sagami devices and
enables Dialog SLG51000 PMIC used for powering some of the camera
hw on PDX215.

Depends on:

[1] https://lore.kernel.org/linux-arm-msm/20221116123612.34302-1-konrad.dybcio@linaro.org/

Konrad Dybcio (2):
  arm64: dts: qcom: sm8350-sagami: Configure SLG51000 PMIC on PDX215
  arm64: dts: qcom: sm8350-sagami: Add GPIO line names for PMIC GPIOs

 .../qcom/sm8350-sony-xperia-sagami-pdx214.dts | 23 +++++
 .../qcom/sm8350-sony-xperia-sagami-pdx215.dts | 87 +++++++++++++++++++
 .../dts/qcom/sm8350-sony-xperia-sagami.dtsi   | 22 ++++-
 3 files changed, 131 insertions(+), 1 deletion(-)

-- 
2.38.1

