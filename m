Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA9F666E8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 10:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234582AbjALJqR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 04:46:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236114AbjALJpP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 04:45:15 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFCD2321A4
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:42:49 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id g10so12765214wmo.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=APTONcXVy6mFL8XiR1Brj8xVb3XOo1bNikIcdrPlIXo=;
        b=ux82gskbANvqzU550c4Z9IdtTLTjSds8gy8LmG/FTb+rsp/xSsNJGQfJZJ53Kc+lht
         mprfd356FcXQaY2geji9M0jYKKMes/hXk+fNyoXii0xotUnCna3BpZznwV9X/KgNKZuy
         IBXn1+srGRNmOPVOtTRApVcjLUp14MHT7FxjilYPhutbtYCqUbbtxoJa/yV4tSIrKfiP
         IJqUK38WyMpGweVMvf9D5ZO8cGM8X3gyqBnu7vdprT4VLbnqVxWG5F4KO9lMkFZNXQC3
         +cUZSmMlbvvQp8YEyoov7kOU13ymwmqHBZA/rsQ3fuexOWOA7HqFG7CTI2xHreD8N/Wp
         xA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=APTONcXVy6mFL8XiR1Brj8xVb3XOo1bNikIcdrPlIXo=;
        b=6bDUYppb1B0BoUkD71pooO2DHYJMS1Qpb6ys4HKbViYS5poDcBj9qFo0xFxBMBV9XH
         LFQMGoE+OtQEJCyfJJM3wHonpC/IPq4js3xHW5nyvImCdUJq9/HyHoGOUYM2mxZPsEto
         EuZxYYDpl3oLY8wn8d3uhF+KQAFBxPFkCnYzi7JFeHgA7+q1Kv2Co02a57Q89eTy41c5
         UtvDRvjdDNeKiAff+fMDtLazHvdWIfj2GCLxD68k6KoUoROjUlYXi9Cz73JndiAGmESJ
         F9nN04LUw0KwOS5tqNlZlDveVQhjnjxGAy3hbFt7NKrtHjhXYeY277fQM/+4dHmjsyHS
         jU4g==
X-Gm-Message-State: AFqh2kpHhPdruljymDFd1ed0cBXdNVkafxUE2xTfiabmfLTtgTsPesMT
        RdvvFaHZ0x7velKf8yXjQPCTwQ==
X-Google-Smtp-Source: AMrXdXsh0LaYn6p44zgaXlmjSPvY9d1ph54VA1Rmgm59igIox8+71XmTRkNh3mKKjODZ+rg1VCCZLQ==
X-Received: by 2002:a05:600c:4fd4:b0:3d3:4877:e556 with SMTP id o20-20020a05600c4fd400b003d34877e556mr57244794wmq.29.1673516568318;
        Thu, 12 Jan 2023 01:42:48 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id l14-20020a05600c4f0e00b003d96c811d6dsm28047649wmq.30.2023.01.12.01.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 01:42:47 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] arm64: defconfig: enable modules for Qualcomm
 SM8550-MTP display
Date:   Thu, 12 Jan 2023 10:42:45 +0100
Message-Id: <20230110-topic-sm8550-upstream-display-defconfig-v2-0-c29b9714c85f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABXWv2MC/5WOQQ6DIBREr9Kw7m8+WhPtqvdoXCB+9CcIBNTUG
 O9e9Aad1bxZzMwuEkWmJF63XURaObF3GYr7TehRuYGA+8yiwKJEKRFmH1hDmuqqQlhCmiOpCXpO
 waoNejLaO8PD6QydwkqK3NapRNBF5fSY+9xibQ5DJMPfa/7TZh45zT5u15tVnun/w6sEhKZ5Sl1
 jXRqJb8tORf/wcRDtcRw/V8i0a/QAAAA=
To:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the SM8550 DISPCC and Visionox VTDR6130 panel drivers as module
to enable display on the SM8550 MTP device.

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

---
Changes in v2:
- build SM8550 DISPCC as module as asked by Bjorn
- Link to v1: https://lore.kernel.org/r/20230110-topic-sm8550-upstream-display-defconfig-v1-0-9941c8083f10@linaro.org

---
Neil Armstrong (2):
      arm64: defconfig: enable SM8550 DISPCC clock driver
      arm64: defconfig: enable Visionox VTDR6130 DSI Panel driver

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230110-topic-sm8550-upstream-display-defconfig-deffeeeee051

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>
