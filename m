Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44E056576E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 14:31:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232614AbiL1NbK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 08:31:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230314AbiL1NbI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 08:31:08 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D52F5B9
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:31:02 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id jo4so38387472ejb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 05:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NTKU4hQGZwLZEDf90fSvXtHVV3p1bqrikxtaOtl5vtE=;
        b=Yy1xhtDXG9AhlZlv064T+ZQxYh/c8mnOIxeBnyRVgba9qntOTId0ot+bIZTm4j/Ho1
         cTrE72G92KDbT82M59QKgah6OOPkkgQJwgKyKy4BZwObg/EiLes0TgBbVi1ngyVKCnx/
         Qzsgru8zEGqlTHxVHlvdByTZb/QMb3ujV48NxTCt4OaFrYNGfBHdIEAYudskuBkkp5XJ
         ARG/hVotqKK0WmQhEBxTjKyVcA5zQTDRQ+ehFJjDmCnHyw4f+tnmhrshnWnf5LEbO3FQ
         pK1JaOjv+tt0rAVpDw8H+U5LxEtJ7T0EpuH11/CbQabC0EfJNRx6Agrv2Nljz5BKDTKe
         dikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTKU4hQGZwLZEDf90fSvXtHVV3p1bqrikxtaOtl5vtE=;
        b=ZqAEu7F6lcxZ8xMF2HmZhB1XMDy5hHTUB0PajXdIWUhx9LqKPthQO5NKspS/dGy5xB
         LJ1ja4YFeqwcp0fwOAYQSVVnmqtFJ+DSmTg8rbpovWWDAFOv8V5gwd2mOrv3p+1lB/PG
         8EcnlcXpm09Hnjs/WT986FdjojnTZCijg1iG45DPKdjjS+rtgOKr+EijhU74/FYnre4Z
         y3UaTuRV/G9fLEf3K78FmckGGE4kDBM8jtNWkIAyh+JGkmr+CWgL5F5DfMFoKUndMM/W
         FMv+5/7xd9BHWvAxxX4hPWa7JRG+eabt3gOMc8sJazyFvo33zFcAoOv8z3/WZMIyIicI
         63Ow==
X-Gm-Message-State: AFqh2kpXpqE6sifmOhHExq1JNhzF2NHvt6W++6CfMqyOquLE/1xIDYtu
        C8EdcYdqR2CtRVyvV8+WN4KqKA==
X-Google-Smtp-Source: AMrXdXsLqVKQxE3F2S7zJjROiP8PY+36IsJxF97o7BGhtvcebsFiGgfCtrvYh/8//j/3GChOIlR+vg==
X-Received: by 2002:a17:907:170a:b0:7c0:daa3:b4ab with SMTP id le10-20020a170907170a00b007c0daa3b4abmr22669862ejc.40.1672234261338;
        Wed, 28 Dec 2022 05:31:01 -0800 (PST)
Received: from planet9.chello.ie (2001-1c06-2302-5600-85f6-04b5-1651-3b6c.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:85f6:4b5:1651:3b6c])
        by smtp.gmail.com with ESMTPSA id j15-20020a170906094f00b007add28659b0sm7541393ejd.140.2022.12.28.05.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 05:31:00 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     cw00.choi@samsung.com, myungjoo.ham@samsung.com,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        agross@kernel.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v4 0/2 RESEND] Fix pm8941-misc extcon interrupt dependency assumptions
Date:   Wed, 28 Dec 2022 13:30:56 +0000
Message-Id: <20221228133058.213886-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
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

RESEND December 2022:

Hey Chanwoo could you please pick this up ?

RESEND September 2022:
- I thought I resent these at the start of this month, can't find them
  in linux-msm I think I just sent them to myself.

  No change since July 17th

V4:
- Added suggested extra log text from Marjin to extcon patch

V3:
- Adds a cover-letter since we are now doing two patches a dt-bindings fix and
  platform_get_irq_byname_optional fix.
- Add Review-by -> Rob Herring, Marijn Suijten
- Add additional patch to negate warning when one of usb_id or usb_vbus
  is not declared in the platform DTS. 

Bryan O'Donoghue (2):
  dt-bindings: pm8941-misc: Fix usb_id and usb_vbus definitions
  extcon: qcom-spmi: Switch to platform_get_irq_byname_optional

 .../devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 12 ++++++++----
 drivers/extcon/extcon-qcom-spmi-misc.c               |  4 ++--
 2 files changed, 10 insertions(+), 6 deletions(-)

-- 
2.34.1

