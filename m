Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F198424344
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 18:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbhJFQtK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 12:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhJFQtK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 12:49:10 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5DB6C061746
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 09:47:17 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id r10so10713652wra.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 09:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hWNwqs2rPHLNqzm5quN1YUDByI90jxJ6lWJ2+LUdERs=;
        b=CNvvixiV3yzUfWvu021sde1fOC8Ify4HFjb24mAKbtI8OzRBa+QlHpeoeEHBEofuiR
         1Nocw24IZaeJgJnPKCXrxt6UCnqjBVbCrITtgYXTJLs3Chl45kt+eVM1W2WsxSDyvvRj
         sCqTbfFEZAJlvgAkc+wGH5Klv2UiJPtTgMLQ9YeLZI3Y/Zxs6cV2GKWzIpkOyEu2P/nU
         pfkbGNyBwBna6BAiuKVXNvU95f/i1oAwLAgjNdbIHEHLR/MHgMRunb+8O/rNpFUGRlxo
         +La1FnmQZxNHBrRBN7LFJwi6uMbygPGRwF3HYzBbd6GkT28yH4pPXhRY1tDUqgOckHNW
         JoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hWNwqs2rPHLNqzm5quN1YUDByI90jxJ6lWJ2+LUdERs=;
        b=NKtjE5FZvQNREDmY/leM2MW6KiDOqpX26/x3TkkHkDo4nZJnaeU4mwoV8JEe91+HkX
         pK4ixegBfqwy84StdyG5iOycz8us30EFEP15z4pKB1kREq3E1KBaAYShJX2XHmQEALEt
         +6+KNa052rkJZHAAOBCLvaMgmOdPAr5Xayt1H0Szsu8jis7yEdbGNkIHJbbo0jkVeiFS
         hPU63kFlXfchkSaEY3OkoO2NfttEkBGMUTBw8ExQNP4FV/5pXRp/7Tb455m5P1FIyMpW
         DGprIKqZfKigaAORHMmjmxRHSApiBbBzMDfWBD+DiHxZZyNfC91ZL5bDtb6lfEx/OHDL
         pyDw==
X-Gm-Message-State: AOAM532gFOYv4zyPcD994PYKd3N4xa49eRA9ZyOTNNYtiB0YWQ7hKdq1
        ozxa07hqdczWEDgaE9TFC7xp7A==
X-Google-Smtp-Source: ABdhPJzmJ+jqY4LpsXYG8nLnU8YJezE3zVqnpIINNc9+KcyJg7wX/LgQfAlFNUL7FGwSYYvbyae6eA==
X-Received: by 2002:a1c:3b86:: with SMTP id i128mr10988462wma.132.1633538836375;
        Wed, 06 Oct 2021 09:47:16 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id l21sm6785165wmg.18.2021.10.06.09.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 09:47:15 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/4] arm64: dts: qcom: sm8250-mtp: Audio support
Date:   Wed,  6 Oct 2021 17:47:08 +0100
Message-Id: <20211006164712.16078-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patchset adds Audio support to SM8250 MTP using 
- WCD938x Codec for headset playback and Capture
- WSA8810 Smart Speaker Amplifier for Speaker Playback
- DMICs via VA macro for Audio Catpure
    

Srinivas Kandagatla (4):
  arm64: dts: qcom: sm8250: Add nodes for tx and rx macros with
    soundwire masters
  arm64: dts: qcom: sm8250-mtp: Add wcd9380 audio codec node
  arm64: dts: qcom: sm8250-mtp: Add wsa8810 audio codec node
  arm64: dts: qcom: sm8250-mtp: add sound card support

 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 191 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi    | 157 +++++++++++++++++++
 2 files changed, 348 insertions(+)

-- 
2.21.0

