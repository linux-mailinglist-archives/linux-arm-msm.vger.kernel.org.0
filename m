Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1CB376FDF2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Aug 2023 11:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbjHDJ7D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Aug 2023 05:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbjHDJ6w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Aug 2023 05:58:52 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D6946AB
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Aug 2023 02:58:51 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-686f6231bdeso457749b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Aug 2023 02:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20221208.gappssmtp.com; s=20221208; t=1691143130; x=1691747930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fKzfX6v1CyZX2xitAs24S+KxRHnlm3GlIzocQibU/6A=;
        b=qXLUUslLNPqkI1V3819WlnOFsQgo3QicZhp/lMyurcUXTM9ODi+dqygsYnxlOTstoN
         VxS3WICONnG6U7siDJGNxN3mLFf5D6GhMTilpimh0DQvdLjIWNxM3u2CelxxT3VnSck7
         ywy2dreQOQzGnMVm2wuMOdQVNJHdSL6Zh5HasQLQvppNjrTNSzFmqB1+IeaVXpnQn4zF
         XktUp0L5QwHiZaC01jRRfd+It5TQNBs7fVfvmxNU0B6TGWXd9pY6ViWau0+yvtKctsYy
         oVwezUfWWEyM/KYldq/UF9nNuBuuifV4/gSd2QKxkiM3CfKljxOxFf5YR3THe3bVHjEX
         SrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691143130; x=1691747930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKzfX6v1CyZX2xitAs24S+KxRHnlm3GlIzocQibU/6A=;
        b=fBV/+o/i6M/cOujjNzQrCQUQzUCU6qIpEKqlhS93fXuQcD5Dr6RBjjegb3xWv0xE8E
         eQ6So3LbU78i1FUNpPK9RGOHNJ+oLmuDBZHrvP4ygcjFI1E9JFBwGfGQtVx4vjLxC/O3
         GQfMghQ2kE4CRAcrw4uxuCaJyk/DYhO9Kvg07r6BzVUN73tQcgof2HWVcTz7hD4S88ZE
         L79OXCE9G835nYPix+LvAeeT7BANzy69uk3vczFuDdnurpNLZ7qWSCWXD3PtVIexLBQR
         OSKw/2egWEj5ANO92BaUWhuM0HC3xful2S/4rV9oADn4DFLfyCDrXkSENow3Y9WXQFxX
         +5tA==
X-Gm-Message-State: ABy/qLawr39LHCDiPv07HTNo3BPmtO/XI8ckIp06IISk5b+nyxqZCb+Z
        5MC4OPbFaMk+SJnNMY40w/XAYA==
X-Google-Smtp-Source: APBJJlEtKwIdnSjvYmmiuTojjVUT6sqYmnCFYOE5mk72VaYjj2YbaikO9/XLTtcHqTniRT6J8EETrg==
X-Received: by 2002:a05:6a20:4403:b0:13e:7439:1449 with SMTP id ce3-20020a056a20440300b0013e74391449mr17017332pzb.0.1691143130599;
        Fri, 04 Aug 2023 02:58:50 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id i2-20020aa787c2000000b0067b643b814csm1259949pfo.6.2023.08.04.02.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 02:58:50 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/3] arm64: dts: qcom: sc7180: Add sku_id for lazor/limozeen
Date:   Fri,  4 Aug 2023 17:58:35 +0800
Message-Id: <20230804175734.v2.2.Ia4e268a027980f00c8fb0451a29938d76b765487@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230804095836.39551-1-sheng-liang.pan@quanta.corp-partner.google.com>
References: <20230804095836.39551-1-sheng-liang.pan@quanta.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SKU ID 10: Lazor LTE+Wifi, no-esim (Strapped 0 X 0)
SKU ID 15: Limozeen LTE+Wifi, TS, no esim (Strapped 1 X 0)
SKU ID 18: Limozeen LTE+Wifi, no TS, no esim (Strapped X 0 0)

Even though the "no esim" boards are strapped differently than
ones that have an esim, the esim isn't represented in the
device tree so the same device tree can be used for LTE w/ esim
and LTE w/out esim.

Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 .../boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts     | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dts   | 2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts
index 913b5fc3ba76..cef57c15b70b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dts
@@ -14,7 +14,7 @@
 
 / {
 	model = "Google Lazor Limozeen without Touchscreen (rev9+)";
-	compatible = "google,lazor-sku6", "qcom,sc7180";
+	compatible = "google,lazor-sku6", "google,lazor-sku18", "qcom,sc7180";
 };
 
 /delete-node/&ap_ts;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dts
index 15d77dc5f956..2038a82bc0e7 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dts
@@ -14,7 +14,7 @@
 
 / {
 	model = "Google Lazor Limozeen (rev9+)";
-	compatible = "google,lazor-sku4", "qcom,sc7180";
+	compatible = "google,lazor-sku4", "google,lazor-sku15", "qcom,sc7180";
 };
 
 /delete-node/&ap_ts;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts
index 38027f13b9d0..438ab9cd3389 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dts
@@ -14,7 +14,7 @@
 
 / {
 	model = "Google Lazor (rev9+) with LTE";
-	compatible = "google,lazor-sku0", "qcom,sc7180";
+	compatible = "google,lazor-sku0", "google,lazor-sku10", "qcom,sc7180";
 };
 
 &ap_sar_sensor_i2c {
-- 
2.34.1

