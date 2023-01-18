Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE3776720CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 16:12:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbjARPMV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 10:12:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231740AbjARPK6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 10:10:58 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D37DC3A842
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 07:10:20 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id s3so23882651pfd.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 07:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMev9I+ZdryrTBjzJ8tiTgJp1UwzDLK7UbgCFoQvzyA=;
        b=M2Zt7BwlCbRUyzUpY0C8uW6kOyIgROzdxl18/wJqi7ZDLkX8RZyNuAyr+YNA3ksmio
         V45R3WJ5eJrllVq6ApMZjda0bSw3tD3wK6HWZ2YOkFwfbSwap/oi0+tjnQOpbws9b84P
         XxBbET5BM0uVyeJB4pbjHmmN1JN8ldeexZqyh3g1n+EpBLbf/Rtf3AvWCMwb+XJ++4X2
         MTLNoIRkwKiq1ODJtjklt4MMK2b5tbZlG+L86DYsUUxS+zy+dbr62voqspwteMG95K9X
         qNg7bp0EGJbjZoBNwKeQ150qgHrqHEk8776bDe31wTK27B1x3Ko3iA3c5WQ/NDi2TZ/5
         dhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMev9I+ZdryrTBjzJ8tiTgJp1UwzDLK7UbgCFoQvzyA=;
        b=S9wQZj3onVR47IfsfrILR4XYRuccKT+4lULRsriLVSXIpp5GCLN6B5agqGtFj/++8l
         jxbz1U3ezb0J+iWNK/1+eCQwUQRJ757Y79rAcOWVtcO625d88r8NWk+Ib60+qoE1sltz
         wfD4v7onAO22i6gY4f5+DoZ+ekjqi4Hn2tC4OC3rh2GlIzhz4bvo5LlFbuDIl7xFRJyW
         QkvW7bqwLYpZa5hXPbV8GzVjUwsftTequ1QXO5LTQV3CZigsEQTcY+v21JZaJ1M5wVAo
         wpUGNupGYcKghturibSb0Zxz+rNajidv7VpNdDZ/lUYA/TCZxiOIwgUrqKcVirFa4QvG
         Z+rA==
X-Gm-Message-State: AFqh2kqFJTL+1eZ1XRNYTVc09LygRLmirE1Oj5FOrvXDpl9oO/syfT32
        F70RAxGOioewfH4HEWYbbeNb
X-Google-Smtp-Source: AMrXdXs4K3MwS+YLPgiGAPQ6/UgN+AoTZaYfW9Gxgyu1BTNK4z3gwlkRja+p8IA0kytToAo81UjcEg==
X-Received: by 2002:a05:6a00:a27:b0:566:900d:a1de with SMTP id p39-20020a056a000a2700b00566900da1demr9592363pfh.26.1674054620187;
        Wed, 18 Jan 2023 07:10:20 -0800 (PST)
Received: from localhost.localdomain ([27.111.75.61])
        by smtp.gmail.com with ESMTPSA id i15-20020aa796ef000000b0058d9623e7f1sm6721544pfq.73.2023.01.18.07.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 07:10:18 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bp@alien8.de,
        tony.luck@intel.com
Cc:     quic_saipraka@quicinc.com, konrad.dybcio@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        linux-edac@vger.kernel.org, quic_ppareek@quicinc.com,
        luca.weiss@fairphone.com, ahalaney@redhat.com, steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 12/17] arm64: dts: qcom: sm8350: Fix the base addresses of LLCC banks
Date:   Wed, 18 Jan 2023 20:38:59 +0530
Message-Id: <20230118150904.26913-13-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230118150904.26913-1-manivannan.sadhasivam@linaro.org>
References: <20230118150904.26913-1-manivannan.sadhasivam@linaro.org>
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

The LLCC block has several banks each with a different base address
and holes in between. So it is not a correct approach to cover these
banks with a single offset/size. Instead, the individual bank's base
address needs to be specified in devicetree with the exact size.

Reported-by: Parikshit Pareek <quic_ppareek@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 245dce24ec59..836732d16635 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2513,8 +2513,11 @@ gem_noc: interconnect@9100000 {
 
 		system-cache-controller@9200000 {
 			compatible = "qcom,sm8350-llcc";
-			reg = <0 0x09200000 0 0x1d0000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
+			reg = <0 0x09200000 0 0x58000>, <0 0x09280000 0 0x58000>,
+			      <0 0x09300000 0 0x58000>, <0 0x09380000 0 0x58000>,
+			      <0 0x09600000 0 0x58000>;
+			reg-names = "llcc0_base", "llcc1_base", "llcc2_base",
+				    "llcc3_base", "llcc_broadcast_base";
 		};
 
 		usb_1: usb@a6f8800 {
-- 
2.25.1

