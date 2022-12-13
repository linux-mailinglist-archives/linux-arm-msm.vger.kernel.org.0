Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 118F064AC51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 01:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233584AbiLMAYv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Dec 2022 19:24:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233749AbiLMAY3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Dec 2022 19:24:29 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8330D4D
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 16:24:28 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id p36so2278560lfa.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Dec 2022 16:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9OYPRB13/T9645hxK45S8/AOVDaZNBY2N/JhZ5Na+fM=;
        b=WEt7/Ulk8epQVvSMo9q4Rf/AtjSbJX5WQQuEyzjKRrHkDinXoZ01MBxYI1qJ1MlBMK
         QLVFC3VnNme0cNx4My5+HqVKV7bsMc3qM5f0lsL4DwfPhRTXLxzeCeOSC/Co6Fi9xiU+
         oa4YnvViNnHH8YGnRyOjvHs1EicwL2Z5fh9leFsnrgwtPdhUX4qxegCUTfw5V93zC5hc
         3e6rh49O1Lv+7MOSMRVlHAcd4nZ5xOWoYGGqWTXBe7nZgw/Nm5+lZ6k8XUwrRxbjdGvw
         NSROtfDgyNv06HHsDWnF/4xndKA5ZYLvWNu0FjjQgVlbgdDvitBbdohxqaFDYT6p1us+
         ycWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OYPRB13/T9645hxK45S8/AOVDaZNBY2N/JhZ5Na+fM=;
        b=DFzBXyagXuUq4uGrtsTvhikoVAAWF/6+EnEkyUvEBlxcQ4xFha4btojeAa0TfWziqJ
         QRxuI0rVsHNb9HW265SRKRBDRC1IEC7XZyHg7I0CRL1s1BdZfu/kVWP4C7SxqoYfd3K1
         gy0alptr3ZlvqjZeL1tQZUJTxWCaKwWMrX7yPJgC3gpMoM0vQkx5JJn0KYl8kylEO63u
         TqNiiZDMFgglYn1g2PsNOAaOLrgNISx4NNWmyYVnhWjkOb/9ER49dNvxUBCCcS+JVRR7
         BlnTphi67xLzQdje+xCsxj/vMGPE8ITFdHhgMhlulqgIlLOnqGIshsJTBXZsAl2U1/ot
         QLCA==
X-Gm-Message-State: ANoB5pkfpdt3Z6vFJdp/DaJ/DysiBy6xlF+p7rg4zgz8i9W1rjikOeye
        BV1enpb/tn1gN9GV/ldlU5Y3GkFGr3cSqo8L
X-Google-Smtp-Source: AA0mqf5Qercx9wZmgrNyj2EDlwF4j37xAv8lylghiNLUTwsr5BmHT/6GsqUET6ZsFlH1mlAbQKjwMg==
X-Received: by 2002:a19:4f18:0:b0:4b1:6b07:d4ff with SMTP id d24-20020a194f18000000b004b16b07d4ffmr4768715lfb.48.1670891066958;
        Mon, 12 Dec 2022 16:24:26 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id m23-20020ac24257000000b004978e51b691sm137352lfl.266.2022.12.12.16.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 16:24:26 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/7] SM8[12]50 GPU speedbin
Date:   Tue, 13 Dec 2022 01:24:16 +0100
Message-Id: <20221213002423.259039-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
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

This series brings SM8[12]50 (A6[45]0) speedbin support along with a
touch-up for 8150, allowing Adreno to cooperate with the display hw.

Tested on Xperia 5 II (SM8250 Edo PDX206) and Xperia 5 (SM8150 Kumano
Bahamut).

Konrad Dybcio (7):
  dt-bindings: nvmem: Add compatible for SM8150
  dt-bindings: nvmem: Add compatible for SM8250
  drm/msm/a6xx: Add support for A640 speed binning
  drm/msm/a6xx: Add support for A650 speed binning
  arm64: dts: qcom: sm8150: Don't start Adreno in headless mode
  arm64: dts: qcom: sm8150: Add GPU speedbin support
  arm64: dts: qcom: sm8250: Add GPU speedbin support

 .../bindings/nvmem/qcom,qfprom.yaml           |  2 ++
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts       |  5 ++++
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts       |  5 ++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi          | 30 +++++++++++++------
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 23 +++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 30 +++++++++++++++++++
 6 files changed, 85 insertions(+), 10 deletions(-)

-- 
2.39.0

