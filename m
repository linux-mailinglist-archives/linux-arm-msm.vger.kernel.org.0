Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 174A15815F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 17:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239216AbiGZPGb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 11:06:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239418AbiGZPGa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 11:06:30 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2295A2BE2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 08:06:29 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id q7so1386077ljp.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 08:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L8Apz9DowpnJmV3tilsKoR+YHpsh9tSUQsZjGo8e1Bs=;
        b=phL43GnUIEQgfcbYkHvCTsGFzw9Jb9v8o+B6sgRF4rKE9xOYexRoEktZMUsiROzO9n
         HaTMvp7MND9WnhYHl+LzqnnfjcyLXmXpMzS+mH8kbzHNd2zaemjtXvLKJLYfsVya/wVs
         WIt1biVOpI7LLX0Uw4QsR9hr98g6E5pcrjL9O9wDdFTdNn8AGwoeVKV/LkFS0LJXnM2W
         JvmbjpN3Tp1tHVbKK2CUbd9loU8CprtvjR1JVfpy1OfqG4FPk3mh/LiimUglje4Yqh6q
         Ty/VFW32EnKmzDVfGa2OSbRJO2sYBbBoUbWgBLNHR8jvz26hws1Qfa1sBNj3GgymcvX7
         xmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L8Apz9DowpnJmV3tilsKoR+YHpsh9tSUQsZjGo8e1Bs=;
        b=qHb9HZ+cJ5imHQChWAWYsEakaVvrvnEUAdpZ1lSwteXLvSEAqJAlnWfpVzFzw3jLqs
         cw2mye/yVDZAedziu7A6MnZoay295QSi+3XHdohjHs3l+GABvQjZ2Qn999tjy2i1bYXS
         JaCIg/JynsnzM953l+ZVRXNEcvX/q/SQFCqs5kbC3wYYJaWDyvZKDcvHNGV0859h1k1g
         uR9Oj+YJt9ghMQ4k9YHV0Q5xLbjdaZan0JQjkBCWATgfvMK4Xkq12NYPljuW+eJkj98P
         McINqGWkaWDkhkU8YyZqGZZvhCI0jyunBjwC0znFRsN/zpsAfk6NMIkiD+8dSkk9FOQO
         /4dw==
X-Gm-Message-State: AJIora/vGrXyw6iFEZdyuZCPGgDnGyQn8KbHbkiOpdF+N6Hlia2lC1pf
        OmBI5W8mQskaLI5kn3/kVvqIvnlJPUIPXQ==
X-Google-Smtp-Source: AGRyM1uh8QCZ8tWnKbyBDXlp35q3fIe55T3WaNawh6V0R7a44PxWxGTlV2ZjlSqeayj1X4RxQ2imVQ==
X-Received: by 2002:a2e:a4c7:0:b0:25d:f06f:35f with SMTP id p7-20020a2ea4c7000000b0025df06f035fmr6215357ljm.399.1658847987141;
        Tue, 26 Jul 2022 08:06:27 -0700 (PDT)
Received: from krzk-bin.lan (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id a26-20020a194f5a000000b0048a95c16849sm836620lfk.282.2022.07.26.08.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 08:06:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Russell King <linux@armlinux.org.uk>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/5] ARM: qcom: defconfig: socinfo + cleanup
Date:   Tue, 26 Jul 2022 17:06:04 +0200
Message-Id: <20220726150609.140472-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Hi,

v1 from June [1] was did not hit Qualcomm patchwork due to missing maintainers
entry.

Changes in v3
=============
1. Three new patches for qcom, multi_v7 and arm64 defconfigs.
2. Add Rb tag.
3. Patch 5: resending although recently Arnd posted global rework.

Changes in v2
=============
Patch 1: no changes
Patch 2: new patch
Patch 3: resending although recently Arnd posted global rework.

[1] https://lore.kernel.org/all/20220623110535.177326-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

Krzysztof Kozlowski (5):
  ARM: qcom_defconfig: enable more Qualcomm drivers
  ARM: multi_v7_defconfig: enable more Qualcomm drivers
  arm64: defconfig: enable more Qualcomm drivers
  ARM: qcom: include defconfig in MAINTAINERS
  ARM: qcom_defconfig: order items with savedefconfig

 MAINTAINERS                         |  1 +
 arch/arm/configs/multi_v7_defconfig |  4 ++
 arch/arm/configs/qcom_defconfig     | 59 +++++++++++++++--------------
 arch/arm64/configs/defconfig        |  3 ++
 4 files changed, 39 insertions(+), 28 deletions(-)

-- 
2.34.1

