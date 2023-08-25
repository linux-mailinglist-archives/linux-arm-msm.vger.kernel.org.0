Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 243F67890A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Aug 2023 23:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbjHYVqV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 17:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231610AbjHYVqK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 17:46:10 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 642A22717
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 14:45:54 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2bb97f2c99cso20811651fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 14:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692999952; x=1693604752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vR3cjzQ8ByhFco4eG/mKt+/fazlqqnpMcoSIOT4xtU=;
        b=Ictmjhc+O49lUBawOVRI5Rf5DTbMnYX4qjXicRzvNDloXHxJsmCNie0ZEn4OPc2P6R
         oQAK8hJigon26UBFp4KDo5i5O3mbxuLuRn/rgL1Mnd2BMJKELREL/jz5P+XvcnrAdR/k
         N1bBtGrYNb8hQBy2LzkRHefCJK9dfXecYsfQYg3x0tSNFD7QbAqEFwLJWJqsquWRS19L
         irl0IQiw7nXXK5IuPwvSLlHZE25oss3r1gfU2exv4o+LKdEQUpQNQ6TidZdhmGyGCY0Z
         WbO3j3+5WFZgRBHiHmaaRKJPNfcvU2Bz8evqcf8axrZ0iGx39rCADVTAy55SNd95zpXj
         evmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692999952; x=1693604752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vR3cjzQ8ByhFco4eG/mKt+/fazlqqnpMcoSIOT4xtU=;
        b=ZJSFzhAUfvI2mXfPVGr+WAIGNoEF2qZOgH/+k7aJ0/rjufh0PX0FHx6/ju1GMKV4RJ
         xiKgylrVUEVzp2OkS7I+Rm557iCkHUrLTYonjuSz+61CdAXkaQCb66ONtA/uAM5upoIv
         4+jfd+DgA51zUJDWibr8ySY/055XpBtOt+jSQTsx7fpkAMFo6bjFn1/YUTNSrfo3aI7M
         EVy2yAl4C9BaawuVj8H2/3SWiNA3rcAaL7jm33yiQF8UvePRLIT9TnOQi3AxbVaWAxY/
         5vqhhuSaRTXRxpHCLfR7A4VwS76nk6imhS1Lz7m2FRLn9wCajux1E1AjPAeQJ515FmQ/
         PKSQ==
X-Gm-Message-State: AOJu0YxW6myr1GHgG8sZC7DHIPCQXjdFvDa0mvav0DSTW2KYo0k9wABZ
        +m3CR+WZRLc3lqZvcdHDNGTU6g==
X-Google-Smtp-Source: AGHT+IHxr5c5JAfN4JjMFLgXR1DQY/dXoyfx4qXXlsbAA1xMUUA7yA6UyEWqAH49cDQQt9f9XShQDA==
X-Received: by 2002:a2e:97cd:0:b0:2b6:ccd6:3ec2 with SMTP id m13-20020a2e97cd000000b002b6ccd63ec2mr14330442ljj.36.1692999952585;
        Fri, 25 Aug 2023 14:45:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f26-20020a2e6a1a000000b002b94327308asm486819ljc.133.2023.08.25.14.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 14:45:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: sm8350-hdk: add missing PMICs
Date:   Sat, 26 Aug 2023 00:45:49 +0300
Message-Id: <20230825214550.1650938-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230825214550.1650938-1-dmitry.baryshkov@linaro.org>
References: <20230825214550.1650938-1-dmitry.baryshkov@linaro.org>
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

Include configuration for several PMICs presend on the board.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index f7b80b7009c1..69870f69fe4f 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -7,7 +7,12 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8350.dtsi"
+#include "pm8350.dtsi"
+#include "pm8350b.dtsi"
+#include "pm8350c.dtsi"
 #include "pmk8350.dtsi"
+#include "pmr735a.dtsi"
+#include "pmr735b.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. SM8350 HDK";
-- 
2.39.2

