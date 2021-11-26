Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78C1E45E840
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 08:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359117AbhKZHMs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Nov 2021 02:12:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359110AbhKZHKn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Nov 2021 02:10:43 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E39C06175D
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 23:05:42 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id v19so6087219plo.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 23:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n3D0/obh+8GDy4NXpRzCcn/wksmLWSbTBh0aXEdpFCE=;
        b=ro65tUWhtJIjuY3swffGValIXVWIqHNXfKUfHp6mfXD/qpjHD8haXq/JoIP1128yZ/
         pKHxuCfKO1FA97DbbhPsAJMvo5PBi849ReGu+CMvsVN2wKS0sqZeZksRofWbJSSLXagf
         hLwgkmhp4qsgqXLAFzToo6OTpEP7gRa61NbJ4IGX5RxuEvUFr/tBKAVus0MUmZgqzppY
         i3F83POY6HFMfSkeh+PFcLDGGR7paYJm0WllNH7X6zsTdp/O5fr55HmugPfOCEDuzRwi
         D8WW1qNC2lSG+Zaj4UIWB7frSCoegqIrZ7g7US5rkl8aAAEc1isV0PjrXFDiouj/zDk/
         8TAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n3D0/obh+8GDy4NXpRzCcn/wksmLWSbTBh0aXEdpFCE=;
        b=iCEIgdLh69JON8R/+TZYFULzEBvYkfAdvVU5kKits5WV9uNbeooXtNHQygOT7RnUrJ
         Etno2SsHmTIcTY1Ra1PMbrOTKL/4XGoFJYaS5wJ1rYC1ah+TWLdSuzgdY+sZzT9R+FAI
         GEXf9C2dhG60xxD0mOBmR3PJvW5GD8ZjQJJUKZk72j1lgAg4DhLIIFXd27Onz0ogv3Fq
         wUwgHOBEAuTot/hbg8kVmQDx1Z5mPHKpxyiQSw5rlZwDZ+YaeW/8ol0POAlX8S4OBjUa
         DwI06C6Hfet1XKdulGsd6HGLeo1l0tQFhIPKzqB3ZeoMlE8Pfel2iHRG9xkkA3cYrrnw
         cMnw==
X-Gm-Message-State: AOAM533V954IuA4N6XZHO8h3lm+7xjMLPcpEk3CL6ek3jsGGDnv67kLg
        6wQMFKuC47xadDuBCCaluspj
X-Google-Smtp-Source: ABdhPJzKiBbRjTyDR5yzChLw+2o8Qnzvqhbx4YlFIRRMZU1zRnuU71MH9eWlM8kSdLOW1ntVb7tH5Q==
X-Received: by 2002:a17:902:dacb:b0:141:e931:3b49 with SMTP id q11-20020a170902dacb00b00141e9313b49mr35342773plx.45.1637910342291;
        Thu, 25 Nov 2021 23:05:42 -0800 (PST)
Received: from localhost.localdomain ([117.215.117.247])
        by smtp.gmail.com with ESMTPSA id d12sm4042104pgf.19.2021.11.25.23.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 23:05:42 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 6/6] ARM: dts: qcom: sdx55-t55: Enable IPA
Date:   Fri, 26 Nov 2021 12:35:20 +0530
Message-Id: <20211126070520.28979-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211126070520.28979-1-manivannan.sadhasivam@linaro.org>
References: <20211126070520.28979-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable IP Accelerator (IPA) on Thundercomm T55 board for getting data
connectivity from modem.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55-t55.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom-sdx55-t55.dts
index 2ffcd085904d..7ed8feb99afb 100644
--- a/arch/arm/boot/dts/qcom-sdx55-t55.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-t55.dts
@@ -236,6 +236,12 @@ &blsp1_uart3 {
 	status = "ok";
 };
 
+&ipa {
+	status = "okay";
+
+	memory-region = <&ipa_fw_mem>;
+};
+
 &qpic_bam {
 	status = "ok";
 };
-- 
2.25.1

