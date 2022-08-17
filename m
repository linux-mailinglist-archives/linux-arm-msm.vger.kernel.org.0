Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA3259721E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 17:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240645AbiHQO77 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 10:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240579AbiHQO7m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 10:59:42 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 327BB9D115
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:59:38 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id u6so13814703ljk.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Xww6smUMHoeYSoc1lrk/iGogtyIyA10+5kx+EaqITKI=;
        b=v0XDgmiFEtxbqVRDDUqUBttsebolgBYwHgrXkx0Tx8hPhM9WQgOfwc/HSI+G51Bfxj
         TQcO6KWWotkYjWp+ZLDNu5WWr2+atQeQS48Z53BHXAq2oiMz3RCAS7ouySBVO9m/ri0p
         Wms21S0NhpRe5BlfbjFzH0xxYk4mAq1aHznV4ox0b7XVL1//qOb0J0JWmOsoSu+JY2KM
         ghOK6Xywsn2Uwm6ylOxjEm7wo5Qs4QREJ3weLmPYLtHe6Qoq03Un0JCGm1YkT603qdNK
         AI4As4IfpFhc7oURYVRsTdJIFhoo3qCzZYwfaKar9jqPfSoFu1FjCKlP8Z0g77k0dqrn
         8kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Xww6smUMHoeYSoc1lrk/iGogtyIyA10+5kx+EaqITKI=;
        b=Y4OkWYot5J9496Sw0nTU+//H+hASU8JQMb/xR+TsIr30KP0ZLULspSkmDOC7/7FlYR
         XsEQ0FnJcHVvW9iMs+KoGBezGFKZX2Kh466U1Gu5wVaUdEVUk2GWydDk5G5+1PbnfflM
         X90wYiThkvucS3vgI1VzUB+UAXe6CCyADxa1CeGrDPwAuKqrBY5nHwou0Txr0ny45jKZ
         /HI5LqeUcEClDu4bUcdyplZcxfXeSzGAggcKzXwEQFzDr9KZm+Re4etZmWXGVxeoAA8E
         bkX2pyVuFQdhnQC3C3n7mLSBmxpRHER8Q0k8OikAeVbBzkab3JotkcH3VYtJf0WxlfOh
         n/jw==
X-Gm-Message-State: ACgBeo1poOyj0Dw8wIUUDrCFbtKax/9JWJPx9NXoUWNMdrGvd8zvYbU/
        /2r8UaOa1EC2EAtZdznWkTXASw==
X-Google-Smtp-Source: AA6agR6iHKmxXU8jQKrE7CRXGI40EzMSzceG4CYUze4zIhOglZun4/vtH9PWDoXDRFDhLbNFvVD3Ug==
X-Received: by 2002:a2e:9056:0:b0:25d:64c0:27b1 with SMTP id n22-20020a2e9056000000b0025d64c027b1mr8442493ljg.396.1660748365597;
        Wed, 17 Aug 2022 07:59:25 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id u16-20020a05651c131000b0025fdf9eec1dsm2250454lja.111.2022.08.17.07.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 07:59:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v2 11/17] ARM: dts: qcom: msm8974: add missing TCSR syscon compatible
Date:   Wed, 17 Aug 2022 17:58:55 +0300
Message-Id: <20220817145901.865977-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
References: <20220817145901.865977-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

TCSR syscon node should come with dedicated compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 8baca2a77717..90a6d4b7605c 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1234,7 +1234,7 @@ tcsr_mutex_block: syscon@fd484000 {
 		};
 
 		tcsr: syscon@fd4a0000 {
-			compatible = "syscon";
+			compatible = "qcom,tcsr-msm8974", "syscon";
 			reg = <0xfd4a0000 0x10000>;
 		};
 
-- 
2.34.1

