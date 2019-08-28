Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B87BA0A4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2019 21:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbfH1TSG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Aug 2019 15:18:06 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34368 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbfH1TSG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Aug 2019 15:18:06 -0400
Received: by mail-pl1-f193.google.com with SMTP id d3so424352plr.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2019 12:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ghCpY+y6/zHXzyCjEkOv9HdWtkfIKriljN3CuQ2vN7I=;
        b=gIkfOOHwl7BqS0e4VHItR/uqSvyUDNI3+RSRs2zrqGfiLQR5FSvABE25i1mqnfpk7g
         y0eBHViEkJaT0IC/jdoqwk6pOreS8xwUzz9VQowGD1SPCkKJtjL4ALNydQPz9VgN7vex
         l4Ya1gJUCfjsK9KF3fvDvFOj7BBoiRXuGu9OAK5GcXJUuDK6SwZPpobCv1bxmbtwEWbH
         K0O9EWJceoDUlTmJjrb15akMKNtOxq5bsz3ha/IVXMHiSKbVvegkhgvh2KnPfVXT8GYn
         l6At1155+F39nc1TNcQTOLyKku3Pzya7IufeMAUPbFfSaY+KJtIihYeQoVixi1Ao/2p8
         f1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ghCpY+y6/zHXzyCjEkOv9HdWtkfIKriljN3CuQ2vN7I=;
        b=h7JyrlrCK83duysBYPEns0bz6ulB5HpAEMfnm8QeVlc3F4Tzczud/YPXIguoGkViVG
         AquqcrfntS8XGGeUF4xX3XztAmYhF7XZkZFNTkcqiP/JTnhw0GZ87xcKI7A0XQ4rHwrd
         ms68K6PIqTz+Vh1k43oji0Bqeoq7vshD22/A6t47mEZcB4paYvoq01evVl2TtzF+RcGv
         QhdP9+GMm2HseeBgPuwQmFN0p715jKaFHZxenAd+mVZWnFYXTnXrnLggQZKf9teZU5xt
         8AjjMJQtjDJLTPBmM4W6hKpHjSpNMMIQ/wri9OO/y5wCYY0l3oquYsKvR9sONPJ3ppNg
         cr5w==
X-Gm-Message-State: APjAAAWnKLa0sR7WFc6J1RCZs7yNtbr2As7HbFeFdIjtnt5E0CWwdb6Z
        2Lpcr40x31mTzOCTu1XI5bq7Jg==
X-Google-Smtp-Source: APXvYqweUkSpujhznWWsjbo7W9NutoibxGctqpJROZn6FFW2KuU2nTQetzLVpiSsVTWgo1ehZ5uwYw==
X-Received: by 2002:a17:902:1e8:: with SMTP id b95mr5971800plb.28.1567019885123;
        Wed, 28 Aug 2019 12:18:05 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id n128sm122717pfn.46.2019.08.28.12.18.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Aug 2019 12:18:04 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Bean Huo <beanhuo@micron.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v4 3/3] arm64: dts: qcom: sdm845: Specify UFS device-reset GPIO
Date:   Wed, 28 Aug 2019 12:17:56 -0700
Message-Id: <20190828191756.24312-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190828191756.24312-1-bjorn.andersson@linaro.org>
References: <20190828191756.24312-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Specify the UFS device-reset gpio for db845c and mtp, so that the
controller will issue a reset of the UFS device.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- Renamed property
- Added property to db845c

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 ++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 71bd717a4251..f5a85caff1a3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -497,6 +497,8 @@
 &ufs_mem_hc {
 	status = "okay";
 
+	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+
 	vcc-supply = <&vreg_l20a_2p95>;
 	vcc-max-microamp = <800000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 2e78638eb73b..c57548b7b250 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -388,6 +388,8 @@
 &ufs_mem_hc {
 	status = "okay";
 
+	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+
 	vcc-supply = <&vreg_l20a_2p95>;
 	vcc-max-microamp = <600000>;
 };
-- 
2.18.0

