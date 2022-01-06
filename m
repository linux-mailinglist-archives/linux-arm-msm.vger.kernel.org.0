Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D93F44868A3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 18:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241849AbiAFRcO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 12:32:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241959AbiAFRb6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 12:31:58 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E28C06118C
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 09:31:57 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id k18so6171486wrg.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 09:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W8/SX4B6pGqMw5D9hjNeLzM7aFQMvNtbchzA9WgHZ3g=;
        b=gZEEmPS8SGAOQYH+sjnifr3Nfd+ubwj/AhpgTcBWcrdH1HqHgy+ewiVfoHCBOmPUvz
         Z7OGdyATPNWtqC4HdfehVruP+ujJ1kn9MQ05vAZ89GWuelTm/87B2zEw6ogAp/ZQROEg
         MbPpUGNl6aW3z3f91fOZJhe5pHAE1mgfp70u0hlLKXbCMW77IDn1FjshVSmHhoo+Q8GB
         KJBO6qDTeS/qRKCA2cU2gB5Ih0KTVA/72FZxQn6L5KRvlYThkqyadYo0gchYzvM+O+Rz
         W8xfrbJhBmRj62dtdW4cPkuXsipce+afJPUrOSSYQ3RbrvOrh1y1doJO1v8QPGDsDetR
         QfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W8/SX4B6pGqMw5D9hjNeLzM7aFQMvNtbchzA9WgHZ3g=;
        b=LOIqhrRCiSdgkr3RzWB0OVwlTIwx6EPQTEDpa1c3Xun+6EUtLcxMz9E2RocXXF6EC8
         YHGGOZ1XGqU034PA4vMW4KxJHObKTtMG3n4OaotqDcWOSuGJYGwGMs/kyQGSygZu81Lj
         R7010Pfg3qHNtVkCPprk4WMprJpZRv9wWIKQ3Z/7g3ftNbBcyIHajPNuH4z34XMaRNIj
         2OKPviSdetPROCjKGi4aNDhlQs3Py7kwNi6ftzzBGxOG0W+ZH4DhunsjO7AyLZV8di3i
         zFw5KFXJjxJYG+fyl93cuvNixw/yymddQDHlE2zvUM11Gte5Kt7qyiCfR0J/IvA8NIwm
         mR8w==
X-Gm-Message-State: AOAM533Ty9H1SowYqP4Bt5NuTk0697EZOPy66Kt25oUF3pHcdWn+kdA6
        nxuoSBy0wkrucxjtH83UENcMRQ==
X-Google-Smtp-Source: ABdhPJz8oLt7aOGYnbbUJf1Gzv8cuR4T8aezYAt90i1MF5S1G4nUy+WQpTR+IoF9URlEZYY2QtBTUw==
X-Received: by 2002:a5d:6685:: with SMTP id l5mr2944681wru.588.1641490316145;
        Thu, 06 Jan 2022 09:31:56 -0800 (PST)
Received: from localhost.localdomain ([81.178.195.252])
        by smtp.gmail.com with ESMTPSA id b16sm2575594wmq.41.2022.01.06.09.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 09:31:55 -0800 (PST)
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
Subject: [PATCH v3 6/7] arm64: dts: qcom: sdm845-db845c: enable rradc
Date:   Thu,  6 Jan 2022 17:31:30 +0000
Message-Id: <20220106173131.3279580-7-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220106173131.3279580-1-caleb.connolly@linaro.org>
References: <20220106173131.3279580-1-caleb.connolly@linaro.org>
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

