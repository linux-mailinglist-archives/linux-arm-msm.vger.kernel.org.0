Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BACF367E4AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 13:09:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjA0MJw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 07:09:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232199AbjA0MJb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 07:09:31 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 615B024CBC
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 04:02:56 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id n5so5287167ljc.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 04:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pli/ZQz54OYljbDnDOU9Esvk00/OYz+NgZt0JhbNMXk=;
        b=elRTrCrs+cq/OfXYb4/nkTiEKZfAlsji5t6aoAVWQ3ZtKuuvoIHQfNC5oaqyWqw7af
         6NiB5qJF9CAhqhG/DRYk9e2sXzSAIHKDtN0E7vQBssekcqr2C18pFBHUn7Q2lkunjXYl
         5pKdQKzDvF7c76CUoC5J+bAVSRVa3BGe/OEgqVvWZ2cqW6pBh4hRx1ygQrPbb5Wf5CFo
         My4dApouWu4biB74zOtpX4U1JtzVBrj8iYXPEMlx6IBIxQCgFJ3gD9/eogdF0VeYvnJ4
         SMerg59Qd7xh6g+2kTja9jpSq21mJMRUYeeMyy/d9gN5JE0aUiJ0GRzM9dUgfK9z1r0q
         676g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pli/ZQz54OYljbDnDOU9Esvk00/OYz+NgZt0JhbNMXk=;
        b=BJxHnYkIFP7wBV/c/mn3dAdzAG+3JYHEOs9F7LkVO0iLUmt/3BHLZ5smZDHUaQJ4LM
         a51CIASRoZZT8QEMq37OW6xzfqJlg1qc/gbU5zUIR7UywSxKix3s272tuiM8AsXPZcBu
         Y8fPr6l65tr6uXKPWpHOPEQBidEVf9Mq1iFHXg2TEO1Yzpwjxtnx9t4Ar+Jd0HZdIe+H
         dAsBUx7uSHOpa3tJLbhAV6Pi9HO4c0spuXTLP5rMAbuaMcAIbV/iLYZ3h+VCsUmx/FWb
         PDA1s24QD1yrW/uKC83bTsm799Gd3lGY5WbucGUJNplDGeAxSjxCHw1CBSH6l7UIBaAV
         ZbBg==
X-Gm-Message-State: AFqh2kphbGXbaImfZEKi4Qty9h5DIzeoEThmENxXlfQFSmCVYUFYM8tg
        QaBemjAx+O0kNTMJEDSU1+30k85BF35dLe5N
X-Google-Smtp-Source: AK7set9hU3ihvVR7LjSBLSbCGZzD1ztQL6wG/KFwAeUeAlniJQQHVpCF+m6PWnpthEizTcODNKE+tQ==
X-Received: by 2002:a5d:43c7:0:b0:2bf:c01a:f24f with SMTP id v7-20020a5d43c7000000b002bfc01af24fmr6302229wrr.5.1674819854377;
        Fri, 27 Jan 2023 03:44:14 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z14-20020a5d4c8e000000b002bfc2d0eff0sm3807760wrs.47.2023.01.27.03.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 03:44:14 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 03/11] arm64: dts: qcom: sa8295p-adp: align RPMh regulator nodes with bindings
Date:   Fri, 27 Jan 2023 12:43:39 +0100
Message-Id: <20230127114347.235963-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127114347.235963-1-krzysztof.kozlowski@linaro.org>
References: <20230127114347.235963-1-krzysztof.kozlowski@linaro.org>
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

Device node names should be generic and bindings expect certain pattern
for RPMh regulator nodes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
index bb4270e8f551..fd253942e5e5 100644
--- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
@@ -111,7 +111,7 @@ edp3_connector_in: endpoint {
 };
 
 &apps_rsc {
-	pmm8540-a-regulators {
+	regulators-0 {
 		compatible = "qcom,pm8150-rpmh-regulators";
 		qcom,pmic-id = "a";
 
@@ -151,7 +151,7 @@ vreg_l11a: ldo11 {
 		};
 	};
 
-	pmm8540-c-regulators {
+	regulators-1 {
 		compatible = "qcom,pm8150-rpmh-regulators";
 		qcom,pmic-id = "c";
 
@@ -224,7 +224,7 @@ vreg_l17c: ldo17 {
 		};
 	};
 
-	pmm8540-g-regulators {
+	regulators-2 {
 		compatible = "qcom,pm8150-rpmh-regulators";
 		qcom,pmic-id = "g";
 
-- 
2.34.1

