Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B66A836113A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 19:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233852AbhDORk3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 13:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233134AbhDORk2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 13:40:28 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A483DC061574;
        Thu, 15 Apr 2021 10:40:04 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id h4so15086694wrt.12;
        Thu, 15 Apr 2021 10:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Rbkk3YtrZq+cFsEONS3Ccixfv0q2I+gTYmfK7b4Oaw=;
        b=NnNjTADq5CYotTW7JfIGypkWNEvpXWgtZ+uG8BZoaS7Ig3UPZsMvuD9fuN+WP3Pzpz
         Gb/302R0MvHlvkLarRVkjAcpUq2BUF9TGPi+0KOFPTOqhkIrYYWLfNt1K2EsG2/iFIHK
         wDc5BzQD+fnbHKCdaeel2Dl67RmRNBSSFTI4tXflFkrsc6+StFTuDd34e7AStclSxDWB
         nCBgcmPVESo5Agrx0Q/EGpylswxQg/9AvM8mnO3W9GqgAXJhmciVh+LUIXcTZQtsjMsT
         JfSecy8N6nm9UmwT5pJuXo0clMXvd+WMaWYvHbO9Z9vtoZG1HGjNzOpAOIu2tHxnedxK
         OASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Rbkk3YtrZq+cFsEONS3Ccixfv0q2I+gTYmfK7b4Oaw=;
        b=e/PwoXD1nWyBAfzfWg0Z2kEhHEOuTCkYeuSfEc4vYP7YL919DbZ/A6FBXGnxTUmpmo
         45TDBUr07WmgpaumNCaBwri4T2QC7jJyRGrGC0eiK/JLDZrLB15rPrPZNv6g2NHxMZlQ
         M5neXbB1wNrS3Dx6v8D1SYGl6kcPLuvXF1slzXVFW/yRRXlf3ZIr9XetUtixj46NEKmm
         a3qofeG5s0Xmcbjv1POj1Er67ITeA3UZTyeFVr8UXd4ofO5xFrDqJw6OfN9472SR4G/q
         5dhbWKwT28UZnpMtYJp8PvAMeVtbrMUtxF6FLiuHl6UATweEQxv9X8ZjWnpKGzH07HNY
         nRPg==
X-Gm-Message-State: AOAM531nTzbop+YyFJS+RpMu6fIMcuZYQwSbJEmL7t9RyUdb8RDJovtg
        tYo/YN+2JmUbsmHxgldc529DA9RuSDOJ2w==
X-Google-Smtp-Source: ABdhPJyrRJgvE1mLSAmQGUPPEaFIvCmCIDMqNAsV8dQDaZ5WUXQEVQzfTy85rlhx9+dy2mHrXZI2og==
X-Received: by 2002:a5d:4e81:: with SMTP id e1mr4806632wru.305.1618508403334;
        Thu, 15 Apr 2021 10:40:03 -0700 (PDT)
Received: from dell5510.arch.suse.de ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id u4sm4411470wml.0.2021.04.15.10.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 10:40:02 -0700 (PDT)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        devicetree@vger.kernel.org
Subject: [PATCH v3 1/1] nexus: Fix gpio-reserved-ranges 85-88
Date:   Thu, 15 Apr 2021 19:39:57 +0200
Message-Id: <20210415173957.28533-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reserve GPIO pins 85-88 as these aren't meant to be accessible from the
application CPUs (causes reboot). Yet another fix similar to
9134586715e3, 5f8d3ab136d0, which is needed to allow angler to boot after
3edfb7bd76bd ("gpiolib: Show correct direction from the beginning").

Fixes: feeaf56ac78d ("arm64: dts: msm8994 SoC and Huawei Angler (Nexus 6P) support")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

NOTE: as I wrote there is also problem with 86588296acbf ("fdt: Properly
handle "no-map" field in the memory region") from v5.12-rc1-dontuse, but
that's another story.

Kind regards,
Petr

 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
index baa55643b40f..ffe1a9bd8f70 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
@@ -32,3 +32,7 @@ serial@f991e000 {
 		};
 	};
 };
+
+&tlmm {
+	gpio-reserved-ranges = <85 4>;
+};
-- 
2.31.1

