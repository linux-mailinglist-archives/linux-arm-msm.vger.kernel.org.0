Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1CDE72E4F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 16:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242758AbjFMOEH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 10:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242723AbjFMODy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 10:03:54 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A511FEE
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 07:03:33 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f8c5d0b216so7661525e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 07:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686665012; x=1689257012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ak6pJEE70i86/FySUfYrSS2au3HzGmo13oLp85+Of0E=;
        b=JWFrVCzyLFy6CqPFmqqcXfRWl/ZeOmY5cAPxItitCG2GSxUYodXCoIkvJp5mVCPmmu
         SgjN48AopiP0g+o1PXNPG/iDxVgiFf0RY7H3UD/i79TL1cHXtabZwHznOuN699NmW4jP
         ai3/SBOa2DRoF6COQXHCwYy5kQUVWV4LN6DZR0LmVxFwx9suEqRFy7WCBYzH5GAbekIV
         ZClivZunzCVkjpPjJ6ipzbL29xa0Oyb0WkiSCAmv4LNOrn3gIGvJ1g6KHjsay6CdvJNj
         9V5z3NPmHYGqm/ZL0bSIqyFb8S/x7PmIik8JfnpwLoVnf8EwvGonu4wgjed1lmYKedUj
         APDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686665012; x=1689257012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ak6pJEE70i86/FySUfYrSS2au3HzGmo13oLp85+Of0E=;
        b=NqJZCdtxchR4jtFuXGBRfRWek02y/SNOC02SQ6ZBFX3y3m64vKNG7BDsgJqd4VfEsE
         GumrL/q25EjSwlhJxJ34edyn6iPPxEpeis1JygWCvnDMCQUdHWuAI/z+U9oMI9MN6XSm
         1x+XpupTHjH9D8xHo6Wz+KiMDKJj8SArsls4V/pYOYXEsc8XK5XiOAMqwWF/DXu624Wn
         qCVVDjxQCSZGATBMHhdyePtfqPSX48toP9f9YcIGyPY2hUUGTUuKhtCSQkbVix1V2whj
         D+7g3NkpQr1aME2G+rNs+sYr3RKNo1whd5NFo0oZE1bCAUTPEQj8Mu0WgmHDIlRvPRg1
         Nn1A==
X-Gm-Message-State: AC+VfDzdqq4SvW2iIzgnE3vD5nlkKXKnPPm5eHnN/5Kk31Ggy49Gm4fL
        Qf4APGA5x12+bA3v4g6Bmqq0SNNNlwKfk4whDGM=
X-Google-Smtp-Source: ACHHUZ7aKpFKuiZWnq2Ux5sIXUigwaKgfMGsH6NF903Bat0KexP0k974tF3Z6crgiEpYTpBS5/Ei5w==
X-Received: by 2002:a05:651c:117:b0:2b1:bd37:e7e1 with SMTP id a23-20020a05651c011700b002b1bd37e7e1mr4850383ljb.32.1686664991733;
        Tue, 13 Jun 2023 07:03:11 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a18-20020a05651c011200b002b32af2e9c6sm901490ljb.116.2023.06.13.07.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 07:03:11 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 13 Jun 2023 16:03:02 +0200
Subject: [PATCH v4 02/22] soc: qcom: smd-rpm: Add QCOM_SMD_RPM_STATE_NUM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230526-topic-smd_icc-v4-2-5ba82b6fbba2@linaro.org>
References: <20230526-topic-smd_icc-v4-0-5ba82b6fbba2@linaro.org>
In-Reply-To: <20230526-topic-smd_icc-v4-0-5ba82b6fbba2@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Leo Yan <leo.yan@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686664985; l=664;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=XHE1WQYZzaLo+c3xD4ALM/GRb1VwY7GuxNqpdL0mBnk=;
 b=0hu2uLKM1PKnDIKpu/TRmCfDjaloa6VaYIarEIKVnJ6/AzAc22Wjp6IAZQP9iZX+VdG/ATjf4
 SW+4bjBHbRJCKeF4inUFUocAzhieblB734hHD8cQHgVjsJSJbqEF9e6
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a preprocessor define to indicate the number of RPM contexts/states.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 include/linux/soc/qcom/smd-rpm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
index 2990f425fdef..e468f94fa323 100644
--- a/include/linux/soc/qcom/smd-rpm.h
+++ b/include/linux/soc/qcom/smd-rpm.h
@@ -6,6 +6,7 @@ struct qcom_smd_rpm;
 
 #define QCOM_SMD_RPM_ACTIVE_STATE        0
 #define QCOM_SMD_RPM_SLEEP_STATE         1
+#define QCOM_SMD_RPM_STATE_NUM		2
 
 /*
  * Constants used for addressing resources in the RPM.

-- 
2.41.0

