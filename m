Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0639D189D0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 14:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbgCRNcl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 09:32:41 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42369 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726856AbgCRNcl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 09:32:41 -0400
Received: by mail-ed1-f68.google.com with SMTP id b21so20569106edy.9;
        Wed, 18 Mar 2020 06:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mYCC0npBMG0vbAOp6lmFNCRY0zK8adL/9dKbj+Yqe7Y=;
        b=Cl0pZFanv4M9J1aHobxx5invUvlqLH+t7nhja3ohfPPNddUcIMPeESp2YfaJEW5na9
         qj0OcVgtvDVktgIXXf/8hYTys/icsmDxI7utUoF8IzQd6nmcABR2KtoH/bRMICAtG0eQ
         ae1fn1NcxytBebk4wowKsIEK+8ez8av+STpxjXa/UU0USladilHZBJw1X7PbZOvRJLt3
         Jgb3OsaOEn7IeMGM9aThge0JODAtfRh/NmqfhOWybUpDQ+kQW2K6xypHnHDX5P8ULNm9
         1nU/FGV06t0upZaZYEzbwCwE0cz/rCnV2jFklmyXnhTFgjR3VztjzX1MM6HHtjI/eA/3
         sIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mYCC0npBMG0vbAOp6lmFNCRY0zK8adL/9dKbj+Yqe7Y=;
        b=awj1/G8D6Bqw1GpXsXczRi58TxWydXvOEfYo7b4GcDovr6OQnY6V5wzub9XQU7tY6r
         ZjQD8bHpzOvSM8HqBCgRI8IP6BHTyn2z7PFG8a43gIzer0A5VQ9NadsJ6qGat98l9WVW
         F89WoQ0s/5/MmPFj7IWzKcTsBT4zFFKORKE69Y9Ch3MX6SOBTQlBFFRAmyOBS1UR00s1
         Gay6bckPleItJr9VXOsMnglBGVEK6vE09BksH7DLEZZIlRkN1zWe4gMmEpg+DXJ60Tru
         tWjm+hJ8y8nVxP26/KeN/EaNTfReQiSA0kzUtyja/7qaLfoMT3AzP/nQa2aLSBSyzGxL
         KD3g==
X-Gm-Message-State: ANhLgQ3FLbfQKnopDPthy5D0jzYuGgi2XS3FY7Mk4zXlczK/i+ikXw7f
        D1c+kMopmH2oowVLDMD/oEA=
X-Google-Smtp-Source: ADFU+vuReANJeEqUItjIq+M9/F87Jm+fIrhJyn+pckLzJ9iiwEIXJ0vfbUxIbAg6RE2pe28SmD3Drw==
X-Received: by 2002:a05:6402:1d95:: with SMTP id dk21mr3836875edb.93.1584538358848;
        Wed, 18 Mar 2020 06:32:38 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host203-232-dynamic.53-79-r.retail.telecomitalia.it. [79.53.232.203])
        by smtp.googlemail.com with ESMTPSA id c21sm344479ejm.47.2020.03.18.06.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 06:32:38 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Andy Gross <agross@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: add scm definition
Date:   Wed, 18 Mar 2020 14:32:14 +0100
Message-Id: <20200318133213.1041-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add missing scm definition for ipq806x soc

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 16c0da97932c..bb5f678c869f 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -93,6 +93,12 @@ sleep_clk: sleep_clk {
 		};
 	};
 
+	firmware {
+		scm {
+			compatible = "qcom,scm-ipq806x", "qcom,scm";
+		};
+	};
+
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.25.1

