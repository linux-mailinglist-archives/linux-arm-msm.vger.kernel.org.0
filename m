Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7A44710E4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Dec 2021 03:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244431AbhLKC0Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Dec 2021 21:26:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244498AbhLKC0Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Dec 2021 21:26:16 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB1DC061714
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 18:22:40 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id y13so34856692edd.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Dec 2021 18:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jJ3RMYHdwGUxh/aEr+ifs4Pl+V1MqMDsq2HdZWAxLng=;
        b=bN38XkPTL+FU3bXvSMuOLA3W4BhXN6rY6Jj3MAS3AfANr9nvMKaXKKov3ciN68XyuU
         Zz9n30VETQOZTD4YXTETKE8n7KxeQbLy7HQZcuueag/I4BHJSwdWDkG9qKLWotCGLqLA
         oYYAGrWoCpqtG40Abti9I79BQPKvjstMRzwmWmP/g1IiOldMW9H59eJicLCq0RkY2mxf
         hQR9JrYGzqoMv1Hc4PZluBtkuv16TQmKE494IS4UjCDY7mfx1VStwnB+XwDL219TBTS4
         vGlU5NTYgUfHMtUxjiQEXsMp6fn8W3a5AYxRxyeJhVF2wBUZdgATE0QbFghJovOKlgjV
         DWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jJ3RMYHdwGUxh/aEr+ifs4Pl+V1MqMDsq2HdZWAxLng=;
        b=X5NSljnTOk+5WtGlmpehn0medDllNGPp4mKqP4KuxxlI2OzMeJsI/Hj3IXGLnx1Iqs
         U3lqWup8kbus/BWH1esQOkhXG5aPJSU407dlWrcETD1e36NxSSUqZrRCQB9sNmXYxtdA
         xS9UYPstQjwp0dM8B30abJxMoacziXWfex+Bt2Sm8YB5ITUellyFuD0GyiAq1ymn7ZFQ
         mXqQdjaHlhmnuhSPXhwjGN3OqTd3kWUtIFyrOYbD9qx14hzjL9ujnLlU+9A6cJlL8TXD
         sM2D5hLIsGmiPAWTpJ1EXccKnH3+ar8QjnvOszGEWlgLp2y24bR4QP5ZUJhKbkfYFw5U
         XAcA==
X-Gm-Message-State: AOAM531zUVKZgD32kd3/cKkS7yStUAjsWvOHQTIwuzXgQUdnv6YQnuWq
        I5FRSsnX666ZQXvsWHeeirIH8Q==
X-Google-Smtp-Source: ABdhPJwKjjQedNllTnJ8RBiATXd1S21Kz7g5g0//23VcKkuQ5EP8qNMfyDmgzyCA6RvTdKWYeB55LA==
X-Received: by 2002:a17:907:9690:: with SMTP id hd16mr28762456ejc.297.1639189359362;
        Fri, 10 Dec 2021 18:22:39 -0800 (PST)
Received: from lion.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id s2sm2449424ejn.96.2021.12.10.18.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 18:22:38 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
X-Google-Original-From: Caleb Connolly <caleb@connolly.tech>
To:     caleb.connolly@linaro.org, sumit.semwal@linaro.org,
        amit.pundir@linaro.org, john.stultz@linaro.org
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 5/7] arm64: dts: qcom: sdm845-oneplus: enable rradc
Date:   Sat, 11 Dec 2021 02:22:22 +0000
Message-Id: <20211211022224.3488860-6-caleb@connolly.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211211022224.3488860-1-caleb@connolly.tech>
References: <20211211022224.3488860-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Caleb Connolly <caleb.connolly@linaro.org>

Enable the RRADC for the OnePlus 6.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 3e04aeb479d1..9feda49b2f12 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -450,6 +450,10 @@ pinconf {
 	};
 };
 
+&pmi8998_rradc {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
-- 
2.34.1

