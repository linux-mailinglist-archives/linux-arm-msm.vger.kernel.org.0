Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E61846A5DA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Feb 2023 17:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229962AbjB1QtV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Feb 2023 11:49:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbjB1QtP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Feb 2023 11:49:15 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 402F620D38
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 08:48:39 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso9151614pjs.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Feb 2023 08:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCF3zMena4srMKCl++MLXI9r0aSG+VyTVbPdBKzJEi4=;
        b=D5pqPo3merhk9oD3FhSnvSQLqHAHFy5+A1SOSfM9eRfb77uCtW1acgIlLEBNAJ02xp
         6j6YQuEsj9vIKfyT6bYXZMJLd8Eo/fK83StNPZSTkpcoeZd3lbYQCYDsDSTyfA6V5FZ8
         Pn/BKNYa3CxlvN8NsyOJe08hIt0ygSVvO2CzTFGz4VKYDSYc4Lp0vrrBgwYqAHpJ9qk2
         z8qxKBCF0fh7d9QTPmx8EHsKsCJ1hYPQ6rzMQBS8xmyYyj6K1EumW0kPKGOL1ex60Si4
         bbg1pJW0MOUUHiU6cJ0Bp7QfH9lMLz8ro8f0M0YFaVlhvHZyxFGjjxZfC5I6gYtDgXs3
         C/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCF3zMena4srMKCl++MLXI9r0aSG+VyTVbPdBKzJEi4=;
        b=4m8kivzK9QgWjAQA+ahArY2PMmcpC21Ec+yY459O7uwMk4Q7zqDBpAgbJ3fNH1Oti3
         95NtYfUXy7pgAxUhPqZzzrXxo4z7eg3Cts+e+4jGXqiDd3b5K6bGMu8hmskkScFLJ+AE
         nIIuBc5nncq6TNYUIit8cVJKdsM/1NwNM5wibOFXgQ1kaEQs+FrGsr8dCNKKMjXSyPOA
         egkR02Dv4ZYKGL/wm8etOKyjchxDFrF28jTPhnSr6zrwv7wlybcGcZCh4KLO6vweUiRO
         smKXpr4sxRVZGWu51Nrr1+8NxdHidKEWrnp1vJJ0jmH1U5xejTtdzSTy0oQ0jzrON280
         JKrQ==
X-Gm-Message-State: AO0yUKXuQmVdk+F2rr/O5i+2++uZfiQmp573CU6VPEmJ55PhUfMKN4Gx
        Q4AXl2gCs5xtRwWQPCe4RRT6
X-Google-Smtp-Source: AK7set+iBvgp54JrlGvSN2ucsfE7s3w01Vpu8wTPXztu8V71rK2TgydqPH8fRF6H5UruqWB7RubcsQ==
X-Received: by 2002:a05:6a20:428b:b0:cc:b5de:3037 with SMTP id o11-20020a056a20428b00b000ccb5de3037mr4536707pzj.51.1677602918753;
        Tue, 28 Feb 2023 08:48:38 -0800 (PST)
Received: from localhost.localdomain ([103.197.115.185])
        by smtp.gmail.com with ESMTPSA id z11-20020a6552cb000000b00476dc914262sm5908792pgp.1.2023.02.28.08.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 08:48:38 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arnd@arndb.de,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 09/16] arm64: dts: qcom: qcs404: Use 0x prefix for the PCI I/O and MEM ranges
Date:   Tue, 28 Feb 2023 22:17:45 +0530
Message-Id: <20230228164752.55682-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230228164752.55682-1-manivannan.sadhasivam@linaro.org>
References: <20230228164752.55682-1-manivannan.sadhasivam@linaro.org>
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

To maintain the uniformity, let's use the 0x prefix for the values of
ranges property.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index bc2ed73afb74..42fc33ab8b2e 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -1469,8 +1469,8 @@ pcie: pci@10000000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			ranges = <0x81000000 0 0          0x10003000 0 0x00010000>, /* I/O */
-				 <0x82000000 0 0x10013000 0x10013000 0 0x007ed000>; /* memory */
+			ranges = <0x81000000 0x0 0x00000000 0x10003000 0x0 0x00010000>, /* I/O */
+				 <0x82000000 0x0 0x10013000 0x10013000 0x0 0x007ed000>; /* memory */
 
 			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi";
-- 
2.25.1

