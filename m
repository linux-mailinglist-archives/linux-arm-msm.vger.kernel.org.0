Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A10473633A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 07:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjFTFkr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 01:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjFTFkq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 01:40:46 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C11210D5
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 22:40:45 -0700 (PDT)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 854263F149
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 05:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1687239642;
        bh=eKxatBk/Yyq4Kcp78eUZOCU8RQk/O3McJworAZUfA7k=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=T5Hp33hp8sH8SB+GtVt0lOk0HFqlLnOo1+aPARMJpjk7wxa7PEJpw45sl+lkPIaQF
         EPGIeIC8vC4cNgPIPkmn7xibVTIAY8EoixypLlfE9ZHGBaSZrepobxPNeGP9DdKOyW
         wwXQ9XlTumC3GTvtA5UdekeOTOIVCZU8pXv6UIVeLy/Hm0da12QfSdFoVr0UK/DLQ0
         Z7a2J9TWSReZa7RYdDOz2msZYntc8bzcyMZfkycIL2Hjq1P8D6iYZxj6x2XsZtZxuD
         AjmUJONcyayrrASxU5rpDOP1D/cNfOiRJCNln4bJUzdjmNHef2FZHRjUqTcu4JrZ1N
         b9igdkakSF0kg==
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-4ec817fb123so2655426e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 22:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687239641; x=1689831641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKxatBk/Yyq4Kcp78eUZOCU8RQk/O3McJworAZUfA7k=;
        b=XhcyEweTW0NH6xIRkT5ZoEI6eX/ovGX9hkcmGOZG4QpeydWcPClfEa/LkstwN0W0l+
         wij5E526BVgDHHyMFnIASWEgY0q5Ld+8xqowCHu5xnIB+F+4FDatMa5S8jHv0pOvvypq
         vFoSRekWNsU62Q0KXSjl6mtrSwaOVg6SQkCl2plnk3OuYL5q4OfdftEivL53XMrKBAM4
         BVcbuWvzEy2PxF2uiHbjR+dOXoytxw8nK947UycyHiix2eYEpI+ms+udjpJwPv1LICr1
         nGfbMozFabKF3kYo89oQTBa6xghTDmu1piBZG3Kv4ZoBuYTy2zLurf4Le6Rzfb9OSMPQ
         GkTg==
X-Gm-Message-State: AC+VfDy55zZLTl+uW4ifu28xdJM+TtI/tPRlGu4y7tlqY9HjwsaOYLMR
        YHjBl/zrxQp2TeVtawaO71VrI6iK5iaRHAmyENPQUyIlNM1SUkU1Lr8C7VkRZ0LvhV/TnNtM5bI
        Pw5qfOzOFhQmwcF6o1t6T75Q5CyumAAYxMMfVpeeUBG0=
X-Received: by 2002:ac2:499e:0:b0:4f8:6f40:4776 with SMTP id f30-20020ac2499e000000b004f86f404776mr2610356lfl.46.1687239641134;
        Mon, 19 Jun 2023 22:40:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7mAmYRUNcTRvaEpgafMNWbpCh84NFbi5qKXny7yAHkhYQctNPgq9IskSasfT3ZfXza5M/jjg==
X-Received: by 2002:ac2:499e:0:b0:4f8:6f40:4776 with SMTP id f30-20020ac2499e000000b004f86f404776mr2610336lfl.46.1687239640866;
        Mon, 19 Jun 2023 22:40:40 -0700 (PDT)
Received: from localhost ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id m12-20020a7bcb8c000000b003f7ea771b5dsm1433746wmi.1.2023.06.19.22.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 22:40:40 -0700 (PDT)
From:   Juerg Haefliger <juerg.haefliger@canonical.com>
To:     juerg.haefliger@canonical.com
Cc:     airlied@gmail.com, daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        joel@joelfernandes.org, johan+linaro@kernel.org,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com,
        quic_akhilpo@quicinc.com, ribalda@chromium.org,
        robdclark@gmail.com, sean@poorly.run
Subject: [PATCH v2] drm/msm/adreno: Add missing MODULE_FIRMWARE macros
Date:   Tue, 20 Jun 2023 07:40:31 +0200
Message-Id: <20230620054031.1203960-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230616122815.1037425-1-juerg.haefliger@canonical.com>
References: <20230616122815.1037425-1-juerg.haefliger@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver references some firmware files that don't have corresponding
MODULE_FIRMWARE macros and thus won't be listed via modinfo. Fix that.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>

---
v2:
  - Drop addition and removal of zap files (needs more discussion)
  - Add new a690_gmu.bin
  - Update commit subject and message accordingly
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index cb94cfd137a8..7c1f9a844009 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -397,10 +397,21 @@ MODULE_FIRMWARE("qcom/a530_zap.mdt");
 MODULE_FIRMWARE("qcom/a530_zap.b00");
 MODULE_FIRMWARE("qcom/a530_zap.b01");
 MODULE_FIRMWARE("qcom/a530_zap.b02");
+MODULE_FIRMWARE("qcom/a540_gpmu.fw2");
 MODULE_FIRMWARE("qcom/a619_gmu.bin");
 MODULE_FIRMWARE("qcom/a630_sqe.fw");
 MODULE_FIRMWARE("qcom/a630_gmu.bin");
 MODULE_FIRMWARE("qcom/a630_zap.mbn");
+MODULE_FIRMWARE("qcom/a640_gmu.bin");
+MODULE_FIRMWARE("qcom/a650_gmu.bin");
+MODULE_FIRMWARE("qcom/a650_sqe.fw");
+MODULE_FIRMWARE("qcom/a660_gmu.bin");
+MODULE_FIRMWARE("qcom/a660_sqe.fw");
+MODULE_FIRMWARE("qcom/a690_gmu.bin");
+MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
+MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
+MODULE_FIRMWARE("qcom/yamato_pfp.fw");
+MODULE_FIRMWARE("qcom/yamato_pm4.fw");
 
 static inline bool _rev_match(uint8_t entry, uint8_t id)
 {
-- 
2.37.2

