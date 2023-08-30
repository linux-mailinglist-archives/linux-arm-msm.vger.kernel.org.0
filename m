Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B804E78E17A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Aug 2023 23:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241518AbjH3Vbp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Aug 2023 17:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241527AbjH3Vbp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Aug 2023 17:31:45 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF101CC
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 14:31:15 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b72161c6e9so16318051fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Aug 2023 14:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693430994; x=1694035794; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sB4LTQroQIGZnNvkckG2TO4c/EOlTMJPaJP5M9r0cjY=;
        b=tdD0XqMP7aUyWEPG706VZbDpsI+WW9Mbw052zQHKzU0lodyRtMM/ft2vfI/7EbLFcE
         jX+0qPm8z3MfiIAFoykNk4kWDBrXSkeSRusvmZmz3kFiw62Dg+usuXZA8vxjtKLimFeo
         hbyA2gqR1HvN5oeV1sa76lVNtSK0mKRe6far41AZVIlhbV04vKsIS//OnaPS6+lS+YFD
         QmHF4RKS2m0/1nHTUG29GtjrPqUuRmfU9EL0rsRYlljJU4UGwS5xaCWcgb+VE7bJmCeh
         nfQQOPUdxE4xy2Aa/MbcyyZTioKJtiyMsgpDcdtcnFMIgaOAZjJoKV/qagIjH0wgewns
         0kRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693430994; x=1694035794;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sB4LTQroQIGZnNvkckG2TO4c/EOlTMJPaJP5M9r0cjY=;
        b=QyjAH9ZDKfEETP8xQaSKBy6fO2e/eJ5TVR9j/MlikQ6di+EcmFUa9vzjfjOwrgOf9D
         LA5QZz9WCCkJDodfnFwWxjGQHhhQEK8UiIp8JfWPUNZ7c6Dn6/ZLjLBkhxSLTJo/Feke
         7KbeGYr/xnar8BUx8Nm+HwbX2HIqoOjolYhbK5OQ4SBi4cbigCR+4oaG+rb5GZoNU/WB
         Z2LBPRFZBrh8xEifw6QTdGYuikVZWfyp9Z7xQdtWUQTIFPljFjTeXsRhNnnJVQpbfISw
         z0fsoi+7R8UxrWyypVXfKYSMxV5H0rknUmO5yhAGUVy3ZdWbxo4w/4+4HzHcDJqGJoFh
         0Alg==
X-Gm-Message-State: AOJu0YyIvRswqTmJS4nbdQux0KOBVoftqKLxFcArhdVfK4Y/3GdG2aV5
        Ga0KfWnIwlNLiHK+PB5RA86GU84+ZCHIEbOrsnHZ4Q==
X-Google-Smtp-Source: AGHT+IHH8z5u+wFNCt7HFZifQcuML8FzOtVdrPCQzrgiEVU88nCH/TpoI+LrP5n+nExQGynp3QOA5g==
X-Received: by 2002:a05:6512:1305:b0:500:ae25:cd46 with SMTP id x5-20020a056512130500b00500ae25cd46mr305523lfu.11.1693430034380;
        Wed, 30 Aug 2023 14:13:54 -0700 (PDT)
Received: from [192.168.1.101] (abyl195.neoplus.adsl.tpnet.pl. [83.9.31.195])
        by smtp.gmail.com with ESMTPSA id b3-20020ac25623000000b004f37bd02a89sm2516351lff.287.2023.08.30.14.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 14:13:53 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] FEMTOPHY REFGEN regulator
Date:   Wed, 30 Aug 2023 23:13:50 +0200
Message-Id: <20230830-topic-refgenphy-v1-0-892db196a1c0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA6x72QC/x2N0QqDMAxFf0XyvEBXBct+ZfjQZpkNSCytE4f47
 wt7PId7uCc0rsINHt0JlXdpsqrB/dYB5agzo7yMwTvfu9A73NYihJXfM2vJXwzk4xgSDQOPYFW
 KjTHVqJSt08+ymCy2l+N/85yu6wfxVjS9dgAAAA==
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1693430032; l=674;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=WB4bhWM031cMBzGe9vpFJGgvxxhPlYOAzO/I1MMx46Q=;
 b=4apGHqCzc+krs+LpAviYiZ40vIExSBHGwta/L37TDxa06T+G4bYYPCfs3iM5DDLfQakdafVDV
 XbWkSJ5dl5ACs744bdhPtiHYTHMZV84Oc8KZGzbOqRTavLvkRlV7gZ2
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The FEMTOPHY gets a reference voltage from the REFGEN regulator.
Make Linux aware of that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      dt-bindings: phy: qcom,usb-snps-femto-v2: Add REFGEN regulator
      phy: qcom-snps-femto-v2: Add REFGEN supply

 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 3 +++
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c                     | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)
---
base-commit: 56585460cc2ec44fc5d66924f0a116f57080f0dc
change-id: 20230830-topic-refgenphy-8c2a78bc44e7

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

