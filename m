Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2536ABE08
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Mar 2023 12:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbjCFLVf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Mar 2023 06:21:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbjCFLVe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Mar 2023 06:21:34 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F8EA23852
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Mar 2023 03:21:32 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id j11so12168507lfg.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Mar 2023 03:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678101691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yvItAt4knVTQbQr6HVAwlqqfyz/YFoz8xPRIB91JpuE=;
        b=vKPCWFRN0vTw6GVn6lMDw7U3VRJzZvULBC3yDOGOPxxjtgP6VqcDaklPRjKpXNwXOx
         tqfWKkj4Z/In/I/0YlL51QbtpPOQatSp7mdNi4XF/hv/IgloxjB/4REINvBW5gjHo88h
         rEgRo5B6RxtiiZi8dmKr9jle7xtNLIhpjdkjXiyn3Fc6xsKJmg4DCtT/eZsHh+BcHq6z
         odqJ4PFPDehHGil5R2+5bcCq0kI2nYhbN0wAogd1AEWVyGMuNimG6eyRos+PwAT661u0
         0KCwjcZOMtuvxjf3ecNp3f8IxMDywyvME80J+saRHQ2HDHLqQ39kOlO1f01MY6SwiEr1
         McfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678101691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvItAt4knVTQbQr6HVAwlqqfyz/YFoz8xPRIB91JpuE=;
        b=Z+DlvCqr0PI1AdJ8M2wdBD1/R7ipZBNmoQPuE6s0x0ZTbxHhLJHtmqVPvI6KNNoLET
         todRBOVQ2jotXRc6JkKNyYQCmli/d09/0zYd9h0hKVrZoxlN+kbAjY0eO8GmUQrgJvD1
         dIe34P0powajY7oTsIPDaXJCXBapzficL2tWYIqAh6eDSNZkFO/rNW3Ky3NBD8AwDKSE
         WXWCvAzTWYc+JCsR/cPZczqGh0Yw+K0vc8nEiWdcSnFJLnvFhkhvnTYBNuzf3Qv/sS3c
         hjD/3Cl1gE7oEOzFev6XKlwqV9fE79qBCzB8pqZCHMAVaDtyPLdZ/ZJptnMD157xKpXa
         wOIw==
X-Gm-Message-State: AO0yUKVLk5VciXk1WZ3tx+p5Yq0mwu3DQMNwlu3TQz0FEr0A7UaWIgk2
        NAevnR37gTedrw27z6H6FunmUw==
X-Google-Smtp-Source: AK7set94ciWCwjOcl0WlM5S2fl1fVrI+EJBej7GH4G+3MQPRnqU+AJTISz4LhxjOX6aUuuwFdGpoAw==
X-Received: by 2002:ac2:5e8d:0:b0:4d5:a689:7f9d with SMTP id b13-20020ac25e8d000000b004d5a6897f9dmr2827025lfq.57.1678101690716;
        Mon, 06 Mar 2023 03:21:30 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y22-20020ac255b6000000b004b40c1f1c70sm1593801lfg.212.2023.03.06.03.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 03:21:30 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: qcom-spmi-pmic: add pm8450 entry
Date:   Mon,  6 Mar 2023 14:21:29 +0300
Message-Id: <20230306112129.3687744-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add bindings for the PM8450 PMIC (qcom,pm8450).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index adf88245c409..256340f5ccb1 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -56,6 +56,7 @@ properties:
           - qcom,pm8350
           - qcom,pm8350b
           - qcom,pm8350c
+          - qcom,pm8450
           - qcom,pm8550
           - qcom,pm8550b
           - qcom,pm8550ve
-- 
2.30.2

