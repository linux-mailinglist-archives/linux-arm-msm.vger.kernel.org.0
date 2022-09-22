Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A30A5E5D86
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 10:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbiIVIbT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 04:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230371AbiIVIa7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 04:30:59 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DA3B8B2FB
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 01:30:45 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id o20-20020a05600c4fd400b003b4a516c479so832071wmq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 01:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=iiP5WxsmM08egN8Zd3VKahEfzDPV1pVkJseoPD9eLPk=;
        b=1XeTXPTpv4Xr78v9UwUnDaZpojwU8djR8O6eKC2fnCpUpkDZxKlWOszOtuiNqVqr1r
         HD1y0pA41bl5vU/U8FWrimTPG5kmi1mKGqGDGLn6KZKkD6xnNWgrVSn8vwWmSwYMMrZH
         MjOWKw4NCpEZEhPPjBGvUPV1WG5xGDvorxXAaDBvPEguvvoFWG8YeO+1kEYt3HumdOhj
         gyi9V8hqwnuMFZuhr0RvdammDzcGXHVN+m5XoWHFn8HrgFReFDqoOyeKr82V8+ehJZ03
         zPtrJ2SmJW1YS7h8gCrHExgDWBIRDWVqOZ0zuuQTpo+Xw++aVkP4KyUFniu95CtfJN51
         Su4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=iiP5WxsmM08egN8Zd3VKahEfzDPV1pVkJseoPD9eLPk=;
        b=qeb3gKGe3R5Ie6LadWmBYX8lhI0iiG8PcxiYT8tB6xMMQr907CKwe+q4LMvjBXr0Ep
         rjGSLROrDamP6WqN4gAiZdkYJ7qGI+3uKqyZdPday3c5eWmPL/rSxgYp3n5AL+1hBTKQ
         GknsZfCuKD3Ud4+UpVYkRyYC4Kc9yeOU5IeMQTpOMp3jHAfduZ1+LFDIY4mU87T6d56L
         wnFmHLq0KenKq/Is1dSRlItKJYW5bBpLPRWpuY5P4nczR3ctQ77CCq2EC4T+kwPSvrAs
         ajuBIEcnTTCBjVbgS/ebnNkAfr6uTBfLIcF3f+w/AV8O1BmE49jbOGyNEqCvAO6pwZEn
         WjoA==
X-Gm-Message-State: ACrzQf3NFkjWXzJcWLSvrT1MK2yDpBa+rZJXgW/NOMW7agzXUtm0bpFw
        5JrkhWsap33aKobaxDaHQhi5LtUnwoFnpQ==
X-Google-Smtp-Source: AMsMyM5xCD3bZ7cOaflNn8eLhKutB9PAFKoRpiFINooFLSQ6qEpA2ePRz+j9eOGWh8jpZqY4S49ssg==
X-Received: by 2002:a05:600c:4e94:b0:3b4:b416:46c3 with SMTP id f20-20020a05600c4e9400b003b4b41646c3mr1496005wmq.149.1663835443850;
        Thu, 22 Sep 2022 01:30:43 -0700 (PDT)
Received: from otso.. (212095005231.public.telering.at. [212.95.5.231])
        by smtp.gmail.com with ESMTPSA id q17-20020a5d61d1000000b00228b3ff1f5dsm5088476wrv.117.2022.09.22.01.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 01:30:43 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] soc: qcom: spmi-pmic: add more PMIC SUBTYPE IDs
Date:   Thu, 22 Sep 2022 10:29:23 +0200
Message-Id: <20220922082925.17975-2-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922082925.17975-1-luca.weiss@fairphone.com>
References: <20220922082925.17975-1-luca.weiss@fairphone.com>
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

Add more IDs that are found in the downstream msm-4.19 kernel under the
path include/linux/qpnp/qpnp-revid.h.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
---
Changes since v3:
* reword subject
* pick up tags

 include/soc/qcom/qcom-spmi-pmic.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/soc/qcom/qcom-spmi-pmic.h b/include/soc/qcom/qcom-spmi-pmic.h
index fde0148d0077..c47cc71a999e 100644
--- a/include/soc/qcom/qcom-spmi-pmic.h
+++ b/include/soc/qcom/qcom-spmi-pmic.h
@@ -26,6 +26,8 @@
 #define PM8901_SUBTYPE		0x0f
 #define PM8950_SUBTYPE		0x10
 #define PMI8950_SUBTYPE		0x11
+#define PMK8001_SUBTYPE		0x12
+#define PMI8996_SUBTYPE		0x13
 #define PM8998_SUBTYPE		0x14
 #define PMI8998_SUBTYPE		0x15
 #define PM8005_SUBTYPE		0x18
@@ -36,8 +38,17 @@
 #define PM8150B_SUBTYPE		0x20
 #define PMK8002_SUBTYPE		0x21
 #define PM8009_SUBTYPE		0x24
+#define PMI632_SUBTYPE		0x25
 #define PM8150C_SUBTYPE		0x26
+#define PM6150_SUBTYPE		0x28
 #define SMB2351_SUBTYPE		0x29
+#define PM8008_SUBTYPE		0x2c
+#define PM6125_SUBTYPE		0x2d
+#define PM7250B_SUBTYPE		0x2e
+#define PMK8350_SUBTYPE		0x2f
+#define PMR735B_SUBTYPE		0x34
+#define PM6350_SUBTYPE		0x36
+#define PM2250_SUBTYPE		0x37
 
 #define PMI8998_FAB_ID_SMIC	0x11
 #define PMI8998_FAB_ID_GF	0x30
-- 
2.37.3

