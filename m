Return-Path: <linux-arm-msm+bounces-32592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1CB98757B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 16:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 388351F21E93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 14:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2058915B57C;
	Thu, 26 Sep 2024 14:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkrdnxvV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4E515ADAB;
	Thu, 26 Sep 2024 14:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360556; cv=none; b=QBuehgsRHoO8FeuB4hOZ65F88rSvuF9GNt07ZcQbzYWNfeGlerXqAV7Qfr8y7WKClXglkwe4dqmS5RLvcEgmDl3UOEAzhDXRYjotVw76cLtRiECPSdNpLB+kG5UbinHeK6ECRHDnO/fG79e8cQHYPn28ilycLr/cxSItxTfWWRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360556; c=relaxed/simple;
	bh=y8oKXOplOXcw2ED9I11CdP0ecfiUGWbTr1J6Z6avwpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5fa2Oudtog9QH1uVLPYx9k2NF7R+wJzGNsuWyToQcJ0iYVLYbclubNOnfw6RM+zt8YMD5jsnJNn/zjAqPx2A4fqrGV+Dg1H+Z+rIEAt3aPcI+IXSNdDCIC+XQDzxCcWHwdV93MN9lH57wvNxcG/h3oHJMXyodcyGdMBMosQAco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkrdnxvV; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5365d3f9d34so1311377e87.3;
        Thu, 26 Sep 2024 07:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727360552; x=1727965352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WeDHrMYfGI+t+jChe0ejVP50XEXF6uESTKCRfajUFgc=;
        b=IkrdnxvVCBuxI3shZnxbnVjc2poL2Ez/6Byy/hm9LHUxJNk0jD1mQdZlw+FLvV/mSQ
         Z5jmjJLQiL1Cer6UgPlD1M5rwuDfIJxr89PCFjBpECiNfJQ3jYnXEaSd0l+zMl9pMBDh
         Yh2ZoPV81kT2J/e2yFO0J6nsYvTZSCHywEE5EV2akzfae7yMz3IC9BeqGsdXjY482D7N
         N3ZRDOa39PClHBa7nuU66Bd6YvoZRlXAE/jmeDbebPEA9JoI1kvBfTg4tRj5EbQpwaGA
         aoF5PQ1nOr0oY8qdfumljqbPqt1+f717Y8rcC9oEiE+WXIdcxkMghFXarPao+GRoMnQ9
         3EEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727360552; x=1727965352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WeDHrMYfGI+t+jChe0ejVP50XEXF6uESTKCRfajUFgc=;
        b=tk5TeneHURFf8nC+3/wFwlpK6JCA7G6qawDpABK7eSZm+A+tSx340qZMbFTwf+qU9R
         kpAQtncNO3G+p7VP7xv5V+0N8pkPqAP7StmAseKaWMwGkepinj+VzL2tu3HXzgxrjrlH
         tb/VXS0+7iJ8MbbIfkgqU0N2EwcuNjPsBDgEGimxECikG7zIOrRPZ+TDs9r/xEVPpUvI
         JhQNjkH8dMzYoIbEurPeUUAkWo7eT6D9YbPPcE7MwPPdhhADf2/jimEm/O2/XWtcj11D
         ZzbtZRxb/CwjryYtflQhGD3U0E5ExlnI3EqiAqyE2iDnUmq5BFByDQMBCt1M+/kRJ+IY
         YkjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfdC/6OGLaF7oJWQEkQ9d5GCAwJFeoaVkci0qWdhU3unr3N6OhtW3JkRMe1y93T3jjhRvxJsYvhYcR@vger.kernel.org, AJvYcCXii/JkZx1TCsXRtN0GUfv3YWZPjgkPtz4RX32uD6eIrVHIC/XDwq/dqBlcBV0U+WdXo++tWZWzaRAxmIAA@vger.kernel.org
X-Gm-Message-State: AOJu0YzNZ4ETi+8l2fptFJoSx8AxU+KmaVuw6t5I+V2Z5LFeoJ31+u/m
	wY3xA+fMEfELwcnJPVPaP+7Aez+EZqwfInPOd9sT2vvVE0fx8sDV
X-Google-Smtp-Source: AGHT+IEW4W+46XoivriXLVjE4+8JysyrF2fqRlflyhqbMLmBiszkZTv0NQlUAMwSOgjRTNxjbob4oQ==
X-Received: by 2002:a05:6512:2304:b0:535:82eb:21d1 with SMTP id 2adb3069b0e04-5387756626cmr4468717e87.57.1727360552245;
        Thu, 26 Sep 2024 07:22:32 -0700 (PDT)
Received: from [127.0.1.1] (mm-20-1-84-93.mgts.dynamic.pppoe.byfly.by. [93.84.1.20])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-537a864db1bsm815803e87.267.2024.09.26.07.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 07:22:31 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 26 Sep 2024 17:22:09 +0300
Subject: [PATCH v5 09/12] arm64: dts: qcom: starqltechn: add touchscreen
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-starqltechn_integration_upstream-v5-9-d2084672ff2f@gmail.com>
References: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
In-Reply-To: <20240926-starqltechn_integration_upstream-v5-0-d2084672ff2f@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727360533; l=1308;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=y8oKXOplOXcw2ED9I11CdP0ecfiUGWbTr1J6Z6avwpI=;
 b=GTD2R7OtHFjkiDNcMWZPCYCFDSH9rJnM8YWX7KQt/NE0M3iKw0gV5htIJ41DUmkL8Sp+hdhzG
 0RRNNKrBBaiAk0QO5YmawToYLY8138aw6NOrLGSfkRULaYOS5iTf6Sr
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for samsung,s6sy761 touchscreen.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 53b9a7d71f1d..00f67d1299b2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -561,6 +561,23 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&i2c11 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@48 {
+		compatible = "samsung,s6sy761";
+		reg = <0x48>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <120 IRQ_TYPE_LEVEL_HIGH>;
+		vdd-supply = <&s2dos05_ldo2>;
+		avdd-supply = <&s2dos05_ldo3>;
+
+		pinctrl-0 = <&touch_irq_state>;
+		pinctrl-names = "default";
+	};
+};
+
 &usb_1 {
 	status = "okay";
 };
@@ -665,4 +682,15 @@ i2c21_scl_state: i2c21-scl-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	touch_irq_state: touch-irq-state {
+		pins = "gpio120";
+		function = "gpio";
+		bias-disable;
+	};
+};
+
+&qup_i2c11_default {
+	drive-strength = <2>;
+	bias-disable;
 };

-- 
2.39.2


