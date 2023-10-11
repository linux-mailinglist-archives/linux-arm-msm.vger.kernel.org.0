Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2097C5029
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 12:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346106AbjJKKcx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 06:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346072AbjJKKcw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 06:32:52 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66FE898
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 03:32:48 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50437c618b4so8427561e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 03:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697020366; x=1697625166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7QIeMMhcSryQxmA+otjPSDtQCoEfBMg1N+BkKe5wFu8=;
        b=uNJtxGnVeBnjSN2RO5hwudMh/nyZiWej5RqaiLcUbuVGIhTvyDZARfqMNBe27XQvl5
         80yi9mtFAtEO92WhNiSJ4VW1HsuQTsHjfDfOc41lUCKynbRlPYWDzwh7+rEWgqCitXN/
         w7RRhS+XkXo6UwL9fKMoeewcd1oTaV9i53qD6Jfxf6Wh/W4N4f70bCA/mZWnX2X5p5Wv
         PvTHHLQ3xbQzun0DVXuctHJBAKV65hnvXGEV9rBf7CyN8dU9mAhNsLpnArn5cRnUsZeE
         Efzhk/ySyKN/y2BMMyJ6jcYRuD4o0Iml07e4u9LRKyHNaLYLMmArW1WP9vExWMKEM2Rh
         A/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697020366; x=1697625166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QIeMMhcSryQxmA+otjPSDtQCoEfBMg1N+BkKe5wFu8=;
        b=PIR/tYD5QdAgQPkhXI31uNpBkQlVOt67fCb8s2OCqp13X2mdjQIQT12jmtyiiMMqXF
         EC0Oo4rCrq8LnrRhou1ibHmN3wIYgkgUSDBzShroiKP+sZ94qyE9LKucDNOnT6ehfPZ3
         Zam/GOcEgfnSBK1EYFmk72zu1kqJPRO8KTXIetNFgaGpB9UkKohxL2NLdt9Crnu/p+pU
         U3D1IgAXk0CZhrkencAlCrOYn6aoSGaJ+ixALxHYpYH/wMtActbPP5Y5GtvWAnKqiFwk
         HuSX0oCkeJaZbxrfCED88KYrCyBN/8K5FjDzPjhQy2UKk4Q1cYcNilLNt2yo5OiPzgFp
         S5rw==
X-Gm-Message-State: AOJu0YwvbjjH++IOQRwHWFvG4qhOQ93btquu7I63WtnlWFLCjUIUDg64
        I0XsF8H8mk0czqipvrGLLGGKqw==
X-Google-Smtp-Source: AGHT+IHmLHvAYx0QiL4fcVA1D7OPFE9bl/LdZFHcwQ9I74wF7LYRU/CP4cqEDFylwCc+p50yCTmL0Q==
X-Received: by 2002:ac2:4e87:0:b0:503:3816:c42c with SMTP id o7-20020ac24e87000000b005033816c42cmr14877373lfr.41.1697020366012;
        Wed, 11 Oct 2023 03:32:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x2-20020ac24882000000b0050574829e48sm2195517lfc.298.2023.10.11.03.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 03:32:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 1/2] arm64: defconfig: enable CONFIG_TYPEC_QCOM_PMIC
Date:   Wed, 11 Oct 2023 13:32:44 +0300
Message-Id: <20231011103245.96638-1-dmitry.baryshkov@linaro.org>
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

Enable Qualcomm PMIC TCPM driver, it is used to handle Type-C ports on
devices like Qualcomm Robotics RB5 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 07011114eef8..9509a73db774 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1042,6 +1042,7 @@ CONFIG_TYPEC_TCPCI=m
 CONFIG_TYPEC_FUSB302=m
 CONFIG_TYPEC_TPS6598X=m
 CONFIG_TYPEC_HD3SS3220=m
+CONFIG_TYPEC_QCOM_PMIC=m
 CONFIG_TYPEC_UCSI=m
 CONFIG_TYPEC_MUX_FSA4480=m
 CONFIG_TYPEC_MUX_NB7VPQ904M=m
-- 
2.39.2

