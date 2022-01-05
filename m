Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F486485881
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jan 2022 19:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243134AbiAESei (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 13:34:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243072AbiAESe1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 13:34:27 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5317C034000
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 10:34:26 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id p1-20020a1c7401000000b00345c2d068bdso2436087wmc.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 10:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2VD8BhFQsi1gAqizHlVU3fMYSmPUmL03WAYruvW0snE=;
        b=jpVf08kdAsBCv9Fz1w8bfk9PWLBPKBl9jzBJsjlc/B4Uw7dDo0HJSxclDVckHXkeD3
         Ed89gG+Jy8B1f91gnAnK6RzuZLwz0ZhG81vZtGMNGWsSxWZUQ5u4S47VBWtdSdemKV+7
         RwswXCHkcHRQYKVEI4zbckjsWmLTHwE/KAenkOaaOe0r1lJjjyvYbTNZWONLAks9O8Lt
         4uGuc0gatO2kVE6unROXpwzYYmXIGOePVlp4CtzONKWd93tjEamYaKBTH2MmHPohAaA9
         qCQ5AWZJlIhH3Jm0eJFA5tWi54zYiHkUoBXtom4WrMPFzCYjWC0WFN+RnCe6ksonxx0t
         vJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2VD8BhFQsi1gAqizHlVU3fMYSmPUmL03WAYruvW0snE=;
        b=xUddqiG/eQj+81AuEkdyg90/x/bPXL0bQUwtrSiP9jiKWJ9kOVhG+Oegsz7IEY7Q/X
         UcVKZtIPWSSZa6jV5VZT3Q/dPOWGnUkladsNO19Pk7xaB+ceuQS1xMDb47bXg9v16eSH
         CqPm707wzQ/8Yz7tvkwj8jskYMvNrZPhyIn7uq4/RBdPQ64kZy9E0wjNh6UnkDGK5lSP
         VY38BNpIgEbNYbtxv+GAeCiLBnRomU5DX4f+z9yzLTXKBSacuWs5L+H+z6Q6/Th4z55b
         Wxnl+gN3w2vRNNRgh2T8zNgck3LI4OhgL26G9uWbMzuiqRBZcypTs5gSL63AhxYZCPEu
         AmPQ==
X-Gm-Message-State: AOAM532Wr8XGV9mo8GuAxvxKq1YjLjyl71HXhBJlqVb/YJeAi4hhhPUy
        7MvfBdUN6SbLudvUTmEqr8Kl9g==
X-Google-Smtp-Source: ABdhPJy+Q4ONifaTzqm79p0+0JVlKoXxb6uoAj5vX4aBkr8L4Bh2cHFh9pPBz3ji3n1eSLAiTW/vWA==
X-Received: by 2002:a05:600c:4013:: with SMTP id i19mr3986331wmm.93.1641407665309;
        Wed, 05 Jan 2022 10:34:25 -0800 (PST)
Received: from localhost.localdomain ([81.178.195.252])
        by smtp.gmail.com with ESMTPSA id o1sm3272215wmc.38.2022.01.05.10.34.24
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
Subject: [PATCH v2 7/7] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable RRADC
Date:   Wed,  5 Jan 2022 18:33:53 +0000
Message-Id: <20220105183353.2505744-8-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105183353.2505744-1-caleb.connolly@linaro.org>
References: <20220105183353.2505744-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the PMI8998 RRADC.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index 580d4cc1296f..481132b0cee4 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -312,6 +312,10 @@ resin {
 	};
 };
 
+&pmi8998_rradc {
+	status = "okay";
+};
+
 /* QUAT I2S Uses 1 I2S SD Line for audio on TAS2559/60 amplifiers */
 &q6afedai {
 	qi2s@22 {
-- 
2.34.1

