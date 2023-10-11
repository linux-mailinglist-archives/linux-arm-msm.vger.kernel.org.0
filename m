Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77EB47C51B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 13:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234771AbjJKLUJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 07:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346311AbjJKLTq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 07:19:46 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A0B8139
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 04:19:39 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50306b2920dso1018144e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 04:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697023177; x=1697627977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SEU5TbVguFH93i9AbJAYWdP6I1h/HvxxydF4GjbEquU=;
        b=AMPXccAO18o2+1WNmqDBTjAy0ySIZzoXmny2b04eL2Fj18/A9Cqs3Po8DHuAshjPLh
         Irf3o0nZx32FD+g/KdH4GCiYst9S+QWpy058pAya9AA2OPS2WpHYprRZJPTrmHAL2gM8
         Po8OPC0iwrSkZLNwnBOgLvxBD6CUM/C2kb8jGRfWg6TBBlWzGMZZqxqhCRnaNOlc5DCn
         M9r/34dEvDhArMGZlJZIE982+VsTue2TwqTloq0L43NvvuIXxaALwZMVNbuHJW/j96U2
         81J7n+2ABdlYe9GhHDVDbOCFMyeXzeaYfGomrCzYxGvnrr2VLE8ewelwwj/FZtzKmhBS
         eg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697023177; x=1697627977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEU5TbVguFH93i9AbJAYWdP6I1h/HvxxydF4GjbEquU=;
        b=mom55t3Xt6TJElvxG8fr7obVC0cyM2X98EzTbxD+OmU2rSMqS1bsCGej1Q+CcEDboG
         +KbcQruU4QY/oj4LcJk1ZKni1sDe/hJaRP+j50wcEBLl1nexVdC4iTihCLbLbWD5+6MA
         cwYv8pjdaQ8JT5XE12LXkv7ogtwAfN3YKMFUNGQzZk+PTv3WKR0BSQKqXlZAbg83YA7o
         tazrydEVoZVnuSv0dMhoLWYE1dcvEtYFrs0EX83IIrm/zYdgF2SklGw8acQrjoui9IiY
         6qnm6tqpZXD+LzgTB0aO0vE4KbkuBYQKQyak33c0eFsbjMmnXFI/nAj4eL95z40b2xyI
         uBUQ==
X-Gm-Message-State: AOJu0YzXlVRNBWcAe5HZbpFr5Zruz9eQcChvBPLPcj+hFqjOEPs/Zya0
        1gTHnVu1I6lxo/2aFkVbHnDIIg==
X-Google-Smtp-Source: AGHT+IE3m6pdd/+/IPVcy0g8ykI0dZoyK/2b7Xi55/kspO/SFrB8ww/g1xkU8wH5zwNf/zhyHnuauA==
X-Received: by 2002:a05:6512:745:b0:4fb:7d09:ec75 with SMTP id c5-20020a056512074500b004fb7d09ec75mr12249372lfs.4.1697023177131;
        Wed, 11 Oct 2023 04:19:37 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x15-20020ac25dcf000000b0050451e663f1sm2213511lfq.28.2023.10.11.04.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:19:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: pad sa8155p-adp DTB file
Date:   Wed, 11 Oct 2023 14:19:36 +0300
Message-Id: <20231011111936.165581-1-dmitry.baryshkov@linaro.org>
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

On sa8155p-adp platfor the bootloader (ABL) fails to reserve enough
memory for updating the DTB:

Cmdline:  console=tty0 console=ttyMSM0,115200n8 androidboot.verifiedbootstate
Error adding node
Error carving out UEFI memory: FFFFFFFF

Adding `--pad 1024' to DTC_FLAGS for this board fixes the issue by
providing enough empty space for node creation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

This replaces my previous attempt, which added DTC_FLAGS globally ([1]),
which was rejected.

[1] https://lore.kernel.org/linux-arm-msm/20231009172717.2695854-1-dmitry.baryshkov@linaro.org/

---
 arch/arm64/boot/dts/qcom/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d6cb840b7050..606ca0d97cc2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -96,6 +96,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
+
+DTC_FLAGS_sa8155p-adp := --pad 1024
+
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
-- 
2.39.2

