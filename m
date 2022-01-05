Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 285D648587D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jan 2022 19:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243079AbiAESe2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 13:34:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbiAESe0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 13:34:26 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B812EC061212
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 10:34:25 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id t26so51066wrb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 10:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W8/SX4B6pGqMw5D9hjNeLzM7aFQMvNtbchzA9WgHZ3g=;
        b=JYkdxgfDavEn2IJ/YM8Q3lfDES0NrdxCExHLploLBfxnYWwtuUh8SR2J9Ns3MyAOCV
         XA53Zua7Ifz3lQXw06XmeBsYoNPPOtjHk043syVShRw5uZvjKtD1YvIOySXLZotWNJto
         0gkzrRK7N8lAMTeWEtjzOS1+MBrpvOGRp8vu84UkishUchCWxOsC4QW/zKrXu9JXUhvF
         ipaL4oAeQ51z19Gt38+zrBdPaMLoqU6ZliBwSqGkqcYkrOpJn4qQKmJKXGDFZT/tv3p8
         mLb1EnCmAEIcyCKm8jmDtNMTImGq5XdlnFrRPgGFR1b4m701fDl2Sgm2qZ9zgBuHcfr9
         fr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W8/SX4B6pGqMw5D9hjNeLzM7aFQMvNtbchzA9WgHZ3g=;
        b=td2NEBLtvqIaLBBi5tniGHoRP/ELg7JEsE+pyQWBao6a89MOW5dPLrw01KKOpKIl+U
         KItIOqQujA2dzjeOh85IloI2lnPAolzK3cD5SsGtj9+nm4gmuFG/XE6v00gzOlDv4+5u
         Quzc1YrQRMCQ8o3wnQ4/+4Uva2tSkqA0H1LlO+lmlPRlSEcktqAFwOeS7kAvxvZuJKPe
         37Akb6ROxsotVklBYCQXuygzk8nNZ+lMfsLUsSqMj2os1y1QUGfQJxwRsMJgeINAzYNx
         z5dcTTu3j4rcyL17CMKXLx/ZsrxpyAZKX0ORm50NatiR345bBVOAc27N93MZC791rPlw
         he5g==
X-Gm-Message-State: AOAM530mRiV49mz9M+H/Ft9vuW6rUbsmVnEj0uNE2E2l65cRMu0lVQW/
        2jO9ooGjQNZ1tI2njICnzq4GuqCyERvGAg==
X-Google-Smtp-Source: ABdhPJw9AveyAGyJLsI9/c1D+tYG8QKmHLy8rrrqHIrpJ6Ff8Ed5ewFy8XHvr8XWiChuxRFa3umuUw==
X-Received: by 2002:a05:6000:144a:: with SMTP id v10mr47100170wrx.357.1641407664405;
        Wed, 05 Jan 2022 10:34:24 -0800 (PST)
Received: from localhost.localdomain ([81.178.195.252])
        by smtp.gmail.com with ESMTPSA id o1sm3272215wmc.38.2022.01.05.10.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 10:34:24 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org
Subject: [PATCH v2 6/7] arm64: dts: qcom: sdm845-db845c: enable rradc
Date:   Wed,  5 Jan 2022 18:33:52 +0000
Message-Id: <20220105183353.2505744-7-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105183353.2505744-1-caleb.connolly@linaro.org>
References: <20220105183353.2505744-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the Round Robin ADC for the db845c.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 13f80a0b6faa..1c452b458121 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -595,6 +595,10 @@ resin {
 	};
 };
 
+&pmi8998_rradc {
+	status = "okay";
+};
+
 /* QUAT I2S Uses 4 I2S SD Lines for audio on LT9611 HDMI Bridge */
 &q6afedai {
 	qi2s@22 {
-- 
2.34.1

