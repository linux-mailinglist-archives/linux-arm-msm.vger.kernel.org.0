Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6106B7DF15E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Nov 2023 12:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233842AbjKBLmX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Nov 2023 07:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232731AbjKBLmU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Nov 2023 07:42:20 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F8D1B5
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Nov 2023 04:42:09 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2c6ec78a840so11176341fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Nov 2023 04:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698925327; x=1699530127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8dxEzYVSeFJZ3l8QowPz73oS6HbY0588zpxHkYzDJg=;
        b=lwZ2wSukMRBt/CLG/aWjyFNeWERxJerHRKZYwihDEsEfpaygbKp/n22F6n+9U+w3Q1
         rhJaTFpw3C3FcD+jBbntZXVVGnDRxfY+4dmY3X//nODWK2+mRGshIS65rQnyszQF99Zu
         fcfIiW0O5/hs2xCgtk8lokdctNe1tXEVK0fAM/vmKr7p11PIPW4Z4k/TuhGEHCjB2DPu
         xhtnBlLHdMsl1ajV1GJGn0HUIFdsJ/vrKDop8TZ6483IOxl2URHz2numKP4rCWXXjGAD
         R7HMtzyxhDyOpOWefwnm1myc+l7tKXzY/QkuTCfIoDNJ1opn2c2+QWQtWgMRCMylwckH
         WUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698925327; x=1699530127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8dxEzYVSeFJZ3l8QowPz73oS6HbY0588zpxHkYzDJg=;
        b=iyX/PF+7dwD5YFVKHq/RwG61TFN13hsBAnS9EPCO21eVmT6r5aCqZCrBSiP8HfzUu2
         d6LRHlFxkgHD8AxXHkQ6XUF/VKqCFo38ZoJ0PKb40VZyYSN657ozu3kUjDIWIoYDXInh
         765KZ0MQN20yl1qLu8pPlkXmJ3No2cystRtNSG6rDRkVWCkvr3advXsybVNViroIYrvS
         VwPen4qNeV8sQwcTxMj5NmYHBEMWNxiExY7w7cjCO8OROePLFdfckd9n7oCwYYifEKmv
         /dWebf1/jwhS8WfPQwD1gQaJxzsnUG56dJ/b/MFS82BGpC2QK5BtXzAVZr5d8ifxUeu9
         Gujw==
X-Gm-Message-State: AOJu0Yz1rOejHd/2z+2ynADR57hnECW1o8lnCs7DtQSuHU4d/pn/b26G
        qcnubUy00g+7RFq1JbE7JBIrTjvTs3OjnFBXQ7biHg==
X-Google-Smtp-Source: AGHT+IF+Nqgh2qvRrp3oGM6gzwl8LfwxtdCMH0YDfKUm6K9IhmLAwyJp3QIkCPDsvq7BCWVHc2aEkA==
X-Received: by 2002:a2e:494a:0:b0:2c5:1a89:41c0 with SMTP id b10-20020a2e494a000000b002c51a8941c0mr12903032ljd.23.1698925327124;
        Thu, 02 Nov 2023 04:42:07 -0700 (PDT)
Received: from [127.0.0.1] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id j41-20020a05600c1c2900b004060f0a0fdbsm2717720wms.41.2023.11.02.04.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 04:42:06 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date:   Thu, 02 Nov 2023 11:41:59 +0000
Subject: [PATCH 6/6] media: qcom: camss: vfe-17x: Rename camss-vfe-170 to
 camss-vfe-17x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231102-b4-camss-sc8280xp-v1-6-9996f4bcb8f4@linaro.org>
References: <20231102-b4-camss-sc8280xp-v1-0-9996f4bcb8f4@linaro.org>
In-Reply-To: <20231102-b4-camss-sc8280xp-v1-0-9996f4bcb8f4@linaro.org>
To:     hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, vincent.knecht@mailoo.org,
        matti.lehtimaki@gmail.com, grosikop@quicinc.com
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13-dev-83828
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

vfe-170 and vfe-175 can be supported in the same file with some minimal
indirection to differentiate between the silicon versions.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/Makefile                             | 2 +-
 drivers/media/platform/qcom/camss/{camss-vfe-170.c => camss-vfe-17x.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 4e22223589739..0d4389ab312d1 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -14,7 +14,7 @@ qcom-camss-objs += \
 		camss-vfe-4-1.o \
 		camss-vfe-4-7.o \
 		camss-vfe-4-8.o \
-		camss-vfe-170.o \
+		camss-vfe-17x.o \
 		camss-vfe-480.o \
 		camss-vfe-gen1.o \
 		camss-vfe.o \
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
similarity index 100%
rename from drivers/media/platform/qcom/camss/camss-vfe-170.c
rename to drivers/media/platform/qcom/camss/camss-vfe-17x.c

-- 
2.42.0

