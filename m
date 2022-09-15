Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CAA45B99B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 13:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbiIOLgI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 07:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiIOLgA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 07:36:00 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 381B59A9A2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 04:35:59 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a26so12718236ejc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 04:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=d1PF4A4boDjofVzPABAZCXmsEh3HYlGwljIdr1GvZSY=;
        b=otFuK1b0JYh824F62FadqTGHIlSv28ORFGj0Po+O5iD4qf/XgeaA1TBuw5AX+BvMX1
         S0zbhI1+R5Zv/fazlRyvkjWZpSoatyoievQ/ZlnlTl2son/8Af0xNHSMGcg4rxh1gvMK
         QQW+8YukXq5F2H8dftQlqSF7ouXyxB4qGZzI64IwI3mqYhk6pYwTqaMhwEpA2awQvmd1
         Cju+K2AI4ZzdqjrxizSSoE3CJmhUZzm6x4gBlOxc2irPdpPcb7kcIV5XaNag9ZCtAdKL
         nuDO8DxvuO7dYLlwkkzlmuW8FzWIYyf2WpF5N+BZyrRnYxBwHJA+3Ih9prqfWyGtE/Mg
         3gPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=d1PF4A4boDjofVzPABAZCXmsEh3HYlGwljIdr1GvZSY=;
        b=DcBqJIN/MzcqDy0ofDAsn4vn4DneSnxS39Sbl8blrSJNm7Mdqh+oQUuPB8yDiaFRs0
         uV5NrMBkxdj+AWL3FpjLyRxZhhO8jJf8GfUQlpcWQfVAVZy3O2tS3mx7/5a2HmPR9MhW
         dmJA5ngOZSExo48V2I+AGWIMtNW4KVwYLnZGKtLATCkDLjHb/RtBAGWSNvMAoZMgBUaC
         Tx8GWYFHvJ33gLUDTGVf+PrJqkNkqMC+eCtZWfkTF2R0BP9mb0sltYOCkHg/0PKy4ZJU
         fyeam6K/4k9WbQCIohdufMC84WUBHtdgxhoQ7+wGQ8BzvPUSOtwwrPIzCu+pmnkyoSsM
         BmnA==
X-Gm-Message-State: ACgBeo2CaUGeJytIKO37cysm61xUli0rCos81aEIiWbReyq27s1V4W4/
        KYL76wgDGF/BBnudde/eT7ma5WzSfdAwJA==
X-Google-Smtp-Source: AA6agR6uIndMgHYkaS4uybZJbwSLEfFeKw1jYmyds8Mv50OPSJUBarei9PR9ooqlse+45+4k5Lx9Bw==
X-Received: by 2002:a17:907:9603:b0:742:9ed3:3af2 with SMTP id gb3-20020a170907960300b007429ed33af2mr28653453ejc.510.1663241757579;
        Thu, 15 Sep 2022 04:35:57 -0700 (PDT)
Received: from otso.. (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id fi24-20020a1709073ad800b0072af4af2f46sm8910424ejc.74.2022.09.15.04.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 04:35:57 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] mfd: qcom-spmi-pmic: Add more PMIC SUBTYPE IDs
Date:   Thu, 15 Sep 2022 13:35:21 +0200
Message-Id: <20220915113523.44074-2-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915113523.44074-1-luca.weiss@fairphone.com>
References: <20220915113523.44074-1-luca.weiss@fairphone.com>
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
---
Changes since v2:
* Convert hex numbers lowercase
* Remove SMB* IDs added in v1, given it's not sure they're actually spmi
  pmics or just i2c pmics (keep SMB2351 because it supports spmi)

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

