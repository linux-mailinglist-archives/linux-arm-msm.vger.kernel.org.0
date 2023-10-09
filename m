Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF1B07BE4F5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 17:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377746AbjJIPfz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 11:35:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377750AbjJIPfb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 11:35:31 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F1C131
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 08:34:59 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-32329d935d4so4247579f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 08:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696865697; x=1697470497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yU/L4mkVh98Gvp/+ieSh1ph2o5TQmVYw2ScTJAizm9U=;
        b=v0MwPdozqQjwqtvXnI0mYWXX3iB8tSjBKftq3ab+Aox3xV+sqOtiP13M57u/WcHJcq
         KvyAunYrMAahNKCnVKhWTSizUnIiVYoyptIW4jXkp2k6vS5Z+0cJvzUmH+UMQQcPW/89
         iLMruMFNsgR2k5/zpenlkPEnAFqZHwaPB0dKb733S1CIKIaOF0KCuvwG6VQlJQTmOG9m
         9+DxWVnb5EkKHpn+Xy8WHornMIo8Ra37QDqpVmKpFVxRVDGJI1K+afHq6CUtSDeHmdTB
         l9XMOwI3P+MegnTqJKsfkqk4/FAUDDt/zZU5VjLWrzgaYvsg7H3HfnYI3nc/5aXg6U/C
         cLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696865697; x=1697470497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yU/L4mkVh98Gvp/+ieSh1ph2o5TQmVYw2ScTJAizm9U=;
        b=KsFTCDDSPhAce0+zZJgUki9x9u+V2zze7lCKSj/en/kxsJNOBin/com3dlSRpbposW
         EX7bJ6Y7UoYSJmuM/4m1poQz2BEX3+WsqU3frQpMw/HPPzOFKQgxXnP0Q+9KYhXLeucW
         LYG1PrTVCw8qcWgOMvdueyB+1oWeIpVU+udK/bWDzR3fTNxLv24j/GzUB5GUuWsuu7vR
         xbwtACBEHLzhzHeAnFGj+qwpDMkOWtrnftQ5c7C7vS0MPeYQ+25gFuWE5IhTE6vV7Lai
         YTLG4c4ahg6AN8It28KGr0JHkt+C7icNpLI/wPh0x/k9dNp+kTn71LwabHO+b1hseceP
         gFwQ==
X-Gm-Message-State: AOJu0YyfHhzCiUuqfUxv+yxPFFhqDbVm5KXBr8Xcw7+ZH4tdcJi81EK/
        luAxS0Wf+9HXQABMmps+N3HA/g==
X-Google-Smtp-Source: AGHT+IHYcrsYv1nA5MYThjpwSuTukqOWDTcfUOtrCI/nJyTGzDEIOg2pbtM2LIVFV2JlyVtYlvoKQg==
X-Received: by 2002:a5d:54cf:0:b0:31f:ffd1:6cf4 with SMTP id x15-20020a5d54cf000000b0031fffd16cf4mr12817049wrv.12.1696865697570;
        Mon, 09 Oct 2023 08:34:57 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f20d:2959:7545:e99f])
        by smtp.gmail.com with ESMTPSA id b3-20020adff243000000b0031431fb40fasm10016521wrp.89.2023.10.09.08.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 08:34:57 -0700 (PDT)
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
Subject: [PATCH v3 14/15] firmware: qcom: scm: clarify the comment in qcom_scm_pas_init_image()
Date:   Mon,  9 Oct 2023 17:34:26 +0200
Message-Id: <20231009153427.20951-15-brgl@bgdev.pl>
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

The "memory protection" mechanism mentioned in the comment is the SHM
Bridge. This is also the reason why we do not convert this call to using
the TM mem allocator.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 839773270a21..8a2475ced10a 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -563,9 +563,13 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
 	struct qcom_scm_res res;
 
 	/*
-	 * During the scm call memory protection will be enabled for the meta
-	 * data blob, so make sure it's physically contiguous, 4K aligned and
-	 * non-cachable to avoid XPU violations.
+	 * During the SCM call the TrustZone will make the buffer containing
+	 * the program data into an SHM Bridge. This is why we exceptionally
+	 * must not use the TrustZone memory allocator here as - depending on
+	 * Kconfig - it may already use the SHM Bridge mechanism internally.
+	 *
+	 * If we pass a buffer that is already part of an SHM Bridge to this
+	 * call, it will fail.
 	 */
 	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
 				       GFP_KERNEL);
-- 
2.39.2

