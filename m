Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA63DB9A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 00:19:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441621AbfJQWTK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Oct 2019 18:19:10 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41308 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441609AbfJQWTG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Oct 2019 18:19:06 -0400
Received: by mail-pf1-f195.google.com with SMTP id q7so2510443pfh.8;
        Thu, 17 Oct 2019 15:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zbauNE2iaQVEwoF3BkrGqfKA5iulnwxZKgy69CxGyN4=;
        b=usvvbWWHfqJKPpmjKeL268ijpVfPqb4djf9I8jZLkwcn2aufrP/gW3JIPPkaq58TC5
         jVAaMbit7tvh6Oqms2IjBpYn9D8vOlFyfDkkLxO5sbmClnfqZGmzf8nCRXPj4DfAuyua
         dEH+xvx3t0kU6a/Fn8acbjubxsf6tKLAofKno8wUMLnpVgsac58rrkjYG+rPmrC+KhKQ
         JNFIA0O6oa5ZosVHJNT/fYwli7IX+c+ck1mymrV89f5ZzIIx3GkS48aMJ9hB6SceuwKz
         Xj+Tj/VTTRxfblII4Koj7RlfpWR2CWzVOaH6vtp48eD0Yr5bH1/W0N+fzfEcNwwY0f/p
         hW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zbauNE2iaQVEwoF3BkrGqfKA5iulnwxZKgy69CxGyN4=;
        b=qJWiaDB1sQOshtwVV+fzwTUb77Gu6zQ7jpxRVShSog6BYrIcGyv/ryiqPfoeRgwhnt
         h2fmdaSKXIHyOKxKMDmRZfEVgSdEfsBRm0esqdsTb/tbTZvwDSHwIAAZHpUEbJL/d9Tf
         RW0c5RdM+y6fiaZaFlXHAX0k7zaMmO49E7LKebK3L0zXHX7zL5/SpNzKzn7tRbZ8GGZu
         FizMbUHh+r1wJpF6odrxWpVCA19iMrRvUMgk7Qv1Dno/BIiE3zWe5wucOmCbefLpeeZ6
         2a/5bZXd/e1ANzblbgFK6cZH4QNx9n8TsnTRFhlcMfLLN/0ZoF5saY1EAPeCX8WCpspL
         Ov3Q==
X-Gm-Message-State: APjAAAX/aLx8ctEWpGZvL5OIX/yyrv3JBwA3VZqqKeKAkYYYnj1U9eCn
        Md6b1JIaTQlvnSJ37ehM2ME=
X-Google-Smtp-Source: APXvYqziZb7vVxrhWqH/uLbkjPsehUojov84XtVGYv/S1eeZiZLxe/18tItyDoNKx6YpSgu15dSxUA==
X-Received: by 2002:a62:68c1:: with SMTP id d184mr2764418pfc.195.1571350746217;
        Thu, 17 Oct 2019 15:19:06 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a8sm3441912pff.5.2019.10.17.15.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 15:19:05 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [RFC PATCH 3/4] arm64: dts: qcom: msm8998-mtp: Enable bluetooth
Date:   Thu, 17 Oct 2019 15:18:42 -0700
Message-Id: <20191017221843.8130-4-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191017221843.8130-1-jeffrey.l.hugo@gmail.com>
References: <20191017221843.8130-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bluetooth is provided by a wcn3990, which is connected to the main SoC via
blsp1_uart3.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index 4f687570b6fd..1a1836ed1052 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -23,6 +23,20 @@
 	};
 };
 
+&blsp1_uart3 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3990-bt";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l25a_3p3>;
+		max-speed = <3200000>;
+	};
+};
+
 &blsp2_uart1 {
 	status = "okay";
 };
-- 
2.17.1

