Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB897BE4DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 17:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376816AbjJIPer (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 11:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376842AbjJIPep (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 11:34:45 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F655DF
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 08:34:44 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-405524e6768so45484485e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 08:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696865682; x=1697470482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALY9Lnunr5db7q3qvzbnZl3K+5+m0WgnB3YOM2cNc3c=;
        b=U5dMPCLFeBW+gQNwXC0lL/5mFGoequVC1tXdyhFwK0k3ONpevPplSSBIC1eEtxGjur
         ZhyOxqz7kW8uSjXMKP/07SY47iAI1GzmkVPDqYLItSsMzUKRsOQY7Ce6KuhzY1GgPGNi
         3UA27y6Ngm/yb9//v4cz05seMVWgPROTkWDyb8CYXJW+wyg+TnGkiSuo55vruMSk3UTV
         xMPQAo4ZqHOxy3GXdA7XJlKFVElXUYZt9zlJ6IUmQCT1+F7IX2ykYv4dNRgfYfovZowx
         Lzgr6gt5elr2VxbKqLcKSTvCwUhkBRWo3czHTAVfC2ehhBS1KUl8auKe/31Ke+4MyZby
         42Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696865682; x=1697470482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALY9Lnunr5db7q3qvzbnZl3K+5+m0WgnB3YOM2cNc3c=;
        b=GonLF+Pqf3GkwoJNYLk4FhBF24AjPw+xtTNlIJz55EgjrqdLIz2apdama1Bh171hRC
         5JCNy04lxQ6S+a31KclIGLlsup6l9O/YLxlDld2EAAp9AepqVyxBkSyWgJTwGcxtFoKv
         fRqVw8eSRMCSy8BfYaJaJSR0YYDKCvOOFEpmtULAPAoX7Ez73bn20uMPwEp4O10PW6PP
         mq3JoC+y8cDaB5JhWMa9DmhDA/xLFTTYr/+19m58e1wzNmxp1bUszdJ3BmrA4LzksA7O
         ezvCrnUvCKMIPGmg5FYNrz7SvRQwJ7Vv8Day6jvs8Zy3hKQZco5kyzdXbdJ7LlsDdQhy
         fC4g==
X-Gm-Message-State: AOJu0YwtUdt04ECIQI9lrrfsPqyXFZcuZ3OY5PaPRyDVbA8sU6VoRiIm
        t1sgCo4CmQrM5azKnFuQHrTJ2g==
X-Google-Smtp-Source: AGHT+IGfg4tN8OVm/Uv0hOiVhjVIt3rKwgD+zzMAu3rLsKW+sCrUPcY/lBvoMT8ujc86jhUTbapRyg==
X-Received: by 2002:a5d:4f8a:0:b0:319:7722:30c with SMTP id d10-20020a5d4f8a000000b003197722030cmr12432000wru.22.1696865682327;
        Mon, 09 Oct 2023 08:34:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f20d:2959:7545:e99f])
        by smtp.gmail.com with ESMTPSA id b3-20020adff243000000b0031431fb40fasm10016521wrp.89.2023.10.09.08.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 08:34:41 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 02/15] firmware: qcom: scm: add a missing forward declaration for struct device
Date:   Mon,  9 Oct 2023 17:34:14 +0200
Message-Id: <20231009153427.20951-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009153427.20951-1-brgl@bgdev.pl>
References: <20231009153427.20951-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We reference struct device in the private scm header but we neither
include linux/device.h nor forward declare it. Fix it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 7b68fa820495..c88e29051d20 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -4,6 +4,8 @@
 #ifndef __QCOM_SCM_INT_H
 #define __QCOM_SCM_INT_H
 
+struct device;
+
 enum qcom_scm_convention {
 	SMC_CONVENTION_UNKNOWN,
 	SMC_CONVENTION_LEGACY,
-- 
2.39.2

