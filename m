Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34ABD65C2B1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 16:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237767AbjACPEn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 10:04:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237412AbjACPEl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 10:04:41 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40CC711A07
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 07:04:41 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id jn22so32801718plb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 07:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1BwCBo4Zr8bJj5E25ZcOmbkv9a8SrGtxNJejHcEkMD0=;
        b=PPNgOUCoTmqp/7ScY0IUSjlEYQsIUI7V/Nfi3Iv3DOEofK3FkpgICi3GTFcaxSsg6g
         CnnN+kkr0H8Z6iNu32VTbDfRz/JHoZG0mk0L1qoCmxUWpHkR6UG/u3mXrLzch4PJiw8E
         jD+MSzAK2YwlI2hCkMHwn1fpB2DqTVb1mPA/9RpTW3qHgVLCPxbl4x+qtGbGX18c3PMM
         fPeuYTn20RY1VCP40yFC+zUjLE8ZHqdGWppIwzWFTgS88/CQbs9YxAFZji11ixXv6m2E
         e2l/zhrsORQdIHniO9miIcXEQV7ceX5RyyOPtN4jnGvvr3jQz51sFUzXhFK7qljGK9qA
         ytHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BwCBo4Zr8bJj5E25ZcOmbkv9a8SrGtxNJejHcEkMD0=;
        b=Ofl8EZfU6E9nIUr6C/AdFeQXVBNymj6uG3wjwKJNk3hyZc/RRHPTzS5mjUHyh7ZIcc
         DEQDEVqWvpcCQSKKWzv6byPkODqmEjqIH5YFHBWR2Zm+CfXam3HmNykXKp9lifrEWpVy
         Uby56guTtAM04QUegeuEVSPbOFoH/SjJ5EnNPA3G+OZtryEUnzHehmnkIO7VQIABjUD0
         Ikot69mTwFtIaFiX4ryf3WuLujxf4MsLMLfKv1Y0w5a7w2/kht9UOEj1DSjYk3yqMu6r
         Kxk0NBy3ahAwsl9A/2qPCkGIAFjL75jaDYhnS4QldHqBRhdziek1dxv90MRrw7lJ8bB2
         M4bA==
X-Gm-Message-State: AFqh2kod5C0+X747UCwjrJ67OLApIQ/FJo6xIC9+4/q1oW1stjnXWno8
        lyciCLl0amFnz3fc4kmcEMxgWmErMu47T2uHN9o=
X-Google-Smtp-Source: AMrXdXtZo5TvwTptDdiFgWJJjORv2RIeZ1ezX2qUKXTwZnE0UDOFQ94hXCRUeIlN5auemkOFhcKSVw==
X-Received: by 2002:a17:90a:fc92:b0:226:6b58:f427 with SMTP id ci18-20020a17090afc9200b002266b58f427mr9077052pjb.15.1672758280127;
        Tue, 03 Jan 2023 07:04:40 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c5e:e3b5:c341:16de:ce17:b857])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a0f0800b0021952b5e9bcsm20952300pjy.53.2023.01.03.07.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 07:04:39 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     quic_schowdhu@quicinc.com, agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@linaro.org, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v2 0/2] Add Qualcomm SM6115 / SM4250 EUD dt-bindings & driver support
Date:   Tue,  3 Jan 2023 20:34:17 +0530
Message-Id: <20230103150419.3923421-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v1:
----------------
- v1 can be viewed here: https://lore.kernel.org/linux-arm-msm/20221231130743.3285664-1-bhupesh.sharma@linaro.org
- Added Krzysztof in Cc list.
- Fixed the following issue reported by kernel test bot:
  >> ERROR: modpost: "qcom_scm_io_writel" [drivers/usb/misc/qcom_eud.ko] undefined!

This series adds the dt-binding and driver support for SM6115 / SM4250
EUD (Embedded USB Debugger) block available on Qualcomm SoCs.

The EUD is a mini-USB hub implemented on chip to support the USB-based debug
and trace capabilities.

EUD driver listens to events like USB attach or detach and then
informs the USB about these events via ROLE-SWITCH.

Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>

Bhupesh Sharma (2):
  dt-bindings: soc: qcom: eud: Add SM6115 / SM4250 binding
  usb: misc: eud: Add driver support for SM6115 / SM4250

 .../bindings/soc/qcom/qcom,eud.yaml           | 10 ++++
 drivers/usb/misc/Kconfig                      |  1 +
 drivers/usb/misc/qcom_eud.c                   | 49 +++++++++++++++++--
 3 files changed, 57 insertions(+), 3 deletions(-)

-- 
2.38.1

