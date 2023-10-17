Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DDF17CBF22
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 11:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343588AbjJQJ2C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Oct 2023 05:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343584AbjJQJ1v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Oct 2023 05:27:51 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4655E18B
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 02:27:41 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4083740f92dso434495e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 02:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697534859; x=1698139659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdHDDJZrqGKthAApkZq3pqc2t33juaudfCs0f3QX1GE=;
        b=h6uDKZn5+Im4boQCfAOI4kHRVc6oc2lka7WnZg/atM+Ex30VncPZ+FX1eMH1TVNAa2
         N0T5OKzO17A9R4ibJv0tpdC8PeC/OJffRSezODgxw5Qk2g//Dozdf8BU4bq42W18SuqQ
         WLJeX3giJf6NCSVwHfkJmC675SFt7vTVB1NVupYaZPtr8apO5eyKeGj7BL+RiAqusOIe
         JjpMP/AA932MDvMYYK7cEY2LcUKkD/jwJ0LW+7HIrjUpAsMIE5xAw90K2V2X3XapCN2a
         0C5WNHmWhr3xjpXsXUqHxP/794WAsTjN3T6GG/fINCy/lZ7lbZcIe+kafnGIruKMK/uB
         HTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697534859; x=1698139659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdHDDJZrqGKthAApkZq3pqc2t33juaudfCs0f3QX1GE=;
        b=e5anLWRUtJszbiuYxhIqeTKKTZ18e0baUILCmc5lyrCBOLaRRfOWIk9kXdicDfaHUS
         fWJSSxTlkpl4wJCgZZ4BsOZgskgYp6Wh8Xqs+tfKcVldmxqj6RQz08fTBkVaarqQ0zPv
         STSN+5pCXbavHhq5okp7eysyi/X+CIKSJJkaQafSbgWaCV2cgtwNsSDz/5kKv9X4Tjh7
         gp/ZQ8/qmqAfvoDpvOfJdQH/ywRUqc8CPZ915iPzRa4Kd0cZCTwiaUTR7/mc52RniHQr
         mcb4dGhpWaxXlKyHkmiWRKjhkjiO5Zvf9okVaUgxarbrx4kBDo9MUc34fkyMly+v2Jz3
         P0ZA==
X-Gm-Message-State: AOJu0Yw2wotRigwZBxNKTzLImZ1FwMUSJxCMp4b948/Ofuet9qmoLOxd
        Sh73q8HwrCXY5HGykxBUzymUzQ==
X-Google-Smtp-Source: AGHT+IEDwhrjWqPOqoLLCHRHroFyHYFz15ToEvnfJ2Aqo0CkGMKq+MaSnOQCPyCwv7zFi6Vs20XR0A==
X-Received: by 2002:a05:600c:1c24:b0:407:7e5f:ffbd with SMTP id j36-20020a05600c1c2400b004077e5fffbdmr1308315wms.8.1697534859229;
        Tue, 17 Oct 2023 02:27:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f1ee:b000:ce90:ed14])
        by smtp.gmail.com with ESMTPSA id j5-20020a05600c1c0500b003fe1c332810sm9460787wms.33.2023.10.17.02.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 02:27:38 -0700 (PDT)
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
Subject: [PATCH v5 02/15] firmware: qcom: scm: add a missing forward declaration for struct device
Date:   Tue, 17 Oct 2023 11:27:19 +0200
Message-Id: <20231017092732.19983-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017092732.19983-1-brgl@bgdev.pl>
References: <20231017092732.19983-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We reference struct device in the private scm header but we neither
include linux/device.h nor forward declare it. Fix it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
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

