Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE5DE59BF30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Aug 2022 14:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234812AbiHVMDI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Aug 2022 08:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234811AbiHVMDH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Aug 2022 08:03:07 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BAB637F88
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 05:03:06 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id bs25so12929815wrb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Aug 2022 05:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=DPrB14M1uUCMZKdCLrPqh8TXi1rVgnZ+HKBbONm+778=;
        b=ngGCUWRRHm4oNaymjTkDZZA+Xpo62kLIh9qt4d8/kTdSiXze9AI2c3g8OiZj5lbx0M
         HH1wlCyC0TAnByIeDPOz8izGLI4tWKOfJHAzctXgAHKsy7hlwIBn32zRNKeuvqlD04KQ
         vBKhZMrfE/FVMtO9is5quNixlvDQ5PkHI1shyrChz7t7PuMAL6RscnBzF0GnVUsTWalv
         dDMiWRBqZZKMYFz1b/6E8MWbmDq2MAzcpqhiq0LbCrmmKZsdJDwa1gO2VYHdOxKGZZdO
         Xczv9T7PQS8u/OEoWDR6IGOyzx506isGdiHyfKPswVylCwuLswYfn6gWca+88LhCK39b
         Q8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=DPrB14M1uUCMZKdCLrPqh8TXi1rVgnZ+HKBbONm+778=;
        b=vkwxFW5aWFcEEo22v2ts5iTyiegL5STSaQqwPk4+KU5Gz4HXYvAcsEy60uCJbWV4io
         9L5NCri4Maej+ucYNjp1IE7P4zNNCUK1qOTOahyl3r2gOB5aKKrxT6+wVWYgoNL8v2zE
         2BJvkGxsAfFn5qwXNMtY85LfH5OehU6nXDzHcyCdV6oEd2yjZ7US0OCqfmO1QcvrlKHV
         z+U6GJ3h9SSzO/w9dkHm8ldGQkuV1xzmYwvx79yB+aXF/ynz9Z4S17D+l3tPX5h+/9mZ
         sByMwTywvEDpNdRMQ1qH8lPjmN9mGr+MxtoNX0G6pvVPuizb+5alHExrDKiBJaER559l
         SzzQ==
X-Gm-Message-State: ACgBeo0cZWNCwYyGliQpvjPuy9oZNS1rmbcXCTlMexUqRpzllXbcYBEZ
        7wE4O21wT6HqJV3JOL20BbJnjqgtZjSTzg==
X-Google-Smtp-Source: AA6agR7T0PuEhZJabqtvj/ztCPXu039mnrYfBHOTD/Gt+7BOyOgcRD09ET1kFC2TkKIVPrhBNZf2Lg==
X-Received: by 2002:a5d:434a:0:b0:21d:aa7e:b1bb with SMTP id u10-20020a5d434a000000b0021daa7eb1bbmr11214604wrr.619.1661169784861;
        Mon, 22 Aug 2022 05:03:04 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id i26-20020a1c541a000000b003a64f684704sm7553673wmb.40.2022.08.22.05.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 05:03:04 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH] arm64: dts: qcom: pm8916: Fix pwm declaration
Date:   Mon, 22 Aug 2022 13:03:00 +0100
Message-Id: <20220822120300.2633790-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We need to define pwm@bc000 to stop dtbs_check from making the following
complaint, text pruned.

pmic@1: 'pwm' does not match any of the regexes:  'pwm@[0-9a-f]+$'

Fixes: e79a1385ab74 ("arm64: dts: qcom: Add LPG to pm8916, pm8994, pmi8994 and pmi8998")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/pm8916.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
index 606c2a6d1f0fc..d6922379729cb 100644
--- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -124,7 +124,7 @@ pm8916_1: pmic@1 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		pm8916_pwm: pwm {
+		pm8916_pwm: pwm@bc00 {
 			compatible = "qcom,pm8916-pwm";
 
 			#pwm-cells = <2>;
-- 
2.37.1

