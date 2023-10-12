Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB5FE7C652E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Oct 2023 08:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377203AbjJLGLo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Oct 2023 02:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377208AbjJLGLm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Oct 2023 02:11:42 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE49B7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 23:11:41 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5333fb34be3so1067815a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 23:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697091099; x=1697695899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ppJ4B6wV6jTM0MQAXJ6iEccEpXewdAwgjdYWp9JmggE=;
        b=DY0WuAs/1SI8stz9m6xzTHlx7fLFUMRWjBVTHwGY4EVA4Zt8y5UZWGqtwLkd4oNdOs
         5/Da0qZB56JrPfXIRVW9ydhrdjajSh59+fF+zmqvYPk/Qj3GvcqJo2YF4VcZ1TXBH/Uw
         dFyEjIBgEbqv2LJXqfj4bciCLeR210hGtWWBC6mjQFTcvB1AbnZr2ut9ZzbHDJ7oOKuz
         OaT3TN+i2TxAzWJ0dn16FON+Fv4xSnl+pvDyNJHAkdkQmsBqfh9s2r5xG//08sgCC+Qe
         9shcPtfnH6LzFL5IDaF5N25mL+BKUM1uWQIRT3qR2n/vSQ7wqoaCwTcUd5XpAPArsNZN
         5Ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697091099; x=1697695899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppJ4B6wV6jTM0MQAXJ6iEccEpXewdAwgjdYWp9JmggE=;
        b=unamBlGLKs7ntd+FCjX0hYFGnDSrWsrfowtMKNObg1OPna9FiDIk4YX8+PCSC3oL3U
         kCqHB5g5h5OdZFiTggXG1bAnPx7aE9WNre8vQdW4+d2nPsSsFN2PNjDYN9RuomGqXkso
         JgYtG7pEFOA/gP37vwOcMoXbeZ4aZV2vSBrOtgVq1XQo6FRA5HS4scuwzGHD2LiI4+j2
         UiPW+ZPNgmHlZGITXa5/mg8onfRbOqMva+HzsxVC4OYlsfR7VysJnEuQEyNrIufZnqXB
         r9qCf4MIJ0VEWieMgcS/fXjqL0nbdLSgfPeiipsetV8onA0xzZ67LvqUYY9t9OVz8TlW
         MjLQ==
X-Gm-Message-State: AOJu0Yx/vElgvGXB+FMQmW5YTtdhRLZEwpPsuGBJAV3P+I4wHnVmY30A
        +fj3FuCsSjohy0uUuTWPabHSRg==
X-Google-Smtp-Source: AGHT+IFW2HdWkgFg4nq5zOXzibMfn4Zy1TYGstWFJXQzaSmvsClAoPPc7VHnxkUI/cC5Quj5cmed4w==
X-Received: by 2002:a17:906:5188:b0:9b2:d554:da15 with SMTP id y8-20020a170906518800b009b2d554da15mr19095179ejk.38.1697091099414;
        Wed, 11 Oct 2023 23:11:39 -0700 (PDT)
Received: from hackbox.lan ([79.115.22.174])
        by smtp.gmail.com with ESMTPSA id s10-20020a170906354a00b009b2b47cd757sm10605730eja.9.2023.10.11.23.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 23:11:38 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Avinash Philip <quic_avinashp@quicinc.com>,
        Umnathi Chalicheemala <quic_uchalich@quicinc.com>
Subject: [PATCH] soc: qcom: llcc: Fix LLCC_TRP_ATTR2_CFGn offset
Date:   Thu, 12 Oct 2023 09:11:27 +0300
Message-Id: <20231012061127.95637-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

According to documentation, it has increments of 4, not 8.

Fixes: c72ca343f911 ("soc: qcom: llcc: Add v4.1 HW version support")
Reported-by: Umnathi Chalicheemala <quic_uchalich@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/soc/qcom/llcc-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 674abd0d6700..fb4085b7cb19 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -47,7 +47,7 @@
 #define LLCC_TRP_STATUSn(n)           (4 + n * SZ_4K)
 #define LLCC_TRP_ATTR0_CFGn(n)        (0x21000 + SZ_8 * n)
 #define LLCC_TRP_ATTR1_CFGn(n)        (0x21004 + SZ_8 * n)
-#define LLCC_TRP_ATTR2_CFGn(n)        (0x21100 + SZ_8 * n)
+#define LLCC_TRP_ATTR2_CFGn(n)        (0x21100 + SZ_4 * n)
 
 #define LLCC_TRP_SCID_DIS_CAP_ALLOC   0x21f00
 #define LLCC_TRP_PCB_ACT              0x21f04
-- 
2.34.1

